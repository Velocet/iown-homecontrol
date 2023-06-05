package mx.managers
{
   import flash.events.MouseEvent;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   
   public interface IDragManager
   {
       
      
      function showFeedback(param1:String) : void;
      
      function doDrag(param1:IUIComponent, param2:DragSource, param3:MouseEvent, param4:IFlexDisplayObject = null, param5:Number = 0, param6:Number = 0, param7:Number = 0.5, param8:Boolean = true) : void;
      
      function get isDragging() : Boolean;
      
      function getFeedback() : String;
      
      function acceptDragDrop(param1:IUIComponent) : void;
      
      function endDrag() : void;
   }
}
