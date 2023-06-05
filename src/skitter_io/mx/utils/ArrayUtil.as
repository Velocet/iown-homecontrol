package mx.utils
{
   import mx.core.mx_internal;
   
   public class ArrayUtil
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ArrayUtil()
      {
         super();
      }
      
      public static function getItemIndex(param1:Object, param2:Array) : int
      {
         var _loc3_:int = int(param2.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param2[_loc4_] === param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public static function toArray(param1:Object) : Array
      {
         if(!param1)
         {
            return [];
         }
         if(param1 is Array)
         {
            return param1 as Array;
         }
         return [param1];
      }
   }
}
