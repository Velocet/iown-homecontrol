package com.scenarioLauncher.configuration
{
   import flash.net.SharedObject;
   import flash.system.Capabilities;
   
   public class Languages
   {
      
      public static const SHARED_LANG_NAME:String = "LanguagePreference";
      
      public static var sharedObject:SharedObject;
      
      private static var _singleton:com.scenarioLauncher.configuration.Languages;
       
      
      public function Languages(param1:Class)
      {
         super();
         if(param1 != SingletonLock)
         {
            throw new Error("Invalid Singleton access.  Use Languages.instance.");
         }
         sharedObject = SharedObject.getLocal(SHARED_LANG_NAME);
      }
      
      public static function get instance() : com.scenarioLauncher.configuration.Languages
      {
         if(_singleton == null)
         {
            _singleton = new com.scenarioLauncher.configuration.Languages(SingletonLock);
         }
         return _singleton;
      }
      
      public function getDefaultLanguage() : String
      {
         var _loc1_:String = "null";
         var _loc2_:String = "en_US";
         if(false)
         {
            if(sharedObject.data.lang != null)
            {
               return String(sharedObject.data.lang);
            }
         }
         switch(_loc1_)
         {
            case "en":
               _loc2_ = "en_US";
               break;
            case "de":
               _loc2_ = "de_DE";
               break;
            case "fr":
               _loc2_ = "fr_FR";
               break;
            case "es":
               _loc2_ = "es_ES";
               break;
            case "cs":
               _loc2_ = "cz_CZ";
               break;
            case "da":
               _loc2_ = "dk_DK";
               break;
            case "nl":
               _loc2_ = "nl_NL";
               break;
            case "fi":
               _loc2_ = "fi_FI";
               break;
            case "hu":
               _loc2_ = "hu_HU";
               break;
            case "it":
               _loc2_ = "it_IT";
               break;
            case "pt":
               _loc2_ = "pt_PT";
               break;
            case "pl":
               _loc2_ = "pl_PL";
               break;
            case "sv":
               _loc2_ = "se_SE";
               break;
            case "no":
               _loc2_ = "no_NO";
               break;
            case "ru":
               _loc2_ = "ru_RU";
               break;
            default:
               _loc2_ = "en_US";
         }
         return _loc2_;
      }
      
      public function saveLanguage(param1:String) : void
      {
         sharedObject.data.lang = param1;
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
