package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class EventListenerRequest extends SWFBridgeRequest
   {
      
      public static const REMOVE_EVENT_LISTENER_REQUEST:String = "removeEventListenerRequest";
      
      public static const ADD_EVENT_LISTENER_REQUEST:String = "addEventListenerRequest";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _priority:int;
      
      private var _useWeakReference:Boolean;
      
      private var _eventType:String;
      
      private var _useCapture:Boolean;
      
      public function EventListenerRequest(param1:String, param2:Boolean = false, param3:Boolean = true, param4:String = null, param5:Boolean = false, param6:int = 0, param7:Boolean = false)
      {
         super(param1,false,false);
         _eventType = param4;
         _useCapture = param5;
         _priority = param6;
         _useWeakReference = param7;
      }
      
      public static function marshal(param1:Event) : EventListenerRequest
      {
         var _loc2_:Object = param1;
         return new EventListenerRequest(_loc2_.type,_loc2_.bubbles,_loc2_.cancelable,_loc2_.eventType,_loc2_.useCapture,_loc2_.priority,_loc2_.useWeakReference);
      }
      
      public function get priority() : int
      {
         return _priority;
      }
      
      public function get useWeakReference() : Boolean
      {
         return _useWeakReference;
      }
      
      public function get eventType() : String
      {
         return _eventType;
      }
      
      override public function clone() : Event
      {
         return new EventListenerRequest(type,bubbles,cancelable,eventType,useCapture,priority,useWeakReference);
      }
      
      public function get useCapture() : Boolean
      {
         return _useCapture;
      }
   }
}
