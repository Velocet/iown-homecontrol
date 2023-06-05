package mx.controls.listClasses
{
   import flash.display.DisplayObject;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   public class ListItemDragProxy extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ListItemDragProxy()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         var _loc4_:IListItemRenderer = null;
         var _loc5_:IListItemRenderer = null;
         var _loc6_:ListBaseContentHolder = null;
         var _loc7_:BaseListData = null;
         super.createChildren();
         var _loc1_:Array = ListBase(owner).selectedItems;
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = ListBase(owner).itemToItemRenderer(_loc1_[_loc3_]))
            {
               (_loc5_ = ListBase(owner).createItemRenderer(_loc1_[_loc3_])).styleName = ListBase(owner);
               if(_loc5_ is IDropInListItemRenderer)
               {
                  _loc7_ = IDropInListItemRenderer(_loc4_).listData;
                  IDropInListItemRenderer(_loc5_).listData = !!_loc1_[_loc3_] ? _loc7_ : null;
               }
               _loc5_.data = _loc1_[_loc3_];
               addChild(DisplayObject(_loc5_));
               _loc6_ = _loc4_.parent as ListBaseContentHolder;
               _loc5_.setActualSize(_loc4_.width,_loc4_.height);
               _loc5_.x = _loc4_.x + _loc6_.leftOffset;
               _loc5_.y = _loc4_.y + _loc6_.topOffset;
               measuredHeight = Math.max(measuredHeight,_loc5_.y + _loc5_.height);
               measuredWidth = Math.max(measuredWidth,_loc5_.x + _loc5_.width);
               _loc5_.visible = true;
            }
            _loc3_++;
         }
         invalidateDisplayList();
      }
      
      override protected function measure() : void
      {
         var _loc3_:IListItemRenderer = null;
         super.measure();
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < numChildren)
         {
            _loc3_ = getChildAt(_loc4_) as IListItemRenderer;
            if(_loc3_)
            {
               _loc1_ = Math.max(_loc1_,_loc3_.x + _loc3_.width);
               _loc2_ = Math.max(_loc2_,_loc3_.y + _loc3_.height);
            }
            _loc4_++;
         }
         measuredWidth = measuredMinWidth = _loc1_;
         measuredHeight = measuredMinHeight = _loc2_;
      }
   }
}
