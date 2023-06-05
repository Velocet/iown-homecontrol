package mx.messaging.config
{
   import mx.core.mx_internal;
   
   public class LoaderConfig
   {
      
      mx_internal static var _parameters:Object;
      
      mx_internal static var _swfVersion:uint;
      
      mx_internal static var _url:String = null;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function LoaderConfig()
      {
         super();
      }
      
      public static function get parameters() : Object
      {
         return mx_internal::_parameters;
      }
      
      public static function get url() : String
      {
         return mx_internal::_url;
      }
      
      public static function get swfVersion() : uint
      {
         return mx_internal::_swfVersion;
      }
   }
}
