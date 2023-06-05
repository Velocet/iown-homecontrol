package air.update.core
{
   import air.update.descriptors.ApplicationDescriptor;
   import air.update.descriptors.UpdateDescriptor;
   import air.update.events.DownloadErrorEvent;
   import air.update.events.StatusFileUpdateErrorEvent;
   import air.update.events.StatusFileUpdateEvent;
   import air.update.events.StatusUpdateErrorEvent;
   import air.update.events.StatusUpdateEvent;
   import air.update.events.UpdateEvent;
   import air.update.logging.Logger;
   import air.update.net.FileDownloader;
   import air.update.states.HSM;
   import air.update.states.HSMEvent;
   import air.update.states.UpdateState;
   import air.update.utils.Constants;
   import air.update.utils.FileUtils;
   import air.update.utils.VersionUtils;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.net.URLRequest;
   
   public class UpdaterHSM extends HSM
   {
      
      public static const EVENT_FILE:String = "check.file";
      
      public static const EVENT_CHECK:String = "updater.check";
      
      public static const EVENT_STATE_CLEAR_TRIGGER:String = "state_clear.trigger";
      
      public static const EVENT_DOWNLOAD:String = "updater.download";
      
      public static const EVENT_INSTALL_TRIGGER:String = "install.trigger";
      
      private static var logger:Logger = Logger.getLogger("air.update.core.UpdaterHSM");
      
      public static const EVENT_VERIFIED:String = "check.verified";
      
      public static const EVENT_INSTALL:String = "updater.install";
      
      public static const EVENT_ASYNC:String = "check.async";
      
      public static const EVENT_FILE_INSTALL_TRIGGER:String = "file_install.trigger";
       
      
      private var descriptorURL:URLRequest;
      
      private var unpackager:air.update.core.AIRUnpackager;
      
      private var descriptorFile:File;
      
      private var _descriptor:UpdateDescriptor;
      
      private var requestedFile:File;
      
      private var requestedURL:String;
      
      private var downloader:FileDownloader;
      
      private var updateFile:File;
      
      private var updateURL:URLRequest;
      
      private var _applicationDescriptor:ApplicationDescriptor;
      
      private var _configuration:air.update.core.UpdaterConfiguration;
      
      public function UpdaterHSM()
      {
         super(this.stateReady);
      }
      
      protected function stateInitialized(param1:Event) : void
      {
         logger.finest("stateInitialized: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               transition(this.stateReady);
         }
      }
      
      protected function stateDownloading(param1:Event) : void
      {
         if(param1.type != ProgressEvent.PROGRESS)
         {
            logger.finest("stateDownloading: " + param1.type);
         }
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.downloader = new FileDownloader(this.updateURL,this.updateFile);
               this.downloader.addEventListener(DownloadErrorEvent.DOWNLOAD_ERROR,dispatch);
               this.downloader.addEventListener(UpdateEvent.DOWNLOAD_START,dispatch);
               this.downloader.addEventListener(ProgressEvent.PROGRESS,dispatch);
               this.downloader.addEventListener(UpdateEvent.DOWNLOAD_COMPLETE,dispatch);
               this.downloader.download();
               break;
            case UpdateEvent.DOWNLOAD_START:
               dispatchEvent(param1.clone());
               break;
            case ProgressEvent.PROGRESS:
               dispatchEvent(param1.clone());
               break;
            case DownloadErrorEvent.DOWNLOAD_ERROR:
               dispatchEvent(param1.clone());
               transition(this.stateErrored);
               break;
            case UpdateEvent.DOWNLOAD_COMPLETE:
               this.downloader = null;
               transition(this.stateDownloaded);
         }
      }
      
      public function getUpdateState() : int
      {
         var _loc1_:int = -1;
         switch(stateHSM)
         {
            case this.stateInitialized:
               _loc1_ = 0;
               break;
            case this.stateBeforeChecking:
               _loc1_ = 0;
               break;
            case this.stateChecking:
               _loc1_ = 0;
               break;
            case this.stateAvailable:
            case this.stateAvailableFile:
               _loc1_ = 0;
               break;
            case this.stateDownloading:
               _loc1_ = 0;
               break;
            case this.stateDownloaded:
               _loc1_ = 0;
               break;
            case this.stateInstalling:
               _loc1_ = 0;
               break;
            case this.statePendingInstall:
               _loc1_ = 0;
               break;
            case this.stateReady:
               _loc1_ = 0;
         }
         return _loc1_;
      }
      
      private function fileUnpackaged() : void
      {
         var xml:XML = null;
         logger.finer("Parsing file descriptor");
         try
         {
            xml = this.unpackager.descriptorXML;
            this._applicationDescriptor = new ApplicationDescriptor(xml);
            this._applicationDescriptor.validate();
            if(VersionUtils.getApplicationID() != this._applicationDescriptor.id)
            {
               throw new Error("Different applicationID",Constants.ERROR_DIFFERENT_APPLICATION_ID);
            }
            if(!this.isNewerVersion(VersionUtils.getApplicationVersion(),this._applicationDescriptor.version))
            {
               dispatchEvent(new StatusFileUpdateEvent(StatusFileUpdateEvent.FILE_UPDATE_STATUS,false,false,false,this._applicationDescriptor.version,this.requestedFile.nativePath));
               transition(this.stateReady);
               return;
            }
            transition(this.stateAvailableFile);
         }
         catch(e:Error)
         {
            logger.fine("Error validating file descriptor: " + e);
            dispatchEvent(new StatusFileUpdateErrorEvent(StatusFileUpdateErrorEvent.FILE_UPDATE_ERROR,false,false,e.message,e.errorID));
            transition(stateErrored);
         }
      }
      
      private function isNewerVersion(param1:String, param2:String) : Boolean
      {
         if(this.configuration)
         {
            return this.configuration.isNewerVersionFunction(param1,param2);
         }
         return VersionUtils.isNewerVersion(param1,param2);
      }
      
      protected function stateDownloaded(param1:Event) : void
      {
         var descriptor:ApplicationDescriptor = null;
         var event:Event = param1;
         logger.finest("stateDownloaded: " + event.type);
         switch(event.type)
         {
            case HSMEvent.ENTER:
               this.unpackager = new air.update.core.AIRUnpackager();
               this.unpackager.addEventListener(Event.COMPLETE,dispatch);
               this.unpackager.addEventListener(ErrorEvent.ERROR,dispatch);
               this.unpackager.addEventListener(IOErrorEvent.IO_ERROR,dispatch);
               this.unpackager.unpackageAsync(this.updateFile.url);
               break;
            case ErrorEvent.ERROR:
            case IOErrorEvent.IO_ERROR:
               this.unpackager.cancel();
               this.unpackager = null;
               dispatchEvent(new DownloadErrorEvent(DownloadErrorEvent.DOWNLOAD_ERROR,false,false,"",Constants.ERROR_AIR_UNPACKAGING,ErrorEvent(event).errorID));
               transition(this.stateErrored);
               break;
            case Event.COMPLETE:
               this.unpackager.cancel();
               descriptor = new ApplicationDescriptor(this.unpackager.descriptorXML);
               try
               {
                  descriptor.validate();
               }
               catch(e:Error)
               {
                  unpackager = null;
                  dispatchEvent(new DownloadErrorEvent(DownloadErrorEvent.DOWNLOAD_ERROR,false,false,"",Constants.ERROR_VALIDATE,e.errorID));
                  transition(stateErrored);
                  return;
               }
               if(descriptor.id != VersionUtils.getApplicationID())
               {
                  dispatchEvent(new DownloadErrorEvent(DownloadErrorEvent.DOWNLOAD_ERROR,false,false,"Different applicationID",Constants.ERROR_VALIDATE,Constants.ERROR_DIFFERENT_APPLICATION_ID));
                  transition(this.stateErrored);
                  return;
               }
               if(this._descriptor.version != descriptor.version)
               {
                  dispatchEvent(new DownloadErrorEvent(DownloadErrorEvent.DOWNLOAD_ERROR,false,false,"Version mismatch",Constants.ERROR_VALIDATE,Constants.ERROR_VERSION_MISMATCH));
                  transition(this.stateErrored);
                  return;
               }
               if(!this.isNewerVersion(VersionUtils.getApplicationVersion(),descriptor.version))
               {
                  dispatchEvent(new DownloadErrorEvent(DownloadErrorEvent.DOWNLOAD_ERROR,false,false,"Not a newer version",Constants.ERROR_VALIDATE,Constants.ERROR_NOT_NEW_VERSION));
                  transition(this.stateErrored);
                  return;
               }
               dispatch(new Event(EVENT_VERIFIED));
               break;
            case EVENT_VERIFIED:
               if(dispatchEvent(new UpdateEvent(UpdateEvent.DOWNLOAD_COMPLETE,false,true)))
               {
                  transition(this.stateInstalling);
                  return;
               }
               break;
            case EVENT_INSTALL:
               transition(this.stateInstalling);
         }
      }
      
      protected function stateReady(param1:Event) : void
      {
         logger.finest("stateReady: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               break;
            case EVENT_ASYNC:
               this.updateURL = new URLRequest(this.requestedURL);
               this.updateFile = FileUtils.getLocalDescriptorFile();
               transitionAsync(this.stateBeforeChecking);
               break;
            case EVENT_FILE:
               transitionAsync(this.stateUnpackaging);
         }
      }
      
      protected function stateChecking(param1:Event) : void
      {
         logger.finest("stateChecking: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.downloader = new FileDownloader(this.updateURL,this.updateFile);
               this.downloader.addEventListener(DownloadErrorEvent.DOWNLOAD_ERROR,dispatch);
               this.downloader.addEventListener(ProgressEvent.PROGRESS,dispatch);
               this.downloader.addEventListener(UpdateEvent.DOWNLOAD_COMPLETE,dispatch);
               this.downloader.download();
               break;
            case UpdateEvent.DOWNLOAD_START:
            case ProgressEvent.PROGRESS:
               break;
            case DownloadErrorEvent.DOWNLOAD_ERROR:
               dispatchEvent(new StatusUpdateErrorEvent(StatusUpdateErrorEvent.UPDATE_ERROR,false,false,DownloadErrorEvent(param1).text,DownloadErrorEvent(param1).errorID,DownloadErrorEvent(param1).subErrorID));
               transition(this.stateErrored);
               break;
            case UpdateEvent.DOWNLOAD_COMPLETE:
               this.downloader = null;
               this.descriptorDownloaded();
         }
      }
      
      private function startTimer(param1:Number = -1) : void
      {
      }
      
      public function installFile(param1:File) : void
      {
         this.requestedFile = param1;
         dispatch(new Event(EVENT_FILE));
      }
      
      protected function stateAvailable(param1:Event) : void
      {
         logger.finest("stateAvailable: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               if(dispatchEvent(new StatusUpdateEvent(StatusUpdateEvent.UPDATE_STATUS,false,true,true,this.descriptor.version,this.descriptor.description)))
               {
                  transition(this.stateDownloading);
                  return;
               }
               break;
            case EVENT_DOWNLOAD:
               transition(this.stateDownloading);
         }
      }
      
      protected function stateUnpackaging(param1:Event) : void
      {
         logger.finest("stateUnpackaging: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.unpackager = new air.update.core.AIRUnpackager();
               this.unpackager.addEventListener(Event.COMPLETE,dispatch);
               this.unpackager.addEventListener(ErrorEvent.ERROR,dispatch);
               this.unpackager.addEventListener(IOErrorEvent.IO_ERROR,dispatch);
               this.unpackager.unpackageAsync(this.requestedFile.url);
               break;
            case Event.COMPLETE:
               this.unpackager.cancel();
               this.fileUnpackaged();
               this.unpackager = null;
               break;
            case ErrorEvent.ERROR:
            case IOErrorEvent.IO_ERROR:
               this.unpackager.cancel();
               this.unpackager = null;
               dispatchEvent(new StatusFileUpdateErrorEvent(StatusFileUpdateErrorEvent.FILE_UPDATE_ERROR,false,false,"",ErrorEvent(param1).errorID));
               transition(this.stateErrored);
         }
      }
      
      private function installUpdate() : void
      {
         logger.finest("Installing update");
         dispatchEvent(new Event(EVENT_INSTALL_TRIGGER));
      }
      
      protected function stateCancelled(param1:Event) : void
      {
         logger.finest("stateCancelled: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               dispatchEvent(new Event(EVENT_STATE_CLEAR_TRIGGER));
               if(this.downloader)
               {
                  this.downloader.cancel();
                  this.downloader = null;
               }
               transition(this.stateReady);
         }
      }
      
      public function checkAsync(param1:String) : void
      {
         this.requestedURL = param1;
         dispatch(new Event(EVENT_ASYNC));
      }
      
      protected function stateErrored(param1:Event) : void
      {
         logger.finest("stateErrored: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               dispatchEvent(new Event(EVENT_STATE_CLEAR_TRIGGER));
               if(this.downloader)
               {
                  this.downloader.cancel();
                  this.downloader = null;
               }
               transition(this.stateReady);
         }
      }
      
      protected function stateInstalling(param1:Event) : void
      {
         logger.finest("stateInstalling: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               if(!dispatchEvent(new UpdateEvent(UpdateEvent.BEFORE_INSTALL,false,true)))
               {
                  transition(this.statePendingInstall);
                  return;
               }
               this.installUpdate();
               break;
         }
      }
      
      protected function stateAvailableFile(param1:Event) : void
      {
         logger.finest("stateAvailableFile: " + param1.type + " file: " + this.requestedFile.url);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               if(dispatchEvent(new StatusFileUpdateEvent(StatusFileUpdateEvent.FILE_UPDATE_STATUS,false,true,true,this._applicationDescriptor.version,this.requestedFile.nativePath)))
               {
                  transition(this.stateInstallingFile);
                  return;
               }
               break;
            case EVENT_INSTALL:
               transition(this.stateInstallingFile);
         }
      }
      
      public function get applicationDescriptor() : ApplicationDescriptor
      {
         return this._applicationDescriptor;
      }
      
      private function installFileUpdate() : void
      {
         logger.finest("Installing file update");
         dispatchEvent(new Event(EVENT_FILE_INSTALL_TRIGGER));
      }
      
      public function set configuration(param1:air.update.core.UpdaterConfiguration) : void
      {
         this._configuration = param1;
      }
      
      public function get airFile() : File
      {
         return this.requestedFile;
      }
      
      public function get descriptor() : UpdateDescriptor
      {
         return this._descriptor;
      }
      
      protected function stateBeforeChecking(param1:Event) : void
      {
         var _loc2_:UpdateEvent = null;
         logger.finest("stateBeforeChecking: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               _loc2_ = new UpdateEvent(UpdateEvent.CHECK_FOR_UPDATE,false,true);
               dispatchEvent(_loc2_);
               if(!_loc2_.isDefaultPrevented())
               {
                  transition(this.stateChecking);
                  return;
               }
               logger.finer("CheckForUpdate cancelled");
               break;
            case EVENT_CHECK:
               transition(this.stateChecking);
         }
      }
      
      protected function stateInstallingFile(param1:Event) : void
      {
         logger.finest("stateInstallingFile: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               this.installFileUpdate();
         }
      }
      
      protected function statePendingInstall(param1:Event) : void
      {
         logger.finest("statePendingInstall: " + param1.type);
         switch(param1.type)
         {
            case HSMEvent.ENTER:
               return;
            default:
               return;
         }
      }
      
      public function get configuration() : air.update.core.UpdaterConfiguration
      {
         return this._configuration;
      }
      
      public function cancel() : void
      {
         transition(this.stateCancelled);
      }
      
      private function descriptorDownloaded() : void
      {
         var xml:XML = null;
         logger.finer("Parsing descriptor");
         try
         {
            xml = FileUtils.readXMLFromFile(this.updateFile);
            this._descriptor = new UpdateDescriptor(xml);
            this._descriptor.validate();
            if(!this.isNewerVersion(VersionUtils.getApplicationVersion(),this._descriptor.version))
            {
               dispatchEvent(new StatusUpdateEvent(StatusUpdateEvent.UPDATE_STATUS));
               transition(this.stateReady);
               return;
            }
            this.updateFile = FileUtils.getLocalUpdateFile();
            this.updateURL = new URLRequest(this.descriptor.url);
            transition(this.stateAvailable);
         }
         catch(e:Error)
         {
            logger.fine("Error loading/validating downloaded descriptor: " + e);
            dispatchEvent(new StatusUpdateErrorEvent(StatusUpdateErrorEvent.UPDATE_ERROR,false,false,e.message,e.errorID));
            transition(stateErrored);
         }
      }
   }
}
