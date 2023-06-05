package mx.rpc.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   import mx.messaging.events.MessageFaultEvent;
   import mx.messaging.messages.AbstractMessage;
   import mx.messaging.messages.IMessage;
   import mx.rpc.AsyncToken;
   import mx.rpc.Fault;
   
   public class FaultEvent extends AbstractEvent
   {
      
      public static const FAULT:String = "fault";
       
      
      private var _fault:Fault;
      
      private var _headers:Object;
      
      private var _statusCode:int;
      
      public function FaultEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:Fault = null, param5:AsyncToken = null, param6:IMessage = null)
      {
         super(param1,param2,param3,param5,param6);
         if(param6 != null && param6.headers != null)
         {
            _statusCode = param6.headers[AbstractMessage.STATUS_CODE_HEADER] as int;
         }
         _fault = param4;
      }
      
      public static function createEventFromMessageFault(param1:MessageFaultEvent, param2:AsyncToken = null) : FaultEvent
      {
         var _loc3_:Fault = new Fault(param1.faultCode,param1.faultString,param1.faultDetail);
         _loc3_.rootCause = param1.rootCause;
         return new FaultEvent(FaultEvent.FAULT,false,true,_loc3_,param2,param1.message);
      }
      
      public static function createEvent(param1:Fault, param2:AsyncToken = null, param3:IMessage = null) : FaultEvent
      {
         return new FaultEvent(FaultEvent.FAULT,false,true,param1,param2,param3);
      }
      
      public function get fault() : Fault
      {
         return _fault;
      }
      
      public function set headers(param1:Object) : void
      {
         _headers = param1;
      }
      
      override mx_internal function callTokenResponders() : void
      {
         if(token != null)
         {
            token.mx_internal::applyFault(this);
         }
      }
      
      public function get headers() : Object
      {
         return _headers;
      }
      
      override public function toString() : String
      {
         return formatToString("FaultEvent","fault","messageId","type","bubbles","cancelable","eventPhase");
      }
      
      override public function clone() : Event
      {
         return new FaultEvent(type,bubbles,cancelable,fault,token,message);
      }
      
      public function get statusCode() : int
      {
         return _statusCode;
      }
   }
}
