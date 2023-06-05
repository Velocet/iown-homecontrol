package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public dynamic class DynamicEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function DynamicEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc2_:String = null;
         var _loc1_:DynamicEvent = new DynamicEvent(type,bubbles,cancelable);
         for(_loc2_ in {})
         {
            _loc1_[_loc2_] = this[_loc2_];
         }
         return _loc1_;
      }
   }
}
