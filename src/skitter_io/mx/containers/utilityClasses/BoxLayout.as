package mx.containers.utilityClasses
{
   import mx.containers.BoxDirection;
   import mx.controls.scrollClasses.ScrollBar;
   import mx.core.Container;
   import mx.core.EdgeMetrics;
   import mx.core.IUIComponent;
   import mx.core.ScrollPolicy;
   import mx.core.mx_internal;
   
   public class BoxLayout extends Layout
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var direction:String = "vertical";
      
      public function BoxLayout()
      {
         super();
      }
      
      private function isVertical() : Boolean
      {
         return direction != BoxDirection.HORIZONTAL;
      }
      
      mx_internal function getHorizontalAlignValue() : Number
      {
         var _loc1_:String = target.getStyle("horizontalAlign");
         if(_loc1_ == "center")
         {
            return 0.5;
         }
         if(_loc1_ == "right")
         {
            return 1;
         }
         return 0;
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:int = 0;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:int = 0;
         var _loc22_:IUIComponent = null;
         var _loc23_:IUIComponent = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc3_:Container = super.target;
         var _loc4_:int;
         if((_loc4_ = _loc3_.numChildren) == 0)
         {
            return;
         }
         var _loc5_:EdgeMetrics = _loc3_.viewMetricsAndPadding;
         var _loc6_:Number = _loc3_.getStyle("paddingLeft");
         var _loc7_:Number = _loc3_.getStyle("paddingTop");
         var _loc8_:Number = mx_internal::getHorizontalAlignValue();
         var _loc9_:Number = mx_internal::getVerticalAlignValue();
         var _loc10_:Number = _loc3_.scaleX > 0 && _loc3_.scaleX != 1 ? _loc3_.minWidth / Math.abs(_loc3_.scaleX) : _loc3_.minWidth;
         var _loc11_:Number = _loc3_.scaleY > 0 && _loc3_.scaleY != 1 ? _loc3_.minHeight / Math.abs(_loc3_.scaleY) : _loc3_.minHeight;
         var _loc12_:Number = Math.max(param1,_loc10_) - _loc5_.right - _loc5_.left;
         var _loc13_:Number = Math.max(param2,_loc11_) - _loc5_.bottom - _loc5_.top;
         var _loc14_:ScrollBar = _loc3_.horizontalScrollBar;
         var _loc15_:ScrollBar = _loc3_.verticalScrollBar;
         if(_loc4_ == 1)
         {
            _loc24_ = Number((_loc23_ = IUIComponent(_loc3_.getChildAt(0))).percentWidth);
            _loc25_ = Number(_loc23_.percentHeight);
            if(_loc24_)
            {
               _loc26_ = Math.max(_loc23_.minWidth,Math.min(_loc23_.maxWidth,_loc24_ >= 100 ? _loc12_ : _loc12_ * _loc24_ / 100));
            }
            else
            {
               _loc26_ = Number(_loc23_.getExplicitOrMeasuredWidth());
            }
            if(_loc25_)
            {
               _loc27_ = Math.max(_loc23_.minHeight,Math.min(_loc23_.maxHeight,_loc25_ >= 100 ? _loc13_ : _loc13_ * _loc25_ / 100));
            }
            else
            {
               _loc27_ = Number(_loc23_.getExplicitOrMeasuredHeight());
            }
            if(_loc23_.scaleX == 1 && _loc23_.scaleY == 1)
            {
               _loc23_.setActualSize(Math.floor(_loc26_),Math.floor(_loc27_));
            }
            else
            {
               _loc23_.setActualSize(_loc26_,_loc27_);
            }
            if(_loc15_ != null && _loc3_.verticalScrollPolicy == ScrollPolicy.AUTO)
            {
               _loc12_ += _loc15_.minWidth;
            }
            if(_loc14_ != null && _loc3_.horizontalScrollPolicy == ScrollPolicy.AUTO)
            {
               _loc13_ += _loc14_.minHeight;
            }
            _loc20_ = (_loc12_ - _loc23_.width) * _loc8_ + _loc6_;
            _loc19_ = (_loc13_ - _loc23_.height) * _loc9_ + _loc7_;
            _loc23_.move(Math.floor(_loc20_),Math.floor(_loc19_));
         }
         else if(isVertical())
         {
            _loc16_ = _loc3_.getStyle("verticalGap");
            _loc17_ = _loc4_;
            _loc21_ = 0;
            while(_loc21_ < _loc4_)
            {
               if(!IUIComponent(_loc3_.getChildAt(_loc21_)).includeInLayout)
               {
                  _loc17_--;
               }
               _loc21_++;
            }
            _loc18_ = Flex.flexChildHeightsProportionally(_loc3_,_loc13_ - (_loc17_ - 1) * _loc16_,_loc12_);
            if(_loc14_ != null && _loc3_.horizontalScrollPolicy == ScrollPolicy.AUTO)
            {
               _loc18_ += _loc14_.minHeight;
            }
            if(_loc15_ != null && _loc3_.verticalScrollPolicy == ScrollPolicy.AUTO)
            {
               _loc12_ += _loc15_.minWidth;
            }
            _loc19_ = _loc7_ + _loc18_ * _loc9_;
            _loc21_ = 0;
            while(_loc21_ < _loc4_)
            {
               _loc22_ = IUIComponent(_loc3_.getChildAt(_loc21_));
               _loc20_ = (_loc12_ - _loc22_.width) * _loc8_ + _loc6_;
               _loc22_.move(Math.floor(_loc20_),Math.floor(_loc19_));
               if(_loc22_.includeInLayout)
               {
                  _loc19_ += _loc22_.height + _loc16_;
               }
               _loc21_++;
            }
         }
         else
         {
            _loc16_ = _loc3_.getStyle("horizontalGap");
            _loc17_ = _loc4_;
            _loc21_ = 0;
            while(_loc21_ < _loc4_)
            {
               if(!IUIComponent(_loc3_.getChildAt(_loc21_)).includeInLayout)
               {
                  _loc17_--;
               }
               _loc21_++;
            }
            _loc18_ = Flex.flexChildWidthsProportionally(_loc3_,_loc12_ - (_loc17_ - 1) * _loc16_,_loc13_);
            if(_loc14_ != null && _loc3_.horizontalScrollPolicy == ScrollPolicy.AUTO)
            {
               _loc13_ += _loc14_.minHeight;
            }
            if(_loc15_ != null && _loc3_.verticalScrollPolicy == ScrollPolicy.AUTO)
            {
               _loc18_ += _loc15_.minWidth;
            }
            _loc20_ = _loc6_ + _loc18_ * _loc8_;
            _loc21_ = 0;
            while(_loc21_ < _loc4_)
            {
               _loc22_ = IUIComponent(_loc3_.getChildAt(_loc21_));
               _loc19_ = (_loc13_ - _loc22_.height) * _loc9_ + _loc7_;
               _loc22_.move(Math.floor(_loc20_),Math.floor(_loc19_));
               if(_loc22_.includeInLayout)
               {
                  _loc20_ += _loc22_.width + _loc16_;
               }
               _loc21_++;
            }
         }
      }
      
      mx_internal function getVerticalAlignValue() : Number
      {
         var _loc1_:String = target.getStyle("verticalAlign");
         if(_loc1_ == "middle")
         {
            return 0.5;
         }
         if(_loc1_ == "bottom")
         {
            return 1;
         }
         return 0;
      }
      
      mx_internal function heightPadding(param1:Number) : Number
      {
         var _loc2_:EdgeMetrics = target.viewMetricsAndPadding;
         var _loc3_:Number = _loc2_.top + _loc2_.bottom;
         if(param1 > 1 && isVertical())
         {
            _loc3_ += target.getStyle("verticalGap") * (param1 - 1);
         }
         return _loc3_;
      }
      
      mx_internal function widthPadding(param1:Number) : Number
      {
         var _loc2_:EdgeMetrics = target.viewMetricsAndPadding;
         var _loc3_:Number = _loc2_.left + _loc2_.right;
         if(param1 > 1 && isVertical() == false)
         {
            _loc3_ += target.getStyle("horizontalGap") * (param1 - 1);
         }
         return _loc3_;
      }
      
      override public function measure() : void
      {
         var _loc1_:Container = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:IUIComponent = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         _loc1_ = super.target;
         var _loc2_:Boolean = isVertical();
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:int;
         var _loc8_:int = _loc7_ = _loc1_.numChildren;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            if(!(_loc12_ = IUIComponent(_loc1_.getChildAt(_loc9_))).includeInLayout)
            {
               _loc8_--;
            }
            else
            {
               _loc13_ = Number(_loc12_.getExplicitOrMeasuredWidth());
               _loc14_ = Number(_loc12_.getExplicitOrMeasuredHeight());
               if(_loc2_)
               {
                  _loc3_ = Math.max(!isNaN(_loc12_.percentWidth) ? Number(_loc12_.minWidth) : _loc13_,_loc3_);
                  _loc5_ = Math.max(_loc13_,_loc5_);
                  _loc4_ += !isNaN(_loc12_.percentHeight) ? _loc12_.minHeight : _loc14_;
                  _loc6_ += _loc14_;
               }
               else
               {
                  _loc3_ += !isNaN(_loc12_.percentWidth) ? _loc12_.minWidth : _loc13_;
                  _loc5_ += _loc13_;
                  _loc4_ = Math.max(!isNaN(_loc12_.percentHeight) ? Number(_loc12_.minHeight) : _loc14_,_loc4_);
                  _loc6_ = Math.max(_loc14_,_loc6_);
               }
            }
            _loc9_++;
         }
         _loc10_ = mx_internal::widthPadding(_loc8_);
         _loc11_ = mx_internal::heightPadding(_loc8_);
         _loc1_.measuredMinWidth = _loc3_ + _loc10_;
         _loc1_.measuredMinHeight = _loc4_ + _loc11_;
         _loc1_.measuredWidth = _loc5_ + _loc10_;
         _loc1_.measuredHeight = _loc6_ + _loc11_;
      }
   }
}
