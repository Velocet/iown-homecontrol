package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventPhase;
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.text.TextLineMetrics;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import mx.automation.IAutomationObject;
   import mx.binding.BindingManager;
   import mx.controls.IFlexContextMenu;
   import mx.effects.EffectManager;
   import mx.effects.IEffect;
   import mx.effects.IEffectInstance;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.DynamicEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.MoveEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.StateChangeEvent;
   import mx.events.ValidationResultEvent;
   import mx.graphics.RoundedRectangle;
   import mx.managers.CursorManager;
   import mx.managers.ICursorManager;
   import mx.managers.IFocusManager;
   import mx.managers.IFocusManagerComponent;
   import mx.managers.IFocusManagerContainer;
   import mx.managers.ILayoutManagerClient;
   import mx.managers.ISystemManager;
   import mx.managers.IToolTipManagerClient;
   import mx.managers.SystemManager;
   import mx.managers.SystemManagerGlobals;
   import mx.managers.SystemManagerProxy;
   import mx.managers.ToolTipManager;
   import mx.modules.ModuleManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.states.State;
   import mx.states.Transition;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   import mx.styles.StyleProtoChain;
   import mx.utils.ColorUtil;
   import mx.utils.GraphicsUtil;
   import mx.utils.StringUtil;
   import mx.validators.IValidatorListener;
   import mx.validators.ValidationResult;
   
   public class UIComponent extends FlexSprite implements IAutomationObject, IChildList, IDeferredInstantiationUIComponent, IFlexDisplayObject, IFlexModule, IInvalidating, ILayoutManagerClient, IPropertyChangeNotifier, IRepeaterClient, ISimpleStyleClient, IStyleClient, IToolTipManagerClient, IUIComponent, IValidatorListener, IStateClient, IConstraintClient
   {
      
      mx_internal static var dispatchEventHook:Function;
      
      private static var fakeMouseY:QName = new QName(mx_internal,"_mouseY");
      
      public static const DEFAULT_MEASURED_WIDTH:Number = 160;
      
      public static const DEFAULT_MAX_WIDTH:Number = 10000;
      
      public static const DEFAULT_MEASURED_MIN_HEIGHT:Number = 22;
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      mx_internal static var STYLE_UNINITIALIZED:Object = {};
      
      private static var fakeMouseX:QName = new QName(mx_internal,"_mouseX");
      
      public static const DEFAULT_MAX_HEIGHT:Number = 10000;
      
      public static const DEFAULT_MEASURED_HEIGHT:Number = 22;
      
      private static var _embeddedFontRegistry:mx.core.IEmbeddedFontRegistry;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const DEFAULT_MEASURED_MIN_WIDTH:Number = 40;
       
      
      private var cachedEmbeddedFont:mx.core.EmbeddedFont = null;
      
      private var errorStringChanged:Boolean = false;
      
      mx_internal var overlay:mx.core.UIComponent;
      
      mx_internal var automaticRadioButtonGroups:Object;
      
      private var _currentState:String;
      
      private var _isPopUp:Boolean;
      
      private var _repeaters:Array;
      
      private var _systemManager:ISystemManager;
      
      private var _measuredWidth:Number = 0;
      
      private var methodQueue:Array;
      
      mx_internal var _width:Number;
      
      private var _tweeningProperties:Array;
      
      private var _validationSubField:String;
      
      private var _endingEffectInstances:Array;
      
      mx_internal var saveBorderColor:Boolean = true;
      
      mx_internal var overlayColor:uint;
      
      mx_internal var overlayReferenceCount:int = 0;
      
      private var hasFontContextBeenSaved:Boolean = false;
      
      private var _repeaterIndices:Array;
      
      private var oldExplicitWidth:Number;
      
      mx_internal var _descriptor:mx.core.UIComponentDescriptor;
      
      private var _initialized:Boolean = false;
      
      private var _focusEnabled:Boolean = true;
      
      private var cacheAsBitmapCount:int = 0;
      
      private var errorArray:Array;
      
      private var requestedCurrentState:String;
      
      private var listeningForRender:Boolean = false;
      
      mx_internal var invalidateDisplayListFlag:Boolean = false;
      
      private var oldScaleX:Number = 1;
      
      private var oldScaleY:Number = 1;
      
      mx_internal var _explicitMaxHeight:Number;
      
      mx_internal var invalidatePropertiesFlag:Boolean = false;
      
      private var hasFocusRect:Boolean = false;
      
      mx_internal var invalidateSizeFlag:Boolean = false;
      
      private var _scaleX:Number = 1;
      
      private var _scaleY:Number = 1;
      
      private var _styleDeclaration:CSSStyleDeclaration;
      
      private var _resourceManager:IResourceManager;
      
      mx_internal var _affectedProperties:Object;
      
      mx_internal var _documentDescriptor:mx.core.UIComponentDescriptor;
      
      private var _processedDescriptors:Boolean = false;
      
      mx_internal var origBorderColor:Number;
      
      private var _focusManager:IFocusManager;
      
      private var _cachePolicy:String = "auto";
      
      private var _measuredHeight:Number = 0;
      
      private var _id:String;
      
      private var _owner:DisplayObjectContainer;
      
      public var transitions:Array;
      
      mx_internal var _parent:DisplayObjectContainer;
      
      private var _measuredMinWidth:Number = 0;
      
      private var oldMinWidth:Number;
      
      private var _explicitWidth:Number;
      
      private var _enabled:Boolean = false;
      
      public var states:Array;
      
      private var _mouseFocusEnabled:Boolean = true;
      
      private var oldHeight:Number = 0;
      
      private var _currentStateChanged:Boolean;
      
      private var cachedTextFormat:mx.core.UITextFormat;
      
      mx_internal var _height:Number;
      
      private var _automationDelegate:IAutomationObject;
      
      private var _percentWidth:Number;
      
      private var _automationName:String = null;
      
      private var _isEffectStarted:Boolean = false;
      
      private var _styleName:Object;
      
      private var lastUnscaledWidth:Number;
      
      mx_internal var _document:Object;
      
      mx_internal var _errorString:String = "";
      
      private var oldExplicitHeight:Number;
      
      private var _nestLevel:int = 0;
      
      private var _systemManagerDirty:Boolean = false;
      
      private var _explicitHeight:Number;
      
      mx_internal var _toolTip:String;
      
      private var _filters:Array;
      
      private var _focusPane:Sprite;
      
      private var playStateTransition:Boolean = true;
      
      private var _nonInheritingStyles:Object;
      
      private var _showInAutomationHierarchy:Boolean = true;
      
      private var _moduleFactory:mx.core.IFlexModuleFactory;
      
      private var preventDrawFocus:Boolean = false;
      
      private var oldX:Number = 0;
      
      private var oldY:Number = 0;
      
      private var _instanceIndices:Array;
      
      private var errorObjectArray:Array;
      
      private var _visible:Boolean = true;
      
      private var _inheritingStyles:Object;
      
      private var _includeInLayout:Boolean = true;
      
      mx_internal var _effectsStarted:Array;
      
      mx_internal var _explicitMinWidth:Number;
      
      private var lastUnscaledHeight:Number;
      
      mx_internal var _explicitMaxWidth:Number;
      
      private var _measuredMinHeight:Number = 0;
      
      private var _uid:String;
      
      private var _currentTransitionEffect:IEffect;
      
      private var _updateCompletePendingFlag:Boolean = false;
      
      private var oldMinHeight:Number;
      
      private var _flexContextMenu:IFlexContextMenu;
      
      mx_internal var _explicitMinHeight:Number;
      
      private var _percentHeight:Number;
      
      private var oldEmbeddedFontContext:mx.core.IFlexModuleFactory = null;
      
      private var oldWidth:Number = 0;
      
      public function UIComponent()
      {
         methodQueue = [];
         _resourceManager = ResourceManager.getInstance();
         _inheritingStyles = mx.core.UIComponent.mx_internal::STYLE_UNINITIALIZED;
         _nonInheritingStyles = mx.core.UIComponent.mx_internal::STYLE_UNINITIALIZED;
         states = [];
         transitions = [];
         mx_internal::_effectsStarted = [];
         mx_internal::_affectedProperties = {};
         _endingEffectInstances = [];
         super();
         focusRect = false;
         tabEnabled = this is IFocusManagerComponent;
         tabChildren = false;
         enabled = true;
         mx_internal::$visible = false;
         addEventListener(Event.ADDED,addedHandler);
         addEventListener(Event.REMOVED,removedHandler);
         if(this is IFocusManagerComponent)
         {
            addEventListener(FocusEvent.FOCUS_IN,focusInHandler);
            addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);
            addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
            addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
         }
         resourcesChanged();
         resourceManager.addEventListener(Event.CHANGE,resourceManager_changeHandler,false,0,true);
         mx_internal::_width = super.width;
         mx_internal::_height = super.height;
      }
      
      private static function get embeddedFontRegistry() : mx.core.IEmbeddedFontRegistry
      {
         if(!_embeddedFontRegistry)
         {
            _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         return _embeddedFontRegistry;
      }
      
      public static function resumeBackgroundProcessing() : void
      {
         var _loc1_:ISystemManager = null;
         if(false)
         {
            --UIComponentGlobals.mx_internal::callLaterSuspendCount;
            if(false)
            {
               _loc1_ = SystemManagerGlobals.topLevelSystemManagers[0];
               if(Boolean(_loc1_) && Boolean(_loc1_.stage))
               {
                  _loc1_.stage.invalidate();
               }
            }
         }
      }
      
      public static function suspendBackgroundProcessing() : void
      {
         ++UIComponentGlobals.mx_internal::callLaterSuspendCount;
      }
      
      override public function get filters() : Array
      {
         return !!_filters ? _filters : super.filters;
      }
      
      [Bindable("toolTipChanged")]
      public function get toolTip() : String
      {
         return mx_internal::_toolTip;
      }
      
      private function transition_effectEndHandler(param1:EffectEvent) : void
      {
         _currentTransitionEffect = null;
      }
      
      public function get nestLevel() : int
      {
         return _nestLevel;
      }
      
      protected function adjustFocusRect(param1:DisplayObject = null) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Point = null;
         var _loc7_:Number = NaN;
         if(!param1)
         {
            param1 = {};
         }
         if(isNaN(param1.width) || isNaN(param1.height))
         {
            return;
         }
         var _loc2_:IFocusManager = focusManager;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IFlexDisplayObject = IFlexDisplayObject(mx_internal::getFocusObject());
         if(_loc3_)
         {
            if(Boolean(errorString) && errorString != "")
            {
               _loc4_ = getStyle("errorColor");
            }
            else
            {
               _loc4_ = getStyle("themeColor");
            }
            _loc5_ = getStyle("focusThickness");
            if(_loc3_ is IStyleClient)
            {
               IStyleClient(_loc3_).setStyle("focusColor",_loc4_);
            }
            _loc3_.setActualSize(param1.width + 2 * _loc5_,param1.height + 2 * _loc5_);
            if(rotation)
            {
               _loc7_ = rotation * 0 / 180;
               _loc6_ = new Point(param1.x - _loc5_ * (Math.cos(_loc7_) - Math.sin(_loc7_)),param1.y - _loc5_ * (Math.cos(_loc7_) + Math.sin(_loc7_)));
               DisplayObject(_loc3_).rotation = rotation;
            }
            else
            {
               _loc6_ = new Point(param1.x - _loc5_,param1.y - _loc5_);
            }
            if(param1.parent == this)
            {
               _loc6_.x += x;
               _loc6_.y += y;
            }
            _loc6_ = parent.localToGlobal(_loc6_);
            _loc6_ = parent.globalToLocal(_loc6_);
            _loc3_.move(_loc6_.x,_loc6_.y);
            if(_loc3_ is IInvalidating)
            {
               IInvalidating(_loc3_).validateNow();
            }
            else if(_loc3_ is IProgrammaticSkin)
            {
               IProgrammaticSkin(_loc3_).validateNow();
            }
         }
      }
      
      mx_internal function setUnscaledWidth(param1:Number) : void
      {
         var _loc2_:Number = param1 * Math.abs(oldScaleX);
         if(_explicitWidth == _loc2_)
         {
            return;
         }
         if(!isNaN(_loc2_))
         {
            _percentWidth = NaN;
         }
         _explicitWidth = _loc2_;
         invalidateSize();
         var _loc3_:IInvalidating = parent as IInvalidating;
         if(Boolean(_loc3_) && includeInLayout)
         {
            _loc3_.invalidateSize();
            _loc3_.invalidateDisplayList();
         }
      }
      
      private function isOnDisplayList() : Boolean
      {
         var p:DisplayObjectContainer = null;
         try
         {
            p = !!mx_internal::_parent ? mx_internal::_parent : super.parent;
         }
         catch(e:SecurityError)
         {
            return true;
         }
         return !!p ? true : false;
      }
      
      public function set nestLevel(param1:int) : void
      {
         var _loc2_:IChildList = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ILayoutManagerClient = null;
         var _loc6_:IUITextField = null;
         if(param1 > 1 && _nestLevel != param1)
         {
            _nestLevel = param1;
            mx_internal::updateCallbacks();
            _loc2_ = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
            _loc3_ = int(_loc2_.numChildren);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(_loc5_ = _loc2_.getChildAt(_loc4_) as ILayoutManagerClient)
               {
                  _loc5_.nestLevel = param1 + 1;
               }
               else if(_loc6_ = _loc2_.getChildAt(_loc4_) as IUITextField)
               {
                  _loc6_.nestLevel = param1 + 1;
               }
               _loc4_++;
            }
         }
      }
      
      public function getExplicitOrMeasuredHeight() : Number
      {
         return !isNaN(explicitHeight) ? explicitHeight : measuredHeight;
      }
      
      private function callLaterDispatcher(param1:Event) : void
      {
         var callLaterErrorEvent:DynamicEvent = null;
         var event:Event = param1;
         ++UIComponentGlobals.mx_internal::callLaterDispatcherCount;
         if(true)
         {
            callLaterDispatcher2(event);
         }
         else
         {
            try
            {
               callLaterDispatcher2(event);
            }
            catch(e:Error)
            {
               callLaterErrorEvent = new DynamicEvent("callLaterError");
               callLaterErrorEvent.error = e;
               systemManager.dispatchEvent(callLaterErrorEvent);
            }
         }
         --UIComponentGlobals.mx_internal::callLaterDispatcherCount;
      }
      
      public function getStyle(param1:String) : *
      {
         return !!StyleManager.mx_internal::inheritingStyles[param1] ? _inheritingStyles[param1] : _nonInheritingStyles[param1];
      }
      
      final mx_internal function get $width() : Number
      {
         return super.width;
      }
      
      public function get className() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         var _loc2_:int = _loc1_.indexOf("::");
         if(_loc2_ != -1)
         {
            _loc1_ = _loc1_.substr(_loc2_ + 2);
         }
         return _loc1_;
      }
      
      public function verticalGradientMatrix(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         UIComponentGlobals.mx_internal::tempMatrix.createGradientBox(param3,param4,0,param1,param2);
         return UIComponentGlobals.mx_internal::tempMatrix;
      }
      
      public function setCurrentState(param1:String, param2:Boolean = true) : void
      {
         if(param1 != currentState && !(isBaseState(param1) && isBaseState(currentState)))
         {
            requestedCurrentState = param1;
            playStateTransition = param2;
            if(initialized)
            {
               commitCurrentState();
            }
            else
            {
               _currentStateChanged = true;
               addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
            }
         }
      }
      
      private function getBaseStates(param1:State) : Array
      {
         var _loc2_:* = [];
         while(Boolean(param1) && Boolean(param1.basedOn))
         {
            _loc2_.push(param1.basedOn);
            param1 = getState(param1.basedOn);
         }
         return _loc2_;
      }
      
      public function set minHeight(param1:Number) : void
      {
         if(explicitMinHeight == param1)
         {
            return;
         }
         explicitMinHeight = param1;
      }
      
      protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == this;
      }
      
      [Bindable("errorStringChanged")]
      public function get errorString() : String
      {
         return mx_internal::_errorString;
      }
      
      mx_internal function setUnscaledHeight(param1:Number) : void
      {
         var _loc2_:Number = param1 * Math.abs(oldScaleY);
         if(_explicitHeight == _loc2_)
         {
            return;
         }
         if(!isNaN(_loc2_))
         {
            _percentHeight = NaN;
         }
         _explicitHeight = _loc2_;
         invalidateSize();
         var _loc3_:IInvalidating = parent as IInvalidating;
         if(Boolean(_loc3_) && includeInLayout)
         {
            _loc3_.invalidateSize();
            _loc3_.invalidateDisplayList();
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
      
      final mx_internal function set $width(param1:Number) : void
      {
         super.width = param1;
      }
      
      public function getVisibleRect(param1:DisplayObject = null) : Rectangle
      {
         if(!param1)
         {
            param1 = DisplayObject(systemManager);
         }
         var _loc2_:DisplayObject = !!mx_internal::$parent ? mx_internal::$parent : parent;
         if(!_loc2_)
         {
            return new Rectangle();
         }
         var _loc3_:Point = new Point(x,y);
         _loc3_ = _loc2_.localToGlobal(_loc3_);
         var _loc4_:Rectangle = new Rectangle(_loc3_.x,_loc3_.y,width,height);
         var _loc5_:* = {};
         var _loc6_:Rectangle = new Rectangle();
         do
         {
            if(_loc5_ is mx.core.UIComponent)
            {
               if(UIComponent(_loc5_).mx_internal::$parent)
               {
                  _loc5_ = UIComponent(_loc5_).mx_internal::$parent;
               }
               else
               {
                  _loc5_ = UIComponent(_loc5_).parent;
               }
            }
            else
            {
               _loc5_ = _loc5_.parent;
            }
            if(Boolean(_loc5_) && Boolean(_loc5_.scrollRect))
            {
               _loc6_ = _loc5_.scrollRect.clone();
               _loc3_ = _loc5_.localToGlobal(_loc6_.topLeft);
               _loc6_.x = _loc3_.x;
               _loc6_.y = _loc3_.y;
               _loc4_ = _loc4_.intersection(_loc6_);
            }
         }
         while(Boolean(_loc5_) && _loc5_ != param1);
         
         return _loc4_;
      }
      
      public function invalidateDisplayList() : void
      {
         if(!mx_internal::invalidateDisplayListFlag)
         {
            mx_internal::invalidateDisplayListFlag = true;
            if(isOnDisplayList() && false)
            {
               UIComponentGlobals.mx_internal::layoutManager.invalidateDisplayList(this);
            }
         }
      }
      
      mx_internal function initThemeColor() : Boolean
      {
         var _loc2_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:CSSStyleDeclaration = null;
         var _loc1_:Object = _styleName;
         if(_styleDeclaration)
         {
            _loc2_ = _styleDeclaration.getStyle("themeColor");
            _loc3_ = _styleDeclaration.getStyle("rollOverColor");
            _loc4_ = _styleDeclaration.getStyle("selectionColor");
         }
         if((_loc2_ === null || !StyleManager.isValidStyleValue(_loc2_)) && (_loc1_ && !(_loc1_ is ISimpleStyleClient)))
         {
            if(_loc5_ = _loc1_ is String ? StyleManager.getStyleDeclaration("." + _loc1_) : _loc1_)
            {
               _loc2_ = _loc5_.getStyle("themeColor");
               _loc3_ = Number(_loc5_.getStyle("rollOverColor"));
               _loc4_ = Number(_loc5_.getStyle("selectionColor"));
            }
         }
         if(_loc2_ === null || !StyleManager.isValidStyleValue(_loc2_))
         {
            _loc6_ = getClassStyleDeclarations();
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               if(_loc8_ = _loc6_[_loc7_])
               {
                  _loc2_ = _loc8_.getStyle("themeColor");
                  _loc3_ = _loc8_.getStyle("rollOverColor");
                  _loc4_ = _loc8_.getStyle("selectionColor");
               }
               if(_loc2_ !== null && StyleManager.isValidStyleValue(_loc2_))
               {
                  break;
               }
               _loc7_++;
            }
         }
         if(_loc2_ !== null && StyleManager.isValidStyleValue(_loc2_) && isNaN(_loc3_) && isNaN(_loc4_))
         {
            mx_internal::setThemeColor(_loc2_);
            return true;
         }
         return _loc2_ !== null && StyleManager.isValidStyleValue(_loc2_) && !isNaN(_loc3_) && !isNaN(_loc4_);
      }
      
      [Bindable("scaleXChanged")]
      override public function get scaleX() : Number
      {
         return _scaleX;
      }
      
      public function get uid() : String
      {
         if(!_uid)
         {
            _uid = toString();
         }
         return _uid;
      }
      
      override public function get mouseX() : Number
      {
         if(!root || root is Stage || root[fakeMouseX] === undefined)
         {
            return super.mouseX;
         }
         return globalToLocal(new Point(root[fakeMouseX],0)).x;
      }
      
      override public function stopDrag() : void
      {
         super.stopDrag();
         invalidateProperties();
         dispatchEvent(new Event("xChanged"));
         dispatchEvent(new Event("yChanged"));
      }
      
      public function get focusPane() : Sprite
      {
         return _focusPane;
      }
      
      public function set tweeningProperties(param1:Array) : void
      {
         _tweeningProperties = param1;
      }
      
      public function horizontalGradientMatrix(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         UIComponentGlobals.mx_internal::tempMatrix.createGradientBox(param3,param4,0,param1,param2);
         return UIComponentGlobals.mx_internal::tempMatrix;
      }
      
      public function get isDocument() : Boolean
      {
         return document == this;
      }
      
      public function set validationSubField(param1:String) : void
      {
         _validationSubField = param1;
      }
      
      [Bindable("scaleYChanged")]
      override public function get scaleY() : Number
      {
         return _scaleY;
      }
      
      protected function keyDownHandler(param1:KeyboardEvent) : void
      {
      }
      
      protected function createInFontContext(param1:Class) : Object
      {
         hasFontContextBeenSaved = true;
         var _loc2_:String = StringUtil.trimArrayElements(getStyle("fontFamily"),",");
         var _loc3_:String = getStyle("fontWeight");
         var _loc4_:String = getStyle("fontStyle");
         var _loc5_:* = _loc3_ == "bold";
         var _loc6_:* = _loc4_ == "italic";
         oldEmbeddedFontContext = mx_internal::getFontContext(_loc2_,_loc5_,_loc6_);
         var _loc7_:Object;
         if((_loc7_ = createInModuleContext(!!oldEmbeddedFontContext ? oldEmbeddedFontContext : moduleFactory,getQualifiedClassName(param1))) == null)
         {
            _loc7_ = new param1();
         }
         return _loc7_;
      }
      
      public function get screen() : Rectangle
      {
         var _loc1_:ISystemManager = systemManager;
         return !!_loc1_ ? _loc1_.screen : null;
      }
      
      protected function focusInHandler(param1:FocusEvent) : void
      {
         var _loc2_:IFocusManager = null;
         if(isOurFocus(DisplayObject(param1.target)))
         {
            _loc2_ = focusManager;
            if(Boolean(_loc2_) && Boolean(_loc2_.showFocusIndicator))
            {
               drawFocus(true);
            }
            ContainerGlobals.checkFocus(param1.relatedObject,this);
         }
      }
      
      public function hasFontContextChanged() : Boolean
      {
         if(!hasFontContextBeenSaved)
         {
            return false;
         }
         var _loc1_:String = StringUtil.trimArrayElements(getStyle("fontFamily"),",");
         var _loc2_:String = getStyle("fontWeight");
         var _loc3_:String = getStyle("fontStyle");
         var _loc4_:* = _loc2_ == "bold";
         var _loc5_:* = _loc3_ == "italic";
         var _loc6_:mx.core.EmbeddedFont = mx_internal::getEmbeddedFont(_loc1_,_loc4_,_loc5_);
         var _loc7_:mx.core.IFlexModuleFactory;
         return (_loc7_ = embeddedFontRegistry.getAssociatedModuleFactory(_loc6_,moduleFactory)) != oldEmbeddedFontContext;
      }
      
      [Bindable("explicitHeightChanged")]
      public function get explicitHeight() : Number
      {
         return _explicitHeight;
      }
      
      [Bindable("xChanged")]
      override public function get x() : Number
      {
         return super.x;
      }
      
      [Bindable("yChanged")]
      override public function get y() : Number
      {
         return super.y;
      }
      
      [Bindable("show")]
      [Bindable("hide")]
      override public function get visible() : Boolean
      {
         return _visible;
      }
      
      mx_internal function addOverlay(param1:uint, param2:RoundedRectangle = null) : void
      {
         if(!mx_internal::overlay)
         {
            mx_internal::overlayColor = param1;
            mx_internal::overlay = new mx.core.UIComponent();
            mx_internal::overlay.name = "overlay";
            mx_internal::overlay.mx_internal::$visible = true;
            mx_internal::fillOverlay(mx_internal::overlay,param1,param2);
            attachOverlay();
            if(!param2)
            {
               addEventListener(ResizeEvent.RESIZE,overlay_resizeHandler);
            }
            mx_internal::overlay.x = 0;
            mx_internal::overlay.y = 0;
            invalidateDisplayList();
            mx_internal::overlayReferenceCount = 1;
         }
         else
         {
            ++mx_internal::overlayReferenceCount;
         }
         dispatchEvent(new ChildExistenceChangedEvent(ChildExistenceChangedEvent.OVERLAY_CREATED,true,false,mx_internal::overlay));
      }
      
      [Bindable("resize")]
      public function get percentWidth() : Number
      {
         return _percentWidth;
      }
      
      public function set explicitMinHeight(param1:Number) : void
      {
         if(mx_internal::_explicitMinHeight == param1)
         {
            return;
         }
         mx_internal::_explicitMinHeight = param1;
         invalidateSize();
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitMinHeightChanged"));
      }
      
      public function set automationName(param1:String) : void
      {
         _automationName = param1;
      }
      
      public function get mouseFocusEnabled() : Boolean
      {
         return _mouseFocusEnabled;
      }
      
      mx_internal function getEmbeddedFont(param1:String, param2:Boolean, param3:Boolean) : mx.core.EmbeddedFont
      {
         if(cachedEmbeddedFont)
         {
            if(cachedEmbeddedFont.fontName == param1 && cachedEmbeddedFont.fontStyle == EmbeddedFontRegistry.getFontStyle(param2,param3))
            {
               return cachedEmbeddedFont;
            }
         }
         cachedEmbeddedFont = new mx.core.EmbeddedFont(param1,param2,param3);
         return cachedEmbeddedFont;
      }
      
      public function stylesInitialized() : void
      {
      }
      
      public function set errorString(param1:String) : void
      {
         var _loc2_:String = mx_internal::_errorString;
         mx_internal::_errorString = param1;
         ToolTipManager.mx_internal::registerErrorString(this,_loc2_,param1);
         errorStringChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("errorStringChanged"));
      }
      
      public function getExplicitOrMeasuredWidth() : Number
      {
         return !isNaN(explicitWidth) ? explicitWidth : measuredWidth;
      }
      
      final mx_internal function set $height(param1:Number) : void
      {
         super.height = param1;
      }
      
      protected function keyUpHandler(param1:KeyboardEvent) : void
      {
      }
      
      final mx_internal function $removeChild(param1:DisplayObject) : DisplayObject
      {
         return super.removeChild(param1);
      }
      
      override public function set scaleX(param1:Number) : void
      {
         if(_scaleX == param1)
         {
            return;
         }
         _scaleX = param1;
         invalidateProperties();
         invalidateSize();
         dispatchEvent(new Event("scaleXChanged"));
      }
      
      override public function set scaleY(param1:Number) : void
      {
         if(_scaleY == param1)
         {
            return;
         }
         _scaleY = param1;
         invalidateProperties();
         invalidateSize();
         dispatchEvent(new Event("scaleYChanged"));
      }
      
      public function set uid(param1:String) : void
      {
         this._uid = param1;
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
      
      mx_internal function get isEffectStarted() : Boolean
      {
         return _isEffectStarted;
      }
      
      override public function get parent() : DisplayObjectContainer
      {
         try
         {
            return !!mx_internal::_parent ? mx_internal::_parent : super.parent;
         }
         catch(e:SecurityError)
         {
            return null;
         }
      }
      
      override public function get mouseY() : Number
      {
         if(!root || root is Stage || root[fakeMouseY] === undefined)
         {
            return super.mouseY;
         }
         return globalToLocal(new Point(0,root[fakeMouseY])).y;
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         if(mx_internal::_width != param1)
         {
            mx_internal::_width = param1;
            dispatchEvent(new Event("widthChanged"));
            _loc3_ = true;
         }
         if(mx_internal::_height != param2)
         {
            mx_internal::_height = param2;
            dispatchEvent(new Event("heightChanged"));
            _loc3_ = true;
         }
         if(_loc3_)
         {
            invalidateDisplayList();
            dispatchResizeEvent();
         }
      }
      
      private function focusObj_resizeHandler(param1:ResizeEvent) : void
      {
         adjustFocusRect();
      }
      
      mx_internal function adjustSizesForScaleChanges() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = scaleX;
         var _loc2_:Number = scaleY;
         if(_loc1_ != oldScaleX)
         {
            _loc3_ = Math.abs(_loc1_ / oldScaleX);
            if(explicitMinWidth)
            {
               explicitMinWidth *= _loc3_;
            }
            if(!isNaN(explicitWidth))
            {
               explicitWidth *= _loc3_;
            }
            if(explicitMaxWidth)
            {
               explicitMaxWidth *= _loc3_;
            }
            oldScaleX = _loc1_;
         }
         if(_loc2_ != oldScaleY)
         {
            _loc3_ = Math.abs(_loc2_ / oldScaleY);
            if(explicitMinHeight)
            {
               explicitMinHeight *= _loc3_;
            }
            if(explicitHeight)
            {
               explicitHeight *= _loc3_;
            }
            if(explicitMaxHeight)
            {
               explicitMaxHeight *= _loc3_;
            }
            oldScaleY = _loc2_;
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
            _focusPane.mask = null;
            _focusPane = null;
         }
      }
      
      public function determineTextFormatFromStyles() : mx.core.UITextFormat
      {
         var _loc2_:String = null;
         var _loc1_:mx.core.UITextFormat = cachedTextFormat;
         if(!_loc1_)
         {
            _loc2_ = StringUtil.trimArrayElements(_inheritingStyles.fontFamily,",");
            _loc1_ = new mx.core.UITextFormat(mx_internal::getNonNullSystemManager(),_loc2_);
            _loc1_.moduleFactory = moduleFactory;
            _loc1_.align = _inheritingStyles.textAlign;
            _loc1_.bold = false;
            _loc1_.color = enabled ? _inheritingStyles.color : _inheritingStyles.disabledColor;
            _loc1_.font = _loc2_;
            _loc1_.indent = _inheritingStyles.textIndent;
            _loc1_.italic = false;
            _loc1_.kerning = _inheritingStyles.kerning;
            _loc1_.leading = _nonInheritingStyles.leading;
            _loc1_.leftMargin = _nonInheritingStyles.paddingLeft;
            _loc1_.letterSpacing = _inheritingStyles.letterSpacing;
            _loc1_.rightMargin = _nonInheritingStyles.paddingRight;
            _loc1_.size = _inheritingStyles.fontSize;
            _loc1_.underline = false;
            _loc1_.antiAliasType = _inheritingStyles.fontAntiAliasType;
            _loc1_.gridFitType = _inheritingStyles.fontGridFitType;
            _loc1_.sharpness = _inheritingStyles.fontSharpness;
            _loc1_.thickness = _inheritingStyles.fontThickness;
            cachedTextFormat = _loc1_;
         }
         return _loc1_;
      }
      
      public function validationResultHandler(param1:ValidationResultEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:ValidationResult = null;
         var _loc5_:int = 0;
         if(errorObjectArray === null)
         {
            errorObjectArray = new Array();
            errorArray = new Array();
         }
         var _loc2_:int = errorObjectArray.indexOf(param1.target);
         if(param1.type == ValidationResultEvent.VALID)
         {
            if(_loc2_ != -1)
            {
               errorObjectArray.splice(_loc2_,1);
               errorArray.splice(_loc2_,1);
               errorString = errorArray.join("\n");
               if(false)
               {
                  dispatchEvent(new FlexEvent(FlexEvent.VALID));
               }
            }
         }
         else
         {
            if(validationSubField != null && validationSubField != "" && Boolean(param1.results))
            {
               _loc5_ = 0;
               while(_loc5_ < param1.results.length)
               {
                  if((_loc4_ = param1.results[_loc5_]).subField == validationSubField)
                  {
                     if(_loc4_.isError)
                     {
                        _loc3_ = _loc4_.errorMessage;
                     }
                     else if(_loc2_ != -1)
                     {
                        errorObjectArray.splice(_loc2_,1);
                        errorArray.splice(_loc2_,1);
                        errorString = errorArray.join("\n");
                        if(false)
                        {
                           dispatchEvent(new FlexEvent(FlexEvent.VALID));
                        }
                     }
                     break;
                  }
                  _loc5_++;
               }
            }
            else if(Boolean(param1.results) && param1.results.length > 0)
            {
               _loc3_ = String(param1.results[0].errorMessage);
            }
            if(_loc3_ && _loc2_ != -1 && errorArray[_loc2_] != _loc3_)
            {
               errorArray[_loc2_] = _loc3_;
               errorString = errorArray.join("\n");
               dispatchEvent(new FlexEvent(FlexEvent.INVALID));
            }
            else if(Boolean(_loc3_) && _loc2_ == -1)
            {
               errorObjectArray.push(param1.target);
               errorArray.push(_loc3_);
               errorString = errorArray.join("\n");
               dispatchEvent(new FlexEvent(FlexEvent.INVALID));
            }
         }
      }
      
      public function invalidateProperties() : void
      {
         if(!mx_internal::invalidatePropertiesFlag)
         {
            mx_internal::invalidatePropertiesFlag = true;
            if(Boolean(parent) && false)
            {
               UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
            }
         }
      }
      
      public function get inheritingStyles() : Object
      {
         return _inheritingStyles;
      }
      
      private function focusObj_scrollHandler(param1:Event) : void
      {
         adjustFocusRect();
      }
      
      final mx_internal function get $x() : Number
      {
         return super.x;
      }
      
      final mx_internal function get $y() : Number
      {
         return super.y;
      }
      
      public function setConstraintValue(param1:String, param2:*) : void
      {
         setStyle(param1,param2);
      }
      
      protected function resourcesChanged() : void
      {
      }
      
      public function registerEffects(param1:Array) : void
      {
         var _loc4_:String = null;
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = EffectManager.mx_internal::getEventForEffectTrigger(param1[_loc3_])) != null && _loc4_ != "")
            {
               addEventListener(_loc4_,EffectManager.mx_internal::eventHandler,false,EventPriority.EFFECT);
            }
            _loc3_++;
         }
      }
      
      [Bindable("explicitMinWidthChanged")]
      public function get explicitMinWidth() : Number
      {
         return mx_internal::_explicitMinWidth;
      }
      
      private function filterChangeHandler(param1:Event) : void
      {
         super.filters = _filters;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         setVisible(param1);
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         if(_explicitHeight == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _percentHeight = NaN;
         }
         _explicitHeight = param1;
         invalidateSize();
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(Boolean(_loc2_) && includeInLayout)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitHeightChanged"));
      }
      
      override public function set x(param1:Number) : void
      {
         if(super.x == param1)
         {
            return;
         }
         super.x = param1;
         invalidateProperties();
         dispatchEvent(new Event("xChanged"));
      }
      
      public function set showInAutomationHierarchy(param1:Boolean) : void
      {
         _showInAutomationHierarchy = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         if(super.y == param1)
         {
            return;
         }
         super.y = param1;
         invalidateProperties();
         dispatchEvent(new Event("yChanged"));
      }
      
      private function resourceManager_changeHandler(param1:Event) : void
      {
         resourcesChanged();
      }
      
      public function set systemManager(param1:ISystemManager) : void
      {
         _systemManager = param1;
         _systemManagerDirty = false;
      }
      
      mx_internal function getFocusObject() : DisplayObject
      {
         var _loc1_:IFocusManager = focusManager;
         if(!_loc1_ || !_loc1_.focusPane)
         {
            return null;
         }
         return _loc1_.focusPane.numChildren == 0 ? null : _loc1_.focusPane.getChildAt(0);
      }
      
      public function set percentWidth(param1:Number) : void
      {
         if(_percentWidth == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _explicitWidth = NaN;
         }
         _percentWidth = param1;
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
      }
      
      public function get moduleFactory() : mx.core.IFlexModuleFactory
      {
         return _moduleFactory;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObjectContainer = param1.parent;
         if(Boolean(_loc2_) && !(_loc2_ is Loader))
         {
            _loc2_.removeChild(param1);
         }
         var _loc3_:int = Boolean(mx_internal::overlayReferenceCount) && param1 != mx_internal::overlay ? int(Math.max(0,super.numChildren - 1)) : super.numChildren;
         mx_internal::addingChild(param1);
         mx_internal::$addChildAt(param1,_loc3_);
         mx_internal::childAdded(param1);
         return param1;
      }
      
      public function get document() : Object
      {
         return mx_internal::_document;
      }
      
      public function set mouseFocusEnabled(param1:Boolean) : void
      {
         _mouseFocusEnabled = param1;
      }
      
      final mx_internal function $addChild(param1:DisplayObject) : DisplayObject
      {
         return super.addChild(param1);
      }
      
      mx_internal function setThemeColor(param1:Object) : void
      {
         var _loc2_:Number = NaN;
         if(_loc2_ is String)
         {
            _loc2_ = parseInt(String(param1));
         }
         else
         {
            _loc2_ = Number(param1);
         }
         if(isNaN(_loc2_))
         {
            _loc2_ = StyleManager.getColorName(param1);
         }
         var _loc3_:Number = ColorUtil.adjustBrightness2(_loc2_,50);
         var _loc4_:Number = ColorUtil.adjustBrightness2(_loc2_,70);
         setStyle("selectionColor",_loc3_);
         setStyle("rollOverColor",_loc4_);
      }
      
      [Bindable("explicitMaxWidthChanged")]
      public function get explicitMaxWidth() : Number
      {
         return mx_internal::_explicitMaxWidth;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      [Bindable("heightChanged")]
      override public function get height() : Number
      {
         return mx_internal::_height;
      }
      
      public function set minWidth(param1:Number) : void
      {
         if(explicitMinWidth == param1)
         {
            return;
         }
         explicitMinWidth = param1;
      }
      
      public function set currentState(param1:String) : void
      {
         setCurrentState(param1,true);
      }
      
      public function executeBindings(param1:Boolean = false) : void
      {
         var _loc2_:Object = Boolean(descriptor) && false ? descriptor.document : parentDocument;
         BindingManager.executeBindings(_loc2_,id,this);
      }
      
      public function replayAutomatableEvent(param1:Event) : Boolean
      {
         if(automationDelegate)
         {
            return automationDelegate.replayAutomatableEvent(param1);
         }
         return false;
      }
      
      mx_internal function getFontContext(param1:String, param2:Boolean, param3:Boolean) : mx.core.IFlexModuleFactory
      {
         return embeddedFontRegistry.getAssociatedModuleFactory(mx_internal::getEmbeddedFont(param1,param2,param3),moduleFactory);
      }
      
      public function get instanceIndex() : int
      {
         return !!_instanceIndices ? 0 : -1;
      }
      
      public function set measuredWidth(param1:Number) : void
      {
         _measuredWidth = param1;
      }
      
      public function effectFinished(param1:IEffectInstance) : void
      {
         _endingEffectInstances.push(param1);
         invalidateProperties();
         UIComponentGlobals.mx_internal::layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE,updateCompleteHandler,false,0,true);
      }
      
      public function getRepeaterItem(param1:int = -1) : Object
      {
         var _loc2_:Array = repeaters;
         if(_loc2_.length == 0)
         {
            return null;
         }
         if(param1 == -1)
         {
            param1 = int(_loc2_.length - 1);
         }
         return _loc2_[param1].getItemAt(repeaterIndices[param1]);
      }
      
      mx_internal function set isEffectStarted(param1:Boolean) : void
      {
         _isEffectStarted = param1;
      }
      
      mx_internal function fillOverlay(param1:mx.core.UIComponent, param2:uint, param3:RoundedRectangle = null) : void
      {
         if(!param3)
         {
            param3 = new RoundedRectangle(0,0,unscaledWidth,unscaledHeight,0);
         }
         var _loc4_:Graphics;
         (_loc4_ = param1.graphics).clear();
         _loc4_.beginFill(param2);
         _loc4_.drawRoundRect(param3.x,param3.y,param3.width,param3.height,param3.cornerRadius * 2,param3.cornerRadius * 2);
         _loc4_.endFill();
      }
      
      public function get instanceIndices() : Array
      {
         return !!_instanceIndices ? _instanceIndices.slice(0) : null;
      }
      
      mx_internal function childAdded(param1:DisplayObject) : void
      {
         if(param1 is mx.core.UIComponent)
         {
            if(!UIComponent(param1).initialized)
            {
               UIComponent(param1).initialize();
            }
         }
         else if(param1 is IUIComponent)
         {
            IUIComponent(param1).initialize();
         }
      }
      
      public function globalToContent(param1:Point) : Point
      {
         return globalToLocal(param1);
      }
      
      mx_internal function removingChild(param1:DisplayObject) : void
      {
      }
      
      mx_internal function getEffectsForProperty(param1:String) : Array
      {
         return mx_internal::_affectedProperties[param1] != undefined ? mx_internal::_affectedProperties[param1] : [];
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = getChildAt(param1);
         mx_internal::removingChild(_loc2_);
         mx_internal::$removeChild(_loc2_);
         mx_internal::childRemoved(_loc2_);
         return _loc2_;
      }
      
      protected function measure() : void
      {
         measuredMinWidth = 0;
         measuredMinHeight = 0;
         measuredWidth = 0;
         measuredHeight = 0;
      }
      
      public function set owner(param1:DisplayObjectContainer) : void
      {
         _owner = param1;
      }
      
      mx_internal function getNonNullSystemManager() : ISystemManager
      {
         var _loc1_:ISystemManager = systemManager;
         if(!_loc1_)
         {
            _loc1_ = ISystemManager(SystemManager.getSWFRoot(this));
         }
         if(!_loc1_)
         {
            return SystemManagerGlobals.topLevelSystemManagers[0];
         }
         return _loc1_;
      }
      
      protected function get unscaledWidth() : Number
      {
         return width / Math.abs(scaleX);
      }
      
      public function set processedDescriptors(param1:Boolean) : void
      {
         _processedDescriptors = param1;
         if(param1)
         {
            dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
         }
      }
      
      private function processEffectFinished(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:IEffectInstance = null;
         var _loc5_:IEffectInstance = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc2_:int = -1;
         while(_loc2_ >= 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               if((_loc4_ = param1[_loc3_]) == mx_internal::_effectsStarted[_loc2_])
               {
                  _loc5_ = mx_internal::_effectsStarted[_loc2_];
                  mx_internal::_effectsStarted.splice(_loc2_,1);
                  _loc6_ = _loc5_.effect.getAffectedProperties();
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_.length)
                  {
                     _loc8_ = String(_loc6_[_loc7_]);
                     if(mx_internal::_affectedProperties[_loc8_] != undefined)
                     {
                        _loc9_ = 0;
                        while(_loc9_ < mx_internal::_affectedProperties[_loc8_].length)
                        {
                           if(mx_internal::_affectedProperties[_loc8_][_loc9_] == _loc4_)
                           {
                              mx_internal::_affectedProperties[_loc8_].splice(_loc9_,1);
                              break;
                           }
                           _loc9_++;
                        }
                        if(mx_internal::_affectedProperties[_loc8_].length == 0)
                        {
                           delete mx_internal::_affectedProperties[_loc8_];
                        }
                     }
                     _loc7_++;
                  }
                  break;
               }
               _loc3_++;
            }
            _loc2_--;
         }
         mx_internal::isEffectStarted = false ? true : false;
         if(Boolean(_loc4_) && _loc4_.hideFocusRing)
         {
            preventDrawFocus = false;
         }
      }
      
      private function commitCurrentState() : void
      {
         var _loc3_:StateChangeEvent = null;
         var _loc1_:IEffect = playStateTransition ? getTransition(_currentState,requestedCurrentState) : null;
         var _loc2_:String = findCommonBaseState(_currentState,requestedCurrentState);
         var _loc4_:String = !!_currentState ? _currentState : "";
         var _loc5_:State = getState(requestedCurrentState);
         if(_currentTransitionEffect)
         {
            _currentTransitionEffect.end();
         }
         initializeState(requestedCurrentState);
         if(_loc1_)
         {
            _loc1_.captureStartValues();
         }
         _loc3_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING);
         _loc3_.oldState = _loc4_;
         _loc3_.newState = !!requestedCurrentState ? requestedCurrentState : "";
         dispatchEvent(_loc3_);
         if(isBaseState(_currentState))
         {
            dispatchEvent(new FlexEvent(FlexEvent.EXIT_STATE));
         }
         removeState(_currentState,_loc2_);
         _currentState = requestedCurrentState;
         if(isBaseState(currentState))
         {
            dispatchEvent(new FlexEvent(FlexEvent.ENTER_STATE));
         }
         else
         {
            applyState(_currentState,_loc2_);
         }
         _loc3_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE);
         _loc3_.oldState = _loc4_;
         _loc3_.newState = !!_currentState ? _currentState : "";
         dispatchEvent(_loc3_);
         if(_loc1_)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateNow();
            _currentTransitionEffect = _loc1_;
            _loc1_.addEventListener(EffectEvent.EFFECT_END,transition_effectEndHandler);
            _loc1_.play();
         }
      }
      
      [Bindable("includeInLayoutChanged")]
      public function get includeInLayout() : Boolean
      {
         return _includeInLayout;
      }
      
      private function dispatchResizeEvent() : void
      {
         var _loc1_:ResizeEvent = new ResizeEvent(ResizeEvent.RESIZE);
         _loc1_.oldWidth = oldWidth;
         _loc1_.oldHeight = oldHeight;
         dispatchEvent(_loc1_);
         oldWidth = width;
         oldHeight = height;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         if(explicitMaxWidth == param1)
         {
            return;
         }
         explicitMaxWidth = param1;
      }
      
      public function validateDisplayList() : void
      {
         var _loc1_:ISystemManager = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(mx_internal::invalidateDisplayListFlag)
         {
            _loc1_ = parent as ISystemManager;
            if(_loc1_)
            {
               if(_loc1_ is SystemManagerProxy || _loc1_ == systemManager.topLevelSystemManager && _loc1_.document != this)
               {
                  setActualSize(getExplicitOrMeasuredWidth(),getExplicitOrMeasuredHeight());
               }
            }
            _loc2_ = scaleX == 0 ? 0 : width / scaleX;
            _loc3_ = scaleY == 0 ? 0 : height / scaleY;
            if(Math.abs(_loc2_ - lastUnscaledWidth) < 0.00001)
            {
               _loc2_ = lastUnscaledWidth;
            }
            if(Math.abs(_loc3_ - lastUnscaledHeight) < 0.00001)
            {
               _loc3_ = lastUnscaledHeight;
            }
            updateDisplayList(_loc2_,_loc3_);
            lastUnscaledWidth = _loc2_;
            lastUnscaledHeight = _loc3_;
            mx_internal::invalidateDisplayListFlag = false;
         }
      }
      
      public function contentToGlobal(param1:Point) : Point
      {
         return localToGlobal(param1);
      }
      
      public function resolveAutomationIDPart(param1:Object) : Array
      {
         if(automationDelegate)
         {
            return automationDelegate.resolveAutomationIDPart(param1);
         }
         return [];
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
         _inheritingStyles = param1;
      }
      
      public function setFocus() : void
      {
         var _loc1_:ISystemManager = systemManager;
         if(Boolean(_loc1_) && (_loc1_.stage || _loc1_.useSWFBridge()))
         {
            if(false)
            {
               _loc1_.stage.focus = this;
               UIComponentGlobals.mx_internal::nextFocusObject = null;
            }
            else
            {
               UIComponentGlobals.mx_internal::nextFocusObject = this;
               _loc1_.addEventListener(FlexEvent.ENTER_FRAME,setFocusLater);
            }
         }
         else
         {
            UIComponentGlobals.mx_internal::nextFocusObject = this;
            callLater(setFocusLater);
         }
      }
      
      private function getTransition(param1:String, param2:String) : IEffect
      {
         var _loc6_:Transition = null;
         var _loc3_:IEffect = null;
         var _loc4_:int = 0;
         if(!transitions)
         {
            return null;
         }
         if(!param1)
         {
            param1 = "";
         }
         if(!param2)
         {
            param2 = "";
         }
         var _loc5_:int = 0;
         while(_loc5_ < transitions.length)
         {
            if((_loc6_ = transitions[_loc5_]).fromState == "*" && _loc6_.toState == "*" && _loc4_ < 1)
            {
               _loc3_ = _loc6_.effect;
               _loc4_ = 1;
            }
            else if(_loc6_.fromState == param1 && _loc6_.toState == "*" && _loc4_ < 2)
            {
               _loc3_ = _loc6_.effect;
               _loc4_ = 2;
            }
            else if(_loc6_.fromState == "*" && _loc6_.toState == param2 && _loc4_ < 3)
            {
               _loc3_ = _loc6_.effect;
               _loc4_ = 3;
            }
            else if(_loc6_.fromState == param1 && _loc6_.toState == param2 && _loc4_ < 4)
            {
               _loc3_ = _loc6_.effect;
               _loc4_ = 4;
               break;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function set initialized(param1:Boolean) : void
      {
         _initialized = param1;
         if(param1)
         {
            setVisible(_visible,true);
            dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
         }
      }
      
      final mx_internal function set $y(param1:Number) : void
      {
         super.y = param1;
      }
      
      public function owns(param1:DisplayObject) : Boolean
      {
         var child:DisplayObject = param1;
         var childList:IChildList = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
         if(childList.contains(child))
         {
            return true;
         }
         try
         {
            while(Boolean(child) && child != this)
            {
               if(child is IUIComponent)
               {
                  child = IUIComponent(child).owner;
               }
               else
               {
                  child = child.parent;
               }
            }
         }
         catch(e:SecurityError)
         {
            return false;
         }
         return child == this;
      }
      
      public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
         _visible = param1;
         if(!initialized)
         {
            return;
         }
         if(mx_internal::$visible == param1)
         {
            return;
         }
         mx_internal::$visible = param1;
         if(!param2)
         {
            dispatchEvent(new FlexEvent(param1 ? "null" : FlexEvent.HIDE));
         }
      }
      
      final mx_internal function $addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return super.addChildAt(param1,param2);
      }
      
      public function deleteReferenceOnParentDocument(param1:IFlexDisplayObject) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:PropertyChangeEvent = null;
         if(Boolean(id) && id != "")
         {
            _loc2_ = _instanceIndices;
            if(!_loc2_)
            {
               param1[id] = null;
            }
            else
            {
               _loc3_ = param1[id];
               if(!_loc3_)
               {
                  return;
               }
               (_loc4_ = []).push(_loc3_);
               _loc5_ = int(_loc2_.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_ - 1)
               {
                  if(!(_loc8_ = _loc3_[_loc2_[_loc6_]]))
                  {
                     return;
                  }
                  _loc3_ = _loc8_;
                  _loc4_.push(_loc3_);
                  _loc6_++;
               }
               _loc3_.splice(_loc2_[_loc5_ - 1],1);
               _loc7_ = int(_loc4_.length - 1);
               while(_loc7_ > 0)
               {
                  if(_loc4_[_loc7_].length == 0)
                  {
                     _loc4_[_loc7_ - 1].splice(_loc2_[_loc7_],1);
                  }
                  _loc7_--;
               }
               if(_loc4_.length > 0 && _loc4_[0].length == 0)
               {
                  param1[id] = null;
               }
               else
               {
                  _loc9_ = PropertyChangeEvent.createUpdateEvent(param1,id,param1[id],param1[id]);
                  param1.dispatchEvent(_loc9_);
               }
            }
         }
      }
      
      public function get nonInheritingStyles() : Object
      {
         return _nonInheritingStyles;
      }
      
      public function effectStarted(param1:IEffectInstance) : void
      {
         var _loc4_:String = null;
         mx_internal::_effectsStarted.push(param1);
         var _loc2_:Array = param1.effect.getAffectedProperties();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = String(_loc2_[_loc3_]);
            if(mx_internal::_affectedProperties[_loc4_] == undefined)
            {
               mx_internal::_affectedProperties[_loc4_] = [];
            }
            mx_internal::_affectedProperties[_loc4_].push(param1);
            _loc3_++;
         }
         mx_internal::isEffectStarted = true;
         if(param1.hideFocusRing)
         {
            preventDrawFocus = true;
            drawFocus(false);
         }
      }
      
      final mx_internal function set $x(param1:Number) : void
      {
         super.x = param1;
      }
      
      private function applyState(param1:String, param2:String) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc3_:State = getState(param1);
         if(param1 == param2)
         {
            return;
         }
         if(_loc3_)
         {
            if(_loc3_.basedOn != param2)
            {
               applyState(_loc3_.basedOn,param2);
            }
            _loc4_ = _loc3_.overrides;
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc4_[_loc5_].apply(this);
               _loc5_++;
            }
            _loc3_.mx_internal::dispatchEnterState();
         }
      }
      
      protected function commitProperties() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(_scaleX != oldScaleX)
         {
            _loc1_ = Math.abs(_scaleX / oldScaleX);
            if(!isNaN(explicitMinWidth))
            {
               explicitMinWidth *= _loc1_;
            }
            if(!isNaN(explicitWidth))
            {
               explicitWidth *= _loc1_;
            }
            if(!isNaN(explicitMaxWidth))
            {
               explicitMaxWidth *= _loc1_;
            }
            mx_internal::_width *= _loc1_;
            super.scaleX = oldScaleX = _scaleX;
         }
         if(_scaleY != oldScaleY)
         {
            _loc2_ = Math.abs(_scaleY / oldScaleY);
            if(!isNaN(explicitMinHeight))
            {
               explicitMinHeight *= _loc2_;
            }
            if(!isNaN(explicitHeight))
            {
               explicitHeight *= _loc2_;
            }
            if(!isNaN(explicitMaxHeight))
            {
               explicitMaxHeight *= _loc2_;
            }
            mx_internal::_height *= _loc2_;
            super.scaleY = oldScaleY = _scaleY;
         }
         if(x != oldX || y != oldY)
         {
            dispatchMoveEvent();
         }
         if(width != oldWidth || height != oldHeight)
         {
            dispatchResizeEvent();
         }
         if(errorStringChanged)
         {
            errorStringChanged = false;
            setBorderColorForErrorString();
         }
      }
      
      [Bindable("resize")]
      public function get percentHeight() : Number
      {
         return _percentHeight;
      }
      
      [Bindable("widthChanged")]
      override public function get width() : Number
      {
         return mx_internal::_width;
      }
      
      final mx_internal function get $parent() : DisplayObjectContainer
      {
         return super.parent;
      }
      
      public function set explicitMinWidth(param1:Number) : void
      {
         if(mx_internal::_explicitMinWidth == param1)
         {
            return;
         }
         mx_internal::_explicitMinWidth = param1;
         invalidateSize();
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitMinWidthChanged"));
      }
      
      public function get isPopUp() : Boolean
      {
         return _isPopUp;
      }
      
      private function measureSizes() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:Boolean = false;
         if(!mx_internal::invalidateSizeFlag)
         {
            return _loc1_;
         }
         if(isNaN(explicitWidth) || isNaN(explicitHeight))
         {
            _loc4_ = Math.abs(scaleX);
            _loc5_ = Math.abs(scaleY);
            if(_loc4_ != 1)
            {
               _measuredMinWidth /= _loc4_;
               _measuredWidth /= _loc4_;
            }
            if(_loc5_ != 1)
            {
               _measuredMinHeight /= _loc5_;
               _measuredHeight /= _loc5_;
            }
            measure();
            mx_internal::invalidateSizeFlag = false;
            if(!isNaN(explicitMinWidth) && measuredWidth < explicitMinWidth)
            {
               measuredWidth = explicitMinWidth;
            }
            if(!isNaN(explicitMaxWidth) && measuredWidth > explicitMaxWidth)
            {
               measuredWidth = explicitMaxWidth;
            }
            if(!isNaN(explicitMinHeight) && measuredHeight < explicitMinHeight)
            {
               measuredHeight = explicitMinHeight;
            }
            if(!isNaN(explicitMaxHeight) && measuredHeight > explicitMaxHeight)
            {
               measuredHeight = explicitMaxHeight;
            }
            if(_loc4_ != 1)
            {
               _measuredMinWidth *= _loc4_;
               _measuredWidth *= _loc4_;
            }
            if(_loc5_ != 1)
            {
               _measuredMinHeight *= _loc5_;
               _measuredHeight *= _loc5_;
            }
         }
         else
         {
            mx_internal::invalidateSizeFlag = false;
            _measuredMinWidth = 0;
            _measuredMinHeight = 0;
         }
         mx_internal::adjustSizesForScaleChanges();
         if(isNaN(oldMinWidth))
         {
            oldMinWidth = !isNaN(explicitMinWidth) ? explicitMinWidth : measuredMinWidth;
            oldMinHeight = !isNaN(explicitMinHeight) ? explicitMinHeight : measuredMinHeight;
            oldExplicitWidth = !isNaN(explicitWidth) ? explicitWidth : measuredWidth;
            oldExplicitHeight = !isNaN(explicitHeight) ? explicitHeight : measuredHeight;
            _loc1_ = true;
         }
         else
         {
            _loc3_ = !isNaN(explicitMinWidth) ? explicitMinWidth : measuredMinWidth;
            if(_loc3_ != oldMinWidth)
            {
               oldMinWidth = _loc3_;
               _loc1_ = true;
            }
            _loc3_ = !isNaN(explicitMinHeight) ? explicitMinHeight : measuredMinHeight;
            if(_loc3_ != oldMinHeight)
            {
               oldMinHeight = _loc3_;
               _loc1_ = true;
            }
            _loc3_ = !isNaN(explicitWidth) ? explicitWidth : measuredWidth;
            if(_loc3_ != oldExplicitWidth)
            {
               oldExplicitWidth = _loc3_;
               _loc1_ = true;
            }
            _loc3_ = !isNaN(explicitHeight) ? explicitHeight : measuredHeight;
            if(_loc3_ != oldExplicitHeight)
            {
               oldExplicitHeight = _loc3_;
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      public function get automationTabularData() : Object
      {
         if(automationDelegate)
         {
            return automationDelegate.automationTabularData;
         }
         return null;
      }
      
      public function validateNow() : void
      {
         UIComponentGlobals.mx_internal::layoutManager.validateClient(this);
      }
      
      public function finishPrint(param1:Object, param2:IFlexDisplayObject) : void
      {
      }
      
      public function get repeaters() : Array
      {
         return !!_repeaters ? _repeaters.slice(0) : [];
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
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:Class = null;
         if(!parent)
         {
            return;
         }
         var _loc2_:* = mx_internal::getFocusObject();
         var _loc3_:Sprite = !!focusManager ? focusManager.focusPane : null;
         if(param1 && !preventDrawFocus)
         {
            if((_loc4_ = _loc3_.parent) != parent)
            {
               if(_loc4_)
               {
                  if(_loc4_ is ISystemManager)
                  {
                     ISystemManager(_loc4_).focusPane = null;
                  }
                  else
                  {
                     IUIComponent(_loc4_).focusPane = null;
                  }
               }
               if(parent is ISystemManager)
               {
                  ISystemManager(parent).focusPane = _loc3_;
               }
               else
               {
                  IUIComponent(parent).focusPane = _loc3_;
               }
            }
            _loc5_ = getStyle("focusSkin");
            if(Boolean(_loc2_) && !(_loc2_ is _loc5_))
            {
               _loc3_.removeChild(_loc2_);
               _loc2_ = null;
            }
            if(!_loc2_)
            {
               _loc2_ = new _loc5_();
               _loc2_.name = "focus";
               _loc3_.addChild(_loc2_);
            }
            if(_loc2_ is ILayoutManagerClient)
            {
               ILayoutManagerClient(_loc2_).nestLevel = nestLevel;
            }
            if(_loc2_ is ISimpleStyleClient)
            {
               ISimpleStyleClient(_loc2_).styleName = this;
            }
            addEventListener(MoveEvent.MOVE,focusObj_moveHandler,true);
            addEventListener(MoveEvent.MOVE,focusObj_moveHandler);
            addEventListener(ResizeEvent.RESIZE,focusObj_resizeHandler,true);
            addEventListener(ResizeEvent.RESIZE,focusObj_resizeHandler);
            addEventListener(Event.REMOVED,focusObj_removedHandler,true);
            _loc2_.visible = true;
            hasFocusRect = true;
            adjustFocusRect();
         }
         else if(hasFocusRect)
         {
            hasFocusRect = false;
            if(_loc2_)
            {
               _loc2_.visible = false;
               if(_loc2_ is ISimpleStyleClient)
               {
                  ISimpleStyleClient(_loc2_).styleName = null;
               }
            }
            removeEventListener(MoveEvent.MOVE,focusObj_moveHandler);
            removeEventListener(MoveEvent.MOVE,focusObj_moveHandler,true);
            removeEventListener(ResizeEvent.RESIZE,focusObj_resizeHandler,true);
            removeEventListener(ResizeEvent.RESIZE,focusObj_resizeHandler);
            removeEventListener(Event.REMOVED,focusObj_removedHandler,true);
         }
      }
      
      public function get flexContextMenu() : IFlexContextMenu
      {
         return _flexContextMenu;
      }
      
      private function get indexedID() : String
      {
         var _loc1_:String = id;
         var _loc2_:Array = instanceIndices;
         if(_loc2_)
         {
            _loc1_ += "[" + _loc2_.join("][") + "]";
         }
         return _loc1_;
      }
      
      public function get measuredMinHeight() : Number
      {
         return _measuredMinHeight;
      }
      
      mx_internal function addingChild(param1:DisplayObject) : void
      {
         if(param1 is IUIComponent && !IUIComponent(param1).document)
         {
            IUIComponent(param1).document = !!document ? document : ApplicationGlobals.application;
         }
         if(param1 is mx.core.UIComponent && UIComponent(param1).moduleFactory == null)
         {
            if(moduleFactory != null)
            {
               UIComponent(param1).moduleFactory = moduleFactory;
            }
            else if(document is IFlexModule && false)
            {
               UIComponent(param1).moduleFactory = document.moduleFactory;
            }
            else if(parent is mx.core.UIComponent && UIComponent(parent).moduleFactory != null)
            {
               UIComponent(param1).moduleFactory = UIComponent(parent).moduleFactory;
            }
         }
         if(param1 is IFontContextComponent && !param1 is mx.core.UIComponent && IFontContextComponent(param1).fontContext == null)
         {
            IFontContextComponent(param1).fontContext = moduleFactory;
         }
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).parentChanged(this);
         }
         if(param1 is ILayoutManagerClient)
         {
            ILayoutManagerClient(param1).nestLevel = nestLevel + 1;
         }
         else if(param1 is IUITextField)
         {
            IUITextField(param1).nestLevel = nestLevel + 1;
         }
         if(param1 is InteractiveObject)
         {
            if(doubleClickEnabled)
            {
               InteractiveObject(param1).doubleClickEnabled = true;
            }
         }
         if(param1 is IStyleClient)
         {
            IStyleClient(param1).regenerateStyleCache(true);
         }
         else if(param1 is IUITextField && Boolean(IUITextField(param1).inheritingStyles))
         {
            StyleProtoChain.initTextField(IUITextField(param1));
         }
         if(param1 is ISimpleStyleClient)
         {
            ISimpleStyleClient(param1).styleChanged(null);
         }
         if(param1 is IStyleClient)
         {
            IStyleClient(param1).notifyStyleChangeInChildren(null,true);
         }
         if(param1 is mx.core.UIComponent)
         {
            UIComponent(param1).mx_internal::initThemeColor();
         }
         if(param1 is mx.core.UIComponent)
         {
            UIComponent(param1).stylesInitialized();
         }
      }
      
      public function set repeaterIndices(param1:Array) : void
      {
         _repeaterIndices = param1;
      }
      
      protected function initializationComplete() : void
      {
         processedDescriptors = true;
      }
      
      public function set moduleFactory(param1:mx.core.IFlexModuleFactory) : void
      {
         var _loc4_:mx.core.UIComponent = null;
         var _loc2_:int = numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = getChildAt(_loc3_) as mx.core.UIComponent)
            {
               if(_loc4_.moduleFactory == null || _loc4_.moduleFactory == _moduleFactory)
               {
                  _loc4_.moduleFactory = param1;
               }
            }
            _loc3_++;
         }
         _moduleFactory = param1;
      }
      
      private function focusObj_removedHandler(param1:Event) : void
      {
         if(param1.target != this)
         {
            return;
         }
         var _loc2_:DisplayObject = mx_internal::getFocusObject();
         if(_loc2_)
         {
            _loc2_.visible = false;
         }
      }
      
      mx_internal function updateCallbacks() : void
      {
         if(mx_internal::invalidateDisplayListFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.invalidateDisplayList(this);
         }
         if(mx_internal::invalidateSizeFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.invalidateSize(this);
         }
         if(mx_internal::invalidatePropertiesFlag)
         {
            UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
         }
         if(Boolean(systemManager) && _systemManager.useSWFBridge())
         {
            if(false && !listeningForRender)
            {
               _systemManager.addEventListener(FlexEvent.RENDER,callLaterDispatcher);
               _systemManager.addEventListener(FlexEvent.ENTER_FRAME,callLaterDispatcher);
               listeningForRender = true;
            }
            if(false)
            {
               _systemManager.stage.invalidate();
            }
         }
      }
      
      public function set styleDeclaration(param1:CSSStyleDeclaration) : void
      {
         _styleDeclaration = param1;
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         var _loc2_:IChildList = null;
         var _loc4_:InteractiveObject = null;
         super.doubleClickEnabled = param1;
         if(this is IRawChildrenContainer)
         {
            _loc2_ = IRawChildrenContainer(this).rawChildren;
         }
         else
         {
            _loc2_ = IChildList(this);
         }
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.numChildren)
         {
            if(_loc4_ = _loc2_.getChildAt(_loc3_) as InteractiveObject)
            {
               _loc4_.doubleClickEnabled = param1;
            }
            _loc3_++;
         }
      }
      
      public function prepareToPrint(param1:IFlexDisplayObject) : Object
      {
         return null;
      }
      
      [Bindable("explicitMinHeightChanged")]
      public function get minHeight() : Number
      {
         if(!isNaN(explicitMinHeight))
         {
            return explicitMinHeight;
         }
         return measuredMinHeight;
      }
      
      public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         var _loc5_:ISimpleStyleClient = null;
         cachedTextFormat = null;
         var _loc3_:int = numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc5_ = getChildAt(_loc4_) as ISimpleStyleClient)
            {
               _loc5_.styleChanged(param1);
               if(_loc5_ is IStyleClient)
               {
                  IStyleClient(_loc5_).notifyStyleChangeInChildren(param1,param2);
               }
            }
            _loc4_++;
         }
      }
      
      public function get contentMouseX() : Number
      {
         return mouseX;
      }
      
      public function get contentMouseY() : Number
      {
         return mouseY;
      }
      
      public function get tweeningProperties() : Array
      {
         return _tweeningProperties;
      }
      
      public function set explicitMaxWidth(param1:Number) : void
      {
         if(mx_internal::_explicitMaxWidth == param1)
         {
            return;
         }
         mx_internal::_explicitMaxWidth = param1;
         invalidateSize();
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitMaxWidthChanged"));
      }
      
      public function set document(param1:Object) : void
      {
         var _loc4_:IUIComponent = null;
         var _loc2_:int = numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = getChildAt(_loc3_) as IUIComponent)
            {
               if(_loc4_.document == mx_internal::_document || _loc4_.document == ApplicationGlobals.application)
               {
                  _loc4_.document = param1;
               }
            }
            _loc3_++;
         }
         mx_internal::_document = param1;
      }
      
      public function validateSize(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc4_:Boolean = false;
         var _loc5_:IInvalidating = null;
         if(param1)
         {
            _loc2_ = 0;
            while(_loc2_ < numChildren)
            {
               _loc3_ = getChildAt(_loc2_);
               if(_loc3_ is ILayoutManagerClient)
               {
                  (_loc3_ as ILayoutManagerClient).validateSize(true);
               }
               _loc2_++;
            }
         }
         if(mx_internal::invalidateSizeFlag)
         {
            if((_loc4_ = measureSizes()) && includeInLayout)
            {
               invalidateDisplayList();
               if(_loc5_ = parent as IInvalidating)
               {
                  _loc5_.invalidateSize();
                  _loc5_.invalidateDisplayList();
               }
            }
         }
      }
      
      public function get validationSubField() : String
      {
         return _validationSubField;
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         if(mx_internal::dispatchEventHook != null)
         {
            mx_internal::dispatchEventHook(param1,this);
         }
         return super.dispatchEvent(param1);
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      private function overlay_resizeHandler(param1:Event) : void
      {
         mx_internal::fillOverlay(mx_internal::overlay,mx_internal::overlayColor,null);
      }
      
      public function set updateCompletePendingFlag(param1:Boolean) : void
      {
         _updateCompletePendingFlag = param1;
      }
      
      final mx_internal function get $height() : Number
      {
         return super.height;
      }
      
      protected function attachOverlay() : void
      {
         addChild(mx_internal::overlay);
      }
      
      [Bindable("explictMinHeightChanged")]
      public function get explicitMinHeight() : Number
      {
         return mx_internal::_explicitMinHeight;
      }
      
      override public function set height(param1:Number) : void
      {
         var _loc2_:IInvalidating = null;
         if(explicitHeight != param1)
         {
            explicitHeight = param1;
            invalidateSize();
         }
         if(mx_internal::_height != param1)
         {
            invalidateProperties();
            invalidateDisplayList();
            _loc2_ = parent as IInvalidating;
            if(Boolean(_loc2_) && includeInLayout)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
            mx_internal::_height = param1;
            dispatchEvent(new Event("heightChanged"));
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
      
      [Bindable("initialize")]
      public function get parentApplication() : Object
      {
         var _loc2_:mx.core.UIComponent = null;
         var _loc1_:Object = systemManager.document;
         if(_loc1_ == this)
         {
            _loc2_ = _loc1_.systemManager.parent as mx.core.UIComponent;
            _loc1_ = !!_loc2_ ? _loc2_.systemManager.document : null;
         }
         return _loc1_;
      }
      
      public function get repeaterIndex() : int
      {
         return !!_repeaterIndices ? 0 : -1;
      }
      
      private function removeState(param1:String, param2:String) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc3_:State = getState(param1);
         if(param1 == param2)
         {
            return;
         }
         if(_loc3_)
         {
            _loc3_.mx_internal::dispatchExitState();
            _loc5_ = int((_loc4_ = _loc3_.overrides).length);
            while(_loc5_)
            {
               _loc4_[_loc5_ - 1].remove(this);
               _loc5_--;
            }
            if(_loc3_.basedOn != param2)
            {
               removeState(_loc3_.basedOn,param2);
            }
         }
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         if(param1 == "styleName")
         {
            styleName = param2;
            return;
         }
         if(EffectManager.mx_internal::getEventForEffectTrigger(param1) != "")
         {
            EffectManager.mx_internal::setStyle(param1,this);
         }
         var _loc3_:Boolean = StyleManager.isInheritingStyle(param1);
         var _loc4_:* = inheritingStyles != mx.core.UIComponent.mx_internal::STYLE_UNINITIALIZED;
         var _loc5_:* = getStyle(param1) != param2;
         if(!_styleDeclaration)
         {
            _styleDeclaration = new CSSStyleDeclaration();
            _styleDeclaration.mx_internal::setStyle(param1,param2);
            if(_loc4_)
            {
               regenerateStyleCache(_loc3_);
            }
         }
         else
         {
            _styleDeclaration.mx_internal::setStyle(param1,param2);
         }
         if(_loc4_ && _loc5_)
         {
            styleChanged(param1);
            notifyStyleChangeInChildren(param1,_loc3_);
         }
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
         if(!_systemManager || _systemManagerDirty)
         {
            _loc1_ = root;
            if(!(_systemManager is SystemManagerProxy))
            {
               if(Boolean(_loc1_) && !(_loc1_ is Stage))
               {
                  _systemManager = _loc1_ as ISystemManager;
               }
               else if(_loc1_)
               {
                  _systemManager = Stage(_loc1_).getChildAt(0) as ISystemManager;
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
                     if(_loc2_ is ISystemManager)
                     {
                        _systemManager = _loc2_ as ISystemManager;
                        break;
                     }
                     _loc2_ = _loc2_.parent;
                  }
               }
            }
            _systemManagerDirty = false;
         }
         return _systemManager;
      }
      
      public function localToContent(param1:Point) : Point
      {
         return param1;
      }
      
      private function isBaseState(param1:String) : Boolean
      {
         return !param1 || param1 == "";
      }
      
      public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
         cachedTextFormat = null;
         invalidateDisplayList();
         dispatchEvent(new Event("enabledChanged"));
      }
      
      public function set focusEnabled(param1:Boolean) : void
      {
         _focusEnabled = param1;
      }
      
      [Bindable("explicitMinWidthChanged")]
      public function get minWidth() : Number
      {
         if(!isNaN(explicitMinWidth))
         {
            return explicitMinWidth;
         }
         return measuredMinWidth;
      }
      
      private function setFocusLater(param1:Event = null) : void
      {
         var _loc2_:ISystemManager = systemManager;
         if(Boolean(_loc2_) && Boolean(_loc2_.stage))
         {
            _loc2_.stage.removeEventListener(Event.ENTER_FRAME,setFocusLater);
            if(false)
            {
               _loc2_.stage.focus = UIComponentGlobals.mx_internal::nextFocusObject;
            }
            UIComponentGlobals.mx_internal::nextFocusObject = null;
         }
      }
      
      [Bindable("currentStateChange")]
      public function get currentState() : String
      {
         return _currentStateChanged ? requestedCurrentState : _currentState;
      }
      
      public function initializeRepeaterArrays(param1:IRepeaterClient) : void
      {
         if(param1 && param1.instanceIndices && (!param1.isDocument || param1 != descriptor.document) && !_instanceIndices)
         {
            _instanceIndices = param1.instanceIndices;
            _repeaters = param1.repeaters;
            _repeaterIndices = param1.repeaterIndices;
         }
      }
      
      public function get baselinePosition() : Number
      {
         if(false)
         {
            return NaN;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         var _loc1_:TextLineMetrics = measureText("Wj");
         if(height < 2 + _loc1_.ascent + 2)
         {
            return int(height + (_loc1_.ascent - height) / 2);
         }
         return 2 + _loc1_.ascent;
      }
      
      public function get measuredWidth() : Number
      {
         return _measuredWidth;
      }
      
      public function set instanceIndices(param1:Array) : void
      {
         _instanceIndices = param1;
      }
      
      public function set cachePolicy(param1:String) : void
      {
         if(_cachePolicy != param1)
         {
            _cachePolicy = param1;
            if(param1 == UIComponentCachePolicy.OFF)
            {
               cacheAsBitmap = false;
            }
            else if(param1 == UIComponentCachePolicy.ON)
            {
               cacheAsBitmap = true;
            }
            else
            {
               cacheAsBitmap = cacheAsBitmapCount > 0;
            }
         }
      }
      
      public function get automationValue() : Array
      {
         if(automationDelegate)
         {
            return automationDelegate.automationValue;
         }
         return [];
      }
      
      private function addedHandler(param1:Event) : void
      {
         var event:Event = param1;
         if(event.eventPhase != EventPhase.AT_TARGET)
         {
            return;
         }
         try
         {
            if(parent is IContainer && IContainer(parent).creatingContentPane)
            {
               event.stopImmediatePropagation();
               return;
            }
         }
         catch(error:SecurityError)
         {
         }
      }
      
      public function parentChanged(param1:DisplayObjectContainer) : void
      {
         if(!param1)
         {
            mx_internal::_parent = null;
            _nestLevel = 0;
         }
         else if(param1 is IStyleClient)
         {
            mx_internal::_parent = param1;
         }
         else if(param1 is ISystemManager)
         {
            mx_internal::_parent = param1;
         }
         else
         {
            mx_internal::_parent = param1.parent;
         }
      }
      
      public function get owner() : DisplayObjectContainer
      {
         return !!_owner ? _owner : parent;
      }
      
      public function get processedDescriptors() : Boolean
      {
         return _processedDescriptors;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc3_:DisplayObjectContainer = param1.parent;
         if(Boolean(_loc3_) && !(_loc3_ is Loader))
         {
            _loc3_.removeChild(param1);
         }
         if(Boolean(mx_internal::overlayReferenceCount) && param1 != mx_internal::overlay)
         {
            param2 = Math.min(param2,Math.max(0,super.numChildren - 1));
         }
         mx_internal::addingChild(param1);
         mx_internal::$addChildAt(param1,param2);
         mx_internal::childAdded(param1);
         return param1;
      }
      
      [Bindable("explicitMaxWidthChanged")]
      public function get maxWidth() : Number
      {
         return !isNaN(explicitMaxWidth) ? explicitMaxWidth : DEFAULT_MAX_WIDTH;
      }
      
      [Bindable("alphaChanged")]
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         dispatchEvent(new Event("alphaChanged"));
      }
      
      private function removedHandler(param1:Event) : void
      {
         var event:Event = param1;
         if(event.eventPhase != EventPhase.AT_TARGET)
         {
            return;
         }
         try
         {
            if(parent is IContainer && IContainer(parent).creatingContentPane)
            {
               event.stopImmediatePropagation();
               return;
            }
         }
         catch(error:SecurityError)
         {
         }
         _systemManagerDirty = true;
      }
      
      public function callLater(param1:Function, param2:Array = null) : void
      {
         methodQueue.push(new MethodQueueElement(param1,param2));
         var _loc3_:ISystemManager = systemManager;
         if(Boolean(_loc3_) && (_loc3_.stage || _loc3_.useSWFBridge()))
         {
            if(!listeningForRender)
            {
               _loc3_.addEventListener(FlexEvent.RENDER,callLaterDispatcher);
               _loc3_.addEventListener(FlexEvent.ENTER_FRAME,callLaterDispatcher);
               listeningForRender = true;
            }
            if(_loc3_.stage)
            {
               _loc3_.stage.invalidate();
            }
         }
      }
      
      public function get initialized() : Boolean
      {
         return _initialized;
      }
      
      private function callLaterDispatcher2(param1:Event) : void
      {
         var _loc6_:MethodQueueElement = null;
         if(false)
         {
            return;
         }
         var _loc2_:ISystemManager = systemManager;
         if(_loc2_ && (_loc2_.stage || _loc2_.useSWFBridge()) && listeningForRender)
         {
            _loc2_.removeEventListener(FlexEvent.RENDER,callLaterDispatcher);
            _loc2_.removeEventListener(FlexEvent.ENTER_FRAME,callLaterDispatcher);
            listeningForRender = false;
         }
         var _loc3_:Array = methodQueue;
         methodQueue = [];
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            (_loc6_ = MethodQueueElement(_loc3_[_loc5_])).method.apply(null,_loc6_.args);
            _loc5_++;
         }
      }
      
      public function measureHTMLText(param1:String) : TextLineMetrics
      {
         return determineTextFormatFromStyles().measureHTMLText(param1);
      }
      
      public function set descriptor(param1:mx.core.UIComponentDescriptor) : void
      {
         mx_internal::_descriptor = param1;
      }
      
      private function getState(param1:String) : State
      {
         if(!states || isBaseState(param1))
         {
            return null;
         }
         var _loc2_:int = 0;
         while(_loc2_ < states.length)
         {
            if(states[_loc2_].name == param1)
            {
               return states[_loc2_];
            }
            _loc2_++;
         }
         var _loc3_:String = String(resourceManager.getString("core","stateUndefined",[param1]));
         throw new ArgumentError(_loc3_);
      }
      
      public function validateProperties() : void
      {
         if(mx_internal::invalidatePropertiesFlag)
         {
            commitProperties();
            mx_internal::invalidatePropertiesFlag = false;
         }
      }
      
      mx_internal function get documentDescriptor() : mx.core.UIComponentDescriptor
      {
         return mx_internal::_documentDescriptor;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         var _loc2_:IInvalidating = null;
         if(_includeInLayout != param1)
         {
            _includeInLayout = param1;
            _loc2_ = parent as IInvalidating;
            if(_loc2_)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
            dispatchEvent(new Event("includeInLayoutChanged"));
         }
      }
      
      public function getClassStyleDeclarations() : Array
      {
         var className:String;
         var decls:Array;
         var caches:Array;
         var classNames:Array;
         var declcache:Array;
         var myApplicationDomain:ApplicationDomain = null;
         var cache:Array = null;
         var myRoot:DisplayObject = null;
         var s:CSSStyleDeclaration = null;
         var factory:mx.core.IFlexModuleFactory = ModuleManager.getAssociatedFactory(this);
         if(factory != null)
         {
            myApplicationDomain = ApplicationDomain(factory.info()["currentDomain"]);
         }
         else
         {
            myRoot = SystemManager.getSWFRoot(this);
            if(!myRoot)
            {
               return [];
            }
            myApplicationDomain = myRoot.loaderInfo.applicationDomain;
         }
         className = getQualifiedClassName(this);
         className = className.replace("::",".");
         cache = StyleManager.mx_internal::typeSelectorCache[className];
         if(cache)
         {
            return cache;
         }
         decls = [];
         classNames = [];
         caches = [];
         declcache = [];
         while(className != null && className != "mx.core.UIComponent" && className != "mx.core.UITextField")
         {
            cache = StyleManager.mx_internal::typeSelectorCache[className];
            if(cache)
            {
               decls = decls.concat(cache);
               break;
            }
            s = StyleManager.getStyleDeclaration(className);
            if(s)
            {
               decls.unshift(s);
               classNames.push(className);
               caches.push(classNames);
               declcache.push(decls);
               decls = [];
               classNames = [];
            }
            else
            {
               classNames.push(className);
            }
            try
            {
               className = getQualifiedSuperclassName(myApplicationDomain.getDefinition(className));
               className = className.replace("::",".");
            }
            catch(e:ReferenceError)
            {
               className = null;
            }
         }
         caches.push(classNames);
         declcache.push(decls);
         decls = [];
         while(caches.length)
         {
            classNames = caches.pop();
            decls = decls.concat(declcache.pop());
            while(classNames.length)
            {
               StyleManager.mx_internal::typeSelectorCache[classNames.pop()] = decls;
            }
         }
         return decls;
      }
      
      public function set measuredMinWidth(param1:Number) : void
      {
         _measuredMinWidth = param1;
      }
      
      private function initializeState(param1:String) : void
      {
         var _loc2_:State = getState(param1);
         while(_loc2_)
         {
            _loc2_.mx_internal::initialize();
            _loc2_ = getState(_loc2_.basedOn);
         }
      }
      
      mx_internal function initProtoChain() : void
      {
         var _loc1_:CSSStyleDeclaration = null;
         var _loc7_:Object = null;
         var _loc8_:CSSStyleDeclaration = null;
         if(styleName)
         {
            if(styleName is CSSStyleDeclaration)
            {
               _loc1_ = CSSStyleDeclaration(styleName);
            }
            else
            {
               if(styleName is IFlexDisplayObject || styleName is IStyleClient)
               {
                  StyleProtoChain.initProtoChainForUIComponentStyleName(this);
                  return;
               }
               if(styleName is String)
               {
                  _loc1_ = StyleManager.getStyleDeclaration("." + styleName);
               }
            }
         }
         var _loc2_:Object = StyleManager.mx_internal::stylesRoot;
         if(Boolean(_loc2_) && Boolean(_loc2_.effects))
         {
            registerEffects(_loc2_.effects);
         }
         var _loc3_:IStyleClient = parent as IStyleClient;
         if(_loc3_)
         {
            if((_loc7_ = _loc3_.inheritingStyles) == mx.core.UIComponent.mx_internal::STYLE_UNINITIALIZED)
            {
               _loc7_ = _loc2_;
            }
         }
         else if(isPopUp)
         {
            if(_owner && _owner is IStyleClient)
            {
               _loc7_ = IStyleClient(_owner).inheritingStyles;
            }
            else
            {
               _loc7_ = ApplicationGlobals.application.inheritingStyles;
            }
         }
         else
         {
            _loc7_ = StyleManager.mx_internal::stylesRoot;
         }
         var _loc4_:Array;
         var _loc5_:int = int((_loc4_ = getClassStyleDeclarations()).length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = (_loc8_ = _loc4_[_loc6_]).mx_internal::addStyleToProtoChain(_loc7_,this);
            _loc2_ = _loc8_.mx_internal::addStyleToProtoChain(_loc2_,this);
            if(_loc8_.mx_internal::effects)
            {
               registerEffects(_loc8_.mx_internal::effects);
            }
            _loc6_++;
         }
         if(_loc1_)
         {
            _loc7_ = _loc1_.mx_internal::addStyleToProtoChain(_loc7_,this);
            _loc2_ = _loc1_.mx_internal::addStyleToProtoChain(_loc2_,this);
            if(_loc1_.mx_internal::effects)
            {
               registerEffects(_loc1_.mx_internal::effects);
            }
         }
         inheritingStyles = !!_styleDeclaration ? _styleDeclaration.mx_internal::addStyleToProtoChain(_loc7_,this) : _loc7_;
         nonInheritingStyles = !!_styleDeclaration ? _styleDeclaration.mx_internal::addStyleToProtoChain(_loc2_,this) : _loc2_;
      }
      
      public function get repeaterIndices() : Array
      {
         return !!_repeaterIndices ? _repeaterIndices.slice() : [];
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         mx_internal::removingChild(param1);
         mx_internal::$removeChild(param1);
         mx_internal::childRemoved(param1);
         return param1;
      }
      
      private function focusObj_moveHandler(param1:MoveEvent) : void
      {
         adjustFocusRect();
      }
      
      public function get styleDeclaration() : CSSStyleDeclaration
      {
         return _styleDeclaration;
      }
      
      override public function get doubleClickEnabled() : Boolean
      {
         return super.doubleClickEnabled;
      }
      
      public function contentToLocal(param1:Point) : Point
      {
         return param1;
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         if(_currentStateChanged)
         {
            _currentStateChanged = false;
            commitCurrentState();
            validateNow();
         }
         removeEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
      }
      
      public function set measuredHeight(param1:Number) : void
      {
         _measuredHeight = param1;
      }
      
      protected function createChildren() : void
      {
      }
      
      public function get activeEffects() : Array
      {
         return mx_internal::_effectsStarted;
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         if(Boolean(mx_internal::overlayReferenceCount) && param1 != mx_internal::overlay)
         {
            param2 = Math.min(param2,Math.max(0,super.numChildren - 2));
         }
         super.setChildIndex(param1,param2);
      }
      
      public function regenerateStyleCache(param1:Boolean) : void
      {
         var _loc5_:DisplayObject = null;
         mx_internal::initProtoChain();
         var _loc2_:IChildList = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
         var _loc3_:int = int(_loc2_.numChildren);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = _loc2_.getChildAt(_loc4_)) is IStyleClient)
            {
               if(IStyleClient(_loc5_).inheritingStyles != mx.core.UIComponent.mx_internal::STYLE_UNINITIALIZED)
               {
                  IStyleClient(_loc5_).regenerateStyleCache(param1);
               }
            }
            else if(_loc5_ is IUITextField)
            {
               if(IUITextField(_loc5_).inheritingStyles)
               {
                  StyleProtoChain.initTextField(IUITextField(_loc5_));
               }
            }
            _loc4_++;
         }
      }
      
      public function get updateCompletePendingFlag() : Boolean
      {
         return _updateCompletePendingFlag;
      }
      
      protected function focusOutHandler(param1:FocusEvent) : void
      {
         if(isOurFocus(DisplayObject(param1.target)))
         {
            drawFocus(false);
         }
      }
      
      public function getFocus() : InteractiveObject
      {
         var _loc1_:ISystemManager = systemManager;
         if(!_loc1_)
         {
            return null;
         }
         if(false)
         {
            return UIComponentGlobals.mx_internal::nextFocusObject;
         }
         return _loc1_.stage.focus;
      }
      
      public function endEffectsStarted() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            mx_internal::_effectsStarted[_loc2_].end();
            _loc2_++;
         }
      }
      
      protected function get unscaledHeight() : Number
      {
         return height / Math.abs(scaleY);
      }
      
      [Bindable("enabledChanged")]
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function get focusEnabled() : Boolean
      {
         return _focusEnabled;
      }
      
      override public function set cacheAsBitmap(param1:Boolean) : void
      {
         super.cacheAsBitmap = param1;
         cacheAsBitmapCount = param1 ? 1 : 0;
      }
      
      mx_internal function removeOverlay() : void
      {
         if(mx_internal::overlayReferenceCount > 0 && --mx_internal::overlayReferenceCount == 0 && Boolean(mx_internal::overlay))
         {
            removeEventListener("resize",overlay_resizeHandler);
            if(super.getChildByName("overlay"))
            {
               mx_internal::$removeChild(mx_internal::overlay);
            }
            mx_internal::overlay = null;
         }
      }
      
      public function set cacheHeuristic(param1:Boolean) : void
      {
         if(_cachePolicy == UIComponentCachePolicy.AUTO)
         {
            if(param1)
            {
               ++cacheAsBitmapCount;
            }
            else if(cacheAsBitmapCount != 0)
            {
               --cacheAsBitmapCount;
            }
            super.cacheAsBitmap = cacheAsBitmapCount != 0;
         }
      }
      
      public function get cachePolicy() : String
      {
         return _cachePolicy;
      }
      
      public function set maxHeight(param1:Number) : void
      {
         if(explicitMaxHeight == param1)
         {
            return;
         }
         explicitMaxHeight = param1;
      }
      
      public function getConstraintValue(param1:String) : *
      {
         return getStyle(param1);
      }
      
      public function set focusManager(param1:IFocusManager) : void
      {
         _focusManager = param1;
      }
      
      public function clearStyle(param1:String) : void
      {
         setStyle(param1,undefined);
      }
      
      public function get descriptor() : mx.core.UIComponentDescriptor
      {
         return mx_internal::_descriptor;
      }
      
      public function set nonInheritingStyles(param1:Object) : void
      {
         _nonInheritingStyles = param1;
      }
      
      public function get cursorManager() : ICursorManager
      {
         var _loc2_:* = null;
         var _loc1_:DisplayObject = parent;
         while(_loc1_)
         {
            if(_loc1_ is IUIComponent && "cursorManager" in _loc1_)
            {
               return _loc1_["cursorManager"];
            }
            _loc1_ = _loc1_.parent;
         }
         return CursorManager.getInstance();
      }
      
      public function set automationDelegate(param1:Object) : void
      {
         _automationDelegate = param1 as IAutomationObject;
      }
      
      public function get measuredMinWidth() : Number
      {
         return _measuredMinWidth;
      }
      
      public function createReferenceOnParentDocument(param1:IFlexDisplayObject) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:PropertyChangeEvent = null;
         var _loc7_:Object = null;
         if(Boolean(id) && id != "")
         {
            _loc2_ = _instanceIndices;
            if(!_loc2_)
            {
               param1[id] = this;
            }
            else
            {
               _loc3_ = param1[id];
               if(!(_loc3_ is Array))
               {
                  _loc3_ = param1[id] = [];
               }
               _loc4_ = int(_loc2_.length);
               _loc5_ = 0;
               while(_loc5_ < _loc4_ - 1)
               {
                  if(!((_loc7_ = _loc3_[_loc2_[_loc5_]]) is Array))
                  {
                     _loc7_ = _loc3_[_loc2_[_loc5_]] = [];
                  }
                  _loc3_ = _loc7_;
                  _loc5_++;
               }
               _loc3_[_loc2_[_loc4_ - 1]] = this;
               _loc6_ = PropertyChangeEvent.createUpdateEvent(param1,id,param1[id],param1[id]);
               param1.dispatchEvent(_loc6_);
            }
         }
      }
      
      public function get repeater() : IRepeater
      {
         return !!_repeaters ? _repeaters[-1] : null;
      }
      
      public function set isPopUp(param1:Boolean) : void
      {
         _isPopUp = param1;
      }
      
      public function get measuredHeight() : Number
      {
         return _measuredHeight;
      }
      
      public function initialize() : void
      {
         if(initialized)
         {
            return;
         }
         dispatchEvent(new FlexEvent(FlexEvent.PREINITIALIZE));
         createChildren();
         childrenCreated();
         initializeAccessibility();
         initializationComplete();
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:IInvalidating = null;
         if(explicitWidth != param1)
         {
            explicitWidth = param1;
            invalidateSize();
         }
         if(mx_internal::_width != param1)
         {
            invalidateProperties();
            invalidateDisplayList();
            _loc2_ = parent as IInvalidating;
            if(Boolean(_loc2_) && includeInLayout)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
            mx_internal::_width = param1;
            dispatchEvent(new Event("widthChanged"));
         }
      }
      
      public function set percentHeight(param1:Number) : void
      {
         if(_percentHeight == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _explicitHeight = NaN;
         }
         _percentHeight = param1;
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
      }
      
      final mx_internal function set $visible(param1:Boolean) : void
      {
         super.visible = param1;
      }
      
      private function findCommonBaseState(param1:String, param2:String) : String
      {
         var _loc3_:State = getState(param1);
         var _loc4_:State = getState(param2);
         if(!_loc3_ || !_loc4_)
         {
            return "";
         }
         if(isBaseState(_loc3_.basedOn) && isBaseState(_loc4_.basedOn))
         {
            return "";
         }
         var _loc5_:Array = getBaseStates(_loc3_);
         var _loc6_:Array = getBaseStates(_loc4_);
         var _loc7_:String = "";
         while(_loc5_[_loc5_.length - 1] == _loc6_[_loc6_.length - 1])
         {
            _loc7_ = _loc5_.pop();
            _loc6_.pop();
            if(!_loc5_.length || !_loc6_.length)
            {
               break;
            }
         }
         if(Boolean(_loc5_.length) && _loc5_[_loc5_.length - 1] == _loc4_.name)
         {
            _loc7_ = _loc4_.name;
         }
         else if(Boolean(_loc6_.length) && _loc6_[_loc6_.length - 1] == _loc3_.name)
         {
            _loc7_ = _loc3_.name;
         }
         return _loc7_;
      }
      
      mx_internal function childRemoved(param1:DisplayObject) : void
      {
         if(param1 is IUIComponent)
         {
            if(IUIComponent(param1).document != param1)
            {
               IUIComponent(param1).document = null;
            }
            IUIComponent(param1).parentChanged(null);
         }
      }
      
      final mx_internal function $removeChildAt(param1:int) : DisplayObject
      {
         return super.removeChildAt(param1);
      }
      
      [Bindable("explicitMaxHeightChanged")]
      public function get maxHeight() : Number
      {
         return !isNaN(explicitMaxHeight) ? explicitMaxHeight : DEFAULT_MAX_HEIGHT;
      }
      
      protected function initializeAccessibility() : void
      {
         if(false)
         {
            mx.core.UIComponent.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      public function set explicitMaxHeight(param1:Number) : void
      {
         if(mx_internal::_explicitMaxHeight == param1)
         {
            return;
         }
         mx_internal::_explicitMaxHeight = param1;
         invalidateSize();
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(_loc2_)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitMaxHeightChanged"));
      }
      
      public function get focusManager() : IFocusManager
      {
         if(_focusManager)
         {
            return _focusManager;
         }
         var _loc1_:DisplayObject = parent;
         while(_loc1_)
         {
            if(_loc1_ is IFocusManagerContainer)
            {
               return IFocusManagerContainer(_loc1_).focusManager;
            }
            _loc1_ = _loc1_.parent;
         }
         return null;
      }
      
      public function set styleName(param1:Object) : void
      {
         if(_styleName === param1)
         {
            return;
         }
         _styleName = param1;
         if(inheritingStyles == mx.core.UIComponent.mx_internal::STYLE_UNINITIALIZED)
         {
            return;
         }
         regenerateStyleCache(true);
         mx_internal::initThemeColor();
         styleChanged("styleName");
         notifyStyleChangeInChildren("styleName",true);
      }
      
      public function get automationDelegate() : Object
      {
         return _automationDelegate;
      }
      
      [Bindable("unused")]
      protected function get resourceManager() : IResourceManager
      {
         return _resourceManager;
      }
      
      mx_internal function validateBaselinePosition() : Boolean
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(!parent)
         {
            return false;
         }
         if(width == 0 && height == 0)
         {
            validateNow();
            _loc1_ = getExplicitOrMeasuredWidth();
            _loc2_ = getExplicitOrMeasuredHeight();
            setActualSize(_loc1_,_loc2_);
         }
         validateNow();
         return true;
      }
      
      mx_internal function cancelAllCallLaters() : void
      {
         var _loc1_:ISystemManager = systemManager;
         if(Boolean(_loc1_) && (_loc1_.stage || _loc1_.useSWFBridge()))
         {
            if(listeningForRender)
            {
               _loc1_.removeEventListener(FlexEvent.RENDER,callLaterDispatcher);
               _loc1_.removeEventListener(FlexEvent.ENTER_FRAME,callLaterDispatcher);
               listeningForRender = false;
            }
         }
         methodQueue.splice(0);
      }
      
      private function updateCompleteHandler(param1:FlexEvent) : void
      {
         UIComponentGlobals.mx_internal::layoutManager.removeEventListener(FlexEvent.UPDATE_COMPLETE,updateCompleteHandler);
         processEffectFinished(_endingEffectInstances);
         _endingEffectInstances = [];
      }
      
      public function styleChanged(param1:String) : void
      {
         if(this is IFontContextComponent && hasFontContextChanged())
         {
            invalidateProperties();
         }
         if(!param1 || param1 == "styleName" || StyleManager.isSizeInvalidatingStyle(param1))
         {
            invalidateSize();
         }
         if(!param1 || param1 == "styleName" || param1 == "themeColor")
         {
            mx_internal::initThemeColor();
         }
         invalidateDisplayList();
         if(parent is IInvalidating)
         {
            if(StyleManager.isParentSizeInvalidatingStyle(param1))
            {
               IInvalidating(parent).invalidateSize();
            }
            if(StyleManager.isParentDisplayListInvalidatingStyle(param1))
            {
               IInvalidating(parent).invalidateDisplayList();
            }
         }
      }
      
      final mx_internal function get $visible() : Boolean
      {
         return super.visible;
      }
      
      public function drawRoundRect(param1:Number, param2:Number, param3:Number, param4:Number, param5:Object = null, param6:Object = null, param7:Object = null, param8:Object = null, param9:String = null, param10:Array = null, param11:Object = null) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Array = null;
         var _loc15_:Matrix = null;
         var _loc16_:Object = null;
         var _loc12_:Graphics = graphics;
         if(!param3 || !param4)
         {
            return;
         }
         if(param6 !== null)
         {
            if(param6 is Array)
            {
               if(param7 is Array)
               {
                  _loc14_ = param7 as Array;
               }
               else
               {
                  _loc14_ = [param7,param7];
               }
               if(!param10)
               {
                  param10 = [0,255];
               }
               _loc15_ = null;
               if(param8)
               {
                  if(param8 is Matrix)
                  {
                     _loc15_ = Matrix(param8);
                  }
                  else
                  {
                     _loc15_ = new Matrix();
                     if(param8 is Number)
                     {
                        _loc15_.createGradientBox(param3,param4,Number(param8) * 0 / 180,param1,param2);
                     }
                     else
                     {
                        _loc15_.createGradientBox(param8.w,param8.h,param8.r,param8.x,param8.y);
                     }
                  }
               }
               if(param9 == GradientType.RADIAL)
               {
                  _loc12_.beginGradientFill(GradientType.RADIAL,param6 as Array,_loc14_,param10,_loc15_);
               }
               else
               {
                  _loc12_.beginGradientFill(GradientType.LINEAR,param6 as Array,_loc14_,param10,_loc15_);
               }
            }
            else
            {
               _loc12_.beginFill(Number(param6),Number(param7));
            }
         }
         if(!param5)
         {
            _loc12_.drawRect(param1,param2,param3,param4);
         }
         else if(param5 is Number)
         {
            _loc13_ = Number(param5) * 2;
            _loc12_.drawRoundRect(param1,param2,param3,param4,_loc13_,_loc13_);
         }
         else
         {
            GraphicsUtil.drawRoundRectComplex(_loc12_,param1,param2,param3,param4,param5.tl,param5.tr,param5.bl,param5.br);
         }
         if(param11)
         {
            if((_loc16_ = param11.r) is Number)
            {
               _loc13_ = Number(_loc16_) * 2;
               _loc12_.drawRoundRect(param11.x,param11.y,param11.w,param11.h,_loc13_,_loc13_);
            }
            else
            {
               GraphicsUtil.drawRoundRectComplex(_loc12_,param11.x,param11.y,param11.w,param11.h,_loc16_.tl,_loc16_.tr,_loc16_.bl,_loc16_.br);
            }
         }
         if(param6 !== null)
         {
            _loc12_.endFill();
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         if(param1 != super.x)
         {
            super.x = param1;
            dispatchEvent(new Event("xChanged"));
            _loc3_ = true;
         }
         if(param2 != super.y)
         {
            super.y = param2;
            dispatchEvent(new Event("yChanged"));
            _loc3_ = true;
         }
         if(_loc3_)
         {
            dispatchMoveEvent();
         }
      }
      
      public function set toolTip(param1:String) : void
      {
         var _loc2_:String = mx_internal::_toolTip;
         mx_internal::_toolTip = param1;
         ToolTipManager.mx_internal::registerToolTip(this,_loc2_,param1);
         dispatchEvent(new Event("toolTipChanged"));
      }
      
      public function set repeaters(param1:Array) : void
      {
         _repeaters = param1;
      }
      
      [Bindable("explicitMaxHeightChanged")]
      public function get explicitMaxHeight() : Number
      {
         return mx_internal::_explicitMaxHeight;
      }
      
      public function measureText(param1:String) : TextLineMetrics
      {
         return determineTextFormatFromStyles().measureText(param1);
      }
      
      public function get styleName() : Object
      {
         return _styleName;
      }
      
      protected function createInModuleContext(param1:mx.core.IFlexModuleFactory, param2:String) : Object
      {
         var _loc3_:Object = null;
         if(param1)
         {
            _loc3_ = param1.create(param2);
         }
         return _loc3_;
      }
      
      [Bindable("initialize")]
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
      
      protected function childrenCreated() : void
      {
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function set flexContextMenu(param1:IFlexContextMenu) : void
      {
         if(_flexContextMenu)
         {
            _flexContextMenu.unsetContextMenu(this);
         }
         _flexContextMenu = param1;
         if(param1 != null)
         {
            _flexContextMenu.setContextMenu(this);
         }
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         if(_explicitWidth == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _percentWidth = NaN;
         }
         _explicitWidth = param1;
         invalidateSize();
         var _loc2_:IInvalidating = parent as IInvalidating;
         if(Boolean(_loc2_) && includeInLayout)
         {
            _loc2_.invalidateSize();
            _loc2_.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitWidthChanged"));
      }
      
      private function setBorderColorForErrorString() : void
      {
         if(!mx_internal::_errorString || false)
         {
            if(!isNaN(mx_internal::origBorderColor))
            {
               setStyle("borderColor",mx_internal::origBorderColor);
               mx_internal::saveBorderColor = true;
            }
         }
         else
         {
            if(mx_internal::saveBorderColor)
            {
               mx_internal::saveBorderColor = false;
               mx_internal::origBorderColor = getStyle("borderColor");
            }
            setStyle("borderColor",getStyle("errorColor"));
         }
         styleChanged("themeColor");
         var _loc1_:IFocusManager = focusManager;
         var _loc2_:DisplayObject = !!_loc1_ ? DisplayObject(_loc1_.getFocus()) : null;
         if(_loc1_ && _loc1_.showFocusIndicator && _loc2_ == this)
         {
            drawFocus(true);
         }
      }
      
      [Bindable("explicitWidthChanged")]
      public function get explicitWidth() : Number
      {
         return _explicitWidth;
      }
      
      public function invalidateSize() : void
      {
         if(!mx_internal::invalidateSizeFlag)
         {
            mx_internal::invalidateSizeFlag = true;
            if(Boolean(parent) && false)
            {
               UIComponentGlobals.mx_internal::layoutManager.invalidateSize(this);
            }
         }
      }
      
      public function set measuredMinHeight(param1:Number) : void
      {
         _measuredMinHeight = param1;
      }
      
      protected function updateDisplayList(param1:Number, param2:Number) : void
      {
      }
      
      override public function set filters(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:IEventDispatcher = null;
         if(_filters)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = _filters[_loc3_] as IEventDispatcher)
               {
                  _loc4_.removeEventListener("change",filterChangeHandler);
               }
               _loc3_++;
            }
         }
         _filters = param1;
         if(_filters)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = _filters[_loc3_] as IEventDispatcher)
               {
                  _loc4_.addEventListener("change",filterChangeHandler);
               }
               _loc3_++;
            }
         }
         super.filters = _filters;
      }
   }
}

class MethodQueueElement
{
    
   
   public var method:Function;
   
   public var args:Array;
   
   public function MethodQueueElement(param1:Function, param2:Array = null)
   {
      super();
      this.method = param1;
      this.args = param2;
   }
}
