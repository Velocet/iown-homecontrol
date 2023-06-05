package mx.collections
{
   import flash.events.IEventDispatcher;
   
   public interface ICollectionView extends IEventDispatcher
   {
       
      
      function set filterFunction(param1:Function) : void;
      
      function enableAutoUpdate() : void;
      
      function get length() : int;
      
      function disableAutoUpdate() : void;
      
      function itemUpdated(param1:Object, param2:Object = null, param3:Object = null, param4:Object = null) : void;
      
      function get filterFunction() : Function;
      
      function createCursor() : IViewCursor;
      
      function refresh() : Boolean;
      
      function set sort(param1:Sort) : void;
      
      function get sort() : Sort;
      
      function contains(param1:Object) : Boolean;
   }
}
