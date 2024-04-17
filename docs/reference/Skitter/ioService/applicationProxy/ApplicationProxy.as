package ioService.applicationProxy
{
   import flash.utils.setTimeout;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Device;
   import ioService.datamodel.Skitter;
   import mx.collections.ArrayCollection;
   import mx.rpc.Fault;
   import mx.rpc.events.FaultEvent;
   
   public class ApplicationProxy
   {
       
      
      private var _synchronizer:ioService.applicationProxy.Synchronizer;
      
      private var _upgradeProgressionCallback:Function;
      
      private var _errorCallBack:Function;
      
      private var _newDisconnectedDeviceCB:Function;
      
      private var _useCaseHandler:ioService.applicationProxy.UseCaseHandler;
      
      private var _windowsServiceManager:ioService.applicationProxy.WindowsServiceManager;
      
      private var _commGW:ioService.applicationProxy.CommunicationGateway;
      
      private var _endWriteCallBack:Function;
      
      private var _TmpDevice:Device;
      
      private var _FirmwareUpgrader:Device;
      
      private var _errorUpgradeCallback:Function;
      
      private var _upgrader:ioService.applicationProxy.Upgrader;
      
      private var _endUpgradeCallback:Function;
      
      private var _SystemDescription:XML;
      
      private var _endOfUseCaseCallBack:Function;
      
      private var _statusIsFinishedCB:Function;
      
      private var _synchronizeSkitterCallback:Function;
      
      private var _endReadCallBack:Function;
      
      private var _devicesToSynchronize:ArrayCollection;
      
      private var _synchronizeErrorCallback:Function;
      
      private var _newConnectedDeviceCB:Function;
      
      public function ApplicationProxy()
      {
         this._commGW = new ioService.applicationProxy.CommunicationGateway();
         this._synchronizer = new ioService.applicationProxy.Synchronizer(this._commGW);
         this._useCaseHandler = new ioService.applicationProxy.UseCaseHandler(this._commGW);
         this._upgrader = new ioService.applicationProxy.Upgrader(this._commGW);
         this._windowsServiceManager = new ioService.applicationProxy.WindowsServiceManager(this._commGW);
         this._devicesToSynchronize = new ArrayCollection();
         super();
         this._commGW.SetupCallBacks(this.proxyFrameReceived,null);
      }
      
      public function upgradeSkitter(param1:Skitter, param2:Function = null, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:Fault = null;
         var _loc6_:FaultEvent = null;
         if(this._upgrader.doYouHaveUpgradeInProgress() == false)
         {
            this._endUpgradeCallback = param2;
            this._upgradeProgressionCallback = param3;
            this._errorUpgradeCallback = param4;
            this._upgradeProgressionCallback(0);
            this._useCaseHandler.startBootLoader(parseInt(param1.virtualComPort));
         }
         else
         {
            _loc5_ = new Fault(ErrorCodes.ERROR_UPGRADE_ALREADY_IN_PROGRESS,"","");
            _loc6_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc5_);
            setTimeout(this._errorUpgradeCallback,1,_loc6_);
         }
      }
      
      private function readErrorCallBack() : void
      {
      }
      
      public function get windowsServiceManager() : ioService.applicationProxy.WindowsServiceManager
      {
         return this._windowsServiceManager;
      }
      
      private function proxyFrameReceived(param1:int, param2:ProxyFrame) : void
      {
         if(param2.CommandType == ProxyFrame.COMMAND_TYPE__SERVICE_ACK)
         {
            this._windowsServiceManager.AckProxyFrameReceived(param2);
         }
         else if(param2.CommandType == ProxyFrame.COMMAND_TYPE__SERVICE_STATUS)
         {
            this._windowsServiceManager.StatusProxyFrameReceived(param2);
         }
         else if(param2.CommandType == ProxyFrame.COMMAND_TYPE__SYNCHRONIZATION_ACK)
         {
            this._synchronizer.proxyFrameReceived(param2);
         }
         else if(param2.CommandType == ProxyFrame.COMMAND_TYPE__START_UC_ACK)
         {
            this._useCaseHandler.StartUseCaseAckFrameReceived(param1,param2);
         }
         else if(param2.CommandType == ProxyFrame.COMMAND_TYPE__UC_STATUS)
         {
            this._useCaseHandler.UseCaseStatusFrameReceived(param1,param2);
         }
         else if(param2.CommandType == ProxyFrame.COMMAND_TYPE__BOOT_LOADER_ACK)
         {
            this._upgrader.acknowledgeFrameReceived(param2);
         }
      }
      
      private function endReadSystemCallBack(param1:XMLDocument) : void
      {
         this._newConnectedDeviceCB(param1);
         if(this._devicesToSynchronize != null)
         {
            if(this.synchronizeRemainingDevices() == false)
            {
               this._windowsServiceManager.startDeviceConnectionPolling();
               this._statusIsFinishedCB();
            }
         }
      }
      
      public function get synchronizer() : ioService.applicationProxy.Synchronizer
      {
         return this._synchronizer;
      }
      
      private function startIsFinished() : void
      {
         if(this.synchronizeRemainingDevices() == false)
         {
            this._windowsServiceManager.startDeviceConnectionPolling();
            this._statusIsFinishedCB();
         }
      }
      
      private function newDisconnectedDevice(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:XMLDocument = null;
         var _loc5_:XMLNode = null;
         (_loc5_ = (_loc4_ = new XMLDocument()).createElement("system")).attributes.comport = param1;
         _loc5_.attributes.vid = param2;
         _loc5_.attributes.pid = param3;
         _loc4_.appendChild(_loc5_);
         if(this._FirmwareUpgrader != null)
         {
            if(this._FirmwareUpgrader.virtualComPort == param1.toString())
            {
               this._upgrader.BootLoaderHasShutdown(this._FirmwareUpgrader);
               this._FirmwareUpgrader = null;
            }
         }
         else
         {
            this._newDisconnectedDeviceCB(_loc4_);
         }
      }
      
      public function synchronizeSkitter(param1:Skitter, param2:XMLDocument, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:Fault = null;
         var _loc6_:FaultEvent = null;
         this._errorCallBack = param4;
         if(this._synchronizer.WriteDataToDevice(parseInt(param1.virtualComPort),param2,param3,this.synchronizeSkitterError) == false)
         {
            _loc5_ = new Fault(ErrorCodes.ERROR_SYNCHRONISE_SKITTER,"","");
            _loc6_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc5_);
            setTimeout(param4,1,_loc6_);
         }
      }
      
      public function get upgrader() : ioService.applicationProxy.Upgrader
      {
         return this._upgrader;
      }
      
      private function synchronizeSkitterError() : void
      {
         var _loc1_:Fault = null;
         var _loc2_:FaultEvent = null;
         _loc1_ = new Fault(ErrorCodes.ERROR_SYNCHRONISE_SKITTER,"","");
         _loc2_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc1_);
         setTimeout(this._errorCallBack,1,_loc2_);
      }
      
      public function start(param1:Function, param2:Function, param3:Function) : void
      {
         this._statusIsFinishedCB = param1;
         this._newConnectedDeviceCB = param2;
         this._newDisconnectedDeviceCB = param3;
         this._windowsServiceManager.setupCallBacks(this.startIsFinished,this.newConnectedDevice,this.newDisconnectedDevice);
         this._windowsServiceManager.startConnection();
      }
      
      public function get useCaseHandler() : ioService.applicationProxy.UseCaseHandler
      {
         return this._useCaseHandler;
      }
      
      private function synchronizeRemainingDevices() : Boolean
      {
         var _loc1_:XMLDocument = null;
         var _loc2_:int = 0;
         if(this._devicesToSynchronize != null && this._devicesToSynchronize.length > 0)
         {
            _loc1_ = this._devicesToSynchronize[0];
            _loc2_ = int(_loc1_.firstChild.attributes.comport);
            this._synchronizer.ReadDataFromDevice(_loc2_,_loc1_,this.endReadSystemCallBack,this.readErrorCallBack);
            this._devicesToSynchronize.removeItemAt(0);
            return true;
         }
         this._devicesToSynchronize = null;
         return false;
      }
      
      private function newConnectedDevice(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:XMLDocument = null;
         var _loc5_:XMLNode = null;
         (_loc5_ = (_loc4_ = new XMLDocument()).createElement("system")).attributes.comport = param1;
         _loc5_.attributes.vid = param2;
         _loc5_.attributes.pid = param3;
         _loc4_.appendChild(_loc5_);
         if(param2 == ioService.applicationProxy.WindowsServiceManager.USB__SOMFY_VID && param3 == ioService.applicationProxy.WindowsServiceManager.USB__SOMFY_SKITTER_PID)
         {
            if(this._windowsServiceManager.isStarted() == true)
            {
               this._synchronizer.ReadDataFromDevice(param1,_loc4_,this.endReadSystemCallBack,this.readErrorCallBack);
            }
            else
            {
               this._devicesToSynchronize.addItem(_loc4_);
            }
         }
         else if(param2 == ioService.applicationProxy.WindowsServiceManager.USB__SOMFY_VID && param3 == ioService.applicationProxy.WindowsServiceManager.USB__SOMFY_BOOTLOADER_PID)
         {
            this._FirmwareUpgrader = new Device();
            this._FirmwareUpgrader.virtualComPort = param1.toString();
            this._upgrader.BootLoaderIsReady(this._FirmwareUpgrader);
         }
      }
   }
}
