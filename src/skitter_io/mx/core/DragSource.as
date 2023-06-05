package mx.core
{
   public class DragSource
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var formatHandlers:Object;
      
      private var dataHolder:Object;
      
      private var _formats:Array;
      
      public function DragSource()
      {
         dataHolder = {};
         formatHandlers = {};
         _formats = [];
         super();
      }
      
      public function hasFormat(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_formats[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function addData(param1:Object, param2:String) : void
      {
         _formats.push(param2);
         dataHolder[param2] = param1;
      }
      
      public function dataForFormat(param1:String) : Object
      {
         var _loc2_:Object = dataHolder[param1];
         if(_loc2_)
         {
            return _loc2_;
         }
         if(false)
         {
            return formatHandlers[param1]();
         }
         return null;
      }
      
      public function addHandler(param1:Function, param2:String) : void
      {
         _formats.push(param2);
         formatHandlers[param2] = param1;
      }
      
      public function get formats() : Array
      {
         return _formats;
      }
   }
}
