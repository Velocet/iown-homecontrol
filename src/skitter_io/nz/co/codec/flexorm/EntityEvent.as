package nz.co.codec.flexorm
{
   import flash.events.Event;
   
   public class EntityEvent extends Event
   {
       
      
      private var _data:Object;
      
      public function EntityEvent(param1:Object = null, param2:Boolean = false, param3:Boolean = false)
      {
         super("entityChange",param2,param3);
         this._data = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
   }
}
