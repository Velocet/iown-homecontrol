package mx.utils
{
   import flash.display.LoaderInfo;
   import mx.core.mx_internal;
   
   public class LoaderUtil
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      mx_internal static var urlFilters:Array = [{
         "searchString":"/[[DYNAMIC]]/",
         "filterFunction":dynamicURLFilter
      },{
         "searchString":"/[[IMPORT]]/",
         "filterFunction":importURLFilter
      }];
       
      
      public function LoaderUtil()
      {
         super();
      }
      
      private static function importURLFilter(param1:String, param2:int) : String
      {
         var _loc3_:int = param1.indexOf("://");
         return param1.substring(0,_loc3_ + 3) + param1.substring(param2 + 12);
      }
      
      public static function normalizeURL(param1:LoaderInfo) : String
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Function = null;
         var _loc2_:String = param1.url;
         var _loc6_:uint = uint(LoaderUtil.mx_internal::urlFilters.length);
         var _loc7_:Number = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = String(LoaderUtil.mx_internal::urlFilters[_loc7_].searchString);
            if((_loc3_ = _loc2_.indexOf(_loc4_)) != -1)
            {
               _loc2_ = (_loc5_ = LoaderUtil.mx_internal::urlFilters[_loc7_].filterFunction)(_loc2_,_loc3_);
            }
            _loc7_++;
         }
         return _loc2_;
      }
      
      public static function createAbsoluteURL(param1:String, param2:String) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:String = param2;
         if(Boolean(param1) && !(param2.indexOf(":") > -1 || param2.indexOf("/") == 0 || param2.indexOf("\\") == 0))
         {
            if((_loc4_ = param1.indexOf("?")) != -1)
            {
               param1 = param1.substring(0,_loc4_);
            }
            if((_loc4_ = param1.indexOf("#")) != -1)
            {
               param1 = param1.substring(0,_loc4_);
            }
            _loc5_ = Math.max(param1.lastIndexOf("\\"),param1.lastIndexOf("/"));
            if(param2.indexOf("./") == 0)
            {
               param2 = param2.substring(2);
            }
            else
            {
               while(param2.indexOf("../") == 0)
               {
                  param2 = param2.substring(3);
                  _loc5_ = Math.max(param1.lastIndexOf("\\",_loc5_ - 1),param1.lastIndexOf("/",_loc5_ - 1));
               }
            }
            if(_loc5_ != -1)
            {
               _loc3_ = param1.substr(0,_loc5_ + 1) + param2;
            }
         }
         return _loc3_;
      }
      
      private static function dynamicURLFilter(param1:String, param2:int) : String
      {
         return param1.substring(0,param2);
      }
   }
}
