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
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.text.Font;
   import flash.text.TextFormat;
   import flash.ui.ContextMenu;
   import flash.utils.Dictionary;
   import mx.core.EventPriority;
   import mx.core.FlexSprite;
   import mx.core.IChildList;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModule;
   import mx.core.ISWFBridgeGroup;
   import mx.core.ISWFBridgeProvider;
   import mx.core.ISWFLoader;
   import mx.core.IUIComponent;
   import mx.core.SWFBridgeGroup;
   import mx.core.Singleton;
   import mx.core.Window;
   import mx.core.mx_internal;
   import mx.events.EventListenerRequest;
   import mx.events.FlexChangeEvent;
   import mx.events.FlexEvent;
   import mx.events.InterManagerRequest;
   import mx.events.SWFBridgeEvent;
   import mx.events.SWFBridgeRequest;
   import mx.events.SandboxMouseEvent;
   import mx.managers.systemClasses.EventProxy;
   import mx.managers.systemClasses.PlaceholderData;
   import mx.managers.systemClasses.RemotePopUp;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.utils.EventUtil;
   import mx.utils.NameUtil;
   import mx.utils.SecurityUtil;
   
   public class WindowedSystemManager extends MovieClip implements mx.managers.ISystemManager, ISWFBridgeProvider
   {
       
      
      mx_internal var nestLevel:int = 0;
      
      private var currentSandboxEvent:Event;
      
      private var originalSystemManager:mx.managers.SystemManager;
      
      private var forms:Array;
      
      private var mouseCatcher:Sprite;
      
      private var _height:Number;
      
      private var dispatchingToSystemManagers:Boolean = false;
      
      private var strongReferenceProxies:Dictionary;
      
      private var _document:Object;
      
      private var _rawChildren:mx.managers.WindowedSystemRawChildrenList;
      
      private var _topLevelSystemManager:mx.managers.ISystemManager;
      
      private var _toolTipIndex:int = 0;
      
      private var _bridgeToFocusManager:Dictionary;
      
      private var idToPlaceholder:Object;
      
      private var _swfBridgeGroup:ISWFBridgeGroup;
      
      private var myWindow:Window;
      
      private var _toolTipChildren:mx.managers.WindowedSystemChildrenList;
      
      private var form:Object;
      
      private var _width:Number;
      
      private var initialized:Boolean = false;
      
      private var _focusPane:Sprite;
      
      private var _popUpChildren:mx.managers.WindowedSystemChildrenList;
      
      private var isStageRoot:Boolean = true;
      
      private var _fontList:Object = null;
      
      private var _window:Window = null;
      
      private var _topMostIndex:int = 0;
      
      private var topLevel:Boolean = true;
      
      private var weakReferenceProxies:Dictionary;
      
      private var _cursorIndex:int = 0;
      
      private var isBootstrapRoot:Boolean = false;
      
      mx_internal var _mouseY;
      
      mx_internal var _mouseX;
      
      private var _numModalWindows:int = 0;
      
      mx_internal var idleCounter:int = 0;
      
      private var _screen:Rectangle;
      
      private var _cursorChildren:mx.managers.WindowedSystemChildrenList;
      
      private var _noTopMostIndex:int = 0;
      
      private var _applicationIndex:int = 1;
      
      private var isDispatchingResizeEvent:Boolean;
      
      private var eventProxy:EventProxy;
      
      mx_internal var topLevelWindow:IUIComponent;
      
      public function WindowedSystemManager(param1:IUIComponent)
      {
         forms = [];
         weakReferenceProxies = new Dictionary(true);
         strongReferenceProxies = new Dictionary(false);
         super();
         _topLevelSystemManager = this;
         mx_internal::topLevelWindow = param1;
         SystemManagerGlobals.topLevelSystemManagers.push(this);
         addEventListener(Event.ADDED,docFrameHandler);
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
      
      private static function isRemotePopUp(param1:Object) : Boolean
      {
         return !(param1 is IFocusManagerContainer);
      }
      
      private static function getChildListIndex(param1:IChildList, param2:Object) : int
      {
         var childList:IChildList = param1;
         var f:Object = param2;
         var index:int = -1;
         try
         {
            index = int(childList.getChildIndex(DisplayObject(f)));
         }
         catch(e:ArgumentError)
         {
         }
         return index;
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
      }
      
      mx_internal function findFocusManagerContainer(param1:SystemManagerProxy) : IFocusManagerContainer
      {
         var _loc5_:DisplayObject = null;
         var _loc2_:IChildList = param1.rawChildren;
         var _loc3_:int = int(_loc2_.numChildren);
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
      
      private function activateApplicationSandboxEventHandler(param1:Event) : void
      {
         if(!isTopLevelRoot())
         {
            swfBridgeGroup.parentBridge.dispatchEvent(param1);
            return;
         }
         activateForm(document);
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
      
      public function getDefinitionByName(param1:String) : Object
      {
         var _loc3_:Object = null;
         var _loc2_:ApplicationDomain = ApplicationDomain.currentDomain;
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
      
      public function set document(param1:Object) : void
      {
         _document = param1;
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
            if(!topLevel && Boolean(_topLevelSystemManager))
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
         if(!topLevel && Boolean(topLevelSystemManager))
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
      
      public function get rawChildren() : IChildList
      {
         if(!topLevel)
         {
            return _topLevelSystemManager.rawChildren;
         }
         if(!_rawChildren)
         {
            _rawChildren = new mx.managers.WindowedSystemRawChildrenList(this);
         }
         return _rawChildren;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(mx_internal::applicationIndex + param1);
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
         super.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      final mx_internal function $removeChild(param1:DisplayObject) : DisplayObject
      {
         return super.removeChild(param1);
      }
      
      private function Stage_resizeHandler(param1:Event = null) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(!_screen)
         {
            _screen = new Rectangle();
         }
         _screen.x = _loc5_;
         _screen.y = _loc4_;
         _screen.width = _loc2_;
         _screen.height = _loc3_;
         _width = stage.stageWidth;
         _height = stage.stageHeight;
         if(param1)
         {
            resizeMouseCatcher();
            dispatchEvent(param1);
         }
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
               forms.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
      }
      
      override public function get mouseY() : Number
      {
         if(mx_internal::_mouseY === undefined)
         {
            return super.mouseY;
         }
         return mx_internal::_mouseY;
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
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         mx_internal::idleCounter = 0;
         if(isDisplayObjectInABridgedApplication(param1.target as DisplayObject))
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
            if(false)
            {
               _loc2_ = 0;
               _loc3_ = DisplayObject(param1.target);
               _loc4_ = Boolean(document.rawChildren.contains(_loc3_));
               while(_loc3_)
               {
                  _loc5_ = 0;
                  while(_loc5_ < _loc2_)
                  {
                     if((_loc6_ = isRemotePopUp(forms[_loc5_]) ? forms[_loc5_].window : forms[_loc5_]) == _loc3_)
                     {
                        _loc7_ = 0;
                        if(_loc3_ != form && _loc3_ is IFocusManagerContainer)
                        {
                           activate(IFocusManagerContainer(_loc3_));
                        }
                        if(popUpChildren.contains(_loc3_))
                        {
                           _loc10_ = popUpChildren;
                        }
                        else
                        {
                           _loc10_ = {};
                        }
                        _loc9_ = _loc8_ = int(_loc10_.getChildIndex(_loc3_));
                        _loc2_ = 0;
                        _loc7_ = 0;
                        for(; _loc7_ < _loc2_; _loc7_++)
                        {
                           if(_loc12_ = isRemotePopUp(forms[_loc7_]))
                           {
                              if(forms[_loc7_].window is String)
                              {
                                 continue;
                              }
                              _loc11_ = forms[_loc7_].window;
                           }
                           else
                           {
                              _loc11_ = forms[_loc7_];
                           }
                           if(_loc12_)
                           {
                              if((_loc13_ = getChildListIndex(_loc10_,_loc11_)) > _loc8_)
                              {
                                 _loc9_ = Math.max(_loc13_,_loc9_);
                              }
                           }
                           else if(_loc10_.contains(_loc11_))
                           {
                              if(_loc10_.getChildIndex(_loc11_) > _loc8_)
                              {
                                 _loc9_ = Math.max(_loc10_.getChildIndex(_loc11_),_loc9_);
                              }
                           }
                        }
                        if(_loc9_ > _loc8_ && !_loc4_)
                        {
                           _loc10_.setChildIndex(_loc3_,_loc9_);
                        }
                        return;
                     }
                     _loc5_++;
                  }
                  _loc3_ = _loc3_.parent;
               }
            }
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
      
      public function get screen() : Rectangle
      {
         if(!_screen)
         {
            _screen = new Rectangle();
         }
         _screen.x = 0;
         _screen.y = 0;
         _screen.width = stage.stageWidth;
         _screen.height = stage.stageHeight;
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
      
      mx_internal function set topMostIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _topMostIndex;
         _topMostIndex = param1;
         mx_internal::toolTipIndex += _loc2_;
      }
      
      protected function docFrameHandler(param1:Event = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Class = null;
         removeEventListener(Event.ADDED,docFrameHandler);
         getSandboxRoot().addEventListener(InterManagerRequest.INIT_MANAGER_REQUEST,initManagerHandler,false,0,true);
         if(getSandboxRoot() == this)
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
         if(stage)
         {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
         }
         var _loc2_:Array = info()["mixins"];
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = int(_loc2_.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               (_loc5_ = Class(getDefinitionByName(_loc2_[_loc4_])))["init"](this);
               _loc4_++;
            }
         }
         initializeTopLevelWindow(null);
         if(Singleton.getClass("mx.managers::IDragManager").getInstance() is NativeDragManagerImpl)
         {
            NativeDragManagerImpl(Singleton.getClass("mx.managers::IDragManager").getInstance()).mx_internal::registerSystemManager(this);
         }
      }
      
      public function isTopLevel() : Boolean
      {
         return topLevel;
      }
      
      public function deactivate(param1:IFocusManagerContainer) : void
      {
         deactivateForm(Object(param1));
      }
      
      private function initContextMenu() : void
      {
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.hideBuiltInItems();
         _loc1_.builtInItems.print = true;
         contextMenu = _loc1_;
      }
      
      mx_internal function addParentBridgeListeners() : void
      {
         if(!topLevel && Boolean(topLevelSystemManager))
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
      
      public function get swfBridgeGroup() : ISWFBridgeGroup
      {
         if(topLevel)
         {
            return _swfBridgeGroup;
         }
         if(topLevelSystemManager)
         {
            return topLevelSystemManager.swfBridgeGroup;
         }
         return null;
      }
      
      mx_internal function removeParentBridgeListeners() : void
      {
         if(!topLevel && Boolean(topLevelSystemManager))
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
      }
      
      mx_internal function removeChildBridgeListeners(param1:IEventDispatcher) : void
      {
         if(!topLevel && Boolean(topLevelSystemManager))
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
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         return super.getChildByName(param1);
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
      
      mx_internal function cleanup(param1:Event) : void
      {
         if(Singleton.getClass("mx.managers::IDragManager").getInstance() is NativeDragManagerImpl)
         {
            NativeDragManagerImpl(Singleton.getClass("mx.managers::IDragManager").getInstance()).mx_internal::unregisterSystemManager(this);
         }
         SystemManagerGlobals.topLevelSystemManagers.splice(SystemManagerGlobals.topLevelSystemManagers.indexOf(this),1);
         myWindow.nativeWindow.removeEventListener(Event.CLOSE,mx_internal::cleanup);
         myWindow = null;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         ++mx_internal::noTopMostIndex;
         return mx_internal::rawChildren_addChildAt(param1,mx_internal::applicationIndex + param2);
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
      }
      
      public function useSWFBridge() : Boolean
      {
         var sbRoot:DisplayObject;
         if(isStageRoot)
         {
            return false;
         }
         if(!topLevel && Boolean(topLevelSystemManager))
         {
            return topLevelSystemManager.useSWFBridge();
         }
         sbRoot = getSandboxRoot();
         if(topLevel && sbRoot != this)
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
      
      public function activate(param1:IFocusManagerContainer) : void
      {
         activateForm(param1);
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
         if(!topLevel)
         {
            return _topLevelSystemManager.toolTipChildren;
         }
         if(!_toolTipChildren)
         {
            _toolTipChildren = new mx.managers.WindowedSystemChildrenList(this,new QName(mx_internal,"topMostIndex"),new QName(mx_internal,"toolTipIndex"));
         }
         return _toolTipChildren;
      }
      
      public function get popUpChildren() : IChildList
      {
         if(!topLevel)
         {
            return _topLevelSystemManager.popUpChildren;
         }
         if(!_popUpChildren)
         {
            _popUpChildren = new mx.managers.WindowedSystemChildrenList(this,new QName(mx_internal,"noTopMostIndex"),new QName(mx_internal,"topMostIndex"));
         }
         return _popUpChildren;
      }
      
      public function addFocusManager(param1:IFocusManagerContainer) : void
      {
         forms.push(param1);
      }
      
      public function isTopLevelRoot() : Boolean
      {
         return isStageRoot || isBootstrapRoot;
      }
      
      public function create(... rest) : Object
      {
         var _loc2_:String = String(rest[0]);
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         if(!_loc3_)
         {
            throw new Error("Class \'" + _loc2_ + "\' not found.");
         }
         var _loc4_:Object;
         if((_loc4_ = new _loc3_()) is IFlexModule)
         {
            IFlexModule(_loc4_).moduleFactory = this;
         }
         return _loc4_;
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
               param1["value"] = document;
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
               sm = ISystemManager(sm.topLevelSystemManager);
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
      
      public function get document() : Object
      {
         return _document;
      }
      
      mx_internal function get cursorIndex() : int
      {
         return _cursorIndex;
      }
      
      private function resizeMouseCatcher() : void
      {
         var _loc1_:Graphics = null;
         if(mouseCatcher)
         {
            _loc1_ = mouseCatcher.graphics;
            _loc1_.clear();
            _loc1_.beginFill(0,0);
            _loc1_.drawRect(0,0,stage.stageWidth,stage.stageHeight);
            _loc1_.endFill();
         }
      }
      
      final mx_internal function $addChild(param1:DisplayObject) : DisplayObject
      {
         return super.addChild(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1) - mx_internal::applicationIndex;
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
      
      mx_internal function rawChildren_contains(param1:DisplayObject) : Boolean
      {
         return super.contains(param1);
      }
      
      override public function get height() : Number
      {
         return _height;
      }
      
      public function getFocus() : InteractiveObject
      {
         try
         {
            return stage.focus;
         }
         catch(e:SecurityError)
         {
            return null;
         }
      }
      
      mx_internal function rawChildren_getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1);
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
            _loc3_ = Boolean(_loc2_.data.parent) && Boolean(popUpChildren.contains(_loc2_.data.parent));
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
               sm = ISystemManager(sm.topLevelSystemManager);
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
      
      private function activateRemotePopUp(param1:Object) : void
      {
         var _loc2_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.ACTIVATE_POP_UP_REQUEST,false,false,param1.bridge,param1.window);
         var _loc3_:Object = param1.bridge;
         if(_loc3_)
         {
            _loc3_.dispatchEvent(_loc2_);
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         ++mx_internal::noTopMostIndex;
         return mx_internal::rawChildren_addChildAt(param1,mx_internal::noTopMostIndex - 1);
      }
      
      mx_internal function set noTopMostIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _noTopMostIndex;
         _noTopMostIndex = param1;
         mx_internal::topMostIndex += _loc2_;
      }
      
      public function set swfBridgeGroup(param1:ISWFBridgeGroup) : void
      {
         if(topLevel)
         {
            _swfBridgeGroup = param1;
         }
         else if(topLevelSystemManager)
         {
            SystemManager(topLevelSystemManager).swfBridgeGroup = param1;
         }
      }
      
      mx_internal function rawChildren_getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(param1);
      }
      
      mx_internal function get topMostIndex() : int
      {
         return _topMostIndex;
      }
      
      private function addChildAndMouseCatcher() : void
      {
         var _loc1_:IUIComponent = mx_internal::topLevelWindow;
         mouseCatcher = new FlexSprite();
         mouseCatcher.name = "mouseCatcher";
         ++mx_internal::noTopMostIndex;
         super.addChildAt(mouseCatcher,0);
         resizeMouseCatcher();
         if(!topLevel)
         {
            mouseCatcher.visible = false;
            mask = mouseCatcher;
         }
         ++mx_internal::noTopMostIndex;
         super.addChild(DisplayObject(_loc1_));
      }
      
      mx_internal function rawChildren_setChildIndex(param1:DisplayObject, param2:int) : void
      {
         super.setChildIndex(param1,param2);
      }
      
      mx_internal function childAdded(param1:DisplayObject) : void
      {
         param1.dispatchEvent(new FlexEvent(FlexEvent.ADD));
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).initialize();
         }
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         super.setChildIndex(param1,mx_internal::applicationIndex + param2);
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
         super.removeEventListener(type,listener,useCapture);
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
      
      mx_internal function removingChild(param1:DisplayObject) : void
      {
         param1.dispatchEvent(new FlexEvent(FlexEvent.REMOVE));
      }
      
      mx_internal function set toolTipIndex(param1:int) : void
      {
         var _loc2_:int = param1 - _toolTipIndex;
         _toolTipIndex = param1;
         mx_internal::cursorIndex += _loc2_;
      }
      
      mx_internal function get applicationIndex() : int
      {
         return _applicationIndex;
      }
      
      private function hasSWFBridges() : Boolean
      {
         if(swfBridgeGroup)
         {
            return true;
         }
         return false;
      }
      
      private function stageEventHandler(param1:Event) : void
      {
         if(param1.target is Stage)
         {
            mouseCatcher.dispatchEvent(param1);
         }
      }
      
      mx_internal function set bridgeToFocusManager(param1:Dictionary) : void
      {
         if(topLevel)
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
         if(!topLevel)
         {
            return _topLevelSystemManager.cursorChildren;
         }
         if(!_cursorChildren)
         {
            _cursorChildren = new mx.managers.WindowedSystemChildrenList(this,new QName(mx_internal,"toolTipIndex"),new QName(mx_internal,"cursorIndex"));
         }
         return _cursorChildren;
      }
      
      public function set numModalWindows(param1:int) : void
      {
         _numModalWindows = param1;
      }
      
      mx_internal function rawChildren_getChildByName(param1:String) : DisplayObject
      {
         return super.getChildByName(param1);
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
      
      public function allowDomain(... rest) : void
      {
      }
      
      mx_internal function rawChildren_addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         mx_internal::addingChild(param1);
         super.addChildAt(param1,param2);
         mx_internal::childAdded(param1);
         return param1;
      }
      
      public function get topLevelSystemManager() : mx.managers.ISystemManager
      {
         if(topLevel)
         {
            return this;
         }
         return _topLevelSystemManager;
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
      
      private function canActivateLocalComponent(param1:Object) : Boolean
      {
         if(param1 is Sprite && param1 is IUIComponent && Sprite(param1).visible && Boolean(IUIComponent(param1).enabled))
         {
            return true;
         }
         return false;
      }
      
      mx_internal function get noTopMostIndex() : int
      {
         return _noTopMostIndex;
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
      
      override public function get numChildren() : int
      {
         return mx_internal::noTopMostIndex - mx_internal::applicationIndex;
      }
      
      protected function initializeTopLevelWindow(param1:Event) : void
      {
         var _loc2_:IUIComponent = null;
         var _loc3_:DisplayObjectContainer = null;
         initialized = true;
         if(!parent)
         {
            return;
         }
         initContextMenu();
         if(!topLevel)
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
                  _topLevelSystemManager = IUIComponent(_loc3_).systemManager;
                  break;
               }
               _loc3_ = _loc3_.parent;
            }
         }
         addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler,true);
         stage.addEventListener(Event.RESIZE,Stage_resizeHandler,false,0,true);
         document = _loc2_ = mx_internal::topLevelWindow;
         if(document)
         {
            if(topLevel && Boolean(stage))
            {
               _width = stage.stageWidth;
               _height = stage.stageHeight;
               IFlexDisplayObject(_loc2_).setActualSize(stage.stageWidth,stage.stageHeight);
            }
            else
            {
               IFlexDisplayObject(_loc2_).setActualSize(loaderInfo.width,loaderInfo.height);
            }
            mx_internal::addingChild(DisplayObject(_loc2_));
            mx_internal::childAdded(DisplayObject(_loc2_));
         }
         else
         {
            document = this;
         }
         addChildAndMouseCatcher();
      }
      
      final mx_internal function $addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return super.addChildAt(param1,param2);
      }
      
      mx_internal function get bridgeToFocusManager() : Dictionary
      {
         if(topLevel)
         {
            return _bridgeToFocusManager;
         }
         if(topLevelSystemManager)
         {
            return SystemManager(topLevelSystemManager).mx_internal::bridgeToFocusManager;
         }
         return null;
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
      
      public function get numModalWindows() : int
      {
         return _numModalWindows;
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
      
      public function isTopLevelWindow(param1:DisplayObject) : Boolean
      {
         return param1 is IUIComponent && IUIComponent(param1) == mx_internal::topLevelWindow;
      }
      
      private function removePlaceholderId(param1:String) : void
      {
         delete idToPlaceholder[param1];
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
      
      public function isDisplayObjectInABridgedApplication(param1:DisplayObject) : Boolean
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
                     return true;
                  }
                  _loc2_.data = param1;
               }
               _loc5_++;
            }
         }
         return false;
      }
      
      mx_internal function set window(param1:Window) : void
      {
         _window = param1;
      }
      
      private function activateFormSandboxEventHandler(param1:Event) : void
      {
         var _loc2_:SWFBridgeEvent = SWFBridgeEvent.marshal(param1);
         if(!forwardFormEvent(_loc2_))
         {
            activateForm(new RemotePopUp(_loc2_.data.window,_loc2_.data.notifier));
         }
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
      
      mx_internal function get window() : Window
      {
         return _window;
      }
      
      mx_internal function addWindow(param1:Window) : void
      {
         myWindow = param1;
         myWindow.nativeWindow.addEventListener("close",mx_internal::cleanup);
      }
      
      mx_internal function rawChildren_addChild(param1:DisplayObject) : DisplayObject
      {
         mx_internal::addingChild(param1);
         super.addChild(param1);
         mx_internal::childAdded(param1);
         return param1;
      }
      
      private function mouseLeaveHandler(param1:Event) : void
      {
         dispatchEvent(new SandboxMouseEvent(SandboxMouseEvent.MOUSE_UP_SOMEWHERE));
      }
      
      mx_internal function addingChild(param1:DisplayObject) : void
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc2_:int = 1;
         if(!topLevel)
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
   }
}
