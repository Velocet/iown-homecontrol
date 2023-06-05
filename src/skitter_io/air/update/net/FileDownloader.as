package air.update.net
{
   import air.update.events.DownloadErrorEvent;
   import air.update.events.UpdateEvent;
   import air.update.logging.Logger;
   import air.update.utils.Constants;
   import air.update.utils.NetUtils;
   import flash.errors.EOFError;
   import flash.errors.IOError;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class FileDownloader extends EventDispatcher
   {
      
      private static var logger:Logger = Logger.getLogger("air.update.net.FileDownloader");
       
      
      private var downloadedFile:File;
      
      private var urlStream:URLStream;
      
      private var fileURL:URLRequest;
      
      private var isInError:Boolean;
      
      private var fileStream:FileStream;
      
      public function FileDownloader(param1:URLRequest, param2:File)
      {
         super();
         this.fileURL = param1;
         this.fileURL.useCache = false;
         this.downloadedFile = param2;
         logger.finer("url: " + param1.url + " file: " + param2.nativePath);
         this.urlStream = new URLStream();
         this.urlStream.addEventListener(IOErrorEvent.IO_ERROR,this.onDownloadError);
         this.urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onDownloadError);
         this.urlStream.addEventListener(ProgressEvent.PROGRESS,this.onDownloadProgress);
         this.urlStream.addEventListener(Event.OPEN,this.onDownloadOpen);
         this.urlStream.addEventListener(Event.COMPLETE,this.onDownloadComplete);
         this.urlStream.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS,this.onDownloadResponseStatus);
      }
      
      private function onDownloadComplete(param1:Event) : void
      {
         while(Boolean(this.urlStream) && Boolean(this.urlStream.bytesAvailable))
         {
            this.saveBytes();
         }
         if(Boolean(this.urlStream) && this.urlStream.connected)
         {
            this.urlStream.close();
            this.urlStream = null;
         }
         this.fileStream.close();
         this.fileStream = null;
         if(!this.isInError)
         {
            dispatchEvent(new UpdateEvent(UpdateEvent.DOWNLOAD_COMPLETE));
         }
      }
      
      public function cancel() : void
      {
         try
         {
            if(Boolean(this.urlStream) && this.urlStream.connected)
            {
               this.urlStream.close();
            }
            if(this.fileStream)
            {
               this.fileStream.close();
               this.fileStream = null;
            }
            if(Boolean(this.downloadedFile) && Boolean(this.downloadedFile.exists))
            {
               this.downloadedFile.deleteFile();
            }
         }
         catch(e:Error)
         {
            logger.fine("Error during canceling the download: " + e);
         }
      }
      
      public function download() : void
      {
         this.urlStream.load(this.fileURL);
      }
      
      private function onDownloadResponseStatus(param1:HTTPStatusEvent) : void
      {
         logger.fine("DownloadStatus: " + param1.status);
         if(!NetUtils.isHTTPStatusAcceptable(param1.status))
         {
            this.dispatchErrorEvent("Invalid HTTP status code: " + param1.status,Constants.ERROR_INVALID_HTTP_STATUS,param1.status);
         }
      }
      
      public function inProgress() : Boolean
      {
         return this.urlStream.connected;
      }
      
      private function dispatchErrorEvent(param1:String, param2:int = 0, param3:int = 0) : void
      {
         this.isInError = true;
         if(Boolean(this.urlStream) && this.urlStream.connected)
         {
            this.urlStream.close();
            this.urlStream = null;
         }
         dispatchEvent(new DownloadErrorEvent(DownloadErrorEvent.DOWNLOAD_ERROR,false,false,param1,param2,param3));
      }
      
      private function saveBytes() : void
      {
         var bytes:ByteArray = null;
         if(!this.fileStream || !this.urlStream || !this.urlStream.connected)
         {
            return;
         }
         try
         {
            bytes = new ByteArray();
            this.urlStream.readBytes(bytes,0,this.urlStream.bytesAvailable);
            this.fileStream.writeBytes(bytes);
         }
         catch(error:EOFError)
         {
            isInError = true;
            logger.fine("EOFError: " + error);
            dispatchErrorEvent(error.message,Constants.ERROR_EOF_DOWNLOAD,error.errorID);
         }
         catch(err:IOError)
         {
            isInError = true;
            logger.fine("IOError: " + err);
            dispatchErrorEvent(err.message,Constants.ERROR_IO_FILE,err.errorID);
         }
      }
      
      private function onDownloadError(param1:ErrorEvent) : void
      {
         if(param1 is IOErrorEvent)
         {
            this.dispatchErrorEvent(param1.text,Constants.ERROR_IO_DOWNLOAD,param1.errorID);
         }
         else if(param1 is SecurityErrorEvent)
         {
            this.dispatchErrorEvent(param1.text,Constants.ERROR_SECURITY,param1.errorID);
         }
      }
      
      private function onDownloadOpen(param1:Event) : void
      {
         var event:Event = param1;
         this.fileStream = new FileStream();
         try
         {
            this.fileStream.open(this.downloadedFile,FileMode.WRITE);
         }
         catch(e:Error)
         {
            logger.fine("Error opening file on disk: " + e);
            isInError = true;
            dispatchErrorEvent(e.message,Constants.ERROR_IO_FILE,e.errorID);
            return;
         }
         dispatchEvent(new UpdateEvent(UpdateEvent.DOWNLOAD_START,false,false));
      }
      
      private function onDownloadProgress(param1:ProgressEvent) : void
      {
         if(!this.isInError)
         {
            this.saveBytes();
            dispatchEvent(param1);
         }
      }
   }
}
