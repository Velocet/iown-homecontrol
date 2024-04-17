package com.scenarioLauncher.configuration
{
   import com.scenarioLauncher.common.GeneralFactory;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.resources.ResourceBundle;
   import mx.resources.ResourceManager;
   
   public class BundleManager extends EventDispatcher
   {
      
      public static const LANGUAGES_BUNDLE:String = "languages";
      
      public static const LOCALES_FILES:Array = ["common","installation","scenarios","remotes","system","updaters","help"];
      
      public static const LOCALES_FOLDER:String = "locales";
      
      public static const LOCALES_EXTENSION:String = ".properties";
      
      private static var _instance:com.scenarioLauncher.configuration.BundleManager = null;
       
      
      private var loadedLocales:Array;
      
      private var availableLocales:Array;
      
      private var curLocale:String = null;
      
      public function BundleManager()
      {
         this.loadedLocales = new Array();
         this.availableLocales = new Array();
         super();
         ResourceManager.getInstance().addEventListener(Event.CHANGE,this.onLocaleChanged);
      }
      
      public static function get bundleManager() : com.scenarioLauncher.configuration.BundleManager
      {
         if(_instance == null)
         {
            _instance = new com.scenarioLauncher.configuration.BundleManager();
         }
         return _instance;
      }
      
      public function treatBundleFileContent(param1:BundleRequest, param2:Boolean = false) : ResourceBundle
      {
         var _loc3_:ResourceBundle = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:* = null;
         var _loc4_:Array = (param1.data as String).split("\r\n");
         _loc3_ = new ResourceBundle(param1.locale,param1.bundleName);
         for each(_loc9_ in _loc4_)
         {
            if((_loc5_ = _loc9_.split("#")).length > 1)
            {
               _loc6_ = String(_loc5_[0]);
            }
            else
            {
               _loc6_ = _loc9_;
            }
            if((_loc5_ = _loc6_.split("=")).length == 2)
            {
               _loc7_ = _loc5_[0] as String;
               _loc8_ = _loc5_[1] as String;
               if(param2)
               {
                  this.setAvailableLocales(_loc8_,_loc7_);
               }
               _loc3_.content[_loc7_] = _loc8_;
            }
         }
         return _loc3_;
      }
      
      public function addBundle(param1:BundleRequest) : void
      {
         var _loc2_:ResourceBundle = null;
         _loc2_ = this.treatBundleFileContent(param1);
         ResourceManager.getInstance().addResourceBundle(_loc2_);
      }
      
      public function getAvailableLocales() : Array
      {
         return this.availableLocales;
      }
      
      public function setAvailableLocales(param1:String, param2:String) : void
      {
         this.availableLocales.push({
            "label":param1,
            "value":param2
         });
      }
      
      private function onLocaleChanged(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         _loc2_ = ResourceManager.getInstance().localeChain[0] as String;
         if(this.curLocale != _loc2_)
         {
            for each(_loc3_ in LOCALES_FILES)
            {
               GeneralFactory.bundleLoader.loadBundle(_loc2_,_loc3_);
            }
            this.loadedLocales.push(_loc2_);
            this.curLocale = _loc2_;
         }
      }
   }
}
