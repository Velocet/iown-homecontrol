package air.update.descriptors
{
   import air.update.utils.Constants;
   
   public class UpdateDescriptor
   {
      
      public static const NAMESPACE_UPDATE_1_0:Namespace = new Namespace("http://ns.adobe.com/air/framework/update/description/1.0");
       
      
      private var defaultNS:Namespace;
      
      private var xml:XML;
      
      public function UpdateDescriptor(param1:XML)
      {
         super();
         this.xml = param1;
         this.defaultNS = param1.namespace();
      }
      
      public static function getLocalizedText(param1:XMLList, param2:Namespace) : Array
      {
         var _loc5_:XMLList = null;
         var _loc6_:* = null;
         default xml namespace = param2;
         var _loc3_:Namespace = new Namespace("http://www.w3.org/XML/1998/namespace");
         var _loc4_:* = [];
         if(param1.hasSimpleContent())
         {
            _loc4_ = [["",param1.toString()]];
         }
         else
         {
            _loc5_ = param1.param2::text;
            for each(_loc6_ in _loc5_)
            {
               _loc4_.push([_loc6_._loc3_::@lang.toString(),_loc6_[0].toString()]);
            }
         }
         return _loc4_;
      }
      
      private static function validateLocalizedText(param1:XMLList, param2:Namespace) : Boolean
      {
         var _loc5_:* = null;
         default xml namespace = param2;
         var _loc3_:Namespace = new Namespace("http://www.w3.org/XML/1998/namespace");
         if(param1.hasSimpleContent())
         {
            return true;
         }
         if(param1.length() > 1)
         {
            return false;
         }
         var _loc4_:XMLList = param1.*;
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.name() == null)
            {
               return false;
            }
            if(_loc5_.name().localName != "text")
            {
               return false;
            }
            if(_loc5_._loc3_::@lang.length() == 0)
            {
               return false;
            }
            if(!_loc5_.hasSimpleContent())
            {
               return false;
            }
         }
         return true;
      }
      
      public static function isThisVersion(param1:Namespace) : Boolean
      {
         return Boolean(param1) && param1.uri == NAMESPACE_UPDATE_1_0.uri;
      }
      
      public function getXML() : XML
      {
         default xml namespace = this.defaultNS;
         return this.xml;
      }
      
      public function get version() : String
      {
         default xml namespace = this.defaultNS;
         return this.xml.version.toString();
      }
      
      public function get description() : Array
      {
         default xml namespace = this.defaultNS;
         return UpdateDescriptor.getLocalizedText(this.xml.description,this.defaultNS);
      }
      
      public function validate() : void
      {
         default xml namespace = this.defaultNS;
         if(!isThisVersion(this.defaultNS))
         {
            throw new Error("unknown update version",Constants.ERROR_UPDATE_UNKNOWN);
         }
         if(this.version == "")
         {
            throw new Error("update version must have a non-empty value",Constants.ERROR_VERSION_MISSING);
         }
         if(this.url == "")
         {
            throw new Error("update url must have a non-empty value",Constants.ERROR_URL_MISSING);
         }
         if(!validateLocalizedText(this.xml.description,this.defaultNS))
         {
            throw new Error("Illegal values for update/description",Constants.ERROR_DESCRIPTION_INVALID);
         }
      }
      
      public function get url() : String
      {
         default xml namespace = this.defaultNS;
         return this.xml.url.toString();
      }
   }
}
