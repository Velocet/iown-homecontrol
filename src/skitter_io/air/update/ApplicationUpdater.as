package air.update
{
   import air.update.core.UpdaterConfiguration;
   import air.update.core.UpdaterHSM;
   import air.update.core.UpdaterState;
   import air.update.events.DownloadErrorEvent;
   import air.update.events.StatusFileUpdateErrorEvent;
   import air.update.events.StatusFileUpdateEvent;
   import air.update.events.StatusUpdateErrorEvent;
   import air.update.events.StatusUpdateEvent;
   import air.update.events.UpdateEvent;
   import air.update.logging.Logger;
   import air.update.states.HSM;
   import air.update.states.HSMEvent;
   import air.update.states.UpdateState;
   import air.update.utils.Constants;
   import air.update.utils.FileUtils;
   import air.update.utils.VersionUtils;
   import flash.desktop.Updater;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.utils.Timer;
   
   public class ApplicationUpdater extends HSM
   {
      
      private static var logger:Logger = Logger.getLogger("air.update.ApplicationUpdater");
      
      private static const EVENT_CHECK_URL:String = "check.url";
      
      private static const EVENT_INITIALIZE:String = "initialize";
      
      private static const EVENT_CHECK_FILE:String = "check.file";
       
      
      protected var state:UpdaterState;
      
      private var _isFirstRun:Boolean = false;
      
      private var _previousVersion:String = "";
      
      private var _wasPendingUpdate:Boolean = false;
      
      private var installFile:File = null;
      
      protected var updaterHSM:UpdaterHSM;
      
      private var _previousStorage:File = null;
      
      private var isInitialized:Boolean = false;
      
      private var timer:Timer;
      
      protected var configuration:UpdaterConfiguration;
      
      public function ApplicationUpdater()
      {
         super(this.stateUninitialized);
         init();
         this.configuration = new UpdaterConfiguration();
         this.state = new UpdaterState();
         this.updaterHSM = new UpdaterHSM();
         this.updaterHSM.configuration = this.configuration;
         this.updaterHSM.addEventListener(UpdateEvent.CHECK_FOR_UPDATE,dispatch);
         this.updaterHSM.addEventListener(StatusUpdateEvent.UPDATE_STATUS,dispatch);
         this.updaterHSM.addEventListener(UpdateEvent.DOWNLOAD_START,dispatch);
         this.updaterHSM.addEventListener(ProgressEvent.PROGRESS,dispatch);
         this.updaterHSM.addEventListener(UpdateEvent.DOWNLOAD_COMPLETE,dispatch);
         this.updaterHSM.addEventListener(UpdateEvent.BEFORE_INSTALL,dispatch);
         this.updaterHSM.addEventListener(StatusUpdateErrorEvent.UPDATE_ERROR,dispatch);
         this.updaterHSM.addEventListener(DownloadErrorEvent.DOWNLOAD_ERROR,dispatch);
         this.updaterHSM.addEventListener(UpdaterHSM.EVENT_INSTALL_TRIGGER,dispatch);
         this.updaterHSM.addEventListener(UpdaterHSM.EVENT_FILE_INSTALL_TRIGGER,dispatch);
         this.updaterHSM.addEventListener(UpdaterHSM.EVENT_STATE_CLEAR_TRIGGER,this.onStateClear);
         this.updaterHSM.addEventListener(ErrorEvent.ERROR,dispatch);
         this.updaterHSM.addEventListener(StatusFileUpdateEvent.FILE_UPDATE_STATUS,dispatch);
         this.updaterHSM.addEventListener(StatusFileUpdateErrorEvent.FILE_UPDATE_ERROR,dispatch);
         this.timer = new Timer(0);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public function get delay() : Number
      {
         return this.configuration.delay;
      }
      
      public function get isFirstRun() : Boolean
      {
         return this._isFirstRun;
      }
      
      public function set delay(param1:Number) : void
      {
         this.configuration.delay = param1;
         if(this.isInitialized)
         {
            this.handlePeriodicalCheck();
         }
      }
      
      protected function stateUninitialized(param1:Event) : void
      {
         logger.finest("stateUninitialized: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.isInitialized = false;
               break;
            case EVENT_INITIALIZE:
               transition(this.stateInitializing);
         }
      }
      
      public function get isNewerVersionFunction() : Function
      {
         return this.configuration.isNewerVersionFunction;
      }
      
      public function initialize() : void
      {
         dispatch(new Event(EVENT_INITIALIZE));
      }
      
      protected function stateReady(param1:Event) : void
      {
         logger.finest("stateReady: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               break;
            case EVENT_CHECK_URL:
               transition(this.stateRunning);
               dispatch(param1);
               break;
            case EVENT_CHECK_FILE:
               transition(this.stateRunning);
               dispatch(param1);
               break;
            case ErrorEvent.ERROR:
               dispatchEvent(param1);
         }
      }
      
      public function set isNewerVersionFunction(param1:Function) : void
      {
         this.configuration.isNewerVersionFunction = param1;
      }
      
      protected function handleFirstRun() : Boolean
      {
         var updateFile:File = null;
         var updater:Updater = null;
         var result:Boolean = true;
         if(!this.state.descriptor.currentVersion)
         {
            return true;
         }
         if(this.state.descriptor.updaterLaunched)
         {
            this._wasPendingUpdate = true;
            if(this.state.descriptor.currentVersion == VersionUtils.getApplicationVersion())
            {
               this._isFirstRun = true;
               this._previousVersion = this.state.descriptor.previousVersion;
               if(this.state.descriptor.storage.nativePath != File.applicationStorageDirectory.nativePath)
               {
                  this._previousStorage = this.state.descriptor.storage;
               }
               this.state.removeAllFailedUpdates();
               this.state.resetUpdateData();
               this.state.removePreviousStorageData(this._previousStorage);
               this.state.saveToStorage();
            }
            else if(this.state.descriptor.previousVersion == VersionUtils.getApplicationVersion())
            {
               this.state.addFailedUpdate(this.state.descriptor.currentVersion);
               this.state.resetUpdateData();
               this.state.saveToStorage();
            }
            else
            {
               this._wasPendingUpdate = false;
               this.state.removeAllFailedUpdates();
               this.state.resetUpdateData();
               this.state.saveToStorage();
            }
         }
         else if(this.state.descriptor.previousVersion == VersionUtils.getApplicationVersion())
         {
            updateFile = FileUtils.getLocalUpdateFile();
            if(!updateFile.exists)
            {
               this.state.resetUpdateData();
               return true;
            }
            try
            {
               this.state.descriptor.updaterLaunched = true;
               this.state.saveToStorage();
               this.state.saveToDocuments();
               updater = new Updater();
               updater.update(updateFile,this.state.descriptor.currentVersion);
               result = false;
            }
            catch(e:Error)
            {
               logger.warning("The application cannot be updated when is launched from ADL." + e.message);
               state.resetUpdateData();
               state.saveToStorage();
            }
         }
         else if(this.state.descriptor.currentVersion == VersionUtils.getApplicationVersion())
         {
            this.state.removeAllFailedUpdates();
            this.state.resetUpdateData();
            this.state.saveToStorage();
         }
         else
         {
            this.state.removeAllFailedUpdates();
            this.state.resetUpdateData();
            this.state.saveToStorage();
         }
         return result;
      }
      
      public function get currentVersion() : String
      {
         return VersionUtils.getApplicationVersion();
      }
      
      protected function onFileInstall() : void
      {
         var updater:Updater = null;
         var updateFile:File = this.updaterHSM.airFile;
         if(!updateFile.exists)
         {
            logger.finest("Update file doesn\'t exist at update");
            this.state.resetUpdateData();
            this.state.saveToStorage();
            this.updaterHSM.cancel();
            throw new Error("Missing update file at install time",Constants.ERROR_APPLICATION_UPDATE_NO_FILE);
         }
         try
         {
            this.state.descriptor.updaterLaunched = true;
            this.state.saveToStorage();
            this.state.saveToDocuments();
            updater = new Updater();
            updater.update(updateFile,this.updaterHSM.applicationDescriptor.version);
         }
         catch(e:Error)
         {
            logger.warning("The application cannot be updated (file)." + e.message);
            state.resetUpdateData();
            state.saveToStorage();
            updaterHSM.cancel();
            throw new Error("Cannot update (from file)",Constants.ERROR_APPLICATION_UPDATE);
         }
      }
      
      public function get configurationFile() : File
      {
         return this.configuration.configurationFile;
      }
      
      protected function dispatchProxy(param1:Event) : void
      {
         if(param1.type != ProgressEvent.PROGRESS)
         {
            logger.info("Dispatching event ",param1);
         }
         if(!dispatchEvent(param1))
         {
            param1.preventDefault();
         }
      }
      
      protected function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:* = this.timer.currentCount == this.timer.repeatCount;
         this.handlePeriodicalCheck();
         if(_loc2_)
         {
            dispatch(new Event(EVENT_CHECK_URL));
         }
      }
      
      public function get updateDescriptor() : XML
      {
         if(this.updaterHSM.descriptor)
         {
            return this.updaterHSM.descriptor.getXML();
         }
         return null;
      }
      
      public function set configurationFile(param1:File) : void
      {
         this.configuration.configurationFile = param1;
      }
      
      public function checkNow() : void
      {
         dispatch(new Event(EVENT_CHECK_URL));
      }
      
      public function get currentState() : String
      {
         if(!this.isInitialized)
         {
            return UpdateState.getStateName(UpdateState.UNINITIALIZED);
         }
         return UpdateState.getStateName(this.updaterHSM.getUpdateState());
      }
      
      public function get previousApplicationStorageDirectory() : File
      {
         return this._previousStorage;
      }
      
      protected function onInitializationComplete() : void
      {
         dispatch(new UpdateEvent(UpdateEvent.INITIALIZED));
      }
      
      protected function onInstall() : void
      {
         var updater:Updater = null;
         var updateFile:File = FileUtils.getLocalUpdateFile();
         if(!updateFile.exists)
         {
            logger.finest("Update file doesn\'t exist at update");
            this.state.resetUpdateData();
            this.state.saveToStorage();
            this.updaterHSM.cancel();
            throw new Error("Missing update file  at install time",Constants.ERROR_APPLICATION_UPDATE_NO_FILE);
         }
         try
         {
            this.state.descriptor.updaterLaunched = true;
            this.state.saveToStorage();
            this.state.saveToDocuments();
            updater = new Updater();
            updater.update(updateFile,this.updaterHSM.descriptor.version);
         }
         catch(e:Error)
         {
            logger.warning("The application cannot be updated (url)." + e.message);
            state.resetUpdateData();
            state.saveToStorage();
            updaterHSM.cancel();
            throw new Error("Cannot update (from remote)",Constants.ERROR_APPLICATION_UPDATE);
         }
      }
      
      protected function stateCancelled(param1:Event) : void
      {
         logger.finest("stateCancelled: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.updaterHSM.cancel();
               transition(this.stateReady);
         }
      }
      
      public function installFromAIRFile(param1:File) : void
      {
         this.installFile = param1;
         dispatch(new Event(EVENT_CHECK_FILE));
         this.updaterHSM.installFile(param1);
      }
      
      public function installUpdate() : void
      {
         dispatch(new Event(UpdaterHSM.EVENT_INSTALL));
      }
      
      protected function onFileStatus(param1:StatusFileUpdateEvent) : void
      {
         if(param1.available)
         {
            this.state.descriptor.previousVersion = VersionUtils.getApplicationVersion();
            this.state.descriptor.currentVersion = param1.version;
            this.state.descriptor.storage = File.applicationStorageDirectory;
            this.state.saveToStorage();
         }
         this.dispatchProxy(param1);
      }
      
      protected function onInitialize() : void
      {
         this.configuration.validate();
         this.state.load();
         if(this.handleFirstRun())
         {
            this.onInitializationComplete();
         }
      }
      
      public function checkForUpdate() : void
      {
         dispatch(new Event(UpdaterHSM.EVENT_CHECK));
      }
      
      public function set updateURL(param1:String) : void
      {
         this.configuration.updateURL = param1;
      }
      
      public function get wasPendingUpdate() : Boolean
      {
         return this._wasPendingUpdate;
      }
      
      protected function handlePeriodicalCheck() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         logger.finest("PeriodicalCheck: " + this.configuration.delay);
         if(this.configuration.delay == 0)
         {
            return;
         }
         this.timer.reset();
         this.timer.repeatCount = 1;
         var _loc1_:Number = new Date().time - this.state.descriptor.lastCheckDate.time;
         logger.finest("Difference: " + _loc1_ + " > " + this.configuration.delayAsMilliseconds + "(" + this.state.descriptor.lastCheckDate + ")");
         if(_loc1_ > this.configuration.delayAsMilliseconds)
         {
            this.timer.delay = 1;
         }
         else
         {
            _loc2_ = this.configuration.delayAsMilliseconds - _loc1_;
            _loc3_ = Math.floor(_loc2_ / 0) + 1;
            if(_loc2_ > Constants.DAY_IN_MILLISECONDS)
            {
               _loc2_ = 0;
            }
            this.timer.delay = _loc2_;
            this.timer.repeatCount = _loc3_;
         }
         this.timer.start();
         logger.finest("PeriodicalCheck: started with delay: " + this.timer.delay + " and count: " + this.timer.repeatCount);
      }
      
      protected function onDownloadComplete(param1:UpdateEvent) : void
      {
         this.state.descriptor.previousVersion = VersionUtils.getApplicationVersion();
         this.state.descriptor.currentVersion = this.updaterHSM.descriptor.version;
         this.state.descriptor.storage = File.applicationStorageDirectory;
         this.state.saveToStorage();
         this.dispatchProxy(param1);
      }
      
      public function get previousVersion() : String
      {
         return this._previousVersion;
      }
      
      public function cancelUpdate() : void
      {
         transition(this.stateCancelled);
      }
      
      public function get updateURL() : String
      {
         return this.configuration.updateURL;
      }
      
      public function downloadUpdate() : void
      {
         dispatch(new Event(UpdaterHSM.EVENT_DOWNLOAD));
      }
      
      protected function stateRunning(param1:Event) : void
      {
         logger.finest("stateRunning: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               break;
            case EVENT_CHECK_URL:
               this.state.descriptor.lastCheckDate = new Date();
               this.state.saveToStorage();
               this.handlePeriodicalCheck();
               this.updaterHSM.checkAsync(this.configuration.updateURL);
               break;
            case EVENT_CHECK_FILE:
               this.updaterHSM.installFile(this.installFile);
               break;
            case UpdaterHSM.EVENT_CHECK:
            case UpdaterHSM.EVENT_DOWNLOAD:
            case UpdaterHSM.EVENT_INSTALL:
               this.updaterHSM.dispatch(param1);
               break;
            case UpdateEvent.CHECK_FOR_UPDATE:
            case StatusUpdateEvent.UPDATE_STATUS:
            case UpdateEvent.DOWNLOAD_START:
            case ProgressEvent.PROGRESS:
            case UpdateEvent.BEFORE_INSTALL:
               this.dispatchProxy(param1);
               break;
            case StatusUpdateErrorEvent.UPDATE_ERROR:
            case DownloadErrorEvent.DOWNLOAD_ERROR:
            case StatusFileUpdateErrorEvent.FILE_UPDATE_ERROR:
            case ErrorEvent.ERROR:
               this.dispatchProxy(param1);
               transition(this.stateReady);
               break;
            case StatusFileUpdateEvent.FILE_UPDATE_STATUS:
               this.onFileStatus(param1 as StatusFileUpdateEvent);
               break;
            case UpdateEvent.DOWNLOAD_COMPLETE:
               this.onDownloadComplete(param1 as UpdateEvent);
               break;
            case UpdaterHSM.EVENT_INSTALL_TRIGGER:
               this.onInstall();
               break;
            case UpdaterHSM.EVENT_FILE_INSTALL_TRIGGER:
               this.onFileInstall();
         }
      }
      
      protected function onStateClear(param1:Event) : void
      {
         this.state.resetUpdateData();
         this.state.saveToStorage();
      }
      
      protected function stateInitializing(param1:Event) : void
      {
         logger.finest("stateInitializing: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.onInitialize();
               break;
            case UpdateEvent.INITIALIZED:
               this.isInitialized = true;
               transition(this.stateReady);
               dispatchEvent(param1);
               this.handlePeriodicalCheck();
               break;
            case ErrorEvent.ERROR:
               transition(this.stateUninitialized);
               dispatchEvent(param1.clone());
         }
      }
   }
}
