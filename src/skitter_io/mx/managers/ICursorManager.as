package mx.managers
{
   public interface ICursorManager
   {
       
      
      function removeAllCursors() : void;
      
      function set currentCursorYOffset(param1:Number) : void;
      
      function removeBusyCursor() : void;
      
      function unRegisterToUseBusyCursor(param1:Object) : void;
      
      function hideCursor() : void;
      
      function get currentCursorID() : int;
      
      function registerToUseBusyCursor(param1:Object) : void;
      
      function setBusyCursor() : void;
      
      function showCursor() : void;
      
      function set currentCursorID(param1:int) : void;
      
      function setCursor(param1:Class, param2:int = 2, param3:Number = 0, param4:Number = 0) : int;
      
      function removeCursor(param1:int) : void;
      
      function get currentCursorXOffset() : Number;
      
      function get currentCursorYOffset() : Number;
      
      function set currentCursorXOffset(param1:Number) : void;
   }
}
