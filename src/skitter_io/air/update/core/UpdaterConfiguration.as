package air.update.core
{
   import air.update.descriptors.ConfigurationDescriptor;
   import air.update.logging.Logger;
   import air.update.utils.Constants;
   import air.update.utils.FileUtils;
   import air.update.utils.VersionUtils;
   import flash.filesystem.File;
   
   public class UpdaterConfiguration
   {
      
      private static var logger:Logger = Logger.getLogger("air.update.core.UpdaterConfiguration");
       
      
      private var _delay:Number;
      
      private var configurationDescriptor:ConfigurationDescriptor;
      
      private var _isFileUpdateVisible:int;
      
      private var _configurationFile:File;
      
      private var _isDownloadProgressVisible:int;
      
      private var _isUnexpectedErrorVisible:int;
      
      private var _updateURL:String;
      
      private var _isNewerVersionFunction:Function;
      
      private var _isInstallUpdateVisible:int;
      
      private var _isDownloadUpdateVisible:int;
      
      private var _isCheckForUpdateVisible:int;
      
      public function UpdaterConfiguration()
      {
         super();
         this._delay = -1;
         this._isCheckForUpdateVisible = -1;
         this._isDownloadUpdateVisible = -1;
         this._isDownloadProgressVisible = -1;
         this._isInstallUpdateVisible = -1;
         this._isFileUpdateVisible = -1;
         this._isUnexpectedErrorVisible = -1;
         this._isNewerVersionFunction = VersionUtils.isNewerVersion;
      }
      
      public function get delay() : Number
      {
         if(this._delay < 0)
         {
            if(Boolean(this.configurationDescriptor) && this.configurationDescriptor.checkInterval >= 0)
            {
               return this.configurationDescriptor.checkInterval;
            }
            return 0;
         }
         return this._delay;
      }
      
      public function set delay(param1:Number) : void
      {
         this._delay = param1;
      }
      
      public function get delayAsMilliseconds() : Number
      {
         return this.delay * 0;
      }
      
      public function set updateURL(param1:String) : void
      {
         this._updateURL = param1;
      }
      
      public function get isNewerVersionFunction() : Function
      {
         return this._isNewerVersionFunction;
      }
      
      public function set isUnexpectedErrorVisible(param1:Boolean) : void
      {
         this._isUnexpectedErrorVisible = param1 ? 1 : 0;
      }
      
      public function get configurationFile() : File
      {
         return this._configurationFile;
      }
      
      public function set isFileUpdateVisible(param1:Boolean) : void
      {
         this._isFileUpdateVisible = param1 ? 1 : 0;
      }
      
      public function get isCheckForUpdateVisible() : Boolean
      {
         if(this._isCheckForUpdateVisible >= 0)
         {
            return this._isCheckForUpdateVisible == 1;
         }
         var _loc1_:int = this.dialogVisibilityInConfiguration(ConfigurationDescriptor.DIALOG_CHECK_FOR_UPDATE);
         if(_loc1_ >= 0)
         {
            return _loc1_ == 1;
         }
         return true;
      }
      
      public function get isDownloadUpdateVisible() : Boolean
      {
         if(this._isDownloadUpdateVisible >= 0)
         {
            return this._isDownloadUpdateVisible == 1;
         }
         var _loc1_:int = this.dialogVisibilityInConfiguration(ConfigurationDescriptor.DIALOG_DOWNLOAD_UPDATE);
         if(_loc1_ >= 0)
         {
            return _loc1_ == 1;
         }
         return true;
      }
      
      public function set isNewerVersionFunction(param1:Function) : void
      {
         this._isNewerVersionFunction = param1;
      }
      
      public function get isFileUpdateVisible() : Boolean
      {
         if(this._isFileUpdateVisible >= 0)
         {
            return this._isFileUpdateVisible == 1;
         }
         var _loc1_:int = this.dialogVisibilityInConfiguration(ConfigurationDescriptor.DIALOG_FILE_UPDATE);
         if(_loc1_ >= 0)
         {
            return _loc1_ == 1;
         }
         return true;
      }
      
      public function set isInstallUpdateVisible(param1:Boolean) : void
      {
         this._isInstallUpdateVisible = param1 ? 1 : 0;
      }
      
      public function set isDownloadProgressVisible(param1:Boolean) : void
      {
         this._isDownloadProgressVisible = param1 ? 1 : 0;
      }
      
      public function get isDownloadProgressVisible() : Boolean
      {
         if(this._isDownloadProgressVisible >= 0)
         {
            return this._isDownloadProgressVisible == 1;
         }
         var _loc1_:int = this.dialogVisibilityInConfiguration(ConfigurationDescriptor.DIALOG_DOWNLOAD_PROGRESS);
         if(_loc1_ >= 0)
         {
            return _loc1_ == 1;
         }
         return true;
      }
      
      public function validate() : void
      {
         var _loc1_:XML = null;
         if(this.configurationFile)
         {
            if(!this.configurationFile.exists)
            {
               throw new Error("Configuration file \"" + this.configurationFile.nativePath + "\" does not exists on disk",Constants.ERROR_CONFIGURATION_FILE_MISSING);
            }
            _loc1_ = FileUtils.readXMLFromFile(this.configurationFile);
            this.configurationDescriptor = new ConfigurationDescriptor(_loc1_);
            this.configurationDescriptor.validate();
         }
         if(!this._updateURL && !this.configurationDescriptor)
         {
            throw new Error("Update URL not set",Constants.ERROR_UPDATE_URL_MISSING);
         }
      }
      
      public function set configurationFile(param1:File) : void
      {
         this._configurationFile = param1;
      }
      
      public function get updateURL() : String
      {
         return !!this._updateURL ? this._updateURL : this.configurationDescriptor.url;
      }
      
      public function get isUnexpectedErrorVisible() : Boolean
      {
         if(this._isUnexpectedErrorVisible >= 0)
         {
            return this._isUnexpectedErrorVisible == 1;
         }
         var _loc1_:int = this.dialogVisibilityInConfiguration(ConfigurationDescriptor.DIALOG_UNEXPECTED_ERROR);
         if(_loc1_ >= 0)
         {
            return _loc1_ == 1;
         }
         return true;
      }
      
      public function set isDownloadUpdateVisible(param1:Boolean) : void
      {
         this._isDownloadUpdateVisible = param1 ? 1 : 0;
      }
      
      public function get isInstallUpdateVisible() : Boolean
      {
         if(this._isInstallUpdateVisible >= 0)
         {
            return this._isInstallUpdateVisible == 1;
         }
         var _loc1_:int = this.dialogVisibilityInConfiguration(ConfigurationDescriptor.DIALOG_INSTALL_UPDATE);
         if(_loc1_ >= 0)
         {
            return _loc1_ == 1;
         }
         return true;
      }
      
      public function set isCheckForUpdateVisible(param1:Boolean) : void
      {
         this._isCheckForUpdateVisible = param1 ? 1 : 0;
      }
      
      private function dialogVisibilityInConfiguration(param1:String) : int
      {
         var _loc4_:Object = null;
         if(!this.configurationDescriptor)
         {
            return -1;
         }
         var _loc2_:Array = this.configurationDescriptor.defaultUI;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(param1.toLowerCase() == _loc4_.name.toLowerCase())
            {
               return !!_loc4_.visible ? 1 : 0;
            }
            _loc3_++;
         }
         return -1;
      }
   }
}
