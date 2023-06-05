package mx.controls.scrollClasses
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import mx.controls.Button;
   import mx.core.FlexVersion;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.SandboxMouseEvent;
   import mx.events.ScrollEvent;
   import mx.events.ScrollEventDetail;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.StyleProxy;
   
   public class ScrollBar extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const THICKNESS:Number = 16;
       
      
      private var _direction:String = "vertical";
      
      private var _pageScrollSize:Number = 0;
      
      mx_internal var scrollTrack:Button;
      
      mx_internal var downArrow:Button;
      
      mx_internal var scrollThumb:mx.controls.scrollClasses.ScrollThumb;
      
      private var trackScrollRepeatDirection:int;
      
      private var _minScrollPosition:Number = 0;
      
      private var trackPosition:Number;
      
      private var _pageSize:Number = 0;
      
      mx_internal var _minHeight:Number = 32;
      
      private var _maxScrollPosition:Number = 0;
      
      private var trackScrollTimer:Timer;
      
      mx_internal var upArrow:Button;
      
      private var _lineScrollSize:Number = 1;
      
      private var _scrollPosition:Number = 0;
      
      private var trackScrolling:Boolean = false;
      
      mx_internal var isScrolling:Boolean;
      
      mx_internal var oldPosition:Number;
      
      mx_internal var _minWidth:Number = 16;
      
      public function ScrollBar()
      {
         super();
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         invalidateDisplayList();
      }
      
      public function set lineScrollSize(param1:Number) : void
      {
         _lineScrollSize = param1;
      }
      
      public function get minScrollPosition() : Number
      {
         return _minScrollPosition;
      }
      
      mx_internal function dispatchScrollEvent(param1:Number, param2:String) : void
      {
         var _loc3_:ScrollEvent = new ScrollEvent(ScrollEvent.SCROLL);
         _loc3_.detail = param2;
         _loc3_.position = scrollPosition;
         _loc3_.delta = scrollPosition - param1;
         _loc3_.direction = direction;
         dispatchEvent(_loc3_);
      }
      
      private function downArrow_buttonDownHandler(param1:FlexEvent) : void
      {
         if(isNaN(mx_internal::oldPosition))
         {
            mx_internal::oldPosition = scrollPosition;
         }
         mx_internal::lineScroll(1);
      }
      
      private function scrollTrack_mouseDownHandler(param1:MouseEvent) : void
      {
         if(!(param1.target == this || param1.target == mx_internal::scrollTrack))
         {
            return;
         }
         trackScrolling = true;
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,scrollTrack_mouseUpHandler,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,scrollTrack_mouseMoveHandler,true);
         _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,scrollTrack_mouseLeaveHandler);
         systemManager.deployMouseShields(true);
         var _loc3_:Point = new Point(param1.localX,param1.localY);
         _loc3_ = param1.target.localToGlobal(_loc3_);
         _loc3_ = globalToLocal(_loc3_);
         trackPosition = _loc3_.y;
         if(isNaN(mx_internal::oldPosition))
         {
            mx_internal::oldPosition = scrollPosition;
         }
         trackScrollRepeatDirection = NaN < _loc3_.y ? 1 : (mx_internal::scrollThumb.y > _loc3_.y ? -1 : 0);
         mx_internal::pageScroll(trackScrollRepeatDirection);
         if(!trackScrollTimer)
         {
            trackScrollTimer = new Timer(getStyle("repeatDelay"),1);
            trackScrollTimer.addEventListener(TimerEvent.TIMER,trackScrollTimerHandler);
         }
         else
         {
            trackScrollTimer.delay = getStyle("repeatDelay");
            trackScrollTimer.repeatCount = 1;
         }
         trackScrollTimer.start();
      }
      
      public function set minScrollPosition(param1:Number) : void
      {
         _minScrollPosition = param1;
         invalidateDisplayList();
      }
      
      public function get scrollPosition() : Number
      {
         return _scrollPosition;
      }
      
      mx_internal function get linePlusDetail() : String
      {
         return direction == ScrollBarDirection.VERTICAL ? "null" : ScrollEventDetail.LINE_RIGHT;
      }
      
      public function get maxScrollPosition() : Number
      {
         return _maxScrollPosition;
      }
      
      protected function get thumbStyleFilters() : Object
      {
         return null;
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
      }
      
      public function get lineScrollSize() : Number
      {
         return _lineScrollSize;
      }
      
      mx_internal function get virtualHeight() : Number
      {
         return unscaledHeight;
      }
      
      public function set scrollPosition(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         _scrollPosition = param1;
         if(mx_internal::scrollThumb)
         {
            if(!cacheAsBitmap)
            {
               cacheHeuristic = mx_internal::scrollThumb.cacheHeuristic = true;
            }
            if(!mx_internal::isScrolling)
            {
               param1 = Math.min(param1,maxScrollPosition);
               param1 = Math.max(param1,minScrollPosition);
               _loc2_ = maxScrollPosition - minScrollPosition;
               _loc3_ = _loc2_ == 0 || isNaN(_loc2_) ? 0 : (param1 - minScrollPosition) * (trackHeight - 0) / _loc2_ + trackY;
               _loc4_ = (mx_internal::virtualWidth - 0) / 2 + getStyle("thumbOffset");
               mx_internal::scrollThumb.move(Math.round(_loc4_),Math.round(_loc3_));
            }
         }
      }
      
      protected function get downArrowStyleFilters() : Object
      {
         return null;
      }
      
      public function get pageSize() : Number
      {
         return _pageSize;
      }
      
      public function set pageScrollSize(param1:Number) : void
      {
         _pageScrollSize = param1;
      }
      
      public function set maxScrollPosition(param1:Number) : void
      {
         _maxScrollPosition = param1;
         invalidateDisplayList();
      }
      
      mx_internal function pageScroll(param1:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc2_:Number = _pageScrollSize != 0 ? _pageScrollSize : pageSize;
         var _loc3_:Number = _scrollPosition + param1 * _loc2_;
         if(_loc3_ > maxScrollPosition)
         {
            _loc3_ = maxScrollPosition;
         }
         else if(_loc3_ < minScrollPosition)
         {
            _loc3_ = minScrollPosition;
         }
         if(_loc3_ != scrollPosition)
         {
            _loc4_ = scrollPosition;
            scrollPosition = _loc3_;
            _loc5_ = param1 < 0 ? mx_internal::pageMinusDetail : mx_internal::pagePlusDetail;
            mx_internal::dispatchScrollEvent(_loc4_,_loc5_);
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!mx_internal::scrollTrack)
         {
            mx_internal::scrollTrack = new Button();
            mx_internal::scrollTrack.focusEnabled = false;
            mx_internal::scrollTrack.mx_internal::skinName = "trackSkin";
            mx_internal::scrollTrack.mx_internal::upSkinName = "trackUpSkin";
            mx_internal::scrollTrack.mx_internal::overSkinName = "trackOverSkin";
            mx_internal::scrollTrack.mx_internal::downSkinName = "trackDownSkin";
            mx_internal::scrollTrack.mx_internal::disabledSkinName = "trackDisabledSkin";
            if(mx_internal::scrollTrack is ISimpleStyleClient)
            {
               ISimpleStyleClient(mx_internal::scrollTrack).styleName = this;
            }
            addChild(mx_internal::scrollTrack);
            mx_internal::scrollTrack.validateProperties();
         }
         if(!mx_internal::upArrow)
         {
            mx_internal::upArrow = new Button();
            mx_internal::upArrow.enabled = false;
            mx_internal::upArrow.autoRepeat = true;
            mx_internal::upArrow.focusEnabled = false;
            mx_internal::upArrow.mx_internal::upSkinName = "upArrowUpSkin";
            mx_internal::upArrow.mx_internal::overSkinName = "upArrowOverSkin";
            mx_internal::upArrow.mx_internal::downSkinName = "upArrowDownSkin";
            mx_internal::upArrow.mx_internal::disabledSkinName = "upArrowDisabledSkin";
            mx_internal::upArrow.mx_internal::skinName = "upArrowSkin";
            mx_internal::upArrow.mx_internal::upIconName = "";
            mx_internal::upArrow.mx_internal::overIconName = "";
            mx_internal::upArrow.mx_internal::downIconName = "";
            mx_internal::upArrow.mx_internal::disabledIconName = "";
            addChild(mx_internal::upArrow);
            mx_internal::upArrow.styleName = new StyleProxy(this,upArrowStyleFilters);
            mx_internal::upArrow.validateProperties();
            mx_internal::upArrow.addEventListener(FlexEvent.BUTTON_DOWN,upArrow_buttonDownHandler);
         }
         if(!mx_internal::downArrow)
         {
            mx_internal::downArrow = new Button();
            mx_internal::downArrow.enabled = false;
            mx_internal::downArrow.autoRepeat = true;
            mx_internal::downArrow.focusEnabled = false;
            mx_internal::downArrow.mx_internal::upSkinName = "downArrowUpSkin";
            mx_internal::downArrow.mx_internal::overSkinName = "downArrowOverSkin";
            mx_internal::downArrow.mx_internal::downSkinName = "downArrowDownSkin";
            mx_internal::downArrow.mx_internal::disabledSkinName = "downArrowDisabledSkin";
            mx_internal::downArrow.mx_internal::skinName = "downArrowSkin";
            mx_internal::downArrow.mx_internal::upIconName = "";
            mx_internal::downArrow.mx_internal::overIconName = "";
            mx_internal::downArrow.mx_internal::downIconName = "";
            mx_internal::downArrow.mx_internal::disabledIconName = "";
            addChild(mx_internal::downArrow);
            mx_internal::downArrow.styleName = new StyleProxy(this,downArrowStyleFilters);
            mx_internal::downArrow.validateProperties();
            mx_internal::downArrow.addEventListener(FlexEvent.BUTTON_DOWN,downArrow_buttonDownHandler);
         }
      }
      
      private function scrollTrack_mouseOverHandler(param1:MouseEvent) : void
      {
         if(!(param1.target == this || param1.target == mx_internal::scrollTrack))
         {
            return;
         }
         if(trackScrolling)
         {
            trackScrollTimer.start();
         }
      }
      
      private function get minDetail() : String
      {
         return direction == ScrollBarDirection.VERTICAL ? "null" : ScrollEventDetail.AT_LEFT;
      }
      
      mx_internal function isScrollBarKey(param1:uint) : Boolean
      {
         var _loc2_:Number = NaN;
         if(param1 == Keyboard.HOME)
         {
            if(scrollPosition != 0)
            {
               _loc2_ = scrollPosition;
               scrollPosition = 0;
               mx_internal::dispatchScrollEvent(_loc2_,minDetail);
            }
            return true;
         }
         if(param1 == Keyboard.END)
         {
            if(scrollPosition < maxScrollPosition)
            {
               _loc2_ = scrollPosition;
               scrollPosition = maxScrollPosition;
               mx_internal::dispatchScrollEvent(_loc2_,maxDetail);
            }
            return true;
         }
         return false;
      }
      
      mx_internal function get lineMinusDetail() : String
      {
         return direction == ScrollBarDirection.VERTICAL ? "null" : ScrollEventDetail.LINE_LEFT;
      }
      
      mx_internal function get pageMinusDetail() : String
      {
         return direction == ScrollBarDirection.VERTICAL ? "null" : ScrollEventDetail.PAGE_LEFT;
      }
      
      private function get maxDetail() : String
      {
         return direction == ScrollBarDirection.VERTICAL ? "null" : ScrollEventDetail.AT_RIGHT;
      }
      
      private function scrollTrack_mouseLeaveHandler(param1:Event) : void
      {
         trackScrolling = false;
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,scrollTrack_mouseUpHandler,true);
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,scrollTrack_mouseMoveHandler,true);
         _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,scrollTrack_mouseLeaveHandler);
         systemManager.deployMouseShields(false);
         if(trackScrollTimer)
         {
            trackScrollTimer.reset();
         }
         if(param1.target != mx_internal::scrollTrack)
         {
            return;
         }
         var _loc3_:String = mx_internal::oldPosition > scrollPosition ? mx_internal::pageMinusDetail : mx_internal::pagePlusDetail;
         mx_internal::dispatchScrollEvent(mx_internal::oldPosition,_loc3_);
         mx_internal::oldPosition = NaN;
      }
      
      protected function get upArrowStyleFilters() : Object
      {
         return null;
      }
      
      private function get trackHeight() : Number
      {
         return mx_internal::virtualHeight - (mx_internal::upArrow.getExplicitOrMeasuredHeight() + mx_internal::downArrow.getExplicitOrMeasuredHeight());
      }
      
      public function get pageScrollSize() : Number
      {
         return _pageScrollSize;
      }
      
      override protected function measure() : void
      {
         super.measure();
         mx_internal::upArrow.validateSize();
         mx_internal::downArrow.validateSize();
         mx_internal::scrollTrack.validateSize();
         if(true)
         {
            mx_internal::_minWidth = !!mx_internal::scrollThumb ? mx_internal::scrollThumb.getExplicitOrMeasuredWidth() : 0;
            mx_internal::_minWidth = Math.max(mx_internal::scrollTrack.getExplicitOrMeasuredWidth(),mx_internal::upArrow.getExplicitOrMeasuredWidth(),mx_internal::downArrow.getExplicitOrMeasuredWidth(),mx_internal::_minWidth);
         }
         else
         {
            mx_internal::_minWidth = mx_internal::upArrow.getExplicitOrMeasuredWidth();
         }
         mx_internal::_minHeight = mx_internal::upArrow.getExplicitOrMeasuredHeight() + mx_internal::downArrow.getExplicitOrMeasuredHeight();
      }
      
      mx_internal function lineScroll(param1:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc2_:Number = _lineScrollSize;
         var _loc3_:Number = _scrollPosition + param1 * _loc2_;
         if(_loc3_ > maxScrollPosition)
         {
            _loc3_ = maxScrollPosition;
         }
         else if(_loc3_ < minScrollPosition)
         {
            _loc3_ = minScrollPosition;
         }
         if(_loc3_ != scrollPosition)
         {
            _loc4_ = scrollPosition;
            scrollPosition = _loc3_;
            _loc5_ = param1 < 0 ? mx_internal::lineMinusDetail : mx_internal::linePlusDetail;
            mx_internal::dispatchScrollEvent(_loc4_,_loc5_);
         }
      }
      
      public function setScrollProperties(param1:Number, param2:Number, param3:Number, param4:Number = 0) : void
      {
         var _loc5_:Number = NaN;
         this.pageSize = param1;
         _pageScrollSize = param4 > 0 ? param4 : param1;
         this.minScrollPosition = Math.max(param2,0);
         this.maxScrollPosition = Math.max(param3,0);
         _scrollPosition = Math.max(this.minScrollPosition,_scrollPosition);
         _scrollPosition = Math.min(this.maxScrollPosition,_scrollPosition);
         if(this.maxScrollPosition - this.minScrollPosition > 0 && enabled)
         {
            mx_internal::upArrow.enabled = true;
            mx_internal::downArrow.enabled = true;
            mx_internal::scrollTrack.enabled = true;
            addEventListener(MouseEvent.MOUSE_DOWN,scrollTrack_mouseDownHandler);
            addEventListener(MouseEvent.MOUSE_OVER,scrollTrack_mouseOverHandler);
            addEventListener(MouseEvent.MOUSE_OUT,scrollTrack_mouseOutHandler);
            if(!mx_internal::scrollThumb)
            {
               mx_internal::scrollThumb = new mx.controls.scrollClasses.ScrollThumb();
               mx_internal::scrollThumb.focusEnabled = false;
               addChildAt(mx_internal::scrollThumb,getChildIndex(mx_internal::downArrow));
               mx_internal::scrollThumb.styleName = new StyleProxy(this,thumbStyleFilters);
               mx_internal::scrollThumb.mx_internal::upSkinName = "thumbUpSkin";
               mx_internal::scrollThumb.mx_internal::overSkinName = "thumbOverSkin";
               mx_internal::scrollThumb.mx_internal::downSkinName = "thumbDownSkin";
               mx_internal::scrollThumb.mx_internal::iconName = "thumbIcon";
               mx_internal::scrollThumb.mx_internal::skinName = "thumbSkin";
            }
            if((_loc5_ = trackHeight < 0 ? 0 : Math.round(param1 / (this.maxScrollPosition - this.minScrollPosition + param1) * trackHeight)) < mx_internal::scrollThumb.minHeight)
            {
               if(trackHeight < mx_internal::scrollThumb.minHeight)
               {
                  mx_internal::scrollThumb.visible = false;
               }
               else
               {
                  _loc5_ = 0;
                  mx_internal::scrollThumb.visible = true;
                  mx_internal::scrollThumb.setActualSize(mx_internal::scrollThumb.measuredWidth,mx_internal::scrollThumb.minHeight);
               }
            }
            else
            {
               mx_internal::scrollThumb.visible = true;
               mx_internal::scrollThumb.setActualSize(mx_internal::scrollThumb.measuredWidth,_loc5_);
            }
            mx_internal::scrollThumb.mx_internal::setRange(mx_internal::upArrow.getExplicitOrMeasuredHeight() + 0,mx_internal::virtualHeight - mx_internal::downArrow.getExplicitOrMeasuredHeight() - 0,this.minScrollPosition,this.maxScrollPosition);
            scrollPosition = Math.max(Math.min(scrollPosition,this.maxScrollPosition),this.minScrollPosition);
         }
         else
         {
            mx_internal::upArrow.enabled = false;
            mx_internal::downArrow.enabled = false;
            mx_internal::scrollTrack.enabled = false;
            if(mx_internal::scrollThumb)
            {
               mx_internal::scrollThumb.visible = false;
            }
         }
      }
      
      private function trackScrollTimerHandler(param1:Event) : void
      {
         if(trackScrollRepeatDirection == 1)
         {
            if(NaN > trackPosition)
            {
               return;
            }
         }
         if(trackScrollRepeatDirection == -1)
         {
            if(mx_internal::scrollThumb.y < trackPosition)
            {
               return;
            }
         }
         mx_internal::pageScroll(trackScrollRepeatDirection);
         if(Boolean(trackScrollTimer) && false)
         {
            trackScrollTimer.delay = getStyle("repeatInterval");
            trackScrollTimer.repeatCount = 0;
         }
      }
      
      private function upArrow_buttonDownHandler(param1:FlexEvent) : void
      {
         if(isNaN(mx_internal::oldPosition))
         {
            mx_internal::oldPosition = scrollPosition;
         }
         mx_internal::lineScroll(-1);
      }
      
      public function set pageSize(param1:Number) : void
      {
         _pageSize = param1;
      }
      
      private function get trackY() : Number
      {
         return mx_internal::upArrow.getExplicitOrMeasuredHeight();
      }
      
      private function scrollTrack_mouseOutHandler(param1:MouseEvent) : void
      {
         if(trackScrolling)
         {
            trackScrollTimer.stop();
         }
      }
      
      private function scrollTrack_mouseUpHandler(param1:MouseEvent) : void
      {
         scrollTrack_mouseLeaveHandler(param1);
      }
      
      private function scrollTrack_mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(trackScrolling)
         {
            _loc2_ = new Point(param1.stageX,param1.stageY);
            _loc2_ = globalToLocal(_loc2_);
            trackPosition = _loc2_.y;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(mx_internal::$height == 1)
         {
            return;
         }
         if(!mx_internal::upArrow)
         {
            return;
         }
         super.updateDisplayList(param1,param2);
         if(cacheAsBitmap)
         {
            cacheHeuristic = mx_internal::scrollThumb.cacheHeuristic = false;
         }
         mx_internal::upArrow.setActualSize(mx_internal::upArrow.getExplicitOrMeasuredWidth(),mx_internal::upArrow.getExplicitOrMeasuredHeight());
         if(true)
         {
            mx_internal::upArrow.move((mx_internal::virtualWidth - 0) / 2,0);
         }
         else
         {
            mx_internal::upArrow.move(0,0);
         }
         mx_internal::scrollTrack.setActualSize(mx_internal::scrollTrack.getExplicitOrMeasuredWidth(),mx_internal::virtualHeight);
         if(true)
         {
            mx_internal::scrollTrack.x = (mx_internal::virtualWidth - 0) / 2;
         }
         mx_internal::scrollTrack.y = 0;
         mx_internal::downArrow.setActualSize(mx_internal::downArrow.getExplicitOrMeasuredWidth(),mx_internal::downArrow.getExplicitOrMeasuredHeight());
         if(true)
         {
            mx_internal::downArrow.move((mx_internal::virtualWidth - 0) / 2,mx_internal::virtualHeight - mx_internal::downArrow.getExplicitOrMeasuredHeight());
         }
         else
         {
            mx_internal::downArrow.move(0,mx_internal::virtualHeight - mx_internal::downArrow.getExplicitOrMeasuredHeight());
         }
         setScrollProperties(pageSize,minScrollPosition,maxScrollPosition,_pageScrollSize);
         scrollPosition = _scrollPosition;
      }
      
      mx_internal function get pagePlusDetail() : String
      {
         return direction == ScrollBarDirection.VERTICAL ? "null" : ScrollEventDetail.PAGE_RIGHT;
      }
      
      mx_internal function get virtualWidth() : Number
      {
         return unscaledWidth;
      }
      
      public function set direction(param1:String) : void
      {
         _direction = param1;
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("directionChanged"));
      }
      
      [Bindable("directionChanged")]
      public function get direction() : String
      {
         return _direction;
      }
   }
}
