package mx.containers.utilityClasses
{
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import mx.containers.errors.ConstraintError;
   import mx.core.Container;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IConstraintClient;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.MoveEvent;
   
   public class CanvasLayout extends Layout
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var r:Rectangle = new Rectangle();
       
      
      private var colSpanChildren:Array;
      
      private var constraintRegionsInUse:Boolean = false;
      
      private var rowSpanChildren:Array;
      
      private var constraintCache:Dictionary;
      
      private var _contentArea:Rectangle;
      
      public function CanvasLayout()
      {
         colSpanChildren = [];
         rowSpanChildren = [];
         constraintCache = new Dictionary(true);
         super();
      }
      
      private function parseConstraints(param1:IUIComponent = null) : ChildConstraintInfo
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:Array = null;
         var _loc18_:int = 0;
         var _loc30_:ConstraintColumn = null;
         var _loc31_:Boolean = false;
         var _loc32_:ConstraintRow = null;
         var _loc2_:LayoutConstraints = getLayoutConstraints(param1);
         if(!_loc2_)
         {
            return null;
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.left)))
         {
            _loc3_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc3_ = Number(_loc17_[0]);
         }
         else
         {
            _loc10_ = String(_loc17_[0]);
            _loc3_ = Number(_loc17_[1]);
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.right)))
         {
            _loc4_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc4_ = Number(_loc17_[0]);
         }
         else
         {
            _loc11_ = String(_loc17_[0]);
            _loc4_ = Number(_loc17_[1]);
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.horizontalCenter)))
         {
            _loc5_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc5_ = Number(_loc17_[0]);
         }
         else
         {
            _loc12_ = String(_loc17_[0]);
            _loc5_ = Number(_loc17_[1]);
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.top)))
         {
            _loc6_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc6_ = Number(_loc17_[0]);
         }
         else
         {
            _loc13_ = String(_loc17_[0]);
            _loc6_ = Number(_loc17_[1]);
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.bottom)))
         {
            _loc7_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc7_ = Number(_loc17_[0]);
         }
         else
         {
            _loc14_ = String(_loc17_[0]);
            _loc7_ = Number(_loc17_[1]);
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.verticalCenter)))
         {
            _loc8_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc8_ = Number(_loc17_[0]);
         }
         else
         {
            _loc15_ = String(_loc17_[0]);
            _loc8_ = Number(_loc17_[1]);
         }
         if(!(_loc17_ = parseConstraintExp(_loc2_.baseline)))
         {
            _loc9_ = NaN;
         }
         else if(_loc17_.length == 1)
         {
            _loc9_ = Number(_loc17_[0]);
         }
         else
         {
            _loc16_ = String(_loc17_[0]);
            _loc9_ = Number(_loc17_[1]);
         }
         var _loc19_:ContentColumnChild = new ContentColumnChild();
         var _loc20_:Boolean = false;
         var _loc21_:Number = 0;
         var _loc22_:Number = 0;
         var _loc23_:Number = 0;
         _loc18_ = 0;
         while(_loc18_ < IConstraintLayout(target).constraintColumns.length)
         {
            if((_loc30_ = IConstraintLayout(target).constraintColumns[_loc18_]).mx_internal::contentSize)
            {
               if(_loc30_.id == _loc10_)
               {
                  _loc19_.leftCol = _loc30_;
                  _loc19_.leftOffset = _loc3_;
                  _loc19_.left = _loc21_ = _loc18_;
                  _loc20_ = true;
               }
               if(_loc30_.id == _loc11_)
               {
                  _loc19_.rightCol = _loc30_;
                  _loc19_.rightOffset = _loc4_;
                  var _loc33_:* = _loc18_ + 1;
                  _loc22_ = _loc18_ + 1;
                  _loc19_.right = _loc33_;
                  _loc20_ = true;
               }
               if(_loc30_.id == _loc12_)
               {
                  _loc19_.hcCol = _loc30_;
                  _loc19_.hcOffset = _loc5_;
                  _loc33_ = _loc18_ + 1;
                  _loc23_ = _loc18_ + 1;
                  _loc19_.hc = _loc33_;
                  _loc20_ = true;
               }
            }
            _loc18_++;
         }
         if(_loc20_)
         {
            _loc19_.child = param1;
            if(_loc19_.leftCol && !_loc19_.rightCol || _loc19_.rightCol && !_loc19_.leftCol || Boolean(_loc19_.hcCol))
            {
               _loc19_.span = 1;
            }
            else
            {
               _loc19_.span = _loc22_ - _loc21_;
            }
            _loc31_ = false;
            _loc18_ = 0;
            while(_loc18_ < colSpanChildren.length)
            {
               if(_loc19_.child == colSpanChildren[_loc18_].child)
               {
                  _loc31_ = true;
                  break;
               }
               _loc18_++;
            }
            if(!_loc31_)
            {
               colSpanChildren.push(_loc19_);
            }
         }
         _loc20_ = false;
         var _loc24_:ContentRowChild = new ContentRowChild();
         var _loc25_:Number = 0;
         var _loc26_:Number = 0;
         var _loc27_:Number = 0;
         var _loc28_:Number = 0;
         _loc18_ = 0;
         while(_loc18_ < IConstraintLayout(target).constraintRows.length)
         {
            if((_loc32_ = IConstraintLayout(target).constraintRows[_loc18_]).mx_internal::contentSize)
            {
               if(_loc32_.id == _loc13_)
               {
                  _loc24_.topRow = _loc32_;
                  _loc24_.topOffset = _loc6_;
                  _loc24_.top = _loc25_ = _loc18_;
                  _loc20_ = true;
               }
               if(_loc32_.id == _loc14_)
               {
                  _loc24_.bottomRow = _loc32_;
                  _loc24_.bottomOffset = _loc7_;
                  _loc33_ = _loc18_ + 1;
                  _loc26_ = _loc18_ + 1;
                  _loc24_.bottom = _loc33_;
                  _loc20_ = true;
               }
               if(_loc32_.id == _loc15_)
               {
                  _loc24_.vcRow = _loc32_;
                  _loc24_.vcOffset = _loc8_;
                  _loc33_ = _loc18_ + 1;
                  _loc27_ = _loc18_ + 1;
                  _loc24_.vc = _loc33_;
                  _loc20_ = true;
               }
               if(_loc32_.id == _loc16_)
               {
                  _loc24_.baselineRow = _loc32_;
                  _loc24_.baselineOffset = _loc9_;
                  _loc33_ = _loc18_ + 1;
                  _loc28_ = _loc18_ + 1;
                  _loc24_.baseline = _loc33_;
                  _loc20_ = true;
               }
            }
            _loc18_++;
         }
         if(_loc20_)
         {
            _loc24_.child = param1;
            if(_loc24_.topRow && !_loc24_.bottomRow || _loc24_.bottomRow && !_loc24_.topRow || _loc24_.vcRow || Boolean(_loc24_.baselineRow))
            {
               _loc24_.span = 1;
            }
            else
            {
               _loc24_.span = _loc26_ - _loc25_;
            }
            _loc31_ = false;
            _loc18_ = 0;
            while(_loc18_ < rowSpanChildren.length)
            {
               if(_loc24_.child == rowSpanChildren[_loc18_].child)
               {
                  _loc31_ = true;
                  break;
               }
               _loc18_++;
            }
            if(!_loc31_)
            {
               rowSpanChildren.push(_loc24_);
            }
         }
         var _loc29_:ChildConstraintInfo = new ChildConstraintInfo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_);
         constraintCache[param1] = _loc29_;
         return _loc29_;
      }
      
      private function bound(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            param1 = param2;
         }
         else if(param1 > param3)
         {
            param1 = param3;
         }
         else
         {
            param1 = Math.floor(param1);
         }
         return param1;
      }
      
      private function shareRowSpace(param1:ContentRowChild, param2:Number) : Number
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:ConstraintRow = param1.topRow;
         var _loc4_:ConstraintRow = param1.bottomRow;
         var _loc5_:IUIComponent = param1.child;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = !!param1.topOffset ? param1.topOffset : 0;
         var _loc9_:Number = !!param1.bottomOffset ? param1.bottomOffset : 0;
         if(Boolean(_loc3_) && Boolean(_loc3_.height))
         {
            _loc6_ += _loc3_.height;
         }
         else if(Boolean(_loc4_) && !_loc3_)
         {
            _loc3_ = IConstraintLayout(target).constraintRows[param1.bottom - 2];
            if(Boolean(_loc3_) && Boolean(_loc3_.height))
            {
               _loc6_ += _loc3_.height;
            }
         }
         if(Boolean(_loc4_) && Boolean(_loc4_.height))
         {
            _loc7_ += _loc4_.height;
         }
         else if(Boolean(_loc3_) && !_loc4_)
         {
            if((Boolean(_loc4_ = IConstraintLayout(target).constraintRows[param1.top + 1])) && Boolean(_loc4_.height))
            {
               _loc7_ += _loc4_.height;
            }
         }
         if(Boolean(_loc3_) && isNaN(_loc3_.height))
         {
            _loc3_.setActualHeight(Math.max(0,_loc3_.maxHeight));
         }
         if(Boolean(_loc4_) && isNaN(_loc4_.height))
         {
            _loc4_.setActualHeight(Math.max(0,_loc4_.height));
         }
         var _loc10_:Number;
         if(_loc10_ = Number(_loc5_.getExplicitOrMeasuredHeight()))
         {
            if(!param1.topRow)
            {
               if(_loc10_ > _loc6_)
               {
                  _loc12_ = _loc10_ - _loc6_ + _loc9_;
               }
               else
               {
                  _loc12_ = _loc10_ + _loc9_;
               }
            }
            if(!param1.bottomRow)
            {
               if(_loc10_ > _loc7_)
               {
                  _loc11_ = _loc10_ - _loc7_ + _loc8_;
               }
               else
               {
                  _loc11_ = _loc10_ + _loc8_;
               }
            }
            if(Boolean(param1.topRow) && Boolean(param1.bottomRow))
            {
               if((_loc13_ = _loc10_ / Number(param1.span)) + _loc8_ < _loc6_)
               {
                  _loc11_ = _loc6_;
                  _loc12_ = _loc10_ - (_loc6_ - _loc8_) + _loc9_;
               }
               else
               {
                  _loc11_ = _loc13_ + _loc8_;
               }
               if(_loc13_ + _loc9_ < _loc7_)
               {
                  _loc12_ = _loc7_;
                  _loc11_ = _loc10_ - (_loc7_ - _loc9_) + _loc8_;
               }
               else
               {
                  _loc12_ = _loc13_ + _loc9_;
               }
            }
            _loc12_ = bound(_loc12_,_loc4_.minHeight,_loc4_.maxHeight);
            _loc4_.setActualHeight(_loc12_);
            param2 -= _loc12_;
            _loc11_ = bound(_loc11_,_loc3_.minHeight,_loc3_.maxHeight);
            _loc3_.setActualHeight(_loc11_);
            param2 -= _loc11_;
         }
         return param2;
      }
      
      private function parseConstraintExp(param1:String) : Array
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:String = param1.replace(/:/g," ");
         return _loc2_.split(/\s+/);
      }
      
      private function measureColumnsAndRows() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc13_:ConstraintColumn = null;
         var _loc14_:ConstraintRow = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:ContentColumnChild = null;
         var _loc20_:ContentRowChild = null;
         var _loc1_:Array = IConstraintLayout(target).constraintColumns;
         var _loc2_:Array = IConstraintLayout(target).constraintRows;
         if(!_loc2_.length > 0 && !_loc1_.length > 0)
         {
            constraintRegionsInUse = false;
            return;
         }
         constraintRegionsInUse = true;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:EdgeMetrics = Container(target).viewMetrics;
         var _loc8_:Number = Container(target).width - _loc7_.left - _loc7_.right;
         var _loc9_:Number = Container(target).height - _loc7_.top - _loc7_.bottom;
         var _loc10_:* = [];
         var _loc11_:* = [];
         var _loc12_:* = [];
         if(_loc1_.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               _loc13_ = _loc1_[_loc3_];
               if(!isNaN(_loc13_.percentWidth))
               {
                  _loc11_.push(_loc13_);
               }
               else if(!isNaN(_loc13_.width) && !_loc13_.mx_internal::contentSize)
               {
                  _loc10_.push(_loc13_);
               }
               else
               {
                  _loc12_.push(_loc13_);
                  _loc13_.mx_internal::contentSize = true;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc10_.length)
            {
               _loc13_ = ConstraintColumn(_loc10_[_loc3_]);
               _loc8_ -= _loc13_.width;
               _loc3_++;
            }
            if(_loc12_.length > 0)
            {
               if(false)
               {
                  colSpanChildren.sortOn("span");
                  _loc4_ = 0;
                  while(_loc4_ < colSpanChildren.length)
                  {
                     if((_loc19_ = colSpanChildren[_loc4_]).span == 1)
                     {
                        if(_loc19_.hcCol)
                        {
                           _loc13_ = ConstraintColumn(_loc1_[_loc1_.indexOf(_loc19_.hcCol)]);
                        }
                        else if(_loc19_.leftCol)
                        {
                           _loc13_ = ConstraintColumn(_loc1_[_loc1_.indexOf(_loc19_.leftCol)]);
                        }
                        else if(_loc19_.rightCol)
                        {
                           _loc13_ = ConstraintColumn(_loc1_[_loc1_.indexOf(_loc19_.rightCol)]);
                        }
                        _loc16_ = Number(_loc19_.child.getExplicitOrMeasuredWidth());
                        if(_loc19_.hcOffset)
                        {
                           _loc16_ += _loc19_.hcOffset;
                        }
                        else
                        {
                           if(_loc19_.leftOffset)
                           {
                              _loc16_ += _loc19_.leftOffset;
                           }
                           if(_loc19_.rightOffset)
                           {
                              _loc16_ += _loc19_.rightOffset;
                           }
                        }
                        if(!isNaN(_loc13_.width))
                        {
                           _loc16_ = Math.max(_loc13_.width,_loc16_);
                        }
                        _loc16_ = bound(_loc16_,_loc13_.minWidth,_loc13_.maxWidth);
                        _loc13_.setActualWidth(_loc16_);
                        _loc8_ -= _loc13_.width;
                     }
                     else
                     {
                        _loc8_ = shareColumnSpace(_loc19_,_loc8_);
                     }
                     _loc4_++;
                  }
                  colSpanChildren = [];
               }
               _loc3_ = 0;
               while(_loc3_ < _loc12_.length)
               {
                  if(!(_loc13_ = _loc12_[_loc3_]).width)
                  {
                     _loc16_ = bound(0,_loc13_.minWidth,0);
                     _loc13_.setActualWidth(_loc16_);
                  }
                  _loc3_++;
               }
            }
            _loc18_ = _loc8_;
            _loc3_ = 0;
            while(_loc3_ < _loc11_.length)
            {
               _loc13_ = ConstraintColumn(_loc11_[_loc3_]);
               if(_loc18_ <= 0)
               {
                  _loc16_ = 0;
               }
               else
               {
                  _loc16_ = Math.round(_loc18_ * _loc13_.percentWidth / 100);
               }
               _loc16_ = bound(_loc16_,_loc13_.minWidth,_loc13_.maxWidth);
               _loc13_.setActualWidth(_loc16_);
               _loc8_ -= _loc16_;
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               (_loc13_ = ConstraintColumn(_loc1_[_loc3_])).x = _loc5_;
               _loc5_ += _loc13_.width;
               _loc3_++;
            }
         }
         _loc10_ = [];
         _loc11_ = [];
         _loc12_ = [];
         if(_loc2_.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc14_ = _loc2_[_loc3_];
               if(!isNaN(_loc14_.percentHeight))
               {
                  _loc11_.push(_loc14_);
               }
               else if(!isNaN(_loc14_.height) && !_loc14_.mx_internal::contentSize)
               {
                  _loc10_.push(_loc14_);
               }
               else
               {
                  _loc12_.push(_loc14_);
                  _loc14_.mx_internal::contentSize = true;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc10_.length)
            {
               _loc14_ = ConstraintRow(_loc10_[_loc3_]);
               _loc9_ -= _loc14_.height;
               _loc3_++;
            }
            if(_loc12_.length > 0)
            {
               if(false)
               {
                  rowSpanChildren.sortOn("span");
                  _loc4_ = 0;
                  while(_loc4_ < rowSpanChildren.length)
                  {
                     if((_loc20_ = rowSpanChildren[_loc4_]).span == 1)
                     {
                        if(_loc20_.vcRow)
                        {
                           _loc14_ = ConstraintRow(_loc2_[_loc2_.indexOf(_loc20_.vcRow)]);
                        }
                        else if(_loc20_.baselineRow)
                        {
                           _loc14_ = ConstraintRow(_loc2_[_loc2_.indexOf(_loc20_.baselineRow)]);
                        }
                        else if(_loc20_.topRow)
                        {
                           _loc14_ = ConstraintRow(_loc2_[_loc2_.indexOf(_loc20_.topRow)]);
                        }
                        else if(_loc20_.bottomRow)
                        {
                           _loc14_ = ConstraintRow(_loc2_[_loc2_.indexOf(_loc20_.bottomRow)]);
                        }
                        _loc17_ = Number(_loc20_.child.getExplicitOrMeasuredHeight());
                        if(_loc20_.baselineOffset)
                        {
                           _loc17_ += _loc20_.baselineOffset;
                        }
                        else if(_loc20_.vcOffset)
                        {
                           _loc17_ += _loc20_.vcOffset;
                        }
                        else
                        {
                           if(_loc20_.topOffset)
                           {
                              _loc17_ += _loc20_.topOffset;
                           }
                           if(_loc20_.bottomOffset)
                           {
                              _loc17_ += _loc20_.bottomOffset;
                           }
                        }
                        if(!isNaN(_loc14_.height))
                        {
                           _loc17_ = Math.max(_loc14_.height,_loc17_);
                        }
                        _loc17_ = bound(_loc17_,_loc14_.minHeight,_loc14_.maxHeight);
                        _loc14_.setActualHeight(_loc17_);
                        _loc9_ -= _loc14_.height;
                     }
                     else
                     {
                        _loc9_ = shareRowSpace(_loc20_,_loc9_);
                     }
                     _loc4_++;
                  }
                  rowSpanChildren = [];
               }
               _loc3_ = 0;
               while(_loc3_ < _loc12_.length)
               {
                  if(!(_loc14_ = ConstraintRow(_loc12_[_loc3_])).height)
                  {
                     _loc17_ = bound(0,_loc14_.minHeight,0);
                     _loc14_.setActualHeight(_loc17_);
                  }
                  _loc3_++;
               }
            }
            _loc18_ = _loc9_;
            _loc3_ = 0;
            while(_loc3_ < _loc11_.length)
            {
               _loc14_ = ConstraintRow(_loc11_[_loc3_]);
               if(_loc18_ <= 0)
               {
                  _loc17_ = 0;
               }
               else
               {
                  _loc17_ = Math.round(_loc18_ * _loc14_.percentHeight / 100);
               }
               _loc17_ = bound(_loc17_,_loc14_.minHeight,_loc14_.maxHeight);
               _loc14_.setActualHeight(_loc17_);
               _loc9_ -= _loc17_;
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               (_loc14_ = _loc2_[_loc3_]).y = _loc6_;
               _loc6_ += _loc14_.height;
               _loc3_++;
            }
         }
      }
      
      private function child_moveHandler(param1:MoveEvent) : void
      {
         if(param1.target is IUIComponent)
         {
            if(!IUIComponent(param1.target).includeInLayout)
            {
               return;
            }
         }
         var _loc2_:Container = super.target;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
            _contentArea = null;
         }
      }
      
      private function applyAnchorStylesDuringMeasure(param1:IUIComponent, param2:Rectangle) : void
      {
         var _loc13_:int = 0;
         var _loc3_:IConstraintClient = param1 as IConstraintClient;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:ChildConstraintInfo;
         if(!(_loc4_ = constraintCache[_loc3_]))
         {
            _loc4_ = parseConstraints(param1);
         }
         var _loc5_:Number = _loc4_.left;
         var _loc6_:Number = _loc4_.right;
         var _loc7_:Number = _loc4_.hc;
         var _loc8_:Number = _loc4_.top;
         var _loc9_:Number = _loc4_.bottom;
         var _loc10_:Number = _loc4_.vc;
         var _loc11_:Array = IConstraintLayout(target).constraintColumns;
         var _loc12_:Array = IConstraintLayout(target).constraintRows;
         var _loc14_:Number = 0;
         if(!_loc11_.length > 0)
         {
            if(!isNaN(_loc7_))
            {
               param2.x = Math.round((0 - param1.width) / 2 + _loc7_);
            }
            else if(!isNaN(_loc5_) && !isNaN(_loc6_))
            {
               param2.x = _loc5_;
               param2.width += _loc6_;
            }
            else if(!isNaN(_loc5_))
            {
               param2.x = _loc5_;
            }
            else if(!isNaN(_loc6_))
            {
               param2.x = 0;
               param2.width += _loc6_;
            }
         }
         else
         {
            param2.x = 0;
            _loc13_ = 0;
            while(_loc13_ < _loc11_.length)
            {
               _loc14_ += ConstraintColumn(_loc11_[_loc13_]).width;
               _loc13_++;
            }
            param2.width = _loc14_;
         }
         if(!_loc12_.length > 0)
         {
            if(!isNaN(_loc10_))
            {
               param2.y = Math.round((0 - param1.height) / 2 + _loc10_);
            }
            else if(!isNaN(_loc8_) && !isNaN(_loc9_))
            {
               param2.y = _loc8_;
               param2.height += _loc9_;
            }
            else if(!isNaN(_loc8_))
            {
               param2.y = _loc8_;
            }
            else if(!isNaN(_loc9_))
            {
               param2.y = 0;
               param2.height += _loc9_;
            }
         }
         else
         {
            _loc14_ = 0;
            param2.y = 0;
            _loc13_ = 0;
            while(_loc13_ < _loc12_.length)
            {
               _loc14_ += ConstraintRow(_loc12_[_loc13_]).height;
               _loc13_++;
            }
            param2.height = _loc14_;
         }
      }
      
      override public function measure() : void
      {
         var _loc1_:Container = null;
         var _loc5_:EdgeMetrics = null;
         var _loc6_:Rectangle = null;
         var _loc7_:IUIComponent = null;
         var _loc8_:ConstraintColumn = null;
         var _loc9_:ConstraintRow = null;
         _loc1_ = super.target;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         _loc5_ = _loc1_.viewMetrics;
         _loc4_ = 0;
         while(_loc4_ < _loc1_.numChildren)
         {
            _loc7_ = _loc1_.getChildAt(_loc4_) as IUIComponent;
            parseConstraints(_loc7_);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < IConstraintLayout(_loc1_).constraintColumns.length)
         {
            if((_loc8_ = IConstraintLayout(_loc1_).constraintColumns[_loc4_]).mx_internal::contentSize)
            {
               _loc8_.mx_internal::_width = NaN;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < IConstraintLayout(_loc1_).constraintRows.length)
         {
            if((_loc9_ = IConstraintLayout(_loc1_).constraintRows[_loc4_]).mx_internal::contentSize)
            {
               _loc9_.mx_internal::_height = NaN;
            }
            _loc4_++;
         }
         measureColumnsAndRows();
         _contentArea = null;
         _loc6_ = measureContentArea();
         _loc1_.measuredWidth = _loc6_.width + _loc5_.left + _loc5_.right;
         _loc1_.measuredHeight = _loc6_.height + _loc5_.top + _loc5_.bottom;
      }
      
      private function target_childRemoveHandler(param1:ChildExistenceChangedEvent) : void
      {
         DisplayObject(param1.relatedObject).removeEventListener(MoveEvent.MOVE,child_moveHandler);
         delete constraintCache[param1.relatedObject];
      }
      
      override public function set target(param1:Container) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Container = super.target;
         if(param1 != _loc2_)
         {
            if(_loc2_)
            {
               _loc2_.removeEventListener(ChildExistenceChangedEvent.CHILD_ADD,target_childAddHandler);
               _loc2_.removeEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,target_childRemoveHandler);
               _loc4_ = _loc2_.numChildren;
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  DisplayObject(_loc2_.getChildAt(_loc3_)).removeEventListener(MoveEvent.MOVE,child_moveHandler);
                  _loc3_++;
               }
            }
            if(param1)
            {
               param1.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,target_childAddHandler);
               param1.addEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,target_childRemoveHandler);
               _loc4_ = param1.numChildren;
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  DisplayObject(param1.getChildAt(_loc3_)).addEventListener(MoveEvent.MOVE,child_moveHandler);
                  _loc3_++;
               }
            }
            super.target = param1;
         }
      }
      
      private function measureContentArea() : Rectangle
      {
         var _loc1_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:IUIComponent = null;
         var _loc6_:LayoutConstraints = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         if(_contentArea)
         {
            return _contentArea;
         }
         _contentArea = new Rectangle();
         var _loc2_:int = 0;
         if(_loc2_ == 0 && constraintRegionsInUse)
         {
            _loc3_ = IConstraintLayout(target).constraintColumns;
            _loc4_ = IConstraintLayout(target).constraintRows;
            if(_loc3_.length > 0)
            {
               _contentArea.right = _loc3_[_loc3_.length - 1].x + _loc3_[_loc3_.length - 1].width;
            }
            else
            {
               _contentArea.right = 0;
            }
            if(_loc4_.length > 0)
            {
               _contentArea.bottom = _loc4_[_loc4_.length - 1].y + _loc4_[_loc4_.length - 1].height;
            }
            else
            {
               _contentArea.bottom = 0;
            }
         }
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc5_ = target.getChildAt(_loc1_) as IUIComponent;
            _loc6_ = getLayoutConstraints(_loc5_);
            if(_loc5_.includeInLayout)
            {
               _loc7_ = Number(_loc5_.x);
               _loc8_ = Number(_loc5_.y);
               _loc9_ = Number(_loc5_.getExplicitOrMeasuredWidth());
               _loc10_ = Number(_loc5_.getExplicitOrMeasuredHeight());
               if(false)
               {
                  if(!isNaN(_loc5_.percentWidth) || _loc6_ && !isNaN(_loc6_.left) && !isNaN(_loc6_.right))
                  {
                     _loc9_ = Number(_loc5_.minWidth);
                  }
               }
               else if(!isNaN(_loc5_.percentWidth) || _loc6_ && !isNaN(_loc6_.left) && !isNaN(_loc6_.right) && isNaN(_loc5_.explicitWidth))
               {
                  _loc9_ = Number(_loc5_.minWidth);
               }
               if(false)
               {
                  if(!isNaN(_loc5_.percentHeight) || _loc6_ && !isNaN(_loc6_.top) && !isNaN(_loc6_.bottom))
                  {
                     _loc10_ = Number(_loc5_.minHeight);
                  }
               }
               else if(!isNaN(_loc5_.percentHeight) || _loc6_ && !isNaN(_loc6_.top) && !isNaN(_loc6_.bottom) && isNaN(_loc5_.explicitHeight))
               {
                  _loc10_ = Number(_loc5_.minHeight);
               }
               r.x = _loc7_;
               r.y = _loc8_;
               r.width = _loc9_;
               r.height = _loc10_;
               applyAnchorStylesDuringMeasure(_loc5_,r);
               _loc7_ = 0;
               _loc8_ = 0;
               _loc9_ = 0;
               _loc10_ = 0;
               if(isNaN(_loc7_))
               {
                  _loc7_ = Number(_loc5_.x);
               }
               if(isNaN(_loc8_))
               {
                  _loc8_ = Number(_loc5_.y);
               }
               _loc11_ = _loc7_;
               _loc12_ = _loc8_;
               if(isNaN(_loc9_))
               {
                  _loc9_ = Number(_loc5_.width);
               }
               if(isNaN(_loc10_))
               {
                  _loc10_ = Number(_loc5_.height);
               }
               _loc11_ += _loc9_;
               _loc12_ += _loc10_;
               _contentArea.right = Math.max(_contentArea.right,_loc11_);
               _contentArea.bottom = Math.max(_contentArea.bottom,_loc12_);
            }
            _loc1_++;
         }
         return _contentArea;
      }
      
      private function shareColumnSpace(param1:ContentColumnChild, param2:Number) : Number
      {
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:ConstraintColumn = param1.leftCol;
         var _loc4_:ConstraintColumn = param1.rightCol;
         var _loc5_:IUIComponent = param1.child;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = !!param1.rightOffset ? param1.rightOffset : 0;
         var _loc9_:Number = !!param1.leftOffset ? param1.leftOffset : 0;
         if(Boolean(_loc3_) && Boolean(_loc3_.width))
         {
            _loc6_ += _loc3_.width;
         }
         else if(Boolean(_loc4_) && !_loc3_)
         {
            _loc3_ = IConstraintLayout(target).constraintColumns[param1.right - 2];
            if(Boolean(_loc3_) && Boolean(_loc3_.width))
            {
               _loc6_ += _loc3_.width;
            }
         }
         if(Boolean(_loc4_) && Boolean(_loc4_.width))
         {
            _loc7_ += _loc4_.width;
         }
         else if(Boolean(_loc3_) && !_loc4_)
         {
            if((Boolean(_loc4_ = IConstraintLayout(target).constraintColumns[param1.left + 1])) && Boolean(_loc4_.width))
            {
               _loc7_ += _loc4_.width;
            }
         }
         if(Boolean(_loc3_) && isNaN(_loc3_.width))
         {
            _loc3_.setActualWidth(Math.max(0,_loc3_.maxWidth));
         }
         if(Boolean(_loc4_) && isNaN(_loc4_.width))
         {
            _loc4_.setActualWidth(Math.max(0,_loc4_.maxWidth));
         }
         var _loc10_:Number;
         if(_loc10_ = Number(_loc5_.getExplicitOrMeasuredWidth()))
         {
            if(!param1.leftCol)
            {
               if(_loc10_ > _loc6_)
               {
                  _loc12_ = _loc10_ - _loc6_ + _loc8_;
               }
               else
               {
                  _loc12_ = _loc10_ + _loc8_;
               }
            }
            if(!param1.rightCol)
            {
               if(_loc10_ > _loc7_)
               {
                  _loc11_ = _loc10_ - _loc7_ + _loc9_;
               }
               else
               {
                  _loc11_ = _loc10_ + _loc9_;
               }
            }
            if(Boolean(param1.leftCol) && Boolean(param1.rightCol))
            {
               if((_loc13_ = _loc10_ / Number(param1.span)) + _loc9_ < _loc6_)
               {
                  _loc11_ = _loc6_;
                  _loc12_ = _loc10_ - (_loc6_ - _loc9_) + _loc8_;
               }
               else
               {
                  _loc11_ = _loc13_ + _loc9_;
               }
               if(_loc13_ + _loc8_ < _loc7_)
               {
                  _loc12_ = _loc7_;
                  _loc11_ = _loc10_ - (_loc7_ - _loc8_) + _loc9_;
               }
               else
               {
                  _loc12_ = _loc13_ + _loc8_;
               }
            }
            _loc11_ = bound(_loc11_,_loc3_.minWidth,_loc3_.maxWidth);
            _loc3_.setActualWidth(_loc11_);
            param2 -= _loc11_;
            _loc12_ = bound(_loc12_,_loc4_.minWidth,_loc4_.maxWidth);
            _loc4_.setActualWidth(_loc12_);
            param2 -= _loc12_;
         }
         return param2;
      }
      
      private function getLayoutConstraints(param1:IUIComponent) : LayoutConstraints
      {
         var _loc2_:IConstraintClient = param1 as IConstraintClient;
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:LayoutConstraints = new LayoutConstraints();
         _loc3_.baseline = _loc2_.getConstraintValue("baseline");
         _loc3_.bottom = _loc2_.getConstraintValue("bottom");
         _loc3_.horizontalCenter = _loc2_.getConstraintValue("horizontalCenter");
         _loc3_.left = _loc2_.getConstraintValue("left");
         _loc3_.right = _loc2_.getConstraintValue("right");
         _loc3_.top = _loc2_.getConstraintValue("top");
         _loc3_.verticalCenter = _loc2_.getConstraintValue("verticalCenter");
         return _loc3_;
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:IUIComponent = null;
         var _loc10_:ConstraintColumn = null;
         var _loc11_:ConstraintRow = null;
         var _loc5_:Container;
         var _loc6_:int = (_loc5_ = super.target).numChildren;
         _loc5_.mx_internal::doingLayout = false;
         var _loc7_:EdgeMetrics = _loc5_.viewMetrics;
         _loc5_.mx_internal::doingLayout = true;
         var _loc8_:Number = param1 - _loc7_.left - _loc7_.right;
         var _loc9_:Number = param2 - _loc7_.top - _loc7_.bottom;
         if(IConstraintLayout(_loc5_).constraintColumns.length > 0 || IConstraintLayout(_loc5_).constraintRows.length > 0)
         {
            constraintRegionsInUse = true;
         }
         if(constraintRegionsInUse)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc6_)
            {
               _loc4_ = _loc5_.getChildAt(_loc3_) as IUIComponent;
               parseConstraints(_loc4_);
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < IConstraintLayout(_loc5_).constraintColumns.length)
            {
               if((_loc10_ = IConstraintLayout(_loc5_).constraintColumns[_loc3_]).mx_internal::contentSize)
               {
                  _loc10_.mx_internal::_width = NaN;
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < IConstraintLayout(_loc5_).constraintRows.length)
            {
               if((_loc11_ = IConstraintLayout(_loc5_).constraintRows[_loc3_]).mx_internal::contentSize)
               {
                  _loc11_.mx_internal::_height = NaN;
               }
               _loc3_++;
            }
            measureColumnsAndRows();
         }
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            _loc4_ = _loc5_.getChildAt(_loc3_) as IUIComponent;
            applyAnchorStylesDuringUpdateDisplayList(_loc8_,_loc9_,_loc4_);
            _loc3_++;
         }
      }
      
      private function applyAnchorStylesDuringUpdateDisplayList(param1:Number, param2:Number, param3:IUIComponent = null) : void
      {
         var _loc20_:int = 0;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:String = null;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Boolean = false;
         var _loc40_:Boolean = false;
         var _loc41_:Boolean = false;
         var _loc42_:ConstraintColumn = null;
         var _loc43_:Boolean = false;
         var _loc44_:Boolean = false;
         var _loc45_:Boolean = false;
         var _loc46_:Boolean = false;
         var _loc47_:ConstraintRow = null;
         var _loc4_:IConstraintClient;
         if(!(_loc4_ = param3 as IConstraintClient))
         {
            return;
         }
         var _loc5_:ChildConstraintInfo;
         var _loc6_:Number = (_loc5_ = parseConstraints(param3)).left;
         var _loc7_:Number = _loc5_.right;
         var _loc8_:Number = _loc5_.hc;
         var _loc9_:Number = _loc5_.top;
         var _loc10_:Number = _loc5_.bottom;
         var _loc11_:Number = _loc5_.vc;
         var _loc12_:Number = _loc5_.baseline;
         var _loc13_:String = _loc5_.leftBoundary;
         var _loc14_:String = _loc5_.rightBoundary;
         var _loc15_:String = _loc5_.hcBoundary;
         var _loc16_:String = _loc5_.topBoundary;
         var _loc17_:String = _loc5_.bottomBoundary;
         var _loc18_:String = _loc5_.vcBoundary;
         var _loc19_:String = _loc5_.baselineBoundary;
         var _loc26_:Boolean = false;
         var _loc27_:Boolean = false;
         var _loc28_:Boolean = !_loc15_ && !_loc13_ && !_loc14_;
         var _loc29_:Boolean = !_loc18_ && !_loc16_ && !_loc17_ && !_loc19_;
         var _loc30_:Number = 0;
         var _loc31_:Number = param1;
         var _loc32_:Number = 0;
         var _loc33_:Number = param2;
         if(!_loc28_)
         {
            _loc39_ = !!_loc13_ ? true : false;
            _loc40_ = !!_loc14_ ? true : false;
            _loc41_ = !!_loc15_ ? true : false;
            _loc20_ = 0;
            while(_loc20_ < IConstraintLayout(target).constraintColumns.length)
            {
               _loc42_ = ConstraintColumn(IConstraintLayout(target).constraintColumns[_loc20_]);
               if(_loc39_)
               {
                  if(_loc13_ == _loc42_.id)
                  {
                     _loc30_ = _loc42_.x;
                     _loc39_ = false;
                  }
               }
               if(_loc40_)
               {
                  if(_loc14_ == _loc42_.id)
                  {
                     _loc31_ = _loc42_.x + _loc42_.width;
                     _loc40_ = false;
                  }
               }
               if(_loc41_)
               {
                  if(_loc15_ == _loc42_.id)
                  {
                     _loc35_ = _loc42_.width;
                     _loc37_ = _loc42_.x;
                     _loc41_ = false;
                  }
               }
               _loc20_++;
            }
            if(_loc39_)
            {
               _loc25_ = String(resourceManager.getString("containers","columnNotFound",[_loc13_]));
               throw new ConstraintError(_loc25_);
            }
            if(_loc40_)
            {
               _loc25_ = String(resourceManager.getString("containers","columnNotFound",[_loc14_]));
               throw new ConstraintError(_loc25_);
            }
            if(_loc41_)
            {
               _loc25_ = String(resourceManager.getString("containers","columnNotFound",[_loc15_]));
               throw new ConstraintError(_loc25_);
            }
         }
         else if(!_loc28_)
         {
            _loc25_ = String(resourceManager.getString("containers","noColumnsFound"));
            throw new ConstraintError(_loc25_);
         }
         param1 = Math.round(_loc31_ - _loc30_);
         if(!isNaN(_loc6_) && !isNaN(_loc7_))
         {
            if((_loc21_ = param1 - _loc6_ - _loc7_) < param3.minWidth)
            {
               _loc21_ = Number(param3.minWidth);
            }
         }
         else if(!isNaN(param3.percentWidth))
         {
            _loc21_ = param3.percentWidth / 100 * param1;
            _loc21_ = bound(_loc21_,param3.minWidth,param3.maxWidth);
            _loc26_ = true;
         }
         else
         {
            _loc21_ = Number(param3.getExplicitOrMeasuredWidth());
         }
         if(!_loc29_ && IConstraintLayout(target).constraintRows.length > 0)
         {
            _loc43_ = !!_loc16_ ? true : false;
            _loc44_ = !!_loc17_ ? true : false;
            _loc45_ = !!_loc18_ ? true : false;
            _loc46_ = !!_loc19_ ? true : false;
            _loc20_ = 0;
            while(_loc20_ < IConstraintLayout(target).constraintRows.length)
            {
               _loc47_ = ConstraintRow(IConstraintLayout(target).constraintRows[_loc20_]);
               if(_loc43_)
               {
                  if(_loc16_ == _loc47_.id)
                  {
                     _loc32_ = _loc47_.y;
                     _loc43_ = false;
                  }
               }
               if(_loc44_)
               {
                  if(_loc17_ == _loc47_.id)
                  {
                     _loc33_ = _loc47_.y + _loc47_.height;
                     _loc44_ = false;
                  }
               }
               if(_loc45_)
               {
                  if(_loc18_ == _loc47_.id)
                  {
                     _loc34_ = _loc47_.height;
                     _loc36_ = _loc47_.y;
                     _loc45_ = false;
                  }
               }
               if(_loc46_)
               {
                  if(_loc19_ == _loc47_.id)
                  {
                     _loc38_ = _loc47_.y;
                     _loc46_ = false;
                  }
               }
               _loc20_++;
            }
            if(_loc43_)
            {
               _loc25_ = String(resourceManager.getString("containers","rowNotFound",[_loc16_]));
               throw new ConstraintError(_loc25_);
            }
            if(_loc44_)
            {
               _loc25_ = String(resourceManager.getString("containers","rowNotFound",[_loc17_]));
               throw new ConstraintError(_loc25_);
            }
            if(_loc45_)
            {
               _loc25_ = String(resourceManager.getString("containers","rowNotFound",[_loc18_]));
               throw new ConstraintError(_loc25_);
            }
            if(_loc46_)
            {
               _loc25_ = String(resourceManager.getString("containers","rowNotFound",[_loc19_]));
               throw new ConstraintError(_loc25_);
            }
         }
         else if(!_loc29_ && IConstraintLayout(target).constraintRows.length <= 0)
         {
            _loc25_ = String(resourceManager.getString("containers","noRowsFound"));
            throw new ConstraintError(_loc25_);
         }
         param2 = Math.round(_loc33_ - _loc32_);
         if(!isNaN(_loc9_) && !isNaN(_loc10_))
         {
            if((_loc22_ = param2 - _loc9_ - _loc10_) < param3.minHeight)
            {
               _loc22_ = Number(param3.minHeight);
            }
         }
         else if(!isNaN(param3.percentHeight))
         {
            _loc22_ = param3.percentHeight / 100 * param2;
            _loc22_ = bound(_loc22_,param3.minHeight,param3.maxHeight);
            _loc27_ = true;
         }
         else
         {
            _loc22_ = Number(param3.getExplicitOrMeasuredHeight());
         }
         if(!isNaN(_loc8_))
         {
            if(_loc15_)
            {
               _loc23_ = Math.round((_loc35_ - _loc21_) / 2 + _loc8_ + _loc37_);
            }
            else
            {
               _loc23_ = Math.round((param1 - _loc21_) / 2 + _loc8_);
            }
         }
         else if(!isNaN(_loc6_))
         {
            if(_loc13_)
            {
               _loc23_ = _loc30_ + _loc6_;
            }
            else
            {
               _loc23_ = _loc6_;
            }
         }
         else if(!isNaN(_loc7_))
         {
            if(_loc14_)
            {
               _loc23_ = _loc31_ - _loc7_ - _loc21_;
            }
            else
            {
               _loc23_ = param1 - _loc7_ - _loc21_;
            }
         }
         if(!isNaN(_loc12_))
         {
            if(_loc19_)
            {
               _loc24_ = _loc38_ - param3.baselinePosition + _loc12_;
            }
            else
            {
               _loc24_ = _loc12_;
            }
         }
         if(!isNaN(_loc11_))
         {
            if(_loc18_)
            {
               _loc24_ = Math.round((_loc34_ - _loc22_) / 2 + _loc11_ + _loc36_);
            }
            else
            {
               _loc24_ = Math.round((param2 - _loc22_) / 2 + _loc11_);
            }
         }
         else if(!isNaN(_loc9_))
         {
            if(_loc16_)
            {
               _loc24_ = _loc32_ + _loc9_;
            }
            else
            {
               _loc24_ = _loc9_;
            }
         }
         else if(!isNaN(_loc10_))
         {
            if(_loc17_)
            {
               _loc24_ = _loc33_ - _loc10_ - _loc22_;
            }
            else
            {
               _loc24_ = param2 - _loc10_ - _loc22_;
            }
         }
         _loc23_ = isNaN(_loc23_) ? Number(param3.x) : _loc23_;
         _loc24_ = isNaN(_loc24_) ? Number(param3.y) : _loc24_;
         param3.move(_loc23_,_loc24_);
         if(_loc26_)
         {
            if(_loc23_ + _loc21_ > param1)
            {
               _loc21_ = Math.max(param1 - _loc23_,param3.minWidth);
            }
         }
         if(_loc27_)
         {
            if(_loc24_ + _loc22_ > param2)
            {
               _loc22_ = Math.max(param2 - _loc24_,param3.minHeight);
            }
         }
         if(!isNaN(_loc21_) && !isNaN(_loc22_))
         {
            param3.setActualSize(_loc21_,_loc22_);
         }
      }
      
      private function target_childAddHandler(param1:ChildExistenceChangedEvent) : void
      {
         DisplayObject(param1.relatedObject).addEventListener(MoveEvent.MOVE,child_moveHandler);
      }
   }
}

class LayoutConstraints
{
    
   
   public var baseline;
   
   public var left;
   
   public var bottom;
   
   public var top;
   
   public var horizontalCenter;
   
   public var verticalCenter;
   
   public var right;
   
   public function LayoutConstraints()
   {
      super();
   }
}

class ChildConstraintInfo
{
    
   
   public var baseline:Number;
   
   public var left:Number;
   
   public var baselineBoundary:String;
   
   public var leftBoundary:String;
   
   public var hcBoundary:String;
   
   public var top:Number;
   
   public var right:Number;
   
   public var topBoundary:String;
   
   public var rightBoundary:String;
   
   public var bottom:Number;
   
   public var vc:Number;
   
   public var bottomBoundary:String;
   
   public var vcBoundary:String;
   
   public var hc:Number;
   
   public function ChildConstraintInfo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:String = null, param9:String = null, param10:String = null, param11:String = null, param12:String = null, param13:String = null, param14:String = null)
   {
      super();
      this.left = param1;
      this.right = param2;
      this.hc = param3;
      this.top = param4;
      this.bottom = param5;
      this.vc = param6;
      this.baseline = param7;
      this.leftBoundary = param8;
      this.rightBoundary = param9;
      this.hcBoundary = param10;
      this.topBoundary = param11;
      this.bottomBoundary = param12;
      this.vcBoundary = param13;
      this.baselineBoundary = param14;
   }
}

import mx.containers.utilityClasses.ConstraintColumn;
import mx.core.IUIComponent;

class ContentColumnChild
{
    
   
   public var rightCol:ConstraintColumn;
   
   public var hcCol:ConstraintColumn;
   
   public var left:Number;
   
   public var child:IUIComponent;
   
   public var rightOffset:Number;
   
   public var span:Number;
   
   public var hcOffset:Number;
   
   public var leftCol:ConstraintColumn;
   
   public var leftOffset:Number;
   
   public var hc:Number;
   
   public var right:Number;
   
   public function ContentColumnChild()
   {
      super();
   }
}

import mx.containers.utilityClasses.ConstraintRow;
import mx.core.IUIComponent;

class ContentRowChild
{
    
   
   public var topRow:ConstraintRow;
   
   public var topOffset:Number;
   
   public var baseline:Number;
   
   public var baselineRow:ConstraintRow;
   
   public var span:Number;
   
   public var top:Number;
   
   public var vcOffset:Number;
   
   public var child:IUIComponent;
   
   public var bottomOffset:Number;
   
   public var bottom:Number;
   
   public var vc:Number;
   
   public var bottomRow:ConstraintRow;
   
   public var vcRow:ConstraintRow;
   
   public var baselineOffset:Number;
   
   public function ContentRowChild()
   {
      super();
   }
}
