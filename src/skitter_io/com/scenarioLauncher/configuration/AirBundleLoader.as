package com.scenarioLauncher.configuration
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import mx.resources.ResourceBundle;
   
   public class AirBundleLoader
   {
       
      
      private var _bundleRequests:Array;
      
      private var _loader:URLLoader;
      
      private var _currentRequest:com.scenarioLauncher.configuration.BundleRequest = null;
      
      private var _pathToLocales:String;
      
      public function AirBundleLoader()
      {
         super();
         this._bundleRequests = new Array();
         this._loader = new URLLoader();
         this._pathToLocales = File.applicationDirectory.nativePath + "/" + BundleManager.LOCALES_FOLDER;
         this._loader.dataFormat = URLLoaderDataFormat.TEXT;
         this._loader.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         this._loader.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      public function loadLanguageBundle(param1:String) : void
      {
         var _loc2_:ResourceBundle = null;
         var _loc3_:com.scenarioLauncher.configuration.BundleRequest = new com.scenarioLauncher.configuration.BundleRequest();
         _loc3_.bundleName = param1;
         var _loc4_:String = this._pathToLocales + "/" + param1 + BundleManager.LOCALES_EXTENSION;
         _loc3_.locale = "";
         var _loc5_:File = new File(_loc4_);
         var _loc6_:FileStream;
         (_loc6_ = new FileStream()).open(_loc5_,FileMode.READ);
         _loc3_.data = _loc6_.readUTFBytes(_loc6_.bytesAvailable);
         _loc6_.close();
         _loc2_ = BundleManager.bundleManager.treatBundleFileContent(_loc3_,true);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         if(this._currentRequest.data != null)
         {
            BundleManager.bundleManager.addBundle(this._currentRequest);
         }
         this._currentRequest = null;
      }
      
      public function loadBundle(param1:String, param2:String) : void
      {
         var _loc3_:com.scenarioLauncher.configuration.BundleRequest = new com.scenarioLauncher.configuration.BundleRequest();
         _loc3_.bundleName = param2;
         var _loc4_:String = this._pathToLocales + "/" + param1 + "/" + param2 + BundleManager.LOCALES_EXTENSION;
         _loc3_.locale = param1;
         this._bundleRequests.push(_loc3_);
         var _loc5_:File = new File(_loc4_);
         var _loc6_:FileStream;
         (_loc6_ = new FileStream()).open(_loc5_,FileMode.READ);
         _loc3_.data = _loc6_.readUTFBytes(_loc6_.bytesAvailable);
         _loc6_.close();
         BundleManager.bundleManager.addBundle(_loc3_);
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         if(this._currentRequest.data != null)
         {
            BundleManager.bundleManager.addBundle(this._currentRequest);
         }
         this._currentRequest = null;
      }
      
      private function onComplete(param1:Event) : void
      {
         if(this._currentRequest != null)
         {
            this._currentRequest.data = this._loader.data as String;
            BundleManager.bundleManager.addBundle(this._currentRequest);
         }
         this._currentRequest = null;
      }
   }
}
