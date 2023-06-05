package mx.core
{
   public interface IRepeater
   {
       
      
      function get container() : IContainer;
      
      function set startingIndex(param1:int) : void;
      
      function get startingIndex() : int;
      
      function set recycleChildren(param1:Boolean) : void;
      
      function get currentItem() : Object;
      
      function get count() : int;
      
      function get recycleChildren() : Boolean;
      
      function executeChildBindings() : void;
      
      function set dataProvider(param1:Object) : void;
      
      function initializeRepeater(param1:IContainer, param2:Boolean) : void;
      
      function get currentIndex() : int;
      
      function get dataProvider() : Object;
      
      function set count(param1:int) : void;
   }
}
