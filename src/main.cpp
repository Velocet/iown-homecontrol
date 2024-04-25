#include <board-config.h>
#include <user_config.h>

#include <interact.h>
#include <crypto2Wutils.h>
#include <iohcCryptoHelpers.h>
#include <iohcRadio.h>

#include <iohcSystemTable.h>
#include <fileSystemHelpers.h>
#include <ArduinoJson.h>
#include <iohcRemote1W.h>
#include <iohcCozyDevice2W.h>
#include <iohcOtherDevice2W.h>

extern "C" {
	#include "freertos/FreeRTOS.h"
    #include "freertos/task.h"
}

#if defined(ESP8266)
//    #include <ESP8266WiFi.h>
//    #include "ESPAsyncTCP.h"
//    #include <ESP8266mDNS.h>
//    #include <ESP8266SSDP.h>
#elif defined(ESP32)
//    #include <WiFi.h>
//    #include "esp_wifi.h"
//   #include "mqtt_client.h"
//    #include <AsyncMqttClient.h>
//    #include <picoMQTT.h>
//    #include <AsyncTCP.h>           // ESPAsyncWebServer & OTA
//    #include <ESPmDNS.h>            // ESPAsyncWebServer & OTA
//    #include <ESP32SSDP.h>
#endif

//#include <ESPAsyncWebServer.h>
//#include <WiFiManager.h>          //https://github.com/tzapu/WiFiManager WiFi Configuration - Async branch

/*
// Transceivers Helpers defined inside de iohcRadio header
#if defined(RADIO_SX127X)
    #include <SX1276Helpers.h>
#elif defined(CC1101)
    #include <CC1101Helpers.h>
#endif
*/

//#include <WebServerHelpers.h>
//const char* http_username = HTTP_USERNAME;
//const char* http_password = HTTP_PASSWORD;
//WiFiManager wm;

//AsyncWebServer server(HTTP_LISTEN_PORT);
//AsyncWebSocket ws("/ws"); // access at ws://[esp ip]/ws
//AsyncEventSource events("/events"); // event source (Server-Sent events)

// Receiving buffer
bool verbosity = true;
bool pairMode = false;
bool scanMode = false;

void txUserBuffer(Tokens* cmd);
void testKey();
void scanDump();

uint8_t keyCap[16] = {};
//uint8_t source_originator[3] = {0};
//unsigned long relStamp; // In all Devvices

//#define MAXPACKETS  199
IOHC::iohcRadio* radioInstance;
IOHC::iohcPacket* radioPackets[IOHC_INBOUND_MAX_PACKETS];
//IOHC::iohcPacket *packets2send[IOHC_OUTBOUND_MAX_PACKETS];
//std::array<IOHC::iohcPacket *, 25> packets2send;
std::vector<IOHC::iohcPacket*> packets2send{};
std::vector<IOHC::iohcPacket*> packets2send_tmp{};

uint8_t nextPacket = 0;

IOHC::iohcSystemTable* sysTable;
IOHC::iohcRemote1W* remote1W;
IOHC::iohcCozyDevice2W* cozyDevice2W;
IOHC::iohcOtherDevice2W* otherDevice2W;
//IOHC::iohcObject *dev;

uint32_t frequencies[] = FREQS2SCAN;

bool publishMsg(IOHC::iohcPacket* iohc);
bool IRAM_ATTR msgRcvd(IOHC::iohcPacket* iohc);
bool msgArchive(IOHC::iohcPacket* iohc);

#if defined(ESP8266)
      Timers::TickerUs kbd_tick;
#elif defined(ESP32)
//      TickerUsESP32 kbd_tick;
#endif

void setup() {
    //    Timers::init_us();
    //    system_timer_reinit();
#if defined(ESP8266)
        INIT_US;
#endif

    Serial.begin(115200); //SERIALSPEED);

    pinMode(RX_LED, OUTPUT); // we are goning to blink this LED
    digitalWrite(RX_LED, 1);

    /*
        wm.autoConnect();

        // WiFi Manager setup
        // Reset settings - wipe credentials for testing
        //wm.resetSettings();
        wm.setConfigPortalBlocking(false);
        wm.setConfigPortalTimeout(120);
        // automatically connect using saved credentials if they exist
        // If connection fails it starts an access point with the specified name
        if(wm.autoConnect("AutoConnectAP")){
            LOG(printf_P, PSTR("Connected :)"));
            // Show the current IP Address
            LOG(printf_P, PSTR("IP got: %s\n"), WiFi.localIP().toString());
        }
        else {
            LOG(printf_P("Configportal running\n"));
        }
    */

    // Mount LittleFS filesystem
#if defined(ESP8266)
    LittleFSConfig lcfg;
    lcfg.setAutoFormat(false);
    LittleFS.setConfig(lcfg);
//    LittleFS.begin();
#elif defined(ESP32)
    LittleFS.begin();
#endif

    /*
        // Start MDNS
        if (! MDNS.begin("IO-Homecontrol_gateway"))
            Serial.println(F("Error setting up MDNS responder"));

        MDNS.addService("http", "tcp", HTTP_LISTEN_PORT);
        //testmDNS((char *)"http");
        // Start SSDP
        SSDP.setSchemaURL("description.xml");
        SSDP.setHTTPPort(HTTP_LISTEN_PORT);
        SSDP.setName("Velux remote gateway");
    #if defined(ESP8266)
        SSDP.setSerialNumber(ESP.getChipId());
    #elif defined(ESP32)
        uint64_t macAddress = ESP.getEfuseMac();
        uint64_t macAddressTrunc = macAddress << 40;
        SSDP.setSerialNumber(macAddressTrunc >> 40);
    #endif

        SSDP.setURL("/");
        SSDP.setDeviceType("upnp:rootdevice");
        SSDP.begin();
        //server.on("/description.xml", HTTP_GET, [](AsyncWebServerRequest *request) { SSDP.schema((Print&)std::ref(request->client())); });

        // Web Server
        // attach AsyncWebSocket
        ws.onEvent(onEvent);
        server.addHandler(&ws);

        // attach AsyncEventSource
        server.addHandler(&events);
    */

    /*
    To be completed

    // respond to GET requests on URL /heap
    server.on("/heap", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(200, "text/plain", String(ESP.getFreeHeap()));
    });

    // upload a file to /upload
    server.on("/upload", HTTP_POST, [](AsyncWebServerRequest *request){
    request->send(200);
    }, onUpload);

    // send a file when /index is requested
    server.on("/index", HTTP_ANY, [](AsyncWebServerRequest *request){
//    request->send(LittleFS, "/index.htm");
    });

    // HTTP basic authentication
    server.on("/login", HTTP_GET, [](AsyncWebServerRequest *request){
    if(!request->authenticate(http_username, http_password))
        return request->requestAuthentication();
    request->send(200, "text/plain", "Login Success!");
    });

    // Simple Firmware Update Form
    server.on("/update", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(200, "text/html", "<form method='POST' action='/update' enctype='multipart/form-data'><input type='file' name='update'><input type='submit' value='Update'></form>");
    });
    server.on("/update", HTTP_POST, [](AsyncWebServerRequest *request){
    shouldReboot = !Update.hasError();
    AsyncWebServerResponse *response = request->beginResponse(200, "text/plain", shouldReboot?"OK":"FAIL");
    response->addHeader("Connection", "close");
    request->send(response);
    },[](AsyncWebServerRequest *request, String filename, size_t index, uint8_t *data, size_t len, bool final){
    if(!index){
        Serial.printf("Update Start: %s\n", filename.c_str());
        Update.runAsync(true);
        if(!Update.begin((ESP.getFreeSketchSpace() - 0x1000) & 0xFFFFF000)){
        Update.printError(Serial);
        }
    }
    if(!Update.hasError()){
        if(Update.write(data, len) != len){
        Update.printError(Serial);
        }
    }
    if(final){
        if(Update.end(true)){
        Serial.printf("Update Success: %uB\n", index+len);
        } else {
        Update.printError(Serial);
        }
    }
    });

    */

    // attach filesystem root at URL /fs
    //    server.serveStatic("/fs", LittleFS, "/");

    // Catch-All Handlers
    // Any request that can not find a Handler that canHandle it
    // ends in the callbacks below.
    //    server.onNotFound(onRequest);
    //    server.onRequestBody(onBody);
    //    server.begin();
    radioInstance = IOHC::iohcRadio::getInstance();
    radioInstance->start(MAX_FREQS, frequencies, 0, msgRcvd, nullptr); //publishMsg); //msgArchive); //, msgRcvd);

    sysTable = IOHC::iohcSystemTable::getInstance();

    remote1W = IOHC::iohcRemote1W::getInstance();
    cozyDevice2W = IOHC::iohcCozyDevice2W::getInstance();
    otherDevice2W = IOHC::iohcOtherDevice2W::getInstance();

    //   AES_init_ctx(&ctx, transfert_key); // PreInit AES for cozy (1W use original version) TODO

    Cmd::init(); // Initialize Serial commands reception and handlers
    // Cozybox Kizbox Conexoon 2W
    Cmd::addHandler((char *)"powerOn", (char *)"Permit to retrieve paired devices", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::powerOn, nullptr);    });
    Cmd::addHandler((char *)"setTemp", (char *)"7.0 to 28.0 - 0 get actual temp", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::setTemp, cmd /*cmd->at(1).c_str()*/);    });
    Cmd::addHandler((char *)"setMode", (char *)"auto prog manual off - FF to get actual mode", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::setMode, cmd /*cmd->at(1).c_str()*/);    });
    Cmd::addHandler((char *)"setPresence", (char *)"on off", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::setPresence, cmd /*cmd->at(1).c_str()*/);    });
    Cmd::addHandler((char *)"setWindow", (char *)"open close", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::setWindow, cmd /*cmd->at(1).c_str()*/);    });
    Cmd::addHandler((char *)"midnight", (char *)"Synchro Paired", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::midnight, nullptr);    });
    Cmd::addHandler((char *)"associate", (char *)"Synchro Paired", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::associate, nullptr);    });
    Cmd::addHandler((char *)"custom", (char *)"test unknown commands", [](Tokens* cmd)-> void {/*scanMode = true;*/       cozyDevice2W->cmd(IOHC::DeviceButton::custom, cmd /*cmd->at(1).c_str()*/);    });
    Cmd::addHandler((char *)"custom60", (char *)"test 0x60 commands", [](Tokens* cmd)-> void {/*scanMode = true;*/ cozyDevice2W->cmd(IOHC::DeviceButton::custom60, cmd /*cmd->at(1).c_str()*/);    });
    // 1W
    Cmd::addHandler((char *)"pair", (char *)"1W put device in pair mode", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Pair);    });
    Cmd::addHandler((char *)"add", (char *)"1W add controller to device", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Add);    });
    Cmd::addHandler((char *)"remove", (char *)"1W remove controller from device", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Remove);    });
    Cmd::addHandler((char *)"open", (char *)"1W open device", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Open);    });
    Cmd::addHandler((char *)"close", (char *)"1W close device", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Close);    });
    Cmd::addHandler((char *)"stop", (char *)"1W stop device", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Stop);    });
    Cmd::addHandler((char *)"vent", (char *)"1W vent device", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Vent);    });
    Cmd::addHandler((char *)"force", (char *)"1W force device open", [](Tokens* cmd)-> void {    remote1W->cmd(IOHC::RemoteButton::ForceOpen);    });
    Cmd::addHandler((char *)"testKey", (char *)"Test keys generation", [](Tokens* cmd)-> void {    remote1W->cmd(IOHC::RemoteButton::testKey);    });

        Cmd::addHandler((char *)"mode1", (char *)"1W Mode1", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Mode1);    });
        Cmd::addHandler((char *)"mode2", (char *)"1W Mode2", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Mode2);    });
        Cmd::addHandler((char *)"mode3", (char *)"1W Mode3", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Mode3);    });
        Cmd::addHandler((char *)"mode4", (char *)"1W Mode4", [](Tokens* cmd)-> void {        remote1W->cmd(IOHC::RemoteButton::Mode4);    });
    // Other 2W
    Cmd::addHandler((char *)"discovery", (char *)"Send discovery on air", [](Tokens* cmd)-> void {    otherDevice2W->cmd(IOHC::Other2WButton::discovery, nullptr);    });
    Cmd::addHandler((char *)"getName", (char *)"Name Of A Device", [](Tokens* cmd)-> void {    otherDevice2W->cmd(IOHC::Other2WButton::getName, cmd);    });
    // Utils
    Cmd::addHandler((char *)"dump", (char *)"Dump Transceiver registers", [](Tokens* cmd)-> void {
        Radio::dump();
        Serial.printf("*%d packets in memory\t", nextPacket);
        Serial.printf("*%d devices discovered\n\n", sysTable->size());
    });
    //    Cmd::addHandler((char *)"dump2", (char *)"Dump Transceiver registers 1Col", [](Tokens*cmd)->void {Radio::dump2(); Serial.printf("*%d packets in memory\t", nextPacket); Serial.printf("*%d devices discovered\n\n", sysTable->size());});
    Cmd::addHandler((char *)"list1W", (char *)"List received packets", [](Tokens* cmd)-> void {
        for (uint8_t i = 0; i < nextPacket; i++) msgRcvd(radioPackets[i]);
        sysTable->dump1W();
    });
    Cmd::addHandler((char *)"save", (char *)"Saves Objects table", [](Tokens* cmd)-> void { sysTable->save(true); });
    Cmd::addHandler((char *)"erase", (char *)"Erase received packets", [](Tokens* cmd)-> void {
        for (uint8_t i = 0; i < nextPacket; i++) free(radioPackets[i]);
        nextPacket = 0;
    });
    Cmd::addHandler((char *)"send", (char *)"Send packet from cmd line", [](Tokens* cmd)-> void { txUserBuffer(cmd); });
    Cmd::addHandler((char *)"verbose", (char *)"Toggle verbose output on packets list", [](Tokens* cmd)-> void { verbosity = !verbosity; });
    Cmd::addHandler((char *)"ls", (char *)"List filesystem", [](Tokens* cmd)-> void { listFS(); });
    Cmd::addHandler((char *)"cat", (char *)"Print file content", [](Tokens* cmd)-> void { cat(cmd->at(1).c_str()); });
    Cmd::addHandler((char *)"rm", (char *)"Remove file", [](Tokens* cmd)-> void { rm(cmd->at(1).c_str()); });
    Cmd::addHandler((char *)"list2W", (char *)"List received packets", [](Tokens* cmd)-> void {
        for (uint8_t i = 0; i < nextPacket; i++) msgRcvd(radioPackets[i]);
        sysTable->dump2W();
    });
    // Unnecessary just for test
    Cmd::addHandler((char *)"discover28", (char *)"discover28", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::discover28, nullptr);    });
    Cmd::addHandler((char *)"discover2A", (char *)"discover2A", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::discover2A, nullptr);    });
    Cmd::addHandler((char *)"fake0", (char *)"fake0", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::fake0, nullptr);    });
    Cmd::addHandler((char *)"ack", (char *)"ack33", [](Tokens* cmd)-> void {        cozyDevice2W->cmd(IOHC::DeviceButton::ack, nullptr);    });
    Cmd::addHandler((char *)"pairMode", (char *)"pairMode", [](Tokens* cmd)-> void { pairMode = !pairMode; });

    Cmd::addHandler((char *)"scanMode", (char *)"scanMode", [](Tokens* cmd)-> void {scanMode = true; cozyDevice2W->cmd(IOHC::DeviceButton::checkCmd, nullptr);});
    Cmd::addHandler((char *)"scanDump", (char *)"Dump Scan Results", [](Tokens* cmd)-> void {scanMode = false;  cozyDevice2W->scanDump(); });

    esp_timer_dump(stdout);

    printf("Startup completed. type help to see what you can do!\n");
    digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
    //Serial.println("SPI Speed:" + String(SPI.))
}

bool IRAM_ATTR msgRcvd(IOHC::iohcPacket* iohc) {
    // iohc->decode(verbosity);

    DynamicJsonDocument doc(1280);
    doc["type"] = "Unk";
    switch (iohc->payload.packet.header.cmd) {
        case IOHC::iohcDevice::RECEIVED_DISCOVER_0x28: {
            printf("Pairing Asked\n");
            if (!pairMode) break;

            packets2send.clear();
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
            std::vector<uint8_t> toSend = {0xff, 0xc0, 0xba, 0x11, 0xad, 0x0b, 0xcc, 0x00, 0x00}; // 0x0b OverKiz 0x0c Atlantic

            //Easy way to copy array to struct
            //_p0x2b _p_0x29;
            //std::copy(toSend.begin(), toSend.begin() + sizeof(_p_0x29), reinterpret_cast<uint8_t*>(&_p_0x29));

            packets2send.push_back(new IOHC::iohcPacket);
            packets2send.back()->payload.packet.header.CtrlByte1.asByte = 8;
            // Header len if protocol version is 8 else 10 ;)
            packets2send.back()->payload.packet.header.CtrlByte2.asByte = 0;
            packets2send.back()->payload.packet.header.CtrlByte1.asByte += toSend.size();
            packets2send.back()->payload.packet.header.cmd = IOHC::iohcDevice::SEND_DISCOVER_ANSWER_0x29;
            /* Swap */
            memcpy(packets2send.back()->payload.packet.header.source, cozyDevice2W->gateway, 3);
            memcpy(packets2send.back()->payload.packet.header.target, iohc->payload.packet.header.source, 3);

            memcpy(packets2send.back()->payload.buffer + 9, toSend.data(), toSend.size());

            // packets2send[i]->payload.packet.header.CtrlByte1.asStruct.StartFrame = 1;
            // packets2send[i]->payload.packet.header.CtrlByte1.asStruct.EndFrame = 1;

            packets2send.back()->buffer_length = toSend.size() + 9; //packet2send[0]->payload.packet.header.framelength +1;
            packets2send.back()->frequency = CHANNEL2;
            packets2send.back()->repeatTime = 25;
            packets2send.back()->delayed = 250;
            IOHC::packetStamp = esp_timer_get_time(); //
            packets2send.back()->repeat = 0; // Need to stop txMode
            packets2send.back()->lock = false; //true; // Need to received ASAP

            radioInstance->send(packets2send);
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
        break;
        }
        case IOHC::iohcDevice::RECEIVED_DISCOVER_ACTUATOR_0x2C: {
            printf("Actuator Ack Asked\n");
            if (!pairMode) break;
            
            packets2send.clear();
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
            std::vector<uint8_t> toSend = {};

            packets2send.push_back(new IOHC::iohcPacket);
            packets2send.back()->payload.packet.header.CtrlByte1.asByte = 8;
            // Header len if protocol version is 8 else 10 ;)
            packets2send.back()->payload.packet.header.CtrlByte2.asByte = 0;
            packets2send.back()->payload.packet.header.CtrlByte1.asByte += toSend.size();
            packets2send.back()->payload.packet.header.cmd = IOHC::iohcDevice::SEND_DISCOVER_ACTUATOR_ACK_0x2D;
            /* Swap */
            memcpy(packets2send.back()->payload.packet.header.source, iohc->payload.packet.header.target, 3);
            memcpy(packets2send.back()->payload.packet.header.target, iohc->payload.packet.header.source, 3);

            memcpy(packets2send.back()->payload.buffer + 9, toSend.data(), toSend.size());

            // packets2send[0]->payload.packet.header.CtrlByte1.asStruct.StartFrame = 0;
            // packets2send[0]->payload.packet.header.CtrlByte1.asStruct.EndFrame = 0;

            packets2send.back()->buffer_length = toSend.size() + 9; 
            packets2send.back()->frequency = CHANNEL2;
            packets2send.back()->repeatTime = 25;
            packets2send.back()->delayed = 250;
            IOHC::packetStamp = esp_timer_get_time(); //
            packets2send.back()->repeat = 0; // Need to stop txMode
            packets2send.back()->lock = false; //true; // Need to received ASAP

            radioInstance->send(packets2send);
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
        break;
        }
        case IOHC::iohcDevice::SEND_LAUNCH_KEY_TRANSFERT_0x38: {
            printf("Key Transfert Asked after Command %2.2X\n", iohc->payload.packet.header.cmd);
            if (!pairMode) break;
            
            packets2send.clear();
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
            std::vector<uint8_t> key_transfert;
            key_transfert.assign(iohc->payload.buffer + 9, iohc->payload.buffer + 15);

            for (unsigned char i: key_transfert) {
                printf("%02X ", i);
            }
            printf("\n");
            std::vector<uint8_t> data = {IOHC::iohcDevice::SEND_ASK_CHALLENGE_0x31}; //0x38
            unsigned char initial_value[16];
            constructInitialValue(data, initial_value, data.size(), key_transfert, nullptr);
            Serial.printf("2) Initial value used for key encryption: ");
            for (unsigned char i: initial_value) {
                printf("%02X ", i);
            }
            printf("\n");

            AES_init_ctx(&ctx, transfert_key);
            uint8_t encrypted_key[16];
            AES_ECB_encrypt(&ctx, initial_value);
            // Appliquer le XOR avec la clé du système
            for (int i = 0; i < 16; i++) {
                encrypted_key[i] = initial_value[i] ^ transfert_key[i];
            }
            printf("2) Encrypted 2-way key to be sent with 0x32: ");
            for (unsigned char i: encrypted_key) {
                printf("%02X ", i);
            }
            printf("\n");
            std::vector<uint8_t> toSend;
            toSend.assign(encrypted_key, encrypted_key + 16);

            packets2send.push_back(new IOHC::iohcPacket);
            packets2send.back()->payload.packet.header.CtrlByte1.asByte = 8;
            // Header len if protocol version is 8 else 10 ;)
            packets2send.back()->payload.packet.header.CtrlByte2.asByte = 0;
            packets2send.back()->payload.packet.header.CtrlByte1.asByte += toSend.size();
            packets2send.back()->payload.packet.header.cmd = IOHC::iohcDevice::SEND_KEY_TRANSFERT_0x32;
            cozyDevice2W->memorizeSend.memorizedCmd = IOHC::iohcDevice::SEND_KEY_TRANSFERT_0x32;

            /* Swap */
            memcpy(packets2send.back()->payload.packet.header.source, iohc->payload.packet.header.target, 3);
            memcpy(packets2send.back()->payload.packet.header.target, iohc->payload.packet.header.source, 3);

            memcpy(packets2send.back()->payload.buffer + 9, toSend.data(), toSend.size());

            // packets2send[0]->payload.packet.header.CtrlByte1.asStruct.StartFrame = 0;
            // packets2send[0]->payload.packet.header.CtrlByte1.asStruct.EndFrame = 0;

            packets2send.back()->buffer_length = toSend.size() + 9; 
            packets2send.back()->frequency = CHANNEL2;
            packets2send.back()->repeatTime = 25;
            IOHC::packetStamp = esp_timer_get_time(); //
            packets2send.back()->repeat = 0; // Need to stop txMode
            packets2send.back()->lock = false; //true; // Need to received ASAP

            radioInstance->send(packets2send);
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
        break;
        }
        case 0x20:
            cozyDevice2W->memorizeSend.memorizedCmd = iohc->payload.packet.header.cmd;
            IOHC::lastSendCmd = iohc->payload.packet.header.cmd;
            break;
        case 0x21: {
            // Answer of 0x20, publish the confirmed command
            // doc["type"] = "Cozy";
            // doc["from"] = bytesToHexString(iohc->payload.packet.header.target, 3);
            // doc["to"] = bytesToHexString(iohc->payload.packet.header.source, 3);
            // doc["cmd"] = to_hex_str(iohc->payload.packet.header.cmd).c_str();
            // doc["_data"] = bytesToHexString(iohc->payload.buffer + 9, iohc->buffer_length - 9);
            // std::string message;
            // size_t messageSize = serializeJson(doc, message);
            // mqttClient.publish("iown/Frame", 0, false, message.c_str(), messageSize);
            break;
        }
        case 0x3C: {
            // Answer only to our gateway, not to others devices
            if (cozyDevice2W->isFake(iohc->payload.packet.header.source, iohc->payload.packet.header.target)) { // (true) { //
                packets2send_tmp.clear();
               
                digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);

                doc["type"] = "Gateway";
                if (!cozyDevice2W->isFake(iohc->payload.packet.header.source, iohc->payload.packet.header.target)) {
                    //                        AES_init_ctx(&ctx, setgo); // PreInit AES for other2W (1W use original version) TODO
                }
                //                    else
                AES_init_ctx(&ctx, transfert_key);

                // IVdata is the challenge with commandId put on start
                std::vector<uint8_t> challengeAsked;
                //                    challengeAsked.assign(iohc->payload.packet.msg.variableData.data, iohc->payload.packet.msg.variableData.data + iohc->payload.packet.msg.variableData.size);
                challengeAsked.assign(iohc->payload.buffer + 9, iohc->payload.buffer + 15);
                printf("Challenge asked after LastSend Command %2.2X\n", IOHC::lastSendCmd);
                printf("Challenge asked after Memorized Command %2.2X\n", cozyDevice2W->memorizeSend.memorizedCmd);
               
if(scanMode) {cozyDevice2W->mapValid[IOHC::lastSendCmd] = 0x3C; break;}

                std::vector<uint8_t> IVdata = cozyDevice2W->memorizeSend.memorizedData;
                IVdata.insert(IVdata.begin(), cozyDevice2W->memorizeSend.memorizedCmd);
                
                packets2send_tmp.push_back(new IOHC::iohcPacket);
 
                packets2send_tmp.back()->payload.packet.header.cmd = IOHC::iohcDevice::SEND_CHALLENGE_ANSWER_0x3D;

                unsigned char initial_value[16];
                constructInitialValue(IVdata, initial_value, IVdata.size(), challengeAsked, nullptr);
                AES_ECB_encrypt(&ctx, initial_value);
                uint8_t dataLen = 6;

                if (cozyDevice2W->memorizeSend.memorizedCmd == IOHC::iohcDevice::RECEIVED_ASK_CHALLENGE_0x31) {
                    packets2send_tmp.back()->payload.packet.header.cmd = IOHC::iohcDevice::SEND_KEY_TRANSFERT_0x32;
                    dataLen = 16;
                    IVdata = {0x31};
                    constructInitialValue(IVdata, initial_value, 1, challengeAsked, nullptr);
                    AES_ECB_encrypt(&ctx, initial_value);
                    for (int i = 0; i < dataLen; i++)
                        initial_value[i] = initial_value[i] ^ transfert_key[i];
                    cozyDevice2W->memorizeSend.memorizedCmd = IOHC::iohcDevice::SEND_KEY_TRANSFERT_0x32;
                    cozyDevice2W->memorizeSend.memorizedData.assign(initial_value, initial_value + 16);
                }

                packets2send_tmp.back()->payload.packet.header.CtrlByte1.asByte = 8;
                // Header len if protocol version is 8 else 10 ;)
                packets2send_tmp.back()->payload.packet.header.CtrlByte2.asByte = 0;
                packets2send_tmp.back()->payload.packet.header.CtrlByte1.asByte += dataLen;
                /* Swap */
                memcpy(packets2send_tmp.back()->payload.packet.header.source, iohc->payload.packet.header.target, 3);
                memcpy(packets2send_tmp.back()->payload.packet.header.target, iohc->payload.packet.header.source, 3);

                memcpy(packets2send_tmp.back()->payload.buffer + 9, initial_value, dataLen);

                packets2send_tmp.back()->buffer_length = dataLen/*challengeAsked.size()*/ + 9;
                
                packets2send_tmp.back()->frequency = CHANNEL2;
                packets2send_tmp.back()->repeatTime = 6;
                IOHC::packetStamp = esp_timer_get_time(); //
                packets2send_tmp.back()->repeat = 1; // Need to stop txMode
                packets2send_tmp.back()->lock = false; //true; // Need to received ASAP
                
                radioInstance->send(packets2send_tmp);

                // Serial.print("IV used for key encryption: ");
                // for (int i = 0; i < 16; i++)
                //     Serial.printf("%02X ", initial_value[i]);
                // Serial.println();
                printf("Key to be sent with %2.2X: ", packets2send_tmp[0]->payload.packet.header.cmd);
                for (int i = 0; i < dataLen; i++)
                    printf("%02X ", initial_value[i]);
                printf("\n");

                //                sysTable->addObject(iohc);
                digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
            }
        break;
        }
        case 0X00:
        case 0x01:
        case 0x03:
        case 0x19: {
            //                memorizeSend.memorizedData = toSend;
            doc["type"] = "Other";
            otherDevice2W->memorizeOther2W.memorizedCmd = iohc->payload.packet.header.cmd;
            cozyDevice2W->memorizeSend.memorizedCmd = iohc->payload.packet.header.cmd;
            break;
        }
        case 0x51: {
            std::vector<uint8_t> nameReceived;
            nameReceived.assign(iohc->payload.buffer + 9, iohc->payload.buffer + 25);
//            std::string asciiName;

for (char byte : nameReceived) {
//    asciiName += std::toupper(byte);
    printf("%c", std::toupper(byte));
}
//            printf("%s\n", asciiName.c_str());
            printf("\n");
            break;
        }
        case 0x04:
        case 0x0D:
        case 0x2D:
        case 0x4B:
        case 0x55:
        case 0x57:
        case 0x59:            
            if (scanMode) { 
                otherDevice2W->memorizeOther2W = {};
                    // printf(" Answer %X Cmd %X ", iohc->payload.packet.header.cmd, IOHC::lastSendCmd);
                    cozyDevice2W->mapValid[IOHC::lastSendCmd] = iohc->payload.packet.header.cmd; 
            }
            break;
        case 0xFE: {
            if (scanMode) { 
                otherDevice2W->memorizeOther2W = {};
                    // printf(" Unknown %X Cmd %X ", iohc->payload.buffer[9], IOHC::lastSendCmd);
                    cozyDevice2W->mapValid[IOHC::lastSendCmd] = iohc->payload.buffer[9]; 
            }
            break;
        }
         case 0x29: {
            printf("A Device want to be paired\n");
            if (!pairMode) break;

            std::vector<uint8_t> deviceAsked;
            deviceAsked.assign(iohc->payload.buffer + 9, iohc->payload.buffer + 18);
            for (unsigned char i: deviceAsked) {
                printf("%02X ", i);
            }
            printf("\n");

            // printf("Sending 0x38 \n");
            printf("Sending 0x2C \n");
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
            // std::vector<uint8_t> toSend = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06}; // 38
            std::vector<uint8_t> toSend = {}; // 2C

            packets2send.clear();
            packets2send.push_back(new IOHC::iohcPacket);

            // init(packets2send[0]);
            // packets2send.back()->payload.packet.header.cmd = 0x38;
            packets2send.back()->payload.packet.header.cmd = 0x2C;
            // cozyDevice2W->memorizeSend.memorizedData = toSend;
            // cozyDevice2W->memorizeSend.memorizedCmd = 0x2C;

            packets2send.back()->payload.packet.header.CtrlByte1.asStruct.StartFrame = 1;
            packets2send.back()->payload.packet.header.CtrlByte1.asStruct.EndFrame = 0;
            packets2send.back()->payload.packet.header.CtrlByte1.asByte += toSend.size();

            /* Swap */
            memcpy(packets2send.back()->payload.packet.header.source, iohc->payload.packet.header.target, 3);
            memcpy(packets2send.back()->payload.packet.header.target, iohc->payload.packet.header.source, 3);

            memcpy(packets2send.back()->payload.buffer + 9, toSend.data(), toSend.size());

            packets2send.back()->buffer_length = toSend.size() + 9;
            packets2send.back()->frequency = CHANNEL2;
            packets2send.back()->repeatTime = 25;
            IOHC::packetStamp = esp_timer_get_time(); //
            packets2send.back()->repeat = 1; // Need to stop txMode
            packets2send.back()->lock = false; //true; // Need to received ASAP

            radioInstance->send(packets2send);
            digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
        break;
        }

        case 0x2B: {
            sysTable->addObject(iohc->payload.packet.header.source, iohc->payload.packet.msg.p0x2b.backbone,
                                iohc->payload.packet.msg.p0x2b.actuator, iohc->payload.packet.msg.p0x2b.manufacturer,
                                iohc->payload.packet.msg.p0x2b.info);
            break;
        }
 
        case 0x30: {
            for (uint8_t idx = 0; idx < 16; idx++)
                keyCap[idx] = iohc->payload.packet.msg.p0x30.enc_key[idx];

            iohcCrypto::encrypt_1W_key((const uint8_t *)iohc->payload.packet.header.source, (uint8_t *)keyCap);
            printf("CLEAR KEY: ");
            for (unsigned char idx: keyCap)
                printf("%2.2X", idx);
            printf("\n");
            break;
        }
        case 0X2E:
            printf("1W Learning mode\n");
            break;
            
        case 0x39: {
            if (keyCap[0] == 0) break;
            uint8_t hmac[16];
            std::vector<uint8_t> frame(&iohc->payload.packet.header.cmd, &iohc->payload.packet.header.cmd + 2); // frame = {0x39, 0x00}; // 
            iohcCrypto::create_1W_hmac(hmac, iohc->payload.packet.msg.p0x39.sequence, keyCap, frame);
            printf("MAC: ");
            for (uint8_t idx = 0; idx < 6; idx++)
                printf("%2.2X", hmac[idx]);
            printf("\n");
        break;
        }
        case 0x48:
        case 0x49:
        case 0x4A:
        case 0X3D:
        case 0X05: break;
        default:
            printf("Received Unknown command %02X ", iohc->payload.packet.header.cmd);
            return false;
            break;
    }

    return true;
}


/*TODO Merge with decode here (radio.cpp line 168)*/
bool publishMsg(IOHC::iohcPacket* iohc) {
    //                if(iohc->payload.packet.header.cmd == 0x20 || iohc->payload.packet.header.cmd == 0x00) {
    DynamicJsonDocument doc(512);
    doc["type"] = "Cozy";
    doc["from"] = bytesToHexString(iohc->payload.packet.header.target, 3);
    doc["to"] = bytesToHexString(iohc->payload.packet.header.source, 3);
    doc["cmd"] = to_hex_str(iohc->payload.packet.header.cmd).c_str();
    doc["_data"] = bytesToHexString(iohc->payload.buffer + 9, iohc->buffer_length - 9);
    std::string message;
    size_t messageSize = serializeJson(doc, message);
    #if defined(MQTT)
        mqttClient.publish("iown/Frame", 1, false, message.c_str(), messageSize);
    #endif
    // }
    return false;
}

bool msgArchive(IOHC::iohcPacket* iohc) {
    radioPackets[nextPacket] = new IOHC::iohcPacket; //(IOHC::iohcPacket *)malloc(sizeof(IOHC::iohcPacket));
    if (!radioPackets[nextPacket]) {
        Serial.printf("*** Malloc failed!\n");
        return false;
    }

    radioPackets[nextPacket]->buffer_length = iohc->buffer_length;
    radioPackets[nextPacket]->frequency = iohc->frequency;
    //    radioPackets[nextPacket]->stamp = iohc->stamp;
    radioPackets[nextPacket]->rssi = iohc->rssi;

    for (uint8_t i = 0; i < iohc->buffer_length; i++)
        radioPackets[nextPacket]->payload.buffer[i] = iohc->payload.buffer[i];

    nextPacket += 1;
    Serial.printf("-> %d\r", nextPacket);
    if (nextPacket >= IOHC_INBOUND_MAX_PACKETS) {
        nextPacket = IOHC_INBOUND_MAX_PACKETS - 1;
        Serial.printf("*** Not enough buffers available. Please erase current ones\n");
        return false;
    }

    return true;
}

void txUserBuffer(Tokens* cmd) {
    if (cmd->size() < 2) {
        Serial.printf("No packet to be sent!\n");
        return;
    }
    digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);
    if (!packets2send[0])
        packets2send[0] = new IOHC::iohcPacket;

    if (cmd->size() == 3)
        packets2send[0]->frequency = frequencies[atoi(cmd->at(2).c_str()) - 1];
    else
        packets2send[0]->frequency = 0;

    packets2send[0]->buffer_length = hexStringToBytes(cmd->at(1), packets2send[0]->payload.buffer);
    packets2send[0]->repeatTime = 35;
    packets2send[0]->repeat = 1;
    packets2send[1] = nullptr;

    radioInstance->send(packets2send);
    digitalWrite(RX_LED, digitalRead(RX_LED) ^ 1);

    // Do not deallocate buffers as send is asynchronous
    //        free(packets2send[0]);
    //        packets2send[0] = nullptr;
}
void loop() {
    //    wm.process();
#if defined(ESP8266)
        MDNS.update();
#endif

    //    return;
    /*

        if(shouldReboot){
        Serial.println("Rebooting...");
        delay(100);
        ESP.restart();
        }
        static char temp[128];
        sprintf(temp, "Seconds since boot: %lu", millis()/1000);
        events.send(temp, "time"); //send event "time"
    */
}
