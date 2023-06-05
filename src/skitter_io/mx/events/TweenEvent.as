package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class TweenEvent extends Event
   {
      
      public static const TWEEN_END:String = "tweenEnd";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const TWEEN_UPDATE:String = "tweenUpdate";
      
      public static const TWEEN_START:String = "tweenStart";
       
      
      public var value:Object;
      
      public function TweenEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Object = null)
      {
         super(param1,param2,param3);
         this.value = param4;
      }
      
      override public function clone() : Event
      {
         return new TweenEvent(type,bubbles,cancelable,value);
      }
   }
}
