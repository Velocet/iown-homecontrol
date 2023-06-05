package mx.messaging.messages
{
   public interface IMessage
   {
       
      
      function get body() : Object;
      
      function set messageId(param1:String) : void;
      
      function get clientId() : String;
      
      function set timeToLive(param1:Number) : void;
      
      function get messageId() : String;
      
      function set body(param1:Object) : void;
      
      function set timestamp(param1:Number) : void;
      
      function get headers() : Object;
      
      function get destination() : String;
      
      function set clientId(param1:String) : void;
      
      function get timeToLive() : Number;
      
      function get timestamp() : Number;
      
      function toString() : String;
      
      function set headers(param1:Object) : void;
      
      function set destination(param1:String) : void;
   }
}
