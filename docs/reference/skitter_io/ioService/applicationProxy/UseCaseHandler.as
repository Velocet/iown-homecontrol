package ioService.applicationProxy
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Beacon;
   import ioService.datamodel.Device;
   import ioService.datamodel.Key2W;
   import ioService.datamodel.Situation;
   import ioService.debug.DebugTrace;
   import mx.rpc.Fault;
   import mx.rpc.events.FaultEvent;
   
   public class UseCaseHandler
   {
      
      private static const USE_CASE_HANDLER_STATE__WAITING_FOR_STATUS:int = 2;
      
      public static const SIZE_OF_ACTUATOR_NAME:int = 16;
      
      public static const SIZE_OF_SYSTEM_KEY_2W:int = 16;
      
      private static const USE_CASE_HANDLER_STATE__WAITING_FOR_ABORT_ACK:int = 3;
      
      private static const USE_CASE_HANDLER_STATE__IDLE:int = 0;
      
      private static const USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK:int = 1;
       
      
      private var _newPairedBeaconCallback:Function;
      
      private var _receivedFrame:ioService.applicationProxy.ProxyFrame = null;
      
      private var synchronizeSkitterEndCallback:Function;
      
      private var _cancelGiveKeyCallback:Function;
      
      private var _commGW:ioService.applicationProxy.CommunicationGateway;
      
      private var _actuatorPositionCallback:Function;
      
      private var _testScenarioCallback:Function;
      
      private var _restoredDevice:Device;
      
      private var _newPairedActuatorCallback:Function;
      
      private var _giveKeyCallback:Function;
      
      private var _comport:int;
      
      private var _eState:int = 0;
      
      private var _currentActuator:Actuator;
      
      private var _AsyncUseCaseStatusTimer:Timer;
      
      private var _newSystemKeyCallback:Function;
      
      private var _restoreFactorySettingsCallback:Function;
      
      private var _actuatorNameCallback:Function;
      
      private var _identifyActuatorCallback:Function;
      
      private var _errorCallback:Function;
      
      private var _pairingEndCallback:Function;
      
      private var newConnectedDevice:Function;
      
      public function UseCaseHandler(param1:ioService.applicationProxy.CommunicationGateway)
      {
         this._AsyncUseCaseStatusTimer = new Timer(50,1);
         super();
         this._commGW = param1;
         this.removeErrorCallback();
         this._AsyncUseCaseStatusTimer.addEventListener(TimerEvent.TIMER,this.AsyncUseCaseStatusFrameReceived);
      }
      
      public function pairEquipmentStimulatedBy1WController(param1:int, param2:Function = null, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._newPairedActuatorCallback = param2;
         this._pairingEndCallback = param3;
         this._errorCallback = param4;
         _loc5_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc5_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc5_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc5_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_STIMULATED_BY_1W;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc5_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function identifyActuator(param1:int, param2:Actuator, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._identifyActuatorCallback = param3;
         this._errorCallback = param4;
         this._currentActuator = param2.clone();
         _loc5_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc5_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc5_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc5_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__IDENTIFY_ACTUATOR;
         _loc5_.addIoAddressToData(param2.ioAddress);
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc5_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function startBootLoader(param1:int) : void
      {
         var _loc2_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         _loc2_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__RIJNDAEL;
         _loc2_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc2_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc2_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_BOOTLOADER;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc2_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function getActuatorName(param1:int, param2:Actuator, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._actuatorNameCallback = param3;
         this._errorCallback = param4;
         this._currentActuator = param2.clone();
         _loc5_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc5_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc5_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc5_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_ACTUATOR_NAME;
         _loc5_.addIoAddressToData(param2.ioAddress);
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc5_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function AbortUseCaseAckFrameReceived(param1:int, param2:ioService.applicationProxy.ProxyFrame) : void
      {
         if(this._eState == USE_CASE_HANDLER_STATE__WAITING_FOR_ABORT_ACK)
         {
            switch(param2.CommandId)
            {
               case ioService.applicationProxy.ProxyFrame.COMMAND_ABORT_UC_ID__USER_ABORT:
               case ioService.applicationProxy.ProxyFrame.COMMAND_ABORT_UC_ID__TIMEOUT_ABORT:
            }
         }
      }
      
      public function setActuatorName(param1:int, param2:Actuator, param3:String, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._actuatorNameCallback = param4;
         this._errorCallback = param5;
         this._currentActuator = param2.clone();
         this._currentActuator.name = param3;
         _loc6_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc6_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc6_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc6_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__SET_ACTUATOR_NAME;
         _loc6_.addIoAddressToData(param2.ioAddress);
         _loc6_.addStringToIsoLatin1Data(param3,UseCaseHandler.SIZE_OF_ACTUATOR_NAME);
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc6_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      private function callErrorCallback(param1:FaultEvent) : void
      {
         var _loc2_:Function = null;
         _loc2_ = this._errorCallback;
         this.removeErrorCallback();
         _loc2_(param1);
      }
      
      public function cancelGiveKey(param1:int, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._cancelGiveKeyCallback = param2;
         this._errorCallback = param3;
         _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__ABORT_UC;
         _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_ABORT_UC_ID__USER_ABORT;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc4_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function pairEquipmentInSystem(param1:int, param2:Function = null, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._newPairedActuatorCallback = param2;
         this._newPairedBeaconCallback = param3;
         this._pairingEndCallback = param4;
         this._errorCallback = param5;
         _loc6_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc6_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc6_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc6_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc6_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function StartUseCaseAckFrameReceived(param1:int, param2:ioService.applicationProxy.ProxyFrame) : void
      {
         switch(param2.CommandId)
         {
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_2W_KEY_FROM_CONTROLLER:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GENERATE_NEW_KEY:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GIVE_KEY_TO_ANOTHER_2W_CONTROLLER:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_NEW_EQUIPMENT:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_STIMULATED_BY_1W:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_ACTUATOR_NAME:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__SET_ACTUATOR_NAME:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_ACTUATOR_POSITION:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__IDENTIFY_ACTUATOR:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_THIS_SCENARIO:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__RESTORE_FACTORY_SETTINGS:
               this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_STATUS;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_BOOTLOADER:
            default:
               this.removeErrorCallback();
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
         }
      }
      
      public function abortUseCaseBecauseDeviceIsDisconnected() : void
      {
         var _loc1_:Fault = null;
         var _loc2_:FaultEvent = null;
         if(this._eState == USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK || this._eState == USE_CASE_HANDLER_STATE__WAITING_FOR_STATUS)
         {
            _loc1_ = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            _loc2_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc1_);
            this.callErrorCallback(_loc2_);
            this._eState = USE_CASE_HANDLER_STATE__IDLE;
         }
      }
      
      public function getActuatorPosition(param1:int, param2:Actuator, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._actuatorPositionCallback = param3;
         this._errorCallback = param4;
         this._currentActuator = param2.clone();
         _loc5_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc5_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc5_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc5_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_ACTUATOR_POSITION;
         _loc5_.addIoAddressToData(param2.ioAddress);
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc5_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      private function AsyncUseCaseStatusFrameReceived(param1:Event) : void
      {
         var _loc2_:Fault = null;
         var _loc3_:FaultEvent = null;
         var _loc4_:int = 0;
         var _loc5_:Situation = null;
         var _loc6_:Key2W = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Actuator = null;
         var _loc10_:Beacon = null;
         var _loc11_:String = null;
         var _loc12_:ByteArray = null;
         this._receivedFrame.setDataCurrentPosition(0);
         switch(this._receivedFrame.CommandId)
         {
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_BOOTLOADER:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_ENDED)
               {
                  this.removeErrorCallback();
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_UPGRADE_SKITTER,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_2W_KEY_FROM_CONTROLLER:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GENERATE_NEW_KEY:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_ENDED)
               {
                  (_loc6_ = new Key2W()).oldKey = this._receivedFrame.getHexaStringToData(UseCaseHandler.SIZE_OF_SYSTEM_KEY_2W);
                  _loc6_.currentKey = this._receivedFrame.getHexaStringToData(UseCaseHandler.SIZE_OF_SYSTEM_KEY_2W);
                  this.removeErrorCallback();
                  this._newSystemKeyCallback(_loc6_);
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_NEW_SYSTEM_KEY,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GIVE_KEY_TO_ANOTHER_2W_CONTROLLER:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_ENDED)
               {
                  this.removeErrorCallback();
                  this._giveKeyCallback();
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_GIVE_KEY,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_NEW_EQUIPMENT:
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_STIMULATED_BY_1W:
               if(this._receivedFrame.CommandData[ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_POSITION] == ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_ENDED)
               {
                  this.removeErrorCallback();
                  this._pairingEndCallback();
                  this._eState = USE_CASE_HANDLER_STATE__IDLE;
               }
               else if(this._receivedFrame.CommandData[ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_POSITION] == ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_INTERMEDIATE)
               {
                  if(this._receivedFrame.CommandData[ioService.applicationProxy.ProxyFrame.UC_STATUS__INTERMEDIATE_DATA_TYPE_POSITION] == ioService.applicationProxy.ProxyFrame.UC_STATUS__INTERMEDIATE_DATA_ACTUATOR)
                  {
                     _loc9_ = new Actuator();
                     this._receivedFrame.setDataCurrentPosition(ioService.applicationProxy.ProxyFrame.UC_STATUS__INTERMEDIATE_DATA_POSITION);
                     while((_loc7_ = this._receivedFrame.getByteFromData()) != Synchronizer.SYNC_OBJ__NONE)
                     {
                        _loc8_ = this._receivedFrame.getByteFromData();
                        switch(_loc7_)
                        {
                           case Actuator.ACTUATOR_FIELD_ID__IO_ADDRESS:
                              _loc9_.ioAddress = this._receivedFrame.getIoAddressFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__IO_BACKBONE_ADDRESS:
                              _loc9_.ioBackBoneAddress = this._receivedFrame.getIoAddressFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__PROFILE:
                              _loc9_.profile = this._receivedFrame.getShortFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__SUB_PROFILE:
                              _loc9_.subProfile = this._receivedFrame.getByteFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__IO_MEMBERSHIP_FLAG:
                              _loc9_.ioMembershipFlag = this._receivedFrame.getBooleanFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__IO_MANUFACTURER_ID:
                              _loc9_.ioManufacturerId = this._receivedFrame.getByteFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__POWER_SAVE_MODE:
                              _loc9_.powerSaveMode = this._receivedFrame.getByteFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__RF_SUPPORT_IN_NODE:
                              _loc9_.rfSupportInNode = this._receivedFrame.getBooleanFromData();
                              break;
                           case Actuator.ACTUATOR_FIELD_ID__SLAVE_TIMECLASS:
                              _loc9_.slaveTimeClass = this._receivedFrame.getByteFromData();
                              break;
                           default:
                              _loc4_ = 0;
                              while(_loc4_ < _loc8_)
                              {
                                 this._receivedFrame.getByteFromData();
                                 _loc4_++;
                              }
                              break;
                        }
                     }
                     _loc9_.keyState = Actuator.KEY_STATE__CURRENT_KEY_IS_NOT_OLD;
                     _loc9_.name = "";
                     this._newPairedActuatorCallback(_loc9_);
                  }
                  else if(this._receivedFrame.CommandData[ioService.applicationProxy.ProxyFrame.UC_STATUS__INTERMEDIATE_DATA_TYPE_POSITION] == ioService.applicationProxy.ProxyFrame.UC_STATUS__INTERMEDIATE_DATA_BEACON)
                  {
                     _loc10_ = new Beacon();
                     this._receivedFrame.CommandData.position = ioService.applicationProxy.ProxyFrame.UC_STATUS__INTERMEDIATE_DATA_POSITION;
                     while((_loc7_ = this._receivedFrame.getByteFromData()) != Synchronizer.SYNC_OBJ__NONE)
                     {
                        _loc8_ = this._receivedFrame.getByteFromData();
                        switch(_loc7_)
                        {
                           case Beacon.BEACON_FIELD_ID__IO_ADDRESS:
                              _loc10_.ioAddress = this._receivedFrame.getIoAddressFromData();
                              break;
                           case Beacon.BEACON_FIELD_ID__IO_BACKBONE_ADDRESS:
                              _loc10_.ioBackBoneAddress = this._receivedFrame.getIoAddressFromData();
                              break;
                           case Beacon.BEACON_FIELD_ID__IO_MEMBERSHIP_FLAG:
                              _loc10_.ioMembershipFlag = this._receivedFrame.getBooleanFromData();
                              break;
                           case Beacon.BEACON_FIELD_ID__IO_MANUFACTURER_ID:
                              _loc10_.ioManufacturerId = this._receivedFrame.getByteFromData();
                              break;
                           case Beacon.BEACON_FIELD_ID__POWER_SAVE_MODE:
                              _loc10_.powerSaveMode = this._receivedFrame.getByteFromData();
                              break;
                           case Beacon.BEACON_FIELD_ID__RF_SUPPORT_IN_NODE:
                              _loc10_.rfSupportInNode = this._receivedFrame.getBooleanFromData();
                              break;
                           case Beacon.BEACON_FIELD_ID__SLAVE_TIMECLASS:
                              _loc10_.slaveTimeClass = this._receivedFrame.getByteFromData();
                              break;
                           default:
                              _loc4_ = 0;
                              while(_loc4_ < _loc8_)
                              {
                                 this._receivedFrame.getByteFromData();
                                 _loc4_++;
                              }
                              break;
                        }
                     }
                     this._newPairedBeaconCallback(_loc10_);
                  }
               }
               else
               {
                  if(this._receivedFrame.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM)
                  {
                     _loc2_ = new Fault(ErrorCodes.ERROR_PAIR_EQUIPMENT_IN_SYSTEM,"","");
                  }
                  else if(this._receivedFrame.CommandId == ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_NEW_EQUIPMENT)
                  {
                     _loc2_ = new Fault(ErrorCodes.ERROR_PAIR_NEW_EQUIPMENT,"","");
                  }
                  else
                  {
                     _loc2_ = new Fault(ErrorCodes.ERROR_PAIR_EQUIPMENT_STIMULATED_BY_1W_CONTROLLER,"","");
                  }
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
                  this._eState = USE_CASE_HANDLER_STATE__IDLE;
               }
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_ACTUATOR_NAME:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR)
               {
                  if(this._receivedFrame.CommandData[this._receivedFrame.CommandData.position] == 0)
                  {
                     ++this._receivedFrame.CommandData.position;
                     this._currentActuator.name = this._receivedFrame.getStringFromData(SIZE_OF_ACTUATOR_NAME - 1);
                  }
                  else
                  {
                     this._currentActuator.name = this._receivedFrame.getStringFromData(SIZE_OF_ACTUATOR_NAME);
                  }
                  this.removeErrorCallback();
                  this._actuatorNameCallback(this._currentActuator,this._currentActuator.name);
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_GET_ACTUATOR_NAME,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__SET_ACTUATOR_NAME:
               if(this._receivedFrame.CommandData.readUnsignedByte() == ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR)
               {
                  this.removeErrorCallback();
                  this._actuatorNameCallback(this._currentActuator);
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_RENAME_ACTUATOR,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_ACTUATOR_POSITION:
               _loc5_ = new Situation();
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR)
               {
                  _loc11_ = this._receivedFrame.getIoAddressFromData();
                  if(this._currentActuator.ioAddress == _loc11_)
                  {
                     _loc12_ = new ByteArray();
                     _loc5_.actuator = this._currentActuator;
                     _loc12_.writeByte(this._receivedFrame.getByteFromData());
                     _loc12_.writeByte(this._receivedFrame.getByteFromData());
                     _loc12_.writeByte(this._receivedFrame.getByteFromData());
                     _loc5_.SetIoPosition(_loc12_);
                     this.removeErrorCallback();
                     this._actuatorPositionCallback(_loc5_);
                  }
                  else
                  {
                     _loc2_ = new Fault(ErrorCodes.ERROR_GET_ACTUATOR_POSITION,"","");
                     _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                     this.callErrorCallback(_loc3_);
                  }
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_GET_ACTUATOR_POSITION,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_THIS_SCENARIO:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR)
               {
                  this.removeErrorCallback();
                  this._testScenarioCallback();
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_TEST_SCENARIO,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__IDENTIFY_ACTUATOR:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR)
               {
                  this.removeErrorCallback();
                  this._identifyActuatorCallback(this._currentActuator);
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_IDENTIFY_ACTUATOR,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
               break;
            case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__RESTORE_FACTORY_SETTINGS:
               if(this._receivedFrame.getByteFromData() == ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR)
               {
                  this.removeErrorCallback();
                  this._restoreFactorySettingsCallback(this._restoredDevice);
               }
               else
               {
                  _loc2_ = new Fault(ErrorCodes.ERROR_RESET_SKITTER,"","");
                  _loc3_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc2_);
                  this.callErrorCallback(_loc3_);
               }
               this._eState = USE_CASE_HANDLER_STATE__IDLE;
         }
      }
      
      public function testScenario(param1:int, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._testScenarioCallback = param2;
         this._errorCallback = param3;
         _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__START_THIS_SCENARIO;
         _loc4_.addShortToData(2);
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc4_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function pairNewEquipment(param1:int, param2:Function = null, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._newPairedActuatorCallback = param2;
         this._newPairedBeaconCallback = param3;
         this._pairingEndCallback = param4;
         this._errorCallback = param5;
         _loc6_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc6_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc6_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc6_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_NEW_EQUIPMENT;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc6_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      private function removeErrorCallback() : void
      {
         this._errorCallback = null;
      }
      
      public function getKeyFrom2WController(param1:int, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._newSystemKeyCallback = param2;
         this._errorCallback = param3;
         _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GET_2W_KEY_FROM_CONTROLLER;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc4_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function detectConnectedDevices() : void
      {
         var _loc1_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         _loc1_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc1_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc1_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__SERVICE;
         _loc1_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_SERVICE_ID__GIVE_CONNECTED_DEVICES;
         this._commGW.SendProxyFrame(0,_loc1_);
      }
      
      public function restoreFactorySettings(param1:Device, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._restoredDevice = param1;
         this._restoreFactorySettingsCallback = param2;
         this._errorCallback = param3;
         _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__RESTORE_FACTORY_SETTINGS;
         this._comport = parseInt(param1.virtualComPort);
         this._commGW.SendProxyFrame(this._comport,_loc4_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function UseCaseStatusFrameReceived(param1:int, param2:ioService.applicationProxy.ProxyFrame) : void
      {
         var _loc3_:Fault = null;
         var _loc4_:FaultEvent = null;
         var _loc5_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         if(this._eState == USE_CASE_HANDLER_STATE__WAITING_FOR_STATUS)
         {
            DebugTrace.Tracer("Send Use Case Status Ack OK");
            _loc5_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
            _loc5_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__UC_STATUS_ACK;
            _loc5_.CommandId = param2.CommandId;
            _loc5_.ErrorStatus = ioService.applicationProxy.ProxyFrame.ERROR_STATUS__NO_ERROR;
            this._commGW.SendProxyFrame(param1,_loc5_);
            this._receivedFrame = param2;
            switch(param2.CommandId)
            {
               case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM:
               case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_NEW_EQUIPMENT:
               case ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__PAIR_EQUIPMENT_STIMULATED_BY_1W:
                  if(param2.CommandData[ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_POSITION] == ioService.applicationProxy.ProxyFrame.UC_STATUS__STATUS_INTERMEDIATE)
                  {
                     this.AsyncUseCaseStatusFrameReceived(null);
                  }
                  else
                  {
                     this._AsyncUseCaseStatusTimer.start();
                  }
                  break;
               default:
                  this._AsyncUseCaseStatusTimer.start();
            }
         }
         else
         {
            _loc3_ = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            _loc4_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc3_);
            this.callErrorCallback(_loc4_);
            this._eState = USE_CASE_HANDLER_STATE__IDLE;
         }
      }
      
      public function generateNewKey(param1:int, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._newSystemKeyCallback = param2;
         this._errorCallback = param3;
         _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GENERATE_NEW_KEY;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc4_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
      
      public function giveKeyToAnother2WController(param1:int, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:ioService.applicationProxy.ProxyFrame = new ioService.applicationProxy.ProxyFrame();
         this._giveKeyCallback = param2;
         this._errorCallback = param3;
         _loc4_.Encryption = ioService.applicationProxy.ProxyFrame.ENCRYPTION__NO;
         _loc4_.DataFormat = ioService.applicationProxy.ProxyFrame.DATA_FORMAT__BINARY;
         _loc4_.CommandType = ioService.applicationProxy.ProxyFrame.COMMAND_TYPE__START_UC;
         _loc4_.CommandId = ioService.applicationProxy.ProxyFrame.COMMAND_UC_ID__GIVE_KEY_TO_ANOTHER_2W_CONTROLLER;
         this._comport = param1;
         this._commGW.SendProxyFrame(param1,_loc4_);
         this._eState = USE_CASE_HANDLER_STATE__WAITING_FOR_START_ACK;
      }
   }
}
