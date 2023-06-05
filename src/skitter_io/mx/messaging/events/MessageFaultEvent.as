package mx.messaging.events
{
   import flash.events.Event;
   import mx.messaging.messages.ErrorMessage;
   
   public class MessageFaultEvent extends Event
   {
      
      public static const FAULT:String = "fault";
       
      
      public var message:ErrorMessage;
      
      public function MessageFaultEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:ErrorMessage = null)
      {
         super(param1,param2,param3);
         this.message = param4;
      }
      
      public static function createEvent(param1:ErrorMessage) : MessageFaultEvent
      {
         return new MessageFaultEvent(MessageFaultEvent.FAULT,false,false,param1);
      }
      
      public function get faultString() : String
      {
         return message.faultString;
      }
      
      public function get faultDetail() : String
      {
         return message.faultDetail;
      }
      
      public function get rootCause() : Object
      {
         return message.rootCause;
      }
      
      override public function toString() : String
      {
         return formatToString("MessageFaultEvent","faultCode","faultDetail","faultString","rootCause","type","bubbles","cancelable","eventPhase");
      }
      
      override public function clone() : Event
      {
         return new MessageFaultEvent(type,bubbles,cancelable,message);
      }
      
      public function get faultCode() : String
      {
         return message.faultCode;
      }
   }
}
