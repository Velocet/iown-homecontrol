package mx.containers
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextLineMetrics;
   import flash.utils.getQualifiedClassName;
   import mx.automation.IAutomationObject;
   import mx.containers.utilityClasses.BoxLayout;
   import mx.containers.utilityClasses.CanvasLayout;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.containers.utilityClasses.IConstraintLayout;
   import mx.containers.utilityClasses.Layout;
   import mx.controls.Button;
   import mx.core.Container;
   import mx.core.ContainerLayout;
   import mx.core.EdgeMetrics;
   import mx.core.EventPriority;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IUIComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UIComponentCachePolicy;
   import mx.core.UITextField;
   import mx.core.UITextFormat;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.events.CloseEvent;
   import mx.events.SandboxMouseEvent;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.styles.StyleProxy;
   
   public class Panel extends Container implements IConstraintLayout, IFontContextComponent
   {
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static var _closeButtonStyleFilters:Object = {
         "closeButtonUpSkin":"closeButtonUpSkin",
         "closeButtonOverSkin":"closeButtonOverSkin",
         "closeButtonDownSkin":"closeButtonDownSkin",
         "closeButtonDisabledSkin":"closeButtonDisabledSkin",
         "closeButtonSkin":"closeButtonSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const HEADER_PADDING:Number = 14;
       
      
      private var layoutObject:Layout;
      
      private var _status:String = "";
      
      private var _titleChanged:Boolean = false;
      
      mx_internal var titleBarBackground:IFlexDisplayObject;
      
      private var regX:Number;
      
      private var regY:Number;
      
      private var _layout:String = "vertical";
      
      mx_internal var closeButton:Button;
      
      private var initializing:Boolean = true;
      
      private var _title:String = "";
      
      protected var titleTextField:IUITextField;
      
      private var _statusChanged:Boolean = false;
      
      private var autoSetRoundedCorners:Boolean;
      
      private var _titleIcon:Class;
      
      private var _constraintRows:Array;
      
      protected var controlBar:IUIComponent;
      
      mx_internal var titleIconObject:Object = null;
      
      protected var titleBar:UIComponent;
      
      private var panelViewMetrics:EdgeMetrics;
      
      private var _constraintColumns:Array;
      
      mx_internal var _showCloseButton:Boolean = false;
      
      private var checkedForAutoSetRoundedCorners:Boolean;
      
      private var _titleIconChanged:Boolean = false;
      
      protected var statusTextField:IUITextField;
      
      public function Panel()
      {
         _constraintColumns = [];
         _constraintRows = [];
         super();
         addEventListener("resizeStart",EffectManager.mx_internal::eventHandler,false,EventPriority.EFFECT);
         addEventListener("resizeEnd",EffectManager.mx_internal::eventHandler,false,EventPriority.EFFECT);
         layoutObject = new BoxLayout();
         layoutObject.target = this;
         showInAutomationHierarchy = true;
      }
      
      private function systemManager_mouseUpHandler(param1:MouseEvent) : void
      {
         if(!isNaN(regX))
         {
            stopDragging();
         }
      }
      
      mx_internal function getHeaderHeightProxy() : Number
      {
         return getHeaderHeight();
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         if(Boolean(controlBar) && param1 == controlBar)
         {
            return numChildren;
         }
         return super.getChildIndex(param1);
      }
      
      mx_internal function get _controlBar() : IUIComponent
      {
         return controlBar;
      }
      
      mx_internal function getTitleBar() : UIComponent
      {
         return titleBar;
      }
      
      [Bindable("layoutChanged")]
      public function get layout() : String
      {
         return _layout;
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Class = null;
         var _loc2_:IStyleClient = null;
         var _loc3_:ISimpleStyleClient = null;
         super.createChildren();
         if(!titleBar)
         {
            titleBar = new UIComponent();
            titleBar.visible = false;
            titleBar.addEventListener(MouseEvent.MOUSE_DOWN,titleBar_mouseDownHandler);
            rawChildren.addChild(titleBar);
         }
         if(!mx_internal::titleBarBackground)
         {
            _loc1_ = getStyle("titleBackgroundSkin");
            if(_loc1_)
            {
               mx_internal::titleBarBackground = new _loc1_();
               _loc2_ = mx_internal::titleBarBackground as IStyleClient;
               if(_loc2_)
               {
                  _loc2_.setStyle("backgroundImage",undefined);
               }
               _loc3_ = mx_internal::titleBarBackground as ISimpleStyleClient;
               if(_loc3_)
               {
                  _loc3_.styleName = this;
               }
               titleBar.addChild(DisplayObject(mx_internal::titleBarBackground));
            }
         }
         mx_internal::createTitleTextField(-1);
         mx_internal::createStatusTextField(-1);
         if(!mx_internal::closeButton)
         {
            mx_internal::closeButton = new Button();
            mx_internal::closeButton.styleName = new StyleProxy(this,closeButtonStyleFilters);
            mx_internal::closeButton.mx_internal::upSkinName = "closeButtonUpSkin";
            mx_internal::closeButton.mx_internal::overSkinName = "closeButtonOverSkin";
            mx_internal::closeButton.mx_internal::downSkinName = "closeButtonDownSkin";
            mx_internal::closeButton.mx_internal::disabledSkinName = "closeButtonDisabledSkin";
            mx_internal::closeButton.mx_internal::skinName = "closeButtonSkin";
            mx_internal::closeButton.explicitWidth = mx_internal::closeButton.explicitHeight = 16;
            mx_internal::closeButton.focusEnabled = false;
            mx_internal::closeButton.visible = false;
            mx_internal::closeButton.enabled = enabled;
            mx_internal::closeButton.addEventListener(MouseEvent.CLICK,closeButton_clickHandler);
            titleBar.addChild(mx_internal::closeButton);
            mx_internal::closeButton.owner = this;
         }
      }
      
      public function get constraintColumns() : Array
      {
         return _constraintColumns;
      }
      
      override public function set cacheAsBitmap(param1:Boolean) : void
      {
         super.cacheAsBitmap = param1;
         if(cacheAsBitmap && !mx_internal::contentPane && cachePolicy != UIComponentCachePolicy.OFF && getStyle("backgroundColor"))
         {
            mx_internal::createContentPane();
            invalidateDisplayList();
         }
      }
      
      override public function createComponentsFromDescriptors(param1:Boolean = true) : void
      {
         var _loc3_:Object = null;
         super.createComponentsFromDescriptors();
         if(numChildren == 0)
         {
            setControlBar(null);
            return;
         }
         var _loc2_:IUIComponent = IUIComponent(getChildAt(numChildren - 1));
         if(_loc2_ is ControlBar)
         {
            _loc3_ = _loc2_.document;
            if(mx_internal::contentPane)
            {
               mx_internal::contentPane.removeChild(DisplayObject(_loc2_));
            }
            else
            {
               removeChild(DisplayObject(_loc2_));
            }
            _loc2_.document = _loc3_;
            rawChildren.addChild(DisplayObject(_loc2_));
            setControlBar(_loc2_);
         }
         else
         {
            setControlBar(null);
         }
      }
      
      override protected function layoutChrome(param1:Number, param2:Number) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Graphics = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         super.layoutChrome(param1,param2);
         var _loc3_:EdgeMetrics = EdgeMetrics.EMPTY;
         var _loc4_:Number = getStyle("borderThickness");
         if(getQualifiedClassName(mx_internal::border) == "mx.skins.halo::PanelSkin" && getStyle("borderStyle") != "default" && Boolean(_loc4_))
         {
            _loc3_ = new EdgeMetrics(_loc4_,_loc4_,_loc4_,_loc4_);
         }
         var _loc5_:EdgeMetrics;
         var _loc6_:Number = (_loc5_ = false ? borderMetrics : _loc3_).left;
         var _loc7_:Number = _loc5_.top;
         var _loc8_:Number;
         if((_loc8_ = getHeaderHeight()) > 0 && height >= _loc8_)
         {
            _loc9_ = param1 - _loc5_.left - _loc5_.right;
            showTitleBar(true);
            titleBar.mouseChildren = true;
            titleBar.mouseEnabled = true;
            (_loc10_ = titleBar.graphics).clear();
            _loc10_.beginFill(16777215,0);
            _loc10_.drawRect(0,0,_loc9_,_loc8_);
            _loc10_.endFill();
            _loc10_.lineStyle(0,0,0);
            _loc10_.drawRect(0,0,_loc9_,param2);
            titleBar.move(_loc6_,_loc7_);
            titleBar.setActualSize(_loc9_,_loc8_);
            mx_internal::titleBarBackground.move(0,0);
            IFlexDisplayObject(mx_internal::titleBarBackground).setActualSize(_loc9_,_loc8_);
            mx_internal::closeButton.visible = mx_internal::_showCloseButton;
            if(mx_internal::_showCloseButton)
            {
               mx_internal::closeButton.setActualSize(mx_internal::closeButton.getExplicitOrMeasuredWidth(),mx_internal::closeButton.getExplicitOrMeasuredHeight());
               mx_internal::closeButton.move(param1 - _loc6_ - _loc5_.right - 10 - mx_internal::closeButton.getExplicitOrMeasuredWidth(),(_loc8_ - mx_internal::closeButton.getExplicitOrMeasuredHeight()) / 2);
            }
            _loc11_ = 10;
            _loc12_ = 10;
            if(mx_internal::titleIconObject)
            {
               _loc13_ = 0;
               _loc14_ = (_loc8_ - _loc13_) / 2;
               mx_internal::titleIconObject.move(_loc11_,_loc14_);
               _loc11_ += NaN;
            }
            if(false)
            {
               _loc13_ = 0;
            }
            else
            {
               _loc13_ = titleTextField.getUITextFormat().measureText(titleTextField.text).height;
            }
            _loc14_ = (_loc8_ - _loc13_) / 2;
            _loc15_ = _loc5_.left + _loc5_.right;
            titleTextField.move(_loc11_,_loc14_ - 1);
            titleTextField.setActualSize(Math.max(0,param1 - _loc11_ - _loc12_ - _loc15_),_loc13_ + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
            if(false)
            {
               _loc13_ = 0;
            }
            else
            {
               _loc13_ = statusTextField.text != "" ? statusTextField.getUITextFormat().measureText(statusTextField.text).height : 0;
            }
            _loc14_ = (_loc8_ - _loc13_) / 2;
            _loc16_ = param1 - _loc12_ - 4 - _loc15_ - 0;
            if(mx_internal::_showCloseButton)
            {
               _loc16_ -= mx_internal::closeButton.getExplicitOrMeasuredWidth() + 4;
            }
            statusTextField.move(_loc16_,_loc14_ - 1);
            statusTextField.setActualSize(NaN,NaN);
            _loc17_ = NaN;
            if(statusTextField.x < _loc17_)
            {
               statusTextField.width = Math.max(0 - (_loc17_ - 0),0);
               statusTextField.x = _loc17_;
            }
         }
         else if(titleBar)
         {
            showTitleBar(false);
            titleBar.mouseChildren = false;
            titleBar.mouseEnabled = false;
         }
         if(controlBar)
         {
            _loc18_ = 0;
            _loc19_ = 0;
            _loc20_ = 0;
            _loc21_ = 0;
            controlBar.setActualSize(param1 - (_loc5_.left + _loc5_.right),controlBar.getExplicitOrMeasuredHeight());
            controlBar.move(_loc5_.left,param2 - _loc5_.bottom - controlBar.getExplicitOrMeasuredHeight());
            if(false)
            {
               controlBar.visible = controlBar.y >= _loc5_.top;
            }
            if(_loc18_ != controlBar.x || _loc19_ != controlBar.y || _loc20_ != controlBar.width || _loc21_ != controlBar.height)
            {
               invalidateDisplayList();
            }
         }
      }
      
      public function set layout(param1:String) : void
      {
         if(_layout != param1)
         {
            _layout = param1;
            if(layoutObject)
            {
               layoutObject.target = null;
            }
            if(_layout == ContainerLayout.ABSOLUTE)
            {
               layoutObject = new CanvasLayout();
            }
            else
            {
               layoutObject = new BoxLayout();
               if(_layout == ContainerLayout.VERTICAL)
               {
                  BoxLayout(layoutObject).direction = BoxDirection.VERTICAL;
               }
               else
               {
                  BoxLayout(layoutObject).direction = BoxDirection.HORIZONTAL;
               }
            }
            if(layoutObject)
            {
               layoutObject.target = this;
            }
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("layoutChanged"));
         }
      }
      
      public function get constraintRows() : Array
      {
         return _constraintRows;
      }
      
      [Bindable("titleChanged")]
      public function get title() : String
      {
         return _title;
      }
      
      mx_internal function getTitleTextField() : IUITextField
      {
         return titleTextField;
      }
      
      mx_internal function createStatusTextField(param1:int) : void
      {
         var _loc2_:String = null;
         if(Boolean(titleBar) && !statusTextField)
         {
            statusTextField = IUITextField(createInFontContext(UITextField));
            statusTextField.selectable = false;
            if(param1 == -1)
            {
               titleBar.addChild(DisplayObject(statusTextField));
            }
            else
            {
               titleBar.addChildAt(DisplayObject(statusTextField),param1);
            }
            _loc2_ = getStyle("statusStyleName");
            statusTextField.styleName = _loc2_;
            statusTextField.text = status;
            statusTextField.enabled = enabled;
         }
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      override protected function measure() : void
      {
         var _loc6_:Number = NaN;
         super.measure();
         layoutObject.measure();
         var _loc1_:Rectangle = measureHeaderText();
         var _loc2_:Number = _loc1_.width;
         var _loc3_:Number = _loc1_.height;
         var _loc4_:EdgeMetrics = false ? borderMetrics : EdgeMetrics.EMPTY;
         _loc2_ += _loc4_.left + _loc4_.right;
         var _loc5_:Number = 5;
         _loc2_ += _loc5_ * 2;
         if(mx_internal::titleIconObject)
         {
            _loc2_ += mx_internal::titleIconObject.width;
         }
         if(mx_internal::closeButton)
         {
            _loc2_ += mx_internal::closeButton.getExplicitOrMeasuredWidth() + 6;
         }
         measuredMinWidth = Math.max(_loc2_,measuredMinWidth);
         measuredWidth = Math.max(_loc2_,measuredWidth);
         if(Boolean(controlBar) && false)
         {
            _loc6_ = controlBar.getExplicitOrMeasuredWidth() + _loc4_.left + _loc4_.right;
            measuredWidth = Math.max(measuredWidth,_loc6_);
         }
      }
      
      mx_internal function getControlBar() : IUIComponent
      {
         return controlBar;
      }
      
      override public function get viewMetrics() : EdgeMetrics
      {
         var _loc2_:EdgeMetrics = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:EdgeMetrics = super.viewMetrics;
         if(false)
         {
            if(!panelViewMetrics)
            {
               panelViewMetrics = new EdgeMetrics(0,0,0,0);
            }
            _loc1_ = panelViewMetrics;
            _loc2_ = super.viewMetrics;
            _loc3_ = getStyle("borderThickness");
            _loc4_ = getStyle("borderThicknessLeft");
            _loc5_ = getStyle("borderThicknessTop");
            _loc6_ = getStyle("borderThicknessRight");
            _loc7_ = getStyle("borderThicknessBottom");
            _loc1_.left = _loc2_.left + (isNaN(_loc4_) ? _loc3_ : _loc4_);
            _loc1_.top = _loc2_.top + (isNaN(_loc5_) ? _loc3_ : _loc5_);
            _loc1_.right = _loc2_.right + (isNaN(_loc6_) ? _loc3_ : _loc6_);
            _loc1_.bottom = _loc2_.bottom + (isNaN(_loc7_) ? (Boolean(controlBar) && !isNaN(_loc5_) ? _loc5_ : (isNaN(_loc4_) ? _loc3_ : _loc4_)) : _loc7_);
            _loc8_ = getHeaderHeight();
            if(!isNaN(_loc8_))
            {
               _loc1_.top += _loc8_;
            }
            if(Boolean(controlBar) && false)
            {
               _loc1_.bottom += controlBar.getExplicitOrMeasuredHeight();
            }
         }
         return _loc1_;
      }
      
      private function measureHeaderText() : Rectangle
      {
         var _loc3_:UITextFormat = null;
         var _loc4_:TextLineMetrics = null;
         var _loc1_:Number = 20;
         var _loc2_:Number = 14;
         if(Boolean(titleTextField) && false)
         {
            titleTextField.validateNow();
            _loc3_ = titleTextField.getUITextFormat();
            _loc1_ = (_loc4_ = _loc3_.measureText(titleTextField.text,false)).width;
            _loc2_ = _loc4_.height;
         }
         if(Boolean(statusTextField) && false)
         {
            statusTextField.validateNow();
            _loc3_ = statusTextField.getUITextFormat();
            _loc4_ = _loc3_.measureText(statusTextField.text,false);
            _loc1_ = Math.max(_loc1_,_loc4_.width);
            _loc2_ = Math.max(_loc2_,_loc4_.height);
         }
         return new Rectangle(0,0,Math.round(_loc1_),Math.round(_loc2_));
      }
      
      mx_internal function createTitleTextField(param1:int) : void
      {
         var _loc2_:String = null;
         if(!titleTextField)
         {
            titleTextField = IUITextField(createInFontContext(UITextField));
            titleTextField.selectable = false;
            if(param1 == -1)
            {
               titleBar.addChild(DisplayObject(titleTextField));
            }
            else
            {
               titleBar.addChildAt(DisplayObject(titleTextField),param1);
            }
            _loc2_ = getStyle("titleStyleName");
            titleTextField.styleName = _loc2_;
            titleTextField.text = title;
            titleTextField.enabled = enabled;
         }
      }
      
      private function closeButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
      }
      
      private function setControlBar(param1:IUIComponent) : void
      {
         if(param1 == controlBar)
         {
            return;
         }
         controlBar = param1;
         if(!checkedForAutoSetRoundedCorners)
         {
            checkedForAutoSetRoundedCorners = true;
            autoSetRoundedCorners = !!styleDeclaration ? styleDeclaration.getStyle("roundedBottomCorners") === undefined : true;
         }
         if(autoSetRoundedCorners)
         {
            setStyle("roundedBottomCorners",controlBar != null);
         }
         var _loc2_:String = getStyle("controlBarStyleName");
         if(Boolean(_loc2_) && controlBar is ISimpleStyleClient)
         {
            ISimpleStyleClient(controlBar).styleName = _loc2_;
         }
         if(controlBar)
         {
            controlBar.enabled = enabled;
         }
         if(controlBar is IAutomationObject)
         {
            IAutomationObject(controlBar).showInAutomationHierarchy = false;
         }
         mx_internal::invalidateViewMetricsAndPadding();
         invalidateSize();
         invalidateDisplayList();
      }
      
      protected function get closeButtonStyleFilters() : Object
      {
         return _closeButtonStyleFilters;
      }
      
      public function set constraintColumns(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 != _constraintColumns)
         {
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               ConstraintColumn(param1[_loc3_]).container = this;
               _loc3_++;
            }
            _constraintColumns = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(titleTextField)
         {
            titleTextField.enabled = param1;
         }
         if(statusTextField)
         {
            statusTextField.enabled = param1;
         }
         if(controlBar)
         {
            controlBar.enabled = param1;
         }
         if(mx_internal::closeButton)
         {
            mx_internal::closeButton.enabled = param1;
         }
      }
      
      override public function get baselinePosition() : Number
      {
         if(false)
         {
            return super.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         return NaN;
      }
      
      protected function stopDragging() : void
      {
         var _loc1_:DisplayObject = systemManager.getSandboxRoot();
         _loc1_.removeEventListener(MouseEvent.MOUSE_MOVE,systemManager_mouseMoveHandler,true);
         _loc1_.removeEventListener(MouseEvent.MOUSE_UP,systemManager_mouseUpHandler,true);
         _loc1_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,stage_mouseLeaveHandler);
         regX = NaN;
         regY = NaN;
         systemManager.deployMouseShields(false);
      }
      
      private function titleBar_mouseDownHandler(param1:MouseEvent) : void
      {
         if(param1.target == mx_internal::closeButton)
         {
            return;
         }
         if(enabled && isPopUp && isNaN(regX))
         {
            startDragging(param1);
         }
      }
      
      override mx_internal function get usePadding() : Boolean
      {
         return layout != ContainerLayout.ABSOLUTE;
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            Panel.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      protected function getHeaderHeight() : Number
      {
         var _loc1_:Number = getStyle("headerHeight");
         if(isNaN(_loc1_))
         {
            _loc1_ = measureHeaderText().height + HEADER_PADDING;
         }
         return _loc1_;
      }
      
      public function set constraintRows(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 != _constraintRows)
         {
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               ConstraintRow(param1[_loc3_]).container = this;
               _loc3_++;
            }
            _constraintRows = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
         _titleChanged = true;
         invalidateProperties();
         invalidateSize();
         mx_internal::invalidateViewMetricsAndPadding();
         dispatchEvent(new Event("titleChanged"));
      }
      
      private function showTitleBar(param1:Boolean) : void
      {
         var _loc4_:DisplayObject = null;
         titleBar.visible = param1;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = titleBar.getChildAt(_loc3_)).visible = param1;
            _loc3_++;
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Class = null;
         var _loc7_:IStyleClient = null;
         var _loc8_:ISimpleStyleClient = null;
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         super.styleChanged(param1);
         if(_loc2_ || param1 == "titleStyleName")
         {
            if(titleTextField)
            {
               _loc3_ = getStyle("titleStyleName");
               titleTextField.styleName = _loc3_;
            }
         }
         if(_loc2_ || param1 == "statusStyleName")
         {
            if(statusTextField)
            {
               _loc4_ = getStyle("statusStyleName");
               statusTextField.styleName = _loc4_;
            }
         }
         if(_loc2_ || param1 == "controlBarStyleName")
         {
            if(Boolean(controlBar) && controlBar is ISimpleStyleClient)
            {
               _loc5_ = getStyle("controlBarStyleName");
               ISimpleStyleClient(controlBar).styleName = _loc5_;
            }
         }
         if(_loc2_ || param1 == "titleBackgroundSkin")
         {
            if(titleBar)
            {
               if(_loc6_ = getStyle("titleBackgroundSkin"))
               {
                  if(mx_internal::titleBarBackground)
                  {
                     titleBar.removeChild(DisplayObject(mx_internal::titleBarBackground));
                     mx_internal::titleBarBackground = null;
                  }
                  mx_internal::titleBarBackground = new _loc6_();
                  if(_loc7_ = mx_internal::titleBarBackground as IStyleClient)
                  {
                     _loc7_.setStyle("backgroundImage",undefined);
                  }
                  if(_loc8_ = mx_internal::titleBarBackground as ISimpleStyleClient)
                  {
                     _loc8_.styleName = this;
                  }
                  titleBar.addChildAt(DisplayObject(mx_internal::titleBarBackground),0);
               }
            }
         }
      }
      
      mx_internal function getStatusTextField() : IUITextField
      {
         return statusTextField;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         super.commitProperties();
         if(hasFontContextChanged())
         {
            if(titleTextField)
            {
               _loc1_ = titleBar.getChildIndex(DisplayObject(titleTextField));
               mx_internal::removeTitleTextField();
               mx_internal::createTitleTextField(_loc1_);
               _titleChanged = true;
            }
            if(statusTextField)
            {
               _loc1_ = titleBar.getChildIndex(DisplayObject(statusTextField));
               mx_internal::removeStatusTextField();
               mx_internal::createStatusTextField(_loc1_);
               _statusChanged = true;
            }
         }
         if(_titleChanged)
         {
            _titleChanged = false;
            titleTextField.text = _title;
            if(initialized)
            {
               layoutChrome(unscaledWidth,unscaledHeight);
            }
         }
         if(_titleIconChanged)
         {
            _titleIconChanged = false;
            if(mx_internal::titleIconObject)
            {
               titleBar.removeChild(DisplayObject(mx_internal::titleIconObject));
               mx_internal::titleIconObject = null;
            }
            if(_titleIcon)
            {
               mx_internal::titleIconObject = new _titleIcon();
               titleBar.addChild(DisplayObject(mx_internal::titleIconObject));
            }
            if(initialized)
            {
               layoutChrome(unscaledWidth,unscaledHeight);
            }
         }
         if(_statusChanged)
         {
            _statusChanged = false;
            statusTextField.text = _status;
            if(initialized)
            {
               layoutChrome(unscaledWidth,unscaledHeight);
            }
         }
      }
      
      protected function startDragging(param1:MouseEvent) : void
      {
         regX = param1.stageX - x;
         regY = param1.stageY - y;
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,systemManager_mouseMoveHandler,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,systemManager_mouseUpHandler,true);
         _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,stage_mouseLeaveHandler);
         systemManager.deployMouseShields(true);
      }
      
      mx_internal function removeStatusTextField() : void
      {
         if(Boolean(titleBar) && Boolean(statusTextField))
         {
            titleBar.removeChild(DisplayObject(statusTextField));
            statusTextField = null;
         }
      }
      
      private function stage_mouseLeaveHandler(param1:Event) : void
      {
         if(!isNaN(regX))
         {
            stopDragging();
         }
      }
      
      public function set status(param1:String) : void
      {
         _status = param1;
         _statusChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("statusChanged"));
      }
      
      [Bindable("titleIconChanged")]
      public function get titleIcon() : Class
      {
         return _titleIcon;
      }
      
      [Bindable("statusChanged")]
      public function get status() : String
      {
         return _status;
      }
      
      private function systemManager_mouseMoveHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         if(isNaN(regX) || isNaN(regY))
         {
            return;
         }
         move(param1.stageX - regX,param1.stageY - regY);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         layoutObject.updateDisplayList(param1,param2);
         if(mx_internal::border)
         {
            mx_internal::border.visible = true;
         }
         titleBar.visible = true;
      }
      
      mx_internal function removeTitleTextField() : void
      {
         if(Boolean(titleBar) && Boolean(titleTextField))
         {
            titleBar.removeChild(DisplayObject(titleTextField));
            titleTextField = null;
         }
      }
      
      public function set titleIcon(param1:Class) : void
      {
         _titleIcon = param1;
         _titleIconChanged = true;
         invalidateProperties();
         invalidateSize();
         dispatchEvent(new Event("titleIconChanged"));
      }
   }
}
