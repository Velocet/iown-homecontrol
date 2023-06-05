package mx.collections
{
   import flash.events.IEventDispatcher;
   
   public interface IList extends IEventDispatcher
   {
       
      
      function addItem(param1:Object) : void;
      
      function get length() : int;
      
      function addItemAt(param1:Object, param2:int) : void;
      
      function itemUpdated(param1:Object, param2:Object = null, param3:Object = null, param4:Object = null) : void;
      
      function getItemIndex(param1:Object) : int;
      
      function removeItemAt(param1:int) : Object;
      
      function getItemAt(param1:int, param2:int = 0) : Object;
      
      function removeAll() : void;
      
      function toArray() : Array;
      
      function setItemAt(param1:Object, param2:int) : Object;
   }
}
