package mx.events
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.DragSource;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   
   public class DragEvent extends MouseEvent
   {
      
      public static const DRAG_DROP:String = "dragDrop";
      
      public static const DRAG_COMPLETE:String = "dragComplete";
      
      public static const DRAG_EXIT:String = "dragExit";
      
      public static const DRAG_ENTER:String = "dragEnter";
      
      public static const DRAG_START:String = "dragStart";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const DRAG_OVER:String = "dragOver";
       
      
      public var draggedItem:Object;
      
      public var action:String;
      
      public var dragInitiator:IUIComponent;
      
      public var dragSource:DragSource;
      
      public function DragEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:IUIComponent = null, param5:DragSource = null, param6:String = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3);
         this.dragInitiator = param4;
         this.dragSource = param5;
         this.action = param6;
         this.ctrlKey = param7;
         this.altKey = param8;
         this.shiftKey = param9;
      }
      
      override public function clone() : Event
      {
         var _loc1_:DragEvent = new DragEvent(type,bubbles,cancelable,dragInitiator,dragSource,action,ctrlKey,altKey,shiftKey);
         _loc1_.relatedObject = this.relatedObject;
         _loc1_.localX = this.localX;
         _loc1_.localY = this.localY;
         return _loc1_;
      }
   }
}
