package com.scenarioLauncher.managers
{
   import flash.desktop.NativeApplication;
   import flash.net.SharedObject;
   
   public class CookieManager
   {
      
      public static var SKITEASY_UPDATE_SUCCESS_DEFAULT:Boolean = false;
      
      private static var _singleton:com.scenarioLauncher.managers.CookieManager;
      
      public static const SHARED_OBJECT_NAME:String = "SkitEasyInitialization";
      
      public static var SKITEASY_UPDATE_REQUIRED_DEFAULT:Boolean = false;
      
      public static var SKITEASY_UPDATE_VERSION_DEFAULT:String = UpdaterManager.getAppVersion();
       
      
      public var skiteasyVersion:String;
      
      public var sharedObject:SharedObject;
      
      public var skiteasyUpdateRequired:Boolean;
      
      public var skiteasyUpdateSuccess:Boolean;
      
      public function CookieManager(param1:Class)
      {
         this.skiteasyVersion = SKITEASY_UPDATE_VERSION_DEFAULT;
         this.skiteasyUpdateSuccess = SKITEASY_UPDATE_SUCCESS_DEFAULT;
         this.skiteasyUpdateRequired = SKITEASY_UPDATE_REQUIRED_DEFAULT;
         super();
         if(param1 != SingletonLock)
         {
            throw new Error("Invalid Singleton access.  Use DebugPreferences.instance.");
         }
         this.reset();
         this.sharedObject = SharedObject.getLocal(SHARED_OBJECT_NAME);
         this.load();
      }
      
      public static function get instance() : com.scenarioLauncher.managers.CookieManager
      {
         if(_singleton == null)
         {
            _singleton = new com.scenarioLauncher.managers.CookieManager(SingletonLock);
         }
         return _singleton;
      }
      
      public function resetAndSave() : void
      {
         this.reset();
         this.save();
      }
      
      public function getVersion() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespaceDeclarations()[0];
         return _loc1_._loc2_::version;
      }
      
      public function reset() : void
      {
         this.skiteasyVersion = SKITEASY_UPDATE_VERSION_DEFAULT;
         this.skiteasyUpdateSuccess = SKITEASY_UPDATE_SUCCESS_DEFAULT;
         this.skiteasyUpdateRequired = SKITEASY_UPDATE_REQUIRED_DEFAULT;
      }
      
      public function save() : void
      {
         this.sharedObject.data.skiteasyVersion = this.skiteasyVersion;
         this.sharedObject.data.skiteasyUpdateSuccess = this.skiteasyUpdateSuccess;
         this.sharedObject.data.skiteasyUpdateRequired = this.skiteasyUpdateRequired;
      }
      
      public function load() : void
      {
         if(this.sharedObject.size > 0)
         {
            if(this.sharedObject.data.skiteasyVersion != null)
            {
               this.skiteasyVersion = this.sharedObject.data.skiteasyVersion;
            }
            if(this.sharedObject.data.skiteasyUpdateSuccess != null)
            {
               this.skiteasyUpdateSuccess = this.sharedObject.data.skiteasyUpdateSuccess;
            }
            if(this.sharedObject.data.skiteasyUpdateRequired != null)
            {
               this.skiteasyUpdateRequired = this.sharedObject.data.skiteasyUpdateRequired;
            }
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
