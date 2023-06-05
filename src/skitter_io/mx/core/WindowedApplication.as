package mx.core
{
   import flash.desktop.DockIcon;
   import flash.desktop.NativeApplication;
   import flash.desktop.SystemTrayIcon;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowDisplayState;
   import flash.display.NativeWindowResize;
   import flash.display.NativeWindowSystemChrome;
   import flash.display.NativeWindowType;
   import flash.display.Screen;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.InvokeEvent;
   import flash.events.MouseEvent;
   import flash.events.NativeWindowBoundsEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import mx.controls.Alert;
   import mx.controls.Button;
   import mx.controls.FlexNativeMenu;
   import mx.controls.HTML;
   import mx.core.windowClasses.StatusBar;
   import mx.core.windowClasses.TitleBar;
   import mx.events.AIREvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexNativeWindowBoundsEvent;
   import mx.managers.DragManager;
   import mx.managers.NativeDragManagerImpl;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import mx.styles.StyleProxy;
   
   public class WindowedApplication extends Application implements IWindow
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
      
      private static const MOUSE_SLACK:Number = 5;
      
      private static var _forceLinkNDMI:NativeDragManagerImpl;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var showGripperChanged:Boolean = true;
      
      private var shouldShowTitleBar:Boolean;
      
      private var invokesPending:Boolean = true;
      
      private var _maxWidth:Number = 0;
      
      mx_internal var titleBarBackground:mx.core.IFlexDisplayObject;
      
      private var _maxHeight:Number = 0;
      
      private var windowBoundsChanged:Boolean = true;
      
      private var _menu:FlexNativeMenu;
      
      private var boundsChanged:Boolean = false;
      
      private var _showStatusBar:Boolean = true;
      
      private var minHeightChanged:Boolean = false;
      
      private var menuChanged:Boolean = false;
      
      private var statusChanged:Boolean = false;
      
      private var titleIconChanged:Boolean = false;
      
      private var prevX:Number;
      
      private var prevY:Number;
      
      private var maxHeightChanged:Boolean = false;
      
      private var gripper:Button;
      
      private var _showTitleBar:Boolean = true;
      
      private var _minHeight:Number = 0;
      
      private var lastDisplayState:String = "normal";
      
      private var _dockIconMenu:FlexNativeMenu;
      
      private var _nativeWindow:NativeWindow;
      
      private var _nativeWindowVisible:Boolean = true;
      
      mx_internal var statusBarBackground:mx.core.IFlexDisplayObject;
      
      private var showTitleBarChanged:Boolean = true;
      
      private var toMax:Boolean = false;
      
      private var _alwaysInFront:Boolean = false;
      
      private var gripperHit:Sprite;
      
      private var _showGripper:Boolean = true;
      
      private var oldX:Number;
      
      private var oldY:Number;
      
      private var initialInvokes:Array;
      
      private var _status:String = "";
      
      private var ucCount:Number = 0;
      
      private var _gripperPadding:Number = 3;
      
      private var _systemTrayIconMenu:FlexNativeMenu;
      
      private var _statusBar:mx.core.UIComponent;
      
      private var titleChanged:Boolean = false;
      
      private var _title:String = "";
      
      private var _statusBarFactory:mx.core.IFactory;
      
      private var statusBarFactoryChanged:Boolean = false;
      
      private var _titleIcon:Class;
      
      private var appViewMetrics:mx.core.EdgeMetrics;
      
      private var minWidthChanged:Boolean = false;
      
      private var maxWidthChanged:Boolean = false;
      
      private var activateOnOpen:Boolean = true;
      
      private var _titleBarFactory:mx.core.IFactory;
      
      private var titleBarFactoryChanged:Boolean = false;
      
      private var showStatusBarChanged:Boolean = true;
      
      private var _bounds:Rectangle;
      
      private var _minWidth:Number = 0;
      
      private var _titleBar:mx.core.UIComponent;
      
      public function WindowedApplication()
      {
         _bounds = new Rectangle(0,0,0,0);
         _statusBarFactory = new ClassFactory(StatusBar);
         _titleBarFactory = new ClassFactory(TitleBar);
         super();
         addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         addEventListener(FlexEvent.PREINITIALIZE,preinitializeHandler);
         addEventListener(FlexEvent.UPDATE_COMPLETE,updateComplete_handler);
         addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
         var _loc1_:NativeApplication = NativeApplication.nativeApplication;
         _loc1_.addEventListener(Event.ACTIVATE,nativeApplication_activateHandler);
         _loc1_.addEventListener(Event.DEACTIVATE,nativeApplication_deactivateHandler);
         _loc1_.addEventListener(Event.NETWORK_CHANGE,nativeApplication_networkChangeHandler);
         _loc1_.addEventListener(InvokeEvent.INVOKE,nativeApplication_invokeHandler);
         initialInvokes = new Array();
         DragManager.isDragging;
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
         removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         if(stage.nativeWindow.closed)
         {
            return;
         }
         stage.nativeWindow.visible = _nativeWindowVisible;
         dispatchEvent(new AIREvent(AIREvent.WINDOW_COMPLETE));
         dispatchPendingInvokes();
         if(_nativeWindowVisible && activateOnOpen)
         {
            stage.nativeWindow.activate();
         }
         stage.nativeWindow.alwaysInFront = _alwaysInFront;
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
      
      private function window_closeHandler(param1:Event) : void
      {
         dispatchEvent(new Event("close"));
      }
      
      private function nativeApplication_deactivateHandler(param1:Event) : void
      {
         dispatchEvent(new AIREvent(AIREvent.APPLICATION_DEACTIVATE));
      }
      
      override public function set minHeight(param1:Number) : void
      {
         _minHeight = param1;
         minHeightChanged = true;
         invalidateProperties();
      }
      
      private function chromeHeight() : Number
      {
         return 0 - systemManager.stage.stageHeight;
      }
      
      public function get showStatusBar() : Boolean
      {
         return _showStatusBar;
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
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         stage.nativeWindow.x += param1.stageX - prevX;
         stage.nativeWindow.y += param1.stageY - prevY;
      }
      
      [Bindable("titleChanged")]
      public function get title() : String
      {
         return _title;
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
         if(_showStatusBar)
         {
            _loc4_ = getStatusBarHeight();
            if(!isNaN(_loc4_))
            {
               _loc2_.bottom += _loc4_;
            }
         }
         return _loc2_;
      }
      
      private function window_moveHandler(param1:NativeWindowBoundsEvent) : void
      {
         dispatchEvent(new FlexNativeWindowBoundsEvent(FlexNativeWindowBoundsEvent.WINDOW_MOVE,param1.bubbles,param1.cancelable,param1.beforeBounds,param1.afterBounds));
      }
      
      public function get applicationID() : String
      {
         return nativeApplication.applicationID;
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
      
      public function get minimizable() : Boolean
      {
         if(true)
         {
            return nativeWindow.minimizable;
         }
         return false;
      }
      
      private function dispatchPendingInvokes() : void
      {
         var _loc1_:* = null;
         invokesPending = false;
         for each(_loc1_ in initialInvokes)
         {
            dispatchEvent(_loc1_);
         }
         initialInvokes = null;
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
      
      public function get systemTrayIconMenu() : FlexNativeMenu
      {
         return _systemTrayIconMenu;
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
      
      public function get resizable() : Boolean
      {
         if(false)
         {
            return false;
         }
         return nativeWindow.resizable;
      }
      
      private function nativeApplication_invokeHandler(param1:InvokeEvent) : void
      {
         if(invokesPending)
         {
            initialInvokes.push(param1);
         }
         else
         {
            dispatchEvent(param1);
         }
      }
      
      protected function get bounds() : Rectangle
      {
         return nativeWindow.bounds;
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
         titleChanged = true;
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
      
      public function get nativeApplication() : NativeApplication
      {
         return NativeApplication.nativeApplication;
      }
      
      override protected function menuItemSelectHandler(param1:Event) : void
      {
         var _loc3_:Rectangle = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:HTML = null;
         var _loc12_:Window = null;
         var _loc2_:File = File.applicationDirectory.resolvePath(viewSourceURL);
         if(_loc2_.exists)
         {
            _loc3_ = Screen.mainScreen.visibleBounds;
            _loc4_ = _loc3_.width;
            _loc5_ = _loc3_.height;
            _loc8_ = (_loc7_ = (_loc6_ = Math.min(_loc4_,_loc5_)) * 0.9) * 0.618;
            _loc9_ = (_loc4_ - _loc7_) / 2;
            _loc10_ = (_loc5_ - _loc8_) / 2;
            (_loc11_ = new HTML()).width = _loc7_;
            _loc11_.height = _loc8_;
            _loc11_.location = _loc2_.url;
            (_loc12_ = new Window()).type = NativeWindowType.UTILITY;
            _loc12_.systemChrome = NativeWindowSystemChrome.STANDARD;
            _loc12_.title = resourceManager.getString("core","viewSource");
            _loc12_.width = _loc7_;
            _loc12_.height = _loc8_;
            _loc12_.addChild(_loc11_);
            _loc12_.addEventListener(FlexNativeWindowBoundsEvent.WINDOW_RESIZE,viewSourceResizeHandler(_loc11_),false,0,true);
            _loc11_.htmlLoader.navigateInSystemBrowser = true;
            addEventListener(Event.CLOSING,viewSourceCloseHandler(_loc12_),false,0,true);
            _loc12_.open();
            _loc12_.move(_loc9_,_loc10_);
         }
         else
         {
            Alert.show(resourceManager.getString("core","badFile"));
         }
      }
      
      private function viewSourceResizeHandler(param1:HTML) : Function
      {
         var html:HTML = param1;
         return function(param1:FlexNativeWindowBoundsEvent):void
         {
            var _loc2_:* = param1.target;
            html.width = _loc2_.width;
            html.height = _loc2_.height;
         };
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
      
      private function windowMinimizeHandler(param1:Event) : void
      {
         if(true)
         {
            stage.nativeWindow.minimize();
         }
         removeEventListener(EffectEvent.EFFECT_END,windowMinimizeHandler);
      }
      
      public function get dockIconMenu() : FlexNativeMenu
      {
         return _dockIconMenu;
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
               windowBoundsChanged = true;
               invalidateProperties();
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
         if(systemManager.stage.nativeWindow.displayState != NativeWindowDisplayState.MAXIMIZED)
         {
            _loc1_ = new NativeWindowDisplayStateEvent(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,false,true,systemManager.stage.nativeWindow.displayState,NativeWindowDisplayState.MAXIMIZED);
            systemManager.stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               invalidateProperties();
               invalidateSize();
               invalidateDisplayList();
               toMax = true;
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
      
      public function set autoExit(param1:Boolean) : void
      {
         nativeApplication.autoExit = param1;
      }
      
      private function nativeWindow_deactivateHandler(param1:Event) : void
      {
         dispatchEvent(new AIREvent(AIREvent.WINDOW_DEACTIVATE));
      }
      
      public function get nativeWindow() : NativeWindow
      {
         if(systemManager != null && false)
         {
            return systemManager.stage.nativeWindow;
         }
         return null;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         setVisible(param1);
      }
      
      public function orderToBack() : Boolean
      {
         if(Boolean(nativeWindow) && true)
         {
            return nativeWindow.orderToBack();
         }
         return false;
      }
      
      [Bindable("titleIconChanged")]
      public function get titleIcon() : Class
      {
         return _titleIcon;
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,enterFrameHandler);
         _nativeWindow = systemManager.stage.nativeWindow;
      }
      
      public function activate() : void
      {
         if(!systemManager.stage.nativeWindow.closed)
         {
            systemManager.stage.nativeWindow.activate();
         }
      }
      
      public function get alwaysInFront() : Boolean
      {
         if(Boolean(_nativeWindow) && true)
         {
            return nativeWindow.alwaysInFront;
         }
         return _alwaysInFront;
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
         super.createChildren();
         if(getStyle("showFlexChrome") == false || getStyle("showFlexChrome") == "false")
         {
            setStyle("borderStyle","none");
            setStyle("backgroundAlpha",0);
            return;
         }
         if(!_statusBar)
         {
            _statusBar = statusBarFactory.newInstance();
            _statusBar.styleName = new StyleProxy(this,statusBarStyleFilters);
            rawChildren.addChild(DisplayObject(_statusBar));
            showStatusBarChanged = true;
            statusBarFactoryChanged = false;
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
            titleBarFactoryChanged = false;
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
            rawChildren.addChild(gripper);
            gripperHit = new Sprite();
            gripperHit.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
            rawChildren.addChild(gripperHit);
         }
      }
      
      public function exit() : void
      {
         nativeApplication.exit();
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
      }
      
      [Bindable("heightChanged")]
      override public function get height() : Number
      {
         return _bounds.height;
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
      
      private function updateComplete_handler(param1:FlexEvent) : void
      {
         if(ucCount == 1)
         {
            dispatchEvent(new Event("initialLayoutComplete"));
            removeEventListener(FlexEvent.UPDATE_COMPLETE,updateComplete_handler);
         }
         else
         {
            ++ucCount;
         }
      }
      
      public function set systemTrayIconMenu(param1:FlexNativeMenu) : void
      {
         _systemTrayIconMenu = param1;
         if(false)
         {
            if(nativeApplication.icon is SystemTrayIcon)
            {
               SystemTrayIcon(nativeApplication.icon).menu = param1.nativeMenu;
            }
         }
      }
      
      public function orderToFront() : Boolean
      {
         if(Boolean(nativeWindow) && true)
         {
            return nativeWindow.orderToFront();
         }
         return false;
      }
      
      public function get type() : String
      {
         if(false)
         {
            return "standard";
         }
         return nativeWindow.type;
      }
      
      protected function get titleBarStyleFilters() : Object
      {
         return _titleBarStyleFilters;
      }
      
      private function window_displayStateChangeHandler(param1:NativeWindowDisplayStateEvent) : void
      {
         dispatchEvent(param1);
         height = systemManager.stage.stageHeight;
         width = systemManager.stage.stageWidth;
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
         if(false)
         {
            return false;
         }
         return nativeWindow.transparent;
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
      
      private function preinitializeHandler(param1:Event = null) : void
      {
         systemManager.stage.nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGING,window_displayStateChangingHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,window_displayStateChangeHandler);
         systemManager.stage.nativeWindow.addEventListener("closing",window_closingHandler);
         systemManager.stage.nativeWindow.addEventListener("close",window_closeHandler,false,0,true);
         if(systemManager.stage.nativeWindow.active)
         {
            dispatchEvent(new AIREvent(AIREvent.WINDOW_ACTIVATE));
         }
         systemManager.stage.nativeWindow.addEventListener("activate",nativeWindow_activateHandler,false,0,true);
         systemManager.stage.nativeWindow.addEventListener("deactivate",nativeWindow_deactivateHandler,false,0,true);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVING,window_boundsHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.MOVE,window_moveHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZING,window_boundsHandler);
         systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE,window_resizeHandler);
         systemManager.stage.addEventListener(FullScreenEvent.FULL_SCREEN,stage_fullScreenHandler);
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
         nativeWindow.bounds = param1;
         boundsChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
      }
      
      public function get closed() : Boolean
      {
         return nativeWindow.closed;
      }
      
      public function get autoExit() : Boolean
      {
         return nativeApplication.autoExit;
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
      
      private function closeButton_clickHandler(param1:Event) : void
      {
         stage.nativeWindow.close();
      }
      
      private function viewSourceCloseHandler(param1:Window) : Function
      {
         var win:Window = param1;
         return function():void
         {
            win.close();
         };
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
      
      public function get systemChrome() : String
      {
         if(false)
         {
            return "";
         }
         return nativeWindow.systemChrome;
      }
      
      override public function validateDisplayList() : void
      {
         var _loc1_:Graphics = null;
         super.validateDisplayList();
         if(true)
         {
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
      }
      
      public function set dockIconMenu(param1:FlexNativeMenu) : void
      {
         _dockIconMenu = param1;
         if(false)
         {
            if(nativeApplication.icon is DockIcon)
            {
               DockIcon(nativeApplication.icon).menu = param1.nativeMenu;
            }
         }
      }
      
      public function get maximizable() : Boolean
      {
         if(true)
         {
            return nativeWindow.maximizable;
         }
         return false;
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
      
      protected function startResize(param1:String) : void
      {
         if(true)
         {
            if(false)
            {
               stage.nativeWindow.startResize(param1);
            }
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
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         super.commitProperties();
         if(minWidthChanged || minHeightChanged)
         {
            _loc1_ = minWidthChanged ? _minWidth + chromeWidth() : Number(nativeWindow.minSize.x);
            _loc2_ = minHeightChanged ? _minHeight + chromeHeight() : Number(nativeWindow.minSize.y);
            nativeWindow.minSize = new Point(_loc1_,_loc2_);
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
            _loc3_ = maxWidthChanged ? _maxWidth + chromeWidth() : Number(nativeWindow.maxSize.x);
            _loc4_ = maxHeightChanged ? _maxHeight + chromeHeight() : Number(nativeWindow.maxSize.y);
            nativeWindow.maxSize = new Point(_loc3_,_loc4_);
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
            systemManager.stage.stageWidth = mx_internal::_width = _bounds.width;
            systemManager.stage.stageHeight = mx_internal::_height = _bounds.height;
            boundsChanged = false;
            dispatchEvent(new Event("widthChanged"));
            dispatchEvent(new Event("heightChanged"));
         }
         if(windowBoundsChanged)
         {
            _bounds.width = mx_internal::_width = systemManager.stage.stageWidth;
            _bounds.height = mx_internal::_height = systemManager.stage.stageHeight;
            windowBoundsChanged = false;
            dispatchEvent(new Event("widthChanged"));
            dispatchEvent(new Event("heightChanged"));
         }
         if(menuChanged && true)
         {
            menuChanged = false;
            if(menu == null)
            {
               if(false)
               {
                  nativeApplication.menu = null;
               }
               else if(false)
               {
                  nativeWindow.menu = null;
               }
            }
            else if(false)
            {
               if(false)
               {
                  nativeApplication.menu = menu.nativeMenu;
               }
               else if(false)
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
            if(titleBar)
            {
               titleBar.visible = _showTitleBar;
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
               _loc5_ = int(rawChildren.getChildIndex(DisplayObject(gripper)));
               rawChildren.setChildIndex(DisplayObject(_statusBar),_loc5_);
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
      
      private function window_resizeHandler(param1:NativeWindowBoundsEvent) : void
      {
         if(!windowBoundsChanged)
         {
            windowBoundsChanged = true;
            invalidateProperties();
            mx_internal::invalidateViewMetricsAndPadding();
            invalidateDisplayList();
            validateNow();
         }
         var _loc2_:FlexNativeWindowBoundsEvent = new FlexNativeWindowBoundsEvent(FlexNativeWindowBoundsEvent.WINDOW_RESIZE,param1.bubbles,param1.cancelable,param1.beforeBounds,param1.afterBounds);
         dispatchEvent(_loc2_);
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
      
      public function set status(param1:String) : void
      {
         _status = param1;
         statusChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         dispatchEvent(new Event("statusChanged"));
      }
      
      private function stage_fullScreenHandler(param1:FullScreenEvent) : void
      {
         if(stage.displayState != lastDisplayState)
         {
            lastDisplayState = stage.displayState;
            if(true || true)
            {
               shouldShowTitleBar = showTitleBar;
               showTitleBar = false;
            }
            else
            {
               showTitleBar = shouldShowTitleBar;
            }
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
         if(true)
         {
            super.updateDisplayList(param1,param2);
            _loc3_ = borderMetrics;
            _loc4_ = 10;
            _loc5_ = 10;
            if(_statusBar)
            {
               _statusBar.move(_loc3_.left,param2 - _loc3_.bottom - getStatusBarHeight());
               _statusBar.setActualSize(param1 - _loc3_.left - _loc3_.right,getStatusBarHeight());
            }
            if(systemManager.stage.nativeWindow.systemChrome != "none" || Boolean(systemManager.stage.nativeWindow.closed))
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
               _gripperPadding = getStyle("gripperPadding");
               gripper.setActualSize(gripper.measuredWidth,gripper.measuredHeight);
               gripperHit.graphics.beginFill(16777215,0.0001);
               gripperHit.graphics.drawRect(0,0,gripper.width + 2 * _gripperPadding,gripper.height + 2 * _gripperPadding);
               gripper.move(param1 - 0 - _gripperPadding,param2 - 0 - _gripperPadding);
               gripperHit.x = 0 - _gripperPadding;
               gripperHit.y = 0 - _gripperPadding;
            }
         }
      }
      
      public function close() : void
      {
         var _loc1_:Event = null;
         if(true)
         {
            _loc1_ = new Event("closing",true,true);
            stage.nativeWindow.dispatchEvent(_loc1_);
            if(!_loc1_.isDefaultPrevented())
            {
               stage.nativeWindow.close();
            }
         }
      }
   }
}
