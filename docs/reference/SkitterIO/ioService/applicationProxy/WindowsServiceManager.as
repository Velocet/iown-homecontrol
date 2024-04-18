package ioService.applicationProxy
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import mx.collections.ArrayCollection;
   
   public class WindowsServiceManager
   {
      
      public static const USB__SOMFY_SKITTER_PID:String = "0032";
      
      public static const WINDOWS_SERVICE_CHANNEL:int = 0;
      
      private static const WINDOWS_SERVICE_MANAGER_STATE__IDLE:int = 0;
      
      public static const USB__SOMFY_BOOTLOADER_PID:String = "0000";
      
      private static const WINDOWS_SERVICE_MANAGER_STATE__INIT_IN_PROGRESS:int = 1;
      
      public static const USB__SOMFY_VID:String = "22b3";
      
      private static const WINDOWS_SERVICE_MANAGER_STATE__POLLING_IN_PROGRESS:int = 4;
      
      private static const WINDOWS_SERVICE_MANAGER_STATE__WAITING_FOR_POLLING_EVENT:int = 3;
       
      
      private var _PollingTimer:Timer;
      
      private var _eState:int = 0;
      
      private var _newDisconnectedDeviceCB:Function;
      
      private var _TempConnectedProducts:ArrayCollection;
      
      private var _commGW:ioService.applicationProxy.CommunicationGateway;
      
      private var _SubscriptionIndex:int;
      
      private var _endCallBack:Function;
      
      private var _ConnectedProducts:ArrayCollection;
      
      private var _endStatusCallBack:Function;
      
      private var _XmlSystemDescription:XMLDocument = null;
      
      private var _Version:String;
      
      private var _newConnectedDeviceCB:Function;
      
      private var _ProductsToBeManaged:ArrayCollection;
      
      public function WindowsServiceManager(param1:ioService.applicationProxy.CommunicationGateway)
      {
         this._Version = new String();
         this._ProductsToBeManaged = new ArrayCollection();
         this._ConnectedProducts = new ArrayCollection();
         this._TempConnectedProducts = new ArrayCollection();
         this._PollingTimer = new Timer(2000,1);
         super();
         this._commGW = param1;
         this._PollingTimer.addEventListener(TimerEvent.TIMER,this.PollingTimerElapsed);
      }
      
      private function giveConnectedDevices() : void
      {
         var _loc1_:ProxyFrame = new ProxyFrame();
         this._TempConnectedProducts.removeAll();
         _loc1_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc1_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc1_.CommandType = ProxyFrame.COMMAND_TYPE__SERVICE;
         _loc1_.CommandId = ProxyFrame.COMMAND_SERVICE_ID__GIVE_CONNECTED_DEVICES;
         this._commGW.SendProxyFrame(ioService.applicationProxy.CommunicationGateway.CHANNEL__WINDOWS_SERVICE,_loc1_);
      }
      
      public function startDeviceConnectionPolling() : void
      {
         this._PollingTimer.start();
      }
      
      private function getWindowsServiceVersion(param1:Function) : void
      {
         var _loc2_:ProxyFrame = new ProxyFrame();
         this._endCallBack = param1;
         _loc2_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc2_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc2_.CommandType = ProxyFrame.COMMAND_TYPE__SERVICE;
         _loc2_.CommandId = ProxyFrame.COMMAND_SERVICE_ID__GIVE_VERSION;
         this._commGW.SendProxyFrame(ioService.applicationProxy.CommunicationGateway.CHANNEL__WINDOWS_SERVICE,_loc2_);
      }
      
      public function get version() : String
      {
         return this._Version;
      }
      
      public function StatusProxyFrameReceived(param1:ProxyFrame) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:* = null;
         var _loc6_:String = null;
         var _loc8_:Array = null;
         var _loc7_:ProxyFrame = new ProxyFrame();
         if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__INIT_IN_PROGRESS || this._eState == WINDOWS_SERVICE_MANAGER_STATE__POLLING_IN_PROGRESS)
         {
            _loc7_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
            _loc7_.CommandType = ProxyFrame.COMMAND_TYPE__SERVICE_STATUS_ACK;
            _loc7_.CommandId = param1.CommandId;
            _loc7_.ErrorStatus = ProxyFrame.ERROR_STATUS__NO_ERROR;
            this._commGW.SendProxyFrame(ioService.applicationProxy.CommunicationGateway.CHANNEL__WINDOWS_SERVICE,_loc7_);
         }
         else
         {
            _loc7_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
            _loc7_.CommandType = ProxyFrame.COMMAND_TYPE__SERVICE_STATUS_ACK;
            _loc7_.CommandId = param1.CommandId;
            _loc7_.ErrorStatus = ProxyFrame.ERROR_STATUS__ERROR;
            this._commGW.SendProxyFrame(ioService.applicationProxy.CommunicationGateway.CHANNEL__WINDOWS_SERVICE,_loc7_);
         }
         if(param1.CommandId == ProxyFrame.COMMAND_SERVICE_STATUS_ID__DEVICE_CONNECTED)
         {
            param1.CommandData.position = 0;
            _loc2_ = param1.getByteFromData();
            _loc3_ = param1.getStringFromData(4);
            _loc4_ = param1.getStringFromData(4);
            if(this._ProductsToBeManaged.contains(_loc3_ + ":" + _loc4_))
            {
               if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__INIT_IN_PROGRESS || this._eState == WINDOWS_SERVICE_MANAGER_STATE__POLLING_IN_PROGRESS)
               {
                  _loc6_ = new String();
                  _loc6_ = _loc2_ + ":" + _loc3_ + ":" + _loc4_;
                  this._TempConnectedProducts.addItem(_loc6_);
               }
            }
         }
         else if(param1.CommandId == ProxyFrame.COMMAND_SERVICE_STATUS_ID__DEVICES_DETECTION_FINISHED)
         {
            for each(_loc6_ in this._ConnectedProducts)
            {
               if(this._TempConnectedProducts.contains(_loc6_) == false)
               {
                  if(this._newDisconnectedDeviceCB != null)
                  {
                     _loc8_ = _loc6_.split(":");
                     this._newDisconnectedDeviceCB(_loc8_[0],_loc8_[1],_loc8_[2]);
                  }
                  this._ConnectedProducts.removeItemAt(this._ConnectedProducts.getItemIndex(_loc6_));
               }
            }
            for each(_loc6_ in this._TempConnectedProducts)
            {
               if(this._ConnectedProducts.contains(_loc6_) == false)
               {
                  if(this._newConnectedDeviceCB != null)
                  {
                     _loc8_ = _loc6_.split(":");
                     this._newConnectedDeviceCB(_loc8_[0],_loc8_[1],_loc8_[2]);
                  }
                  this._ConnectedProducts.addItem(_loc6_);
               }
            }
            if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__INIT_IN_PROGRESS)
            {
               if(this._endStatusCallBack != null)
               {
                  this._endStatusCallBack();
               }
               this._PollingTimer.start();
               this._eState = WINDOWS_SERVICE_MANAGER_STATE__WAITING_FOR_POLLING_EVENT;
            }
            else if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__POLLING_IN_PROGRESS)
            {
               this._PollingTimer.start();
               this._eState = WINDOWS_SERVICE_MANAGER_STATE__WAITING_FOR_POLLING_EVENT;
            }
         }
      }
      
      private function sendSubcription() : void
      {
         if(this._SubscriptionIndex == 0)
         {
            this.subscribeDeviceDetection(USB__SOMFY_VID,USB__SOMFY_SKITTER_PID,"Somfy Skitter",this.sendSubcription);
         }
         else if(this._SubscriptionIndex == 1)
         {
            this.subscribeDeviceDetection(USB__SOMFY_VID,USB__SOMFY_BOOTLOADER_PID,"Somfy Firmware Upgrader",this.sendSubcription);
         }
         else
         {
            this.giveConnectedDevices();
         }
         ++this._SubscriptionIndex;
      }
      
      public function startConnection() : void
      {
         if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__IDLE)
         {
            this.getWindowsServiceVersion(this.sendSubcription);
            this._SubscriptionIndex = 0;
            this._eState = WINDOWS_SERVICE_MANAGER_STATE__INIT_IN_PROGRESS;
         }
      }
      
      private function subscribeDeviceDetection(param1:String, param2:String, param3:String, param4:Function) : void
      {
         var _loc6_:String = null;
         var _loc5_:ProxyFrame = new ProxyFrame();
         _loc6_ = new String(param1 + ":" + param2);
         this._ProductsToBeManaged.addItem(_loc6_);
         this._endCallBack = param4;
         _loc5_.Encryption = ProxyFrame.ENCRYPTION__NO;
         _loc5_.DataFormat = ProxyFrame.DATA_FORMAT__BINARY;
         _loc5_.CommandType = ProxyFrame.COMMAND_TYPE__SERVICE;
         _loc5_.CommandId = ProxyFrame.COMMAND_SERVICE_ID__SUBSCRIBE_PRODUCT;
         _loc5_.addStringToData(param1,4);
         _loc5_.addStringToData(param2,4);
         _loc5_.addStringToData(param3,param3.length);
         this._commGW.SendProxyFrame(ioService.applicationProxy.CommunicationGateway.CHANNEL__WINDOWS_SERVICE,_loc5_);
      }
      
      private function PollingTimerElapsed(param1:Event) : void
      {
         if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__WAITING_FOR_POLLING_EVENT)
         {
            this._eState = WINDOWS_SERVICE_MANAGER_STATE__POLLING_IN_PROGRESS;
            this.giveConnectedDevices();
         }
      }
      
      public function AckProxyFrameReceived(param1:ProxyFrame) : void
      {
         if(param1.CommandId == ProxyFrame.COMMAND_SERVICE_ID__GIVE_VERSION)
         {
            param1.CommandData.position = 1;
            this._Version = param1.getStringFromData(param1.CommandData.bytesAvailable - 2);
            this._endCallBack();
         }
         else if(param1.CommandId == ProxyFrame.COMMAND_SERVICE_ID__SUBSCRIBE_PRODUCT)
         {
            this._endCallBack();
         }
         else if(param1.CommandId == ProxyFrame.COMMAND_SERVICE_ID__GIVE_CONNECTED_DEVICES)
         {
         }
      }
      
      public function setupCallBacks(param1:Function, param2:Function, param3:Function) : void
      {
         this._newConnectedDeviceCB = param2;
         this._newDisconnectedDeviceCB = param3;
         this._endStatusCallBack = param1;
      }
      
      public function isStarted() : Boolean
      {
         if(this._eState == WINDOWS_SERVICE_MANAGER_STATE__WAITING_FOR_POLLING_EVENT || this._eState == WINDOWS_SERVICE_MANAGER_STATE__POLLING_IN_PROGRESS)
         {
            return true;
         }
         return false;
      }
   }
}
