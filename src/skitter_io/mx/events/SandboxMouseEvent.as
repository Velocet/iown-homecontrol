package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class SandboxMouseEvent extends Event
   {
      
      public static const CLICK_SOMEWHERE:String = "clickSomewhere";
      
      public static const MOUSE_UP_SOMEWHERE:String = "mouseUpSomewhere";
      
      public static const DOUBLE_CLICK_SOMEWHERE:String = "coubleClickSomewhere";
      
      public static const MOUSE_WHEEL_SOMEWHERE:String = "mouseWheelSomewhere";
      
      public static const MOUSE_DOWN_SOMEWHERE:String = "mouseDownSomewhere";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const MOUSE_MOVE_SOMEWHERE:String = "mouseMoveSomewhere";
       
      
      public var buttonDown:Boolean;
      
      public var altKey:Boolean;
      
      public var ctrlKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public function SandboxMouseEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3);
         this.ctrlKey = param4;
         this.altKey = param5;
         this.shiftKey = param6;
         this.buttonDown = param7;
      }
      
      public static function marshal(param1:Event) : SandboxMouseEvent
      {
         var _loc2_:Object = param1;
         return new SandboxMouseEvent(_loc2_.type,_loc2_.bubbles,_loc2_.cancelable,_loc2_.ctrlKey,_loc2_.altKey,_loc2_.shiftKey,_loc2_.buttonDown);
      }
      
      override public function clone() : Event
      {
         return new SandboxMouseEvent(type,bubbles,cancelable,ctrlKey,altKey,shiftKey,buttonDown);
      }
   }
}
