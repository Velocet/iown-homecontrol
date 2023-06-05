package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class InterManagerRequest extends Event
   {
      
      public static const TOOLTIP_MANAGER_REQUEST:String = "tooltipManagerRequest";
      
      public static const SYSTEM_MANAGER_REQUEST:String = "systemManagerRequest";
      
      public static const INIT_MANAGER_REQUEST:String = "initManagerRequest";
      
      public static const DRAG_MANAGER_REQUEST:String = "dragManagerRequest";
      
      public static const CURSOR_MANAGER_REQUEST:String = "cursorManagerRequest";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var value:Object;
      
      public var name:String;
      
      public function InterManagerRequest(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Object = null)
      {
         super(param1,param2,param3);
         this.name = param4;
         this.value = param5;
      }
      
      override public function clone() : Event
      {
         return new InterManagerRequest(type,bubbles,cancelable,name,value);
      }
   }
}
