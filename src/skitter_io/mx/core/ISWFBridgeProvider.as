package mx.core
{
   import flash.events.IEventDispatcher;
   
   public interface ISWFBridgeProvider
   {
       
      
      function get childAllowsParent() : Boolean;
      
      function get swfBridge() : IEventDispatcher;
      
      function get parentAllowsChild() : Boolean;
   }
}
