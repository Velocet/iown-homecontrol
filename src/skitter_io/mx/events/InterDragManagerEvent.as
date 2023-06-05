package mx.events
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import mx.core.DragSource;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   
   public class InterDragManagerEvent extends DragEvent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const DISPATCH_DRAG_EVENT:String = "dispatchDragEvent";
       
      
      public var dropTarget:DisplayObject;
      
      public var dragEventType:String;
      
      public function InterDragManagerEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Number = NaN, param5:Number = NaN, param6:InteractiveObject = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:int = 0, param12:DisplayObject = null, param13:String = null, param14:IUIComponent = null, param15:DragSource = null, param16:String = null, param17:Object = null)
      {
         super(param1,false,false,param14,param15,param16,param7,param8,param9);
         this.dropTarget = param12;
         this.dragEventType = param13;
         this.draggedItem = param17;
         this.localX = param4;
         this.localY = param5;
         this.buttonDown = param10;
         this.delta = param11;
         this.relatedObject = param6;
      }
      
      override public function clone() : Event
      {
         return new InterDragManagerEvent(type,bubbles,cancelable,localX,localY,relatedObject,ctrlKey,altKey,shiftKey,buttonDown,delta,dropTarget,dragEventType,dragInitiator,dragSource,action,draggedItem);
      }
   }
}
