package com.scenarioLauncher.managers
{
   import com.keepcore.KCAirUpdater;
   import com.keepcore.KCAirUpdaterEvent;
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.views.UpdateUI;
   import flash.desktop.NativeApplication;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import ioService.datamodel.Device;
   
   public class UpdaterManager
   {
      
      private static var _singleton:com.scenarioLauncher.managers.UpdaterManager;
       
      
      public const DEVICE_FIRMWARE_FOLDER:String = File.applicationDirectory.nativePath + "/firmware/skitter/";
      
      private const UPDATE:String = "SkitEasyUpdate";
      
      public var ioServiceStarted:Boolean = false;
      
      private const UPDATE_REQUIRED:String = "SkitEasyUpdateRequired";
      
      private var updater:KCAirUpdater;
      
      private var connectTest:URLLoader;
      
      private var checkToPerform:String;
      
      public function UpdaterManager(param1:Class)
      {
         super();
         if(param1 != SingletonLock)
         {
            throw new Error("Invalid Singleton access.  Use DebugPreferences.instance.");
         }
      }
      
      public static function get instance() : com.scenarioLauncher.managers.UpdaterManager
      {
         if(_singleton == null)
         {
            _singleton = new com.scenarioLauncher.managers.UpdaterManager(SingletonLock);
         }
         return _singleton;
      }
      
      public static function getAppVersion() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::version[0];
      }
      
      public function isDeviceUpdateAvailable(param1:Device) : Boolean
      {
         var _loc3_:File = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = false;
         if(param1 != null)
         {
            _loc3_ = this.getFirmwareFile(param1);
            if(_loc3_ != null)
            {
               _loc4_ = parseInt(_loc3_.name.substr(8,4));
               _loc5_ = parseInt(param1.sw_version.substr(8,4));
               _loc2_ = _loc4_ > _loc5_;
            }
         }
         return _loc2_;
      }
      
      private function checkNetworkConnection(param1:Event = null) : void
      {
         var _loc2_:URLRequest = new URLRequest();
         _loc2_.method = "HEAD";
         _loc2_.url = Globals.URL_UPDATE_SKIT_EASY;
         this.connectTest = new URLLoader(_loc2_);
         this.connectTest.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.connectHttpStatusHandler);
         this.connectTest.addEventListener(Event.COMPLETE,this.connectCompleteHandler);
         this.connectTest.addEventListener(IOErrorEvent.IO_ERROR,this.connectErrorHandler);
      }
      
      private function onKCAirUpdaterEventDownloadComplete(param1:KCAirUpdaterEvent) : void
      {
         CookieManager.instance.skiteasyUpdateSuccess = true;
         CookieManager.instance.save();
      }
      
      private function connectHttpStatusHandler(param1:* = null) : void
      {
         if(param1.status == "0" ? (Globals.NET_CONNECTED = false) : (Globals.NET_CONNECTED = true))
         {
         }
      }
      
      private function connectCompleteHandler(param1:Event) : void
      {
         if(NativeApplication.nativeApplication.hasEventListener(Event.NETWORK_CHANGE))
         {
            NativeApplication.nativeApplication.removeEventListener(Event.NETWORK_CHANGE,this.checkNetworkConnection);
         }
         Globals.NET_CONNECTED = true;
         KCTimeAnalyzer.Tracer("V : " + getAppVersion(),0);
         if(this.checkToPerform == this.UPDATE)
         {
            this.updater = new KCAirUpdater();
            if(!this.ioServiceStarted)
            {
               this.updater.noUpdateAvailableEverDispatch = false;
            }
            else
            {
               this.updater.noUpdateAvailableEverDispatch = true;
            }
            this.updater.addEventListener(KCAirUpdaterEvent.READY_TO_DOWNLOAD_UPDATE,this.onKCAirUpdaterEventReadyToDownloadUpdate);
            this.updater.addEventListener(KCAirUpdaterEvent.DOWNLOAD_COMPLETE,this.onKCAirUpdaterEventDownloadComplete);
            this.updater.addEventListener(KCAirUpdaterEvent.ERROR_OCCURED,this.onKCAirUpdaterEventErrorOccured);
            this.updater.addEventListener(KCAirUpdaterEvent.NO_UPDATE_AVAILABLE,this.onKCAirUpdaterEventNoUpdateAvailable);
            this.updater.checkNow();
         }
         else if(this.checkToPerform == this.UPDATE_REQUIRED)
         {
            this.updater = new KCAirUpdater();
            if(!this.ioServiceStarted)
            {
               this.updater.noUpdateAvailableEverDispatch = false;
            }
            else
            {
               this.updater.noUpdateAvailableEverDispatch = true;
            }
            this.updater.addEventListener(KCAirUpdaterEvent.READY_TO_DOWNLOAD_UPDATE,this.onKCAirUpdaterEventReadyToDownloadUpdateRequired);
            this.updater.addEventListener(KCAirUpdaterEvent.DOWNLOAD_COMPLETE,this.onKCAirUpdaterEventDownloadComplete);
            this.updater.addEventListener(KCAirUpdaterEvent.ERROR_OCCURED,this.onKCAirUpdaterEventErrorOccured);
            this.updater.addEventListener(KCAirUpdaterEvent.NO_UPDATE_AVAILABLE,this.onKCAirUpdaterEventNoUpdateAvailable);
            this.updater.checkNow();
         }
      }
      
      public function updateRequired() : void
      {
         this.destroy();
         NativeApplication.nativeApplication.addEventListener(Event.NETWORK_CHANGE,this.checkNetworkConnection);
         this.checkNetworkConnection();
         this.checkToPerform = this.UPDATE_REQUIRED;
      }
      
      public function checkForUpdate() : void
      {
         this.destroy();
         NativeApplication.nativeApplication.addEventListener(Event.NETWORK_CHANGE,this.checkNetworkConnection);
         this.checkNetworkConnection();
         this.checkToPerform = this.UPDATE;
      }
      
      public function getFirmwareFile(param1:Device) : File
      {
         var _loc6_:Array = null;
         var _loc7_:* = null;
         var _loc2_:File = null;
         var _loc3_:* = this.DEVICE_FIRMWARE_FOLDER + param1.hw_version + "/";
         var _loc4_:File = new File(_loc3_);
         var _loc5_:RegExp = /[0-9]+/;
         if(Boolean(_loc4_.isDirectory) && Boolean(_loc4_.exists))
         {
            _loc6_ = _loc4_.getDirectoryListing();
            for each(_loc7_ in _loc6_)
            {
               if(!_loc7_.isDirectory)
               {
                  if(_loc5_.test(_loc7_.name) && _loc7_.extension.toLocaleLowerCase() == "seb")
                  {
                     _loc2_ = _loc7_;
                     break;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function onKCAirUpdaterEventErrorOccured(param1:KCAirUpdaterEvent) : void
      {
         var _loc2_:UpdateUI = new UpdateUI();
         _loc2_.isSkitEasyUpdateFailed = true;
         KCPopupManager.singleton.displayPopup(_loc2_);
         CookieManager.instance.skiteasyUpdateSuccess = false;
         CookieManager.instance.skiteasyUpdateRequired = true;
         CookieManager.instance.save();
      }
      
      private function onKCAirUpdaterEventNoUpdateAvailable(param1:KCAirUpdaterEvent) : void
      {
         ServerCommunicationManager.instance.startIoServiceLayer();
      }
      
      private function onKCAirUpdaterEventReadyToDownloadUpdate(param1:KCAirUpdaterEvent) : void
      {
         var _loc2_:UpdateUI = new UpdateUI();
         _loc2_.skitEasyValidateUpdateFunction = this.updater.downloadUpdate;
         this.updater.progressFunction = _loc2_.skitEasyUpdateProgressBarSetProgress;
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      private function connectErrorHandler(param1:IOErrorEvent) : void
      {
         Globals.NET_CONNECTED = false;
         ServerCommunicationManager.instance.startIoServiceLayer();
      }
      
      private function onKCAirUpdaterEventReadyToDownloadUpdateRequired(param1:KCAirUpdaterEvent) : void
      {
         CookieManager.instance.skiteasyUpdateRequired = false;
         CookieManager.instance.save();
         var _loc2_:UpdateUI = new UpdateUI();
         _loc2_.isSkitEasyUpdateRequired = true;
         _loc2_.skitEasyValidateUpdateFunction = this.updater.downloadUpdate;
         this.updater.progressFunction = _loc2_.skitEasyUpdateProgressBarSetProgress;
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      public function isSkiteasyUpdateRequired(param1:Device) : Boolean
      {
         var _loc3_:File = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = false;
         if(param1 != null)
         {
            _loc3_ = this.getFirmwareFile(param1);
            if(_loc3_ == null)
            {
               _loc2_ = true;
            }
            else
            {
               _loc4_ = parseInt(_loc3_.name.substr(8,4));
               _loc5_ = parseInt(param1.sw_version.substr(8,4));
               _loc2_ = _loc4_ < _loc5_;
            }
         }
         return _loc2_;
      }
      
      private function destroy() : void
      {
         NativeApplication.nativeApplication.removeEventListener(Event.NETWORK_CHANGE,this.checkNetworkConnection);
         if(this.updater != null)
         {
            this.updater.removeEventListener(KCAirUpdaterEvent.READY_TO_DOWNLOAD_UPDATE,this.onKCAirUpdaterEventReadyToDownloadUpdate);
            this.updater.removeEventListener(KCAirUpdaterEvent.DOWNLOAD_COMPLETE,this.onKCAirUpdaterEventDownloadComplete);
            this.updater.removeEventListener(KCAirUpdaterEvent.ERROR_OCCURED,this.onKCAirUpdaterEventErrorOccured);
            this.updater = null;
         }
         if(this.connectTest != null)
         {
            this.connectTest.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.connectHttpStatusHandler);
            this.connectTest.removeEventListener(Event.COMPLETE,this.connectCompleteHandler);
            this.connectTest.removeEventListener(IOErrorEvent.IO_ERROR,this.connectErrorHandler);
            this.connectTest = null;
         }
      }
   }
}

class SingletonLock
{
    
   
   public function SingletonLock()
   {
      super();
   }
}
