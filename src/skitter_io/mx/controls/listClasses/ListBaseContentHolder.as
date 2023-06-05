package mx.controls.listClasses
{
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import mx.collections.IViewCursor;
   import mx.core.FlexShape;
   import mx.core.FlexSprite;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   public class ListBaseContentHolder extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var listItems:Array;
      
      public var topOffset:Number = 0;
      
      public var rightOffset:Number = 0;
      
      private var maskShape:Shape;
      
      public var selectionLayer:Sprite;
      
      private var parentList:mx.controls.listClasses.ListBase;
      
      public var iterator:IViewCursor;
      
      public var rowInfo:Array;
      
      public var bottomOffset:Number = 0;
      
      public var leftOffset:Number = 0;
      
      public var visibleData:Object;
      
      mx_internal var allowItemSizeChangeNotification:Boolean = true;
      
      public function ListBaseContentHolder(param1:mx.controls.listClasses.ListBase)
      {
         var _loc2_:Graphics = null;
         visibleData = {};
         listItems = [];
         rowInfo = [];
         super();
         this.parentList = param1;
         setStyle("backgroundColor","");
         setStyle("borderStyle","none");
         if(!selectionLayer)
         {
            selectionLayer = new FlexSprite();
            selectionLayer.name = "selectionLayer";
            selectionLayer.mouseEnabled = false;
            addChild(selectionLayer);
            _loc2_ = selectionLayer.graphics;
            _loc2_.beginFill(0,0);
            _loc2_.drawRect(0,0,10,10);
            _loc2_.endFill();
         }
      }
      
      override public function set focusPane(param1:Sprite) : void
      {
         var _loc2_:Graphics = null;
         if(param1)
         {
            if(!maskShape)
            {
               maskShape = new FlexShape();
               maskShape.name = "mask";
               _loc2_ = maskShape.graphics;
               _loc2_.beginFill(16777215);
               _loc2_.drawRect(-2,-2,NaN,NaN);
               _loc2_.endFill();
               addChild(maskShape);
            }
            maskShape.visible = false;
            param1.mask = maskShape;
         }
         else if(parentList.focusPane.mask == maskShape)
         {
            parentList.focusPane.mask = null;
         }
         parentList.focusPane = param1;
         param1.x = x;
         param1.y = y;
      }
      
      public function get heightExcludingOffsets() : Number
      {
         return height + topOffset - bottomOffset;
      }
      
      public function get widthExcludingOffsets() : Number
      {
         return width + leftOffset - rightOffset;
      }
      
      override public function invalidateSize() : void
      {
         if(mx_internal::allowItemSizeChangeNotification)
         {
            parentList.invalidateList();
         }
      }
      
      mx_internal function getParentList() : mx.controls.listClasses.ListBase
      {
         return parentList;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = selectionLayer.graphics;
         _loc3_.clear();
         if(param1 > 0 && param2 > 0)
         {
            _loc3_.beginFill(8421504,0);
            _loc3_.drawRect(0,0,param1,param2);
            _loc3_.endFill();
         }
         if(maskShape)
         {
            maskShape.width = param1;
            maskShape.height = param2;
         }
      }
   }
}
