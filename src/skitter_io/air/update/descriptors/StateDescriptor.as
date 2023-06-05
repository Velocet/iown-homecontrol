package air.update.descriptors
{
   import air.update.logging.Logger;
   import air.update.utils.Constants;
   import flash.filesystem.File;
   
   public class StateDescriptor
   {
      
      private static var logger:Logger = Logger.getLogger("air.update.descriptors.StateDescriptor");
      
      public static const NAMESPACE_STATE_1_0:Namespace = new Namespace("http://ns.adobe.com/air/framework/update/state/1.0");
       
      
      private var defaultNS:Namespace;
      
      private var xml:XML;
      
      public function StateDescriptor(param1:XML)
      {
         super();
         this.xml = param1;
         this.defaultNS = param1.namespace();
      }
      
      public static function isThisVersion(param1:Namespace) : Boolean
      {
         return Boolean(param1) && param1.uri == NAMESPACE_STATE_1_0.uri;
      }
      
      public static function defaultState() : StateDescriptor
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         var _loc1_:XML = <state>
					<lastCheck>{new Date()}</lastCheck>
				</state>;
         return new StateDescriptor(_loc1_);
      }
      
      public function set lastCheckDate(param1:Date) : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         this.xml.lastCheck = param1.toString();
      }
      
      public function set previousVersion(param1:String) : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         this.xml.previousVersion = param1;
      }
      
      private function fileToString_defaultEmpty(param1:File) : String
      {
         default xml namespace = this.defaultNS;
         if(Boolean(param1) && Boolean(param1.nativePath))
         {
            return param1.nativePath;
         }
         return "";
      }
      
      public function get storage() : File
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         return this.stringToFile_defaultNull(this.xml.storage.toString());
      }
      
      public function get failedUpdates() : Array
      {
         var _loc2_:* = null;
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         var _loc1_:Array = new Array();
         for each(_loc2_ in this.xml.failed.*)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function removeAllFailedUpdates() : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         this.xml.failed = <failed/>;
      }
      
      public function validate() : void
      {
         default xml namespace = this.defaultNS;
         if(!isThisVersion(this.defaultNS))
         {
            throw new Error("unknown state version",Constants.ERROR_STATE_UNKNOWN);
         }
         if(this.xml.lastCheck.toString() == "")
         {
            throw new Error("lastCheck must have a non-empty value",Constants.ERROR_LAST_CHECK_MISSING);
         }
         if(!this.validateDate(this.xml.lastCheck.toString()))
         {
            throw new Error("Invalid date format for state/lastCheck",Constants.ERROR_LAST_CHECK_INVALID);
         }
         if(this.xml.previousVersion.toString() != "" && !this.validateText(this.xml.previousVersion))
         {
            throw new Error("Illegal value for state/previousVersion",Constants.ERROR_PREV_VERSION_INVALID);
         }
         if(this.xml.currentVersion.toString() != "" && !this.validateText(this.xml.currentVersion))
         {
            throw new Error("Illegal value for state/currentVersion",Constants.ERROR_CURRENT_VERSION_INVALID);
         }
         if(this.xml.storage.toString() != "" && (!this.validateText(this.xml.storage) || !this.validateFile(this.xml.storage.toString())))
         {
            throw new Error("Illegal value for state/storage",Constants.ERROR_STORAGE_INVALID);
         }
         if(["","true","false"].indexOf(this.xml.updaterLaunched.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.xml.updaterLaunched.toString() + "\" for state/updaterLaunched.",Constants.ERROR_LAUNCHED_INVALID);
         }
         if(!this.validateFailed(this.xml.failed))
         {
            throw new Error("Illegal values for state/failed",Constants.ERROR_FAILED_INVALID);
         }
         var _loc1_:int = 0;
         if(this.previousVersion != "")
         {
            _loc1_++;
         }
         if(this.currentVersion != "")
         {
            _loc1_++;
         }
         if(this.storage)
         {
            _loc1_++;
         }
         if(_loc1_ > 0 && _loc1_ != 3)
         {
            throw new Error("All state/previousVersion, state/currentVersion, state/storage, state/updaterLaunched  must be set",Constants.ERROR_VERSIONS_INVALID);
         }
      }
      
      public function get currentVersion() : String
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         return this.xml.currentVersion.toString();
      }
      
      public function get lastCheckDate() : Date
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         return this.stringToDate_defaultNull(this.xml.lastCheck.toString());
      }
      
      public function getXML() : XML
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         return this.xml;
      }
      
      private function validateText(param1:XMLList) : Boolean
      {
         default xml namespace = this.defaultNS;
         if(!param1.hasSimpleContent())
         {
            return false;
         }
         if(param1.length() > 1)
         {
            return false;
         }
         return true;
      }
      
      private function validateDate(param1:String) : Boolean
      {
         var result:Boolean;
         var n:Number = NaN;
         var dateString:String = param1;
         default xml namespace = this.defaultNS;
         result = false;
         try
         {
            n = Date.parse(dateString);
            if(!isNaN(n))
            {
               result = true;
            }
         }
         catch(err:Error)
         {
            result = false;
         }
         return result;
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
      
      public function addFailedUpdate(param1:String) : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         if(this.xml.failed.length() == 0)
         {
            this.xml.failed = <failed/>;
         }
         this.xml.failed.appendChild(<version>{param1}</version>);
      }
      
      public function get previousVersion() : String
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         return this.xml.previousVersion.toString();
      }
      
      private function stringToDate_defaultNull(param1:String) : Date
      {
         default xml namespace = this.defaultNS;
         var _loc2_:Date = null;
         if(param1)
         {
            _loc2_ = new Date(param1);
         }
         return _loc2_;
      }
      
      private function stringToFile_defaultNull(param1:String) : File
      {
         default xml namespace = this.defaultNS;
         if(!param1)
         {
            return null;
         }
         return new File(param1);
      }
      
      private function validateFile(param1:String) : Boolean
      {
         var result:Boolean;
         var file:File = null;
         var fileString:String = param1;
         default xml namespace = this.defaultNS;
         result = false;
         try
         {
            file = new File(fileString);
            result = true;
         }
         catch(err:Error)
         {
            result = false;
         }
         return result;
      }
      
      public function set storage(param1:File) : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         this.xml.storage = this.fileToString_defaultEmpty(param1);
      }
      
      private function validateFailed(param1:XMLList) : Boolean
      {
         var _loc3_:* = null;
         default xml namespace = this.defaultNS;
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
            if(_loc3_.name().localName != "version")
            {
               return false;
            }
            if(!_loc3_.hasSimpleContent())
            {
               return false;
            }
         }
         return true;
      }
      
      public function get updaterLaunched() : Boolean
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         return this.stringToBoolean_defaultFalse(this.xml.updaterLaunched.toString());
      }
      
      public function set updaterLaunched(param1:Boolean) : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         this.xml.updaterLaunched = param1.toString();
      }
      
      public function set currentVersion(param1:String) : void
      {
         default xml namespace = StateDescriptor.NAMESPACE_STATE_1_0;
         this.xml.currentVersion = param1;
      }
   }
}
