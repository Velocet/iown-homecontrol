package mx.automation
{
   import flash.events.Event;
   
   public interface IAutomationObject
   {
       
      
      function createAutomationIDPart(param1:IAutomationObject) : Object;
      
      function get automationName() : String;
      
      function get showInAutomationHierarchy() : Boolean;
      
      function set automationName(param1:String) : void;
      
      function getAutomationChildAt(param1:int) : IAutomationObject;
      
      function get automationDelegate() : Object;
      
      function get automationTabularData() : Object;
      
      function resolveAutomationIDPart(param1:Object) : Array;
      
      function replayAutomatableEvent(param1:Event) : Boolean;
      
      function set automationDelegate(param1:Object) : void;
      
      function get automationValue() : Array;
      
      function get numAutomationChildren() : int;
      
      function set showInAutomationHierarchy(param1:Boolean) : void;
   }
}
