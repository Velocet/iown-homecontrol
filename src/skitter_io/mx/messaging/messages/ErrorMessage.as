package mx.messaging.messages
{
   public class ErrorMessage extends AcknowledgeMessage
   {
      
      public static const RETRYABLE_HINT_HEADER:String = "DSRetryableErrorHint";
      
      public static const MESSAGE_DELIVERY_IN_DOUBT:String = "Client.Error.DeliveryInDoubt";
       
      
      public var faultString:String;
      
      public var extendedData:Object;
      
      public var rootCause:Object;
      
      public var faultCode:String;
      
      public var faultDetail:String;
      
      public function ErrorMessage()
      {
         super();
      }
      
      override public function getSmallMessage() : IMessage
      {
         return null;
      }
   }
}
