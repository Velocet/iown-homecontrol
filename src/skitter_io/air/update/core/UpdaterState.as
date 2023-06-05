package air.update.core
{
   import air.update.descriptors.StateDescriptor;
   import air.update.logging.Logger;
   import air.update.utils.Constants;
   import air.update.utils.FileUtils;
   import flash.filesystem.File;
   
   public class UpdaterState
   {
      
      private static var logger:Logger = Logger.getLogger("air.update.core.UpdaterState");
       
      
      private var _descriptor:StateDescriptor;
      
      public function UpdaterState()
      {
         super();
      }
      
      public function removeAllFailedUpdates() : void
      {
         this.descriptor.removeAllFailedUpdates();
      }
      
      public function resetUpdateData() : void
      {
         this.descriptor.currentVersion = "";
         this.descriptor.previousVersion = "";
         this.descriptor.storage = null;
         FileUtils.deleteFile(FileUtils.getLocalUpdateFile());
         FileUtils.deleteFile(FileUtils.getLocalDescriptorFile());
         this.descriptor.updaterLaunched = false;
      }
      
      public function load() : void
      {
         var updateFile:File;
         var xml:XML = null;
         var storageFile:File = FileUtils.getStorageStateFile();
         var documentsFile:File = FileUtils.getDocumentsStateFile();
         if(!storageFile.exists)
         {
            if(!documentsFile.exists)
            {
               this._descriptor = StateDescriptor.defaultState();
               this.saveToStorage();
            }
            else
            {
               try
               {
                  xml = FileUtils.readXMLFromFile(documentsFile);
                  this._descriptor = new StateDescriptor(xml);
                  this._descriptor.validate();
                  this.saveToStorage();
               }
               catch(e:Error)
               {
                  logger.fine("Invalid state: " + e);
                  _descriptor = StateDescriptor.defaultState();
                  saveToStorage();
               }
            }
         }
         else
         {
            try
            {
               xml = FileUtils.readXMLFromFile(storageFile);
               this._descriptor = new StateDescriptor(xml);
               this._descriptor.validate();
            }
            catch(e:Error)
            {
               logger.fine("Invalid state: " + e);
               _descriptor = StateDescriptor.defaultState();
               saveToStorage();
            }
         }
         updateFile = FileUtils.getLocalUpdateFile();
         if(this.descriptor.currentVersion && !updateFile.exists && !this.descriptor.updaterLaunched)
         {
            logger.fine("Missing update file");
            this._descriptor = StateDescriptor.defaultState();
            this.saveToStorage();
         }
         FileUtils.deleteFile(documentsFile);
      }
      
      public function addFailedUpdate(param1:String) : void
      {
         this.descriptor.addFailedUpdate(param1);
      }
      
      public function saveToDocuments() : void
      {
         var _loc1_:File = FileUtils.getDocumentsStateFile();
         FileUtils.saveXMLToFile(this._descriptor.getXML(),_loc1_);
      }
      
      public function removePreviousStorageData(param1:File) : void
      {
         if(!param1 || !param1.exists)
         {
            return;
         }
         var _loc2_:File = param1.resolvePath("undefined/undefined");
         FileUtils.deleteFile(_loc2_);
         _loc2_ = param1.resolvePath("undefined/undefined");
         FileUtils.deleteFile(_loc2_);
         _loc2_ = param1.resolvePath("undefined/undefined");
         FileUtils.deleteFile(_loc2_);
         _loc2_ = param1.resolvePath(Constants.UPDATER_FOLDER);
         FileUtils.deleteFolder(_loc2_);
      }
      
      public function saveToStorage() : void
      {
         var _loc1_:File = FileUtils.getStorageStateFile();
         FileUtils.saveXMLToFile(this._descriptor.getXML(),_loc1_);
      }
      
      public function get descriptor() : StateDescriptor
      {
         return this._descriptor;
      }
   }
}
