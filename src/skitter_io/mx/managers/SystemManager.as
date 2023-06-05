package mx.managers
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.text.Font;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import mx.core.EmbeddedFontRegistry;
   import mx.core.EventPriority;
   import mx.core.FlexSprite;
   import mx.core.IChildList;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IInvalidating;
   import mx.core.IRawChildrenContainer;
   import mx.core.ISWFBridgeGroup;
   import mx.core.ISWFBridgeProvider;
   import mx.core.ISWFLoader;
   import mx.core.IUIComponent;
   import mx.core.RSLItem;
   import mx.core.SWFBridgeGroup;
   import mx.core.Singleton;
   import mx.core.TextFieldFactory;
   import mx.core.mx_internal;
   import mx.events.EventListenerRequest;
   import mx.events.FlexChangeEvent;
   import mx.events.FlexEvent;
   import mx.events.InterManagerRequest;
   import mx.events.InvalidateRequestData;
   import mx.events.RSLEvent;
   import mx.events.SWFBridgeEvent;
   import mx.events.SWFBridgeRequest;
   import mx.events.SandboxMouseEvent;
   import mx.managers.systemClasses.EventProxy;
   import mx.managers.systemClasses.PlaceholderData;
   import mx.managers.systemClasses.RemotePopUp;
   import mx.messaging.config.LoaderConfig;
   import mx.preloaders.DownloadProgressBar;
   import mx.preloaders.Preloader;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceBundle;
   import mx.resources.ResourceManager;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   import mx.utils.EventUtil;
   import mx.utils.LoaderUtil;
   import mx.utils.NameUtil;
   import mx.utils.SecurityUtil;
   
   public class SystemManager extends MovieClip implements IChildList, IFlexDisplayObject, IFlexModuleFactory, mx.managers.ISystemManager, ISWFBridgeProvider
   {
      
      private static const IDLE_THRESHOLD:Number = 1000;
      
      mx_internal static var lastSystemManager:mx.managers.SystemManager;
      
      private static const IDLE_INTERVAL:Number = 100;
      
      mx_internal static var allSystemManagers:Dictionary = new Dictionary(true);
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _stage:Stage;
      
      mx_internal var nestLevel:int = 0;
      
      private var currentSandboxEvent:Event;
      
      private var forms:Array;
      
      private var mouseCatcher:Sprite;
      
      private var _height:Number;
      
      private var preloader:Preloader;
      
      private var lastFrame:int;
      
      private var _document:Object;
      
      private var strongReferenceProxies:Dictionary;
      
      private var _rawChildren:mx.managers.SystemRawChildrenList;
      
      private var _topLevelSystemManager:mx.managers.ISystemManager;
      
      private var _toolTipIndex:int = 0;
      
      private var _bridgeToFocusManager:Dictionary;
      
      private var _explicitHeight:Number;
      
      private var idToPlaceholder:Object;
      
      private var _swfBridgeGroup:ISWFBridgeGroup;
      
      private var _toolTipChildren:mx.managers.SystemChildrenList;
      
      private var form:Object;
      
      private var _width:Number;
      
      private var initialized:Boolean = false;
      
      private var _focusPane:Sprite;
      
      private var _fontList:Object = null;
      
      private var isStageRoot:Boolean = true;
      
      private var _popUpChildren:mx.managers.SystemChildrenList;
      
      private var _topMostIndex:int = 0;
      
      private var nextFrameTimer:Timer = null;
      
      mx_internal var topLevel:Boolean = true;
      
      private var weakReferenceProxies:Dictionary;
      
      private var _cursorIndex:int = 0;
      
      private var isBootstrapRoot:Boolean = false;
      
      mx_internal var _mouseY;
      
      private var _numModalWindows:int = 0;
      
      mx_internal var _mouseX;
      
      private var _screen:Rectangle;
      
      mx_internal var idleCounter:int = 0;
      
      private var _cursorChildren:mx.managers.SystemChildrenList;
      
      private var initCallbackFunctions:Array;
      
      private var _noTopMostIndex:int = 0;
      
      private var _applicationIndex:int = 1;
      
      private var isDispatchingResizeEvent:Boolean;
      
      private var idleTimer:Timer;
      
      private var doneExecutingInitCallbacks:Boolean = false;
      
      private var _explicitWidth:Number;
      
      private var eventProxy:EventProxy;
      
      mx_internal var topLevelWindow:IUIComponent;
      
      public function SystemManager()
      {
         initCallbackFunctions = [];
         forms = [];
         weakReferenceProxies = new Dictionary(true);
         strongReferenceProxies = new Dictionary(false);
         super();
         if(stage)
         {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
         }
         if(SystemManagerGlobals.topLevelSystemManagers.length > 0 && !stage)
         {
            mx_internal::topLevel = false;
         }
         if(!stage)
         {
            isStageRoot = false;
         }
         if(mx_internal::topLevel)
         {
            SystemManagerGlobals.topLevelSystemManagers.push(this);
         }
         mx_internal::lastSystemManager = this;
         var _loc1_:Array = info()["compiledLocales"];
         ResourceBundle.mx_internal::locale = _loc1_ != null && _loc1_.length > 0 ? String(_loc1_[0]) : "en_US";
         executeCallbacks();
         stop();
         if(mx_internal::topLevel && currentFrame != 1)
         {
            throw new Error("The SystemManager constructor was called when the currentFrame was at " + currentFrame + " Please add this SWF to bug 129782.");
         }
         if(Boolean(root) && false)
         {
            root.loaderInfo.addEventListener(Event.INIT,initHandler);
         }
      }
      
      public static function getSWFRoot(param1:Object) : DisplayObject
      {
         var p:* = undefined;
         var sm:mx.managers.ISystemManager = null;
         var domain:ApplicationDomain = null;
         var cls:Class = null;
         var object:Object = param1;
         var className:String = getQualifiedClassName(object);
         for(p in mx_internal::allSystemManagers)
         {
            sm = p as mx.managers.ISystemManager;
            domain = sm.loaderInfo.applicationDomain;
            try
            {
               cls = Class(domain.getDefinition(className));
               if(object is cls)
               {
                  return sm as DisplayObject;
               }
            }
            catch(e:Error)
            {
               continue;
            }
         }
         return null;
      }
      
      private static function areRemotePopUpsEqual(param1:Object, param2:Object) : Boolean
      {
         if(!(param1 is RemotePopUp))
         {
            return false;
         }
         if(!(param2 is RemotePopUp))
         {
            return false;
         }
         var _loc3_:RemotePopUp = RemotePopUp(param1);
         var _loc4_:RemotePopUp = RemotePopUp(param2);
         if(_loc3_.window == _loc4_.window && _loc3_.bridge && Boolean(_loc4_.bridge))
         {
            return true;
         }
         return false;
      }
      
      private static function getChildListIndex(param1:IChildList, param2:Object) : int
      {
         var childList:IChildList = param1;
         var f:Object = param2;
         var index:int = -1;
         try
         {
            index = childList.getChildIndex(DisplayObject(f));
         }
         catch(e:ArgumentError)
         {
         }
         return index;
      }
      
      mx_internal static function registerInitCallback(param1:Function) : void
      {
         if(!mx_internal::allSystemManagers || !mx_internal::lastSystemManager)
         {
            return;
         }
         var _loc2_:mx.managers.SystemManager = mx_internal::lastSystemManager;
         if(_loc2_.doneExecutingInitCallbacks)
         {
            param1(_loc2_);
         }
         else
         {
            _loc2_.initCallbackFunctions.push(param1);
         }
      }
      
      private static function isRemotePopUp(param1:Object) : Boolean
      {
         return !(param1 is IFocusManagerContainer);
      }
      
      private function removeEventListenerFromSandboxes(param1:String, param2:Function, param3:Boolean = false, param4:IEventDispatcher = null) : void
      {
         var _loc8_:int = 0;
         if(!swfBridgeGroup)
         {
            return;
         }
         var _loc5_:EventListenerRequest = new EventListenerRequest(EventListenerRequest.REMOVE_EVENT_LISTENER_REQUEST,false,false,param1,param3);
         var _loc6_:IEventDispatcher;
         if((Boolean(_loc6_ = swfBridgeGroup.parentBridge)) && _loc6_ != param4)
         {
            _loc6_.removeEventListener(param1,param2,param3);
         }
         var _loc7_:Array = swfBridgeGroup.getChildBridges();
         while(_loc8_ < _loc7_.length)
         {
            if(_loc7_[_loc8_] != param4)
            {
               IEventDispatcher(_loc7_[_loc8_]).removeEventListener(param1,param2,param3);
            }
            _loc8_++;
         }
         dispatchEventFromSWFBridges(_loc5_,param4);
      }
      
      mx_internal function addingChild(param1:DisplayObject) : void
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc2_:int = 1;
         if(!mx_internal::topLevel && Boolean(parent))
         {
            _loc4_ = parent.parent;
            while(_loc4_)
            {
               if(_loc4_ is ILayoutManagerClient)
               {
                  _loc2_ = ILayoutManagerClient(_loc4_).nestLevel + 1;
                  break;
               }
               _loc4_ = _loc4_.parent;
            }
         }
         mx_internal::nestLevel = _loc2_;
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).systemManager = this;
         }
         var _loc3_:Class = Class(getDefinitionByName("mx.core.UIComponent"));
         if(param1 is IUIComponent && !IUIComponent(param1).document)
         {
            IUIComponent(param1).document = document;
         }
         if(param1 is ILayoutManagerClient)
         {
            ILayoutManagerClient(param1).nestLevel = mx_internal::nestLevel + 1;
         }
         if(param1 is InteractiveObject)
         {
            if(doubleClickEnabled)
            {
               InteractiveObject(param1).doubleClickEnabled = true;
            }
         }
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).parentChanged(this);
         }
         if(param1 is IStyleClient)
         {
            IStyleClient(param1).regenerateStyleCache(true);
         }
         if(param1 is ISimpleStyleClient)
         {
            ISimpleStyleClient(param1).styleChanged(null);
         }
         if(param1 is IStyleClient)
         {
            IStyleClient(param1).notifyStyleChangeInChildren(null,true);
         }
         if(Boolean(_loc3_) && param1 is _loc3_)
         {
            _loc3_(param1).initThemeColor();
         }
         if(Boolean(_loc3_) && param1 is _loc3_)
         {
            _loc3_(param1).stylesInitialized();
         }
      }
      
      private function dispatchEventToOtherSystemManagers(param1:Event) : void
      {
         SystemManagerGlobals.dispatchingEventToOtherSystemManagers = true;
         var _loc2_:Array = SystemManagerGlobals.topLevelSystemManagers;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_] != this)
            {
               _loc2_[_loc4_].dispatchEvent(param1);
            }
            _loc4_++;
         }
         SystemManagerGlobals.dispatchingEventToOtherSystemManagers = false;
      }
      
      private function idleTimer_timerHandler(param1:TimerEvent) : void
      {
         ++mx_internal::idleCounter;
         if(mx_internal::idleCounter * IDLE_INTERVAL > IDLE_THRESHOLD)
         {
            dispatchEvent(new FlexEvent(FlexEvent.IDLE));
         }
      }
      
      private function initManagerHandler(param1:Event) : void
      {
         var name:String;
         var event:Event = param1;
         if(true)
         {
            dispatchEventToOtherSystemManagers(event);
         }
         if(event is InterManagerRequest)
         {
            return;
         }
         name = String(event["name"]);
         try
         {
            Singleton.getInstance(name);
         }
         catch(e:Error)
         {
         }
      }
      
      mx_internal function rawChildren_getObjectsUnderPoint(param1:Point) : Array
      {
         return super.getObjectsUnderPoint(param1);
      }
      
      public function get preloadedRSLs() : Dictionary
      {
         return null;
      }
      
      private function getSizeRequestHandler(param1:Event) : void
      {
         var _loc2_:Object = Object(param1);
         _loc2_.data = {
            "width":measuredWidth,
            "height":measuredHeight
         };
      }
      
      private function beforeUnloadHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = null;
         if(mx_internal::topLevel && Boolean(stage))
         {
            _loc2_ = getSandboxRoot();
            if(_loc2_ != this)
            {
               _loc2_.removeEventListener(Event.RESIZE,Stage_resizeHandler);
            }
         }
         mx_internal::removeParentBridgeListeners();
         dispatchEvent(param1);
      }
      
      public function getExplicitOrMeasuredHeight() : Number
      {
         return !isNaN(explicitHeight) ? explicitHeight : measuredHeight;
      }
      
      private function getVisibleRectRequestHandler(param1:Event) : void
      {
         var _loc5_:Rectangle = null;
         var _loc7_:Point = null;
         var _loc8_:IEventDispatcher = null;
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         var _loc3_:Rectangle = Rectangle(_loc2_.data);
         var _loc4_:DisplayObject = DisplayObject(swfBridgeGroup.getChildBridgeProvider(_loc2_.requestor));
         var _loc6_:Boolean = true;
         if(!DisplayObjectContainer(document).contains(_loc4_))
         {
            _loc6_ = false;
         }
         if(_loc4_ is ISWFLoader)
         {
            _loc5_ = ISWFLoader(_loc4_).getVisibleApplicationRect();
         }
         else
         {
            _loc5_ = _loc4_.getBounds(this);
            _loc7_ = localToGlobal(_loc5_.topLeft);
            _loc5_.x = _loc7_.x;
            _loc5_.y = _loc7_.y;
         }
         _loc3_ = _loc3_.intersection(_loc5_);
         _loc2_.data = _loc3_;
         if(_loc6_ && useSWFBridge())
         {
            _loc8_ = swfBridgeGroup.parentBridge;
            _loc2_.requestor = _loc8_;
            _loc8_.dispatchEvent(_loc2_);
         }
         Object(param1).data = _loc2_.data;
      }
      
      mx_internal function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         var _loc6_:IStyleClient = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc6_ = rawChildren.getChildAt(_loc5_) as IStyleClient)
            {
               _loc6_.styleChanged(param1);
               _loc6_.notifyStyleChangeInChildren(param1,param2);
            }
            if(isTopLevelWindow(DisplayObject(_loc6_)))
            {
               _loc3_ = true;
            }
            _loc4_ = 0;
            _loc5_++;
         }
         if(!_loc3_ && mx_internal::topLevelWindow is IStyleClient)
         {
            IStyleClient(mx_internal::topLevelWindow).styleChanged(param1);
            IStyleClient(mx_internal::topLevelWindow).notifyStyleChangeInChildren(param1,param2);
         }
      }
      
      private function addEventListenerToOtherSystemManagers(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc6_:Array;
         if((_loc6_ = SystemManagerGlobals.topLevelSystemManagers).length < 2)
         {
            return;
         }
         SystemManagerGlobals.changingListenersInOtherSystemManagers = true;
         var _loc7_:int = int(_loc6_.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            if(_loc6_[_loc8_] != this)
            {
               _loc6_[_loc8_].addEventListener(param1,param2,param3,param4,param5);
            }
            _loc8_++;
         }
         SystemManagerGlobals.changingListenersInOtherSystemManagers = false;
      }
      
      private function initHandler(param1:Event) : void
      {
         var sbRoot:DisplayObject;
         var docFrame:int;
         var bridgeEvent:SWFBridgeEvent = null;
         var event:Event = param1;
         if(!isStageRoot)
         {
            if(root.loaderInfo.parentAllowsChild)
            {
               try
               {
                  if(!parent.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot",false,true)) || !root.loaderInfo.sharedEvents.hasEventListener(SWFBridgeEvent.BRIDGE_NEW_APPLICATION))
                  {
                     isBootstrapRoot = true;
                  }
               }
               catch(e:Error)
               {
               }
            }
         }
         mx_internal::allSystemManagers[this] = this.loaderInfo.url;
         root.loaderInfo.removeEventListener(Event.INIT,initHandler);
         if(useSWFBridge())
         {
            swfBridgeGroup = new SWFBridgeGroup(this);
            swfBridgeGroup.parentBridge = loaderInfo.sharedEvents;
            mx_internal::addParentBridgeListeners();
            bridgeEvent = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_NEW_APPLICATION);
            bridgeEvent.data = swfBridgeGroup.parentBridge;
            swfBridgeGroup.parentBridge.dispatchEvent(bridgeEvent);
            addEventListener(SWFBridgeRequest.ADD_POP_UP_PLACE_HOLDER_REQUEST,addPlaceholderPopupRequestHandler);
            root.loaderInfo.addEventListener(Event.UNLOAD,unloadHandler,false,0,true);
         }
         sbRoot = getSandboxRoot();
         sbRoot.addEventListener(InterManagerRequest.INIT_MANAGER_REQUEST,initManagerHandler,false,0,true);
         if(sbRoot == this)
         {
            addEventListener(InterManagerRequest.SYSTEM_MANAGER_REQUEST,systemManagerHandler);
            addEventListener(InterManagerRequest.DRAG_MANAGER_REQUEST,multiWindowRedispatcher);
            addEventListener("dispatchDragEvent",multiWindowRedispatcher);
            addEventListener(SWFBridgeRequest.ADD_POP_UP_REQUEST,addPopupRequestHandler);
            addEventListener(SWFBridgeRequest.REMOVE_POP_UP_REQUEST,removePopupRequestHandler);
            addEventListener(SWFBridgeRequest.ADD_POP_UP_PLACE_HOLDER_REQUEST,addPlaceholderPopupRequestHandler);
            addEventListener(SWFBridgeRequest.REMOVE_POP_UP_PLACE_HOLDER_REQUEST,removePlaceholderPopupRequestHandler);
            addEventListener(SWFBridgeEvent.BRIDGE_WINDOW_ACTIVATE,activateFormSandboxEventHandler);
            addEventListener(SWFBridgeEvent.BRIDGE_WINDOW_DEACTIVATE,deactivateFormSandboxEventHandler);
            addEventListener(SWFBridgeRequest.HIDE_MOUSE_CURSOR_REQUEST,hideMouseCursorRequestHandler);
            addEventListener(SWFBridgeRequest.SHOW_MOUSE_CURSOR_REQUEST,showMouseCursorRequestHandler);
            addEventListener(SWFBridgeRequest.RESET_MOUSE_CURSOR_REQUEST,resetMouseCursorRequestHandler);
         }
         docFrame = totalFrames == 1 ? 0 : 1;
         addEventListener(Event.ENTER_FRAME,docFrameListener);
         mx_internal::initialize();
      }
      
      mx_internal function findFocusManagerContainer(param1:SystemManagerProxy) : IFocusManagerContainer
      {
         var _loc5_:DisplayObject = null;
         var _loc2_:IChildList = param1.rawChildren;
         var _loc3_:int = _loc2_.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = _loc2_.getChildAt(_loc4_)) is IFocusManagerContainer)
            {
               return IFocusManagerContainer(_loc5_);
            }
            _loc4_++;
         }
         return null;
      }
      
      private function addPlaceholderPopupRequestHandler(param1:Event) : void
      {
         var _loc3_:RemotePopUp = null;
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(param1.target != this && param1 is SWFBridgeRequest)
         {
            return;
         }
         if(!forwardPlaceholderRequest(_loc2_,true))
         {
            _loc3_ = new RemotePopUp(_loc2_.data.placeHolderId,_loc2_.requestor);
            forms.push(_loc3_);
         }
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         if(super.contains(param1))
         {
            if(param1.parent == this)
            {
               _loc2_ = super.getChildIndex(param1);
               if(_loc2_ < mx_internal::noTopMostIndex)
               {
                  return true;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < mx_internal::noTopMostIndex)
               {
                  if((_loc4_ = super.getChildAt(_loc3_)) is IRawChildrenContainer)
                  {
                     if(IRawChildrenContainer(_loc4_).rawChildren.contains(param1))
                     {
                        return true;
                     }
                  }
                  if(_loc4_ is DisplayObjectContainer)
                  {
                     if(DisplayObjectContainer(_loc4_).contains(param1))
                     {
                        return true;
                     }
                  }
                  _loc3_++;
               }
            }
         }
         return false;
      }
      
      private function modalWindowRequestHandler(param1:Event) : void
      {
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(!preProcessModalWindowRequest(_loc2_,getSandboxRoot()))
         {
            return;
         }
         Singleton.getInstance("mx.managers::IPopUpManager");
         dispatchEvent(_loc2_);
      }
      
      private function activateApplicationSandboxEventHandler(param1:Event) : void
      {
         if(!isTopLevelRoot())
         {
            swfBridgeGroup.parentBridge.dispatchEvent(param1);
            return;
         }
         activateForm(document);
      }
      
      public function getDefinitionByName(param1:String) : Object
      {
         var _loc3_:Object = null;
         var _loc2_:ApplicationDomain = !mx_internal::topLevel && parent is Loader ? Loader(parent).contentLoaderInfo.applicationDomain : info()["currentDomain"] as ApplicationDomain;
         if(_loc2_.hasDefinition(param1))
         {
            _loc3_ = _loc2_.getDefinition(param1);
         }
         return _loc3_;
      }
      
      public function removeChildFromSandboxRoot(param1:String, param2:DisplayObject) : void
      {
         var _loc3_:InterManagerRequest = null;
         if(getSandboxRoot() == this)
         {
            this[param1].removeChild(param2);
         }
         else
         {
            mx_internal::removingChild(param2);
            _loc3_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST);
            _loc3_.name = param1 + ".removeChild";
            _loc3_.value = param2;
            getSandboxRoot().dispatchEvent(_loc3_);
            mx_internal::childRemoved(param2);
         }
      }
      
      private function removeEventListenerFromOtherSystemManagers(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:Array;
         if((_loc4_ = SystemManagerGlobals.topLevelSystemManagers).length < 2)
         {
            return;
         }
         SystemManagerGlobals.changingListenersInOtherSystemManagers = true;
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc4_[_loc6_] != this)
            {
               _loc4_[_loc6_].removeEventListener(param1,param2,param3);
            }
            _loc6_++;
         }
         SystemManagerGlobals.changingListenersInOtherSystemManagers = false;
      }
      
      public function get embeddedFontList() : Object
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:Object = null;
         if(_fontList == null)
         {
            _fontList = {};
            _loc1_ = info()["fonts"];
            for(_loc2_ in _loc1_)
            {
               _fontList[_loc2_] = _loc1_[_loc2_];
            }
            if(!mx_internal::topLevel && Boolean(_topLevelSystemManager))
            {
               _loc3_ = _topLevelSystemManager.embeddedFontList;
               for(_loc2_ in _loc3_)
               {
                  _fontList[_loc2_] = _loc3_[_loc2_];
               }
            }
         }
         return _fontList;
      }
      
      mx_internal function set cursorIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _cursorIndex;
         _cursorIndex = param1;
      }
      
      mx_internal function addChildBridgeListeners(param1:IEventDispatcher) : void
      {
         if(!mx_internal::topLevel && Boolean(topLevelSystemManager))
         {
            SystemManager(topLevelSystemManager).mx_internal::addChildBridgeListeners(param1);
            return;
         }
         param1.addEventListener(SWFBridgeRequest.ADD_POP_UP_REQUEST,addPopupRequestHandler);
         param1.addEventListener(SWFBridgeRequest.REMOVE_POP_UP_REQUEST,removePopupRequestHandler);
         param1.addEventListener(SWFBridgeRequest.ADD_POP_UP_PLACE_HOLDER_REQUEST,addPlaceholderPopupRequestHandler);
         param1.addEventListener(SWFBridgeRequest.REMOVE_POP_UP_PLACE_HOLDER_REQUEST,removePlaceholderPopupRequestHandler);
         param1.addEventListener(SWFBridgeEvent.BRIDGE_WINDOW_ACTIVATE,activateFormSandboxEventHandler);
         param1.addEventListener(SWFBridgeEvent.BRIDGE_WINDOW_DEACTIVATE,deactivateFormSandboxEventHandler);
         param1.addEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_ACTIVATE,activateApplicationSandboxEventHandler);
         param1.addEventListener(EventListenerRequest.ADD_EVENT_LISTENER_REQUEST,eventListenerRequestHandler,false,0,true);
         param1.addEventListener(EventListenerRequest.REMOVE_EVENT_LISTENER_REQUEST,eventListenerRequestHandler,false,0,true);
         param1.addEventListener(SWFBridgeRequest.CREATE_MODAL_WINDOW_REQUEST,modalWindowRequestHandler);
         param1.addEventListener(SWFBridgeRequest.SHOW_MODAL_WINDOW_REQUEST,modalWindowRequestHandler);
         param1.addEventListener(SWFBridgeRequest.HIDE_MODAL_WINDOW_REQUEST,modalWindowRequestHandler);
         param1.addEventListener(SWFBridgeRequest.GET_VISIBLE_RECT_REQUEST,getVisibleRectRequestHandler);
         param1.addEventListener(SWFBridgeRequest.HIDE_MOUSE_CURSOR_REQUEST,hideMouseCursorRequestHandler);
         param1.addEventListener(SWFBridgeRequest.SHOW_MOUSE_CURSOR_REQUEST,showMouseCursorRequestHandler);
         param1.addEventListener(SWFBridgeRequest.RESET_MOUSE_CURSOR_REQUEST,resetMouseCursorRequestHandler);
      }
      
      public function set document(param1:Object) : void
      {
         _document = param1;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(mx_internal::applicationIndex + param1);
      }
      
      public function get rawChildren() : IChildList
      {
         if(!_rawChildren)
         {
            _rawChildren = new mx.managers.SystemRawChildrenList(this);
         }
         return _rawChildren;
      }
      
      private function findLastActiveForm(param1:Object) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            if(forms[_loc3_] != param1 && canActivatePopUp(forms[_loc3_]))
            {
               return forms[_loc3_];
            }
            _loc3_--;
         }
         return null;
      }
      
      private function multiWindowRedispatcher(param1:Event) : void
      {
         if(true)
         {
            dispatchEventToOtherSystemManagers(param1);
         }
      }
      
      public function deployMouseShields(param1:Boolean) : void
      {
         var _loc2_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST,false,false,"mouseShield",param1);
         getSandboxRoot().dispatchEvent(_loc2_);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var actualType:String = null;
         var type:String = param1;
         var listener:Function = param2;
         var useCapture:Boolean = param3;
         var priority:int = param4;
         var useWeakReference:Boolean = param5;
         if(type == FlexEvent.RENDER || type == FlexEvent.ENTER_FRAME)
         {
            if(type == FlexEvent.RENDER)
            {
               type = "null";
            }
            else
            {
               type = "null";
            }
            try
            {
               if(stage)
               {
                  stage.addEventListener(type,listener,useCapture,priority,useWeakReference);
               }
               else
               {
                  super.addEventListener(type,listener,useCapture,priority,useWeakReference);
               }
            }
            catch(error:SecurityError)
            {
               super.addEventListener(type,listener,useCapture,priority,useWeakReference);
            }
            if(Boolean(stage) && type == Event.RENDER)
            {
               stage.invalidate();
            }
            return;
         }
         if(type == MouseEvent.MOUSE_MOVE || type == MouseEvent.MOUSE_UP || type == MouseEvent.MOUSE_DOWN || type == Event.ACTIVATE || type == Event.DEACTIVATE)
         {
            try
            {
               if(stage)
               {
                  stage.addEventListener(type,stageEventHandler,false,0,true);
               }
            }
            catch(error:SecurityError)
            {
            }
         }
         if(type == SandboxMouseEvent.MOUSE_UP_SOMEWHERE)
         {
            try
            {
               if(stage)
               {
                  stage.addEventListener(Event.MOUSE_LEAVE,mouseLeaveHandler,false,0,true);
               }
               else
               {
                  super.addEventListener(Event.MOUSE_LEAVE,mouseLeaveHandler,false,0,true);
               }
            }
            catch(error:SecurityError)
            {
               super.addEventListener(Event.MOUSE_LEAVE,mouseLeaveHandler,false,0,true);
            }
         }
         if(hasSWFBridges() || SystemManagerGlobals.topLevelSystemManagers.length > 1)
         {
            if(!eventProxy)
            {
               eventProxy = new EventProxy(this);
            }
            actualType = String(EventUtil.sandboxMouseEventMap[type]);
            if(actualType)
            {
               if(isTopLevelRoot())
               {
                  stage.addEventListener(MouseEvent.MOUSE_MOVE,resetMouseCursorTracking,true,NaN,true);
                  addEventListenerToSandboxes(SandboxMouseEvent.MOUSE_MOVE_SOMEWHERE,resetMouseCursorTracking,true,NaN,true);
               }
               else
               {
                  super.addEventListener(MouseEvent.MOUSE_MOVE,resetMouseCursorTracking,true,NaN,true);
               }
               addEventListenerToSandboxes(type,sandboxMouseListener,useCapture,priority,useWeakReference);
               if(true)
               {
                  addEventListenerToOtherSystemManagers(type,otherSystemManagerMouseListener,useCapture,priority,useWeakReference);
               }
               if(getSandboxRoot() == this)
               {
                  super.addEventListener(actualType,eventProxy.marshalListener,useCapture,priority,useWeakReference);
                  if(actualType == MouseEvent.MOUSE_UP)
                  {
                     try
                     {
                        if(stage)
                        {
                           stage.addEventListener(Event.MOUSE_LEAVE,eventProxy.marshalListener,useCapture,priority,useWeakReference);
                        }
                        else
                        {
                           super.addEventListener(Event.MOUSE_LEAVE,eventProxy.marshalListener,useCapture,priority,useWeakReference);
                        }
                     }
                     catch(e:SecurityError)
                     {
                        super.addEventListener(Event.MOUSE_LEAVE,eventProxy.marshalListener,useCapture,priority,useWeakReference);
                     }
                  }
               }
               super.addEventListener(type,listener,false,priority,useWeakReference);
               return;
            }
         }
         if(type == FlexEvent.IDLE && !idleTimer)
         {
            idleTimer = new Timer(IDLE_INTERVAL);
            idleTimer.addEventListener(TimerEvent.TIMER,idleTimer_timerHandler);
            idleTimer.start();
            addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
            addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler,true);
         }
         super.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      private function activateForm(param1:Object) : void
      {
         var _loc2_:IFocusManagerContainer = null;
         if(form)
         {
            if(form != param1 && false)
            {
               if(isRemotePopUp(form))
               {
                  if(!areRemotePopUpsEqual(form,param1))
                  {
                     deactivateRemotePopUp(form);
                  }
               }
               else
               {
                  _loc2_ = IFocusManagerContainer(form);
                  _loc2_.focusManager.deactivate();
               }
            }
         }
         form = param1;
         if(isRemotePopUp(param1))
         {
            activateRemotePopUp(param1);
         }
         else if(param1.focusManager)
         {
            param1.focusManager.activate();
         }
         updateLastActiveForm();
      }
      
      public function removeFocusManager(param1:IFocusManagerContainer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(forms[_loc3_] == param1)
            {
               if(form == param1)
               {
                  deactivate(param1);
               }
               dispatchDeactivatedWindowEvent(DisplayObject(param1));
               forms.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         mx_internal::idleCounter = 0;
      }
      
      private function getSandboxScreen() : Rectangle
      {
         var _loc2_:Rectangle = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:InterManagerRequest = null;
         var _loc1_:DisplayObject = getSandboxRoot();
         if(_loc1_ == this)
         {
            _loc2_ = new Rectangle(0,0,width,height);
         }
         else if(_loc1_ == topLevelSystemManager)
         {
            _loc3_ = DisplayObject(topLevelSystemManager);
            _loc2_ = new Rectangle(0,0,_loc3_.width,_loc3_.height);
         }
         else
         {
            _loc4_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"screen");
            _loc1_.dispatchEvent(_loc4_);
            _loc2_ = Rectangle(_loc4_.value);
         }
         return _loc2_;
      }
      
      public function get focusPane() : Sprite
      {
         return _focusPane;
      }
      
      override public function get mouseX() : Number
      {
         if(mx_internal::_mouseX === undefined)
         {
            return super.mouseX;
         }
         return mx_internal::_mouseX;
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:DisplayObject = null;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         mx_internal::idleCounter = 0;
         var _loc2_:IEventDispatcher = getSWFBridgeOfDisplayObject(param1.target as DisplayObject);
         if(Boolean(_loc2_) && true)
         {
            if(isTopLevelRoot())
            {
               activateForm(document);
            }
            else
            {
               dispatchActivatedApplicationEvent();
            }
            return;
         }
         if(numModalWindows == 0)
         {
            if(!isTopLevelRoot() || false)
            {
               _loc3_ = 0;
               _loc4_ = DisplayObject(param1.target);
               _loc5_ = Boolean(document.rawChildren.contains(_loc4_));
               while(_loc4_)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc3_)
                  {
                     if((_loc7_ = isRemotePopUp(forms[_loc6_]) ? forms[_loc6_].window : forms[_loc6_]) == _loc4_)
                     {
                        _loc8_ = 0;
                        if(_loc4_ != form && _loc4_ is IFocusManagerContainer || !isTopLevelRoot() && _loc4_ == form)
                        {
                           if(isTopLevelRoot())
                           {
                              activate(IFocusManagerContainer(_loc4_));
                           }
                           if(_loc4_ == document)
                           {
                              dispatchActivatedApplicationEvent();
                           }
                           else if(_loc4_ is DisplayObject)
                           {
                              mx_internal::dispatchActivatedWindowEvent(DisplayObject(_loc4_));
                           }
                        }
                        if(popUpChildren.contains(_loc4_))
                        {
                           _loc11_ = popUpChildren;
                        }
                        else
                        {
                           _loc11_ = {};
                        }
                        _loc10_ = _loc9_ = int(_loc11_.getChildIndex(_loc4_));
                        _loc3_ = 0;
                        _loc8_ = 0;
                        for(; _loc8_ < _loc3_; _loc8_++)
                        {
                           if(_loc13_ = isRemotePopUp(forms[_loc8_]))
                           {
                              if(forms[_loc8_].window is String)
                              {
                                 continue;
                              }
                              _loc12_ = forms[_loc8_].window;
                           }
                           else
                           {
                              _loc12_ = forms[_loc8_];
                           }
                           if(_loc13_)
                           {
                              if((_loc14_ = getChildListIndex(_loc11_,_loc12_)) > _loc9_)
                              {
                                 _loc10_ = Math.max(_loc14_,_loc10_);
                              }
                           }
                           else if(_loc11_.contains(_loc12_))
                           {
                              if(_loc11_.getChildIndex(_loc12_) > _loc9_)
                              {
                                 _loc10_ = Math.max(_loc11_.getChildIndex(_loc12_),_loc10_);
                              }
                           }
                        }
                        if(_loc10_ > _loc9_ && !_loc5_)
                        {
                           _loc11_.setChildIndex(_loc4_,_loc10_);
                        }
                        return;
                     }
                     _loc6_++;
                  }
                  _loc4_ = _loc4_.parent;
               }
            }
            else
            {
               dispatchActivatedApplicationEvent();
            }
         }
      }
      
      public function allowInsecureDomain(... rest) : void
      {
      }
      
      private function removePopupRequestHandler(param1:Event) : void
      {
         var _loc3_:SWFBridgeRequest = null;
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(false && SecurityUtil.hasMutualTrustBetweenParentAndChild(this))
         {
            _loc2_.requestor = swfBridgeGroup.parentBridge;
            getSandboxRoot().dispatchEvent(_loc2_);
            return;
         }
         if(popUpChildren.contains(_loc2_.data.window))
         {
            popUpChildren.removeChild(_loc2_.data.window);
         }
         else
         {
            removeChild(DisplayObject(_loc2_.data.window));
         }
         if(_loc2_.data.modal)
         {
            --numModalWindows;
         }
         removeRemotePopUp(new RemotePopUp(_loc2_.data.window,_loc2_.requestor));
         if(!isTopLevelRoot() && Boolean(swfBridgeGroup))
         {
            _loc3_ = new SWFBridgeRequest(SWFBridgeRequest.REMOVE_POP_UP_PLACE_HOLDER_REQUEST,false,false,_loc2_.requestor,{"placeHolderId":NameUtil.displayObjectToString(_loc2_.data.window)});
            dispatchEvent(_loc3_);
         }
      }
      
      public function addChildBridge(param1:IEventDispatcher, param2:DisplayObject) : void
      {
         var _loc3_:IFocusManager = null;
         var _loc4_:DisplayObject = param2;
         while(_loc4_)
         {
            if(_loc4_ is IFocusManagerContainer)
            {
               _loc3_ = IFocusManagerContainer(_loc4_).focusManager;
               break;
            }
            _loc4_ = _loc4_.parent;
         }
         if(!_loc3_)
         {
            return;
         }
         if(!swfBridgeGroup)
         {
            swfBridgeGroup = new SWFBridgeGroup(this);
         }
         swfBridgeGroup.addChildBridge(param1,ISWFBridgeProvider(param2));
         _loc3_.addSWFBridge(param1,param2);
         if(!mx_internal::bridgeToFocusManager)
         {
            mx_internal::bridgeToFocusManager = new Dictionary();
         }
         mx_internal::bridgeToFocusManager[param1] = _loc3_;
         mx_internal::addChildBridgeListeners(param1);
         dispatchEvent(new FlexChangeEvent(FlexChangeEvent.ADD_CHILD_BRIDGE,false,false,param1));
      }
      
      public function get screen() : Rectangle
      {
         if(!_screen)
         {
            Stage_resizeHandler();
         }
         if(!isStageRoot)
         {
            Stage_resizeHandler();
         }
         return _screen;
      }
      
      private function resetMouseCursorRequestHandler(param1:Event) : void
      {
         var _loc3_:IEventDispatcher = null;
         if(!isTopLevelRoot() && param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(!isTopLevelRoot())
         {
            _loc3_ = swfBridgeGroup.parentBridge;
            _loc2_.requestor = _loc3_;
            _loc3_.dispatchEvent(_loc2_);
         }
         else if(eventProxy)
         {
            SystemManagerGlobals.showMouseCursor = true;
         }
      }
      
      private function preloader_rslCompleteHandler(param1:RSLEvent) : void
      {
         if(param1.loaderInfo)
         {
            preloadedRSLs[param1.loaderInfo] = param1.url.url;
         }
      }
      
      mx_internal function set topMostIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _topMostIndex;
         _topMostIndex = param1;
         mx_internal::toolTipIndex += _loc2_;
      }
      
      mx_internal function docFrameHandler(param1:Event = null) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Class = null;
         Singleton.registerClass("mx.managers::IBrowserManager",Class(getDefinitionByName("mx.managers::BrowserManagerImpl")));
         Singleton.registerClass("mx.managers::ICursorManager",Class(getDefinitionByName("mx.managers::CursorManagerImpl")));
         Singleton.registerClass("mx.managers::IHistoryManager",Class(getDefinitionByName("mx.managers::HistoryManagerImpl")));
         Singleton.registerClass("mx.managers::ILayoutManager",Class(getDefinitionByName("mx.managers::LayoutManager")));
         Singleton.registerClass("mx.managers::IPopUpManager",Class(getDefinitionByName("mx.managers::PopUpManagerImpl")));
         Singleton.registerClass("mx.managers::IToolTipManager2",Class(getDefinitionByName("mx.managers::ToolTipManagerImpl")));
         var _loc2_:Class = null;
         _loc2_ = Class(getDefinitionByName("mx.managers::NativeDragManagerImpl"));
         if(_loc2_ == null)
         {
            _loc2_ = Class(getDefinitionByName("mx.managers::DragManagerImpl"));
         }
         Singleton.registerClass("mx.managers::IDragManager",_loc2_);
         Singleton.registerClass("mx.core::ITextFieldFactory",Class(getDefinitionByName("mx.core::TextFieldFactory")));
         executeCallbacks();
         doneExecutingInitCallbacks = true;
         var _loc4_:Array;
         if((Boolean(_loc4_ = info()["mixins"])) && _loc4_.length > 0)
         {
            _loc5_ = int(_loc4_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               (_loc7_ = Class(getDefinitionByName(_loc4_[_loc6_])))["init"](this);
               _loc6_++;
            }
         }
         installCompiledResourceBundles();
         initializeTopLevelWindow(null);
         deferredNextFrame();
      }
      
      public function get explicitHeight() : Number
      {
         return _explicitHeight;
      }
      
      public function get preloaderBackgroundSize() : String
      {
         return info()["backgroundSize"];
      }
      
      public function isTopLevel() : Boolean
      {
         return mx_internal::topLevel;
      }
      
      override public function get mouseY() : Number
      {
         if(mx_internal::_mouseY === undefined)
         {
            return super.mouseY;
         }
         return mx_internal::_mouseY;
      }
      
      public function getExplicitOrMeasuredWidth() : Number
      {
         return !isNaN(explicitWidth) ? explicitWidth : measuredWidth;
      }
      
      public function deactivate(param1:IFocusManagerContainer) : void
      {
         deactivateForm(Object(param1));
      }
      
      private function preProcessModalWindowRequest(param1:SWFBridgeRequest, param2:DisplayObject) : Boolean
      {
         var _loc3_:IEventDispatcher = null;
         var _loc4_:ISWFLoader = null;
         var _loc5_:Rectangle = null;
         if(param1.data.skip)
         {
            param1.data.skip = false;
            if(useSWFBridge())
            {
               _loc3_ = swfBridgeGroup.parentBridge;
               param1.requestor = _loc3_;
               _loc3_.dispatchEvent(param1);
            }
            return false;
         }
         if(this != param2)
         {
            if(param1.type == SWFBridgeRequest.CREATE_MODAL_WINDOW_REQUEST || param1.type == SWFBridgeRequest.SHOW_MODAL_WINDOW_REQUEST)
            {
               if(_loc4_ = swfBridgeGroup.getChildBridgeProvider(param1.requestor) as ISWFLoader)
               {
                  _loc5_ = ISWFLoader(_loc4_).getVisibleApplicationRect();
                  param1.data.excludeRect = _loc5_;
                  if(!DisplayObjectContainer(document).contains(DisplayObject(_loc4_)))
                  {
                     param1.data.useExclude = false;
                  }
               }
            }
            _loc3_ = swfBridgeGroup.parentBridge;
            param1.requestor = _loc3_;
            if(param1.type == SWFBridgeRequest.HIDE_MODAL_WINDOW_REQUEST)
            {
               param2.dispatchEvent(param1);
            }
            else
            {
               _loc3_.dispatchEvent(param1);
            }
            return false;
         }
         param1.data.skip = false;
         return true;
      }
      
      private function resetMouseCursorTracking(param1:Event) : void
      {
         var _loc2_:SWFBridgeRequest = null;
         var _loc3_:IEventDispatcher = null;
         if(isTopLevelRoot())
         {
            SystemManagerGlobals.showMouseCursor = true;
         }
         else if(false)
         {
            _loc2_ = new SWFBridgeRequest(SWFBridgeRequest.RESET_MOUSE_CURSOR_REQUEST);
            _loc3_ = swfBridgeGroup.parentBridge;
            _loc2_.requestor = _loc3_;
            _loc3_.dispatchEvent(_loc2_);
         }
      }
      
      mx_internal function addParentBridgeListeners() : void
      {
         if(!mx_internal::topLevel && Boolean(topLevelSystemManager))
         {
            SystemManager(topLevelSystemManager).mx_internal::addParentBridgeListeners();
            return;
         }
         var _loc1_:IEventDispatcher = swfBridgeGroup.parentBridge;
         _loc1_.addEventListener(SWFBridgeRequest.SET_ACTUAL_SIZE_REQUEST,setActualSizeRequestHandler);
         _loc1_.addEventListener(SWFBridgeRequest.GET_SIZE_REQUEST,getSizeRequestHandler);
         _loc1_.addEventListener(SWFBridgeRequest.ACTIVATE_POP_UP_REQUEST,activateRequestHandler);
         _loc1_.addEventListener(SWFBridgeRequest.DEACTIVATE_POP_UP_REQUEST,deactivateRequestHandler);
         _loc1_.addEventListener(SWFBridgeRequest.IS_BRIDGE_CHILD_REQUEST,isBridgeChildHandler);
         _loc1_.addEventListener(EventListenerRequest.ADD_EVENT_LISTENER_REQUEST,eventListenerRequestHandler);
         _loc1_.addEventListener(EventListenerRequest.REMOVE_EVENT_LISTENER_REQUEST,eventListenerRequestHandler);
         _loc1_.addEventListener(SWFBridgeRequest.CAN_ACTIVATE_POP_UP_REQUEST,canActivateHandler);
         _loc1_.addEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING,beforeUnloadHandler);
      }
      
      public function get swfBridgeGroup() : ISWFBridgeGroup
      {
         if(mx_internal::topLevel)
         {
            return _swfBridgeGroup;
         }
         if(topLevelSystemManager)
         {
            return topLevelSystemManager.swfBridgeGroup;
         }
         return null;
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         return super.getChildByName(param1);
      }
      
      public function get measuredWidth() : Number
      {
         return !!mx_internal::topLevelWindow ? mx_internal::topLevelWindow.getExplicitOrMeasuredWidth() : loaderInfo.width;
      }
      
      public function removeChildBridge(param1:IEventDispatcher) : void
      {
         dispatchEvent(new FlexChangeEvent(FlexChangeEvent.REMOVE_CHILD_BRIDGE,false,false,param1));
         var _loc2_:IFocusManager = IFocusManager(mx_internal::bridgeToFocusManager[param1]);
         _loc2_.removeSWFBridge(param1);
         swfBridgeGroup.removeChildBridge(param1);
         delete mx_internal::bridgeToFocusManager[param1];
         mx_internal::removeChildBridgeListeners(param1);
      }
      
      mx_internal function removeChildBridgeListeners(param1:IEventDispatcher) : void
      {
         if(!mx_internal::topLevel && Boolean(topLevelSystemManager))
         {
            SystemManager(topLevelSystemManager).mx_internal::removeChildBridgeListeners(param1);
            return;
         }
         param1.removeEventListener(SWFBridgeRequest.ADD_POP_UP_REQUEST,addPopupRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.REMOVE_POP_UP_REQUEST,removePopupRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.ADD_POP_UP_PLACE_HOLDER_REQUEST,addPlaceholderPopupRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.REMOVE_POP_UP_PLACE_HOLDER_REQUEST,removePlaceholderPopupRequestHandler);
         param1.removeEventListener(SWFBridgeEvent.BRIDGE_WINDOW_ACTIVATE,activateFormSandboxEventHandler);
         param1.removeEventListener(SWFBridgeEvent.BRIDGE_WINDOW_DEACTIVATE,deactivateFormSandboxEventHandler);
         param1.removeEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_ACTIVATE,activateApplicationSandboxEventHandler);
         param1.removeEventListener(EventListenerRequest.ADD_EVENT_LISTENER_REQUEST,eventListenerRequestHandler);
         param1.removeEventListener(EventListenerRequest.REMOVE_EVENT_LISTENER_REQUEST,eventListenerRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.CREATE_MODAL_WINDOW_REQUEST,modalWindowRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.SHOW_MODAL_WINDOW_REQUEST,modalWindowRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.HIDE_MODAL_WINDOW_REQUEST,modalWindowRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.GET_VISIBLE_RECT_REQUEST,getVisibleRectRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.HIDE_MOUSE_CURSOR_REQUEST,hideMouseCursorRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.SHOW_MOUSE_CURSOR_REQUEST,showMouseCursorRequestHandler);
         param1.removeEventListener(SWFBridgeRequest.RESET_MOUSE_CURSOR_REQUEST,resetMouseCursorRequestHandler);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         ++mx_internal::noTopMostIndex;
         var _loc3_:DisplayObjectContainer = param1.parent;
         if(_loc3_)
         {
            _loc3_.removeChild(param1);
         }
         return mx_internal::rawChildren_addChildAt(param1,mx_internal::applicationIndex + param2);
      }
      
      private function Stage_resizeHandler(param1:Event = null) : void
      {
         var align:String;
         var h:Number;
         var w:Number;
         var x:Number;
         var y:Number;
         var m:Number = NaN;
         var n:Number = NaN;
         var sandboxScreen:Rectangle = null;
         var event:Event = param1;
         if(isDispatchingResizeEvent)
         {
            return;
         }
         w = 0;
         h = 0;
         try
         {
            m = 0;
            n = 0;
         }
         catch(error:Error)
         {
            if(!_screen)
            {
               _screen = new Rectangle();
            }
            return;
         }
         align = "null";
         try
         {
            if(stage)
            {
               w = 0;
               h = 0;
               align = "null";
            }
         }
         catch(error:SecurityError)
         {
            sandboxScreen = getSandboxScreen();
            w = sandboxScreen.width;
            h = sandboxScreen.height;
         }
         x = (m - w) / 2;
         y = (n - h) / 2;
         if(align == StageAlign.TOP)
         {
            y = 0;
         }
         else if(align == StageAlign.BOTTOM)
         {
            y = n - h;
         }
         else if(align == StageAlign.LEFT)
         {
            x = 0;
         }
         else if(align == StageAlign.RIGHT)
         {
            x = m - w;
         }
         else if(align == StageAlign.TOP_LEFT || align == "LT")
         {
            y = 0;
            x = 0;
         }
         else if(align == StageAlign.TOP_RIGHT)
         {
            y = 0;
            x = m - w;
         }
         else if(align == StageAlign.BOTTOM_LEFT)
         {
            y = n - h;
            x = 0;
         }
         else if(align == StageAlign.BOTTOM_RIGHT)
         {
            y = n - h;
            x = m - w;
         }
         if(!_screen)
         {
            _screen = new Rectangle();
         }
         _screen.x = x;
         _screen.y = y;
         _screen.width = w;
         _screen.height = h;
         if(isStageRoot)
         {
            _width = stage.stageWidth;
            _height = stage.stageHeight;
         }
         if(event)
         {
            resizeMouseCatcher();
            isDispatchingResizeEvent = true;
            dispatchEvent(event);
            isDispatchingResizeEvent = false;
         }
      }
      
      public function get swfBridge() : IEventDispatcher
      {
         if(swfBridgeGroup)
         {
            return swfBridgeGroup.parentBridge;
         }
         return null;
      }
      
      private function findRemotePopUp(param1:Object, param2:IEventDispatcher) : RemotePopUp
      {
         var _loc5_:RemotePopUp = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(isRemotePopUp(forms[_loc4_]))
            {
               if((_loc5_ = RemotePopUp(forms[_loc4_])).window == param1 && _loc5_.bridge == param2)
               {
                  return _loc5_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public function info() : Object
      {
         return {};
      }
      
      mx_internal function get toolTipIndex() : int
      {
         return _toolTipIndex;
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         if(isStageRoot)
         {
            return;
         }
         _width = param1;
         _height = param2;
         if(mouseCatcher)
         {
            mouseCatcher.width = param1;
            mouseCatcher.height = param2;
         }
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      private function removePlaceholderPopupRequestHandler(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(!forwardPlaceholderRequest(_loc2_,false))
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(isRemotePopUp(forms[_loc4_]))
               {
                  if(forms[_loc4_].window == _loc2_.data.placeHolderId && forms[_loc4_].bridge == _loc2_.requestor)
                  {
                     forms.splice(_loc4_,1);
                     break;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      public function set focusPane(param1:Sprite) : void
      {
         if(param1)
         {
            addChild(param1);
            param1.x = 0;
            param1.y = 0;
            param1.scrollRect = null;
            _focusPane = param1;
         }
         else
         {
            removeChild(_focusPane);
            _focusPane = null;
         }
      }
      
      mx_internal function removeParentBridgeListeners() : void
      {
         if(!mx_internal::topLevel && Boolean(topLevelSystemManager))
         {
            SystemManager(topLevelSystemManager).mx_internal::removeParentBridgeListeners();
            return;
         }
         var _loc1_:IEventDispatcher = swfBridgeGroup.parentBridge;
         _loc1_.removeEventListener(SWFBridgeRequest.SET_ACTUAL_SIZE_REQUEST,setActualSizeRequestHandler);
         _loc1_.removeEventListener(SWFBridgeRequest.GET_SIZE_REQUEST,getSizeRequestHandler);
         _loc1_.removeEventListener(SWFBridgeRequest.ACTIVATE_POP_UP_REQUEST,activateRequestHandler);
         _loc1_.removeEventListener(SWFBridgeRequest.DEACTIVATE_POP_UP_REQUEST,deactivateRequestHandler);
         _loc1_.removeEventListener(SWFBridgeRequest.IS_BRIDGE_CHILD_REQUEST,isBridgeChildHandler);
         _loc1_.removeEventListener(EventListenerRequest.ADD_EVENT_LISTENER_REQUEST,eventListenerRequestHandler);
         _loc1_.removeEventListener(EventListenerRequest.REMOVE_EVENT_LISTENER_REQUEST,eventListenerRequestHandler);
         _loc1_.removeEventListener(SWFBridgeRequest.CAN_ACTIVATE_POP_UP_REQUEST,canActivateHandler);
         _loc1_.removeEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING,beforeUnloadHandler);
      }
      
      override public function get parent() : DisplayObjectContainer
      {
         try
         {
            return super.parent;
         }
         catch(e:SecurityError)
         {
            return null;
         }
      }
      
      private function eventListenerRequestHandler(param1:Event) : void
      {
         var _loc2_:String = null;
         if(param1 is EventListenerRequest)
         {
            return;
         }
         var _loc3_:EventListenerRequest = EventListenerRequest.marshal(param1);
         if(param1.type == EventListenerRequest.ADD_EVENT_LISTENER_REQUEST)
         {
            if(!eventProxy)
            {
               eventProxy = new EventProxy(this);
            }
            _loc2_ = String(EventUtil.sandboxMouseEventMap[_loc3_.eventType]);
            if(_loc2_)
            {
               if(isTopLevelRoot())
               {
                  stage.addEventListener(MouseEvent.MOUSE_MOVE,resetMouseCursorTracking,true,NaN,true);
               }
               else
               {
                  super.addEventListener(MouseEvent.MOUSE_MOVE,resetMouseCursorTracking,true,NaN,true);
               }
               addEventListenerToSandboxes(_loc3_.eventType,sandboxMouseListener,true,_loc3_.priority,_loc3_.useWeakReference,param1.target as IEventDispatcher);
               addEventListenerToOtherSystemManagers(_loc3_.eventType,otherSystemManagerMouseListener,true,_loc3_.priority,_loc3_.useWeakReference);
               if(getSandboxRoot() == this)
               {
                  if(isTopLevelRoot() && (_loc2_ == MouseEvent.MOUSE_UP || _loc2_ == MouseEvent.MOUSE_MOVE))
                  {
                     stage.addEventListener(_loc2_,eventProxy.marshalListener,false,_loc3_.priority,_loc3_.useWeakReference);
                  }
                  super.addEventListener(_loc2_,eventProxy.marshalListener,true,_loc3_.priority,_loc3_.useWeakReference);
               }
            }
         }
         else if(param1.type == EventListenerRequest.REMOVE_EVENT_LISTENER_REQUEST)
         {
            _loc2_ = String(EventUtil.sandboxMouseEventMap[_loc3_.eventType]);
            if(_loc2_)
            {
               removeEventListenerFromOtherSystemManagers(_loc3_.eventType,otherSystemManagerMouseListener,true);
               removeEventListenerFromSandboxes(_loc3_.eventType,sandboxMouseListener,true,param1.target as IEventDispatcher);
               if(getSandboxRoot() == this)
               {
                  if(isTopLevelRoot() && (_loc2_ == MouseEvent.MOUSE_UP || _loc2_ == MouseEvent.MOUSE_MOVE))
                  {
                     stage.removeEventListener(_loc2_,eventProxy.marshalListener);
                  }
                  super.removeEventListener(_loc2_,eventProxy.marshalListener,true);
               }
            }
         }
      }
      
      mx_internal function set applicationIndex(param1:int) : void
      {
         _applicationIndex = param1;
      }
      
      private function showMouseCursorRequestHandler(param1:Event) : void
      {
         var _loc3_:IEventDispatcher = null;
         if(!isTopLevelRoot() && param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(!isTopLevelRoot())
         {
            _loc3_ = swfBridgeGroup.parentBridge;
            _loc2_.requestor = _loc3_;
            _loc3_.dispatchEvent(_loc2_);
            Object(param1).data = _loc2_.data;
         }
         else if(eventProxy)
         {
            Object(param1).data = SystemManagerGlobals.showMouseCursor;
         }
      }
      
      public function get childAllowsParent() : Boolean
      {
         try
         {
            return loaderInfo.childAllowsParent;
         }
         catch(error:Error)
         {
            return false;
         }
      }
      
      public function dispatchEventFromSWFBridges(param1:Event, param2:IEventDispatcher = null, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:Event = null;
         if(param4)
         {
            dispatchEventToOtherSystemManagers(param1);
         }
         if(!swfBridgeGroup)
         {
            return;
         }
         _loc5_ = param1.clone();
         if(param3)
         {
            currentSandboxEvent = _loc5_;
         }
         var _loc6_:IEventDispatcher;
         if((Boolean(_loc6_ = swfBridgeGroup.parentBridge)) && _loc6_ != param2)
         {
            if(_loc5_ is SWFBridgeRequest)
            {
               SWFBridgeRequest(_loc5_).requestor = _loc6_;
            }
            _loc6_.dispatchEvent(_loc5_);
         }
         var _loc7_:Array = swfBridgeGroup.getChildBridges();
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            if(_loc7_[_loc8_] != param2)
            {
               _loc5_ = param1.clone();
               if(param3)
               {
                  currentSandboxEvent = _loc5_;
               }
               if(_loc5_ is SWFBridgeRequest)
               {
                  SWFBridgeRequest(_loc5_).requestor = IEventDispatcher(_loc7_[_loc8_]);
               }
               IEventDispatcher(_loc7_[_loc8_]).dispatchEvent(_loc5_);
            }
            _loc8_++;
         }
         currentSandboxEvent = null;
      }
      
      private function setActualSizeRequestHandler(param1:Event) : void
      {
         var _loc2_:Object = Object(param1);
         setActualSize(_loc2_.data.width,_loc2_.data.height);
      }
      
      private function executeCallbacks() : void
      {
         var _loc1_:Function = null;
         if(!parent && parentAllowsChild)
         {
            return;
         }
         while(false)
         {
            _loc1_ = initCallbackFunctions.shift();
            _loc1_(this);
         }
      }
      
      private function addPlaceholderId(param1:String, param2:String, param3:IEventDispatcher, param4:Object) : void
      {
         if(!param3)
         {
            throw new Error();
         }
         if(!idToPlaceholder)
         {
            idToPlaceholder = [];
         }
         idToPlaceholder[param1] = new PlaceholderData(param2,param3,param4);
      }
      
      private function canActivateHandler(param1:Event) : void
      {
         var _loc3_:SWFBridgeRequest = null;
         var _loc6_:PlaceholderData = null;
         var _loc7_:RemotePopUp = null;
         var _loc8_:SystemManagerProxy = null;
         var _loc9_:IFocusManagerContainer = null;
         var _loc10_:IEventDispatcher = null;
         var _loc2_:Object = Object(param1);
         var _loc4_:Object = _loc2_.data;
         var _loc5_:String = null;
         if(_loc2_.data is String)
         {
            _loc4_ = (_loc6_ = idToPlaceholder[_loc2_.data]).data;
            if((_loc5_ = _loc6_.id) == null)
            {
               if(_loc7_ = findRemotePopUp(_loc4_,_loc6_.bridge))
               {
                  _loc3_ = new SWFBridgeRequest(SWFBridgeRequest.CAN_ACTIVATE_POP_UP_REQUEST,false,false,IEventDispatcher(_loc7_.bridge),_loc7_.window);
                  if(_loc7_.bridge)
                  {
                     _loc7_.bridge.dispatchEvent(_loc3_);
                     _loc2_.data = _loc3_.data;
                  }
                  return;
               }
            }
         }
         if(_loc4_ is SystemManagerProxy)
         {
            _loc8_ = SystemManagerProxy(_loc4_);
            _loc9_ = mx_internal::findFocusManagerContainer(_loc8_);
            _loc2_.data = _loc8_ && _loc9_ && canActivateLocalComponent(_loc9_);
         }
         else if(_loc4_ is IFocusManagerContainer)
         {
            _loc2_.data = canActivateLocalComponent(_loc4_);
         }
         else
         {
            if(!(_loc4_ is IEventDispatcher))
            {
               throw new Error();
            }
            _loc10_ = IEventDispatcher(_loc4_);
            _loc3_ = new SWFBridgeRequest(SWFBridgeRequest.CAN_ACTIVATE_POP_UP_REQUEST,false,false,_loc10_,_loc5_);
            if(_loc10_)
            {
               _loc10_.dispatchEvent(_loc3_);
               _loc2_.data = _loc3_.data;
            }
         }
      }
      
      private function docFrameListener(param1:Event) : void
      {
         if(currentFrame == 2)
         {
            removeEventListener(Event.ENTER_FRAME,docFrameListener);
            if(totalFrames > 2)
            {
               addEventListener(Event.ENTER_FRAME,extraFrameListener);
            }
            mx_internal::docFrameHandler();
         }
      }
      
      public function get popUpChildren() : IChildList
      {
         if(!mx_internal::topLevel)
         {
            return _topLevelSystemManager.popUpChildren;
         }
         if(!_popUpChildren)
         {
            _popUpChildren = new mx.managers.SystemChildrenList(this,new QName(mx_internal,"noTopMostIndex"),new QName(mx_internal,"topMostIndex"));
         }
         return _popUpChildren;
      }
      
      private function addEventListenerToSandboxes(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false, param6:IEventDispatcher = null) : void
      {
         var _loc10_:int = 0;
         var _loc11_:IEventDispatcher = null;
         if(!swfBridgeGroup)
         {
            return;
         }
         var _loc7_:EventListenerRequest = new EventListenerRequest(EventListenerRequest.ADD_EVENT_LISTENER_REQUEST,false,false,param1,param3,param4,param5);
         var _loc8_:IEventDispatcher;
         if((Boolean(_loc8_ = swfBridgeGroup.parentBridge)) && _loc8_ != param6)
         {
            _loc8_.addEventListener(param1,param2,false,param4,param5);
         }
         var _loc9_:Array = swfBridgeGroup.getChildBridges();
         while(_loc10_ < _loc9_.length)
         {
            if((_loc11_ = IEventDispatcher(_loc9_[_loc10_])) != param6)
            {
               _loc11_.addEventListener(param1,param2,false,param4,param5);
            }
            _loc10_++;
         }
         dispatchEventFromSWFBridges(_loc7_,param6);
      }
      
      private function forwardFormEvent(param1:SWFBridgeEvent) : Boolean
      {
         var _loc3_:DisplayObject = null;
         if(isTopLevelRoot())
         {
            return false;
         }
         var _loc2_:IEventDispatcher = swfBridgeGroup.parentBridge;
         if(_loc2_)
         {
            _loc3_ = getSandboxRoot();
            param1.data.notifier = _loc2_;
            if(_loc3_ == this)
            {
               if(!(param1.data.window is String))
               {
                  param1.data.window = NameUtil.displayObjectToString(DisplayObject(param1.data.window));
               }
               else
               {
                  param1.data.window = NameUtil.displayObjectToString(DisplayObject(this)) + "." + param1.data.window;
               }
               _loc2_.dispatchEvent(param1);
            }
            else
            {
               if(param1.data.window is String)
               {
                  param1.data.window = NameUtil.displayObjectToString(DisplayObject(this)) + "." + param1.data.window;
               }
               _loc3_.dispatchEvent(param1);
            }
         }
         return true;
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         _explicitHeight = param1;
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         --mx_internal::noTopMostIndex;
         return mx_internal::rawChildren_removeChild(param1);
      }
      
      mx_internal function rawChildren_removeChild(param1:DisplayObject) : DisplayObject
      {
         mx_internal::removingChild(param1);
         super.removeChild(param1);
         mx_internal::childRemoved(param1);
         return param1;
      }
      
      final mx_internal function get $numChildren() : int
      {
         return super.numChildren;
      }
      
      public function get toolTipChildren() : IChildList
      {
         if(!mx_internal::topLevel)
         {
            return _topLevelSystemManager.toolTipChildren;
         }
         if(!_toolTipChildren)
         {
            _toolTipChildren = new mx.managers.SystemChildrenList(this,new QName(mx_internal,"topMostIndex"),new QName(mx_internal,"toolTipIndex"));
         }
         return _toolTipChildren;
      }
      
      public function create(... rest) : Object
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:String = String(info()["mainClassName"]);
         if(_loc2_ == null)
         {
            _loc5_ = (_loc4_ = "null").lastIndexOf(".");
            _loc6_ = _loc4_.lastIndexOf("/");
            _loc2_ = _loc4_.substring(_loc6_ + 1,_loc5_);
         }
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         return !!_loc3_ ? new _loc3_() : null;
      }
      
      override public function get stage() : Stage
      {
         var _loc2_:DisplayObject = null;
         if(_stage)
         {
            return _stage;
         }
         var _loc1_:Stage = super.stage;
         if(_loc1_)
         {
            _stage = _loc1_;
            return _loc1_;
         }
         if(!mx_internal::topLevel && Boolean(_topLevelSystemManager))
         {
            _stage = _topLevelSystemManager.stage;
            return _stage;
         }
         if(!isStageRoot && mx_internal::topLevel)
         {
            _loc2_ = getTopLevelRoot();
            if(_loc2_)
            {
               _stage = _loc2_.stage;
               return _stage;
            }
         }
         return null;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:int = numChildren;
         if(param1.parent == this)
         {
            _loc2_--;
         }
         return addChildAt(param1,_loc2_);
      }
      
      private function removeRemotePopUp(param1:RemotePopUp) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(isRemotePopUp(forms[_loc3_]))
            {
               if(forms[_loc3_].window == param1.window && forms[_loc3_].bridge == param1.bridge)
               {
                  if(forms[_loc3_] == param1)
                  {
                     deactivateForm(param1);
                  }
                  forms.splice(_loc3_,1);
                  break;
               }
            }
            _loc3_++;
         }
      }
      
      private function deactivateRemotePopUp(param1:Object) : void
      {
         var _loc2_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.DEACTIVATE_POP_UP_REQUEST,false,false,param1.bridge,param1.window);
         var _loc3_:Object = param1.bridge;
         if(_loc3_)
         {
            _loc3_.dispatchEvent(_loc2_);
         }
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1) - mx_internal::applicationIndex;
      }
      
      mx_internal function rawChildren_getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1);
      }
      
      public function activate(param1:IFocusManagerContainer) : void
      {
         activateForm(param1);
      }
      
      public function getSandboxRoot() : DisplayObject
      {
         var parent:DisplayObject = null;
         var lastParent:DisplayObject = null;
         var loader:Loader = null;
         var loaderInfo:LoaderInfo = null;
         var sm:mx.managers.ISystemManager = {};
         try
         {
            if(sm.topLevelSystemManager)
            {
               sm = sm.topLevelSystemManager;
            }
            parent = DisplayObject(sm).parent;
            if(parent is Stage)
            {
               return DisplayObject(sm);
            }
            if(Boolean(parent) && !parent.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot",false,true)))
            {
               return this;
            }
            lastParent = {};
            while(parent)
            {
               if(parent is Stage)
               {
                  return lastParent;
               }
               if(!parent.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot",false,true)))
               {
                  return lastParent;
               }
               if(parent is Loader)
               {
                  loader = Loader(parent);
                  loaderInfo = loader.contentLoaderInfo;
                  if(!loaderInfo.childAllowsParent)
                  {
                     return loaderInfo.content;
                  }
               }
               if(parent.hasEventListener(InterManagerRequest.SYSTEM_MANAGER_REQUEST))
               {
                  lastParent = parent;
               }
               parent = parent.parent;
            }
         }
         catch(error:Error)
         {
         }
         return lastParent != null ? lastParent : DisplayObject(sm);
      }
      
      private function deferredNextFrame() : void
      {
         if(currentFrame + 1 > totalFrames)
         {
            return;
         }
         if(currentFrame + 1 <= framesLoaded)
         {
            nextFrame();
         }
         else
         {
            nextFrameTimer = new Timer(100);
            nextFrameTimer.addEventListener(TimerEvent.TIMER,nextFrameTimerHandler);
            nextFrameTimer.start();
         }
      }
      
      mx_internal function get cursorIndex() : int
      {
         return _cursorIndex;
      }
      
      mx_internal function rawChildren_contains(param1:DisplayObject) : Boolean
      {
         return super.contains(param1);
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         super.setChildIndex(param1,mx_internal::applicationIndex + param2);
      }
      
      public function get document() : Object
      {
         return _document;
      }
      
      private function resizeMouseCatcher() : void
      {
         var g:Graphics = null;
         var s:Rectangle = null;
         if(mouseCatcher)
         {
            try
            {
               g = mouseCatcher.graphics;
               s = screen;
               g.clear();
               g.beginFill(0,0);
               g.drawRect(0,0,s.width,s.height);
               g.endFill();
            }
            catch(e:SecurityError)
            {
            }
         }
      }
      
      private function extraFrameListener(param1:Event) : void
      {
         if(lastFrame == currentFrame)
         {
            return;
         }
         lastFrame = currentFrame;
         if(currentFrame + 1 > totalFrames)
         {
            removeEventListener(Event.ENTER_FRAME,extraFrameListener);
         }
         extraFrameHandler();
      }
      
      private function addPopupRequestHandler(param1:Event) : void
      {
         var _loc3_:* = false;
         var _loc4_:IChildList = null;
         var _loc6_:ISWFBridgeProvider = null;
         var _loc7_:SWFBridgeRequest = null;
         if(param1.target != this && param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(param1.target != this)
         {
            _loc6_ = swfBridgeGroup.getChildBridgeProvider(IEventDispatcher(param1.target));
            if(!SecurityUtil.hasMutualTrustBetweenParentAndChild(_loc6_))
            {
               return;
            }
         }
         if(false && SecurityUtil.hasMutualTrustBetweenParentAndChild(this))
         {
            _loc2_.requestor = swfBridgeGroup.parentBridge;
            getSandboxRoot().dispatchEvent(_loc2_);
            return;
         }
         if(!_loc2_.data.childList || _loc2_.data.childList == PopUpManagerChildList.PARENT)
         {
            _loc3_ = Boolean(_loc2_.data.parent) && popUpChildren.contains(_loc2_.data.parent);
         }
         else
         {
            _loc3_ = _loc2_.data.childList == PopUpManagerChildList.POPUP;
         }
         (_loc4_ = _loc3_ ? popUpChildren : this).addChild(DisplayObject(_loc2_.data.window));
         if(_loc2_.data.modal)
         {
            ++numModalWindows;
         }
         var _loc5_:RemotePopUp = new RemotePopUp(_loc2_.data.window,_loc2_.requestor);
         forms.push(_loc5_);
         if(!isTopLevelRoot() && Boolean(swfBridgeGroup))
         {
            (_loc7_ = new SWFBridgeRequest(SWFBridgeRequest.ADD_POP_UP_PLACE_HOLDER_REQUEST,false,false,_loc2_.requestor,{"window":_loc2_.data.window})).data.placeHolderId = NameUtil.displayObjectToString(DisplayObject(_loc2_.data.window));
            dispatchEvent(_loc7_);
         }
      }
      
      override public function get height() : Number
      {
         return _height;
      }
      
      mx_internal function rawChildren_getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(param1);
      }
      
      private function systemManagerHandler(param1:Event) : void
      {
         if(param1["name"] == "sameSandbox")
         {
            param1["value"] = currentSandboxEvent == param1["value"];
            return;
         }
         if(param1["name"] == "hasSWFBridges")
         {
            param1["value"] = hasSWFBridges();
            return;
         }
         if(param1 is InterManagerRequest)
         {
            return;
         }
         var _loc2_:String = String(param1["name"]);
         switch(_loc2_)
         {
            case "popUpChildren.addChild":
               popUpChildren.addChild(param1["value"]);
               break;
            case "popUpChildren.removeChild":
               popUpChildren.removeChild(param1["value"]);
               break;
            case "cursorChildren.addChild":
               cursorChildren.addChild(param1["value"]);
               break;
            case "cursorChildren.removeChild":
               cursorChildren.removeChild(param1["value"]);
               break;
            case "toolTipChildren.addChild":
               toolTipChildren.addChild(param1["value"]);
               break;
            case "toolTipChildren.removeChild":
               toolTipChildren.removeChild(param1["value"]);
               break;
            case "screen":
               param1["value"] = screen;
               break;
            case "application":
               param1["value"] = application;
               break;
            case "isTopLevelRoot":
               param1["value"] = isTopLevelRoot();
               break;
            case "getVisibleApplicationRect":
               param1["value"] = getVisibleApplicationRect();
               break;
            case "bringToFront":
               if(param1["value"].topMost)
               {
                  popUpChildren.setChildIndex(DisplayObject(param1["value"].popUp),-1);
               }
               else
               {
                  setChildIndex(DisplayObject(param1["value"].popUp),numChildren - 1);
               }
         }
      }
      
      private function activateRemotePopUp(param1:Object) : void
      {
         var _loc2_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.ACTIVATE_POP_UP_REQUEST,false,false,param1.bridge,param1.window);
         var _loc3_:Object = param1.bridge;
         if(_loc3_)
         {
            _loc3_.dispatchEvent(_loc2_);
         }
      }
      
      mx_internal function set noTopMostIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _noTopMostIndex;
         _noTopMostIndex = param1;
         mx_internal::topMostIndex += _loc2_;
      }
      
      override public function getObjectsUnderPoint(param1:Point) : Array
      {
         var _loc5_:DisplayObject = null;
         var _loc6_:Array = null;
         var _loc2_:* = [];
         var _loc3_:int = mx_internal::topMostIndex;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = super.getChildAt(_loc4_)) is DisplayObjectContainer)
            {
               if(_loc6_ = DisplayObjectContainer(_loc5_).getObjectsUnderPoint(param1))
               {
                  _loc2_ = _loc2_.concat(_loc6_);
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      mx_internal function get topMostIndex() : int
      {
         return _topMostIndex;
      }
      
      mx_internal function regenerateStyleCache(param1:Boolean) : void
      {
         var _loc5_:IStyleClient = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc5_ = rawChildren.getChildAt(_loc4_) as IStyleClient)
            {
               _loc5_.regenerateStyleCache(param1);
            }
            if(isTopLevelWindow(DisplayObject(_loc5_)))
            {
               _loc2_ = true;
            }
            _loc3_ = 0;
            _loc4_++;
         }
         if(!_loc2_ && mx_internal::topLevelWindow is IStyleClient)
         {
            IStyleClient(mx_internal::topLevelWindow).regenerateStyleCache(param1);
         }
      }
      
      public function addFocusManager(param1:IFocusManagerContainer) : void
      {
         forms.push(param1);
      }
      
      private function deactivateFormSandboxEventHandler(param1:Event) : void
      {
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeEvent = SWFBridgeEvent.marshal(param1);
         if(!forwardFormEvent(_loc2_))
         {
            if(isRemotePopUp(form) && RemotePopUp(form).window == _loc2_.data.window && RemotePopUp(form).bridge == _loc2_.data.notifier)
            {
               deactivateForm(form);
            }
         }
      }
      
      public function set swfBridgeGroup(param1:ISWFBridgeGroup) : void
      {
         if(mx_internal::topLevel)
         {
            _swfBridgeGroup = param1;
         }
         else if(topLevelSystemManager)
         {
            SystemManager(topLevelSystemManager).swfBridgeGroup = param1;
         }
      }
      
      mx_internal function rawChildren_setChildIndex(param1:DisplayObject, param2:int) : void
      {
         super.setChildIndex(param1,param2);
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         mx_internal::idleCounter = 0;
      }
      
      mx_internal function childAdded(param1:DisplayObject) : void
      {
         param1.dispatchEvent(new FlexEvent(FlexEvent.ADD));
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).initialize();
         }
      }
      
      public function isFontFaceEmbedded(param1:TextFormat) : Boolean
      {
         var _loc6_:Font = null;
         var _loc7_:String = null;
         var _loc2_:String = param1.font;
         var _loc3_:Array = Font.enumerateFonts();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if((_loc6_ = Font(_loc3_[_loc4_])).fontName == _loc2_)
            {
               _loc7_ = "regular";
               if(Boolean(param1.bold) && Boolean(param1.italic))
               {
                  _loc7_ = "boldItalic";
               }
               else if(param1.bold)
               {
                  _loc7_ = "bold";
               }
               else if(param1.italic)
               {
                  _loc7_ = "italic";
               }
               if(_loc6_.fontStyle == _loc7_)
               {
                  return true;
               }
            }
            _loc4_++;
         }
         if(!_loc2_ || !embeddedFontList || true)
         {
            return false;
         }
         var _loc5_:Object = embeddedFontList[_loc2_];
         return !(Boolean(param1.bold) && !_loc5_.bold || Boolean(param1.italic) && !_loc5_.italic || !param1.bold && !param1.italic && !_loc5_.regular);
      }
      
      private function forwardPlaceholderRequest(param1:SWFBridgeRequest, param2:Boolean) : Boolean
      {
         if(isTopLevelRoot())
         {
            return false;
         }
         var _loc3_:Object = null;
         var _loc4_:String = null;
         if(param1.data.window)
         {
            _loc3_ = param1.data.window;
            param1.data.window = null;
         }
         else
         {
            _loc3_ = param1.requestor;
            _loc4_ = String(param1.data.placeHolderId);
            param1.data.placeHolderId = NameUtil.displayObjectToString(this) + "." + param1.data.placeHolderId;
         }
         if(param2)
         {
            addPlaceholderId(param1.data.placeHolderId,_loc4_,param1.requestor,_loc3_);
         }
         else
         {
            removePlaceholderId(param1.data.placeHolderId);
         }
         var _loc5_:DisplayObject = getSandboxRoot();
         var _loc6_:IEventDispatcher = swfBridgeGroup.parentBridge;
         param1.requestor = _loc6_;
         if(_loc5_ == this)
         {
            _loc6_.dispatchEvent(param1);
         }
         else
         {
            _loc5_.dispatchEvent(param1);
         }
         return true;
      }
      
      public function getTopLevelRoot() : DisplayObject
      {
         var sm:mx.managers.ISystemManager = null;
         var parent:DisplayObject = null;
         var lastParent:DisplayObject = null;
         try
         {
            sm = {};
            if(sm.topLevelSystemManager)
            {
               sm = sm.topLevelSystemManager;
            }
            parent = DisplayObject(sm).parent;
            lastParent = parent;
            while(parent)
            {
               if(parent is Stage)
               {
                  return lastParent;
               }
               lastParent = parent;
               parent = parent.parent;
            }
         }
         catch(error:SecurityError)
         {
         }
         return null;
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var actualType:String = null;
         var type:String = param1;
         var listener:Function = param2;
         var useCapture:Boolean = param3;
         if(type == FlexEvent.RENDER || type == FlexEvent.ENTER_FRAME)
         {
            if(type == FlexEvent.RENDER)
            {
               type = "null";
            }
            else
            {
               type = "null";
            }
            try
            {
               if(stage)
               {
                  stage.removeEventListener(type,listener,useCapture);
               }
            }
            catch(error:SecurityError)
            {
            }
            super.removeEventListener(type,listener,useCapture);
            return;
         }
         if(hasSWFBridges() || SystemManagerGlobals.topLevelSystemManagers.length > 1)
         {
            actualType = String(EventUtil.sandboxMouseEventMap[type]);
            if(actualType)
            {
               if(getSandboxRoot() == this && Boolean(eventProxy))
               {
                  super.removeEventListener(actualType,eventProxy.marshalListener,useCapture);
                  if(actualType == MouseEvent.MOUSE_UP)
                  {
                     try
                     {
                        if(stage)
                        {
                           stage.removeEventListener(Event.MOUSE_LEAVE,eventProxy.marshalListener,useCapture);
                        }
                     }
                     catch(e:SecurityError)
                     {
                     }
                     super.removeEventListener(Event.MOUSE_LEAVE,eventProxy.marshalListener,useCapture);
                  }
               }
               if(true)
               {
                  removeEventListenerFromOtherSystemManagers(type,otherSystemManagerMouseListener,useCapture);
               }
               removeEventListenerFromSandboxes(type,sandboxMouseListener,useCapture);
               super.removeEventListener(type,listener,false);
               return;
            }
         }
         if(type == FlexEvent.IDLE)
         {
            super.removeEventListener(type,listener,useCapture);
            if(!hasEventListener(FlexEvent.IDLE) && Boolean(idleTimer))
            {
               idleTimer.stop();
               idleTimer = null;
               removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
               removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
            }
         }
         else
         {
            super.removeEventListener(type,listener,useCapture);
         }
         if(type == MouseEvent.MOUSE_MOVE || type == MouseEvent.MOUSE_UP || type == MouseEvent.MOUSE_DOWN || type == Event.ACTIVATE || type == Event.DEACTIVATE)
         {
            if(!hasEventListener(type))
            {
               try
               {
                  if(stage)
                  {
                     stage.removeEventListener(type,stageEventHandler,false);
                  }
               }
               catch(error:SecurityError)
               {
               }
            }
         }
         if(type == SandboxMouseEvent.MOUSE_UP_SOMEWHERE)
         {
            if(!hasEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE))
            {
               try
               {
                  if(stage)
                  {
                     stage.removeEventListener(Event.MOUSE_LEAVE,mouseLeaveHandler);
                  }
               }
               catch(error:SecurityError)
               {
               }
               super.removeEventListener(Event.MOUSE_LEAVE,mouseLeaveHandler);
            }
         }
      }
      
      private function extraFrameHandler(param1:Event = null) : void
      {
         var _loc3_:Class = null;
         var _loc2_:Object = info()["frames"];
         if(Boolean(_loc2_) && Boolean(_loc2_[currentLabel]))
         {
            _loc3_ = Class(getDefinitionByName(_loc2_[currentLabel]));
            _loc3_["frame"](this);
         }
         deferredNextFrame();
      }
      
      public function isTopLevelRoot() : Boolean
      {
         return isStageRoot || isBootstrapRoot;
      }
      
      public function get application() : IUIComponent
      {
         return IUIComponent(_document);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         --mx_internal::noTopMostIndex;
         return mx_internal::rawChildren_removeChildAt(mx_internal::applicationIndex + param1);
      }
      
      mx_internal function rawChildren_removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.getChildAt(param1);
         mx_internal::removingChild(_loc2_);
         super.removeChildAt(param1);
         mx_internal::childRemoved(_loc2_);
         return _loc2_;
      }
      
      private function getSWFBridgeOfDisplayObject(param1:DisplayObject) : IEventDispatcher
      {
         var _loc2_:SWFBridgeRequest = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:IEventDispatcher = null;
         var _loc7_:ISWFBridgeProvider = null;
         if(swfBridgeGroup)
         {
            _loc2_ = new SWFBridgeRequest(SWFBridgeRequest.IS_BRIDGE_CHILD_REQUEST,false,false,null,param1);
            _loc3_ = swfBridgeGroup.getChildBridges();
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = IEventDispatcher(_loc3_[_loc5_]);
               _loc7_ = swfBridgeGroup.getChildBridgeProvider(_loc6_);
               if(SecurityUtil.hasMutualTrustBetweenParentAndChild(_loc7_))
               {
                  _loc6_.dispatchEvent(_loc2_);
                  if(_loc2_.data == true)
                  {
                     return _loc6_;
                  }
                  _loc2_.data = param1;
               }
               _loc5_++;
            }
         }
         return null;
      }
      
      private function deactivateRequestHandler(param1:Event) : void
      {
         var _loc5_:PlaceholderData = null;
         var _loc6_:RemotePopUp = null;
         var _loc7_:SystemManagerProxy = null;
         var _loc8_:IFocusManagerContainer = null;
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         var _loc3_:Object = _loc2_.data;
         var _loc4_:String = null;
         if(_loc2_.data is String)
         {
            _loc3_ = (_loc5_ = idToPlaceholder[_loc2_.data]).data;
            if((_loc4_ = _loc5_.id) == null)
            {
               if(_loc6_ = findRemotePopUp(_loc3_,_loc5_.bridge))
               {
                  deactivateRemotePopUp(_loc6_);
                  return;
               }
            }
         }
         if(_loc3_ is SystemManagerProxy)
         {
            _loc7_ = SystemManagerProxy(_loc3_);
            _loc8_ = mx_internal::findFocusManagerContainer(_loc7_);
            if(Boolean(_loc7_) && Boolean(_loc8_))
            {
               _loc7_.deactivateByProxy(_loc8_);
            }
         }
         else
         {
            if(!(_loc3_ is IFocusManagerContainer))
            {
               if(_loc3_ is IEventDispatcher)
               {
                  _loc2_.data = _loc4_;
                  _loc2_.requestor = IEventDispatcher(_loc3_);
                  IEventDispatcher(_loc3_).dispatchEvent(_loc2_);
                  return;
               }
               throw new Error();
            }
            IFocusManagerContainer(_loc3_).focusManager.deactivate();
         }
      }
      
      private function installCompiledResourceBundles() : void
      {
         var _loc1_:Object = this.info();
         var _loc2_:ApplicationDomain = !mx_internal::topLevel && parent is Loader ? Loader(parent).contentLoaderInfo.applicationDomain : _loc1_["currentDomain"];
         var _loc3_:Array = _loc1_["compiledLocales"];
         var _loc4_:Array = _loc1_["compiledResourceBundleNames"];
         var _loc5_:IResourceManager;
         (_loc5_ = ResourceManager.getInstance()).installCompiledResourceBundles(_loc2_,_loc3_,_loc4_);
         if(!_loc5_.localeChain)
         {
            _loc5_.initializeLocaleChain(_loc3_);
         }
      }
      
      private function deactivateForm(param1:Object) : void
      {
         if(form)
         {
            if(form == param1 && false)
            {
               if(isRemotePopUp(form))
               {
                  deactivateRemotePopUp(form);
               }
               else
               {
                  form.focusManager.deactivate();
               }
               form = findLastActiveForm(param1);
               if(form)
               {
                  if(isRemotePopUp(form))
                  {
                     activateRemotePopUp(form);
                  }
                  else
                  {
                     form.focusManager.activate();
                  }
               }
            }
         }
      }
      
      private function unloadHandler(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      mx_internal function removingChild(param1:DisplayObject) : void
      {
         param1.dispatchEvent(new FlexEvent(FlexEvent.REMOVE));
      }
      
      mx_internal function get applicationIndex() : int
      {
         return _applicationIndex;
      }
      
      mx_internal function set toolTipIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _toolTipIndex;
         _toolTipIndex = param1;
         mx_internal::cursorIndex += _loc2_;
      }
      
      private function hasSWFBridges() : Boolean
      {
         if(swfBridgeGroup)
         {
            return true;
         }
         return false;
      }
      
      private function updateLastActiveForm() : void
      {
         var _loc1_:int = 0;
         if(_loc1_ < 2)
         {
            return;
         }
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            if(areFormsEqual(form,forms[_loc3_]))
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_ >= 0)
         {
            forms.splice(_loc2_,1);
            forms.push(form);
         }
      }
      
      mx_internal function set bridgeToFocusManager(param1:Dictionary) : void
      {
         if(mx_internal::topLevel)
         {
            _bridgeToFocusManager = param1;
         }
         else if(topLevelSystemManager)
         {
            SystemManager(topLevelSystemManager).mx_internal::bridgeToFocusManager = param1;
         }
      }
      
      public function get cursorChildren() : IChildList
      {
         if(!mx_internal::topLevel)
         {
            return _topLevelSystemManager.cursorChildren;
         }
         if(!_cursorChildren)
         {
            _cursorChildren = new mx.managers.SystemChildrenList(this,new QName(mx_internal,"toolTipIndex"),new QName(mx_internal,"cursorIndex"));
         }
         return _cursorChildren;
      }
      
      private function sandboxMouseListener(param1:Event) : void
      {
         if(param1 is SandboxMouseEvent)
         {
            return;
         }
         var _loc2_:Event = SandboxMouseEvent.marshal(param1);
         dispatchEventFromSWFBridges(_loc2_,param1.target as IEventDispatcher);
         var _loc3_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST);
         _loc3_.name = "sameSandbox";
         _loc3_.value = param1;
         getSandboxRoot().dispatchEvent(_loc3_);
         if(!_loc3_.value)
         {
            dispatchEvent(_loc2_);
         }
      }
      
      public function get preloaderBackgroundImage() : Object
      {
         return info()["backgroundImage"];
      }
      
      public function set numModalWindows(param1:int) : void
      {
         _numModalWindows = param1;
      }
      
      public function get preloaderBackgroundAlpha() : Number
      {
         return info()["backgroundAlpha"];
      }
      
      mx_internal function rawChildren_getChildByName(param1:String) : DisplayObject
      {
         return super.getChildByName(param1);
      }
      
      private function dispatchInvalidateRequest() : void
      {
         var _loc1_:IEventDispatcher = swfBridgeGroup.parentBridge;
         var _loc2_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.INVALIDATE_REQUEST,false,false,_loc1_,0 | 0);
         _loc1_.dispatchEvent(_loc2_);
      }
      
      public function allowDomain(... rest) : void
      {
      }
      
      public function get preloaderBackgroundColor() : uint
      {
         var _loc1_:* = info()["backgroundColor"];
         if(_loc1_ == undefined)
         {
            return StyleManager.NOT_A_COLOR;
         }
         return StyleManager.getColorName(_loc1_);
      }
      
      public function getVisibleApplicationRect(param1:Rectangle = null) : Rectangle
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Point = null;
         var _loc4_:IEventDispatcher = null;
         var _loc5_:SWFBridgeRequest = null;
         if(!param1)
         {
            param1 = getBounds(DisplayObject(this));
            _loc2_ = screen;
            _loc3_ = new Point(Math.max(0,param1.x),Math.max(0,param1.y));
            _loc3_ = localToGlobal(_loc3_);
            param1.x = _loc3_.x;
            param1.y = _loc3_.y;
            param1.width = _loc2_.width;
            param1.height = _loc2_.height;
         }
         if(useSWFBridge())
         {
            _loc4_ = swfBridgeGroup.parentBridge;
            _loc5_ = new SWFBridgeRequest(SWFBridgeRequest.GET_VISIBLE_RECT_REQUEST,false,false,_loc4_,param1);
            _loc4_.dispatchEvent(_loc5_);
            param1 = Rectangle(_loc5_.data);
         }
         return param1;
      }
      
      public function get topLevelSystemManager() : mx.managers.ISystemManager
      {
         if(mx_internal::topLevel)
         {
            return this;
         }
         return _topLevelSystemManager;
      }
      
      private function appCreationCompleteHandler(param1:FlexEvent) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         if(!mx_internal::topLevel && Boolean(parent))
         {
            _loc2_ = parent.parent;
            while(_loc2_)
            {
               if(_loc2_ is IInvalidating)
               {
                  IInvalidating(_loc2_).invalidateSize();
                  IInvalidating(_loc2_).invalidateDisplayList();
                  return;
               }
               _loc2_ = _loc2_.parent;
            }
         }
         if(mx_internal::topLevel && useSWFBridge())
         {
            dispatchInvalidateRequest();
         }
      }
      
      public function addChildToSandboxRoot(param1:String, param2:DisplayObject) : void
      {
         var _loc3_:InterManagerRequest = null;
         if(getSandboxRoot() == this)
         {
            this[param1].addChild(param2);
         }
         else
         {
            mx_internal::addingChild(param2);
            _loc3_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST);
            _loc3_.name = param1 + ".addChild";
            _loc3_.value = param2;
            getSandboxRoot().dispatchEvent(_loc3_);
            mx_internal::childAdded(param2);
         }
      }
      
      private function dispatchDeactivatedWindowEvent(param1:DisplayObject) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:* = false;
         var _loc5_:SWFBridgeEvent = null;
         var _loc2_:IEventDispatcher = !!swfBridgeGroup ? swfBridgeGroup.parentBridge : null;
         if(_loc2_)
         {
            _loc3_ = getSandboxRoot();
            _loc4_ = _loc3_ != this;
            _loc5_ = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_WINDOW_DEACTIVATE,false,false,{
               "notifier":_loc2_,
               "window":(_loc4_ ? param1 : NameUtil.displayObjectToString(param1))
            });
            if(_loc4_)
            {
               _loc3_.dispatchEvent(_loc5_);
            }
            else
            {
               _loc2_.dispatchEvent(_loc5_);
            }
         }
      }
      
      private function isBridgeChildHandler(param1:Event) : void
      {
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:Object = Object(param1);
         _loc2_.data = _loc2_.data && rawChildren.contains(_loc2_.data as DisplayObject);
      }
      
      public function get measuredHeight() : Number
      {
         return !!mx_internal::topLevelWindow ? mx_internal::topLevelWindow.getExplicitOrMeasuredHeight() : loaderInfo.height;
      }
      
      private function activateRequestHandler(param1:Event) : void
      {
         var _loc5_:PlaceholderData = null;
         var _loc6_:RemotePopUp = null;
         var _loc7_:SystemManagerProxy = null;
         var _loc8_:IFocusManagerContainer = null;
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         var _loc3_:Object = _loc2_.data;
         var _loc4_:String = null;
         if(_loc2_.data is String)
         {
            _loc3_ = (_loc5_ = idToPlaceholder[_loc2_.data]).data;
            if((_loc4_ = _loc5_.id) == null)
            {
               if(_loc6_ = findRemotePopUp(_loc3_,_loc5_.bridge))
               {
                  activateRemotePopUp(_loc6_);
                  return;
               }
            }
         }
         if(_loc3_ is SystemManagerProxy)
         {
            _loc7_ = SystemManagerProxy(_loc3_);
            _loc8_ = mx_internal::findFocusManagerContainer(_loc7_);
            if(Boolean(_loc7_) && Boolean(_loc8_))
            {
               _loc7_.activateByProxy(_loc8_);
            }
         }
         else if(_loc3_ is IFocusManagerContainer)
         {
            IFocusManagerContainer(_loc3_).focusManager.activate();
         }
         else
         {
            if(!(_loc3_ is IEventDispatcher))
            {
               throw new Error();
            }
            _loc2_.data = _loc4_;
            _loc2_.requestor = IEventDispatcher(_loc3_);
            IEventDispatcher(_loc3_).dispatchEvent(_loc2_);
         }
      }
      
      mx_internal function rawChildren_addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         mx_internal::addingChild(param1);
         super.addChildAt(param1,param2);
         mx_internal::childAdded(param1);
         return param1;
      }
      
      mx_internal function initialize() : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:* = null;
         var _loc13_:Class = null;
         var _loc14_:Object = null;
         var _loc15_:RSLItem = null;
         if(isStageRoot)
         {
            _width = stage.stageWidth;
            _height = stage.stageHeight;
         }
         else
         {
            _width = loaderInfo.width;
            _height = loaderInfo.height;
         }
         preloader = new Preloader();
         preloader.addEventListener(FlexEvent.INIT_PROGRESS,preloader_initProgressHandler);
         preloader.addEventListener(FlexEvent.PRELOADER_DONE,preloader_preloaderDoneHandler);
         preloader.addEventListener(RSLEvent.RSL_COMPLETE,preloader_rslCompleteHandler);
         if(!_popUpChildren)
         {
            _popUpChildren = new mx.managers.SystemChildrenList(this,new QName(mx_internal,"noTopMostIndex"),new QName(mx_internal,"topMostIndex"));
         }
         _popUpChildren.addChild(preloader);
         var _loc1_:Array = info()["rsls"];
         var _loc2_:Array = info()["cdRsls"];
         var _loc3_:Boolean = true;
         if(info()["usePreloader"] != undefined)
         {
            _loc3_ = Boolean(info()["usePreloader"]);
         }
         var _loc4_:Class = info()["preloader"] as Class;
         if(_loc3_ && !_loc4_)
         {
            _loc4_ = DownloadProgressBar;
         }
         var _loc5_:* = [];
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc13_ = Class(getDefinitionByName("mx.core::CrossDomainRSLItem"));
            _loc6_ = int(_loc2_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc14_ = new _loc13_(_loc2_[_loc7_]["rsls"],_loc2_[_loc7_]["policyFiles"],_loc2_[_loc7_]["digests"],_loc2_[_loc7_]["types"],_loc2_[_loc7_]["isSigned"],LoaderUtil.normalizeURL(this.loaderInfo));
               _loc5_.push(_loc14_);
               _loc7_++;
            }
         }
         if(_loc1_ != null && _loc1_.length > 0)
         {
            _loc6_ = int(_loc1_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc15_ = new RSLItem(_loc1_[_loc7_].url,LoaderUtil.normalizeURL(this.loaderInfo));
               _loc5_.push(_loc15_);
               _loc7_++;
            }
         }
         Singleton.registerClass("mx.resources::IResourceManager",Class(getDefinitionByName("mx.resources::ResourceManagerImpl")));
         var _loc8_:IResourceManager = ResourceManager.getInstance();
         Singleton.registerClass("mx.core::IEmbeddedFontRegistry",Class(getDefinitionByName("mx.core::EmbeddedFontRegistry")));
         Singleton.registerClass("mx.styles::IStyleManager",Class(getDefinitionByName("mx.styles::StyleManagerImpl")));
         Singleton.registerClass("mx.styles::IStyleManager2",Class(getDefinitionByName("mx.styles::StyleManagerImpl")));
         var _loc10_:String;
         if((_loc10_ = String(loaderInfo.parameters["localeChain"])) != null && _loc10_ != "")
         {
            _loc8_.localeChain = _loc10_.split(",");
         }
         var _loc11_:String;
         var _loc12_:Array = !!(_loc11_ = String(loaderInfo.parameters["resourceModuleURLs"])) ? _loc11_.split(",") : null;
         preloader.initialize(_loc3_,_loc4_,preloaderBackgroundColor,preloaderBackgroundAlpha,preloaderBackgroundImage,preloaderBackgroundSize,isStageRoot ? 0 : loaderInfo.width,isStageRoot ? 0 : loaderInfo.height,null,null,_loc5_,_loc12_);
      }
      
      public function useSWFBridge() : Boolean
      {
         var sbRoot:DisplayObject;
         if(isStageRoot)
         {
            return false;
         }
         if(!mx_internal::topLevel && Boolean(topLevelSystemManager))
         {
            return topLevelSystemManager.useSWFBridge();
         }
         sbRoot = getSandboxRoot();
         if(mx_internal::topLevel && sbRoot != this)
         {
            return true;
         }
         if(sbRoot == this)
         {
            try
            {
               root.loaderInfo.parentAllowsChild;
               if(!(parentAllowsChild && childAllowsParent))
               {
                  return true;
               }
               try
               {
                  if(!parent.dispatchEvent(new Event("mx.managers.SystemManager.isStageRoot",false,true)))
                  {
                     return true;
                  }
               }
               catch(e:Error)
               {
               }
            }
            catch(e1:Error)
            {
               return false;
            }
         }
         return false;
      }
      
      mx_internal function childRemoved(param1:DisplayObject) : void
      {
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).parentChanged(null);
         }
      }
      
      final mx_internal function $removeChildAt(param1:int) : DisplayObject
      {
         return super.removeChildAt(param1);
      }
      
      private function canActivatePopUp(param1:Object) : Boolean
      {
         var _loc2_:RemotePopUp = null;
         var _loc3_:SWFBridgeRequest = null;
         if(isRemotePopUp(param1))
         {
            _loc2_ = RemotePopUp(param1);
            _loc3_ = new SWFBridgeRequest(SWFBridgeRequest.CAN_ACTIVATE_POP_UP_REQUEST,false,false,null,_loc2_.window);
            IEventDispatcher(_loc2_.bridge).dispatchEvent(_loc3_);
            return _loc3_.data;
         }
         if(canActivateLocalComponent(param1))
         {
            return true;
         }
         return false;
      }
      
      mx_internal function get noTopMostIndex() : int
      {
         return _noTopMostIndex;
      }
      
      override public function get numChildren() : int
      {
         return mx_internal::noTopMostIndex - mx_internal::applicationIndex;
      }
      
      private function canActivateLocalComponent(param1:Object) : Boolean
      {
         if(param1 is Sprite && param1 is IUIComponent && Sprite(param1).visible && IUIComponent(param1).enabled)
         {
            return true;
         }
         return false;
      }
      
      private function preloader_preloaderDoneHandler(param1:Event) : void
      {
         var _loc2_:IUIComponent = mx_internal::topLevelWindow;
         preloader.removeEventListener(FlexEvent.PRELOADER_DONE,preloader_preloaderDoneHandler);
         preloader.removeEventListener(RSLEvent.RSL_COMPLETE,preloader_rslCompleteHandler);
         _popUpChildren.removeChild(preloader);
         preloader = null;
         mouseCatcher = new FlexSprite();
         mouseCatcher.name = "mouseCatcher";
         ++mx_internal::noTopMostIndex;
         super.addChildAt(mouseCatcher,0);
         resizeMouseCatcher();
         if(!mx_internal::topLevel)
         {
            mouseCatcher.visible = false;
            mask = mouseCatcher;
         }
         ++mx_internal::noTopMostIndex;
         super.addChildAt(DisplayObject(_loc2_),1);
         _loc2_.dispatchEvent(new FlexEvent(FlexEvent.APPLICATION_COMPLETE));
         dispatchEvent(new FlexEvent(FlexEvent.APPLICATION_COMPLETE));
      }
      
      private function initializeTopLevelWindow(param1:Event) : void
      {
         var _loc2_:IUIComponent = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:mx.managers.ISystemManager = null;
         var _loc5_:DisplayObject = null;
         initialized = true;
         if(!parent && parentAllowsChild)
         {
            return;
         }
         if(!mx_internal::topLevel)
         {
            if(!parent)
            {
               return;
            }
            _loc3_ = parent.parent;
            if(!_loc3_)
            {
               return;
            }
            while(_loc3_)
            {
               if(_loc3_ is IUIComponent)
               {
                  if((Boolean(_loc4_ = IUIComponent(_loc3_).systemManager)) && !_loc4_.isTopLevel())
                  {
                     _loc4_ = _loc4_.topLevelSystemManager;
                  }
                  _topLevelSystemManager = _loc4_;
                  break;
               }
               _loc3_ = _loc3_.parent;
            }
         }
         if(isTopLevelRoot() || getSandboxRoot() == this)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler,true);
         }
         if(isTopLevelRoot() && Boolean(stage))
         {
            stage.addEventListener(Event.RESIZE,Stage_resizeHandler,false,0,true);
         }
         else if(mx_internal::topLevel && Boolean(stage))
         {
            if((_loc5_ = getSandboxRoot()) != this)
            {
               _loc5_.addEventListener(Event.RESIZE,Stage_resizeHandler,false,0,true);
            }
         }
         document = _loc2_ = mx_internal::topLevelWindow = IUIComponent(create());
         if(document)
         {
            IEventDispatcher(_loc2_).addEventListener(FlexEvent.CREATION_COMPLETE,appCreationCompleteHandler);
            if(true)
            {
               LoaderConfig.mx_internal::_url = loaderInfo.url;
               LoaderConfig.mx_internal::_parameters = loaderInfo.parameters;
               LoaderConfig.mx_internal::_swfVersion = loaderInfo.swfVersion;
            }
            if(isStageRoot && Boolean(stage))
            {
               _width = stage.stageWidth;
               _height = stage.stageHeight;
               IFlexDisplayObject(_loc2_).setActualSize(_width,_height);
            }
            else
            {
               IFlexDisplayObject(_loc2_).setActualSize(loaderInfo.width,loaderInfo.height);
            }
            if(preloader)
            {
               preloader.registerApplication(_loc2_);
            }
            mx_internal::addingChild(DisplayObject(_loc2_));
            mx_internal::childAdded(DisplayObject(_loc2_));
         }
         else
         {
            document = this;
         }
      }
      
      final mx_internal function $addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return super.addChildAt(param1,param2);
      }
      
      private function stageEventHandler(param1:Event) : void
      {
         if(param1.target is Stage && Boolean(mouseCatcher))
         {
            mouseCatcher.dispatchEvent(param1);
         }
      }
      
      private function nextFrameTimerHandler(param1:TimerEvent) : void
      {
         if(currentFrame + 1 <= framesLoaded)
         {
            nextFrame();
            nextFrameTimer.removeEventListener(TimerEvent.TIMER,nextFrameTimerHandler);
            nextFrameTimer.reset();
         }
      }
      
      mx_internal function get bridgeToFocusManager() : Dictionary
      {
         if(mx_internal::topLevel)
         {
            return _bridgeToFocusManager;
         }
         if(topLevelSystemManager)
         {
            return SystemManager(topLevelSystemManager).mx_internal::bridgeToFocusManager;
         }
         return null;
      }
      
      public function get numModalWindows() : int
      {
         return _numModalWindows;
      }
      
      private function areFormsEqual(param1:Object, param2:Object) : Boolean
      {
         if(param1 == param2)
         {
            return true;
         }
         if(param1 is RemotePopUp && param2 is RemotePopUp)
         {
            return areRemotePopUpsEqual(param1,param2);
         }
         return false;
      }
      
      public function isTopLevelWindow(param1:DisplayObject) : Boolean
      {
         return param1 is IUIComponent && IUIComponent(param1) == mx_internal::topLevelWindow;
      }
      
      private function removePlaceholderId(param1:String) : void
      {
         delete idToPlaceholder[param1];
      }
      
      mx_internal function dispatchActivatedWindowEvent(param1:DisplayObject) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:* = false;
         var _loc5_:SWFBridgeEvent = null;
         var _loc2_:IEventDispatcher = !!swfBridgeGroup ? swfBridgeGroup.parentBridge : null;
         if(_loc2_)
         {
            _loc3_ = getSandboxRoot();
            _loc4_ = _loc3_ != this;
            _loc5_ = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_WINDOW_ACTIVATE,false,false,{
               "notifier":_loc2_,
               "window":(_loc4_ ? param1 : NameUtil.displayObjectToString(param1))
            });
            if(_loc4_)
            {
               _loc3_.dispatchEvent(_loc5_);
            }
            else
            {
               _loc2_.dispatchEvent(_loc5_);
            }
         }
      }
      
      override public function get width() : Number
      {
         return _width;
      }
      
      private function dispatchActivatedApplicationEvent() : void
      {
         var _loc2_:SWFBridgeEvent = null;
         var _loc1_:IEventDispatcher = !!swfBridgeGroup ? swfBridgeGroup.parentBridge : null;
         if(_loc1_)
         {
            _loc2_ = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_APPLICATION_ACTIVATE,false,false);
            _loc1_.dispatchEvent(_loc2_);
         }
      }
      
      private function otherSystemManagerMouseListener(param1:SandboxMouseEvent) : void
      {
         if(false)
         {
            return;
         }
         dispatchEventFromSWFBridges(param1);
         var _loc2_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST);
         _loc2_.name = "sameSandbox";
         _loc2_.value = param1;
         getSandboxRoot().dispatchEvent(_loc2_);
         if(!_loc2_.value)
         {
            dispatchEvent(param1);
         }
      }
      
      private function hideMouseCursorRequestHandler(param1:Event) : void
      {
         var _loc3_:IEventDispatcher = null;
         if(!isTopLevelRoot() && param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(!isTopLevelRoot())
         {
            _loc3_ = swfBridgeGroup.parentBridge;
            _loc2_.requestor = _loc3_;
            _loc3_.dispatchEvent(_loc2_);
         }
         else if(eventProxy)
         {
            SystemManagerGlobals.showMouseCursor = false;
         }
      }
      
      private function getTopLevelSystemManager(param1:DisplayObject) : mx.managers.ISystemManager
      {
         var _loc3_:mx.managers.ISystemManager = null;
         var _loc2_:DisplayObjectContainer = DisplayObjectContainer(param1.root);
         if((!_loc2_ || _loc2_ is Stage) && param1 is IUIComponent)
         {
            _loc2_ = DisplayObjectContainer(IUIComponent(param1).systemManager);
         }
         if(_loc2_ is mx.managers.ISystemManager)
         {
            _loc3_ = ISystemManager(_loc2_);
            if(!_loc3_.isTopLevel())
            {
               _loc3_ = _loc3_.topLevelSystemManager;
            }
         }
         return _loc3_;
      }
      
      public function isDisplayObjectInABridgedApplication(param1:DisplayObject) : Boolean
      {
         return getSWFBridgeOfDisplayObject(param1) != null;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         _explicitWidth = param1;
      }
      
      public function get parentAllowsChild() : Boolean
      {
         try
         {
            return loaderInfo.parentAllowsChild;
         }
         catch(error:Error)
         {
            return false;
         }
      }
      
      private function preloader_initProgressHandler(param1:Event) : void
      {
         preloader.removeEventListener(FlexEvent.INIT_PROGRESS,preloader_initProgressHandler);
         deferredNextFrame();
      }
      
      private function mouseLeaveHandler(param1:Event) : void
      {
         dispatchEvent(new SandboxMouseEvent(SandboxMouseEvent.MOUSE_UP_SOMEWHERE));
      }
      
      public function get explicitWidth() : Number
      {
         return _explicitWidth;
      }
      
      private function activateFormSandboxEventHandler(param1:Event) : void
      {
         var _loc2_:SWFBridgeEvent = SWFBridgeEvent.marshal(param1);
         if(!forwardFormEvent(_loc2_))
         {
            activateForm(new RemotePopUp(_loc2_.data.window,_loc2_.data.notifier));
         }
      }
      
      mx_internal function rawChildren_addChild(param1:DisplayObject) : DisplayObject
      {
         mx_internal::addingChild(param1);
         super.addChild(param1);
         mx_internal::childAdded(param1);
         return param1;
      }
   }
}
