package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.display.Loader;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   import flash.utils.getDefinitionByName;
   import mx.binding.BindingManager;
   import mx.controls.HScrollBar;
   import mx.controls.VScrollBar;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.controls.scrollClasses.ScrollBar;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.ScrollEvent;
   import mx.events.ScrollEventDetail;
   import mx.events.ScrollEventDirection;
   import mx.graphics.RoundedRectangle;
   import mx.managers.IFocusManager;
   import mx.managers.IFocusManagerContainer;
   import mx.managers.ILayoutManagerClient;
   import mx.managers.ISystemManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   import mx.styles.StyleProtoChain;
   
   public class Container extends UIComponent implements IContainer, IDataRenderer, IFocusManagerContainer, IListItemRenderer, IRawChildrenContainer
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const MULTIPLE_PROPERTIES:String = "<MULTIPLE>";
       
      
      private var forceLayout:Boolean = false;
      
      private var _numChildrenCreated:int = -1;
      
      private var _horizontalLineScrollSize:Number = 5;
      
      mx_internal var border:mx.core.IFlexDisplayObject;
      
      protected var actualCreationPolicy:String;
      
      private var _viewMetricsAndPadding:mx.core.EdgeMetrics;
      
      private var _creatingContentPane:Boolean = false;
      
      private var _childRepeaters:Array;
      
      private var scrollableWidth:Number = 0;
      
      private var _childDescriptors:Array;
      
      private var _rawChildren:mx.core.ContainerRawChildrenList;
      
      private var _data:Object;
      
      private var _verticalPageScrollSize:Number = 0;
      
      private var _viewMetrics:mx.core.EdgeMetrics;
      
      private var _verticalScrollBar:ScrollBar;
      
      private var scrollPropertiesChanged:Boolean = false;
      
      private var changedStyles:String = null;
      
      private var scrollPositionChanged:Boolean = true;
      
      private var _defaultButton:mx.core.IFlexDisplayObject;
      
      private var mouseEventReferenceCount:int = 0;
      
      private var _focusPane:Sprite;
      
      protected var whiteBox:Shape;
      
      private var _forceClippingCount:int;
      
      private var _horizontalPageScrollSize:Number = 0;
      
      private var _creationPolicy:String;
      
      private var _creationIndex:int = -1;
      
      private var _clipContent:Boolean = true;
      
      private var _verticalScrollPosition:Number = 0;
      
      private var _autoLayout:Boolean = true;
      
      private var _icon:Class = null;
      
      mx_internal var doingLayout:Boolean = false;
      
      private var _horizontalScrollBar:ScrollBar;
      
      private var numChildrenBefore:int;
      
      private var viewableHeight:Number = 0;
      
      private var viewableWidth:Number = 0;
      
      mx_internal var contentPane:Sprite = null;
      
      private var _createdComponents:Array;
      
      private var _firstChildIndex:int = 0;
      
      private var scrollableHeight:Number = 0;
      
      private var _verticalLineScrollSize:Number = 5;
      
      private var _horizontalScrollPosition:Number = 0;
      
      mx_internal var _horizontalScrollPolicy:String = "auto";
      
      private var verticalScrollPositionPending:Number;
      
      mx_internal var _verticalScrollPolicy:String = "auto";
      
      private var horizontalScrollPositionPending:Number;
      
      mx_internal var _numChildren:int = 0;
      
      private var recursionFlag:Boolean = true;
      
      private var _label:String = "";
      
      mx_internal var blocker:Sprite;
      
      public function Container()
      {
         super();
         tabChildren = true;
         tabEnabled = false;
         showInAutomationHierarchy = false;
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         if(mx_internal::_verticalScrollPolicy != param1)
         {
            mx_internal::_verticalScrollPolicy = param1;
            invalidateDisplayList();
            dispatchEvent(new Event("verticalScrollPolicyChanged"));
         }
      }
      
      private function createContentPaneAndScrollbarsIfNeeded() : Boolean
      {
         var _loc1_:Rectangle = null;
         var _loc2_:Boolean = false;
         if(_clipContent)
         {
            _loc1_ = mx_internal::getScrollableRect();
            _loc2_ = createScrollbarsIfNeeded(_loc1_);
            if(mx_internal::border)
            {
               updateBackgroundImageRect();
            }
            return _loc2_;
         }
         _loc2_ = createOrDestroyScrollbars(false,false,false);
         _loc1_ = mx_internal::getScrollableRect();
         scrollableWidth = _loc1_.right;
         scrollableHeight = _loc1_.bottom;
         if(_loc2_ && Boolean(mx_internal::border))
         {
            updateBackgroundImageRect();
         }
         return _loc2_;
      }
      
      override protected function initializationComplete() : void
      {
      }
      
      mx_internal function rawChildren_getObjectsUnderPoint(param1:Point) : Array
      {
         return super.getObjectsUnderPoint(param1);
      }
      
      public function set creatingContentPane(param1:Boolean) : void
      {
         _creatingContentPane = param1;
      }
      
      public function set clipContent(param1:Boolean) : void
      {
         if(_clipContent != param1)
         {
            _clipContent = param1;
            invalidateDisplayList();
         }
      }
      
      protected function scrollChildren() : void
      {
         if(!mx_internal::contentPane)
         {
            return;
         }
         var _loc1_:mx.core.EdgeMetrics = viewMetrics;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = unscaledWidth - _loc1_.left - _loc1_.right;
         var _loc5_:Number = unscaledHeight - _loc1_.top - _loc1_.bottom;
         if(_clipContent)
         {
            _loc2_ += _horizontalScrollPosition;
            if(horizontalScrollBar)
            {
               _loc4_ = viewableWidth;
            }
            _loc3_ += _verticalScrollPosition;
            if(verticalScrollBar)
            {
               _loc5_ = viewableHeight;
            }
         }
         else
         {
            _loc4_ = scrollableWidth;
            _loc5_ = scrollableHeight;
         }
         var _loc6_:Rectangle = mx_internal::getScrollableRect();
         if(_loc2_ == 0 && _loc3_ == 0 && _loc4_ >= _loc6_.right && _loc5_ >= _loc6_.bottom && _loc6_.left >= 0 && _loc6_.top >= 0 && _forceClippingCount <= 0)
         {
            mx_internal::contentPane.scrollRect = null;
            mx_internal::contentPane.opaqueBackground = null;
            mx_internal::contentPane.cacheAsBitmap = false;
         }
         else
         {
            mx_internal::contentPane.scrollRect = new Rectangle(_loc2_,_loc3_,_loc4_,_loc5_);
         }
         if(focusPane)
         {
            focusPane.scrollRect = mx_internal::contentPane.scrollRect;
         }
         if(mx_internal::border && mx_internal::border is IRectangularBorder && IRectangularBorder(mx_internal::border).hasBackgroundImage)
         {
            IRectangularBorder(mx_internal::border).layoutBackgroundImage();
         }
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:InteractiveObject = null;
         super.doubleClickEnabled = param1;
         if(mx_internal::contentPane)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = mx_internal::contentPane.getChildAt(_loc3_) as InteractiveObject)
               {
                  _loc4_.doubleClickEnabled = param1;
               }
               _loc3_++;
            }
         }
      }
      
      override public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         var _loc5_:ISimpleStyleClient = null;
         var _loc3_:int = super.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(mx_internal::contentPane || _loc4_ < _firstChildIndex || _loc4_ >= _firstChildIndex + mx_internal::_numChildren)
            {
               if(_loc5_ = super.getChildAt(_loc4_) as ISimpleStyleClient)
               {
                  _loc5_.styleChanged(param1);
                  if(_loc5_ is IStyleClient)
                  {
                     IStyleClient(_loc5_).notifyStyleChangeInChildren(param1,param2);
                  }
               }
            }
            _loc4_++;
         }
         if(param2)
         {
            changedStyles = changedStyles != null || param1 == null ? MULTIPLE_PROPERTIES : param1;
            invalidateProperties();
         }
      }
      
      mx_internal function get createdComponents() : Array
      {
         return _createdComponents;
      }
      
      public function get childDescriptors() : Array
      {
         return _childDescriptors;
      }
      
      override public function get contentMouseY() : Number
      {
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.mouseY;
         }
         return super.contentMouseY;
      }
      
      mx_internal function get childRepeaters() : Array
      {
         return _childRepeaters;
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.contains(param1);
         }
         return super.contains(param1);
      }
      
      override public function get contentMouseX() : Number
      {
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.mouseX;
         }
         return super.contentMouseX;
      }
      
      mx_internal function set createdComponents(param1:Array) : void
      {
         _createdComponents = param1;
      }
      
      public function get horizontalScrollBar() : ScrollBar
      {
         return _horizontalScrollBar;
      }
      
      override public function validateSize(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         if(autoLayout == false && forceLayout == false)
         {
            if(param1)
            {
               _loc2_ = super.numChildren;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if((_loc4_ = super.getChildAt(_loc3_)) is ILayoutManagerClient)
                  {
                     ILayoutManagerClient(_loc4_).validateSize(true);
                  }
                  _loc3_++;
               }
            }
            mx_internal::adjustSizesForScaleChanges();
         }
         else
         {
            super.validateSize(param1);
         }
      }
      
      public function get rawChildren() : IChildList
      {
         if(!_rawChildren)
         {
            _rawChildren = new mx.core.ContainerRawChildrenList(this);
         }
         return _rawChildren;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.getChildAt(param1);
         }
         return super.getChildAt(_firstChildIndex + param1);
      }
      
      override protected function attachOverlay() : void
      {
         mx_internal::rawChildren_addChild(mx_internal::overlay);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == MouseEvent.CLICK || param1 == MouseEvent.DOUBLE_CLICK || param1 == MouseEvent.MOUSE_DOWN || param1 == MouseEvent.MOUSE_MOVE || param1 == MouseEvent.MOUSE_OVER || param1 == MouseEvent.MOUSE_OUT || param1 == MouseEvent.MOUSE_UP || param1 == MouseEvent.MOUSE_WHEEL)
         {
            if(mouseEventReferenceCount < 2147483647 && mouseEventReferenceCount++ == 0)
            {
               setStyle("mouseShield",true);
               setStyle("mouseShieldChildren",true);
            }
         }
      }
      
      override public function localToContent(param1:Point) : Point
      {
         if(!mx_internal::contentPane)
         {
            return param1;
         }
         param1 = localToGlobal(param1);
         return globalToContent(param1);
      }
      
      public function executeChildBindings(param1:Boolean) : void
      {
         var _loc4_:IUIComponent = null;
         var _loc2_:int = numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = IUIComponent(getChildAt(_loc3_))) is IDeferredInstantiationUIComponent)
            {
               IDeferredInstantiationUIComponent(_loc4_).executeBindings(param1);
            }
            _loc3_++;
         }
      }
      
      protected function createBorder() : void
      {
         var _loc1_:Class = null;
         if(!mx_internal::border && isBorderNeeded())
         {
            _loc1_ = getStyle("borderSkin");
            if(_loc1_ != null)
            {
               mx_internal::border = new _loc1_();
               mx_internal::border.name = "border";
               if(mx_internal::border is IUIComponent)
               {
                  IUIComponent(mx_internal::border).enabled = enabled;
               }
               if(mx_internal::border is ISimpleStyleClient)
               {
                  ISimpleStyleClient(mx_internal::border).styleName = this;
               }
               rawChildren.addChildAt(DisplayObject(mx_internal::border),0);
               invalidateDisplayList();
            }
         }
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      public function get verticalScrollPosition() : Number
      {
         if(!isNaN(verticalScrollPositionPending))
         {
            return verticalScrollPositionPending;
         }
         return _verticalScrollPosition;
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      public function get horizontalScrollPosition() : Number
      {
         if(!isNaN(horizontalScrollPositionPending))
         {
            return horizontalScrollPositionPending;
         }
         return _horizontalScrollPosition;
      }
      
      protected function layoutChrome(param1:Number, param2:Number) : void
      {
         if(mx_internal::border)
         {
            updateBackgroundImageRect();
            mx_internal::border.move(0,0);
            mx_internal::border.setActualSize(param1,param2);
         }
      }
      
      mx_internal function set childRepeaters(param1:Array) : void
      {
         _childRepeaters = param1;
      }
      
      override public function get focusPane() : Sprite
      {
         return _focusPane;
      }
      
      public function set creationIndex(param1:int) : void
      {
         _creationIndex = param1;
      }
      
      public function get viewMetrics() : mx.core.EdgeMetrics
      {
         var _loc1_:mx.core.EdgeMetrics = borderMetrics;
         var _loc2_:Boolean = verticalScrollBar != null && (mx_internal::doingLayout || verticalScrollPolicy == ScrollPolicy.ON);
         var _loc3_:Boolean = horizontalScrollBar != null && (mx_internal::doingLayout || horizontalScrollPolicy == ScrollPolicy.ON);
         if(!_loc2_ && !_loc3_)
         {
            return _loc1_;
         }
         if(!_viewMetrics)
         {
            _viewMetrics = _loc1_.clone();
         }
         else
         {
            _viewMetrics.left = _loc1_.left;
            _viewMetrics.right = _loc1_.right;
            _viewMetrics.top = _loc1_.top;
            _viewMetrics.bottom = _loc1_.bottom;
         }
         if(_loc2_)
         {
            _viewMetrics.right = NaN;
         }
         if(_loc3_)
         {
            _viewMetrics.bottom = NaN;
         }
         return _viewMetrics;
      }
      
      public function set verticalScrollBar(param1:ScrollBar) : void
      {
         _verticalScrollBar = param1;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(_verticalScrollPosition == param1)
         {
            return;
         }
         _verticalScrollPosition = param1;
         scrollPositionChanged = true;
         if(!initialized)
         {
            verticalScrollPositionPending = param1;
         }
         invalidateDisplayList();
         dispatchEvent(new Event("viewChanged"));
      }
      
      mx_internal function $addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      private function createOrDestroyScrollbars(param1:Boolean, param2:Boolean, param3:Boolean) : Boolean
      {
         var _loc5_:IFocusManager = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Graphics = null;
         var _loc4_:Boolean = false;
         if(param1 || param2 || param3)
         {
            mx_internal::createContentPane();
         }
         if(param1)
         {
            if(!horizontalScrollBar)
            {
               horizontalScrollBar = new HScrollBar();
               horizontalScrollBar.name = "horizontalScrollBar";
               if((Boolean(_loc6_ = getStyle("horizontalScrollBarStyleName"))) && horizontalScrollBar is ISimpleStyleClient)
               {
                  ISimpleStyleClient(horizontalScrollBar).styleName = _loc6_;
               }
               rawChildren.addChild(DisplayObject(horizontalScrollBar));
               horizontalScrollBar.lineScrollSize = horizontalLineScrollSize;
               horizontalScrollBar.pageScrollSize = horizontalPageScrollSize;
               horizontalScrollBar.addEventListener(ScrollEvent.SCROLL,horizontalScrollBar_scrollHandler);
               horizontalScrollBar.enabled = enabled;
               if(horizontalScrollBar is IInvalidating)
               {
                  IInvalidating(horizontalScrollBar).validateNow();
               }
               invalidateDisplayList();
               mx_internal::invalidateViewMetricsAndPadding();
               _loc4_ = true;
               if(!verticalScrollBar)
               {
                  addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
               }
            }
         }
         else if(horizontalScrollBar)
         {
            horizontalScrollBar.removeEventListener(ScrollEvent.SCROLL,horizontalScrollBar_scrollHandler);
            rawChildren.removeChild(DisplayObject(horizontalScrollBar));
            horizontalScrollBar = null;
            viewableWidth = scrollableWidth = 0;
            if(_horizontalScrollPosition != 0)
            {
               _horizontalScrollPosition = 0;
               scrollPositionChanged = true;
            }
            invalidateDisplayList();
            mx_internal::invalidateViewMetricsAndPadding();
            _loc4_ = true;
            _loc5_ = focusManager;
            if(!verticalScrollBar && (!_loc5_ || _loc5_.getFocus() != this))
            {
               removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
            }
         }
         if(param2)
         {
            if(!verticalScrollBar)
            {
               verticalScrollBar = new VScrollBar();
               verticalScrollBar.name = "verticalScrollBar";
               if((Boolean(_loc7_ = getStyle("verticalScrollBarStyleName"))) && verticalScrollBar is ISimpleStyleClient)
               {
                  ISimpleStyleClient(verticalScrollBar).styleName = _loc7_;
               }
               rawChildren.addChild(DisplayObject(verticalScrollBar));
               verticalScrollBar.lineScrollSize = verticalLineScrollSize;
               verticalScrollBar.pageScrollSize = verticalPageScrollSize;
               verticalScrollBar.addEventListener(ScrollEvent.SCROLL,verticalScrollBar_scrollHandler);
               verticalScrollBar.enabled = enabled;
               if(verticalScrollBar is IInvalidating)
               {
                  IInvalidating(verticalScrollBar).validateNow();
               }
               invalidateDisplayList();
               mx_internal::invalidateViewMetricsAndPadding();
               _loc4_ = true;
               if(!horizontalScrollBar)
               {
                  addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
               }
               addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
            }
         }
         else if(verticalScrollBar)
         {
            verticalScrollBar.removeEventListener(ScrollEvent.SCROLL,verticalScrollBar_scrollHandler);
            rawChildren.removeChild(DisplayObject(verticalScrollBar));
            verticalScrollBar = null;
            viewableHeight = scrollableHeight = 0;
            if(_verticalScrollPosition != 0)
            {
               _verticalScrollPosition = 0;
               scrollPositionChanged = true;
            }
            invalidateDisplayList();
            mx_internal::invalidateViewMetricsAndPadding();
            _loc4_ = true;
            _loc5_ = focusManager;
            if(!horizontalScrollBar && (!_loc5_ || _loc5_.getFocus() != this))
            {
               removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
            }
            removeEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
         }
         if(Boolean(horizontalScrollBar) && Boolean(verticalScrollBar))
         {
            if(!whiteBox)
            {
               whiteBox = new FlexShape();
               whiteBox.name = "whiteBox";
               (_loc8_ = whiteBox.graphics).beginFill(16777215);
               _loc8_.drawRect(0,0,verticalScrollBar.minWidth,horizontalScrollBar.minHeight);
               _loc8_.endFill();
               rawChildren.addChild(whiteBox);
            }
         }
         else if(whiteBox)
         {
            rawChildren.removeChild(whiteBox);
            whiteBox = null;
         }
         return _loc4_;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc2_:Object = getFocus();
         if(_loc2_ is TextField)
         {
            return;
         }
         if(verticalScrollBar)
         {
            _loc3_ = "null";
            _loc4_ = verticalScrollPosition;
            switch(param1.keyCode)
            {
               case Keyboard.DOWN:
                  verticalScrollPosition += verticalLineScrollSize;
                  dispatchScrollEvent(_loc3_,_loc4_,verticalScrollPosition,ScrollEventDetail.LINE_DOWN);
                  param1.stopPropagation();
                  break;
               case Keyboard.UP:
                  verticalScrollPosition -= verticalLineScrollSize;
                  dispatchScrollEvent(_loc3_,_loc4_,verticalScrollPosition,ScrollEventDetail.LINE_UP);
                  param1.stopPropagation();
                  break;
               case Keyboard.PAGE_UP:
                  verticalScrollPosition -= verticalPageScrollSize;
                  dispatchScrollEvent(_loc3_,_loc4_,verticalScrollPosition,ScrollEventDetail.PAGE_UP);
                  param1.stopPropagation();
                  break;
               case Keyboard.PAGE_DOWN:
                  verticalScrollPosition += verticalPageScrollSize;
                  dispatchScrollEvent(_loc3_,_loc4_,verticalScrollPosition,ScrollEventDetail.PAGE_DOWN);
                  param1.stopPropagation();
                  break;
               case Keyboard.HOME:
                  verticalScrollPosition = verticalScrollBar.minScrollPosition;
                  dispatchScrollEvent(_loc3_,_loc4_,verticalScrollPosition,ScrollEventDetail.AT_TOP);
                  param1.stopPropagation();
                  break;
               case Keyboard.END:
                  verticalScrollPosition = verticalScrollBar.maxScrollPosition;
                  dispatchScrollEvent(_loc3_,_loc4_,verticalScrollPosition,ScrollEventDetail.AT_BOTTOM);
                  param1.stopPropagation();
            }
         }
         if(horizontalScrollBar)
         {
            _loc3_ = "null";
            _loc4_ = horizontalScrollPosition;
            switch(param1.keyCode)
            {
               case Keyboard.LEFT:
                  horizontalScrollPosition -= horizontalLineScrollSize;
                  dispatchScrollEvent(_loc3_,_loc4_,horizontalScrollPosition,ScrollEventDetail.LINE_LEFT);
                  param1.stopPropagation();
                  break;
               case Keyboard.RIGHT:
                  horizontalScrollPosition += horizontalLineScrollSize;
                  dispatchScrollEvent(_loc3_,_loc4_,horizontalScrollPosition,ScrollEventDetail.LINE_RIGHT);
                  param1.stopPropagation();
            }
         }
      }
      
      [Bindable("iconChanged")]
      public function get icon() : Class
      {
         return _icon;
      }
      
      private function createOrDestroyBlocker() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:ISystemManager = null;
         if(enabled)
         {
            if(mx_internal::blocker)
            {
               rawChildren.removeChild(mx_internal::blocker);
               mx_internal::blocker = null;
            }
         }
         else if(!mx_internal::blocker)
         {
            mx_internal::blocker = new FlexSprite();
            mx_internal::blocker.name = "blocker";
            mx_internal::blocker.mouseEnabled = true;
            rawChildren.addChild(mx_internal::blocker);
            mx_internal::blocker.addEventListener(MouseEvent.CLICK,blocker_clickHandler);
            _loc1_ = !!focusManager ? DisplayObject(focusManager.getFocus()) : null;
            while(_loc1_)
            {
               if(_loc1_ == this)
               {
                  _loc2_ = systemManager;
                  if(Boolean(_loc2_) && Boolean(_loc2_.stage))
                  {
                     _loc2_.stage.focus = null;
                  }
                  break;
               }
               _loc1_ = _loc1_.parent;
            }
         }
      }
      
      private function horizontalScrollBar_scrollHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         if(param1 is ScrollEvent)
         {
            _loc2_ = horizontalScrollPosition;
            horizontalScrollPosition = horizontalScrollBar.scrollPosition;
            dispatchScrollEvent(ScrollEventDirection.HORIZONTAL,_loc2_,horizontalScrollPosition,ScrollEvent(param1).detail);
         }
      }
      
      public function createComponentFromDescriptor(param1:ComponentDescriptor, param2:Boolean) : mx.core.IFlexDisplayObject
      {
         var _loc7_:String = null;
         var _loc10_:IRepeaterClient = null;
         var _loc11_:IStyleClient = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc3_:UIComponentDescriptor = UIComponentDescriptor(param1);
         var _loc4_:Object = _loc3_.properties;
         if((numChildrenBefore != 0 || mx_internal::numChildrenCreated != -1) && _loc3_.mx_internal::instanceIndices == null && hasChildMatchingDescriptor(_loc3_))
         {
            return null;
         }
         UIComponentGlobals.mx_internal::layoutManager.usePhasedInstantiation = true;
         var _loc6_:IDeferredInstantiationUIComponent;
         var _loc5_:Class;
         (_loc6_ = new (_loc5_ = _loc3_.type)()).id = _loc3_.id;
         if(Boolean(_loc6_.id) && _loc6_.id != "")
         {
            _loc6_.name = _loc6_.id;
         }
         _loc6_.descriptor = _loc3_;
         if(Boolean(_loc4_.childDescriptors) && _loc6_ is Container)
         {
            Container(_loc6_)._childDescriptors = _loc4_.childDescriptors;
            delete _loc4_.childDescriptors;
         }
         for(_loc7_ in _loc4_)
         {
            _loc6_[_loc7_] = _loc4_[_loc7_];
         }
         if(_loc6_ is Container)
         {
            Container(_loc6_).recursionFlag = param2;
         }
         if(_loc3_.mx_internal::instanceIndices)
         {
            if(_loc6_ is IRepeaterClient)
            {
               (_loc10_ = IRepeaterClient(_loc6_)).instanceIndices = _loc3_.mx_internal::instanceIndices;
               _loc10_.repeaters = _loc3_.mx_internal::repeaters;
               _loc10_.repeaterIndices = _loc3_.mx_internal::repeaterIndices;
            }
         }
         if(_loc6_ is IStyleClient)
         {
            _loc11_ = IStyleClient(_loc6_);
            if(_loc3_.stylesFactory != null)
            {
               if(!_loc11_.styleDeclaration)
               {
                  _loc11_.styleDeclaration = new CSSStyleDeclaration();
               }
               _loc11_.styleDeclaration.factory = _loc3_.stylesFactory;
            }
         }
         var _loc8_:Object;
         if(_loc8_ = _loc3_.events)
         {
            for(_loc12_ in _loc8_)
            {
               _loc13_ = String(_loc8_[_loc12_]);
               _loc6_.addEventListener(_loc12_,_loc3_.document[_loc13_]);
            }
         }
         var _loc9_:Array;
         if(_loc9_ = _loc3_.effects)
         {
            _loc6_.registerEffects(_loc9_);
         }
         if(_loc6_ is IRepeaterClient)
         {
            IRepeaterClient(_loc6_).initializeRepeaterArrays(this);
         }
         _loc6_.createReferenceOnParentDocument(IFlexDisplayObject(_loc3_.document));
         if(!_loc6_.document)
         {
            _loc6_.document = _loc3_.document;
         }
         if(_loc6_ is IRepeater)
         {
            if(!mx_internal::childRepeaters)
            {
               mx_internal::childRepeaters = [];
            }
            mx_internal::childRepeaters.push(_loc6_);
            _loc6_.executeBindings();
            IRepeater(_loc6_).initializeRepeater(this,param2);
         }
         else
         {
            addChild(DisplayObject(_loc6_));
            _loc6_.executeBindings();
            if(creationPolicy == ContainerCreationPolicy.QUEUED || creationPolicy == ContainerCreationPolicy.NONE)
            {
               _loc6_.addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
            }
         }
         return _loc6_;
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
         invalidateProperties();
      }
      
      public function set horizontalScrollBar(param1:ScrollBar) : void
      {
         _horizontalScrollBar = param1;
      }
      
      mx_internal function get usePadding() : Boolean
      {
         return true;
      }
      
      override public function get baselinePosition() : Number
      {
         var _loc2_:IUIComponent = null;
         if(false)
         {
            if(getStyle("verticalAlign") == "top" && numChildren > 0)
            {
               _loc2_ = getChildAt(0) as IUIComponent;
               if(_loc2_)
               {
                  return _loc2_.y + _loc2_.baselinePosition;
               }
            }
            return super.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         var _loc1_:TextLineMetrics = measureText("Wj");
         if(height < 4 + _loc1_.ascent)
         {
            return int(height + (_loc1_.ascent - height) / 2);
         }
         return NaN + _loc1_.ascent;
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.getChildByName(param1);
         }
         _loc2_ = super.getChildByName(param1);
         if(!_loc2_)
         {
            return null;
         }
         _loc3_ = super.getChildIndex(_loc2_) - _firstChildIndex;
         if(_loc3_ < 0 || _loc3_ >= mx_internal::_numChildren)
         {
            return null;
         }
         return _loc2_;
      }
      
      [Bindable("verticalLineScrollSizeChanged")]
      public function get verticalLineScrollSize() : Number
      {
         return _verticalLineScrollSize;
      }
      
      [Bindable("horizontalScrollPolicyChanged")]
      public function get horizontalScrollPolicy() : String
      {
         return mx_internal::_horizontalScrollPolicy;
      }
      
      mx_internal function $removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
      }
      
      public function get maxVerticalScrollPosition() : Number
      {
         return !!verticalScrollBar ? 0 : Math.max(scrollableHeight - viewableHeight,0);
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(_horizontalScrollPosition == param1)
         {
            return;
         }
         _horizontalScrollPosition = param1;
         scrollPositionChanged = true;
         if(!initialized)
         {
            horizontalScrollPositionPending = param1;
         }
         invalidateDisplayList();
         dispatchEvent(new Event("viewChanged"));
      }
      
      mx_internal function invalidateViewMetricsAndPadding() : void
      {
         _viewMetricsAndPadding = null;
      }
      
      [Bindable("horizontalLineScrollSizeChanged")]
      public function get horizontalLineScrollSize() : Number
      {
         return _horizontalLineScrollSize;
      }
      
      override public function set focusPane(param1:Sprite) : void
      {
         var _loc2_:Boolean = Boolean(mx_internal::invalidateSizeFlag);
         var _loc3_:Boolean = Boolean(mx_internal::invalidateDisplayListFlag);
         mx_internal::invalidateSizeFlag = true;
         mx_internal::invalidateDisplayListFlag = true;
         if(param1)
         {
            rawChildren.addChild(param1);
            param1.x = 0;
            param1.y = 0;
            param1.scrollRect = null;
            _focusPane = param1;
         }
         else
         {
            rawChildren.removeChild(_focusPane);
            _focusPane = null;
         }
         if(Boolean(param1) && Boolean(mx_internal::contentPane))
         {
            param1.x = mx_internal::contentPane.x;
            param1.y = mx_internal::contentPane.y;
            param1.scrollRect = mx_internal::contentPane.scrollRect;
         }
         mx_internal::invalidateSizeFlag = _loc2_;
         mx_internal::invalidateDisplayListFlag = _loc3_;
      }
      
      private function updateBackgroundImageRect() : void
      {
         var _loc1_:IRectangularBorder = mx_internal::border as IRectangularBorder;
         if(!_loc1_)
         {
            return;
         }
         if(viewableWidth == 0 && viewableHeight == 0)
         {
            _loc1_.backgroundImageBounds = null;
            return;
         }
         var _loc2_:mx.core.EdgeMetrics = viewMetrics;
         var _loc3_:Number = !!viewableWidth ? viewableWidth : unscaledWidth - _loc2_.left - _loc2_.right;
         var _loc4_:Number = !!viewableHeight ? viewableHeight : unscaledHeight - _loc2_.top - _loc2_.bottom;
         if(getStyle("backgroundAttachment") == "fixed")
         {
            _loc1_.backgroundImageBounds = new Rectangle(_loc2_.left,_loc2_.top,_loc3_,_loc4_);
         }
         else
         {
            _loc1_.backgroundImageBounds = new Rectangle(_loc2_.left,_loc2_.top,Math.max(scrollableWidth,_loc3_),Math.max(scrollableHeight,_loc4_));
         }
      }
      
      private function blocker_clickHandler(param1:Event) : void
      {
         param1.stopPropagation();
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(verticalScrollBar)
         {
            param1.stopPropagation();
            _loc2_ = param1.delta <= 0 ? 1 : -1;
            _loc3_ = !!verticalScrollBar ? 0 : 1;
            _loc4_ = Math.max(Math.abs(param1.delta),_loc3_);
            _loc5_ = verticalScrollPosition;
            verticalScrollPosition += 3 * _loc4_ * _loc2_;
            dispatchScrollEvent(ScrollEventDirection.VERTICAL,_loc5_,verticalScrollPosition,param1.delta <= 0 ? "null" : ScrollEventDetail.LINE_DOWN);
         }
      }
      
      public function get defaultButton() : mx.core.IFlexDisplayObject
      {
         return _defaultButton;
      }
      
      mx_internal function createContentPane() : void
      {
         var _loc3_:int = 0;
         var _loc5_:IUIComponent = null;
         if(mx_internal::contentPane)
         {
            return;
         }
         creatingContentPane = true;
         var _loc1_:int = numChildren;
         var _loc2_:Sprite = new FlexSprite();
         _loc2_.name = "contentPane";
         _loc2_.tabChildren = true;
         if(mx_internal::border)
         {
            _loc3_ = rawChildren.getChildIndex(DisplayObject(mx_internal::border)) + 1;
            if(mx_internal::border is IRectangularBorder && IRectangularBorder(mx_internal::border).hasBackgroundImage)
            {
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
         }
         rawChildren.addChildAt(_loc2_,_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc5_ = IUIComponent(super.getChildAt(_firstChildIndex));
            _loc2_.addChild(DisplayObject(_loc5_));
            _loc5_.parentChanged(_loc2_);
            --mx_internal::_numChildren;
            _loc4_++;
         }
         mx_internal::contentPane = _loc2_;
         creatingContentPane = false;
         mx_internal::contentPane.visible = true;
      }
      
      public function set verticalPageScrollSize(param1:Number) : void
      {
         scrollPropertiesChanged = true;
         _verticalPageScrollSize = param1;
         invalidateDisplayList();
         dispatchEvent(new Event("verticalPageScrollSizeChanged"));
      }
      
      mx_internal function setDocumentDescriptor(param1:UIComponentDescriptor) : void
      {
         var _loc2_:String = null;
         if(processedDescriptors)
         {
            return;
         }
         if(Boolean(mx_internal::_documentDescriptor) && Boolean(mx_internal::_documentDescriptor.properties.childDescriptors))
         {
            if(param1.properties.childDescriptors)
            {
               _loc2_ = String(resourceManager.getString("core","multipleChildSets_ClassAndSubclass"));
               throw new Error(_loc2_);
            }
         }
         else
         {
            mx_internal::_documentDescriptor = param1;
            mx_internal::_documentDescriptor.document = this;
         }
      }
      
      private function verticalScrollBar_scrollHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         if(param1 is ScrollEvent)
         {
            _loc2_ = verticalScrollPosition;
            verticalScrollPosition = verticalScrollBar.scrollPosition;
            dispatchScrollEvent(ScrollEventDirection.VERTICAL,_loc2_,verticalScrollPosition,ScrollEvent(param1).detail);
         }
      }
      
      public function get creationPolicy() : String
      {
         return _creationPolicy;
      }
      
      public function set icon(param1:Class) : void
      {
         _icon = param1;
         dispatchEvent(new Event("iconChanged"));
      }
      
      private function dispatchScrollEvent(param1:String, param2:Number, param3:Number, param4:String) : void
      {
         var _loc5_:ScrollEvent;
         (_loc5_ = new ScrollEvent(ScrollEvent.SCROLL)).direction = param1;
         _loc5_.position = param3;
         _loc5_.delta = param3 - param2;
         _loc5_.detail = param4;
         dispatchEvent(_loc5_);
      }
      
      [Bindable("labelChanged")]
      public function get label() : String
      {
         return _label;
      }
      
      [Bindable("verticalScrollPolicyChanged")]
      public function get verticalScrollPolicy() : String
      {
         return mx_internal::_verticalScrollPolicy;
      }
      
      public function get borderMetrics() : mx.core.EdgeMetrics
      {
         return Boolean(mx_internal::border) && mx_internal::border is IRectangularBorder ? IRectangularBorder(mx_internal::border).borderMetrics : mx.core.EdgeMetrics.EMPTY;
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         --mx_internal::numChildrenCreated;
         if(mx_internal::numChildrenCreated <= 0)
         {
            dispatchEvent(new FlexEvent("childrenCreationComplete"));
         }
      }
      
      override public function contentToLocal(param1:Point) : Point
      {
         if(!mx_internal::contentPane)
         {
            return param1;
         }
         param1 = contentToGlobal(param1);
         return globalToLocal(param1);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 is IDeferredInstantiationUIComponent && Boolean(IDeferredInstantiationUIComponent(param1).descriptor))
         {
            if(mx_internal::createdComponents)
            {
               _loc2_ = 0;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if(mx_internal::createdComponents[_loc3_] === param1)
                  {
                     mx_internal::createdComponents.splice(_loc3_,1);
                  }
                  _loc3_++;
               }
            }
         }
         mx_internal::removingChild(param1);
         if(param1 is UIComponent && UIComponent(param1).isDocument)
         {
            BindingManager.setEnabled(param1,false);
         }
         if(mx_internal::contentPane)
         {
            mx_internal::contentPane.removeChild(param1);
         }
         else
         {
            mx_internal::$removeChild(param1);
         }
         mx_internal::childRemoved(param1);
         return param1;
      }
      
      final mx_internal function get $numChildren() : int
      {
         return super.numChildren;
      }
      
      mx_internal function get numRepeaters() : int
      {
         return !!mx_internal::childRepeaters ? 0 : 0;
      }
      
      mx_internal function set numChildrenCreated(param1:int) : void
      {
         _numChildrenCreated = param1;
      }
      
      public function get creatingContentPane() : Boolean
      {
         return _creatingContentPane;
      }
      
      public function get clipContent() : Boolean
      {
         return _clipContent;
      }
      
      mx_internal function rawChildren_getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1);
      }
      
      override public function regenerateStyleCache(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         super.regenerateStyleCache(param1);
         if(mx_internal::contentPane)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = getChildAt(_loc3_);
               if(param1 && _loc4_ is UIComponent)
               {
                  if(UIComponent(_loc4_).inheritingStyles != UIComponent.mx_internal::STYLE_UNINITIALIZED)
                  {
                     UIComponent(_loc4_).regenerateStyleCache(param1);
                  }
               }
               else if(_loc4_ is IUITextField && Boolean(IUITextField(_loc4_).inheritingStyles))
               {
                  StyleProtoChain.initTextField(IUITextField(_loc4_));
               }
               _loc3_++;
            }
         }
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         var _loc2_:int = 0;
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.getChildIndex(param1);
         }
         return int(super.getChildIndex(param1) - _firstChildIndex);
      }
      
      mx_internal function rawChildren_contains(param1:DisplayObject) : Boolean
      {
         return super.contains(param1);
      }
      
      mx_internal function getScrollableRect() : Rectangle
      {
         var _loc9_:DisplayObject = null;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:int = numChildren;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(!((_loc9_ = getChildAt(_loc6_)) is IUIComponent && !IUIComponent(_loc9_).includeInLayout))
            {
               _loc1_ = Math.min(_loc1_,_loc9_.x);
               _loc2_ = Math.min(_loc2_,_loc9_.y);
               if(!isNaN(_loc9_.width))
               {
                  _loc3_ = Math.max(_loc3_,_loc9_.x + _loc9_.width);
               }
               if(!isNaN(_loc9_.height))
               {
                  _loc4_ = Math.max(_loc4_,_loc9_.y + _loc9_.height);
               }
            }
            _loc6_++;
         }
         var _loc7_:mx.core.EdgeMetrics = viewMetrics;
         var _loc8_:Rectangle;
         (_loc8_ = new Rectangle()).left = _loc1_;
         _loc8_.top = _loc2_;
         _loc8_.right = _loc3_;
         _loc8_.bottom = _loc4_;
         if(mx_internal::usePadding)
         {
            _loc8_.right += getStyle("paddingRight");
            _loc8_.bottom += getStyle("paddingBottom");
         }
         return _loc8_;
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Application = null;
         super.createChildren();
         createBorder();
         createOrDestroyScrollbars(horizontalScrollPolicy == ScrollPolicy.ON,verticalScrollPolicy == ScrollPolicy.ON,horizontalScrollPolicy == ScrollPolicy.ON || verticalScrollPolicy == ScrollPolicy.ON);
         if(creationPolicy != null)
         {
            actualCreationPolicy = creationPolicy;
         }
         else if(parent is Container)
         {
            if(Container(parent).actualCreationPolicy == ContainerCreationPolicy.QUEUED)
            {
               actualCreationPolicy = ContainerCreationPolicy.AUTO;
            }
            else
            {
               actualCreationPolicy = Container(parent).actualCreationPolicy;
            }
         }
         if(actualCreationPolicy == ContainerCreationPolicy.NONE)
         {
            actualCreationPolicy = ContainerCreationPolicy.AUTO;
         }
         else if(actualCreationPolicy == ContainerCreationPolicy.QUEUED)
         {
            _loc1_ = !!parentApplication ? Application(parentApplication) : Application(Application.application);
            _loc1_.addToCreationQueue(this,creationIndex,null,this);
         }
         else if(recursionFlag)
         {
            createComponentsFromDescriptors();
         }
         if(autoLayout == false)
         {
            forceLayout = true;
         }
         UIComponentGlobals.mx_internal::layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE,layoutCompleteHandler,false,0,true);
      }
      
      override public function executeBindings(param1:Boolean = false) : void
      {
         var _loc2_:Object = Boolean(descriptor) && false ? descriptor.document : parentDocument;
         BindingManager.executeBindings(_loc2_,id,this);
         if(param1)
         {
            executeChildBindings(param1);
         }
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = _loc3_;
         var _loc5_:int = param2;
         if(mx_internal::contentPane)
         {
            mx_internal::contentPane.setChildIndex(param1,param2);
            if(_autoLayout || forceLayout)
            {
               invalidateDisplayList();
            }
         }
         else
         {
            _loc3_ = super.getChildIndex(param1);
            param2 += _firstChildIndex;
            if(param2 == _loc3_)
            {
               return;
            }
            super.setChildIndex(param1,param2);
            invalidateDisplayList();
            _loc4_ = _loc3_ - _firstChildIndex;
            _loc5_ = param2 - _firstChildIndex;
         }
         var _loc6_:IndexChangedEvent;
         (_loc6_ = new IndexChangedEvent(IndexChangedEvent.CHILD_INDEX_CHANGE)).relatedObject = param1;
         _loc6_.oldIndex = _loc4_;
         _loc6_.newIndex = _loc5_;
         dispatchEvent(_loc6_);
         dispatchEvent(new Event("childrenChanged"));
      }
      
      override public function globalToContent(param1:Point) : Point
      {
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.globalToLocal(param1);
         }
         return globalToLocal(param1);
      }
      
      mx_internal function rawChildren_removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:int = mx_internal::rawChildren_getChildIndex(param1);
         return mx_internal::rawChildren_removeChildAt(_loc2_);
      }
      
      mx_internal function rawChildren_setChildIndex(param1:DisplayObject, param2:int) : void
      {
         var _loc3_:int = super.getChildIndex(param1);
         super.setChildIndex(param1,param2);
         if(_loc3_ < _firstChildIndex && param2 >= _firstChildIndex)
         {
            --_firstChildIndex;
         }
         else if(_loc3_ >= _firstChildIndex && param2 <= _firstChildIndex)
         {
            ++_firstChildIndex;
         }
         dispatchEvent(new Event("childrenChanged"));
      }
      
      public function set verticalLineScrollSize(param1:Number) : void
      {
         scrollPropertiesChanged = true;
         _verticalLineScrollSize = param1;
         invalidateDisplayList();
         dispatchEvent(new Event("verticalLineScrollSizeChanged"));
      }
      
      mx_internal function rawChildren_getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(param1);
      }
      
      public function get creationIndex() : int
      {
         return _creationIndex;
      }
      
      public function get verticalScrollBar() : ScrollBar
      {
         return _verticalScrollBar;
      }
      
      public function get viewMetricsAndPadding() : mx.core.EdgeMetrics
      {
         if(_viewMetricsAndPadding && (!horizontalScrollBar || horizontalScrollPolicy == ScrollPolicy.ON) && (!verticalScrollBar || verticalScrollPolicy == ScrollPolicy.ON))
         {
            return _viewMetricsAndPadding;
         }
         if(!_viewMetricsAndPadding)
         {
            _viewMetricsAndPadding = new mx.core.EdgeMetrics();
         }
         var _loc1_:mx.core.EdgeMetrics = _viewMetricsAndPadding;
         var _loc2_:mx.core.EdgeMetrics = viewMetrics;
         _loc1_.left = _loc2_.left + getStyle("paddingLeft");
         _loc1_.right = _loc2_.right + getStyle("paddingRight");
         _loc1_.top = _loc2_.top + getStyle("paddingTop");
         _loc1_.bottom = _loc2_.bottom + getStyle("paddingBottom");
         return _loc1_;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return addChildAt(param1,numChildren);
      }
      
      public function set horizontalPageScrollSize(param1:Number) : void
      {
         scrollPropertiesChanged = true;
         _horizontalPageScrollSize = param1;
         invalidateDisplayList();
         dispatchEvent(new Event("horizontalPageScrollSizeChanged"));
      }
      
      override mx_internal function childAdded(param1:DisplayObject) : void
      {
         dispatchEvent(new Event("childrenChanged"));
         var _loc2_:ChildExistenceChangedEvent = new ChildExistenceChangedEvent(ChildExistenceChangedEvent.CHILD_ADD);
         _loc2_.relatedObject = param1;
         dispatchEvent(_loc2_);
         param1.dispatchEvent(new FlexEvent(FlexEvent.ADD));
         super.mx_internal::childAdded(param1);
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         if(mx_internal::_horizontalScrollPolicy != param1)
         {
            mx_internal::_horizontalScrollPolicy = param1;
            invalidateDisplayList();
            dispatchEvent(new Event("horizontalScrollPolicyChanged"));
         }
      }
      
      private function layoutCompleteHandler(param1:FlexEvent) : void
      {
         UIComponentGlobals.mx_internal::layoutManager.removeEventListener(FlexEvent.UPDATE_COMPLETE,layoutCompleteHandler);
         forceLayout = false;
         var _loc2_:Boolean = false;
         if(!isNaN(horizontalScrollPositionPending))
         {
            if(horizontalScrollPositionPending < 0)
            {
               horizontalScrollPositionPending = 0;
            }
            else if(horizontalScrollPositionPending > maxHorizontalScrollPosition)
            {
               horizontalScrollPositionPending = maxHorizontalScrollPosition;
            }
            if(Boolean(horizontalScrollBar) && horizontalScrollBar.scrollPosition != horizontalScrollPositionPending)
            {
               _horizontalScrollPosition = horizontalScrollPositionPending;
               horizontalScrollBar.scrollPosition = horizontalScrollPositionPending;
               _loc2_ = true;
            }
            horizontalScrollPositionPending = NaN;
         }
         if(!isNaN(verticalScrollPositionPending))
         {
            if(verticalScrollPositionPending < 0)
            {
               verticalScrollPositionPending = 0;
            }
            else if(verticalScrollPositionPending > maxVerticalScrollPosition)
            {
               verticalScrollPositionPending = maxVerticalScrollPosition;
            }
            if(Boolean(verticalScrollBar) && verticalScrollBar.scrollPosition != verticalScrollPositionPending)
            {
               _verticalScrollPosition = verticalScrollPositionPending;
               verticalScrollBar.scrollPosition = verticalScrollPositionPending;
               _loc2_ = true;
            }
            verticalScrollPositionPending = NaN;
         }
         if(_loc2_)
         {
            scrollChildren();
         }
      }
      
      public function createComponentsFromDescriptors(param1:Boolean = true) : void
      {
         var _loc4_:mx.core.IFlexDisplayObject = null;
         numChildrenBefore = numChildren;
         mx_internal::createdComponents = [];
         var _loc2_:int = !!childDescriptors ? 0 : 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = createComponentFromDescriptor(childDescriptors[_loc3_],param1);
            mx_internal::createdComponents.push(_loc4_);
            _loc3_++;
         }
         if(creationPolicy == ContainerCreationPolicy.QUEUED || creationPolicy == ContainerCreationPolicy.NONE)
         {
            UIComponentGlobals.mx_internal::layoutManager.usePhasedInstantiation = false;
         }
         mx_internal::numChildrenCreated = numChildren - numChildrenBefore;
         processedDescriptors = true;
      }
      
      override mx_internal function fillOverlay(param1:UIComponent, param2:uint, param3:RoundedRectangle = null) : void
      {
         var _loc4_:mx.core.EdgeMetrics = viewMetrics;
         var _loc5_:Number = 0;
         if(!param3)
         {
            param3 = new RoundedRectangle(_loc4_.left,_loc4_.top,unscaledWidth - _loc4_.right - _loc4_.left,unscaledHeight - _loc4_.bottom - _loc4_.top,_loc5_);
         }
         if(isNaN(param3.x) || isNaN(param3.y) || isNaN(param3.width) || isNaN(param3.height) || isNaN(param3.cornerRadius))
         {
            return;
         }
         var _loc6_:Graphics;
         (_loc6_ = param1.graphics).clear();
         _loc6_.beginFill(param2);
         _loc6_.drawRoundRect(param3.x,param3.y,param3.width,param3.height,param3.cornerRadius * 2,param3.cornerRadius * 2);
         _loc6_.endFill();
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == MouseEvent.CLICK || param1 == MouseEvent.DOUBLE_CLICK || param1 == MouseEvent.MOUSE_DOWN || param1 == MouseEvent.MOUSE_MOVE || param1 == MouseEvent.MOUSE_OVER || param1 == MouseEvent.MOUSE_OUT || param1 == MouseEvent.MOUSE_UP || param1 == MouseEvent.MOUSE_WHEEL)
         {
            if(mouseEventReferenceCount > 0 && --mouseEventReferenceCount == 0)
            {
               setStyle("mouseShield",false);
               setStyle("mouseShieldChildren",false);
            }
         }
      }
      
      mx_internal function rawChildren_removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.getChildAt(param1);
         super.mx_internal::removingChild(_loc2_);
         mx_internal::$removeChildAt(param1);
         super.mx_internal::childRemoved(_loc2_);
         if(_firstChildIndex < param1 && param1 < _firstChildIndex + mx_internal::_numChildren)
         {
            --mx_internal::_numChildren;
         }
         else if(mx_internal::_numChildren == 0 || param1 < _firstChildIndex)
         {
            --_firstChildIndex;
         }
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("childrenChanged"));
         return _loc2_;
      }
      
      public function set data(param1:Object) : void
      {
         _data = param1;
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
         invalidateDisplayList();
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return removeChild(getChildAt(param1));
      }
      
      private function isBorderNeeded() : Boolean
      {
         var v:Object;
         var c:Class = getStyle("borderSkin");
         try
         {
            if(c != getDefinitionByName("mx.skins.halo::HaloBorder"))
            {
               return true;
            }
         }
         catch(e:Error)
         {
            return true;
         }
         v = getStyle("borderStyle");
         if(v)
         {
            if(v != "none" || v == "none" && getStyle("mouseShield"))
            {
               return true;
            }
         }
         v = getStyle("backgroundColor");
         if(v !== null && v !== "")
         {
            return true;
         }
         v = getStyle("backgroundImage");
         return v != null && v != "";
      }
      
      public function set autoLayout(param1:Boolean) : void
      {
         var _loc2_:IInvalidating = null;
         _autoLayout = param1;
         if(param1)
         {
            invalidateSize();
            invalidateDisplayList();
            _loc2_ = parent as IInvalidating;
            if(_loc2_)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
         }
      }
      
      [Bindable("verticalPageScrollSizeChanged")]
      public function get verticalPageScrollSize() : Number
      {
         return _verticalPageScrollSize;
      }
      
      [Bindable("childrenChanged")]
      public function getChildren() : Array
      {
         var _loc1_:* = [];
         var _loc2_:int = numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(getChildAt(_loc3_));
            _loc3_++;
         }
         return _loc1_;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc3_:DisplayObjectContainer = param1.parent;
         if(Boolean(_loc3_) && !(_loc3_ is Loader))
         {
            if(_loc3_ == this)
            {
               param2 = param2 == numChildren ? param2 - 1 : param2;
            }
            _loc3_.removeChild(param1);
         }
         mx_internal::addingChild(param1);
         if(mx_internal::contentPane)
         {
            mx_internal::contentPane.addChildAt(param1,param2);
         }
         else
         {
            mx_internal::$addChildAt(param1,_firstChildIndex + param2);
         }
         mx_internal::childAdded(param1);
         if(param1 is UIComponent && UIComponent(param1).isDocument)
         {
            BindingManager.setEnabled(param1,true);
         }
         return param1;
      }
      
      private function createScrollbarsIfNeeded(param1:Rectangle) : Boolean
      {
         var _loc2_:Number = param1.right;
         var _loc3_:Number = param1.bottom;
         var _loc4_:Number = unscaledWidth;
         var _loc5_:Number = unscaledHeight;
         var _loc6_:Boolean = param1.left < 0 || param1.top < 0;
         var _loc7_:mx.core.EdgeMetrics = viewMetrics;
         if(scaleX != 1)
         {
            _loc4_ += 1 / Math.abs(scaleX);
         }
         if(scaleY != 1)
         {
            _loc5_ += 1 / Math.abs(scaleY);
         }
         _loc4_ = Math.floor(_loc4_);
         _loc5_ = Math.floor(_loc5_);
         _loc2_ = Math.floor(_loc2_);
         _loc3_ = Math.floor(_loc3_);
         if(Boolean(horizontalScrollBar) && horizontalScrollPolicy != ScrollPolicy.ON)
         {
            _loc5_ -= 0;
         }
         if(Boolean(verticalScrollBar) && verticalScrollPolicy != ScrollPolicy.ON)
         {
            _loc4_ -= 0;
         }
         _loc4_ -= _loc7_.left + _loc7_.right;
         _loc5_ -= _loc7_.top + _loc7_.bottom;
         var _loc8_:* = horizontalScrollPolicy == ScrollPolicy.ON;
         var _loc9_:* = verticalScrollPolicy == ScrollPolicy.ON;
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc6_ || mx_internal::overlay != null || _loc7_.left > 0 || _loc7_.top > 0;
         if(_loc4_ < _loc2_)
         {
            _loc10_ = true;
            if(horizontalScrollPolicy == ScrollPolicy.AUTO && unscaledHeight - _loc7_.top - _loc7_.bottom >= 18 && unscaledWidth - _loc7_.left - _loc7_.right >= 32)
            {
               _loc8_ = true;
            }
         }
         if(_loc5_ < _loc3_)
         {
            _loc10_ = true;
            if(verticalScrollPolicy == ScrollPolicy.AUTO && unscaledWidth - _loc7_.left - _loc7_.right >= 18 && unscaledHeight - _loc7_.top - _loc7_.bottom >= 32)
            {
               _loc9_ = true;
            }
         }
         if(_loc8_ && _loc9_ && horizontalScrollPolicy == ScrollPolicy.AUTO && verticalScrollPolicy == ScrollPolicy.AUTO && horizontalScrollBar && verticalScrollBar && _loc4_ + verticalScrollBar.minWidth >= _loc2_ && _loc5_ + horizontalScrollBar.minHeight >= _loc3_)
         {
            _loc8_ = _loc9_ = false;
         }
         else if(_loc8_ && !_loc9_ && verticalScrollBar && horizontalScrollPolicy == ScrollPolicy.AUTO && _loc4_ + verticalScrollBar.minWidth >= _loc2_)
         {
            _loc8_ = false;
         }
         var _loc11_:Boolean = createOrDestroyScrollbars(_loc8_,_loc9_,_loc10_);
         if(scrollableWidth != _loc2_ || viewableWidth != _loc4_ || _loc11_)
         {
            if(horizontalScrollBar)
            {
               horizontalScrollBar.setScrollProperties(_loc4_,0,_loc2_ - _loc4_,horizontalPageScrollSize);
               scrollPositionChanged = true;
            }
            viewableWidth = _loc4_;
            scrollableWidth = _loc2_;
         }
         if(scrollableHeight != _loc3_ || viewableHeight != _loc5_ || _loc11_)
         {
            if(verticalScrollBar)
            {
               verticalScrollBar.setScrollProperties(_loc5_,0,_loc3_ - _loc5_,verticalPageScrollSize);
               scrollPositionChanged = true;
            }
            viewableHeight = _loc5_;
            scrollableHeight = _loc3_;
         }
         return _loc11_;
      }
      
      override mx_internal function removingChild(param1:DisplayObject) : void
      {
         super.mx_internal::removingChild(param1);
         param1.dispatchEvent(new FlexEvent(FlexEvent.REMOVE));
         var _loc2_:ChildExistenceChangedEvent = new ChildExistenceChangedEvent(ChildExistenceChangedEvent.CHILD_REMOVE);
         _loc2_.relatedObject = param1;
         dispatchEvent(_loc2_);
      }
      
      mx_internal function get numChildrenCreated() : int
      {
         return _numChildrenCreated;
      }
      
      private function hasChildMatchingDescriptor(param1:UIComponentDescriptor) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:IUIComponent = null;
         var _loc2_:String = param1.id;
         if(_loc2_ != null && _loc2_ in document && true)
         {
            return false;
         }
         var _loc3_:int = numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = IUIComponent(getChildAt(_loc4_))) is IDeferredInstantiationUIComponent && IDeferredInstantiationUIComponent(_loc5_).descriptor == param1)
            {
               return true;
            }
            _loc4_++;
         }
         if(mx_internal::childRepeaters)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(IDeferredInstantiationUIComponent(mx_internal::childRepeaters[_loc4_]).descriptor == param1)
               {
                  return true;
               }
               _loc4_++;
            }
         }
         return false;
      }
      
      mx_internal function rawChildren_getChildByName(param1:String) : DisplayObject
      {
         return super.getChildByName(param1);
      }
      
      override public function validateDisplayList() : void
      {
         var _loc1_:mx.core.EdgeMetrics = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(_autoLayout || forceLayout)
         {
            mx_internal::doingLayout = true;
            super.validateDisplayList();
            mx_internal::doingLayout = false;
         }
         else
         {
            layoutChrome(unscaledWidth,unscaledHeight);
         }
         mx_internal::invalidateDisplayListFlag = true;
         if(createContentPaneAndScrollbarsIfNeeded())
         {
            if(_autoLayout || forceLayout)
            {
               mx_internal::doingLayout = true;
               super.validateDisplayList();
               mx_internal::doingLayout = false;
            }
            createContentPaneAndScrollbarsIfNeeded();
         }
         if(clampScrollPositions())
         {
            scrollChildren();
         }
         if(mx_internal::contentPane)
         {
            _loc1_ = viewMetrics;
            if(mx_internal::overlay)
            {
               mx_internal::overlay.x = 0;
               mx_internal::overlay.y = 0;
               mx_internal::overlay.width = unscaledWidth;
               mx_internal::overlay.height = unscaledHeight;
            }
            if(Boolean(horizontalScrollBar) || Boolean(verticalScrollBar))
            {
               if(Boolean(verticalScrollBar) && verticalScrollPolicy == ScrollPolicy.ON)
               {
                  _loc1_.right -= 0;
               }
               if(Boolean(horizontalScrollBar) && horizontalScrollPolicy == ScrollPolicy.ON)
               {
                  _loc1_.bottom -= 0;
               }
               if(horizontalScrollBar)
               {
                  _loc2_ = unscaledWidth - _loc1_.left - _loc1_.right;
                  if(verticalScrollBar)
                  {
                     _loc2_ -= 0;
                  }
                  horizontalScrollBar.setActualSize(_loc2_,horizontalScrollBar.minHeight);
                  horizontalScrollBar.move(_loc1_.left,unscaledHeight - _loc1_.bottom - 0);
               }
               if(verticalScrollBar)
               {
                  _loc3_ = unscaledHeight - _loc1_.top - _loc1_.bottom;
                  if(horizontalScrollBar)
                  {
                     _loc3_ -= 0;
                  }
                  verticalScrollBar.setActualSize(verticalScrollBar.minWidth,_loc3_);
                  verticalScrollBar.move(unscaledWidth - _loc1_.right - 0,_loc1_.top);
               }
               if(whiteBox)
               {
                  whiteBox.x = verticalScrollBar.x;
                  whiteBox.y = horizontalScrollBar.y;
               }
            }
            mx_internal::contentPane.x = _loc1_.left;
            mx_internal::contentPane.y = _loc1_.top;
            if(focusPane)
            {
               focusPane.x = _loc1_.left;
               focusPane.y = _loc1_.top;
            }
            scrollChildren();
         }
         mx_internal::invalidateDisplayListFlag = false;
         if(mx_internal::blocker)
         {
            _loc1_ = viewMetrics;
            if((_loc4_ = enabled ? null : getStyle("backgroundDisabledColor")) === null || isNaN(Number(_loc4_)))
            {
               _loc4_ = getStyle("backgroundColor");
            }
            if(_loc4_ === null || isNaN(Number(_loc4_)))
            {
               _loc4_ = 16777215;
            }
            _loc5_ = getStyle("disabledOverlayAlpha");
            if(isNaN(_loc5_))
            {
               _loc5_ = 0.6;
            }
            mx_internal::blocker.x = _loc1_.left;
            mx_internal::blocker.y = _loc1_.top;
            _loc6_ = unscaledWidth - (_loc1_.left + _loc1_.right);
            _loc7_ = unscaledHeight - (_loc1_.top + _loc1_.bottom);
            mx_internal::blocker.graphics.clear();
            mx_internal::blocker.graphics.beginFill(uint(_loc4_),_loc5_);
            mx_internal::blocker.graphics.drawRect(0,0,_loc6_,_loc7_);
            mx_internal::blocker.graphics.endFill();
            rawChildren.setChildIndex(mx_internal::blocker,-1);
         }
      }
      
      public function set horizontalLineScrollSize(param1:Number) : void
      {
         scrollPropertiesChanged = true;
         _horizontalLineScrollSize = param1;
         invalidateDisplayList();
         dispatchEvent(new Event("horizontalLineScrollSizeChanged"));
      }
      
      mx_internal function rawChildren_addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(_firstChildIndex < param2 && param2 < _firstChildIndex + mx_internal::_numChildren + 1)
         {
            ++mx_internal::_numChildren;
         }
         else if(param2 <= _firstChildIndex)
         {
            ++_firstChildIndex;
         }
         super.mx_internal::addingChild(param1);
         mx_internal::$addChildAt(param1,param2);
         super.mx_internal::childAdded(param1);
         dispatchEvent(new Event("childrenChanged"));
         return param1;
      }
      
      override public function initialize() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:String = null;
         if(isDocument && mx_internal::documentDescriptor && !processedDescriptors)
         {
            _loc1_ = mx_internal::documentDescriptor.properties;
            if(_loc1_ && Boolean(_loc1_.childDescriptors))
            {
               if(_childDescriptors)
               {
                  _loc2_ = String(resourceManager.getString("core","multipleChildSets_ClassAndInstance"));
                  throw new Error(_loc2_);
               }
               _childDescriptors = _loc1_.childDescriptors;
            }
         }
         super.initialize();
      }
      
      mx_internal function set forceClipping(param1:Boolean) : void
      {
         if(_clipContent)
         {
            if(param1)
            {
               ++_forceClippingCount;
            }
            else
            {
               --_forceClippingCount;
            }
            mx_internal::createContentPane();
            scrollChildren();
         }
      }
      
      public function removeAllChildren() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      override public function contentToGlobal(param1:Point) : Point
      {
         if(mx_internal::contentPane)
         {
            return mx_internal::contentPane.localToGlobal(param1);
         }
         return localToGlobal(param1);
      }
      
      [Bindable("horizontalPageScrollSizeChanged")]
      public function get horizontalPageScrollSize() : Number
      {
         return _horizontalPageScrollSize;
      }
      
      override mx_internal function childRemoved(param1:DisplayObject) : void
      {
         super.mx_internal::childRemoved(param1);
         invalidateSize();
         invalidateDisplayList();
         if(!mx_internal::contentPane)
         {
            --mx_internal::_numChildren;
            if(mx_internal::_numChildren == 0)
            {
               _firstChildIndex = super.numChildren;
            }
         }
         if(Boolean(mx_internal::contentPane) && !autoLayout)
         {
            forceLayout = true;
            UIComponentGlobals.mx_internal::layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE,layoutCompleteHandler,false,0,true);
         }
         dispatchEvent(new Event("childrenChanged"));
      }
      
      public function set defaultButton(param1:mx.core.IFlexDisplayObject) : void
      {
         _defaultButton = param1;
         ContainerGlobals.focusedContainer = null;
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      override public function get numChildren() : int
      {
         return !!mx_internal::contentPane ? 0 : mx_internal::_numChildren;
      }
      
      public function get autoLayout() : Boolean
      {
         return _autoLayout;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:Boolean = param1 == null || param1 == "styleName";
         if(_loc2_ || StyleManager.isSizeInvalidatingStyle(param1))
         {
            invalidateDisplayList();
         }
         if(_loc2_ || param1 == "borderSkin")
         {
            if(mx_internal::border)
            {
               rawChildren.removeChild(DisplayObject(mx_internal::border));
               mx_internal::border = null;
               createBorder();
            }
         }
         if(_loc2_ || param1 == "borderStyle" || param1 == "backgroundColor" || param1 == "backgroundImage" || param1 == "mouseShield" || param1 == "mouseShieldChildren")
         {
            createBorder();
         }
         super.styleChanged(param1);
         if(_loc2_ || StyleManager.isSizeInvalidatingStyle(param1))
         {
            mx_internal::invalidateViewMetricsAndPadding();
         }
         if(_loc2_ || param1 == "horizontalScrollBarStyleName")
         {
            if(Boolean(horizontalScrollBar) && horizontalScrollBar is ISimpleStyleClient)
            {
               _loc3_ = getStyle("horizontalScrollBarStyleName");
               ISimpleStyleClient(horizontalScrollBar).styleName = _loc3_;
            }
         }
         if(_loc2_ || param1 == "verticalScrollBarStyleName")
         {
            if(Boolean(verticalScrollBar) && verticalScrollBar is ISimpleStyleClient)
            {
               _loc4_ = getStyle("verticalScrollBarStyleName");
               ISimpleStyleClient(verticalScrollBar).styleName = _loc4_;
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:String = null;
         super.commitProperties();
         if(changedStyles)
         {
            _loc1_ = String(changedStyles == MULTIPLE_PROPERTIES ? null : changedStyles);
            super.notifyStyleChangeInChildren(_loc1_,true);
            changedStyles = null;
         }
         createOrDestroyBlocker();
      }
      
      override public function finishPrint(param1:Object, param2:mx.core.IFlexDisplayObject) : void
      {
         if(param1)
         {
            mx_internal::contentPane.scrollRect = Rectangle(param1);
         }
         super.finishPrint(param1,param2);
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         return !!horizontalScrollBar ? 0 : Math.max(scrollableWidth - viewableWidth,0);
      }
      
      public function set creationPolicy(param1:String) : void
      {
         _creationPolicy = param1;
         mx_internal::setActualCreationPolicies(param1);
      }
      
      public function set label(param1:String) : void
      {
         _label = param1;
         dispatchEvent(new Event("labelChanged"));
      }
      
      private function clampScrollPositions() : Boolean
      {
         var _loc1_:Boolean = false;
         if(_horizontalScrollPosition < 0)
         {
            _horizontalScrollPosition = 0;
            _loc1_ = true;
         }
         else if(_horizontalScrollPosition > maxHorizontalScrollPosition)
         {
            _horizontalScrollPosition = maxHorizontalScrollPosition;
            _loc1_ = true;
         }
         if(Boolean(horizontalScrollBar) && horizontalScrollBar.scrollPosition != _horizontalScrollPosition)
         {
            horizontalScrollBar.scrollPosition = _horizontalScrollPosition;
         }
         if(_verticalScrollPosition < 0)
         {
            _verticalScrollPosition = 0;
            _loc1_ = true;
         }
         else if(_verticalScrollPosition > maxVerticalScrollPosition)
         {
            _verticalScrollPosition = maxVerticalScrollPosition;
            _loc1_ = true;
         }
         if(Boolean(verticalScrollBar) && verticalScrollBar.scrollPosition != _verticalScrollPosition)
         {
            verticalScrollBar.scrollPosition = _verticalScrollPosition;
         }
         return _loc1_;
      }
      
      override public function prepareToPrint(param1:mx.core.IFlexDisplayObject) : Object
      {
         var _loc2_:Rectangle = Boolean(mx_internal::contentPane) && false ? mx_internal::contentPane.scrollRect : null;
         if(_loc2_)
         {
            mx_internal::contentPane.scrollRect = null;
         }
         super.prepareToPrint(param1);
         return _loc2_;
      }
      
      mx_internal function get firstChildIndex() : int
      {
         return _firstChildIndex;
      }
      
      mx_internal function rawChildren_addChild(param1:DisplayObject) : DisplayObject
      {
         if(mx_internal::_numChildren == 0)
         {
            ++_firstChildIndex;
         }
         super.mx_internal::addingChild(param1);
         mx_internal::$addChild(param1);
         super.mx_internal::childAdded(param1);
         dispatchEvent(new Event("childrenChanged"));
         return param1;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         super.updateDisplayList(param1,param2);
         layoutChrome(param1,param2);
         if(scrollPositionChanged)
         {
            clampScrollPositions();
            scrollChildren();
            scrollPositionChanged = false;
         }
         if(scrollPropertiesChanged)
         {
            if(horizontalScrollBar)
            {
               horizontalScrollBar.lineScrollSize = horizontalLineScrollSize;
               horizontalScrollBar.pageScrollSize = horizontalPageScrollSize;
            }
            if(verticalScrollBar)
            {
               verticalScrollBar.lineScrollSize = verticalLineScrollSize;
               verticalScrollBar.pageScrollSize = verticalPageScrollSize;
            }
            scrollPropertiesChanged = false;
         }
         if(Boolean(mx_internal::contentPane) && false)
         {
            _loc3_ = enabled ? null : getStyle("backgroundDisabledColor");
            if(_loc3_ === null || isNaN(Number(_loc3_)))
            {
               _loc3_ = getStyle("backgroundColor");
            }
            _loc4_ = getStyle("backgroundAlpha");
            if(!_clipContent || isNaN(Number(_loc3_)) || _loc3_ === "" || !(Boolean(horizontalScrollBar) || Boolean(verticalScrollBar)) && !cacheAsBitmap)
            {
               _loc3_ = null;
            }
            else if(getStyle("backgroundImage") || getStyle("background"))
            {
               _loc3_ = null;
            }
            else if(_loc4_ != 1)
            {
               _loc3_ = null;
            }
            mx_internal::contentPane.opaqueBackground = _loc3_;
            mx_internal::contentPane.cacheAsBitmap = _loc3_ != null;
         }
      }
      
      override mx_internal function addingChild(param1:DisplayObject) : void
      {
         var _loc2_:IUIComponent = IUIComponent(param1);
         super.mx_internal::addingChild(param1);
         invalidateSize();
         invalidateDisplayList();
         if(!mx_internal::contentPane)
         {
            if(mx_internal::_numChildren == 0)
            {
               _firstChildIndex = super.numChildren;
            }
            ++mx_internal::_numChildren;
         }
         if(Boolean(mx_internal::contentPane) && !autoLayout)
         {
            forceLayout = true;
            UIComponentGlobals.mx_internal::layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE,layoutCompleteHandler,false,0,true);
         }
      }
      
      mx_internal function setActualCreationPolicies(param1:String) : void
      {
         var _loc5_:mx.core.IFlexDisplayObject = null;
         var _loc6_:Container = null;
         actualCreationPolicy = param1;
         var _loc2_:String = param1;
         if(param1 == ContainerCreationPolicy.QUEUED)
         {
            _loc2_ = "null";
         }
         var _loc3_:int = numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = IFlexDisplayObject(getChildAt(_loc4_))) is Container)
            {
               if((_loc6_ = Container(_loc5_)).creationPolicy == null)
               {
                  _loc6_.mx_internal::setActualCreationPolicies(_loc2_);
               }
            }
            _loc4_++;
         }
      }
   }
}
