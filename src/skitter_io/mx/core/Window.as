package mx.core
{
   import flash.desktop.NativeApplication;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.NativeWindowInitOptions;
   import flash.display.NativeWindowResize;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.NativeWindowBoundsEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import mx.controls.Button;
   import mx.controls.FlexNativeMenu;
   import mx.core.windowClasses.StatusBar;
   import mx.core.windowClasses.TitleBar;
   import mx.events.AIREvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexNativeWindowBoundsEvent;
   import mx.managers.CursorManagerImpl;
   import mx.managers.FocusManager;
   import mx.managers.ICursorManager;
   import mx.managers.ISystemManager;
   import mx.managers.WindowedSystemManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import mx.styles.StyleProxy;
   
   public class Window extends LayoutContainer implements IWindow
   {
      
      private static var _titleBarStyleFilters:Object = {
         "buttonAlignment":"buttonAlignment",
         "buttonPadding":"buttonPadding",
         "closeButtonSkin":"closeButtonSkin",
         "cornerRadius":"cornerRadius",
         "headerHeight":"headerHeight",
         "maximizeButtonSkin":"maximizeButtonSkin",
         "minimizeButtonSkin":"minimizeButtonSkin",
         "restoreButtonSkin":"restoreButtonSkin",
         "titleAlignment":"titleAlignment",
         "titleBarBackgroundSkin":"titleBarBackgroundSkin",
         "titleBarButtonPadding":"titleBarButtonPadding",
         "titleBarColors":"titleBarColors",
         "titleTextStyleName":"titleTextStyleName"
      };
      
      private static const HEADER_PADDING:Number = 4;
      
      private static var _statusBarStyleFilters:Object = {
         "statusBarBackgroundColor":"statusBarBackgroundColor",
         "statusBarBackgroundSkin":"statusBarBackgroundSkin",
         "statusTextStyleName":"statusTextStyleName"
      };
      
      private static const DEFAULT_WINDOW_WIDTH:Number = 100;
      
      private static const MOUSE_SLACK:Number = 5;
      
      private static const DEFAULT_WINDOW_HEIGHT:Number = 100;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var showGripperChanged:Boolean = true;
      
      private var _maxWidth:Number = 10000;
      
      private var _type:String = "normal";
      
      mx_internal var titleBarBackground:mx.core.IFlexDisplayObject;
      
      private var _maxHeight:Number = 10000;
      
      private var _menu:FlexNativeMenu;
      
      private var boundsChanged:Boolean = false;
      
      private var _showStatusBar:Boolean = true;
      
      private var menuChanged:Boolean = false;
      
      private var minHeightChanged:Boolean = false;
      
      private var statusChanged:Boolean = false;
      
      private var titleIconChanged:Boolean = false;
      
      private var prevX:Number;
      
      private var prevY:Number;
      
      private var maxHeightChanged:Boolean = false;
      
      private var gripper:Button;
      
      private var _showTitleBar:Boolean = true;
      
      private var _minHeight:Number = 0;
      
      private var resizeHandlerAdded:Boolean = false;
      
      private var _nativeWindow:NativeWindow;
      
      private var _nativeWindowVisible:Boolean = true;
      
      mx_internal var statusBarBackground:mx.core.IFlexDisplayObject;
      
      private var _minimizable:Boolean = true;
      
      private var showTitleBarChanged:Boolean = true;
      
      private var toMax:Boolean = false;
      
      private var _alwaysInFront:Boolean = false;
      
      private var resizeHeight:Boolean = true;
      
      private var gripperHit:Sprite;
      
      private var _showGripper:Boolean = true;
      
      private var oldX:Number;
      
      private var oldY:Number;
      
      private var maximized:Boolean = false;
      
      private var _status:String = "";
      
      private var _resizable:Boolean = true;
      
      private var titleChanged:Boolean = false;
      
      private var _statusBar:mx.core.UIComponent;
      
      private var _title:String = "";
      
      private var _statusBarFactory:mx.core.IFactory;
      
      private var statusBarFactoryChanged:Boolean = false;
      
      private var _systemChrome:String = "standard";
      
      private var resizeWidth:Boolean = true;
      
      public var controlBar:mx.core.IUIComponent;
      
      private var _cursorManager:ICursorManager;
      
      private var _titleIcon:Class;
      
      private var appViewMetrics:mx.core.EdgeMetrics;
      
      private var minWidthChanged:Boolean = false;
      
      private var maxWidthChanged:Boolean = false;
      
      private var flagForOpen:Boolean = false;
      
      private var _titleBarFactory:mx.core.IFactory;
      
      private var _transparent:Boolean = false;
      
      private var titleBarFactoryChanged:Boolean = false;
      
      private var frameCounter:int = 0;
      
      private var showStatusBarChanged:Boolean = true;
      
      private var _maximizable:Boolean = true;
      
      private var _bounds:Rectangle;
      
      private var openActive:Boolean = true;
      
      private var _minWidth:Number = 0;
      
      private var _titleBar:mx.core.UIComponent;
      
      public function Window()
      {
         _bounds = new Rectangle(0,0,DEFAULT_WINDOW_WIDTH,DEFAULT_WINDOW_HEIGHT);
         _statusBarFactory = new ClassFactory(StatusBar);
         _titleBarFactory = new ClassFactory(TitleBar);
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
         addEventListener(FlexEvent.PREINITIALIZE,preinitializeHandler);
         invalidateProperties();
      }
      
      public static function getWindow(param1:mx.core.UIComponent) : Window
      {
         if(param1.systemManager is WindowedSystemManager)
         {
            return WindowedSystemManager(param1.systemManager).mx_internal::window;
         }
         return null;
      }
      
      public function orderInBackOf(param1:IWindow) : Boolean
      {
         if(Boolean(nativeWindow) && true)
         {
            return nativeWindow.orderInBackOf(param1.nativeWindow);
         }
         return false;
      }
      
      public function set statusBarFactory(param1:mx.core.IFactory) : void
      {
         _statusBarFactory = param1;
         statusBarFactoryChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("statusBarFactoryChanged"));
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         if(frameCounter == 2)
         {
            removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
            _nativeWindow.visible = _nativeWindowVisible;
            dispatchEvent(new AIREvent(AIREvent.WINDOW_COMPLETE));
            if(false)
            {
               if(openActive)
               {
                  _nativeWindow.activate();
               }
            }
         }
         ++frameCounter;
      }
      
      [Bindable("windowComplete")]
      [Bindable("minHeightChanged")]
      override public function get minHeight() : Number
      {
         if(Boolean(nativeWindow) && !minHeightChanged)
         {
            return nativeWindow.minSize.y - chromeHeight();
         }
         return _minHeight;
      }
      
      override public function set minHeight(param1:Number) : void
      {
         _minHeight = param1;
         minHeightChanged = true;
         invalidateProperties();
      }
      
      private function nativeApplication_deactivateHandler(param1:Event) : void
      {
         dispatchEvent(new AIREvent(AIREvent.APPLICATION_DEACTIVATE));
      }
      
      private function chromeHeight() : Number
      {
         return 0 - systemManager.stage.stageHeight;
      }
      
      private function window_closeHandler(param1:Event) : void
      {
         dispatchEvent(new Event("close"));
      }
      
      public function get showStatusBar() : Boolean
      {
         return _showStatusBar;
      }
      
      override mx_internal function initThemeColor() : Boolean
      {
         var _loc2_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:CSSStyleDeclaration = null;
         var _loc1_:Boolean = super.mx_internal::initThemeColor();
         if(!_loc1_)
         {
            if(_loc5_ = StyleManager.getStyleDeclaration("global"))
            {
               _loc2_ = _loc5_.getStyle("themeColor");
               _loc3_ = _loc5_.getStyle("rollOverColor");
               _loc4_ = _loc5_.getStyle("selectionColor");
            }
            if(_loc2_ && isNaN(_loc3_) && isNaN(_loc4_))
            {
               mx_internal::setThemeColor(_loc2_);
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 < minHeight)
         {
            param1 = minHeight;
         }
         else if(param1 > maxHeight)
         {
            param1 = maxHeight;
         }
         _bounds.height = param1;
         boundsChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         dispatchEvent(new Event("heightChanged"));
      }
      
      public function open(param1:Boolean = true) : void
      {
         flagForOpen = true;
         openActive = param1;
         commitProperties();
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         stage.nativeWindow.x += param1.stageX - prevX;
         stage.nativeWindow.y += param1.stageY - prevY;
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(systemManager.stage.nativeWindow.systemChrome != "none")
         {
            return;
         }
         if(param1.target == gripperHit)
         {
            startResize(NativeWindowResize.BOTTOM_RIGHT);
            param1.stopPropagation();
         }
         else
         {
            _loc2_ = Number(getStyle("borderThickness")) + 6;
            _loc3_ = 12;
            if(param1.stageY < Number(getStyle("borderThickness")))
            {
               if(param1.stageX < _loc3_)
               {
                  startResize(NativeWindowResize.TOP_LEFT);
               }
               else if(param1.stageX > width - _loc3_)
               {
                  startResize(NativeWindowResize.TOP_RIGHT);
               }
               else
               {
                  startResize(NativeWindowResize.TOP);
               }
            }
            else if(param1.stageY > height - _loc2_)
            {
               if(param1.stageX < _loc3_)
               {
                  startResize(NativeWindowResize.BOTTOM_LEFT);
               }
               else if(param1.stageX > width - _loc3_)
               {
                  startResize(NativeWindowResize.BOTTOM_RIGHT);
               }
               else
               {
                  startResize(NativeWindowResize.BOTTOM);
               }
            }
            else if(param1.stageX < _loc2_)
            {
               if(param1.stageY < _loc3_)
               {
                  startResize(NativeWindowResize.TOP_LEFT);
               }
               else if(param1.stageY > height - _loc3_)
               {
                  startResize(NativeWindowResize.BOTTOM_LEFT);
               }
               else
               {
                  startResize(NativeWindowResize.LEFT);
               }
               param1.stopPropagation();
            }
            else if(param1.stageX > width - _loc2_)
            {
               if(param1.stageY < _loc3_)
               {
                  startResize(NativeWindowResize.TOP_RIGHT);
               }
               else if(param1.stageY > height - _loc3_)
               {
                  startResize(NativeWindowResize.BOTTOM_RIGHT);
               }
               else
               {
                  startResize(NativeWindowResize.RIGHT);
               }
            }
         }
      }
      
      override public function get viewMetrics() : mx.core.EdgeMetrics
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:mx.core.EdgeMetrics = super.viewMetrics;
         var _loc2_:mx.core.EdgeMetrics = new mx.core.EdgeMetrics(_loc1_.left,_loc1_.top,_loc1_.right,_loc1_.bottom);
         if(showTitleBar)
         {
            _loc3_ = getHeaderHeight();
            if(!isNaN(_loc3_))
            {
               _loc2_.top += _loc3_;
            }
         }
         if(showStatusBar)
         {
            _loc4_ = getStatusBarHeight();
            if(!isNaN(_loc4_))
            {
               _loc2_.bottom += _loc4_;
            }
         }
         if(Boolean(controlBar) && false)
         {
            _loc2_.top += controlBar.getExplicitOrMeasuredHeight();
         }
         return _loc2_;
      }
      
      [Bindable("titleChanged")]
      public function get title() : String
      {
         return _title;
      }
      
      private function window_moveHandler(param1:NativeWindowBoundsEvent) : void
      {
         var _loc2_:FlexNativeWindowBoundsEvent = new FlexNativeWindowBoundsEvent(FlexNativeWindowBoundsEvent.WINDOW_MOVE,param1.bubbles,param1.cancelable,param1.beforeBounds,param1.afterBounds);
         dispatchEvent(_loc2_);
      }
      
      protected function get statusBarStyleFilters() : Object
      {
         return _statusBarStyleFilters;
      }
      
      [Bindable("windowComplete")]
      [Bindable("show")]
      [Bindable("hide")]
      override public function get visible() : Boolean
      {
         if(Boolean(nativeWindow) && false)
         {
            return false;
         }
         if(nativeWindow)
         {
            return nativeWindow.visible;
         }
         return _nativeWindowVisible;
      }
      
      public function set type(param1:String) : void
      {
         if(!_nativeWindow)
         {
            _type = param1;
            invalidateProperties();
         }
      }
      
      public function get minimizable() : Boolean
      {
         return _minimizable;
      }
      
      public function restore() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(true)
         {
            if(stage.nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,NativeWindowDisplayState.MAXIMIZED,NativeWindowDisplayState.NORMAL);
               stage.nativeWindow.dispatchEvent(_loc1_);
               if(!_loc1_.isDefaultPrevented())
               {
                  nativeWindow.restore();
               }
            }
            else if(stage.nativeWindow.displayState == NativeWindowDisplayState.MINIMIZED)
            {
               _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,NativeWindowDisplayState.MINIMIZED,NativeWindowDisplayState.NORMAL);
               stage.nativeWindow.dispatchEvent(_loc1_);
               if(!_loc1_.isDefaultPrevented())
               {
                  nativeWindow.restore();
               }
            }
         }
      }
      
      public function set showStatusBar(param1:Boolean) : void
      {
         if(_showStatusBar == param1)
         {
            return;
         }
         _showStatusBar = param1;
         showStatusBarChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      private function getHeaderHeight() : Number
      {
         if(true)
         {
            if(getStyle("headerHeight") != null)
            {
               return getStyle("headerHeight");
            }
            if(true)
            {
               return 0;
            }
            if(systemManager.stage.nativeWindow.systemChrome != "none")
            {
               return 0;
            }
            if(titleBar)
            {
               return titleBar.getExplicitOrMeasuredHeight();
            }
         }
         return 0;
      }
      
      [Bindable("windowComplete")]
      [Bindable("minWidthChanged")]
      override public function get minWidth() : Number
      {
         if(Boolean(nativeWindow) && !minWidthChanged)
         {
            return nativeWindow.minSize.x - chromeWidth();
         }
         return _minWidth;
      }
      
      public function minimize() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(true)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,nativeWindow.displayState,NativeWindowDisplayState.MINIMIZED);
            stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               stage.nativeWindow.minimize();
            }
         }
      }
      
      public function get titleBar() : mx.core.UIComponent
      {
         return _titleBar;
      }
      
      public function set transparent(param1:Boolean) : void
      {
         if(!_nativeWindow)
         {
            _transparent = param1;
            invalidateProperties();
         }
      }
      
      public function get resizable() : Boolean
      {
         return _resizable;
      }
      
      protected function get bounds() : Rectangle
      {
         return _bounds;
      }
      
      public function set title(param1:String) : void
      {
         titleChanged = true;
         _title = param1;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         invalidateDisplayList();
         dispatchEvent(new Event("titleChanged"));
      }
      
      public function get showTitleBar() : Boolean
      {
         return _showTitleBar;
      }
      
      private function windowMinimizeHandler(param1:Event) : void
      {
         if(true)
         {
            stage.nativeWindow.minimize();
         }
         removeEventListener(EffectEvent.EFFECT_END,windowMinimizeHandler);
      }
      
      public function set menu(param1:FlexNativeMenu) : void
      {
         _menu = param1;
         menuChanged = true;
      }
      
      public function get statusBar() : mx.core.UIComponent
      {
         return _statusBar;
      }
      
      [Bindable("windowComplete")]
      [Bindable("maxWidthChanged")]
      override public function get maxWidth() : Number
      {
         if(Boolean(nativeWindow) && !maxWidthChanged)
         {
            return nativeWindow.maxSize.x - chromeWidth();
         }
         return _maxWidth;
      }
      
      private function window_boundsHandler(param1:NativeWindowBoundsEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc2_:Rectangle = param1.afterBounds;
         if(param1.type == NativeWindowBoundsEvent.MOVING)
         {
            dispatchEvent(param1);
            if(param1.isDefaultPrevented())
            {
               return;
            }
         }
         else
         {
            dispatchEvent(param1);
            if(param1.isDefaultPrevented())
            {
               return;
            }
            _loc4_ = false;
            if(_loc2_.width < nativeWindow.minSize.x)
            {
               _loc4_ = true;
               if(_loc2_.x != param1.beforeBounds.x && !isNaN(oldX))
               {
                  _loc2_.x = oldX;
               }
               _loc2_.width = nativeWindow.minSize.x;
            }
            else if(_loc2_.width > nativeWindow.maxSize.x)
            {
               _loc4_ = true;
               if(_loc2_.x != param1.beforeBounds.x && !isNaN(oldX))
               {
                  _loc2_.x = oldX;
               }
               _loc2_.width = nativeWindow.maxSize.x;
            }
            if(_loc2_.height < nativeWindow.minSize.y)
            {
               _loc4_ = true;
               if(param1.afterBounds.y != param1.beforeBounds.y && !isNaN(oldY))
               {
                  _loc2_.y = oldY;
               }
               _loc2_.height = nativeWindow.minSize.y;
            }
            else if(_loc2_.height > nativeWindow.maxSize.y)
            {
               _loc4_ = true;
               if(param1.afterBounds.y != param1.beforeBounds.y && !isNaN(oldY))
               {
                  _loc2_.y = oldY;
               }
               _loc2_.height = nativeWindow.maxSize.y;
            }
            if(_loc4_)
            {
               param1.preventDefault();
               stage.nativeWindow.bounds = _loc2_;
            }
         }
         oldX = _loc2_.x;
         oldY = _loc2_.y;
      }
      
      public function get showGripper() : Boolean
      {
         return _showGripper;
      }
      
      public function maximize() : void
      {
         var _loc1_:NativeWindowDisplayStateEvent = null;
         if(!nativeWindow || true || false)
         {
            return;
         }
         if(stage.nativeWindow.displayState != NativeWindowDisplayState.MAXIMIZED)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,stage.nativeWindow.displayState,NativeWindowDisplayState.MAXIMIZED);
            stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               toMax = true;
               invalidateProperties();
               invalidateSize();
            }
         }
      }
      
      private function windowMaximizeHandler(param1:Event) : void
      {
         removeEventListener(EffectEvent.EFFECT_END,windowMaximizeHandler);
         if(true)
         {
            stage.nativeWindow.maximize();
         }
      }
      
      private function nativeWindow_deactivateHandler(param1:Event) : void
      {
         dispatchEvent(new AIREvent(AIREvent.WINDOW_DEACTIVATE));
      }
      
      public function get nativeWindow() : NativeWindow
      {
         if(Boolean(systemManager) && false)
         {
            return systemManager.stage.nativeWindow;
         }
         return null;
      }
      
      [Bindable("titleIconChanged")]
      public function get titleIcon() : Class
      {
         return _titleIcon;
      }
      
      private function creationCompleteHandler(param1:Event = null) : void
      {
         systemManager.stage.nativeWindow.addEventListener("closing",window_closingHandler);
         systemManager.stage.nativeWindow.addEventListener("close",window_closeHandler,false,0,true);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVING,window_boundsHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVE,window_moveHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZING,window_boundsHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE,window_resizeHandler);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         setVisible(param1);
      }
      
      public function get alwaysInFront() : Boolean
      {
         if(Boolean(_nativeWindow) && true)
         {
            return nativeWindow.alwaysInFront;
         }
         return _alwaysInFront;
      }
      
      public function orderToBack() : Boolean
      {
         if(Boolean(nativeWindow) && true)
         {
            return nativeWindow.orderToBack();
         }
         return false;
      }
      
      public function set minimizable(param1:Boolean) : void
      {
         if(!_nativeWindow)
         {
            _minimizable = param1;
            invalidateProperties();
         }
      }
      
      private function windowUnminimizeHandler(param1:Event) : void
      {
         removeEventListener(EffectEvent.EFFECT_END,windowUnminimizeHandler);
      }
      
      private function window_closingHandler(param1:Event) : void
      {
         var _loc2_:Event = new Event("closing",true,true);
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
         else if(getStyle("closeEffect") && stage.nativeWindow.transparent == true)
         {
            addEventListener(EffectEvent.EFFECT_END,window_closeEffectEndHandler);
            dispatchEvent(new Event("windowClose"));
            param1.preventDefault();
         }
      }
      
      [Bindable("statusBarFactoryChanged")]
      public function get statusBarFactory() : mx.core.IFactory
      {
         return _statusBarFactory;
      }
      
      public function activate() : void
      {
         if(true)
         {
            _nativeWindow.activate();
         }
      }
      
      private function windowUnmaximizeHandler(param1:Event) : void
      {
         removeEventListener(EffectEvent.EFFECT_END,windowUnmaximizeHandler);
         if(true)
         {
            stage.nativeWindow.restore();
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:String = null;
         var _loc2_:CSSStyleDeclaration = null;
         width = _bounds.width;
         height = _bounds.height;
         super.createChildren();
         if(getStyle("showFlexChrome") == false || getStyle("showFlexChrome") == "false")
         {
            setStyle("borderStyle","none");
            setStyle("backgroundAlpha",0);
            return;
         }
         if(systemManager.stage.nativeWindow.type != "utility")
         {
            if(!_statusBar)
            {
               _statusBar = statusBarFactory.newInstance();
               _statusBar.styleName = new StyleProxy(this,statusBarStyleFilters);
               rawChildren.addChild(DisplayObject(_statusBar));
               showStatusBarChanged = true;
               statusBarFactoryChanged = false;
            }
         }
         if(!gripper)
         {
            gripper = new Button();
            _loc1_ = getStyle("gripperStyleName");
            if(_loc1_)
            {
               _loc2_ = StyleManager.getStyleDeclaration("." + _loc1_);
               gripper.styleName = _loc1_;
            }
            gripper.tabEnabled = false;
            rawChildren.addChild(gripper);
            gripperHit = new Sprite();
            rawChildren.addChild(gripperHit);
            gripperHit.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         }
         if(systemManager.stage.nativeWindow.systemChrome != "none")
         {
            setStyle("borderStyle","none");
            return;
         }
         if(!_titleBar)
         {
            _titleBar = titleBarFactory.newInstance();
            _titleBar.styleName = new StyleProxy(this,titleBarStyleFilters);
            rawChildren.addChild(DisplayObject(titleBar));
            showTitleBarChanged = true;
         }
      }
      
      public function set systemChrome(param1:String) : void
      {
         if(!_nativeWindow)
         {
            _systemChrome = param1;
            invalidateProperties();
         }
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
      }
      
      public function set maximizable(param1:Boolean) : void
      {
         if(!_nativeWindow)
         {
            _maximizable = param1;
            invalidateProperties();
         }
      }
      
      override public function set minWidth(param1:Number) : void
      {
         _minWidth = param1;
         minWidthChanged = true;
         invalidateProperties();
      }
      
      public function getStatusBarHeight() : Number
      {
         if(_statusBar)
         {
            return _statusBar.getExplicitOrMeasuredHeight();
         }
         return 0;
      }
      
      [Bindable("heightChanged")]
      override public function get height() : Number
      {
         return _bounds.height;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function orderToFront() : Boolean
      {
         if(Boolean(nativeWindow) && true)
         {
            return nativeWindow.orderToFront();
         }
         return false;
      }
      
      private function window_displayStateChangeHandler(param1:NativeWindowDisplayStateEvent) : void
      {
         dispatchEvent(param1);
         height = stage.stageHeight;
         width = stage.stageWidth;
      }
      
      protected function get titleBarStyleFilters() : Object
      {
         return _titleBarStyleFilters;
      }
      
      public function orderInFrontOf(param1:IWindow) : Boolean
      {
         if(Boolean(nativeWindow) && true)
         {
            return nativeWindow.orderInFrontOf(param1.nativeWindow);
         }
         return false;
      }
      
      private function nativeApplication_activateHandler(param1:Event) : void
      {
         dispatchEvent(new AIREvent(AIREvent.APPLICATION_ACTIVATE));
      }
      
      public function get transparent() : Boolean
      {
         return _transparent;
      }
      
      private function startMove(param1:MouseEvent) : void
      {
         addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
         prevX = param1.stageX;
         prevY = param1.stageY;
      }
      
      override public function set maxHeight(param1:Number) : void
      {
         _maxHeight = param1;
         maxHeightChanged = true;
         invalidateProperties();
      }
      
      private function preinitializeHandler(param1:FlexEvent) : void
      {
         systemManager.stage.nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,window_displayStateChangingHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,window_displayStateChangeHandler);
      }
      
      public function set resizable(param1:Boolean) : void
      {
         if(!_nativeWindow)
         {
            _resizable = param1;
            invalidateProperties();
         }
      }
      
      override protected function measure() : void
      {
         if(maximized)
         {
            maximized = false;
            if(true)
            {
               systemManager.stage.nativeWindow.maximize();
            }
         }
         super.measure();
      }
      
      public function get menu() : FlexNativeMenu
      {
         return _menu;
      }
      
      private function window_displayStateChangingHandler(param1:NativeWindowDisplayStateEvent) : void
      {
         dispatchEvent(param1);
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.afterDisplayState == NativeWindowDisplayState.MINIMIZED)
         {
            if(getStyle("minimizeEffect"))
            {
               param1.preventDefault();
               addEventListener(EffectEvent.EFFECT_END,windowMinimizeHandler);
               dispatchEvent(new Event("windowMinimize"));
            }
         }
         else if(param1.beforeDisplayState == NativeWindowDisplayState.MINIMIZED)
         {
            addEventListener(EffectEvent.EFFECT_END,windowUnminimizeHandler);
            dispatchEvent(new Event("windowUnminimize"));
         }
      }
      
      private function window_closeEffectEndHandler(param1:Event) : void
      {
         removeEventListener(EffectEvent.EFFECT_END,window_closeEffectEndHandler);
         if(true)
         {
            stage.nativeWindow.close();
         }
      }
      
      protected function set bounds(param1:Rectangle) : void
      {
         _bounds = param1;
         boundsChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
      }
      
      public function get closed() : Boolean
      {
         return nativeWindow.closed;
      }
      
      public function set showTitleBar(param1:Boolean) : void
      {
         if(_showTitleBar == param1)
         {
            return;
         }
         _showTitleBar = param1;
         showTitleBarChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      private function chromeWidth() : Number
      {
         return 0 - systemManager.stage.stageWidth;
      }
      
      override public function get cursorManager() : ICursorManager
      {
         return _cursorManager;
      }
      
      private function closeButton_clickHandler(param1:Event) : void
      {
         if(true)
         {
            stage.nativeWindow.close();
         }
      }
      
      private function nativeWindow_activateHandler(param1:Event) : void
      {
         dispatchEvent(new AIREvent(AIREvent.WINDOW_ACTIVATE));
      }
      
      override public function set maxWidth(param1:Number) : void
      {
         _maxWidth = param1;
         maxWidthChanged = true;
         invalidateProperties();
      }
      
      override public function validateDisplayList() : void
      {
         var _loc1_:Graphics = null;
         super.validateDisplayList();
         if(Capabilities.os.substring(0,3) == "Mac" && systemChrome == "standard")
         {
            if((horizontalScrollBar || verticalScrollBar) && !(Boolean(horizontalScrollBar) && Boolean(verticalScrollBar)) && !showStatusBar)
            {
               if(!whiteBox)
               {
                  whiteBox = new FlexShape();
                  whiteBox.name = "whiteBox";
                  _loc1_ = whiteBox.graphics;
                  _loc1_.beginFill(16777215);
                  _loc1_.drawRect(0,0,!!verticalScrollBar ? 0 : 15,!!horizontalScrollBar ? 0 : 15);
                  _loc1_.endFill();
                  rawChildren.addChild(whiteBox);
               }
               whiteBox.visible = true;
               if(horizontalScrollBar)
               {
                  horizontalScrollBar.setActualSize(0 - 0,horizontalScrollBar.height);
               }
               if(verticalScrollBar)
               {
                  verticalScrollBar.setActualSize(verticalScrollBar.width,0 - 0);
               }
               whiteBox.x = systemManager.stage.stageWidth - 0;
               whiteBox.y = systemManager.stage.stageHeight - 0;
            }
            else if(!(Boolean(horizontalScrollBar) && Boolean(verticalScrollBar)))
            {
               if(whiteBox)
               {
                  rawChildren.removeChild(whiteBox);
                  whiteBox = null;
               }
            }
         }
         else if(gripper && showGripper && !showStatusBar)
         {
            if(whiteBox)
            {
               whiteBox.visible = false;
               if(false)
               {
                  verticalScrollBar.setActualSize(verticalScrollBar.width,0 - (0 - 0));
               }
               if(false)
               {
                  horizontalScrollBar.setActualSize(0 - (0 - 0),horizontalScrollBar.height);
               }
            }
            else if(horizontalScrollBar)
            {
               horizontalScrollBar.setActualSize(0 - 0,horizontalScrollBar.height);
            }
            else if(verticalScrollBar)
            {
               verticalScrollBar.setActualSize(verticalScrollBar.width,0 - 0);
            }
         }
         else if(whiteBox)
         {
            whiteBox.visible = true;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 < minWidth)
         {
            param1 = minWidth;
         }
         else if(param1 > maxWidth)
         {
            param1 = maxWidth;
         }
         _bounds.width = param1;
         boundsChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         dispatchEvent(new Event("widthChanged"));
      }
      
      private function initManagers(param1:ISystemManager) : void
      {
         if(param1.isTopLevel())
         {
            focusManager = new FocusManager(this);
            param1.activate(this);
            _cursorManager = new CursorManagerImpl(param1);
         }
      }
      
      override public function initialize() : void
      {
         var _loc2_:Object = null;
         var _loc1_:ISystemManager = systemManager;
         if(mx_internal::documentDescriptor)
         {
            creationPolicy = mx_internal::documentDescriptor.properties.creationPolicy;
            if(creationPolicy == null || false)
            {
               creationPolicy = ContainerCreationPolicy.AUTO;
            }
            _loc2_ = mx_internal::documentDescriptor.properties;
            if(_loc2_.width != null)
            {
               width = _loc2_.width;
               delete _loc2_.width;
            }
            if(_loc2_.height != null)
            {
               height = _loc2_.height;
               delete _loc2_.height;
            }
            mx_internal::documentDescriptor.events = null;
         }
         super.initialize();
      }
      
      public function get maximizable() : Boolean
      {
         return _maximizable;
      }
      
      public function set showGripper(param1:Boolean) : void
      {
         if(_showGripper == param1)
         {
            return;
         }
         _showGripper = param1;
         showGripperChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function get systemChrome() : String
      {
         return _systemChrome;
      }
      
      [Bindable("windowComplete")]
      [Bindable("maxHeightChanged")]
      override public function get maxHeight() : Number
      {
         if(Boolean(nativeWindow) && !maxHeightChanged)
         {
            return nativeWindow.maxSize.y - chromeHeight();
         }
         return _maxHeight;
      }
      
      private function startResize(param1:String) : void
      {
         if(resizable && true)
         {
            stage.nativeWindow.startResize(param1);
         }
      }
      
      override public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
         if(!_nativeWindow)
         {
            _nativeWindowVisible = param1;
            invalidateProperties();
         }
         else if(true)
         {
            if(param1)
            {
               _nativeWindow.visible = param1;
            }
            else if(getStyle("hideEffect") && initialized && mx_internal::$visible != param1)
            {
               addEventListener(EffectEvent.EFFECT_END,hideEffectEndHandler);
            }
            else
            {
               _nativeWindow.visible = param1;
            }
         }
         super.setVisible(param1,param2);
      }
      
      private function nativeApplication_networkChangeHandler(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      private function hideEffectEndHandler(param1:Event) : void
      {
         if(true)
         {
            _nativeWindow.visible = false;
         }
         removeEventListener(EffectEvent.EFFECT_END,hideEffectEndHandler);
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(true)
         {
            if(!(getStyle("showFlexChrome") == "false" || getStyle("showFlexChrome") == false))
            {
               if(param1 == null || param1 == "headerHeight" || param1 == "gripperPadding")
               {
                  mx_internal::invalidateViewMetricsAndPadding();
                  invalidateDisplayList();
                  invalidateSize();
               }
            }
         }
      }
      
      [Bindable("widthChanged")]
      override public function get width() : Number
      {
         return _bounds.width;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:NativeWindowInitOptions = null;
         var _loc2_:WindowedSystemManager = null;
         var _loc3_:NativeApplication = null;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         super.commitProperties();
         if(flagForOpen && !_nativeWindow)
         {
            _loc1_ = new NativeWindowInitOptions();
            _loc1_.maximizable = _maximizable;
            _loc1_.minimizable = _minimizable;
            _loc1_.resizable = _resizable;
            _loc1_.type = _type;
            _loc1_.systemChrome = _systemChrome;
            _loc1_.transparent = _transparent;
            _nativeWindow = new NativeWindow(_loc1_);
            _loc2_ = new WindowedSystemManager(this);
            _nativeWindow.stage.addChild(_loc2_);
            systemManager = _loc2_;
            _loc2_.mx_internal::window = this;
            _nativeWindow.alwaysInFront = _alwaysInFront;
            initManagers(_loc2_);
            addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
            _loc3_ = NativeApplication.nativeApplication;
            _loc3_.addEventListener(Event.ACTIVATE,nativeApplication_activateHandler,false,0,true);
            _loc3_.addEventListener(Event.DEACTIVATE,nativeApplication_deactivateHandler,false,0,true);
            _loc3_.addEventListener(Event.NETWORK_CHANGE,nativeApplication_networkChangeHandler,false,0,true);
            _nativeWindow.addEventListener("activate",nativeWindow_activateHandler,false,0,true);
            _nativeWindow.addEventListener("deactivate",nativeWindow_deactivateHandler,false,0,true);
            addEventListener(Event.ENTER_FRAME,enterFrameHandler);
            _loc4_ = StyleManager.mx_internal::stylesRoot;
            _loc2_.mx_internal::addWindow(this);
         }
         if(minWidthChanged || minHeightChanged)
         {
            _loc5_ = minWidthChanged ? _minWidth + chromeWidth() : Number(nativeWindow.minSize.x);
            _loc6_ = minHeightChanged ? _minHeight + chromeHeight() : Number(nativeWindow.minSize.y);
            nativeWindow.minSize = new Point(_loc5_,_loc6_);
            if(minWidthChanged)
            {
               minWidthChanged = false;
               if(width < minWidth)
               {
                  width = minWidth;
               }
               dispatchEvent(new Event("minWidthChanged"));
            }
            if(minHeightChanged)
            {
               minHeightChanged = false;
               if(height < minHeight)
               {
                  height = minHeight;
               }
               dispatchEvent(new Event("minHeightChanged"));
            }
         }
         if(maxWidthChanged || maxHeightChanged)
         {
            _loc7_ = maxWidthChanged ? _maxWidth + chromeWidth() : Number(nativeWindow.maxSize.x);
            _loc8_ = maxHeightChanged ? _maxHeight + chromeHeight() : Number(nativeWindow.maxSize.y);
            nativeWindow.maxSize = new Point(_loc7_,_loc8_);
            if(maxWidthChanged)
            {
               maxWidthChanged = false;
               if(width > maxWidth)
               {
                  width = maxWidth;
               }
               dispatchEvent(new Event("maxWidthChanged"));
            }
            if(maxHeightChanged)
            {
               maxHeightChanged = false;
               if(height > maxHeight)
               {
                  height = maxHeight;
               }
               dispatchEvent(new Event("maxHeightChanged"));
            }
         }
         if(boundsChanged)
         {
            _loc9_ = 0;
            _loc10_ = 0;
            systemManager.stage.stageWidth = _loc9_;
            systemManager.stage.stageHeight = _loc10_;
            boundsChanged = false;
         }
         if(menuChanged && true)
         {
            menuChanged = false;
            if(menu == null)
            {
               if(false)
               {
                  nativeWindow.menu = null;
               }
            }
            else if(false)
            {
               if(false)
               {
                  nativeWindow.menu = menu.nativeMenu;
               }
            }
         }
         if(titleBarFactoryChanged)
         {
            if(_titleBar)
            {
               rawChildren.removeChild(DisplayObject(titleBar));
               _titleBar = null;
            }
            _titleBar = titleBarFactory.newInstance();
            _titleBar.styleName = new StyleProxy(this,titleBarStyleFilters);
            rawChildren.addChild(DisplayObject(titleBar));
            titleBarFactoryChanged = false;
            invalidateDisplayList();
         }
         if(showTitleBarChanged)
         {
            if(_titleBar)
            {
               _titleBar.visible = _showTitleBar;
            }
            showTitleBarChanged = false;
         }
         if(titleIconChanged)
         {
            if(Boolean(_titleBar) && "titleIcon" in _titleBar)
            {
               _titleBar["titleIcon"] = _titleIcon;
            }
            titleIconChanged = false;
         }
         if(titleChanged)
         {
            if(true)
            {
               systemManager.stage.nativeWindow.title = _title;
            }
            if(Boolean(_titleBar) && "title" in _titleBar)
            {
               _titleBar["title"] = _title;
            }
            titleChanged = false;
         }
         if(statusBarFactoryChanged)
         {
            if(_statusBar)
            {
               rawChildren.removeChild(DisplayObject(_statusBar));
               _statusBar = null;
            }
            _statusBar = statusBarFactory.newInstance();
            _statusBar.styleName = new StyleProxy(this,statusBarStyleFilters);
            rawChildren.addChild(DisplayObject(_statusBar));
            if(gripper)
            {
               _loc11_ = int(rawChildren.getChildIndex(DisplayObject(gripper)));
               rawChildren.setChildIndex(DisplayObject(_statusBar),_loc11_);
            }
            statusBarFactoryChanged = false;
            showStatusBarChanged = true;
            statusChanged = true;
            invalidateDisplayList();
         }
         if(showStatusBarChanged)
         {
            if(_statusBar)
            {
               _statusBar.visible = _showStatusBar;
            }
            showStatusBarChanged = false;
         }
         if(statusChanged)
         {
            if(Boolean(_statusBar) && "status" in _statusBar)
            {
               _statusBar["status"] = _status;
            }
            statusChanged = false;
         }
         if(showGripperChanged)
         {
            if(gripper)
            {
               gripper.visible = _showGripper;
               gripperHit.visible = _showGripper;
            }
            showGripperChanged = false;
         }
         if(toMax)
         {
            toMax = false;
            if(true)
            {
               nativeWindow.maximize();
            }
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = null;
         if(Boolean(nativeWindow) && true)
         {
            _loc3_ = nativeWindow.bounds;
            _loc3_.x = param1;
            _loc3_.y = param2;
            nativeWindow.bounds = _loc3_;
         }
      }
      
      public function set titleBarFactory(param1:mx.core.IFactory) : void
      {
         _titleBarFactory = param1;
         titleBarFactoryChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("titleBarFactoryChanged"));
      }
      
      public function set status(param1:String) : void
      {
         _status = param1;
         statusChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         dispatchEvent(new Event("statusChanged"));
      }
      
      private function window_resizeHandler(param1:NativeWindowBoundsEvent) : void
      {
         mx_internal::invalidateViewMetricsAndPadding();
         invalidateDisplayList();
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         bounds.x = stage.x;
         bounds.y = stage.y;
         bounds.width = stage.stageWidth;
         bounds.height = stage.stageHeight;
         validateNow();
         var _loc4_:FlexNativeWindowBoundsEvent = new FlexNativeWindowBoundsEvent(FlexNativeWindowBoundsEvent.WINDOW_RESIZE,param1.bubbles,param1.cancelable,param1.beforeBounds,param1.afterBounds);
         dispatchEvent(_loc4_);
         if(_loc2_)
         {
            dispatchEvent(new Event("widthChanged"));
         }
         if(_loc3_)
         {
            dispatchEvent(new Event("heightChanged"));
         }
      }
      
      public function set titleIcon(param1:Class) : void
      {
         _titleIcon = param1;
         titleIconChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         invalidateDisplayList();
         dispatchEvent(new Event("titleIconChanged"));
      }
      
      public function set alwaysInFront(param1:Boolean) : void
      {
         _alwaysInFront = param1;
         if(Boolean(_nativeWindow) && true)
         {
            nativeWindow.alwaysInFront = param1;
         }
      }
      
      [Bindable("titleBarFactoryChanged")]
      public function get titleBarFactory() : mx.core.IFactory
      {
         return _titleBarFactory;
      }
      
      [Bindable("statusChanged")]
      public function get status() : String
      {
         return _status;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:mx.core.EdgeMetrics = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         if(true)
         {
            super.updateDisplayList(param1,param2);
            resizeWidth = isNaN(explicitWidth);
            resizeHeight = isNaN(explicitHeight);
            if(resizeWidth || resizeHeight)
            {
               resizeHandler(new Event(Event.RESIZE));
               if(!resizeHandlerAdded)
               {
                  systemManager.addEventListener(Event.RESIZE,resizeHandler,false,0,true);
                  resizeHandlerAdded = true;
               }
            }
            else if(resizeHandlerAdded)
            {
               systemManager.removeEventListener(Event.RESIZE,resizeHandler);
               resizeHandlerAdded = false;
            }
            createBorder();
            _loc3_ = borderMetrics;
            _loc4_ = 10;
            _loc5_ = 10;
            if(_statusBar)
            {
               _statusBar.move(_loc3_.left,param2 - _loc3_.bottom - getStatusBarHeight());
               _statusBar.setActualSize(param1 - _loc3_.left - _loc3_.right,getStatusBarHeight());
            }
            if(systemManager.stage.nativeWindow.systemChrome != "none")
            {
               return;
            }
            _loc6_ = String(getStyle("buttonAlignment"));
            if(titleBar)
            {
               titleBar.move(_loc3_.left,_loc3_.top);
               titleBar.setActualSize(param1 - _loc3_.left - _loc3_.right,getHeaderHeight());
            }
            if(Boolean(titleBar) && Boolean(controlBar))
            {
               controlBar.move(0,titleBar.height);
            }
            if(Boolean(gripper) && showGripper)
            {
               _loc7_ = getStyle("gripperPadding");
               gripper.setActualSize(gripper.measuredWidth,gripper.measuredHeight);
               gripperHit.graphics.beginFill(16777215,0.0001);
               gripperHit.graphics.drawRect(0,0,gripper.width + 2 * _loc7_,gripper.height + 2 * _loc7_);
               gripper.move(param1 - 0 - _loc7_,param2 - 0 - _loc7_);
               gripperHit.x = 0 - _loc7_;
               gripperHit.y = 0 - _loc7_;
            }
         }
      }
      
      public function close() : void
      {
         var _loc1_:Event = null;
         if(Boolean(_nativeWindow) && true)
         {
            _loc1_ = new Event("closing",false,true);
            stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               stage.nativeWindow.close();
               _nativeWindow = null;
               systemManager.removeChild(this);
            }
         }
      }
      
      private function resizeHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(resizeWidth)
         {
            if(isNaN(percentWidth))
            {
               _loc2_ = DisplayObject(systemManager).width;
            }
            else
            {
               super.percentWidth = Math.max(percentWidth,0);
               super.percentWidth = Math.min(percentWidth,100);
               _loc2_ = percentWidth * 0 / 100;
            }
            if(!isNaN(explicitMaxWidth))
            {
               _loc2_ = Math.min(_loc2_,explicitMaxWidth);
            }
            if(!isNaN(explicitMinWidth))
            {
               _loc2_ = Math.max(_loc2_,explicitMinWidth);
            }
         }
         else
         {
            _loc2_ = width;
         }
         if(resizeHeight)
         {
            if(isNaN(percentHeight))
            {
               _loc3_ = DisplayObject(systemManager).height;
            }
            else
            {
               super.percentHeight = Math.max(percentHeight,0);
               super.percentHeight = Math.min(percentHeight,100);
               _loc3_ = percentHeight * 0 / 100;
            }
            if(!isNaN(explicitMaxHeight))
            {
               _loc3_ = Math.min(_loc3_,explicitMaxHeight);
            }
            if(!isNaN(explicitMinHeight))
            {
               _loc3_ = Math.max(_loc3_,explicitMinHeight);
            }
         }
         else
         {
            _loc3_ = height;
         }
         if(_loc2_ != width || _loc3_ != height)
         {
            invalidateProperties();
            invalidateSize();
         }
         setActualSize(_loc2_,_loc3_);
         invalidateDisplayList();
      }
   }
}
