package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.controls.HScrollBar;
   import mx.controls.ToolTip;
   import mx.controls.VScrollBar;
   import mx.controls.scrollClasses.ScrollBar;
   import mx.events.ScrollEvent;
   import mx.events.ScrollEventDetail;
   import mx.events.ScrollEventDirection;
   import mx.managers.ToolTipManager;
   import mx.styles.ISimpleStyleClient;
   
   public class ScrollControlBase extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var numberOfRows:Number = 0;
      
      private var _scrollTipFunction:Function;
      
      private var scrollTip:ToolTip;
      
      public var showScrollTips:Boolean = false;
      
      private var numberOfCols:Number = 0;
      
      protected var maskShape:Shape;
      
      private var oldTTMEnabled:Boolean;
      
      mx_internal var _maxHorizontalScrollPosition:Number;
      
      protected var border:mx.core.IFlexDisplayObject;
      
      private var _viewMetrics:mx.core.EdgeMetrics;
      
      mx_internal var _maxVerticalScrollPosition:Number;
      
      protected var verticalScrollBar:ScrollBar;
      
      mx_internal var _horizontalScrollPosition:Number = 0;
      
      private var propsInited:Boolean;
      
      protected var horizontalScrollBar:ScrollBar;
      
      mx_internal var _horizontalScrollPolicy:String = "off";
      
      mx_internal var _verticalScrollPosition:Number = 0;
      
      private var scrollThumbMidPoint:Number;
      
      mx_internal var _verticalScrollPolicy:String = "auto";
      
      protected var scrollAreaChanged:Boolean;
      
      private var viewableColumns:Number;
      
      public var liveScrolling:Boolean = true;
      
      private var viewableRows:Number;
      
      private var invLayout:Boolean;
      
      public function ScrollControlBase()
      {
         super();
         _viewMetrics = mx.core.EdgeMetrics.EMPTY;
         addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(horizontalScrollBar)
         {
            horizontalScrollBar.enabled = param1;
         }
         if(verticalScrollBar)
         {
            verticalScrollBar.enabled = param1;
         }
      }
      
      [Bindable("scrollTipFunctionChanged")]
      public function get scrollTipFunction() : Function
      {
         return _scrollTipFunction;
      }
      
      public function set scrollTipFunction(param1:Function) : void
      {
         _scrollTipFunction = param1;
         dispatchEvent(new Event("scrollTipFunctionChanged"));
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         layoutChrome(param1,param2);
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         invLayout = false;
         var _loc5_:mx.core.EdgeMetrics = _viewMetrics = viewMetrics;
         if(Boolean(horizontalScrollBar) && false)
         {
            horizontalScrollBar.setActualSize(_loc3_ - _loc5_.left - _loc5_.right,horizontalScrollBar.minHeight);
            horizontalScrollBar.move(_loc5_.left,_loc4_ - _loc5_.bottom);
            horizontalScrollBar.enabled = enabled;
         }
         if(Boolean(verticalScrollBar) && false)
         {
            verticalScrollBar.setActualSize(verticalScrollBar.minWidth,_loc4_ - _loc5_.top - _loc5_.bottom);
            verticalScrollBar.move(_loc3_ - _loc5_.right,_loc5_.top);
            verticalScrollBar.enabled = enabled;
         }
         var _loc6_:DisplayObject = maskShape;
         var _loc7_:Number = _loc3_ - _loc5_.left - _loc5_.right;
         var _loc8_:Number = _loc4_ - _loc5_.top - _loc5_.bottom;
         _loc6_.width = _loc7_ < 0 ? 0 : _loc7_;
         _loc6_.height = _loc8_ < 0 ? 0 : _loc8_;
         _loc6_.x = _loc5_.left;
         _loc6_.y = _loc5_.top;
      }
      
      protected function setScrollBarProperties(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:Boolean = false;
         var _loc5_:String = this.horizontalScrollPolicy;
         var _loc6_:String = this.verticalScrollPolicy;
         scrollAreaChanged = false;
         if(_loc5_ == ScrollPolicy.ON || param2 < param1 && param1 > 0 && _loc5_ == ScrollPolicy.AUTO)
         {
            if(!horizontalScrollBar)
            {
               createHScrollBar(false);
               horizontalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollHandler);
               horizontalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollTipHandler);
               horizontalScrollBar.scrollPosition = mx_internal::_horizontalScrollPosition;
            }
            if((_loc7_ = roomForScrollBar(horizontalScrollBar,unscaledWidth,unscaledHeight)) != horizontalScrollBar.visible)
            {
               horizontalScrollBar.visible = _loc7_;
               scrollAreaChanged = true;
            }
            if(horizontalScrollBar && false && (numberOfCols != param1 || viewableColumns != param2 || scrollAreaChanged))
            {
               horizontalScrollBar.setScrollProperties(param2,0,param1 - param2);
               if(horizontalScrollBar.scrollPosition != mx_internal::_horizontalScrollPosition)
               {
                  horizontalScrollBar.scrollPosition = mx_internal::_horizontalScrollPosition;
               }
               viewableColumns = param2;
               numberOfCols = param1;
            }
         }
         else if((_loc5_ == ScrollPolicy.AUTO || _loc5_ == ScrollPolicy.OFF) && horizontalScrollBar && false)
         {
            horizontalScrollPosition = 0;
            horizontalScrollBar.setScrollProperties(param2,0,0);
            horizontalScrollBar.visible = false;
            viewableColumns = NaN;
            scrollAreaChanged = true;
         }
         if(_loc6_ == ScrollPolicy.ON || param4 < param3 && param3 > 0 && _loc6_ == ScrollPolicy.AUTO)
         {
            if(!verticalScrollBar)
            {
               createVScrollBar(false);
               verticalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollHandler);
               verticalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollTipHandler);
               verticalScrollBar.scrollPosition = mx_internal::_verticalScrollPosition;
            }
            if((_loc7_ = roomForScrollBar(verticalScrollBar,unscaledWidth,unscaledHeight)) != verticalScrollBar.visible)
            {
               verticalScrollBar.visible = _loc7_;
               scrollAreaChanged = true;
            }
            if(verticalScrollBar && false && (numberOfRows != param3 || viewableRows != param4 || scrollAreaChanged))
            {
               verticalScrollBar.setScrollProperties(param4,0,param3 - param4);
               if(verticalScrollBar.scrollPosition != mx_internal::_verticalScrollPosition)
               {
                  verticalScrollBar.scrollPosition = mx_internal::_verticalScrollPosition;
               }
               viewableRows = param4;
               numberOfRows = param3;
            }
         }
         else if((_loc6_ == ScrollPolicy.AUTO || _loc6_ == ScrollPolicy.OFF) && verticalScrollBar && false)
         {
            verticalScrollPosition = 0;
            verticalScrollBar.setScrollProperties(param4,0,0);
            verticalScrollBar.visible = false;
            viewableRows = NaN;
            scrollAreaChanged = true;
         }
         if(scrollAreaChanged)
         {
            updateDisplayList(unscaledWidth,unscaledHeight);
         }
      }
      
      private function createHScrollBar(param1:Boolean) : ScrollBar
      {
         horizontalScrollBar = new HScrollBar();
         horizontalScrollBar.visible = param1;
         horizontalScrollBar.enabled = enabled;
         var _loc2_:String = getStyle("horizontalScrollBarStyleName");
         horizontalScrollBar.styleName = _loc2_;
         addChild(horizontalScrollBar);
         horizontalScrollBar.validateNow();
         return horizontalScrollBar;
      }
      
      [Bindable("horizontalScrollPolicyChanged")]
      public function get horizontalScrollPolicy() : String
      {
         return mx_internal::_horizontalScrollPolicy;
      }
      
      [Bindable("maxVerticalScrollPositionChanged")]
      public function get maxVerticalScrollPosition() : Number
      {
         if(!isNaN(mx_internal::_maxVerticalScrollPosition))
         {
            return mx_internal::_maxVerticalScrollPosition;
         }
         return !!verticalScrollBar ? 0 : 0;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         mx_internal::_horizontalScrollPosition = param1;
         if(horizontalScrollBar)
         {
            horizontalScrollBar.scrollPosition = param1;
         }
         dispatchEvent(new Event("viewChanged"));
      }
      
      protected function roomForScrollBar(param1:ScrollBar, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:mx.core.EdgeMetrics = borderMetrics;
         return param2 >= param1.minWidth + _loc4_.left + _loc4_.right && param3 >= param1.minHeight + _loc4_.top + _loc4_.bottom;
      }
      
      public function set maxHorizontalScrollPosition(param1:Number) : void
      {
         mx_internal::_maxHorizontalScrollPosition = param1;
         dispatchEvent(new Event("maxHorizontalScrollPositionChanged"));
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      public function get verticalScrollPosition() : Number
      {
         return mx_internal::_verticalScrollPosition;
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         var _loc2_:String = param1.toLowerCase();
         if(mx_internal::_horizontalScrollPolicy != _loc2_)
         {
            mx_internal::_horizontalScrollPolicy = _loc2_;
            invalidateDisplayList();
            dispatchEvent(new Event("horizontalScrollPolicyChanged"));
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Graphics = null;
         super.createChildren();
         createBorder();
         if(!maskShape)
         {
            maskShape = new FlexShape();
            maskShape.name = "mask";
            _loc1_ = maskShape.graphics;
            _loc1_.beginFill(16777215);
            _loc1_.drawRect(0,0,10,10);
            _loc1_.endFill();
            addChild(maskShape);
         }
         maskShape.visible = false;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:Boolean = param1 == null || param1 == "styleName";
         super.styleChanged(param1);
         if(_loc2_ || param1 == "horizontalScrollBarStyleName")
         {
            if(horizontalScrollBar)
            {
               _loc3_ = getStyle("horizontalScrollBarStyleName");
               horizontalScrollBar.styleName = _loc3_;
            }
         }
         if(_loc2_ || param1 == "verticalScrollBarStyleName")
         {
            if(verticalScrollBar)
            {
               _loc4_ = getStyle("verticalScrollBarStyleName");
               verticalScrollBar.styleName = _loc4_;
            }
         }
         if(_loc2_ || param1 == "borderSkin")
         {
            if(border)
            {
               removeChild(DisplayObject(border));
               border = null;
               createBorder();
            }
         }
      }
      
      private function createVScrollBar(param1:Boolean) : ScrollBar
      {
         verticalScrollBar = new VScrollBar();
         verticalScrollBar.visible = param1;
         verticalScrollBar.enabled = enabled;
         var _loc2_:String = getStyle("verticalScrollBarStyleName");
         verticalScrollBar.styleName = _loc2_;
         addChild(verticalScrollBar);
         return verticalScrollBar;
      }
      
      mx_internal function get scroll_verticalScrollBar() : ScrollBar
      {
         return verticalScrollBar;
      }
      
      protected function createBorder() : void
      {
         var _loc1_:Class = null;
         if(!border && isBorderNeeded())
         {
            _loc1_ = getStyle("borderSkin");
            if(_loc1_ != null)
            {
               border = new _loc1_();
               if(border is IUIComponent)
               {
                  IUIComponent(border).enabled = enabled;
               }
               if(border is ISimpleStyleClient)
               {
                  ISimpleStyleClient(border).styleName = this;
               }
               addChildAt(DisplayObject(border),0);
               invalidateDisplayList();
            }
         }
      }
      
      mx_internal function get scroll_horizontalScrollBar() : ScrollBar
      {
         return horizontalScrollBar;
      }
      
      protected function layoutChrome(param1:Number, param2:Number) : void
      {
         if(border)
         {
            border.move(0,0);
            border.setActualSize(param1,param2);
         }
      }
      
      protected function scrollHandler(param1:Event) : void
      {
         var _loc2_:ScrollBar = null;
         var _loc3_:Number = NaN;
         var _loc4_:QName = null;
         if(param1 is ScrollEvent)
         {
            _loc2_ = ScrollBar(param1.target);
            _loc3_ = _loc2_.scrollPosition;
            if(_loc2_ == verticalScrollBar)
            {
               _loc4_ = new QName(mx_internal,"_verticalScrollPosition");
            }
            else if(_loc2_ == horizontalScrollBar)
            {
               _loc4_ = new QName(mx_internal,"_horizontalScrollPosition");
            }
            dispatchEvent(param1);
            if(_loc4_)
            {
               this[_loc4_] = _loc3_;
            }
         }
      }
      
      protected function mouseWheelHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:ScrollEvent = null;
         if(Boolean(verticalScrollBar) && false)
         {
            param1.stopPropagation();
            _loc2_ = param1.delta <= 0 ? 1 : -1;
            _loc3_ = Math.max(Math.abs(param1.delta),verticalScrollBar.lineScrollSize);
            _loc4_ = verticalScrollPosition;
            verticalScrollPosition += 3 * _loc3_ * _loc2_;
            (_loc5_ = new ScrollEvent(ScrollEvent.SCROLL)).direction = ScrollEventDirection.VERTICAL;
            _loc5_.position = verticalScrollPosition;
            _loc5_.delta = verticalScrollPosition - _loc4_;
            dispatchEvent(_loc5_);
         }
      }
      
      private function scrollTipHandler(param1:Event) : void
      {
         var _loc2_:ScrollBar = null;
         var _loc3_:* = false;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         var _loc7_:Point = null;
         if(param1 is ScrollEvent)
         {
            if(!showScrollTips)
            {
               return;
            }
            if(ScrollEvent(param1).detail == ScrollEventDetail.THUMB_POSITION)
            {
               if(scrollTip)
               {
                  systemManager.topLevelSystemManager.removeChildFromSandboxRoot("toolTipChildren",scrollTip as DisplayObject);
                  scrollTip = null;
                  ToolTipManager.enabled = oldTTMEnabled;
               }
            }
            else if(ScrollEvent(param1).detail == ScrollEventDetail.THUMB_TRACK)
            {
               _loc2_ = ScrollBar(param1.target);
               _loc3_ = _loc2_ == verticalScrollBar;
               _loc4_ = _loc3_ ? "vertical" : "horizontal";
               _loc5_ = _loc2_.scrollPosition;
               if(!scrollTip)
               {
                  scrollTip = new ToolTip();
                  systemManager.topLevelSystemManager.addChildToSandboxRoot("toolTipChildren",scrollTip as DisplayObject);
                  scrollThumbMidPoint = _loc2_.mx_internal::scrollThumb.height / 2;
                  oldTTMEnabled = ToolTipManager.enabled;
                  ToolTipManager.enabled = false;
               }
               _loc6_ = _loc5_.toString();
               if(_scrollTipFunction != null)
               {
                  _loc6_ = _scrollTipFunction(_loc4_,_loc5_);
               }
               if(_loc6_ == "")
               {
                  scrollTip.visible = false;
               }
               else
               {
                  scrollTip.text = _loc6_;
                  ToolTipManager.mx_internal::sizeTip(scrollTip);
                  _loc7_ = new Point();
                  if(_loc3_)
                  {
                     _loc7_.x = -3;
                     _loc7_.y = _loc2_.mx_internal::scrollThumb.y + scrollThumbMidPoint - 0;
                  }
                  else
                  {
                     _loc7_.x = -3;
                     _loc7_.y = _loc2_.mx_internal::scrollThumb.y + scrollThumbMidPoint - 0;
                  }
                  _loc7_ = _loc2_.localToGlobal(_loc7_);
                  scrollTip.move(_loc7_.x,_loc7_.y);
                  scrollTip.visible = true;
               }
            }
         }
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         mx_internal::_verticalScrollPosition = param1;
         if(verticalScrollBar)
         {
            verticalScrollBar.scrollPosition = param1;
         }
         dispatchEvent(new Event("viewChanged"));
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      public function get horizontalScrollPosition() : Number
      {
         return mx_internal::_horizontalScrollPosition;
      }
      
      private function isBorderNeeded() : Boolean
      {
         var _loc1_:Object = getStyle("borderStyle");
         if(_loc1_)
         {
            if(_loc1_ != "none" || _loc1_ == "none" && getStyle("mouseShield"))
            {
               return true;
            }
         }
         _loc1_ = getStyle("backgroundColor");
         if(_loc1_ !== null && _loc1_ !== "")
         {
            return true;
         }
         _loc1_ = getStyle("backgroundImage");
         return _loc1_ != null && _loc1_ != "";
      }
      
      [Bindable("maxHorizontalScrollPositionChanged")]
      public function get maxHorizontalScrollPosition() : Number
      {
         if(!isNaN(mx_internal::_maxHorizontalScrollPosition))
         {
            return mx_internal::_maxHorizontalScrollPosition;
         }
         return !!horizontalScrollBar ? 0 : 0;
      }
      
      public function set maxVerticalScrollPosition(param1:Number) : void
      {
         mx_internal::_maxVerticalScrollPosition = param1;
         dispatchEvent(new Event("maxVerticalScrollPositionChanged"));
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         var _loc2_:String = param1.toLowerCase();
         if(mx_internal::_verticalScrollPolicy != _loc2_)
         {
            mx_internal::_verticalScrollPolicy = _loc2_;
            invalidateDisplayList();
            dispatchEvent(new Event("verticalScrollPolicyChanged"));
         }
      }
      
      public function get viewMetrics() : mx.core.EdgeMetrics
      {
         _viewMetrics = borderMetrics.clone();
         if(!horizontalScrollBar && horizontalScrollPolicy == ScrollPolicy.ON)
         {
            createHScrollBar(true);
            horizontalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollHandler);
            horizontalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollTipHandler);
            horizontalScrollBar.scrollPosition = mx_internal::_horizontalScrollPosition;
            invalidateDisplayList();
         }
         if(!verticalScrollBar && verticalScrollPolicy == ScrollPolicy.ON)
         {
            createVScrollBar(true);
            verticalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollHandler);
            verticalScrollBar.addEventListener(ScrollEvent.SCROLL,scrollTipHandler);
            verticalScrollBar.scrollPosition = mx_internal::_verticalScrollPosition;
            invalidateDisplayList();
         }
         if(Boolean(verticalScrollBar) && false)
         {
            _viewMetrics.right = NaN;
         }
         if(Boolean(horizontalScrollBar) && false)
         {
            _viewMetrics.bottom = NaN;
         }
         return _viewMetrics;
      }
      
      [Bindable("verticalScrollPolicyChanged")]
      public function get verticalScrollPolicy() : String
      {
         return mx_internal::_verticalScrollPolicy;
      }
      
      public function get borderMetrics() : mx.core.EdgeMetrics
      {
         return Boolean(border) && border is IRectangularBorder ? IRectangularBorder(border).borderMetrics : mx.core.EdgeMetrics.EMPTY;
      }
   }
}
