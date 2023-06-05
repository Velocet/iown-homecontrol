package mx.utils
{
   import flash.display.DisplayObject;
   import flash.utils.getQualifiedClassName;
   import mx.core.IRepeaterClient;
   import mx.core.mx_internal;
   
   public class NameUtil
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var counter:int = 0;
       
      
      public function NameUtil()
      {
         super();
      }
      
      public static function displayObjectToString(param1:DisplayObject) : String
      {
         var result:String = null;
         var o:DisplayObject = null;
         var s:String = null;
         var indices:Array = null;
         var displayObject:DisplayObject = param1;
         try
         {
            o = displayObject;
            while(o != null)
            {
               if(o.parent && o.stage && o.parent == o.stage)
               {
                  break;
               }
               s = o.name;
               if(o is IRepeaterClient)
               {
                  indices = IRepeaterClient(o).instanceIndices;
                  if(indices)
                  {
                     s += "[" + indices.join("][") + "]";
                  }
               }
               result = result == null ? s : s + "." + result;
               o = o.parent;
            }
         }
         catch(e:SecurityError)
         {
         }
         return result;
      }
      
      public static function createUniqueName(param1:Object) : String
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:* = getQualifiedClassName(param1);
         var _loc3_:int = _loc2_.indexOf("::");
         if(_loc3_ != -1)
         {
            _loc2_ = _loc2_.substr(_loc3_ + 2);
         }
         var _loc4_:int;
         if((_loc4_ = _loc2_.charCodeAt(_loc2_.length - 1)) >= 48 && _loc4_ <= 57)
         {
            _loc2_ += "_";
         }
         return _loc2_ + counter++;
      }
   }
}
