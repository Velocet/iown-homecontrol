package nz.co.codec.flexorm.util
{
   import mx.utils.StringUtil;
   
   public class StringUtils
   {
       
      
      public function StringUtils()
      {
         super();
      }
      
      public static function isNumber(param1:String, param2:int = 0) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         var _loc3_:int = param1.charCodeAt(param2);
         return _loc3_ > 47 && _loc3_ < 58;
      }
      
      public static function parseBoolean(param1:String, param2:Boolean) : Boolean
      {
         if(param1 == null)
         {
            return param2;
         }
         switch(StringUtil.trim(param1))
         {
            case "":
               return param2;
            case "true":
               return true;
            case "false":
               return false;
            default:
               throw new Error("Cannot parse Boolean from \'" + param1 + "\'");
         }
      }
      
      public static function camelCase(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc3_ > 0 && param1.charAt(_loc3_) == "_")
            {
               _loc2_ += param1.charAt(++_loc3_).toUpperCase();
            }
            else
            {
               _loc2_ += param1.charAt(_loc3_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function isLowerCase(param1:String, param2:int = 0) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         var _loc3_:int = param1.charCodeAt(param2);
         return _loc3_ > 96 && _loc3_ < 123;
      }
      
      public static function isUpperCase(param1:String, param2:int = 0) : Boolean
      {
         if(param2 >= param1.length)
         {
            return false;
         }
         var _loc3_:int = param1.charCodeAt(param2);
         return _loc3_ > 64 && _loc3_ < 91;
      }
      
      public static function underscore(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc3_ > 0 && isUpperCase(param1,_loc3_))
            {
               _loc2_ += "_" + param1.charAt(_loc3_).toLowerCase();
            }
            else if(_loc3_ > 0 && isNumber(param1,_loc3_))
            {
               _loc2_ += "_" + param1.charAt(_loc3_);
            }
            else
            {
               _loc2_ += param1.charAt(_loc3_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function convertCamelCaseToSpaced(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc3_ > 0 && isUpperCase(param1,_loc3_))
            {
               _loc2_ += " " + param1.charAt(_loc3_).toLowerCase();
            }
            else if(_loc3_ > 0 && isNumber(param1,_loc3_))
            {
               _loc2_ += " " + param1.charAt(_loc3_);
            }
            else
            {
               _loc2_ += param1.charAt(_loc3_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function endsWith(param1:String, param2:String) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         return param1.lastIndexOf(param2) == param1.length - param2.length;
      }
      
      public static function startLowerCase(param1:String) : String
      {
         return param1.substr(0,1).toLowerCase() + param1.substr(1);
      }
   }
}
