package air.update.descriptors
{
   import air.update.utils.Constants;
   
   public class ConfigurationDescriptor
   {
      
      public static const DIALOG_INSTALL_UPDATE:String = "installupdate";
      
      public static const DIALOG_DOWNLOAD_UPDATE:String = "downloadupdate";
      
      public static const DIALOG_DOWNLOAD_PROGRESS:String = "downloadprogress";
      
      public static const DIALOG_CHECK_FOR_UPDATE:String = "checkforupdate";
      
      public static const NAMESPACE_CONFIGURATION_1_0:Namespace = new Namespace("http://ns.adobe.com/air/framework/update/configuration/1.0");
      
      public static const DIALOG_UNEXPECTED_ERROR:String = "unexpectederror";
      
      public static const DIALOG_FILE_UPDATE:String = "fileupdate";
       
      
      private var defaultNS:Namespace;
      
      private var xml:XML;
      
      public function ConfigurationDescriptor(param1:XML)
      {
         super();
         this.xml = param1;
         this.defaultNS = param1.namespace();
      }
      
      private static function validateDefaultUI(param1:XMLList) : Boolean
      {
         var _loc3_:* = null;
         default xml namespace = _loc2_;
         if(param1.length() > 1)
         {
            return false;
         }
         var _loc2_:XMLList = param1.*;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.name() == null)
            {
               return false;
            }
            if(_loc3_.name().localName != "dialog")
            {
               return false;
            }
            if([DIALOG_CHECK_FOR_UPDATE,DIALOG_DOWNLOAD_UPDATE,DIALOG_DOWNLOAD_PROGRESS,DIALOG_INSTALL_UPDATE,DIALOG_FILE_UPDATE,DIALOG_UNEXPECTED_ERROR].indexOf(_loc3_.@name.toString().toLowerCase()) == -1)
            {
               return false;
            }
            if(["true","false"].indexOf(_loc3_.@visible.toString()) == -1)
            {
               return false;
            }
            if(_loc3_.hasComplexContent())
            {
               return false;
            }
         }
         return true;
      }
      
      public static function isThisVersion(param1:Namespace) : Boolean
      {
         return Boolean(param1) && param1.uri == NAMESPACE_CONFIGURATION_1_0.uri;
      }
      
      private static function validateInterval(param1:String) : Boolean
      {
         var result:Boolean;
         var intervalNumber:Number = NaN;
         var intervalString:String = param1;
         default xml namespace = result;
         result = false;
         if(intervalString.length > 0)
         {
            try
            {
               intervalNumber = Number(intervalString);
               if(intervalNumber >= 0)
               {
                  result = true;
               }
            }
            catch(theException:*)
            {
               result = false;
            }
         }
         else
         {
            result = true;
         }
         return result;
      }
      
      private static function convertInterval(param1:String) : Number
      {
         default xml namespace = _loc2_;
         var _loc2_:Number = -1;
         if(param1.length > 0)
         {
            _loc2_ = Number(param1);
         }
         return _loc2_;
      }
      
      private function stringToBoolean_defaultFalse(param1:String) : Boolean
      {
         default xml namespace = this.defaultNS;
         switch(param1)
         {
            case "true":
            case "1":
               return true;
            case "":
            case "false":
            case "0":
               return false;
            default:
               return false;
         }
      }
      
      public function get defaultUI() : Array
      {
         var _loc2_:* = null;
         var _loc3_:Object = null;
         default xml namespace = this.defaultNS;
         var _loc1_:Array = new Array();
         for each(_loc2_ in this.xml.defaultUI.*)
         {
            _loc3_ = {
               "name":_loc2_.@name,
               "visible":this.stringToBoolean_defaultFalse(_loc2_.@visible)
            };
            _loc1_.push(_loc3_);
         }
         return _loc1_;
      }
      
      public function validate() : void
      {
         default xml namespace = this.defaultNS;
         if(!isThisVersion(this.defaultNS))
         {
            throw new Error("unknown configuration version",Constants.ERROR_CONFIGURATION_UNKNOWN);
         }
         if(this.url == "")
         {
            throw new Error("configuration url must have a non-empty value",Constants.ERROR_URL_MISSING);
         }
         if(!validateInterval(this.xml.delay.toString()))
         {
            throw new Error("Illegal value \"" + this.xml.delay.toString() + "\" for configuration/delay",Constants.ERROR_DELAY_INVALID);
         }
         if(!validateDefaultUI(this.xml.defaultUI))
         {
            throw new Error("Illegal values for configuration/defaultUI",Constants.ERROR_DEFAULTUI_INVALID);
         }
      }
      
      public function get checkInterval() : Number
      {
         default xml namespace = this.defaultNS;
         return convertInterval(this.xml.delay.toString());
      }
      
      public function get url() : String
      {
         default xml namespace = this.defaultNS;
         return this.xml.url.toString();
      }
   }
}
