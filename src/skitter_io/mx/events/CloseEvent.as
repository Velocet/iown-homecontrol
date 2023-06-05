package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class CloseEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const CLOSE:String = "close";
       
      
      public var detail:int;
      
      public function CloseEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1)
      {
         super(param1,param2,param3);
         this.detail = param4;
      }
      
      override public function clone() : Event
      {
         return new CloseEvent(type,bubbles,cancelable,detail);
      }
   }
}
