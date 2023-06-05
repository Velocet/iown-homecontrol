package mx.utils
{
   import mx.core.mx_internal;
   
   public class RPCStringUtil
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function RPCStringUtil()
      {
         super();
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         var _loc2_:int = 0;
         while(isWhitespace(param1.charAt(_loc2_)))
         {
            _loc2_++;
         }
         var _loc3_:int = param1.length - 1;
         while(isWhitespace(param1.charAt(_loc3_)))
         {
            _loc3_--;
         }
         if(_loc3_ >= _loc2_)
         {
            return param1.slice(_loc2_,_loc3_ + 1);
         }
         return "";
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         switch(param1)
         {
            case " ":
            case "\t":
            case "\r":
            case "\n":
            case "\f":
               return true;
            default:
               return false;
         }
      }
      
      public static function substitute(param1:String, ... rest) : String
      {
         var _loc4_:Array = null;
         if(param1 == null)
         {
            return "";
         }
         var _loc3_:uint = uint(rest.length);
         if(_loc3_ == 1 && rest[0] is Array)
         {
            _loc3_ = (_loc4_ = rest[0] as Array).length;
         }
         else
         {
            _loc4_ = rest;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            param1 = param1.replace(new RegExp("\\{" + _loc5_ + "\\}","g"),_loc4_[_loc5_]);
            _loc5_++;
         }
         return param1;
      }
      
      public static function trimArrayElements(param1:String, param2:String) : String
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 != "" && param1 != null)
         {
            _loc3_ = param1.split(param2);
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_[_loc5_] = trim(_loc3_[_loc5_]);
               _loc5_++;
            }
            if(_loc4_ > 0)
            {
               param1 = _loc3_.join(param2);
            }
         }
         return param1;
      }
   }
}
