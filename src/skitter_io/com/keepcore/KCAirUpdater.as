package com.keepcore
{
   import air.update.ApplicationUpdater;
   import air.update.events.DownloadErrorEvent;
   import air.update.events.StatusUpdateErrorEvent;
   import air.update.events.StatusUpdateEvent;
   import air.update.events.UpdateEvent;
   import flash.desktop.NativeApplication;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   
   public class KCAirUpdater extends EventDispatcher
   {
       
      
      private var _progressFunction:Function;
      
      private var isFirstRun:String;
      
      private var updateVersion:String;
      
      private var _noUpdateAvailableEverDispatch:Boolean = false;
      
      private var appUpdater:ApplicationUpdater;
      
      private var applicationName:String;
      
      private var description:String;
      
      private var isInstallPostponed:Boolean = false;
      
      private var installedVersion:String;
      
      public function KCAirUpdater()
      {
         super();
         this.initialize();
      }
      
      public function installLater(param1:Event) : void
      {
         this.isInstallPostponed = true;
      }
      
      private function destroy() : void
      {
         if(this.appUpdater != null)
         {
            this.appUpdater.removeEventListener(UpdateEvent.INITIALIZED,this.onUpdateEventInitializedHandler);
            this.appUpdater.removeEventListener(StatusUpdateEvent.UPDATE_STATUS,this.onStatusUpdateEventHandler);
            this.appUpdater.removeEventListener(StatusUpdateErrorEvent.UPDATE_ERROR,this.onStatusUpdateErrorEventHandler);
            this.appUpdater.removeEventListener(ErrorEvent.ERROR,this.onErrorEventHandler);
            this.appUpdater.removeEventListener(ProgressEvent.PROGRESS,this.onProgressEventProgress);
            this.appUpdater.removeEventListener(UpdateEvent.BEFORE_INSTALL,this.onUpdateEventBeforeInstall);
            this.appUpdater.removeEventListener(UpdateEvent.DOWNLOAD_START,this.onUpdateEventDownloadStarted);
            this.appUpdater.removeEventListener(UpdateEvent.DOWNLOAD_COMPLETE,this.onUpdateEventDownloadComplete);
            this.appUpdater.removeEventListener(DownloadErrorEvent.DOWNLOAD_ERROR,this.onDownloadErrorEventDownloadError);
            this.appUpdater = null;
         }
      }
      
      private function onUpdateEventDownloadComplete(param1:UpdateEvent) : void
      {
         param1.preventDefault();
         var _loc2_:KCAirUpdaterEvent = new KCAirUpdaterEvent(KCAirUpdaterEvent.DOWNLOAD_COMPLETE);
         dispatchEvent(_loc2_);
         this.installUpdate();
      }
      
      private function getUpdateReleaseNotes(param1:Array) : String
      {
         var _loc2_:String = "";
         var _loc3_:Number = 0;
         while(_loc3_ < param1[0].length)
         {
            _loc2_ += param1[0][_loc3_];
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onUpdateEventDownloadStarted(param1:UpdateEvent) : void
      {
      }
      
      private function installUpdate() : void
      {
         this.appUpdater.installUpdate();
      }
      
      private function getApplicationName() : String
      {
         var _loc1_:* = null;
         var _loc2_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc3_:Namespace = _loc2_.namespace();
         return String(_loc2_._loc3_::name);
      }
      
      private function onStatusUpdateErrorEventHandler(param1:StatusUpdateErrorEvent) : void
      {
         var _loc2_:KCAirUpdaterEvent = new KCAirUpdaterEvent(KCAirUpdaterEvent.ERROR_OCCURED);
         _loc2_.error = param1.text;
         dispatchEvent(_loc2_);
      }
      
      private function onDownloadErrorEventDownloadError(param1:DownloadErrorEvent) : void
      {
         param1.preventDefault();
         var _loc2_:KCAirUpdaterEvent = new KCAirUpdaterEvent(KCAirUpdaterEvent.ERROR_OCCURED);
         _loc2_.error = param1.toString();
         dispatchEvent(_loc2_);
      }
      
      private function initialize() : void
      {
         if(this.appUpdater == null)
         {
            this.appUpdater = new ApplicationUpdater();
            this.appUpdater.configurationFile = new File("app:/config/update.xml");
            this.appUpdater.addEventListener(UpdateEvent.INITIALIZED,this.onUpdateEventInitializedHandler);
            this.appUpdater.addEventListener(StatusUpdateEvent.UPDATE_STATUS,this.onStatusUpdateEventHandler);
            this.appUpdater.addEventListener(StatusUpdateErrorEvent.UPDATE_ERROR,this.onStatusUpdateErrorEventHandler);
            this.appUpdater.addEventListener(ErrorEvent.ERROR,this.onErrorEventHandler);
            this.appUpdater.addEventListener(ProgressEvent.PROGRESS,this.onProgressEventProgress);
            this.appUpdater.addEventListener(UpdateEvent.BEFORE_INSTALL,this.onUpdateEventBeforeInstall);
            this.appUpdater.addEventListener(UpdateEvent.DOWNLOAD_START,this.onUpdateEventDownloadStarted);
            this.appUpdater.addEventListener(UpdateEvent.DOWNLOAD_COMPLETE,this.onUpdateEventDownloadComplete);
            this.appUpdater.addEventListener(DownloadErrorEvent.DOWNLOAD_ERROR,this.onDownloadErrorEventDownloadError);
            this.appUpdater.initialize();
         }
      }
      
      public function set progressFunction(param1:Function) : void
      {
         this._progressFunction = param1;
      }
      
      private function onStatusUpdateEventHandler(param1:StatusUpdateEvent) : void
      {
         var _loc2_:KCAirUpdaterEvent = null;
         param1.preventDefault();
         if(param1.available)
         {
            this.description = this.getUpdateReleaseNotes(param1.details);
            this.updateVersion = param1.version;
            _loc2_ = new KCAirUpdaterEvent(KCAirUpdaterEvent.READY_TO_DOWNLOAD_UPDATE);
            _loc2_.releaseNotes = this.description;
            _loc2_.newVersion = this.updateVersion;
            _loc2_.currentVersion = this.installedVersion;
            _loc2_.applicationName = this.applicationName;
            dispatchEvent(_loc2_);
         }
         else if(!this.noUpdateAvailableEverDispatch)
         {
            _loc2_ = new KCAirUpdaterEvent(KCAirUpdaterEvent.NO_UPDATE_AVAILABLE);
            dispatchEvent(_loc2_);
         }
      }
      
      private function onProgressEventProgress(param1:ProgressEvent) : void
      {
         if(this.progressFunction != null)
         {
            this.progressFunction(param1.bytesLoaded,param1.bytesTotal);
         }
      }
      
      private function onErrorEventHandler(param1:ErrorEvent) : void
      {
         var _loc2_:KCAirUpdaterEvent = new KCAirUpdaterEvent(KCAirUpdaterEvent.ERROR_OCCURED);
         _loc2_.error = param1.text;
         dispatchEvent(_loc2_);
      }
      
      private function onUpdateEventBeforeInstall(param1:UpdateEvent) : void
      {
         if(this.isInstallPostponed)
         {
            param1.preventDefault();
            this.isInstallPostponed = false;
         }
      }
      
      public function get progressFunction() : Function
      {
         return this._progressFunction;
      }
      
      public function get noUpdateAvailableEverDispatch() : Boolean
      {
         return this._noUpdateAvailableEverDispatch;
      }
      
      private function getApplicationVersion() : String
      {
         var _loc1_:* = null;
         var _loc2_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc3_:Namespace = _loc2_.namespace();
         return _loc2_._loc3_::version;
      }
      
      public function checkNow() : void
      {
         this.appUpdater.checkNow();
      }
      
      private function onUpdateEventInitializedHandler(param1:UpdateEvent) : void
      {
         this.isFirstRun = param1.target.isFirstRun;
         this.applicationName = this.getApplicationName();
         this.installedVersion = this.getApplicationVersion();
      }
      
      public function downloadUpdate() : void
      {
         this.appUpdater.downloadUpdate();
      }
      
      public function set noUpdateAvailableEverDispatch(param1:Boolean) : void
      {
         this._noUpdateAvailableEverDispatch = param1;
      }
   }
}
