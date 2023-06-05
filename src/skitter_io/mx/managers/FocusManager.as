package mx.managers
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import mx.core.FlexSprite;
   import mx.core.IButton;
   import mx.core.IChildList;
   import mx.core.IRawChildrenContainer;
   import mx.core.ISWFBridgeProvider;
   import mx.core.ISWFLoader;
   import mx.core.IToggleButton;
   import mx.core.IUIComponent;
   import mx.core.SWFBridgeGroup;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.FocusRequestDirection;
   import mx.events.SWFBridgeEvent;
   import mx.events.SWFBridgeRequest;
   
   public class FocusManager implements IFocusManager
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const FROM_INDEX_UNSPECIFIED:int = -2;
       
      
      private var lastActiveFocusManager:mx.managers.FocusManager;
      
      private var _showFocusIndicator:Boolean = false;
      
      private var focusableCandidates:Array;
      
      private var LARGE_TAB_INDEX:int = 99999;
      
      private var browserFocusComponent:InteractiveObject;
      
      private var calculateCandidates:Boolean = true;
      
      private var _lastFocus:mx.managers.IFocusManagerComponent;
      
      private var lastAction:String;
      
      private var focusSetLocally:Boolean;
      
      private var focusableObjects:Array;
      
      private var swfBridgeGroup:SWFBridgeGroup;
      
      private var defButton:IButton;
      
      private var _form:mx.managers.IFocusManagerContainer;
      
      private var popup:Boolean;
      
      private var focusChanged:Boolean;
      
      private var _defaultButtonEnabled:Boolean = true;
      
      private var activated:Boolean = false;
      
      private var _defaultButton:IButton;
      
      private var fauxFocus:DisplayObject;
      
      private var _focusPane:Sprite;
      
      private var skipBridge:IEventDispatcher;
      
      public var browserMode:Boolean;
      
      public function FocusManager(param1:mx.managers.IFocusManagerContainer, param2:Boolean = false)
      {
         var sm:ISystemManager = null;
         var bridge:IEventDispatcher = null;
         var container:mx.managers.IFocusManagerContainer = param1;
         var popup:Boolean = param2;
         super();
         this.popup = popup;
         browserMode = false && !popup;
         container.focusManager = this;
         _form = container;
         focusableObjects = [];
         focusPane = new FlexSprite();
         focusPane.name = "focusPane";
         addFocusables(DisplayObject(container));
         container.addEventListener(Event.ADDED,addedHandler);
         container.addEventListener(Event.REMOVED,removedHandler);
         container.addEventListener(FlexEvent.SHOW,showHandler);
         container.addEventListener(FlexEvent.HIDE,hideHandler);
         if(container.systemManager is SystemManager)
         {
            if(container != SystemManager(container.systemManager).application)
            {
               container.addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
            }
         }
         try
         {
            container.systemManager.addFocusManager(container);
            sm = mx_internal::form.systemManager;
            swfBridgeGroup = new SWFBridgeGroup(sm);
            if(!popup)
            {
               swfBridgeGroup.parentBridge = sm.swfBridgeGroup.parentBridge;
            }
            if(sm.useSWFBridge())
            {
               sm.addEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING,removeFromParentBridge);
               bridge = swfBridgeGroup.parentBridge;
               if(bridge)
               {
                  bridge.addEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST,focusRequestMoveHandler);
                  bridge.addEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST,setShowFocusIndicatorRequestHandler);
               }
               if(Boolean(bridge) && !(mx_internal::form.systemManager is SystemManagerProxy))
               {
                  bridge.addEventListener(SWFBridgeRequest.ACTIVATE_FOCUS_REQUEST,focusRequestActivateHandler);
                  bridge.addEventListener(SWFBridgeRequest.DEACTIVATE_FOCUS_REQUEST,focusRequestDeactivateHandler);
                  bridge.addEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE,bridgeEventActivateHandler);
               }
               container.addEventListener(Event.ADDED_TO_STAGE,addedToStageHandler);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function dispatchSetShowFocusIndicatorRequest(param1:Boolean, param2:IEventDispatcher) : void
      {
         var _loc3_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST,false,false,null,param1);
         dispatchEventFromSWFBridges(_loc3_,param2);
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         var _loc2_:DisplayObject = DisplayObject(mx_internal::form);
         if(_loc2_.parent && _loc2_.visible && !activated)
         {
            mx_internal::form.systemManager.activate(mx_internal::form);
         }
      }
      
      private function addFocusables(param1:DisplayObject, param2:Boolean = false) : void
      {
         var addToFocusables:Boolean = false;
         var focusable:mx.managers.IFocusManagerComponent = null;
         var doc:DisplayObjectContainer = null;
         var rawChildren:IChildList = null;
         var i:int = 0;
         var o:DisplayObject = param1;
         var skipTopLevel:Boolean = param2;
         if(o is mx.managers.IFocusManagerComponent && !skipTopLevel)
         {
            addToFocusables = false;
            if(o is mx.managers.IFocusManagerComponent)
            {
               focusable = IFocusManagerComponent(o);
               if(focusable.focusEnabled)
               {
                  if(Boolean(focusable.tabEnabled) && isTabVisible(o))
                  {
                     addToFocusables = true;
                  }
               }
            }
            if(addToFocusables)
            {
               if(focusableObjects.indexOf(o) == -1)
               {
                  focusableObjects.push(o);
                  calculateCandidates = true;
               }
               o.addEventListener("tabEnabledChange",tabEnabledChangeHandler);
               o.addEventListener("tabIndexChange",tabIndexChangeHandler);
            }
         }
         if(o is DisplayObjectContainer)
         {
            doc = DisplayObjectContainer(o);
            o.addEventListener("tabChildrenChange",tabChildrenChangeHandler);
            if(doc.tabChildren)
            {
               if(o is IRawChildrenContainer)
               {
                  rawChildren = IRawChildrenContainer(o).rawChildren;
                  i = 0;
                  while(i < rawChildren.numChildren)
                  {
                     try
                     {
                        addFocusables(rawChildren.getChildAt(i));
                     }
                     catch(error:SecurityError)
                     {
                     }
                     i++;
                  }
               }
               else
               {
                  i = 0;
                  while(i < doc.numChildren)
                  {
                     try
                     {
                        addFocusables(doc.getChildAt(i));
                     }
                     catch(error:SecurityError)
                     {
                     }
                     i++;
                  }
               }
            }
         }
      }
      
      private function tabEnabledChangeHandler(param1:Event) : void
      {
         calculateCandidates = true;
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(focusableObjects[_loc4_] == _loc2_)
            {
               break;
            }
            _loc4_++;
         }
         if(_loc2_.tabEnabled)
         {
            if(_loc4_ == _loc3_ && isTabVisible(_loc2_))
            {
               if(focusableObjects.indexOf(_loc2_) == -1)
               {
                  focusableObjects.push(_loc2_);
               }
            }
         }
         else if(_loc4_ < _loc3_)
         {
            focusableObjects.splice(_loc4_,1);
         }
      }
      
      private function mouseFocusChangeHandler(param1:FocusEvent) : void
      {
         var _loc2_:TextField = null;
         if(param1.relatedObject == null && "isRelatedObjectInaccessible" in param1 && param1["isRelatedObjectInaccessible"] == true)
         {
            return;
         }
         if(param1.relatedObject is TextField)
         {
            _loc2_ = param1.relatedObject as TextField;
            if(_loc2_.type == "input" || _loc2_.selectable)
            {
               return;
            }
         }
         param1.preventDefault();
      }
      
      public function addSWFBridge(param1:IEventDispatcher, param2:DisplayObject) : void
      {
         if(!param2)
         {
            return;
         }
         var _loc3_:ISystemManager = _form.systemManager;
         if(focusableObjects.indexOf(param2) == -1)
         {
            focusableObjects.push(param2);
            calculateCandidates = true;
         }
         swfBridgeGroup.addChildBridge(param1,ISWFBridgeProvider(param2));
         param1.addEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST,focusRequestMoveHandler);
         param1.addEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST,setShowFocusIndicatorRequestHandler);
         param1.addEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE,bridgeEventActivateHandler);
      }
      
      private function getChildIndex(param1:DisplayObjectContainer, param2:DisplayObject) : int
      {
         var parent:DisplayObjectContainer = param1;
         var child:DisplayObject = param2;
         try
         {
            return parent.getChildIndex(child);
         }
         catch(e:Error)
         {
            if(parent is IRawChildrenContainer)
            {
               return IRawChildrenContainer(parent).rawChildren.getChildIndex(child);
            }
            throw e;
         }
      }
      
      private function bridgeEventActivateHandler(param1:Event) : void
      {
         if(param1 is SWFBridgeEvent)
         {
            return;
         }
         lastActiveFocusManager = null;
         _lastFocus = null;
         dispatchActivatedFocusManagerEvent(IEventDispatcher(param1.target));
      }
      
      private function focusOutHandler(param1:FocusEvent) : void
      {
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
      }
      
      private function isValidFocusCandidate(param1:DisplayObject, param2:String) : Boolean
      {
         var _loc3_:IFocusManagerGroup = null;
         if(!isEnabledAndVisible(param1))
         {
            return false;
         }
         if(param1 is IFocusManagerGroup)
         {
            _loc3_ = IFocusManagerGroup(param1);
            if(param2 == _loc3_.groupName)
            {
               return false;
            }
         }
         return true;
      }
      
      private function defaultButtonKeyHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:ISystemManager = mx_internal::form.systemManager;
         if(_loc2_.isDisplayObjectInABridgedApplication(DisplayObject(param1.target)))
         {
            return;
         }
         if(defaultButtonEnabled && param1.keyCode == Keyboard.ENTER && defaultButton && false)
         {
            mx_internal::sendDefaultButtonEvent();
         }
      }
      
      private function removeFocusables(param1:DisplayObject, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         if(param1 is DisplayObjectContainer)
         {
            if(!param2)
            {
               param1.removeEventListener("tabChildrenChange",tabChildrenChangeHandler);
            }
            _loc3_ = 0;
            while(_loc3_ < focusableObjects.length)
            {
               if(isParent(DisplayObjectContainer(param1),focusableObjects[_loc3_]))
               {
                  if(focusableObjects[_loc3_] == _lastFocus)
                  {
                     _lastFocus.drawFocus(false);
                     _lastFocus = null;
                  }
                  focusableObjects[_loc3_].removeEventListener("tabEnabledChange",tabEnabledChangeHandler);
                  focusableObjects[_loc3_].removeEventListener("tabIndexChange",tabIndexChangeHandler);
                  focusableObjects.splice(_loc3_,1);
                  _loc3_--;
                  focusableCandidates = [];
                  calculateCandidates = true;
               }
               _loc3_++;
            }
         }
      }
      
      private function addedHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         if(_loc2_.stage)
         {
            addFocusables(DisplayObject(param1.target));
         }
      }
      
      private function tabChildrenChangeHandler(param1:Event) : void
      {
         if(param1.target != param1.currentTarget)
         {
            return;
         }
         calculateCandidates = true;
         var _loc2_:DisplayObjectContainer = DisplayObjectContainer(param1.target);
         if(_loc2_.tabChildren)
         {
            addFocusables(_loc2_,true);
         }
         else
         {
            removeFocusables(_loc2_,true);
         }
      }
      
      private function sortByDepth(param1:DisplayObject, param2:DisplayObject) : Number
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc8_:String = "0000";
         var _loc9_:DisplayObject = DisplayObject(param1);
         var _loc10_:DisplayObject = DisplayObject(param2);
         while(_loc9_ != DisplayObject(mx_internal::form) && Boolean(_loc9_.parent))
         {
            if((_loc6_ = (_loc5_ = getChildIndex(_loc9_.parent,_loc9_)).toString(16)).length < 4)
            {
               _loc7_ = _loc8_.substring(0,4 - _loc6_.length) + _loc6_;
            }
            _loc3_ = _loc7_ + _loc3_;
            _loc9_ = _loc9_.parent;
         }
         while(_loc10_ != DisplayObject(mx_internal::form) && Boolean(_loc10_.parent))
         {
            if((_loc6_ = (_loc5_ = getChildIndex(_loc10_.parent,_loc10_)).toString(16)).length < 4)
            {
               _loc7_ = _loc8_.substring(0,4 - _loc6_.length) + _loc6_;
            }
            _loc4_ = _loc7_ + _loc4_;
            _loc10_ = _loc10_.parent;
         }
         return _loc3_ > _loc4_ ? 1 : (_loc3_ < _loc4_ ? -1 : 0);
      }
      
      mx_internal function sendDefaultButtonEvent() : void
      {
         defButton.dispatchEvent(new MouseEvent("click"));
      }
      
      public function getFocus() : mx.managers.IFocusManagerComponent
      {
         var _loc1_:InteractiveObject = mx_internal::form.systemManager.stage.focus;
         return findFocusManagerComponent(_loc1_);
      }
      
      private function deactivateHandler(param1:Event) : void
      {
      }
      
      private function setFocusToBottom() : void
      {
         setFocusToNextIndex(focusableObjects.length,true);
      }
      
      private function tabIndexChangeHandler(param1:Event) : void
      {
         calculateCandidates = true;
      }
      
      private function sortFocusableObjects() : void
      {
         var _loc3_:InteractiveObject = null;
         focusableCandidates = [];
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = focusableObjects[_loc2_];
            if(_loc3_.tabIndex && !isNaN(Number(_loc3_.tabIndex)) && _loc3_.tabIndex > 0)
            {
               sortFocusableObjectsTabIndex();
               return;
            }
            focusableCandidates.push(_loc3_);
            _loc2_++;
         }
         focusableCandidates.sort(sortByDepth);
      }
      
      private function keyFocusChangeHandler(param1:FocusEvent) : void
      {
         var _loc2_:ISystemManager = mx_internal::form.systemManager;
         if(_loc2_.isDisplayObjectInABridgedApplication(DisplayObject(param1.target)))
         {
            return;
         }
         showFocusIndicator = true;
         focusChanged = false;
         if(param1.keyCode == Keyboard.TAB && !param1.isDefaultPrevented())
         {
            if(browserFocusComponent)
            {
               if(browserFocusComponent.tabIndex == LARGE_TAB_INDEX)
               {
                  browserFocusComponent.tabIndex = -1;
               }
               browserFocusComponent = null;
               if(SystemManager(mx_internal::form.systemManager).useSWFBridge())
               {
                  moveFocusToParent(param1.shiftKey);
                  if(focusChanged)
                  {
                     param1.preventDefault();
                  }
               }
               return;
            }
            setFocusToNextObject(param1);
            if(focusChanged)
            {
               param1.preventDefault();
            }
         }
      }
      
      private function getNextFocusManagerComponent2(param1:Boolean = false, param2:DisplayObject = null, param3:int = -2) : FocusInfo
      {
         var _loc10_:DisplayObject = null;
         var _loc11_:String = null;
         var _loc12_:IFocusManagerGroup = null;
         if(false)
         {
            return null;
         }
         if(calculateCandidates)
         {
            sortFocusableObjects();
            calculateCandidates = false;
         }
         var _loc4_:int = param3;
         if(param3 == FROM_INDEX_UNSPECIFIED)
         {
            if(!(_loc10_ = param2))
            {
               _loc10_ = mx_internal::form.systemManager.stage.focus;
            }
            _loc10_ = DisplayObject(findFocusManagerComponent2(InteractiveObject(_loc10_)));
            _loc11_ = "";
            if(_loc10_ is IFocusManagerGroup)
            {
               _loc11_ = (_loc12_ = IFocusManagerGroup(_loc10_)).groupName;
            }
            _loc4_ = getIndexOfFocusedObject(_loc10_);
         }
         var _loc5_:Boolean = false;
         var _loc6_:int = _loc4_;
         if(_loc4_ == -1)
         {
            if(param1)
            {
               _loc4_ = 0;
            }
            _loc5_ = true;
         }
         var _loc7_:int = getIndexOfNextObject(_loc4_,param1,_loc5_,_loc11_);
         var _loc8_:Boolean = false;
         if(param1)
         {
            if(_loc7_ >= _loc4_)
            {
               _loc8_ = true;
            }
         }
         else if(_loc7_ <= _loc4_)
         {
            _loc8_ = true;
         }
         var _loc9_:FocusInfo;
         (_loc9_ = new FocusInfo()).displayObject = findFocusManagerComponent2(focusableCandidates[_loc7_]);
         _loc9_.wrapped = _loc8_;
         return _loc9_;
      }
      
      private function getIndexOfFocusedObject(param1:DisplayObject) : int
      {
         var _loc4_:IUIComponent = null;
         if(!param1)
         {
            return -1;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(focusableCandidates[_loc3_] == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if((Boolean(_loc4_ = focusableCandidates[_loc3_] as IUIComponent)) && Boolean(_loc4_.owns(param1)))
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function focusRequestActivateHandler(param1:Event) : void
      {
         skipBridge = IEventDispatcher(param1.target);
         activate();
         skipBridge = null;
      }
      
      private function removeFromParentBridge(param1:Event) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:ISystemManager = mx_internal::form.systemManager;
         if(_loc2_.useSWFBridge())
         {
            _loc2_.removeEventListener(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING,removeFromParentBridge);
            _loc3_ = swfBridgeGroup.parentBridge;
            if(_loc3_)
            {
               _loc3_.removeEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST,focusRequestMoveHandler);
               _loc3_.removeEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST,setShowFocusIndicatorRequestHandler);
            }
            if(Boolean(_loc3_) && !(mx_internal::form.systemManager is SystemManagerProxy))
            {
               _loc3_.removeEventListener(SWFBridgeRequest.ACTIVATE_FOCUS_REQUEST,focusRequestActivateHandler);
               _loc3_.removeEventListener(SWFBridgeRequest.DEACTIVATE_FOCUS_REQUEST,focusRequestDeactivateHandler);
               _loc3_.removeEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE,bridgeEventActivateHandler);
            }
         }
      }
      
      private function getParentBridge() : IEventDispatcher
      {
         if(swfBridgeGroup)
         {
            return swfBridgeGroup.parentBridge;
         }
         return null;
      }
      
      private function setFocusToComponent(param1:Object, param2:Boolean) : void
      {
         var _loc3_:SWFBridgeRequest = null;
         var _loc4_:IEventDispatcher = null;
         focusChanged = false;
         if(param1)
         {
            if(param1 is ISWFLoader && Boolean(ISWFLoader(param1).swfBridge))
            {
               _loc3_ = new SWFBridgeRequest(SWFBridgeRequest.MOVE_FOCUS_REQUEST,false,true,null,param2 ? FocusRequestDirection.BOTTOM : FocusRequestDirection.TOP);
               if(_loc4_ = ISWFLoader(param1).swfBridge)
               {
                  _loc4_.dispatchEvent(_loc3_);
                  focusChanged = _loc3_.data;
               }
            }
            else if(param1 is IFocusManagerComplexComponent)
            {
               IFocusManagerComplexComponent(param1).assignFocus(param2 ? "bottom" : "top");
               focusChanged = true;
            }
            else if(param1 is mx.managers.IFocusManagerComponent)
            {
               setFocus(IFocusManagerComponent(param1));
               focusChanged = true;
            }
         }
      }
      
      private function focusRequestMoveHandler(param1:Event) : void
      {
         var _loc3_:DisplayObject = null;
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         focusSetLocally = false;
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(_loc2_.data == FocusRequestDirection.TOP || _loc2_.data == FocusRequestDirection.BOTTOM)
         {
            if(false)
            {
               moveFocusToParent(_loc2_.data == FocusRequestDirection.TOP ? false : true);
               param1["data"] = focusChanged;
               return;
            }
            if(_loc2_.data == FocusRequestDirection.TOP)
            {
               setFocusToTop();
            }
            else
            {
               setFocusToBottom();
            }
            param1["data"] = focusChanged;
         }
         else
         {
            _loc3_ = DisplayObject(_form.systemManager.swfBridgeGroup.getChildBridgeProvider(IEventDispatcher(param1.target)));
            moveFocus(_loc2_.data as String,_loc3_);
            param1["data"] = focusChanged;
         }
         if(focusSetLocally)
         {
            dispatchActivatedFocusManagerEvent(null);
            lastActiveFocusManager = this;
         }
      }
      
      public function get nextTabIndex() : int
      {
         return getMaxTabIndex() + 1;
      }
      
      private function dispatchActivatedFocusManagerEvent(param1:IEventDispatcher = null) : void
      {
         if(lastActiveFocusManager == this)
         {
            return;
         }
         var _loc2_:SWFBridgeEvent = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE);
         dispatchEventFromSWFBridges(_loc2_,param1);
      }
      
      private function focusRequestDeactivateHandler(param1:Event) : void
      {
         skipBridge = IEventDispatcher(param1.target);
         deactivate();
         skipBridge = null;
      }
      
      public function get focusPane() : Sprite
      {
         return _focusPane;
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:IFocusManagerGroup = null;
         var _loc2_:ISystemManager = mx_internal::form.systemManager;
         if(_loc2_.isDisplayObjectInABridgedApplication(DisplayObject(param1.target)))
         {
            return;
         }
         if(_loc2_ is SystemManager)
         {
            SystemManager(_loc2_).mx_internal::idleCounter = 0;
         }
         if(param1.keyCode == Keyboard.TAB)
         {
            lastAction = "KEY";
            if(calculateCandidates)
            {
               sortFocusableObjects();
               calculateCandidates = false;
            }
         }
         if(browserMode)
         {
            if(param1.keyCode == Keyboard.TAB && false)
            {
               _loc3_ = fauxFocus;
               if(!_loc3_)
               {
                  _loc3_ = mx_internal::form.systemManager.stage.focus;
               }
               _loc3_ = DisplayObject(findFocusManagerComponent2(InteractiveObject(_loc3_)));
               _loc4_ = "";
               if(_loc3_ is IFocusManagerGroup)
               {
                  _loc4_ = (_loc7_ = IFocusManagerGroup(_loc3_)).groupName;
               }
               _loc5_ = getIndexOfFocusedObject(_loc3_);
               _loc6_ = getIndexOfNextObject(_loc5_,param1.shiftKey,false,_loc4_);
               if(param1.shiftKey)
               {
                  if(_loc6_ >= _loc5_)
                  {
                     browserFocusComponent = getBrowserFocusComponent(param1.shiftKey);
                     if(false)
                     {
                        browserFocusComponent.tabIndex = 0;
                     }
                  }
               }
               else if(_loc6_ <= _loc5_)
               {
                  browserFocusComponent = getBrowserFocusComponent(param1.shiftKey);
                  if(false)
                  {
                     browserFocusComponent.tabIndex = LARGE_TAB_INDEX;
                  }
               }
            }
         }
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         var _loc2_:ISystemManager = mx_internal::form.systemManager;
         var _loc3_:DisplayObject = getTopLevelFocusTarget(InteractiveObject(param1.target));
         if(!_loc3_)
         {
            return;
         }
         showFocusIndicator = false;
         if((_loc3_ != _lastFocus || lastAction == "ACTIVATE") && !(_loc3_ is TextField))
         {
            setFocus(IFocusManagerComponent(_loc3_));
         }
         else if(_lastFocus)
         {
            if(!_lastFocus && _loc3_ is IEventDispatcher && SystemManager(mx_internal::form.systemManager).useSWFBridge())
            {
               IEventDispatcher(_loc3_).dispatchEvent(new FocusEvent(FocusEvent.FOCUS_IN));
            }
         }
         lastAction = "MOUSEDOWN";
         dispatchActivatedFocusManagerEvent(null);
         lastActiveFocusManager = this;
      }
      
      private function focusInHandler(param1:FocusEvent) : void
      {
         var _loc4_:IButton = null;
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
         var _loc3_:ISystemManager = mx_internal::form.systemManager;
         if(_loc3_.isDisplayObjectInABridgedApplication(DisplayObject(param1.target)))
         {
            return;
         }
         if(isParent(DisplayObjectContainer(mx_internal::form),_loc2_))
         {
            _lastFocus = findFocusManagerComponent(InteractiveObject(_loc2_));
            if(_lastFocus is IButton && !(_lastFocus is IToggleButton))
            {
               _loc4_ = _lastFocus as IButton;
               if(defButton)
               {
                  defButton.emphasized = false;
                  defButton = _loc4_;
                  _loc4_.emphasized = true;
               }
            }
            else if(Boolean(defButton) && defButton != _defaultButton)
            {
               defButton.emphasized = false;
               defButton = _defaultButton;
               if(_defaultButton)
               {
                  _defaultButton.emphasized = true;
               }
            }
         }
      }
      
      public function toString() : String
      {
         return Object(mx_internal::form).toString() + ".focusManager";
      }
      
      public function deactivate() : void
      {
         var _loc1_:ISystemManager = mx_internal::form.systemManager;
         if(_loc1_)
         {
            if(_loc1_.isTopLevelRoot())
            {
               _loc1_.stage.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,mouseFocusChangeHandler);
               _loc1_.stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler);
               _loc1_.stage.removeEventListener(Event.ACTIVATE,activateHandler);
               _loc1_.stage.removeEventListener(Event.DEACTIVATE,deactivateHandler);
            }
            else
            {
               _loc1_.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,mouseFocusChangeHandler);
               _loc1_.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler);
               _loc1_.removeEventListener(Event.ACTIVATE,activateHandler);
               _loc1_.removeEventListener(Event.DEACTIVATE,deactivateHandler);
            }
         }
         mx_internal::form.removeEventListener(FocusEvent.FOCUS_IN,focusInHandler,true);
         mx_internal::form.removeEventListener(FocusEvent.FOCUS_OUT,focusOutHandler,true);
         mx_internal::form.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         mx_internal::form.removeEventListener(KeyboardEvent.KEY_DOWN,defaultButtonKeyHandler);
         mx_internal::form.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler,true);
         activated = false;
         dispatchEventFromSWFBridges(new SWFBridgeRequest(SWFBridgeRequest.DEACTIVATE_FOCUS_REQUEST),skipBridge);
      }
      
      private function findFocusManagerComponent2(param1:InteractiveObject) : DisplayObject
      {
         var o:InteractiveObject = param1;
         try
         {
            while(o)
            {
               if(o is mx.managers.IFocusManagerComponent && Boolean(IFocusManagerComponent(o).focusEnabled) || o is ISWFLoader)
               {
                  return o;
               }
               o = o.parent;
            }
         }
         catch(error:SecurityError)
         {
         }
         return null;
      }
      
      private function getIndexOfNextObject(param1:int, param2:Boolean, param3:Boolean, param4:String) : int
      {
         var _loc7_:DisplayObject = null;
         var _loc8_:IFocusManagerGroup = null;
         var _loc9_:int = 0;
         var _loc10_:DisplayObject = null;
         var _loc11_:IFocusManagerGroup = null;
         var _loc5_:int = 0;
         var _loc6_:int = param1;
         while(true)
         {
            if(param2)
            {
               param1--;
            }
            else
            {
               param1++;
            }
            if(param3)
            {
               if(param2 && param1 < 0)
               {
                  break;
               }
               if(!param2 && param1 == _loc5_)
               {
                  break;
               }
            }
            else
            {
               param1 = (param1 + _loc5_) % _loc5_;
               if(_loc6_ == param1)
               {
                  break;
               }
               if(_loc6_ == -1)
               {
                  _loc6_ = param1;
               }
            }
            if(isValidFocusCandidate(focusableCandidates[param1],param4))
            {
               if((_loc7_ = DisplayObject(findFocusManagerComponent2(focusableCandidates[param1]))) is IFocusManagerGroup)
               {
                  _loc8_ = IFocusManagerGroup(_loc7_);
                  _loc9_ = 0;
                  while(_loc9_ < focusableCandidates.length)
                  {
                     if((_loc10_ = focusableCandidates[_loc9_]) is IFocusManagerGroup)
                     {
                        if((_loc11_ = IFocusManagerGroup(_loc10_)).groupName == _loc8_.groupName && _loc11_.selected)
                        {
                           if(InteractiveObject(_loc10_).tabIndex != InteractiveObject(_loc7_).tabIndex && !_loc8_.selected)
                           {
                              return getIndexOfNextObject(param1,param2,param3,param4);
                           }
                           param1 = _loc9_;
                           break;
                        }
                     }
                     _loc9_++;
                  }
               }
               return param1;
            }
         }
         return param1;
      }
      
      public function moveFocus(param1:String, param2:DisplayObject = null) : void
      {
         if(param1 == FocusRequestDirection.TOP)
         {
            setFocusToTop();
            return;
         }
         if(param1 == FocusRequestDirection.BOTTOM)
         {
            setFocusToBottom();
            return;
         }
         var _loc3_:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
         _loc3_.keyCode = Keyboard.TAB;
         _loc3_.shiftKey = param1 == FocusRequestDirection.FORWARD ? false : true;
         fauxFocus = param2;
         keyDownHandler(_loc3_);
         var _loc4_:FocusEvent;
         (_loc4_ = new FocusEvent(FocusEvent.KEY_FOCUS_CHANGE)).keyCode = Keyboard.TAB;
         _loc4_.shiftKey = param1 == FocusRequestDirection.FORWARD ? false : true;
         keyFocusChangeHandler(_loc4_);
         fauxFocus = null;
      }
      
      private function getMaxTabIndex() : int
      {
         var _loc4_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = Number(focusableObjects[_loc3_].tabIndex);
            if(!isNaN(_loc4_))
            {
               _loc1_ = Math.max(_loc1_,_loc4_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function isParent(param1:DisplayObjectContainer, param2:DisplayObject) : Boolean
      {
         if(param1 is IRawChildrenContainer)
         {
            return IRawChildrenContainer(param1).rawChildren.contains(param2);
         }
         return param1.contains(param2);
      }
      
      private function showHandler(param1:Event) : void
      {
         mx_internal::form.systemManager.activate(mx_internal::form);
      }
      
      mx_internal function set form(param1:mx.managers.IFocusManagerContainer) : void
      {
         _form = param1;
      }
      
      public function setFocus(param1:mx.managers.IFocusManagerComponent) : void
      {
         param1.setFocus();
         focusSetLocally = true;
      }
      
      public function findFocusManagerComponent(param1:InteractiveObject) : mx.managers.IFocusManagerComponent
      {
         return findFocusManagerComponent2(param1) as mx.managers.IFocusManagerComponent;
      }
      
      public function removeSWFBridge(param1:IEventDispatcher) : void
      {
         var _loc4_:int = 0;
         var _loc2_:ISystemManager = _form.systemManager;
         var _loc3_:DisplayObject = DisplayObject(swfBridgeGroup.getChildBridgeProvider(param1));
         if(_loc3_)
         {
            if((_loc4_ = focusableObjects.indexOf(_loc3_)) != -1)
            {
               focusableObjects.splice(_loc4_,1);
               calculateCandidates = true;
            }
            param1.removeEventListener(SWFBridgeRequest.MOVE_FOCUS_REQUEST,focusRequestMoveHandler);
            param1.removeEventListener(SWFBridgeRequest.SET_SHOW_FOCUS_INDICATOR_REQUEST,setShowFocusIndicatorRequestHandler);
            param1.removeEventListener(SWFBridgeEvent.BRIDGE_FOCUS_MANAGER_ACTIVATE,bridgeEventActivateHandler);
            swfBridgeGroup.removeChildBridge(param1);
            return;
         }
         throw new Error();
      }
      
      private function sortFocusableObjectsTabIndex() : void
      {
         var _loc3_:mx.managers.IFocusManagerComponent = null;
         focusableCandidates = [];
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = focusableObjects[_loc2_] as mx.managers.IFocusManagerComponent;
            if(_loc3_ && _loc3_.tabIndex && !isNaN(Number(_loc3_.tabIndex)) || focusableObjects[_loc2_] is ISWFLoader)
            {
               focusableCandidates.push(focusableObjects[_loc2_]);
            }
            _loc2_++;
         }
         focusableCandidates.sort(sortByTabIndex);
      }
      
      public function set defaultButton(param1:IButton) : void
      {
         var _loc2_:IButton = !!param1 ? IButton(param1) : null;
         if(_loc2_ != _defaultButton)
         {
            if(_defaultButton)
            {
               _defaultButton.emphasized = false;
            }
            if(defButton)
            {
               defButton.emphasized = false;
            }
            _defaultButton = _loc2_;
            if(_lastFocus && _lastFocus is IButton && !(_lastFocus is IToggleButton))
            {
               defButton = _lastFocus as IButton;
               defButton.emphasized = true;
            }
            else
            {
               defButton = _loc2_;
               if(_loc2_)
               {
                  _loc2_.emphasized = true;
               }
            }
         }
      }
      
      private function setFocusToNextObject(param1:FocusEvent) : void
      {
         focusChanged = false;
         if(false)
         {
            return;
         }
         var _loc2_:FocusInfo = getNextFocusManagerComponent2(param1.shiftKey,fauxFocus);
         if(!popup && (_loc2_.wrapped || !_loc2_.displayObject))
         {
            if(getParentBridge())
            {
               moveFocusToParent(param1.shiftKey);
               return;
            }
         }
         if(!_loc2_.displayObject)
         {
            param1.preventDefault();
            return;
         }
         setFocusToComponent(_loc2_.displayObject,param1.shiftKey);
      }
      
      private function getTopLevelFocusTarget(param1:InteractiveObject) : InteractiveObject
      {
         while(param1 != InteractiveObject(mx_internal::form))
         {
            if(param1 is mx.managers.IFocusManagerComponent && Boolean(IFocusManagerComponent(param1).focusEnabled) && Boolean(IFocusManagerComponent(param1).mouseFocusEnabled) && (param1 is IUIComponent ? IUIComponent(param1).enabled : true))
            {
               return param1;
            }
            if(param1.parent is ISWFLoader)
            {
               if(ISWFLoader(param1.parent).swfBridge)
               {
                  return null;
               }
            }
            param1 = param1.parent;
            if(param1 == null)
            {
               break;
            }
         }
         return null;
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         _form.removeEventListener(Event.ADDED_TO_STAGE,addedToStageHandler);
         if(false)
         {
            addFocusables(DisplayObject(_form));
            calculateCandidates = true;
         }
      }
      
      private function hideHandler(param1:Event) : void
      {
         mx_internal::form.systemManager.deactivate(mx_internal::form);
      }
      
      private function isEnabledAndVisible(param1:DisplayObject) : Boolean
      {
         var _loc2_:DisplayObjectContainer = DisplayObject(mx_internal::form).parent;
         while(param1 != _loc2_)
         {
            if(param1 is IUIComponent)
            {
               if(!IUIComponent(param1).enabled)
               {
                  return false;
               }
            }
            if(!param1.visible)
            {
               return false;
            }
            param1 = param1.parent;
         }
         return true;
      }
      
      public function hideFocus() : void
      {
         if(showFocusIndicator)
         {
            showFocusIndicator = false;
            if(_lastFocus)
            {
               _lastFocus.drawFocus(false);
            }
         }
      }
      
      private function getBrowserFocusComponent(param1:Boolean) : InteractiveObject
      {
         var _loc3_:int = 0;
         var _loc2_:InteractiveObject = mx_internal::form.systemManager.stage.focus;
         if(!_loc2_)
         {
            _loc3_ = param1 ? 0 : int(-1);
            _loc2_ = focusableCandidates[_loc3_];
         }
         return _loc2_;
      }
      
      public function get showFocusIndicator() : Boolean
      {
         return _showFocusIndicator;
      }
      
      private function moveFocusToParent(param1:Boolean) : Boolean
      {
         var _loc2_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.MOVE_FOCUS_REQUEST,false,true,null,param1 ? FocusRequestDirection.BACKWARD : FocusRequestDirection.FORWARD);
         var _loc3_:IEventDispatcher = _form.systemManager.swfBridgeGroup.parentBridge;
         _loc3_.dispatchEvent(_loc2_);
         focusChanged = _loc2_.data;
         return focusChanged;
      }
      
      public function set focusPane(param1:Sprite) : void
      {
         _focusPane = param1;
      }
      
      mx_internal function get form() : mx.managers.IFocusManagerContainer
      {
         return _form;
      }
      
      private function removedHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = DisplayObject(param1.target);
         if(_loc3_ is mx.managers.IFocusManagerComponent)
         {
            _loc2_ = 0;
            while(_loc2_ < focusableObjects.length)
            {
               if(_loc3_ == focusableObjects[_loc2_])
               {
                  if(_loc3_ == _lastFocus)
                  {
                     _lastFocus.drawFocus(false);
                     _lastFocus = null;
                  }
                  _loc3_.removeEventListener("tabEnabledChange",tabEnabledChangeHandler);
                  _loc3_.removeEventListener("tabIndexChange",tabIndexChangeHandler);
                  focusableObjects.splice(_loc2_,1);
                  focusableCandidates = [];
                  calculateCandidates = true;
                  break;
               }
               _loc2_++;
            }
         }
         removeFocusables(_loc3_,false);
      }
      
      private function dispatchEventFromSWFBridges(param1:Event, param2:IEventDispatcher = null) : void
      {
         var _loc3_:Event = null;
         var _loc7_:IEventDispatcher = null;
         var _loc4_:ISystemManager = mx_internal::form.systemManager;
         if(!popup)
         {
            if((Boolean(_loc7_ = swfBridgeGroup.parentBridge)) && _loc7_ != param2)
            {
               _loc3_ = param1.clone();
               if(_loc3_ is SWFBridgeRequest)
               {
                  SWFBridgeRequest(_loc3_).requestor = _loc7_;
               }
               _loc7_.dispatchEvent(_loc3_);
            }
         }
         var _loc5_:Array = swfBridgeGroup.getChildBridges();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc5_[_loc6_] != param2)
            {
               _loc3_ = param1.clone();
               if(_loc3_ is SWFBridgeRequest)
               {
                  SWFBridgeRequest(_loc3_).requestor = IEventDispatcher(_loc5_[_loc6_]);
               }
               IEventDispatcher(_loc5_[_loc6_]).dispatchEvent(_loc3_);
            }
            _loc6_++;
         }
      }
      
      public function get defaultButton() : IButton
      {
         return _defaultButton;
      }
      
      private function activateHandler(param1:Event) : void
      {
         if(Boolean(_lastFocus) && !browserMode)
         {
            _lastFocus.setFocus();
         }
         lastAction = "ACTIVATE";
      }
      
      public function showFocus() : void
      {
         if(!showFocusIndicator)
         {
            showFocusIndicator = true;
            if(_lastFocus)
            {
               _lastFocus.drawFocus(true);
            }
         }
      }
      
      public function getNextFocusManagerComponent(param1:Boolean = false) : mx.managers.IFocusManagerComponent
      {
         return getNextFocusManagerComponent2(param1,fauxFocus).displayObject as mx.managers.IFocusManagerComponent;
      }
      
      private function setShowFocusIndicatorRequestHandler(param1:Event) : void
      {
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         _showFocusIndicator = _loc2_.data;
         dispatchSetShowFocusIndicatorRequest(_showFocusIndicator,IEventDispatcher(param1.target));
      }
      
      private function setFocusToTop() : void
      {
         setFocusToNextIndex(-1,false);
      }
      
      private function isTabVisible(param1:DisplayObject) : Boolean
      {
         var _loc2_:DisplayObject = DisplayObject(mx_internal::form.systemManager);
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:DisplayObjectContainer = param1.parent;
         while(Boolean(_loc3_) && _loc3_ != _loc2_)
         {
            if(!_loc3_.tabChildren)
            {
               return false;
            }
            _loc3_ = _loc3_.parent;
         }
         return true;
      }
      
      mx_internal function get lastFocus() : mx.managers.IFocusManagerComponent
      {
         return _lastFocus;
      }
      
      public function set defaultButtonEnabled(param1:Boolean) : void
      {
         _defaultButtonEnabled = param1;
      }
      
      public function get defaultButtonEnabled() : Boolean
      {
         return _defaultButtonEnabled;
      }
      
      public function set showFocusIndicator(param1:Boolean) : void
      {
         var _loc2_:* = _showFocusIndicator != param1;
         _showFocusIndicator = param1;
         if(_loc2_ && !popup && Boolean(mx_internal::form.systemManager.swfBridgeGroup))
         {
            dispatchSetShowFocusIndicatorRequest(param1,null);
         }
      }
      
      private function sortByTabIndex(param1:InteractiveObject, param2:InteractiveObject) : int
      {
         var _loc3_:int = param1.tabIndex;
         var _loc4_:int = param2.tabIndex;
         if(_loc3_ == -1)
         {
            _loc3_ = 0;
         }
         if(_loc4_ == -1)
         {
            _loc4_ = 0;
         }
         return _loc3_ > _loc4_ ? 1 : (_loc3_ < _loc4_ ? -1 : int(sortByDepth(DisplayObject(param1),DisplayObject(param2))));
      }
      
      public function activate() : void
      {
         if(activated)
         {
            return;
         }
         var _loc1_:ISystemManager = mx_internal::form.systemManager;
         if(_loc1_)
         {
            if(_loc1_.isTopLevelRoot())
            {
               _loc1_.stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,mouseFocusChangeHandler,false,0,true);
               _loc1_.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler,false,0,true);
               _loc1_.stage.addEventListener(Event.ACTIVATE,activateHandler,false,0,true);
               _loc1_.stage.addEventListener(Event.DEACTIVATE,deactivateHandler,false,0,true);
            }
            else
            {
               _loc1_.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,mouseFocusChangeHandler,false,0,true);
               _loc1_.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler,false,0,true);
               _loc1_.addEventListener(Event.ACTIVATE,activateHandler,false,0,true);
               _loc1_.addEventListener(Event.DEACTIVATE,deactivateHandler,false,0,true);
            }
         }
         mx_internal::form.addEventListener(FocusEvent.FOCUS_IN,focusInHandler,true);
         mx_internal::form.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler,true);
         mx_internal::form.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         mx_internal::form.addEventListener(KeyboardEvent.KEY_DOWN,defaultButtonKeyHandler);
         mx_internal::form.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler,true);
         activated = true;
         if(_lastFocus)
         {
            setFocus(_lastFocus);
         }
         dispatchEventFromSWFBridges(new SWFBridgeRequest(SWFBridgeRequest.ACTIVATE_FOCUS_REQUEST),skipBridge);
      }
      
      private function setFocusToNextIndex(param1:int, param2:Boolean) : void
      {
         if(false)
         {
            return;
         }
         if(calculateCandidates)
         {
            sortFocusableObjects();
            calculateCandidates = false;
         }
         var _loc3_:FocusInfo = getNextFocusManagerComponent2(param2,null,param1);
         if(!popup && _loc3_.wrapped)
         {
            if(getParentBridge())
            {
               moveFocusToParent(param2);
               return;
            }
         }
         setFocusToComponent(_loc3_.displayObject,param2);
      }
   }
}

import flash.display.DisplayObject;

class FocusInfo
{
    
   
   public var displayObject:DisplayObject;
   
   public var wrapped:Boolean;
   
   public function FocusInfo()
   {
      super();
   }
}
