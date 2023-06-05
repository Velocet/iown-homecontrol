package mx.containers
{
   import mx.containers.utilityClasses.CanvasLayout;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.containers.utilityClasses.IConstraintLayout;
   import mx.core.Container;
   import mx.core.mx_internal;
   
   public class Canvas extends Container implements IConstraintLayout
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _constraintColumns:Array;
      
      private var layoutObject:CanvasLayout;
      
      private var _constraintRows:Array;
      
      public function Canvas()
      {
         layoutObject = new CanvasLayout();
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
         return false;
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
      
      public function get constraintRows() : Array
      {
         return _constraintRows;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         layoutObject.updateDisplayList(param1,param2);
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
      
      override protected function measure() : void
      {
         super.measure();
         layoutObject.measure();
      }
   }
}
