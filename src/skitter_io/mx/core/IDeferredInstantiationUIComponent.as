package mx.core
{
   public interface IDeferredInstantiationUIComponent extends IUIComponent
   {
       
      
      function set cacheHeuristic(param1:Boolean) : void;
      
      function createReferenceOnParentDocument(param1:IFlexDisplayObject) : void;
      
      function get cachePolicy() : String;
      
      function set id(param1:String) : void;
      
      function registerEffects(param1:Array) : void;
      
      function executeBindings(param1:Boolean = false) : void;
      
      function get id() : String;
      
      function deleteReferenceOnParentDocument(param1:IFlexDisplayObject) : void;
      
      function set descriptor(param1:UIComponentDescriptor) : void;
      
      function get descriptor() : UIComponentDescriptor;
   }
}
