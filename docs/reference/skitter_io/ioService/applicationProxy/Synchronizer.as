package ioService.applicationProxy
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Beacon;
   import ioService.datamodel.Key2W;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Situation;
   import ioService.datamodel.Skitter;
   import ioService.debug.DebugTrace;
   
   public class Synchronizer
   {
      
      public static const SYNC_OBJ__SCD:int = 6;
      
      public static const SYNC_OBJ__NONE:int = 255;
      
      public static const SYNC_OBJ__ACTUATOR:int = 4;
      
      private static const SYNCHRONIZER_STATE_ERASING_OBJECTS:int = 2;
      
      private static const ObjectsAttributeTypesList:Array = [Skitter.AttributesType,Scenario.AttributesType,Situation.AttributesType,Key2W.AttributesType,Actuator.AttributesType,Beacon.AttributesType];
      
      private static const SYNCHRONIZER_STATE_END_OF_READ_OBJECTS:int = 3;
      
      public static const SYNC_OBJ__BEACON:int = 5;
      
      private static const SYNCHRONIZER_STATE_END_OF_WRITE_OBJECTS:int = 5;
      
      public static const SYNCHRONIZER_END_OF_ATTRIBUTES_ID:int = 255;
      
      private static const SYNCHRONIZER_STATE_IDLE:int = 0;
      
      private static const SystemsNamesList:Array = ["skitter"];
      
      public static const SYNC_OBJ__SCENARIO:int = 1;
      
      public static const SYNC_OBJ__SITUATION:int = 2;
      
      private static const SYNCHRONIZER_STATE_WRITING_OBJECT:int = 4;
      
      private static const ObjectsList:Array = ["skitter","scenario","situation","key2W","actuator","beacon","scd"];
      
      public static const SYNC_OBJ__SKITTER:int = 0;
      
      private static const SYNCHRONIZER_STATE_READING_OBJECT:int = 1;
      
      public static const SYNC_OBJ__KEY_2W:int = 3;
       
      
      private var _TransactionTimeoutTimer:Timer;
      
      private var _XmlSystemDescription:XMLDocument;
      
      private var _errorCallBack:Function;
      
      private var _commGW:ioService.applicationProxy.CommunicationGateway;
      
      private var _traceDepth:int = 0;
      
      private var _AsyncTimerRead:Timer;
      
      private var _currentXmlNode:XMLNode;
      
      private var _currentListXmlNode:XMLNode = null;
      
      private var _endReadSystemCallBack:Function;
      
      private var _endWriteCallBack:Function;
      
      private var _endReadObjectCallBack:Function;
      
      private var _AsyncTimerEndOfRead:Timer;
      
      private var _eState:int = 0;
      
      private var _AsyncTimerWrite:Timer;
      
      private var _comPort:int;
      
      private var _AsyncTimerEndOfWrite:Timer;
      
      public function Synchronizer(param1:ioService.applicationProxy.CommunicationGateway)
      {
         this._AsyncTimerRead = new Timer(1,1);
         this._AsyncTimerEndOfRead = new Timer(1,1);
         this._AsyncTimerWrite = new Timer(1,1);
         this._AsyncTimerEndOfWrite = new Timer(1,1);
         this._TransactionTimeoutTimer = new Timer(5000,1);
         super();
         this._commGW = param1;
         this._AsyncTimerRead.addEventListener(TimerEvent.TIMER,this._readCurrentObjectInformation);
         this._AsyncTimerWrite.addEventListener(TimerEvent.TIMER,this._writeCurrentObjectInformation);
         this._AsyncTimerEndOfRead.addEventListener(TimerEvent.TIMER,this._sendEndOfSynchroRead);
         this._AsyncTimerEndOfWrite.addEventListener(TimerEvent.TIMER,this._sendEndOfSynchroWrite);
      }
      
      private function error() : void
      {
         DebugTrace.Tracer("Error in Synchronizer",10);
         this._errorCallBack();
         this._eState = SYNCHRONIZER_STATE_IDLE;
      }
      
      private function _readCurrentObjectInformation(param1:Event) : void
      {
         var _loc2_:XMLNode = null;
         if(this._eState == SYNCHRONIZER_STATE_IDLE)
         {
            if(this._currentListXmlNode.childNodes.length < this._currentListXmlNode.attributes.nbOfElements)
            {
               _loc2_ = this._XmlSystemDescription.createElement(this._currentListXmlNode.nodeName.replace("listof-",""));
               this._currentListXmlNode.appendChild(_loc2_);
               this._currentXmlNode = _loc2_;
               this._eState = SYNCHRONIZER_STATE_READING_OBJECT;
               this.startTransactionTimeout();
               this._commGW.SendProxyFrame(this._comPort,this.BuildFrameToReadInfoForThisNode(_loc2_));
            }
         }
      }
      
      private function getNextObjectToWrite(param1:XMLNode) : XMLNode
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:XMLNode = null;
         for each(_loc2_ in param1.childNodes)
         {
            if(_loc2_.nodeName != "listof-fields")
            {
               for each(_loc3_ in _loc2_.childNodes)
               {
                  if(_loc3_.attributes.synchronized == null)
                  {
                     return _loc3_;
                  }
                  if((_loc4_ = this.getNextObjectToWrite(_loc3_)) != null)
                  {
                     return _loc4_;
                  }
               }
            }
         }
         return null;
      }
      
      public function proxyFrameReceived(param1:ProxyFrame) : void
      {
         if(param1.CommandId == ProxyFrame.COMMAND_SYNC_ID__READ_SYSTEM_DESCRIPTION)
         {
            this.readSystemDescriptionAck(param1.CommandData);
         }
         else if(param1.CommandId == ProxyFrame.COMMAND_SYNC_ID__READ_OBJECT || param1.CommandId == ProxyFrame.COMMAND_SYNC_ID__END_OF_READ_OBJECTS)
         {
            if(this.readObjectAck(param1) == true)
            {
               this._endReadSystemCallBack(this._XmlSystemDescription);
            }
         }
         else if(param1.CommandId == ProxyFrame.COMMAND_SYNC_ID__WRITE_OBJECT || param1.CommandId == ProxyFrame.COMMAND_SYNC_ID__END_OF_WRITE_OBJECTS)
         {
            if(this.writeObjectAck(param1) == true)
            {
               this._endWriteCallBack();
            }
         }
         else if(param1.CommandId == ProxyFrame.COMMAND_SYNC_ID__ERASE_ALL_OBJECTS)
         {
            if(this.eraseAllDataAck(param1) == false)
            {
               this._errorCallBack();
            }
         }
      }
      
      private function sendEndOfSynchroRead() : void
      {
         this._AsyncTimerEndOfRead.start();
      }
      
      private function readCurrentObjectInformation() : void
      {
         this._AsyncTimerRead.start();
      }
      
      private function BuildFrameToReadInfoForThisNode(param1:XMLNode) : ProxyFrame
      {
         var _loc3_:XMLNode = null;
         var _loc2_:ProxyFrame = new ProxyFrame();
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc2_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc2_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc2_.ErrorStatus = ProxyFrame.ERROR_STATUS__NO_ERROR;
         _loc2_.CommandType = ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION;
         _loc2_.CommandId = ProxyFrame.COMMAND_SYNC_ID__READ_OBJECT;
         _loc3_ = param1;
         while(_loc3_.parentNode.nodeName != "system")
         {
            if(_loc3_.nodeName.search("listof") == -1)
            {
               _loc5_++;
               if(_loc3_.parentNode.parentNode.nodeName == "system")
               {
                  _loc4_.writeByte(SystemsNamesList.indexOf(_loc3_.nodeName));
               }
               else
               {
                  _loc4_.writeByte(ObjectsList.indexOf(_loc3_.nodeName));
               }
               _loc6_ = int(_loc3_.parentNode.childNodes.length - 1);
               _loc4_.writeByte(_loc6_ / 256);
               _loc4_.writeByte(_loc6_ % 256);
            }
            _loc3_ = _loc3_.parentNode;
         }
         var _loc7_:int = _loc5_;
         while(_loc7_ > 0)
         {
            _loc2_.CommandData.writeBytes(_loc4_,(_loc7_ - 1) * 3,3);
            _loc7_--;
         }
         _loc2_.CommandData.writeByte(Synchronizer.SYNC_OBJ__NONE);
         var _loc8_:* = new String();
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc8_ += "  ";
            _loc9_++;
         }
         return _loc2_;
      }
      
      private function startTransactionTimeout() : void
      {
         this._TransactionTimeoutTimer.addEventListener(TimerEvent.TIMER,this.transactionTimeoutTimerElapsed);
         this._TransactionTimeoutTimer.start();
      }
      
      private function readSystemDescriptionAck(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:XMLNode = null;
         var _loc5_:int = 0;
         if(this._eState == SYNCHRONIZER_STATE_READING_OBJECT)
         {
            this._eState = SYNCHRONIZER_STATE_IDLE;
            this._TransactionTimeoutTimer.stop();
            _loc2_ = 0;
            while(_loc2_ < param1[1])
            {
               _loc3_ = new String(SystemsNamesList[param1[_loc2_ * 2 + 2]]);
               _loc5_ = int(param1[_loc2_ * 2 + 3]);
               (_loc4_ = this._XmlSystemDescription.createElement("listof-" + _loc3_)).attributes.nbOfElements = _loc5_;
               _loc4_.attributes.currentElement = 0;
               this._XmlSystemDescription.firstChild.appendChild(_loc4_);
               _loc2_++;
            }
            this._currentListXmlNode = this.getNextListToRead(this._XmlSystemDescription.firstChild);
            if(this._currentListXmlNode != null)
            {
               this.readCurrentObjectInformation();
            }
         }
      }
      
      private function getNextListToRead(param1:XMLNode) : XMLNode
      {
         var _loc2_:* = null;
         var _loc3_:XMLNode = null;
         for each(_loc2_ in param1.childNodes)
         {
            if(_loc2_.attributes.nbOfElements != 0)
            {
               if(_loc2_.childNodes.length == 0)
               {
                  return _loc2_;
               }
               if(_loc2_.childNodes.length == 1 && _loc2_.firstChild.nodeName == "listof-fields")
               {
                  return _loc2_;
               }
               if(_loc2_.childNodes.length <= _loc2_.attributes.nbOfElements)
               {
                  _loc3_ = this.getNextListToRead(_loc2_.lastChild);
                  if(_loc3_ != null)
                  {
                     return _loc3_;
                  }
                  if(_loc2_.childNodes.length < _loc2_.attributes.nbOfElements)
                  {
                     return _loc2_;
                  }
               }
            }
         }
         return null;
      }
      
      private function transactionTimeoutTimerElapsed(param1:Event) : void
      {
         DebugTrace.Tracer("Timeout Error in Synchronizer",10);
         if(this._eState == SYNCHRONIZER_STATE_END_OF_READ_OBJECTS)
         {
            this._endReadSystemCallBack(this._XmlSystemDescription);
         }
         else if(this._eState == SYNCHRONIZER_STATE_END_OF_WRITE_OBJECTS)
         {
            this._endWriteCallBack();
         }
         else
         {
            this._errorCallBack();
         }
         this._eState = SYNCHRONIZER_STATE_IDLE;
      }
      
      private function writeObjectAck(param1:ProxyFrame) : Boolean
      {
         if(this._eState == SYNCHRONIZER_STATE_WRITING_OBJECT)
         {
            this._eState = SYNCHRONIZER_STATE_IDLE;
            this._TransactionTimeoutTimer.stop();
            param1.setDataCurrentPosition(0);
            if(param1.getByteFromData() == ProxyFrame.ERROR_STATUS__NO_ERROR)
            {
               if(this._currentXmlNode != null && this._currentXmlNode.firstChild != null)
               {
                  this._currentXmlNode.attributes.synchronized = true;
               }
               this._currentXmlNode = this.getNextObjectToWrite(this._XmlSystemDescription.firstChild);
               if(this._currentXmlNode != null)
               {
                  this.writeCurrentObjectInformation();
               }
               else
               {
                  this.sendEndOfSynchroWrite();
               }
            }
            else
            {
               this.error();
               this.sendEndOfSynchroWrite();
            }
         }
         else if(this._eState == SYNCHRONIZER_STATE_END_OF_WRITE_OBJECTS)
         {
            this._eState = SYNCHRONIZER_STATE_IDLE;
            this._TransactionTimeoutTimer.stop();
            return true;
         }
         return false;
      }
      
      public function ReadDataFromDevice(param1:int, param2:XMLDocument, param3:Function = null, param4:Function = null) : void
      {
         if(this._eState == SYNCHRONIZER_STATE_IDLE)
         {
            this._endReadSystemCallBack = param3;
            this._errorCallBack = param4;
            this._XmlSystemDescription = param2;
            this._comPort = param1;
            DebugTrace.Tracer("Start Synchro Read",10);
            this._eState = SYNCHRONIZER_STATE_READING_OBJECT;
            this.readSystemDescription();
         }
      }
      
      private function readObjectAck(param1:ProxyFrame) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:XMLNode = null;
         var _loc12_:int = 0;
         var _loc13_:XMLNode = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:XMLNode = null;
         var _loc4_:String = new String("");
         if(this._eState == SYNCHRONIZER_STATE_READING_OBJECT)
         {
            this._eState = SYNCHRONIZER_STATE_IDLE;
            this._TransactionTimeoutTimer.stop();
            param1.setDataCurrentPosition(0);
            if(param1.getByteFromData() == ProxyFrame.ERROR_STATUS__NO_ERROR)
            {
               _loc8_ = param1.getByteFromData();
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc10_ = new String(ObjectsList[param1.getByteFromData()]);
                  _loc12_ = param1.getByteFromData() * 256 + param1.getByteFromData();
                  _loc11_ = this._XmlSystemDescription.createElement("listof-" + _loc10_);
                  if(_loc10_ == "scenario")
                  {
                     if(_loc12_ > 2)
                     {
                        _loc12_ = 2;
                     }
                  }
                  _loc11_.attributes.nbOfElements = _loc12_;
                  this._currentXmlNode.appendChild(_loc11_);
                  _loc9_++;
               }
               _loc5_ = param1.getDataCurrentPosition();
               _loc6_ = false;
               _loc7_ = false;
               while(_loc6_ == false)
               {
                  if(_loc5_ < param1.getDataSize())
                  {
                     if(param1.getByteFromDataAtIndex(_loc5_) == SYNC_OBJ__NONE)
                     {
                        _loc6_ = true;
                        _loc7_ = true;
                     }
                     else
                     {
                        _loc5_ += param1.getByteFromDataAtIndex(_loc5_ + 1) + 2;
                     }
                  }
                  else
                  {
                     _loc6_ = true;
                     _loc7_ = false;
                  }
               }
               if(_loc7_ == true)
               {
                  _loc13_ = new XMLNode(1,"listof-fields");
                  while((_loc14_ = param1.getByteFromData()) != SYNC_OBJ__NONE)
                  {
                     _loc15_ = param1.getByteFromData();
                     _loc16_ = String(ObjectsAttributeTypesList[ObjectsList.indexOf(this._currentXmlNode.nodeName)][_loc14_]);
                     switch(_loc16_)
                     {
                        case "BOOL":
                           if(param1.getByteFromData() == 0)
                           {
                              _loc17_ = "false";
                           }
                           else
                           {
                              _loc17_ = "true";
                           }
                           break;
                        case "UINT8":
                           _loc17_ = param1.getByteFromData().toString();
                           break;
                        case "UINT16":
                           _loc17_ = param1.getShortFromData().toString();
                           break;
                        case "UINT32":
                           _loc17_ = param1.getIntFromData().toString();
                           break;
                        case "STRING":
                           _loc17_ = param1.getStringFromData(_loc15_);
                           break;
                        case "HEXA-STRING":
                           _loc17_ = param1.getHexaStringToData(_loc15_);
                           break;
                        case "IO-ADDRESS":
                           _loc17_ = param1.getIoAddressFromData();
                           break;
                     }
                     (_loc18_ = new XMLNode(1,"field")).attributes.id = _loc14_.toString();
                     _loc18_.attributes.size = _loc15_.toString();
                     _loc18_.nodeValue = _loc17_;
                     _loc13_.appendChild(_loc18_);
                  }
                  this._currentXmlNode.appendChild(_loc13_);
               }
               else
               {
                  this.error();
                  this.sendEndOfSynchroRead();
               }
            }
            else
            {
               this.error();
               this.sendEndOfSynchroRead();
            }
            this._currentListXmlNode = this.getNextListToRead(this._XmlSystemDescription.firstChild);
            if(this._currentListXmlNode != null)
            {
               this.readCurrentObjectInformation();
            }
            else
            {
               this.sendEndOfSynchroRead();
            }
         }
         else if(this._eState == SYNCHRONIZER_STATE_END_OF_READ_OBJECTS)
         {
            this._TransactionTimeoutTimer.stop();
            this._eState = SYNCHRONIZER_STATE_IDLE;
            return true;
         }
         return false;
      }
      
      public function WriteDataToDevice(param1:int, param2:XMLDocument, param3:Function = null, param4:Function = null) : Boolean
      {
         if(this._eState == SYNCHRONIZER_STATE_IDLE)
         {
            this._endWriteCallBack = param3;
            this._errorCallBack = param4;
            this._XmlSystemDescription = param2;
            this._comPort = param1;
            DebugTrace.Tracer("Start Synchro Write",10);
            this._currentXmlNode = this._XmlSystemDescription.firstChild.firstChild;
            this.eraseAllData();
            return true;
         }
         this.startTransactionTimeout();
         return false;
      }
      
      private function readSystemDescription() : void
      {
         var _loc2_:* = null;
         var _loc1_:ProxyFrame = new ProxyFrame();
         _loc1_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc1_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc1_.CommandType = ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION;
         _loc1_.CommandId = ProxyFrame.COMMAND_SYNC_ID__READ_SYSTEM_DESCRIPTION;
         this.startTransactionTimeout();
         this._commGW.SendProxyFrame(this._comPort,_loc1_);
      }
      
      private function sendEndOfSynchroWrite() : void
      {
         this._AsyncTimerEndOfWrite.start();
      }
      
      private function _sendEndOfSynchroWrite(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:ProxyFrame = null;
         if(this._eState == SYNCHRONIZER_STATE_IDLE)
         {
            _loc3_ = new ProxyFrame();
            _loc3_.Encryption = ProxyFrame.ENCRYPTION__NO;
            _loc3_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
            _loc3_.CommandType = ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION;
            _loc3_.CommandId = ProxyFrame.COMMAND_SYNC_ID__END_OF_WRITE_OBJECTS;
            this.startTransactionTimeout();
            this._commGW.SendProxyFrame(this._comPort,_loc3_);
            this._eState = SYNCHRONIZER_STATE_END_OF_WRITE_OBJECTS;
         }
      }
      
      private function eraseAllDataAck(param1:ProxyFrame) : Boolean
      {
         if(this._eState == SYNCHRONIZER_STATE_ERASING_OBJECTS)
         {
            this._eState = SYNCHRONIZER_STATE_IDLE;
            this._TransactionTimeoutTimer.stop();
            DebugTrace.Tracer("Start Synchro Write Erase All -> OK",10);
            param1.setDataCurrentPosition(0);
            if(param1.getByteFromData() == ProxyFrame.ERROR_STATUS__NO_ERROR)
            {
               this._currentXmlNode = this.getNextObjectToWrite(this._XmlSystemDescription.firstChild);
               if(this._currentXmlNode != null)
               {
                  this.writeCurrentObjectInformation();
               }
               else
               {
                  this.sendEndOfSynchroWrite();
               }
               return true;
            }
            return false;
         }
         this._eState = SYNCHRONIZER_STATE_IDLE;
         return false;
      }
      
      private function eraseAllData() : void
      {
         var _loc1_:ProxyFrame = new ProxyFrame();
         _loc1_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc1_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc1_.CommandType = ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION;
         _loc1_.CommandId = ProxyFrame.COMMAND_SYNC_ID__ERASE_ALL_OBJECTS;
         this._eState = SYNCHRONIZER_STATE_ERASING_OBJECTS;
         DebugTrace.Tracer("Start Synchro Write Erase All",10);
         this.startTransactionTimeout();
         this._commGW.SendProxyFrame(this._comPort,_loc1_);
      }
      
      private function writeCurrentObjectInformation() : void
      {
         this._AsyncTimerWrite.start();
      }
      
      private function _writeCurrentObjectInformation(param1:Event) : void
      {
         var _loc2_:* = null;
         if(this._eState == SYNCHRONIZER_STATE_IDLE)
         {
            if(this._currentXmlNode != null)
            {
               this._eState = SYNCHRONIZER_STATE_WRITING_OBJECT;
               this._commGW.SendProxyFrame(this._comPort,this.BuildFrameToWriteInfoForThisNode(this._currentXmlNode));
               this.startTransactionTimeout();
            }
            else
            {
               this.error();
            }
         }
         else
         {
            this.error();
         }
      }
      
      private function _sendEndOfSynchroRead(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:ProxyFrame = null;
         if(this._eState == SYNCHRONIZER_STATE_IDLE)
         {
            _loc3_ = new ProxyFrame();
            _loc3_.Encryption = ProxyFrame.ENCRYPTION__NO;
            _loc3_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
            _loc3_.CommandType = ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION;
            _loc3_.CommandId = ProxyFrame.COMMAND_SYNC_ID__END_OF_READ_OBJECTS;
            this.startTransactionTimeout();
            this._commGW.SendProxyFrame(this._comPort,_loc3_);
            this._eState = SYNCHRONIZER_STATE_END_OF_READ_OBJECTS;
         }
      }
      
      private function BuildFrameToWriteInfoForThisNode(param1:XMLNode) : ProxyFrame
      {
         var _loc3_:XMLNode = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = undefined;
         var _loc2_:ProxyFrame = new ProxyFrame();
         var _loc6_:ByteArray = new ByteArray();
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         _loc2_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc2_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc2_.ErrorStatus = ProxyFrame.ERROR_STATUS__NO_ERROR;
         _loc2_.CommandType = ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION;
         _loc2_.CommandId = ProxyFrame.COMMAND_SYNC_ID__WRITE_OBJECT;
         if(param1.parentNode.attributes.currentElement == null)
         {
            param1.parentNode.attributes.currentElement = 0;
         }
         else
         {
            ++param1.parentNode.attributes.currentElement;
         }
         _loc3_ = param1;
         while(_loc3_.parentNode.nodeName != "system")
         {
            if(_loc3_.nodeName.search("listof") == -1)
            {
               _loc7_++;
               if(_loc3_.parentNode.parentNode.nodeName == "system")
               {
                  _loc6_.writeByte(SystemsNamesList.indexOf(_loc3_.nodeName));
               }
               else
               {
                  _loc6_.writeByte(ObjectsList.indexOf(_loc3_.nodeName));
               }
               _loc8_ = int(_loc3_.parentNode.attributes.currentElement);
               _loc6_.writeByte(_loc8_ / 256);
               _loc6_.writeByte(_loc8_ % 256);
            }
            _loc3_ = _loc3_.parentNode;
         }
         var _loc9_:int = _loc7_;
         while(_loc9_ > 0)
         {
            _loc2_.CommandData.writeBytes(_loc6_,(_loc9_ - 1) * 3,3);
            _loc9_--;
         }
         _loc2_.CommandData.writeByte(Synchronizer.SYNC_OBJ__NONE);
         var _loc10_:* = new String();
         var _loc11_:int = 0;
         while(_loc11_ < _loc7_)
         {
            _loc10_ += "  ";
            _loc11_++;
         }
         for each(_loc4_ in this._currentXmlNode.childNodes)
         {
            if(_loc4_.nodeName == "listof-fields")
            {
               for each(_loc5_ in _loc4_.childNodes)
               {
                  _loc2_.addByteToData(_loc5_.attributes.id);
                  switch(_loc5_.attributes.type)
                  {
                     case "BOOL":
                        _loc2_.addByteToData(1);
                        if(_loc5_.nodeValue == "true")
                        {
                           _loc2_.addByteToData(1);
                        }
                        else
                        {
                           _loc2_.addByteToData(0);
                        }
                        break;
                     case "UINT8":
                        _loc2_.addByteToData(1);
                        _loc2_.addByteToData(parseInt(_loc5_.nodeValue));
                        break;
                     case "UINT16":
                        _loc2_.addByteToData(2);
                        _loc2_.addShortToData(parseInt(_loc5_.nodeValue));
                        break;
                     case "UINT32":
                        _loc2_.addByteToData(4);
                        _loc2_.addIntToData(parseInt(_loc5_.nodeValue));
                        break;
                     case "STRING":
                        _loc12_ = _loc2_.getDataCurrentPosition();
                        _loc2_.addByteToData(_loc5_.attributes.size);
                        if((_loc13_ = _loc2_.addStringToData(_loc5_.nodeValue,_loc5_.attributes.size)) != _loc5_.attributes.size)
                        {
                           _loc2_.setDataCurrentPosition(_loc12_);
                           _loc2_.addByteToData(_loc13_);
                           _loc2_.setDataCurrentPosition(_loc2_.getDataSize());
                        }
                        break;
                     case "HEXA-STRING":
                        _loc2_.addByteToData(_loc5_.attributes.size);
                        _loc2_.addHexaStringToData(_loc5_.nodeValue,_loc5_.attributes.size);
                        break;
                     case "IO-ADDRESS":
                        _loc2_.addByteToData(3);
                        _loc2_.addIoAddressToData(_loc5_.nodeValue);
                        break;
                  }
               }
               _loc2_.addByteToData(SYNC_OBJ__NONE);
            }
         }
         return _loc2_;
      }
      
      private function readSystemDescriptionError(param1:ByteArray) : void
      {
         this._errorCallBack();
      }
   }
}
