package mx.resources
{
   import flash.system.ApplicationDomain;
   import mx.core.mx_internal;
   
   public class ResourceBundle implements IResourceBundle
   {
      
      mx_internal static const VERSION:String = "4.0.0.13827";
      
      mx_internal static var locale:String;
      
      mx_internal static var backupApplicationDomain:ApplicationDomain;
       
      
      mx_internal var _bundleName:String;
      
      private var _content:Object;
      
      mx_internal var _locale:String;
      
      public function ResourceBundle(param1:String = null, param2:String = null)
      {
         this._content = {};
         super();
         this.mx_internal::_locale = param1;
         this.mx_internal::_bundleName = param2;
         this._content = this.getContent();
      }
      
      private static function getClassByName(param1:String, param2:ApplicationDomain) : Class
      {
         var _loc3_:Class = null;
         if(param2.hasDefinition(param1))
         {
            _loc3_ = param2.getDefinition(param1) as Class;
         }
         return _loc3_;
      }
      
      public function get bundleName() : String
      {
         return this.mx_internal::_bundleName;
      }
      
      public function get content() : Object
      {
         return this._content;
      }
      
      public function get locale() : String
      {
         return this.mx_internal::_locale;
      }
      
      protected function getContent() : Object
      {
         return {};
      }
      
      private function _getObject(param1:String) : Object
      {
         var _loc2_:Object = this.content[param1];
         if(!_loc2_)
         {
            throw new Error("Key " + param1 + " was not found in resource bundle " + this.bundleName);
         }
         return _loc2_;
      }
   }
}
