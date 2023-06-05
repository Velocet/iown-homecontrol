package mx.managers
{
   import flash.events.IEventDispatcher;
   
   public interface ILayoutManagerClient extends IEventDispatcher
   {
       
      
      function get updateCompletePendingFlag() : Boolean;
      
      function set updateCompletePendingFlag(param1:Boolean) : void;
      
      function set initialized(param1:Boolean) : void;
      
      function validateProperties() : void;
      
      function validateDisplayList() : void;
      
      function get nestLevel() : int;
      
      function get initialized() : Boolean;
      
      function get processedDescriptors() : Boolean;
      
      function validateSize(param1:Boolean = false) : void;
      
      function set nestLevel(param1:int) : void;
      
      function set processedDescriptors(param1:Boolean) : void;
   }
}
