package mx.core
{
   import flash.events.IEventDispatcher;
   
   public interface ISWFBridgeGroup
   {
       
      
      function getChildBridgeProvider(param1:IEventDispatcher) : ISWFBridgeProvider;
      
      function removeChildBridge(param1:IEventDispatcher) : void;
      
      function get parentBridge() : IEventDispatcher;
      
      function addChildBridge(param1:IEventDispatcher, param2:ISWFBridgeProvider) : void;
      
      function set parentBridge(param1:IEventDispatcher) : void;
      
      function containsBridge(param1:IEventDispatcher) : Boolean;
      
      function getChildBridges() : Array;
   }
}
