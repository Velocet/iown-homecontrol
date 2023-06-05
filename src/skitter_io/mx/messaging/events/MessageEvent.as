package mx.messaging.events
{
   import flash.events.Event;
   import mx.messaging.messages.IMessage;
   
   public class MessageEvent extends Event
   {
      
      public static const RESULT:String = "result";
      
      public static const MESSAGE:String = "message";
       
      
      public var message:IMessage;
      
      public function MessageEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:IMessage = null)
      {
         super(param1,param2,param3);
         this.message = param4;
      }
      
      public static function createEvent(param1:String, param2:IMessage) : MessageEvent
      {
         return new MessageEvent(param1,false,false,param2);
      }
      
      public function get messageId() : String
      {
         if(message != null)
         {
            return message.messageId;
         }
         return null;
      }
      
      override public function toString() : String
      {
         return formatToString("MessageEvent","messageId","type","bubbles","cancelable","eventPhase");
      }
      
      override public function clone() : Event
      {
         return new MessageEvent(type,bubbles,cancelable,message);
      }
   }
}
