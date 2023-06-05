package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class ScrollEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const SCROLL:String = "scroll";
       
      
      public var detail:String;
      
      public var delta:Number;
      
      public var position:Number;
      
      public var direction:String;
      
      public function ScrollEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Number = NaN, param6:String = null, param7:Number = NaN)
      {
         super(param1,param2,param3);
         this.detail = param4;
         this.position = param5;
         this.direction = param6;
         this.delta = param7;
      }
      
      override public function clone() : Event
      {
         return new ScrollEvent(type,bubbles,cancelable,detail,position,direction,delta);
      }
   }
}
