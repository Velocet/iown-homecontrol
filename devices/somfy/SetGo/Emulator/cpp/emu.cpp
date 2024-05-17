#include <Windows.h>
#include <stdio.h>
#include <array>
#include <functional>
#include <iomanip>
#include <ios>
#include <iostream>
#include <vector>
#include "hook.h"

class QBasicAtomicInt {
  public:
  volatile long _q_value;
};

struct QByteArray {
  struct Data {
    QBasicAtomicInt ref = {1};
    int alloc;
    int size;
    std::uint8_t* data;
    std::uint8_t array[1];
  };

  struct QByteArray::Data* d;

  QByteArray(int size){
    d = new QByteArray::Data();
    d->alloc = size;
    d->size = size;
    d->data = new std::uint8_t[size];
  }
};

struct Rijndael {
  void* vtable;
  std::uint8_t data0[4];
  std::uint8_t round_number;
  std::uint8_t state[16];
  std::uint8_t ciphertext[16];

  // correct
  void encrypt_block(){
    round_number = 0;
    add_round_key();
    for (int i = 0; i < 9; ++i) {
      sub_bytes_and_shift_columns();
      mix_columns();
      next_round_key();
      add_round_key();
    }
    sub_bytes_and_shift_columns();
    next_round_key();
    add_round_key();
  }
  void sub_bytes_and_shift_columns(){
    __asm {
      mov eax, 0x0055C710
      call eax }
  }
  void next_round_key(){
    __asm {
      mov eax, 0x0055C800
      call eax }
  }
  void mix_columns(){
    __asm {
      mov eax, 0x0055C8C0
      call eax }
  }
  void add_round_key(){
    __asm {
      mov eax, 0x0055CB20
      call eax }
  }
  void add_block(QByteArray* result, QByteArray* plain_block){
    __asm {
      push plain_block
      push this
      mov ecx, result
      mov eax, 0x0055CBF0
      call eax
    }
  }
};

struct struct_a1 {
  std::uint8_t gap0[8] = {};
  std::uint32_t dword8 = 0;
  std::uint8_t gapC[4] = {};
  std::uint32_t* dword10 = new std::uint32_t[3]{};
  std::uint8_t gap14[12] = {};
  QByteArray byte_array_0020;

  struct_a1(int size):byte_array_0020(size){dword10[2] = dword8==1 ? size-7 : size-9;}
};

__declspec(naked) void __fastcall sub_554AA0(struct_a1* a1){
  __asm {
    mov eax, 0x00554AA0
    jmp eax
  }
}

void print_debug(const char* format, ...){
  va_list args;
  va_start(args, format);
  char buffer[4096];
  vsprintf_s(buffer, format, args);
  OutputDebugString(buffer);
  va_end(args);
}
void print_buffer(const std::string& prefix, const std::uint8_t* data, std::size_t size, std::size_t offset){
  print_debug("%s ", prefix.c_str());
  for (std::size_t i = 0; i < size; ++i) {
    print_debug("%02X ", data[i]);
    if (i % 16 + 16 - offset == 15) {
      print_debug("| ");}
  }
  print_debug("\n");
}

class Crc8408{
  public:
  void process(std::uint8_t data){
    //__asm {
    //	push data
    //mov eax, 0x0055C5D0
    //call eax
    //}

    value ^= data;
    for (int i = 0; i < 8; ++i) {
      if (value & 1) {
        value = (value >> 1) ^ 0x8408;
      } else {
        value = value >> 1;
      }
    }
  }

  void process(QByteArray* data){
    //__asm {
    //	push data
    //mov eax, 0x0055C570
    //call eax
    //}
    for (int i = 0; i < data->d->size; ++i) {
      process(data->d->data[i]);
    }
  }

  std::uint16_t get_value() const { return value; }

  private:
  std::uint16_t value = 0;
};

void perform_test1(){
  Rijndael rd;
  auto key = {0x9A, 0x00, 0x72, 0x1E, 0x3E, 0xE2, 0x9A, 0x7B, 0xF1, 0xB4, 0xA6, 0x08, 0x6C, 0x14, 0x52, 0xEB};
  std::copy(std::begin(key), std::end(key), rd.state);
  for (int i = 0; i < 16; ++i) {
    rd.ciphertext[i] = i;
  }
  print_buffer("state     ", rd.state, 16, 0);
  print_buffer("cyphertext", rd.ciphertext, 16, 0);
  rd.encrypt_block();
  print_buffer("state     ", rd.state, 16, 0);
  print_buffer("cyphertext", rd.ciphertext, 16, 0);
  exit(1);
}
void perform_test2(){
  Rijndael rd;
  QByteArray result(16);
  QByteArray plain_block(16);
  for (int i = 0; i < 16; ++i) {
    rd.ciphertext[i] = i;
    plain_block.d->data[i] = 2 * i;
  }
  print_buffer("result     ", result.d->data, 16, 0);
  print_buffer("plain_block", plain_block.d->data, 16, 0);
  print_buffer("state      ", rd.state, 16, 0);
  print_buffer("cyphertext ", rd.ciphertext, 16, 0);
  rd.add_block(&result, &plain_block);
  print_buffer("result     ", result.d->data, 16, 0);
  print_buffer("plain_block", plain_block.d->data, 16, 0);
  print_buffer("state      ", rd.state, 16, 0);
  print_buffer("cyphertext ", rd.ciphertext, 16, 0);
  exit(1);
}
void perform_test3(){
  struct_a1 a1(5 + 16);
  for (int i = 0; i < a1.byte_array_0020.d->size; ++i) {
    a1.byte_array_0020.d->data[i] = i;
  }
  print_buffer("input ", a1.byte_array_0020.d->data, a1.byte_array_0020.d->size, 5);
  sub_554AA0(&a1);
  print_buffer("output", a1.byte_array_0020.d->data, a1.byte_array_0020.d->size, 5);
  OutputDebugString("\n");
  exit(1);
}
void perform_test4(){
  std::vector<std::uint8_t> data_array = {0x00, 0x09, 0x01, 0x00, 0x00, 0x11, 0x06 /*, 0x48, 0xc7*/};
  //std::vector<std::uint8_t> data_array = {0xff, 0xff};
  QByteArray data(data_array.size());
  std::copy(std::begin(data_array), std::end(data_array), data.d->data);
  Crc8408 crc8408;
  crc8408.process(&data);
  auto crc = crc8408.get_value();
  print_debug("original CRC: %04X\n", crc);
  //crc8408.process(reinterpret_cast<std::uint8_t(&)[2]>(crc)[0]);
  //crc8408.process(reinterpret_cast<std::uint8_t(&)[2]>(crc)[1]);
  //print_debug("adjusted CRC: %04X\n", crc8408.get_value());
  exit(1);
}

class QString{
  public:
  QString(){d = shared_null;}

  QString(const QString& that){
    d = that.d;
    _InterlockedIncrement(&d->ref._q_value);
  }

  QString(QString&& that) {
    d = std::exchange(that.d, shared_null);
  }

  QString& operator=(const QString& that){
    d = that.d;
    _InterlockedIncrement(&d->ref._q_value);
    return *this;
  }

  QString& operator=(QString&& that){
    d = std::exchange(that.d, shared_null);
    return *this;
  }

  ~QString(){
    _InterlockedDecrement(&d->ref._q_value);
    // todo: free
  }

  static QString fromAscii(char const* data, int size = -1);

  public:
  struct Data {
    QBasicAtomicInt ref;
    int alloc, size;
    std::uint16_t* data; // QT5: put that after the bit field to fill alignment gap; don't use sizeof any more then
    std::uint16_t clean : 1;
    std::uint16_t simpletext : 1;
    std::uint16_t righttoleft : 1;
    std::uint16_t asciiCache : 1;
    std::uint16_t capacity : 1;
    std::uint16_t reserved : 11;
    // ### Qt5: try to ensure that "array" is aligned to 16 bytes on both 32- and 64-bit
    std::uint16_t array[1];
  };
  static Data* const shared_null;
  Data* d;
};

__declspec(naked) QString QString::fromAscii(char const* data, int size){
  __asm {
    jmp dword ptr ds:[0x00EC2A08]
  }
}

QString::Data* const QString::shared_null = reinterpret_cast<Data*>(0x00EC29AC);

class DeviceInfo{
  public:
  std::uint32_t unk0000 = 1;
  //union {
  //	struct {
  //		std::uint16_t vendor_id;
  //		std::uint16_t product_id;
  //		QString port_name;
  //	};
  QString serial_port_name;
  //};
};
class QObject{
  public:
  virtual ~QObject() = default;

  static void connect(QObject* source, const char* signal_name, QObject* destination, const char* slot_name){
    __asm {
      push slot_name
      push destination
      push signal_name
      push source
      call dword ptr ds:[0x00EC298C]
      add esp, 0x10
    }
  }

  static void disconnect(QObject* source, const char* signal_name, QObject* destination, const char* slot_name){
    __asm {
      push slot_name
      push destination
      push signal_name
      push source
      call dword ptr ds:[0x00EC294C]
      add esp, 0x10
    }
  }
};
class IoNetwork;
class ApplicationProxyListener;
class ApplicationProxy;
class ProxyFrame;
class DeviceManager;
class Device
    : public QObject{
  public:
  std::uint32_t dword4;
  QString dword8;
  QString dwordC;
  QString dword10;
  DeviceInfo* device_info;
};
class ApplicationProxyListener{
  public:
  std::uint32_t new_frame_has_been_received(ProxyFrame* frame);
  std::uint32_t on_transmission_ended();
  std::uint32_t on_transmission_ended_with_error();
};

std::function<void()> on_ready_for_use;

class IoPlug : public Device, public ApplicationProxyListener{
  public:
  static IoPlug* create(DeviceInfo* device_info, QObject* owner)
  {
    auto this_ = new std::uint8_t[sizeof(IoPlug)]();
    __asm {
      mov ecx, this_
      push owner
      push device_info
      mov eax, 0x005B6A10
      call eax
      mov eax, this_
    }
  }

  public:
  ApplicationProxy* application_proxy;
  IoNetwork* network;
  std::uint32_t dword24;
  std::uint32_t dword28;
  ProxyFrame* proxy_frame;
  std::uint32_t dword30;
};
class PodConfig{
  public:
  void SLOT_IoPlugConnected(IoPlug* io_plug){
    __asm {
      push io_plug
      mov eax, 0x00406DB0
      call eax
    }
  }

  public:
  std::uint8_t gap4[16];
  std::uint32_t dword14;
  IoPlug* io_plug;
  std::uint32_t dword1C;
  std::uint32_t dword20;
  DeviceManager* device_manager;
  std::uint32_t dword28;
};
void detect_devices(){
  PodConfig* pod_config;
  QObject* device_manager;
  __asm {
    mov pod_config, ebx
    mov device_manager, ecx
  }
  auto device_info = std::make_unique<DeviceInfo>();
  device_info->unk0000 = 1;
  device_info->serial_port_name = QString::fromAscii("COM3");
  auto io_plug = IoPlug::create(device_info.get(), device_manager);
  on_ready_for_use = [pod_config, io_plug] {
    pod_config->SLOT_IoPlugConnected(io_plug);
  };
}

template <typename T>
auto to_byte_array(const T& value){
  std::array<std::uint8_t, sizeof(T)> result;
  std::copy_n(reinterpret_cast<const std::uint8_t*>(&value), sizeof(T), result.begin());
  return result;
}
void on_ready_for_use_wrapper(){
  on_ready_for_use();
}

auto patch_0x0040429C = HookPatch<4>(0x0040429C + 1, to_byte_array(reinterpret_cast<std::uintptr_t>(&detect_devices) - (0x0040429C + 5)));
auto patch_0x005B6CA0 = HookPatch<4>(0x005B6CA0 + 1, to_byte_array(reinterpret_cast<std::uintptr_t>(&on_ready_for_use_wrapper) - (0x005B6CA0 + 5)));

__declspec(dllexport) BOOL WINAPI DllMain(
    HINSTANCE hinstDLL, // handle to DLL module
    DWORD fdwReason, // reason for calling function
    LPVOID lpReserved) { // reserved
  switch (fdwReason) {
    case DLL_PROCESS_ATTACH:
      //perform_test4();
      // Initialize once for each new process.
      // Return FALSE to fail DLL load.
      break;

    case DLL_THREAD_ATTACH:
      // Do thread-specific initialization.
      break;

    case DLL_THREAD_DETACH:
      // Do thread-specific cleanup.
      break;

    case DLL_PROCESS_DETACH:
      // Perform any necessary cleanup.
      break;
  }
  return TRUE; // Successful DLL_PROCESS_ATTACH.
}
