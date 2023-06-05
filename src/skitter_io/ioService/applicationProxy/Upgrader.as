package ioService.applicationProxy
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Device;
   import ioService.debug.DebugTrace;
   import mx.collections.ArrayCollection;
   import mx.rpc.Fault;
   import mx.rpc.events.FaultEvent;
   
   public class Upgrader
   {
      
      private static const UPGRADER_STATE_WAITING_FOR_PAGE_ERASE_ACK:int = 4;
      
      private static const UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_WRITE_ACK:int = 7;
      
      private static const CHIP_ID_OFFSET:int = 67;
      
      private static const UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_ERASE_ACK:int = 5;
      
      private static const UPGRADER_STATE_WAITING_FOR_START_BOOT_LOADER_ACK:int = 1;
      
      private static const UPGRADER_STATE_WAITING_FOR_DEVICE_IDENTIFICATION:int = 3;
      
      private static const UPGRADER_STATE_WAITING_FOR_BOOT_LOADER_START:int = 2;
      
      private static const IDENTIFY_HW_VERSION_SIZE:int = 10;
      
      private static const IDENTIFY_COMMAND_RETURN_SIZE:int = 82;
      
      private static const SIZE_OF_ADDRESS:int = 4;
      
      private static const UPGRADER_STATE_IDLE:int = 0;
      
      private static const CHIP_ID_SIZE:int = 4;
      
      private static const MAX_NB_OF_RETRIES:int = 5;
      
      private static const IDENTIFY_SW_VERSION_SIZE:int = 10;
      
      private static const IDENTIFY_HW_VERSION_OFFSET:int = 23;
      
      private static const IDENTIFY_SW_VERSION_OFFSET:int = IDENTIFY_HW_VERSION_OFFSET + 16;
      
      private static const UPGRADER_STATE_WAITING_FOR_PAGE_WRITE_ACK:int = 6;
      
      private static const SIZE_OF_PAGE:int = 544;
      
      private static const HEADER_SIZE:int = 24;
      
      private static const UPGRADER_STATE_WAITING_FOR_START_APPLICATION_ACK:int = 8;
       
      
      private var _progressionCallBack:Function;
      
      private var _TransactionTimeoutTimer:Timer;
      
      private var _CounterForDebug:int = 0;
      
      private var _eState:int = 0;
      
      private var _errorCallBack:Function;
      
      private var _upgradeDirectory:File;
      
      private var _DelayedProxyFrame:ioService.applicationProxy.ProxyFrame;
      
      private var _firstPageCRC:uint;
      
      private var _upgradeFileStream:FileStream;
      
      private var _upgradeFileSize:int;
      
      private var _commGW:ioService.applicationProxy.CommunicationGateway;
      
      private var _endCallBack:Function;
      
      private var _LastProgress:int = 0;
      
      private var _comPort:int;
      
      private var _Timer:Timer;
      
      private var _firstPage:ByteArray;
      
      private var _device:Device;
      
      private var _upgradeFile:File;
      
      private var _firstPageAddress:uint;
      
      private var _NbOfRetries:int;
      
      private var _lastSentDataLength:int = 0;
      
      public function Upgrader(param1:ioService.applicationProxy.CommunicationGateway)
      {
         this._Timer = new Timer(3000,1);
         this._TransactionTimeoutTimer = new Timer(5000,1);
         this._DelayedProxyFrame = new ioService.applicationProxy.ProxyFrame();
         super();
         this._commGW = param1;
         this._firstPage = new ByteArray();
      }
      
      public function upgradeDevice(param1:Device, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this._device = param1;
         this._endCallBack = param2;
         this._progressionCallBack = param3;
         this._errorCallBack = param4;
         this._NbOfRetries = 0;
         this._DelayedProxyFrame.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
         this._DelayedProxyFrame.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         this._DelayedProxyFrame.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         this._DelayedProxyFrame.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_BOOTLOADER;
         this._eState = UPGRADER_STATE_WAITING_FOR_BOOT_LOADER_START;
         this._Timer.addEventListener(TimerEvent.TIMER,this.TimerElapsed);
         this._Timer.start();
      }
      
      private function TimerElapsed(param1:Event) : void
      {
         this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),this._DelayedProxyFrame);
      }
      
      private function transactionTimeoutTimerElapsed(param1:Event) : void
      {
         var _loc2_:Fault = null;
         var _loc3_:FaultEvent = null;
         DebugTrace.Tracer("Timeout Error in Upgrader",10);
         this._eState = UPGRADER_STATE_IDLE;
         if(this._errorCallBack != null)
         {
            _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
            _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
            this._errorCallBack(_loc3_);
         }
      }
      
      public function doYouHaveUpgradeInProgress() : Boolean
      {
         if(this._eState == UPGRADER_STATE_WAITING_FOR_BOOT_LOADER_START || this._eState == UPGRADER_STATE_IDLE)
         {
            return true;
         }
         return false;
      }
      
      private function startTransactionTimeout() : void
      {
         this._TransactionTimeoutTimer.addEventListener(TimerEvent.TIMER,this.transactionTimeoutTimerElapsed);
         this._TransactionTimeoutTimer.start();
      }
      
      public function acknowledgeFrameReceived(param1:ioService.applicationProxy.ProxyFrame) : void
      {
         var _loc2_:Fault = null;
         var _loc3_:FaultEvent = null;
         var _loc5_:ArrayCollection = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._TransactionTimeoutTimer.stop();
         if(param1.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_BOOTLOADER)
         {
            if(this._eState == UPGRADER_STATE_WAITING_FOR_START_BOOT_LOADER_ACK)
            {
               this._eState = UPGRADER_STATE_WAITING_FOR_BOOT_LOADER_START;
            }
            else
            {
               this._eState == UPGRADER_STATE_IDLE;
               if(this._errorCallBack != null)
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this._errorCallBack(_loc3_);
               }
            }
         }
         else if(param1.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__IDENTIFY_ACK)
         {
            if(this._eState == UPGRADER_STATE_WAITING_FOR_DEVICE_IDENTIFICATION)
            {
               _loc6_ = new String();
               _loc7_ = new String();
               _loc8_ = new String();
               param1.setDataCurrentPosition(IDENTIFY_HW_VERSION_OFFSET);
               _loc6_ = param1.getStringFromData(IDENTIFY_HW_VERSION_SIZE);
               param1.setDataCurrentPosition(IDENTIFY_SW_VERSION_OFFSET);
               _loc7_ = param1.getStringFromData(IDENTIFY_SW_VERSION_SIZE);
               param1.setDataCurrentPosition(CHIP_ID_OFFSET);
               _loc8_ = param1.getHexaStringToData(CHIP_ID_SIZE);
               if(_loc6_ == "ÿÿÿÿÿÿÿÿÿÿ")
               {
                  trace("No HW version found!!!");
                  if(this._errorCallBack != null)
                  {
                     this._errorCallBack(null);
                  }
               }
               this._upgradeDirectory = new File(File.applicationDirectory.nativePath + "/firmware/skitter/" + _loc6_ + "/");
               if(this._upgradeDirectory.exists)
               {
                  _loc5_ = new ArrayCollection(this._upgradeDirectory.getDirectoryListing());
                  _loc9_ = 0;
                  while(_loc9_ < _loc5_.length)
                  {
                     if(!_loc5_[_loc9_].isDirectory && _loc5_[_loc9_].extension == "seb")
                     {
                        this._upgradeFile = _loc5_[_loc9_];
                        _loc9_ = _loc5_.length;
                     }
                     _loc9_++;
                  }
               }
               if(this._upgradeFile != null && Boolean(this._upgradeFile.exists))
               {
                  this._LastProgress = 0;
                  this._upgradeFileStream = new FileStream();
                  this._upgradeFileStream.open(this._upgradeFile,FileMode.READ);
                  this._upgradeFileSize = this._upgradeFileStream.bytesAvailable;
                  this._upgradeFileStream.position = HEADER_SIZE;
                  _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
                  _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
                  _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
                  _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__ERASE_PAGE;
                  this._firstPageAddress = this._upgradeFileStream.readUnsignedInt();
                  _loc4_.CommandData.writeUnsignedInt(this._firstPageAddress);
                  this._firstPage.clear();
                  _loc9_ = 0;
                  while(_loc9_ < SIZE_OF_PAGE / 4)
                  {
                     if(this._upgradeFileStream.bytesAvailable <= 4)
                     {
                        break;
                     }
                     this._firstPage.writeUnsignedInt(this._upgradeFileStream.readUnsignedInt());
                     _loc9_++;
                  }
                  this._firstPageCRC = this._upgradeFileStream.readUnsignedShort() & 65535;
                  this._eState = UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_ERASE_ACK;
                  this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc4_);
               }
               else
               {
                  this._eState == UPGRADER_STATE_IDLE;
                  if(this._errorCallBack != null)
                  {
                     _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                     _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                     this._errorCallBack(_loc3_);
                  }
               }
            }
            else
            {
               this._eState == UPGRADER_STATE_IDLE;
               if(this._errorCallBack != null)
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this._errorCallBack(_loc3_);
               }
            }
         }
         else if(param1.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__ERASE_PAGE_ACK)
         {
            if(this._eState == UPGRADER_STATE_WAITING_FOR_PAGE_ERASE_ACK)
            {
               _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__ALREADY_ENCRYPTED;
               _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
               _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
               _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__WRITE_PAGE;
               this._lastSentDataLength = 0;
               _loc9_ = 0;
               while(_loc9_ < SIZE_OF_PAGE / 4)
               {
                  if(this._upgradeFileStream.bytesAvailable <= 4)
                  {
                     break;
                  }
                  _loc4_.CommandData.writeUnsignedInt(this._upgradeFileStream.readUnsignedInt());
                  this._lastSentDataLength += 4;
                  _loc9_++;
               }
               if(this._progressionCallBack != null)
               {
                  _loc10_ = (this._upgradeFileSize - this._upgradeFileStream.bytesAvailable) * 100 / this._upgradeFileSize;
                  if(this._LastProgress + 5 <= _loc10_)
                  {
                     this._progressionCallBack(this._LastProgress);
                     this._LastProgress = _loc10_;
                  }
               }
               this._eState = UPGRADER_STATE_WAITING_FOR_PAGE_WRITE_ACK;
               this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc4_);
            }
            else if(this._eState == UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_ERASE_ACK)
            {
               _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
               _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
               _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
               _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__ERASE_PAGE;
               _loc4_.CommandData.writeUnsignedInt(this._upgradeFileStream.readUnsignedInt());
               this._eState = UPGRADER_STATE_WAITING_FOR_PAGE_ERASE_ACK;
               this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc4_);
            }
            else
            {
               this._eState == UPGRADER_STATE_IDLE;
               if(this._errorCallBack != null)
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this._errorCallBack(_loc3_);
               }
            }
         }
         else if(param1.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__WRITE_PAGE_ACK)
         {
            if(this._eState == UPGRADER_STATE_WAITING_FOR_PAGE_WRITE_ACK)
            {
               if(param1.CommandData[0] != ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__STATUS_OK)
               {
                  this._upgradeFileStream.position -= this._lastSentDataLength + SIZE_OF_ADDRESS;
                  this._NbOfRetries += 1;
               }
               else
               {
                  _loc12_ = uint(this._upgradeFileStream.readShort() & 65535);
                  _loc11_ = uint((_loc11_ = uint(param1.CommandData[1] << 8 & 65280)) | param1.CommandData[2] & 255);
                  if(_loc12_ != _loc11_)
                  {
                     this._upgradeFileStream.position -= this._lastSentDataLength + SIZE_OF_ADDRESS;
                     this._NbOfRetries += 1;
                  }
               }
               if(this._NbOfRetries > MAX_NB_OF_RETRIES)
               {
                  this._eState == UPGRADER_STATE_IDLE;
                  if(this._errorCallBack != null)
                  {
                     _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                     _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                     this._errorCallBack(_loc3_);
                  }
               }
               else if(this._upgradeFileStream.bytesAvailable < SIZE_OF_PAGE)
               {
                  _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__ALREADY_ENCRYPTED;
                  _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
                  _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
                  _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__WRITE_PAGE;
                  _loc4_.CommandData.writeBytes(this._firstPage,0,this._firstPage.length);
                  this._lastSentDataLength = this._firstPage.length;
                  this._eState = UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_WRITE_ACK;
                  this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc4_);
               }
               else
               {
                  _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
                  _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
                  _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
                  _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__ERASE_PAGE;
                  _loc4_.CommandData.writeUnsignedInt(this._upgradeFileStream.readUnsignedInt());
                  this._eState = UPGRADER_STATE_WAITING_FOR_PAGE_ERASE_ACK;
                  this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc4_);
               }
            }
            else if(this._eState == UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_WRITE_ACK)
            {
               _loc11_ = uint((_loc11_ = uint(param1.CommandData[1] << 8 & 65280)) | param1.CommandData[2] & 255);
               if(this._firstPageCRC != _loc11_)
               {
                  _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
                  _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
                  _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
                  _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__ERASE_PAGE;
                  this._eState = UPGRADER_STATE_WAITING_FOR_FIRST_PAGE_ERASE_ACK;
                  _loc4_.CommandData.writeUnsignedInt(this._firstPageAddress);
                  this._NbOfRetries += 1;
               }
               else
               {
                  _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
                  _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
                  _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
                  _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__START_APPLICATION;
                  if(this._progressionCallBack != null)
                  {
                     this._progressionCallBack(100);
                  }
                  if(this._endCallBack != null)
                  {
                     this._endCallBack(null);
                  }
                  this._eState = UPGRADER_STATE_WAITING_FOR_START_APPLICATION_ACK;
                  this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc4_);
               }
            }
            else
            {
               this._eState == UPGRADER_STATE_IDLE;
               if(this._errorCallBack != null)
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this._errorCallBack(_loc3_);
               }
            }
         }
         else if(param1.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__START_APPLICATION_ACK)
         {
            if(this._eState == UPGRADER_STATE_WAITING_FOR_START_APPLICATION_ACK)
            {
               this._eState = UPGRADER_STATE_IDLE;
            }
         }
      }
      
      public function BootLoaderIsReady(param1:Device) : void
      {
         var _loc3_:Fault = null;
         var _loc4_:FaultEvent = null;
         var _loc2_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         if(param1 != null)
         {
            this._device = param1;
         }
         if(this._eState == UPGRADER_STATE_WAITING_FOR_BOOT_LOADER_START || this._eState == UPGRADER_STATE_IDLE)
         {
            _loc2_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
            _loc2_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
            _loc2_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__BOOT_LOADER;
            _loc2_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UPGRADE__IDENTIFY;
            this._eState = UPGRADER_STATE_WAITING_FOR_DEVICE_IDENTIFICATION;
            this._commGW.SendProxyFrame(parseInt(this._device.virtualComPort),_loc2_);
         }
         else
         {
            this._eState == UPGRADER_STATE_IDLE;
            if(this._errorCallBack != null)
            {
               _loc3_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
               _loc4_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc3_);
               this._errorCallBack(_loc4_);
            }
         }
      }
      
      public function BootLoaderHasShutdown(param1:Device) : void
      {
         var _loc2_:Fault = null;
         var _loc3_:FaultEvent = null;
         if(param1 != null)
         {
            this._device = param1;
         }
         if(this._eState != UPGRADER_STATE_IDLE)
         {
            this._eState = UPGRADER_STATE_IDLE;
            if(this._errorCallBack != null)
            {
               _loc2_ = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
               _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
               this._errorCallBack(_loc3_);
            }
         }
      }
   }
}
