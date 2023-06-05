package mx.core
{
   import flash.events.Event;
   import mx.containers.BoxDirection;
   import mx.containers.utilityClasses.BoxLayout;
   import mx.containers.utilityClasses.CanvasLayout;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.containers.utilityClasses.IConstraintLayout;
   import mx.containers.utilityClasses.Layout;
   
   public class LayoutContainer extends Container implements IConstraintLayout
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      mx_internal static var useProgressiveLayout:Boolean = false;
       
      
      private var _constraintColumns:Array;
      
      protected var layoutObject:Layout;
      
      private var _layout:String = "vertical";
      
      private var processingCreationQueue:Boolean = false;
      
      protected var boxLayoutClass:Class;
      
      private var resizeHandlerAdded:Boolean = false;
      
      private var preloadObj:Object;
      
      private var creationQueue:Array;
      
      private var _constraintRows:Array;
      
      protected var canvasLayoutClass:Class;
      
      public function LayoutContainer()
      {
         layoutObject = new BoxLayout();
         canvasLayoutClass = CanvasLayout;
         boxLayoutClass = BoxLayout;
         creationQueue = [];
         _constraintColumns = [];
         _constraintRows = [];
         super();
         layoutObject.target = this;
      }
      
      public function get constraintColumns() : Array
      {
         return _constraintColumns;
      }
      
      override mx_internal function get usePadding() : Boolean
      {
         return layout != ContainerLayout.ABSOLUTE;
      }
      
      override protected function layoutChrome(param1:Number, param2:Number) : void
      {
         super.layoutChrome(param1,param2);
         if(!mx_internal::doingLayout)
         {
            createBorder();
         }
      }
      
      public function set constraintColumns(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 != _constraintColumns)
         {
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               ConstraintColumn(param1[_loc3_]).container = this;
               _loc3_++;
            }
            _constraintColumns = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      public function set layout(param1:String) : void
      {
         if(_layout != param1)
         {
            _layout = param1;
            if(layoutObject)
            {
               layoutObject.target = null;
            }
            if(_layout == ContainerLayout.ABSOLUTE)
            {
               layoutObject = new canvasLayoutClass();
            }
            else
            {
               layoutObject = new boxLayoutClass();
               if(_layout == ContainerLayout.VERTICAL)
               {
                  BoxLayout(layoutObject).direction = BoxDirection.VERTICAL;
               }
               else
               {
                  BoxLayout(layoutObject).direction = BoxDirection.HORIZONTAL;
               }
            }
            if(layoutObject)
            {
               layoutObject.target = this;
            }
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("layoutChanged"));
         }
      }
      
      public function get constraintRows() : Array
      {
         return _constraintRows;
      }
      
      override protected function measure() : void
      {
         super.measure();
         layoutObject.measure();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         layoutObject.updateDisplayList(param1,param2);
         createBorder();
      }
      
      [Bindable("layoutChanged")]
      public function get layout() : String
      {
         return _layout;
      }
      
      public function set constraintRows(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 != _constraintRows)
         {
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               ConstraintRow(param1[_loc3_]).container = this;
               _loc3_++;
            }
            _constraintRows = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
   }
}
