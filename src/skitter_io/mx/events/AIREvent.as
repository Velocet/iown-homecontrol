package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class AIREvent extends Event
   {
      
      public static const WINDOW_ACTIVATE:String = "windowActivate";
      
      public static const APPLICATION_DEACTIVATE:String = "applicationDeactivate";
      
      public static const WINDOW_COMPLETE:String = "windowComplete";
      
      public static const APPLICATION_ACTIVATE:String = "applicationActivate";
      
      public static const WINDOW_DEACTIVATE:String = "windowDeactivate";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function AIREvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new AIREvent(type,bubbles,cancelable);
      }
   }
}
