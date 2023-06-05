package mx.flash
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.ui.Keyboard;
   import mx.automation.IAutomationObject;
   import mx.core.IConstraintClient;
   import mx.core.IDeferredInstantiationUIComponent;
   import mx.core.IFlexDisplayObject;
   import mx.core.IInvalidating;
   import mx.core.IStateClient;
   import mx.core.IUIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.MoveEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.StateChangeEvent;
   import mx.managers.IFocusManagerComponent;
   import mx.managers.ISystemManager;
   import mx.managers.IToolTipManagerClient;
   
   public dynamic class UIMovieClip extends MovieClip implements IDeferredInstantiationUIComponent, IToolTipManagerClient, IStateClient, IFocusManagerComponent, IConstraintClient, IAutomationObject
   {
       
      
      private var reverseDirectionFocus:Boolean = false;
      
      private var oldHeight:Number;
      
      protected var _height:Number;
      
      private var _automationName:String = null;
      
      private var _automationDelegate:IAutomationObject;
      
      private var _currentState:String;
      
      private var _document:Object;
      
      private var _systemManager:ISystemManager;
      
      private var _isPopUp:Boolean = false;
      
      private var focusableObjects:Array;
      
      private var _top;
      
      private var _percentWidth:Number;
      
      private var _explicitHeight:Number;
      
      private var explicitSizeChanged:Boolean = false;
      
      private var _measuredWidth:Number;
      
      private var _toolTip:String;
      
      public var boundingBoxName:String = "boundingBox";
      
      protected var _width:Number;
      
      private var _tweeningProperties:Array;
      
      protected var initialized:Boolean = false;
      
      private var _focusPane:Sprite;
      
      private var _left;
      
      private var transitionEndState:String;
      
      private var focusListenersAdded:Boolean = false;
      
      private var stateMap:Object;
      
      private var _showInAutomationHierarchy:Boolean = true;
      
      private var _descriptor:UIComponentDescriptor;
      
      private var oldX:Number;
      
      private var oldY:Number;
      
      private var _right;
      
      private var validateMeasuredSizeFlag:Boolean = true;
      
      protected var trackSizeChanges:Boolean = true;
      
      private var _includeInLayout:Boolean = true;
      
      private var _focusEnabled:Boolean = true;
      
      private var _explicitMinWidth:Number;
      
      private var _bottom;
      
      private var _explicitMaxHeight:Number;
      
      private var explicitTabEnabledChanged:Boolean = false;
      
      private var transitionStartFrame:Number;
      
      private var _explicitMaxWidth:Number;
      
      private var _measuredMinHeight:Number = 0;
      
      private var _verticalCenter;
      
      private var _baseline;
      
      private var transitionDirection:Number = 0;
      
      private var _measuredHeight:Number;
      
      private var _owner:DisplayObjectContainer;
      
      private var _id:String;
      
      private var transitionEndFrame:Number;
      
      private var _explicitMinHeight:Number;
      
      private var _parent:DisplayObjectContainer;
      
      private var _percentHeight:Number;
      
      private var _measuredMinWidth:Number = 0;
      
      private var oldWidth:Number;
      
      private var _explicitWidth:Number;
      
      private var _horizontalCenter;
      
      public function UIMovieClip()
      {
         focusableObjects = [];
         super();
         addEventListener(Event.ENTER_FRAME,enterFrameHandler,false,0,true);
         addEventListener(FocusEvent.FOCUS_IN,focusInHandler,false,0,true);
         addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
      }
      
      override public function get tabEnabled() : Boolean
      {
         return super.tabEnabled;
      }
      
      public function get left() : *
      {
         return _left;
      }
      
      [Bindable(event="propertyChange")]
      public function set left(param1:*) : void
      {
         var _loc2_:Object = this.left;
         if(_loc2_ !== param1)
         {
            this._3317767left = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"left",_loc2_,param1));
         }
      }
      
      public function get automationDelegate() : Object
      {
         return _automationDelegate;
      }
      
      public function get minHeight() : Number
      {
         if(!isNaN(explicitMinHeight))
         {
            return explicitMinHeight;
         }
         return measuredMinHeight;
      }
      
      public function getExplicitOrMeasuredHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(isNaN(explicitHeight))
         {
            _loc1_ = measuredHeight;
            if(!isNaN(explicitMinHeight) && _loc1_ < explicitMinHeight)
            {
               _loc1_ = explicitMinHeight;
            }
            if(!isNaN(explicitMaxHeight) && _loc1_ > explicitMaxHeight)
            {
               _loc1_ = explicitMaxHeight;
            }
            return _loc1_;
         }
         return explicitHeight;
      }
      
      public function get right() : *
      {
         return _right;
      }
      
      private function validateMeasuredSize() : void
      {
         if(validateMeasuredSizeFlag)
         {
            validateMeasuredSizeFlag = false;
            _measuredWidth = bounds.width;
            _measuredHeight = bounds.height;
         }
      }
      
      public function get bottom() : *
      {
         return _bottom;
      }
      
      public function set explicitMaxWidth(param1:Number) : void
      {
         _explicitMaxWidth = param1;
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Number = NaN;
         if(explicitSizeChanged)
         {
            explicitSizeChanged = false;
            setActualSize(getExplicitOrMeasuredWidth(),getExplicitOrMeasuredHeight());
         }
         if(isNaN(oldX))
         {
            oldX = x;
         }
         if(isNaN(oldY))
         {
            oldY = y;
         }
         if(x != oldX || y != oldY)
         {
            dispatchMoveEvent();
         }
         if(trackSizeChanges)
         {
            _loc2_ = bounds;
            _loc2_.width *= scaleX;
            _loc2_.height *= scaleY;
            if(isNaN(oldWidth))
            {
               oldWidth = _width = _loc2_.width;
            }
            if(isNaN(oldHeight))
            {
               oldHeight = _height = _loc2_.height;
            }
            if(sizeChanged(_loc2_.width,oldWidth) || sizeChanged(_loc2_.height,oldHeight))
            {
               _width = _loc2_.width;
               _height = _loc2_.height;
               validateMeasuredSizeFlag = true;
               notifySizeChanged();
               dispatchResizeEvent();
            }
            else if(sizeChanged(width,oldWidth) || sizeChanged(height,oldHeight))
            {
               dispatchResizeEvent();
            }
         }
         if(currentLabel && currentLabel.indexOf(":") < 0 && currentLabel != _currentState)
         {
            _currentState = currentLabel;
         }
         if(transitionDirection != 0)
         {
            _loc3_ = currentFrame + transitionDirection;
            if(transitionDirection > 0 && _loc3_ >= transitionEndFrame || transitionDirection < 0 && _loc3_ <= transitionEndFrame)
            {
               gotoAndStop(stateMap[transitionEndState].frame);
               transitionDirection = 0;
            }
            else
            {
               gotoAndStop(_loc3_);
            }
         }
      }
      
      public function get tweeningProperties() : Array
      {
         return _tweeningProperties;
      }
      
      public function set minHeight(param1:Number) : void
      {
         explicitMinHeight = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set right(param1:*) : void
      {
         var _loc2_:Object = this.right;
         if(_loc2_ !== param1)
         {
            this._108511772right = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"right",_loc2_,param1));
         }
      }
      
      private function keyFocusChangeHandler(param1:FocusEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            if(true)
            {
               removeFocusEventListeners();
            }
            else
            {
               param1.stopImmediatePropagation();
            }
         }
      }
      
      public function get baseline() : *
      {
         return _baseline;
      }
      
      private function set _1383228885bottom(param1:*) : void
      {
         if(param1 != _bottom)
         {
            _bottom = param1;
            notifySizeChanged();
         }
      }
      
      public function get automationName() : String
      {
         if(_automationName)
         {
            return _automationName;
         }
         if(automationDelegate)
         {
            return automationDelegate.automationName;
         }
         return "";
      }
      
      public function get explicitMinHeight() : Number
      {
         return _explicitMinHeight;
      }
      
      private function keyFocusChangeCaptureHandler(param1:FocusEvent) : void
      {
         reverseDirectionFocus = param1.shiftKey;
      }
      
      [Bindable(event="propertyChange")]
      public function set bottom(param1:*) : void
      {
         var _loc2_:Object = this.bottom;
         if(_loc2_ !== param1)
         {
            this._1383228885bottom = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottom",_loc2_,param1));
         }
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      public function set tweeningProperties(param1:Array) : void
      {
         _tweeningProperties = param1;
      }
      
      public function get focusPane() : Sprite
      {
         return _focusPane;
      }
      
      override public function set height(param1:Number) : void
      {
         explicitHeight = param1;
      }
      
      protected function notifySizeChanged() : void
      {
         if(Boolean(parent) && parent is IInvalidating)
         {
            IInvalidating(parent).invalidateSize();
            IInvalidating(parent).invalidateDisplayList();
         }
      }
      
      public function get numAutomationChildren() : int
      {
         if(automationDelegate)
         {
            return automationDelegate.numAutomationChildren;
         }
         return 0;
      }
      
      protected function focusInHandler(param1:FocusEvent) : void
      {
         if(!focusListenersAdded)
         {
            addFocusEventListeners();
         }
      }
      
      public function set document(param1:Object) : void
      {
         _document = param1;
      }
      
      public function getExplicitOrMeasuredWidth() : Number
      {
         var _loc1_:Number = NaN;
         if(isNaN(explicitWidth))
         {
            _loc1_ = measuredWidth;
            if(!isNaN(explicitMinWidth) && _loc1_ < explicitMinWidth)
            {
               _loc1_ = explicitMinWidth;
            }
            if(!isNaN(explicitMaxWidth) && _loc1_ > explicitMaxWidth)
            {
               _loc1_ = explicitMaxWidth;
            }
            return _loc1_;
         }
         return explicitWidth;
      }
      
      private function set _3317767left(param1:*) : void
      {
         if(param1 != _left)
         {
            _left = param1;
            notifySizeChanged();
         }
      }
      
      public function get explicitHeight() : Number
      {
         return _explicitHeight;
      }
      
      public function get showInAutomationHierarchy() : Boolean
      {
         return _showInAutomationHierarchy;
      }
      
      public function get systemManager() : ISystemManager
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:IUIComponent = null;
         if(!_systemManager)
         {
            _loc1_ = root;
            if(_loc1_)
            {
               _systemManager = _loc1_ as ISystemManager;
            }
            else
            {
               _loc2_ = parent;
               while(_loc2_)
               {
                  _loc3_ = _loc2_ as IUIComponent;
                  if(_loc3_)
                  {
                     _systemManager = _loc3_.systemManager;
                     break;
                  }
                  _loc2_ = _loc2_.parent;
               }
            }
         }
         return _systemManager;
      }
      
      public function get percentWidth() : Number
      {
         return _percentWidth;
      }
      
      public function set automationName(param1:String) : void
      {
         _automationName = param1;
      }
      
      public function set explicitMinHeight(param1:Number) : void
      {
         _explicitMinHeight = param1;
         notifySizeChanged();
      }
      
      public function get baselinePosition() : Number
      {
         return 0;
      }
      
      public function set focusEnabled(param1:Boolean) : void
      {
         _focusEnabled = param1;
      }
      
      public function get currentState() : String
      {
         return _currentState;
      }
      
      public function get minWidth() : Number
      {
         if(!isNaN(explicitMinWidth))
         {
            return explicitMinWidth;
         }
         return measuredMinWidth;
      }
      
      public function get measuredWidth() : Number
      {
         validateMeasuredSize();
         return _measuredWidth;
      }
      
      public function get mouseFocusEnabled() : Boolean
      {
         return false;
      }
      
      public function get automationValue() : Array
      {
         if(automationDelegate)
         {
            return automationDelegate.automationValue;
         }
         return [];
      }
      
      private function set _115029top(param1:*) : void
      {
         if(param1 != _top)
         {
            _top = param1;
            notifySizeChanged();
         }
      }
      
      override public function get parent() : DisplayObjectContainer
      {
         return !!_parent ? _parent : super.parent;
      }
      
      public function get owner() : DisplayObjectContainer
      {
         return !!_owner ? _owner : parent;
      }
      
      protected function get bounds() : Rectangle
      {
         if(boundingBoxName && boundingBoxName != "" && boundingBoxName in this && Boolean(this[boundingBoxName]))
         {
            return this[boundingBoxName].getBounds(this);
         }
         return getBounds(this);
      }
      
      [Bindable(event="propertyChange")]
      public function set baseline(param1:*) : void
      {
         var _loc2_:Object = this.baseline;
         if(_loc2_ !== param1)
         {
            this._1720785339baseline = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseline",_loc2_,param1));
         }
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         if(sizeChanged(_width,param1) || sizeChanged(_height,param2))
         {
            dispatchResizeEvent();
         }
         _width = param1;
         _height = param2;
         super.scaleX = param1 / measuredWidth;
         super.scaleY = param2 / measuredHeight;
      }
      
      public function parentChanged(param1:DisplayObjectContainer) : void
      {
         if(!param1)
         {
            _parent = null;
         }
         else if(param1 is IUIComponent || param1 is ISystemManager)
         {
            _parent = param1;
         }
         else
         {
            _parent = param1.parent;
         }
      }
      
      public function get maxWidth() : Number
      {
         return isNaN(explicitMaxWidth) ? 10000 : explicitMaxWidth;
      }
      
      public function createAutomationIDPart(param1:IAutomationObject) : Object
      {
         if(automationDelegate)
         {
            return automationDelegate.createAutomationIDPart(param1);
         }
         return null;
      }
      
      public function getAutomationChildAt(param1:int) : IAutomationObject
      {
         if(automationDelegate)
         {
            return automationDelegate.getAutomationChildAt(param1);
         }
         return null;
      }
      
      private function removeFocusEventListeners() : void
      {
         stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler);
         stage.removeEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);
         focusListenersAdded = false;
      }
      
      public function set focusPane(param1:Sprite) : void
      {
         _focusPane = param1;
      }
      
      public function setConstraintValue(param1:String, param2:*) : void
      {
         this[param1] = param2;
      }
      
      [Bindable(event="propertyChange")]
      public function set verticalCenter(param1:*) : void
      {
         var _loc2_:Object = this.verticalCenter;
         if(_loc2_ !== param1)
         {
            this._926273685verticalCenter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"verticalCenter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set top(param1:*) : void
      {
         var _loc2_:Object = this.top;
         if(_loc2_ !== param1)
         {
            this._115029top = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"top",_loc2_,param1));
         }
      }
      
      public function set descriptor(param1:UIComponentDescriptor) : void
      {
         _descriptor = param1;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         _includeInLayout = param1;
      }
      
      public function get explicitMinWidth() : Number
      {
         return _explicitMinWidth;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         setVisible(param1);
      }
      
      public function registerEffects(param1:Array) : void
      {
      }
      
      public function set showInAutomationHierarchy(param1:Boolean) : void
      {
         _showInAutomationHierarchy = param1;
      }
      
      public function set measuredMinWidth(param1:Number) : void
      {
         _measuredMinWidth = param1;
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         _explicitHeight = param1;
         explicitSizeChanged = true;
         notifySizeChanged();
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         removeEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
         if(systemManager)
         {
            systemManager.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeCaptureHandler,true,0,true);
         }
         else if(Boolean(parentDocument) && false)
         {
            parentDocument.systemManager.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeCaptureHandler,true,0,true);
         }
      }
      
      public function set percentWidth(param1:Number) : void
      {
         _percentWidth = param1;
         notifySizeChanged();
      }
      
      private function set _926273685verticalCenter(param1:*) : void
      {
         if(param1 != _verticalCenter)
         {
            _verticalCenter = param1;
            notifySizeChanged();
         }
      }
      
      public function get explicitMaxWidth() : Number
      {
         return _explicitMaxWidth;
      }
      
      public function set systemManager(param1:ISystemManager) : void
      {
         _systemManager = param1;
      }
      
      public function get document() : Object
      {
         return _document;
      }
      
      public function executeBindings(param1:Boolean = false) : void
      {
         var _loc2_:Object = Boolean(descriptor) && false ? descriptor.document : parentDocument;
         var _loc3_:* = ApplicationDomain.currentDomain.getDefinition("mx.binding.BindingManager");
         if(_loc3_ != null)
         {
            _loc3_.executeBindings(_loc2_,id,this);
         }
      }
      
      override public function get height() : Number
      {
         if(!isNaN(_height))
         {
            return _height;
         }
         return super.height;
      }
      
      public function set minWidth(param1:Number) : void
      {
         explicitMinWidth = param1;
      }
      
      public function set currentState(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:StateChangeEvent = null;
         if(param1 == _currentState)
         {
            return;
         }
         if(!stateMap)
         {
            buildStateMap();
         }
         if(false)
         {
            _loc2_ = _currentState + "-" + param1 + ":start";
            if(false)
            {
               _loc3_ = Number(stateMap[_loc2_].frame);
               _loc4_ = Number(stateMap[_currentState + "-" + param1 + ":end"].frame);
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = param1 + "-" + _currentState + ":end";
               if(false)
               {
                  _loc3_ = Number(stateMap[_loc2_].frame);
                  _loc4_ = Number(stateMap[param1 + "-" + _currentState + ":start"].frame);
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = "*-" + param1 + ":start";
               if(false)
               {
                  _loc3_ = Number(stateMap[_loc2_].frame);
                  _loc4_ = Number(stateMap["*-" + param1 + ":end"].frame);
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = param1 + "-*:end";
               if(false)
               {
                  _loc3_ = Number(stateMap[_loc2_].frame);
                  _loc4_ = Number(stateMap[param1 + "-*:start"].frame);
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = _currentState + "-*:start";
               if(false)
               {
                  _loc3_ = Number(stateMap[_loc2_].frame);
                  _loc4_ = Number(stateMap[_currentState + "-*:end"].frame);
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = "*-" + _currentState + ":end";
               if(false)
               {
                  _loc3_ = Number(stateMap[_loc2_].frame);
                  _loc4_ = Number(stateMap["*-" + _currentState + ":start"].frame);
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = "*-*:start";
               if(false)
               {
                  _loc3_ = Number(stateMap[_loc2_].frame);
                  _loc4_ = Number(stateMap["*-*:end"].frame);
               }
            }
            if(isNaN(_loc3_) && param1 in stateMap)
            {
               _loc3_ = Number(stateMap[param1].frame);
            }
            if(isNaN(_loc3_))
            {
               return;
            }
            (_loc5_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING)).oldState = _currentState;
            _loc5_.newState = param1;
            dispatchEvent(_loc5_);
            if(isNaN(_loc4_))
            {
               gotoAndStop(_loc3_);
               transitionDirection = 0;
            }
            else
            {
               if(currentFrame < Math.min(_loc3_,_loc4_) || currentFrame > Math.max(_loc3_,_loc4_))
               {
                  gotoAndStop(_loc3_);
               }
               else
               {
                  _loc3_ = currentFrame;
               }
               transitionStartFrame = _loc3_;
               transitionEndFrame = _loc4_;
               transitionDirection = _loc4_ > _loc3_ ? 1 : -1;
               transitionEndState = param1;
            }
            (_loc5_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE)).oldState = _currentState;
            _loc5_.newState = param1;
            dispatchEvent(_loc5_);
            _currentState = param1;
         }
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      private function focusOutHandler(param1:FocusEvent) : void
      {
         if(focusableObjects.indexOf(param1.relatedObject) == -1)
         {
            removeFocusEventListeners();
         }
      }
      
      public function replayAutomatableEvent(param1:Event) : Boolean
      {
         if(automationDelegate)
         {
            return automationDelegate.replayAutomatableEvent(param1);
         }
         return false;
      }
      
      public function get focusEnabled() : Boolean
      {
         return _focusEnabled && false;
      }
      
      public function set cacheHeuristic(param1:Boolean) : void
      {
      }
      
      private function set _108511772right(param1:*) : void
      {
         if(param1 != _right)
         {
            _right = param1;
            notifySizeChanged();
         }
      }
      
      public function get top() : *
      {
         return _top;
      }
      
      public function set maxHeight(param1:Number) : void
      {
         explicitMaxHeight = param1;
      }
      
      private function set _1720785339baseline(param1:*) : void
      {
         if(param1 != _baseline)
         {
            _baseline = param1;
            notifySizeChanged();
         }
      }
      
      private function addFocusEventListeners() : void
      {
         stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler,false,1,true);
         stage.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler,false,0,true);
         focusListenersAdded = true;
      }
      
      public function get cachePolicy() : String
      {
         return "";
      }
      
      public function getConstraintValue(param1:String) : *
      {
         return this[param1];
      }
      
      public function set owner(param1:DisplayObjectContainer) : void
      {
         _owner = param1;
      }
      
      protected function findFocusCandidates(param1:DisplayObjectContainer) : void
      {
         var _loc3_:InteractiveObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_) as InteractiveObject;
            if(Boolean(_loc3_) && _loc3_.tabEnabled)
            {
               focusableObjects.push(_loc3_);
               if(!explicitTabEnabledChanged)
               {
                  tabEnabled = true;
               }
            }
            if(_loc3_ is DisplayObjectContainer)
            {
               findFocusCandidates(DisplayObjectContainer(_loc3_));
            }
            _loc2_++;
         }
      }
      
      public function get verticalCenter() : *
      {
         return _verticalCenter;
      }
      
      private function set _2016110183horizontalCenter(param1:*) : void
      {
         if(param1 != _horizontalCenter)
         {
            _horizontalCenter = param1;
            notifySizeChanged();
         }
      }
      
      public function get descriptor() : UIComponentDescriptor
      {
         return _descriptor;
      }
      
      public function createReferenceOnParentDocument(param1:IFlexDisplayObject) : void
      {
         if(Boolean(id) && id != "")
         {
            param1[id] = this;
         }
      }
      
      public function get includeInLayout() : Boolean
      {
         return _includeInLayout;
      }
      
      public function set automationDelegate(param1:Object) : void
      {
         _automationDelegate = param1 as IAutomationObject;
      }
      
      public function get measuredMinWidth() : Number
      {
         return _measuredMinWidth;
      }
      
      public function set isPopUp(param1:Boolean) : void
      {
         _isPopUp = param1;
      }
      
      public function get measuredHeight() : Number
      {
         validateMeasuredSize();
         return _measuredHeight;
      }
      
      public function initialize() : void
      {
         var _loc2_:IUIComponent = null;
         initialized = true;
         dispatchEvent(new FlexEvent(FlexEvent.PREINITIALIZE));
         if(boundingBoxName && boundingBoxName != "" && boundingBoxName in this && Boolean(this[boundingBoxName]))
         {
            this[boundingBoxName].visible = false;
         }
         if(explicitSizeChanged)
         {
            explicitSizeChanged = false;
            setActualSize(getExplicitOrMeasuredWidth(),getExplicitOrMeasuredHeight());
         }
         findFocusCandidates(this);
         var _loc1_:int = 0;
         while(_loc1_ < numChildren)
         {
            _loc2_ = getChildAt(_loc1_) as IUIComponent;
            if(_loc2_)
            {
               _loc2_.initialize();
            }
            _loc1_++;
         }
         dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
         dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
      }
      
      public function resolveAutomationIDPart(param1:Object) : Array
      {
         if(automationDelegate)
         {
            return automationDelegate.resolveAutomationIDPart(param1);
         }
         return [];
      }
      
      public function setFocus() : void
      {
         stage.focus = focusableObjects[reverseDirectionFocus ? -1 : 0];
         addFocusEventListeners();
      }
      
      public function set percentHeight(param1:Number) : void
      {
         _percentHeight = param1;
         notifySizeChanged();
      }
      
      public function get horizontalCenter() : *
      {
         return _horizontalCenter;
      }
      
      override public function set width(param1:Number) : void
      {
         explicitWidth = param1;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         explicitMaxWidth = param1;
      }
      
      protected function sizeChanged(param1:Number, param2:Number) : Boolean
      {
         return Math.abs(param1 - param2) > 1;
      }
      
      public function owns(param1:DisplayObject) : Boolean
      {
         while(Boolean(param1) && param1 != this)
         {
            if(param1 is IUIComponent)
            {
               param1 = IUIComponent(param1).owner;
            }
            else
            {
               param1 = param1.parent;
            }
         }
         return param1 == this;
      }
      
      public function set explicitMaxHeight(param1:Number) : void
      {
         _explicitMaxHeight = param1;
         notifySizeChanged();
      }
      
      public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
         super.visible = param1;
         if(!param2)
         {
            dispatchEvent(new FlexEvent(param1 ? "null" : FlexEvent.HIDE));
         }
      }
      
      private function buildStateMap() : void
      {
         var _loc1_:Array = currentLabels;
         stateMap = {};
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            stateMap[_loc1_[_loc2_].name] = _loc1_[_loc2_];
            _loc2_++;
         }
      }
      
      public function get maxHeight() : Number
      {
         return isNaN(explicitMaxHeight) ? 10000 : explicitMaxHeight;
      }
      
      public function deleteReferenceOnParentDocument(param1:IFlexDisplayObject) : void
      {
         if(Boolean(id) && id != "")
         {
            param1[id] = null;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set horizontalCenter(param1:*) : void
      {
         var _loc2_:Object = this.horizontalCenter;
         if(_loc2_ !== param1)
         {
            this._2016110183horizontalCenter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalCenter",_loc2_,param1));
         }
      }
      
      protected function dispatchResizeEvent() : void
      {
         var _loc1_:ResizeEvent = new ResizeEvent(ResizeEvent.RESIZE);
         _loc1_.oldWidth = oldWidth;
         _loc1_.oldHeight = oldHeight;
         dispatchEvent(_loc1_);
         oldWidth = width;
         oldHeight = height;
      }
      
      public function get isPopUp() : Boolean
      {
         return _isPopUp;
      }
      
      public function get percentHeight() : Number
      {
         return _percentHeight;
      }
      
      override public function get width() : Number
      {
         if(!isNaN(_width))
         {
            return _width;
         }
         return super.width;
      }
      
      public function set explicitMinWidth(param1:Number) : void
      {
         _explicitMinWidth = param1;
         notifySizeChanged();
      }
      
      public function get explicitMaxHeight() : Number
      {
         return _explicitMaxHeight;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
         if(param1 != oldX || param2 != oldY)
         {
            dispatchMoveEvent();
         }
      }
      
      public function get toolTip() : String
      {
         return _toolTip;
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         _explicitWidth = param1;
         explicitSizeChanged = true;
         notifySizeChanged();
      }
      
      public function get parentDocument() : Object
      {
         var _loc1_:IUIComponent = null;
         var _loc2_:ISystemManager = null;
         if(document == this)
         {
            _loc1_ = parent as IUIComponent;
            if(_loc1_)
            {
               return _loc1_.document;
            }
            _loc2_ = parent as ISystemManager;
            if(_loc2_)
            {
               return _loc2_.document;
            }
            return null;
         }
         return document;
      }
      
      override public function set tabEnabled(param1:Boolean) : void
      {
         super.tabEnabled = param1;
         explicitTabEnabledChanged = true;
      }
      
      public function set toolTip(param1:String) : void
      {
         var _loc2_:* = ApplicationDomain.currentDomain.getDefinition("mx.managers.ToolTipManager");
         var _loc3_:String = _toolTip;
         _toolTip = param1;
         if(_loc2_)
         {
            _loc2_.mx_internal::registerToolTip(this,_loc3_,param1);
         }
      }
      
      private function dispatchMoveEvent() : void
      {
         var _loc1_:MoveEvent = new MoveEvent(MoveEvent.MOVE);
         _loc1_.oldX = oldX;
         _loc1_.oldY = oldY;
         dispatchEvent(_loc1_);
         oldX = x;
         oldY = y;
      }
      
      public function drawFocus(param1:Boolean) : void
      {
      }
      
      public function set measuredMinHeight(param1:Number) : void
      {
         _measuredMinHeight = param1;
      }
      
      public function get explicitWidth() : Number
      {
         return _explicitWidth;
      }
      
      public function get measuredMinHeight() : Number
      {
         return _measuredMinHeight;
      }
      
      public function get automationTabularData() : Object
      {
         if(automationDelegate)
         {
            return automationDelegate.automationTabularData;
         }
         return null;
      }
   }
}
