package mx.managers
{
   import flash.events.MouseEvent;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.Singleton;
   import mx.core.mx_internal;
   import mx.managers.dragClasses.DragProxy;
   
   public class DragManager
   {
      
      private static var implClassDependency:mx.managers.DragManagerImpl;
      
      private static var _impl:mx.managers.IDragManager;
      
      public static const MOVE:String = "move";
      
      public static const COPY:String = "copy";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const LINK:String = "link";
      
      public static const NONE:String = "none";
       
      
      public function DragManager()
      {
         super();
      }
      
      private static function get impl() : mx.managers.IDragManager
      {
         if(!_impl)
         {
            _impl = IDragManager(Singleton.getInstance("mx.managers::IDragManager"));
         }
         return _impl;
      }
      
      mx_internal static function get dragProxy() : DragProxy
      {
         return Object(impl).dragProxy;
      }
      
      public static function showFeedback(param1:String) : void
      {
         impl.showFeedback(param1);
      }
      
      public static function acceptDragDrop(param1:IUIComponent) : void
      {
         impl.acceptDragDrop(param1);
      }
      
      public static function doDrag(param1:IUIComponent, param2:DragSource, param3:MouseEvent, param4:IFlexDisplayObject = null, param5:Number = 0, param6:Number = 0, param7:Number = 0.5, param8:Boolean = true) : void
      {
         impl.doDrag(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      mx_internal static function endDrag() : void
      {
         impl.endDrag();
      }
      
      public static function get isDragging() : Boolean
      {
         return impl.isDragging;
      }
      
      public static function getFeedback() : String
      {
         return impl.getFeedback();
      }
   }
}
