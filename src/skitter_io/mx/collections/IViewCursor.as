package mx.collections
{
   import flash.events.IEventDispatcher;
   
   public interface IViewCursor extends IEventDispatcher
   {
       
      
      [Bindable("cursorUpdate")]
      function get current() : Object;
      
      function moveNext() : Boolean;
      
      function get view() : ICollectionView;
      
      function movePrevious() : Boolean;
      
      function remove() : Object;
      
      function findLast(param1:Object) : Boolean;
      
      [Bindable("cursorUpdate")]
      function get beforeFirst() : Boolean;
      
      [Bindable("cursorUpdate")]
      function get afterLast() : Boolean;
      
      function findAny(param1:Object) : Boolean;
      
      [Bindable("cursorUpdate")]
      function get bookmark() : CursorBookmark;
      
      function findFirst(param1:Object) : Boolean;
      
      function seek(param1:CursorBookmark, param2:int = 0, param3:int = 0) : void;
      
      function insert(param1:Object) : void;
   }
}
