package mx.controls
{
   import flash.accessibility.AccessibilityProperties;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.TextEvent;
   import flash.system.IME;
   import flash.system.IMEConversionMode;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IDataRenderer;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IIMESupport;
   import mx.core.IInvalidating;
   import mx.core.IRectangularBorder;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.managers.IFocusManager;
   import mx.managers.IFocusManagerComponent;
   import mx.styles.ISimpleStyleClient;
   
   public class TextInput extends UIComponent implements IDataRenderer, IDropInListItemRenderer, IFocusManagerComponent, IIMESupport, IListItemRenderer, IFontContextComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _text:String = "";
      
      private var _textWidth:Number;
      
      private var _restrict:String;
      
      private var htmlTextChanged:Boolean = false;
      
      mx_internal var border:IFlexDisplayObject;
      
      private var enabledChanged:Boolean = false;
      
      private var _maxChars:int = 0;
      
      private var _condenseWhite:Boolean = false;
      
      private var accessibilityPropertiesChanged:Boolean = false;
      
      private var _textHeight:Number;
      
      private var displayAsPasswordChanged:Boolean = false;
      
      private var prevMode:String = "UNKNOWN";
      
      private var selectableChanged:Boolean = false;
      
      private var restrictChanged:Boolean = false;
      
      private var selectionChanged:Boolean = false;
      
      private var _data:Object;
      
      private var maxCharsChanged:Boolean = false;
      
      private var _tabIndex:int = -1;
      
      private var errorCaught:Boolean = false;
      
      private var _selectionBeginIndex:int = 0;
      
      private var explicitHTMLText:String = null;
      
      private var editableChanged:Boolean = false;
      
      mx_internal var parentDrawsFocus:Boolean = false;
      
      private var tabIndexChanged:Boolean = false;
      
      private var _horizontalScrollPosition:Number = 0;
      
      private var _editable:Boolean = true;
      
      private var _imeMode:String = null;
      
      private var condenseWhiteChanged:Boolean = false;
      
      protected var textField:IUITextField;
      
      private var _listData:BaseListData;
      
      private var _displayAsPassword:Boolean = false;
      
      private var textChanged:Boolean = false;
      
      private var _htmlText:String = "";
      
      private var _accessibilityProperties:AccessibilityProperties;
      
      private var _selectionEndIndex:int = 0;
      
      private var textSet:Boolean;
      
      private var horizontalScrollPositionChanged:Boolean = false;
      
      private var _selectable:Boolean = true;
      
      public function TextInput()
      {
         super();
         tabChildren = true;
      }
      
      public function get imeMode() : String
      {
         return _imeMode;
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         if(_imeMode != null && _editable)
         {
            if(false && prevMode != IMEConversionMode.UNKNOWN)
            {
               IME.conversionMode = prevMode;
            }
            IME.enabled = false;
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         if(mx_internal::parentDrawsFocus)
         {
            IFocusManagerComponent(parent).drawFocus(param1);
            return;
         }
         super.drawFocus(param1);
      }
      
      mx_internal function getTextField() : IUITextField
      {
         return textField;
      }
      
      private function textField_textInputHandler(param1:TextEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:TextEvent = new TextEvent(TextEvent.TEXT_INPUT,false,true);
         _loc2_.text = param1.text;
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
      
      override public function get accessibilityProperties() : AccessibilityProperties
      {
         return _accessibilityProperties;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createBorder();
         mx_internal::createTextField(-1);
      }
      
      private function textFieldChanged(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:* = false;
         var _loc4_:* = false;
         if(!param1)
         {
            _loc3_ = _text != textField.text;
            _text = textField.text;
         }
         _loc4_ = _htmlText != textField.htmlText;
         _htmlText = textField.htmlText;
         if(_loc3_)
         {
            dispatchEvent(new Event("textChanged"));
            if(param2)
            {
               dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            }
         }
         if(_loc4_)
         {
            dispatchEvent(new Event("htmlTextChanged"));
         }
         _textWidth = textField.textWidth;
         _textHeight = textField.textHeight;
      }
      
      [NonCommittingChangeEvent("change")]
      [Bindable("textChanged")]
      public function get text() : String
      {
         return _text;
      }
      
      mx_internal function createTextField(param1:int) : void
      {
         if(!textField)
         {
            textField = IUITextField(createInFontContext(UITextField));
            textField.autoSize = TextFieldAutoSize.NONE;
            textField.enabled = enabled;
            textField.ignorePadding = false;
            textField.multiline = false;
            textField.tabEnabled = true;
            textField.wordWrap = false;
            if(false)
            {
               textField.styleName = this;
            }
            textField.addEventListener(Event.CHANGE,textField_changeHandler);
            textField.addEventListener(TextEvent.TEXT_INPUT,textField_textInputHandler);
            textField.addEventListener(Event.SCROLL,textField_scrollHandler);
            textField.addEventListener("textFieldStyleChange",textField_textFieldStyleChangeHandler);
            textField.addEventListener("textFormatChange",textField_textFormatChangeHandler);
            textField.addEventListener("textInsert",textField_textModifiedHandler);
            textField.addEventListener("textReplace",textField_textModifiedHandler);
            textField.addEventListener("nativeDragDrop",textField_nativeDragDropHandler);
            if(param1 == -1)
            {
               addChild(DisplayObject(textField));
            }
            else
            {
               addChildAt(DisplayObject(textField),param1);
            }
         }
      }
      
      override public function get tabIndex() : int
      {
         return _tabIndex;
      }
      
      override public function set accessibilityProperties(param1:AccessibilityProperties) : void
      {
         if(param1 == _accessibilityProperties)
         {
            return;
         }
         _accessibilityProperties = param1;
         accessibilityPropertiesChanged = true;
         invalidateProperties();
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         _selectionBeginIndex = param1;
         _selectionEndIndex = param2;
         selectionChanged = true;
         invalidateProperties();
      }
      
      [Bindable("condenseWhiteChanged")]
      public function get condenseWhite() : Boolean
      {
         return _condenseWhite;
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == textField || super.isOurFocus(param1);
      }
      
      [Bindable("displayAsPasswordChanged")]
      public function get displayAsPassword() : Boolean
      {
         return _displayAsPassword;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:* = undefined;
         _data = param1;
         if(_listData)
         {
            _loc2_ = _listData.label;
         }
         else if(_data != null)
         {
            if(_data is String)
            {
               _loc2_ = String(_data);
            }
            else
            {
               _loc2_ = _data.toString();
            }
         }
         if(_loc2_ !== undefined && !textSet)
         {
            text = _loc2_;
            textSet = false;
            textField.setSelection(0,0);
         }
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      public function get selectionBeginIndex() : int
      {
         return !!textField ? 0 : _selectionBeginIndex;
      }
      
      mx_internal function get selectable() : Boolean
      {
         return _selectable;
      }
      
      protected function createBorder() : void
      {
         var _loc1_:Class = null;
         if(!mx_internal::border)
         {
            _loc1_ = getStyle("borderSkin");
            if(_loc1_ != null)
            {
               mx_internal::border = new _loc1_();
               if(mx_internal::border is ISimpleStyleClient)
               {
                  ISimpleStyleClient(mx_internal::border).styleName = this;
               }
               addChildAt(DisplayObject(mx_internal::border),0);
               invalidateDisplayList();
            }
         }
      }
      
      [Bindable("horizontalScrollPositionChanged")]
      public function get horizontalScrollPosition() : Number
      {
         return _horizontalScrollPosition;
      }
      
      override protected function measure() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:TextLineMetrics = null;
         super.measure();
         var _loc1_:EdgeMetrics = Boolean(mx_internal::border) && mx_internal::border is IRectangularBorder ? IRectangularBorder(mx_internal::border).borderMetrics : EdgeMetrics.EMPTY;
         measuredWidth = DEFAULT_MEASURED_WIDTH;
         if(maxChars)
         {
            measuredWidth = Math.min(measuredWidth,measureText("W").width * maxChars + _loc1_.left + _loc1_.right + 8);
         }
         if(!text || text == "")
         {
            _loc2_ = DEFAULT_MEASURED_MIN_WIDTH;
            _loc3_ = measureText(" ").height + _loc1_.top + _loc1_.bottom + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
            if(true)
            {
               _loc3_ += getStyle("paddingTop") + getStyle("paddingBottom");
            }
         }
         else
         {
            _loc2_ = (_loc4_ = measureText(text)).width + _loc1_.left + _loc1_.right + 8;
            _loc3_ = _loc4_.height + _loc1_.top + _loc1_.bottom + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
            if(true)
            {
               _loc2_ += getStyle("paddingLeft") + getStyle("paddingRight");
               _loc3_ += getStyle("paddingTop") + getStyle("paddingBottom");
            }
         }
         measuredWidth = Math.max(_loc2_,measuredWidth);
         measuredHeight = Math.max(_loc3_,DEFAULT_MEASURED_HEIGHT);
         measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
         measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      public function set text(param1:String) : void
      {
         textSet = true;
         if(!param1)
         {
            param1 = "";
         }
         if(!isHTML && param1 == _text)
         {
            return;
         }
         _text = param1;
         textChanged = true;
         _htmlText = null;
         explicitHTMLText = null;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("textChanged"));
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      public function get selectionEndIndex() : int
      {
         return !!textField ? 0 : _selectionEndIndex;
      }
      
      [Bindable("editableChanged")]
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      [Bindable("dataChange")]
      public function get listData() : BaseListData
      {
         return _listData;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               dispatchEvent(new FlexEvent(FlexEvent.ENTER));
               if(textChanged || htmlTextChanged)
               {
                  validateNow();
               }
         }
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         var fm:IFocusManager;
         var message:String = null;
         var event:FocusEvent = param1;
         if(event.target == this)
         {
            systemManager.stage.focus = TextField(textField);
         }
         fm = focusManager;
         if(editable && Boolean(fm))
         {
            fm.showFocusIndicator = true;
            if(false && _selectionBeginIndex == _selectionEndIndex)
            {
               textField.setSelection(0,textField.length);
            }
         }
         super.focusInHandler(event);
         if(_imeMode != null && _editable)
         {
            IME.enabled = true;
            prevMode = IME.conversionMode;
            try
            {
               if(!errorCaught && false)
               {
                  IME.conversionMode = _imeMode;
               }
               errorCaught = false;
            }
            catch(e:Error)
            {
               errorCaught = true;
               message = String(resourceManager.getString("controls","unsupportedMode",[_imeMode]));
               throw new Error(message);
            }
         }
      }
      
      [NonCommittingChangeEvent("change")]
      [Bindable("htmlTextChanged")]
      public function get htmlText() : String
      {
         return _htmlText;
      }
      
      override public function set tabIndex(param1:int) : void
      {
         if(param1 == _tabIndex)
         {
            return;
         }
         _tabIndex = param1;
         tabIndexChanged = true;
         invalidateProperties();
      }
      
      public function set restrict(param1:String) : void
      {
         if(param1 == _restrict)
         {
            return;
         }
         _restrict = param1;
         restrictChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("restrictChanged"));
      }
      
      private function textField_textFieldStyleChangeHandler(param1:Event) : void
      {
         textFieldChanged(true,false);
      }
      
      private function textField_nativeDragDropHandler(param1:Event) : void
      {
         textField_changeHandler(param1);
      }
      
      private function textField_changeHandler(param1:Event) : void
      {
         textFieldChanged(false,false);
         textChanged = false;
         htmlTextChanged = false;
         param1.stopImmediatePropagation();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(param1 == enabled)
         {
            return;
         }
         super.enabled = param1;
         enabledChanged = true;
         invalidateProperties();
         if(Boolean(mx_internal::border) && mx_internal::border is IInvalidating)
         {
            IInvalidating(mx_internal::border).invalidateDisplayList();
         }
      }
      
      override public function get baselinePosition() : Number
      {
         var _loc1_:String = null;
         if(false)
         {
            _loc1_ = text;
            if(_loc1_ == "")
            {
               _loc1_ = " ";
            }
            return (Boolean(mx_internal::border) && mx_internal::border is IRectangularBorder ? IRectangularBorder(mx_internal::border).borderMetrics.top : 0) + measureText(_loc1_).ascent;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         return NaN;
      }
      
      public function set condenseWhite(param1:Boolean) : void
      {
         if(param1 == _condenseWhite)
         {
            return;
         }
         _condenseWhite = param1;
         condenseWhiteChanged = true;
         if(isHTML)
         {
            htmlTextChanged = true;
         }
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("condenseWhiteChanged"));
      }
      
      public function get textWidth() : Number
      {
         return _textWidth;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         if(param1 == _displayAsPassword)
         {
            return;
         }
         _displayAsPassword = param1;
         displayAsPasswordChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("displayAsPasswordChanged"));
      }
      
      mx_internal function removeTextField() : void
      {
         if(textField)
         {
            textField.removeEventListener(Event.CHANGE,textField_changeHandler);
            textField.removeEventListener(TextEvent.TEXT_INPUT,textField_textInputHandler);
            textField.removeEventListener(Event.SCROLL,textField_scrollHandler);
            textField.removeEventListener("textFieldStyleChange",textField_textFieldStyleChangeHandler);
            textField.removeEventListener("textFormatChange",textField_textFormatChangeHandler);
            textField.removeEventListener("textInsert",textField_textModifiedHandler);
            textField.removeEventListener("textReplace",textField_textModifiedHandler);
            textField.removeEventListener("nativeDragDrop",textField_nativeDragDropHandler);
            removeChild(DisplayObject(textField));
            textField = null;
         }
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      public function set maxChars(param1:int) : void
      {
         if(param1 == _maxChars)
         {
            return;
         }
         _maxChars = param1;
         maxCharsChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("maxCharsChanged"));
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(param1 == _horizontalScrollPosition)
         {
            return;
         }
         _horizontalScrollPosition = param1;
         horizontalScrollPositionChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("horizontalScrollPositionChanged"));
      }
      
      override public function setFocus() : void
      {
         textField.setFocus();
      }
      
      [Bindable("restrictChanged")]
      public function get restrict() : String
      {
         return _restrict;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      public function set selectionBeginIndex(param1:int) : void
      {
         _selectionBeginIndex = param1;
         selectionChanged = true;
         invalidateProperties();
      }
      
      public function set selectionEndIndex(param1:int) : void
      {
         _selectionEndIndex = param1;
         selectionChanged = true;
         invalidateProperties();
      }
      
      private function textField_scrollHandler(param1:Event) : void
      {
         _horizontalScrollPosition = textField.scrollH;
      }
      
      public function get textHeight() : Number
      {
         return _textHeight;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(param1 == _editable)
         {
            return;
         }
         _editable = param1;
         editableChanged = true;
         invalidateProperties();
         dispatchEvent(new Event("editableChanged"));
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         super.commitProperties();
         if(hasFontContextChanged() && textField != null)
         {
            _loc1_ = getChildIndex(DisplayObject(textField));
            mx_internal::removeTextField();
            mx_internal::createTextField(_loc1_);
            accessibilityPropertiesChanged = true;
            condenseWhiteChanged = true;
            displayAsPasswordChanged = true;
            enabledChanged = true;
            maxCharsChanged = true;
            restrictChanged = true;
            tabIndexChanged = true;
            textChanged = true;
            selectionChanged = true;
            horizontalScrollPositionChanged = true;
         }
         if(accessibilityPropertiesChanged)
         {
            textField.accessibilityProperties = _accessibilityProperties;
            accessibilityPropertiesChanged = false;
         }
         if(condenseWhiteChanged)
         {
            textField.condenseWhite = _condenseWhite;
            condenseWhiteChanged = false;
         }
         if(displayAsPasswordChanged)
         {
            textField.displayAsPassword = _displayAsPassword;
            displayAsPasswordChanged = false;
         }
         if(enabledChanged || editableChanged)
         {
            textField.type = enabled && _editable ? "null" : TextFieldType.DYNAMIC;
            if(enabledChanged)
            {
               if(textField.enabled != enabled)
               {
                  textField.enabled = enabled;
               }
               enabledChanged = false;
            }
            selectableChanged = true;
            editableChanged = false;
         }
         if(selectableChanged)
         {
            if(_editable)
            {
               textField.selectable = enabled;
            }
            else
            {
               textField.selectable = enabled && _selectable;
            }
            selectableChanged = false;
         }
         if(maxCharsChanged)
         {
            textField.maxChars = _maxChars;
            maxCharsChanged = false;
         }
         if(restrictChanged)
         {
            textField.restrict = _restrict;
            restrictChanged = false;
         }
         if(tabIndexChanged)
         {
            textField.tabIndex = _tabIndex;
            tabIndexChanged = false;
         }
         if(textChanged || htmlTextChanged)
         {
            if(isHTML)
            {
               textField.htmlText = explicitHTMLText;
            }
            else
            {
               textField.text = _text;
            }
            textFieldChanged(false,true);
            textChanged = false;
            htmlTextChanged = false;
         }
         if(selectionChanged)
         {
            textField.setSelection(_selectionBeginIndex,_selectionEndIndex);
            selectionChanged = false;
         }
         if(horizontalScrollPositionChanged)
         {
            textField.scrollH = _horizontalScrollPosition;
            horizontalScrollPositionChanged = false;
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Boolean = param1 == null || param1 == "styleName";
         super.styleChanged(param1);
         if(_loc2_ || param1 == "borderSkin")
         {
            if(mx_internal::border)
            {
               removeChild(DisplayObject(mx_internal::border));
               mx_internal::border = null;
               createBorder();
            }
         }
      }
      
      private function get isHTML() : Boolean
      {
         return explicitHTMLText != null;
      }
      
      [Bindable("maxCharsChanged")]
      public function get maxChars() : int
      {
         return _maxChars;
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         return !!textField ? 0 : 0;
      }
      
      mx_internal function set selectable(param1:Boolean) : void
      {
         if(_selectable == param1)
         {
            return;
         }
         _selectable = param1;
         selectableChanged = true;
         invalidateProperties();
      }
      
      public function get length() : int
      {
         return text != null ? 0 : -1;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         _listData = param1;
      }
      
      private function textField_textModifiedHandler(param1:Event) : void
      {
         textFieldChanged(false,true);
      }
      
      private function textField_textFormatChangeHandler(param1:Event) : void
      {
         textFieldChanged(true,false);
      }
      
      public function set htmlText(param1:String) : void
      {
         textSet = true;
         if(!param1)
         {
            param1 = "";
         }
         _htmlText = param1;
         htmlTextChanged = true;
         _text = null;
         explicitHTMLText = param1;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("htmlTextChanged"));
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:EdgeMetrics = null;
         super.updateDisplayList(param1,param2);
         if(mx_internal::border)
         {
            mx_internal::border.setActualSize(param1,param2);
            _loc3_ = mx_internal::border is IRectangularBorder ? IRectangularBorder(mx_internal::border).borderMetrics : EdgeMetrics.EMPTY;
         }
         else
         {
            _loc3_ = EdgeMetrics.EMPTY;
         }
         var _loc4_:Number = getStyle("paddingLeft");
         var _loc5_:Number = getStyle("paddingRight");
         var _loc6_:Number = getStyle("paddingTop");
         var _loc7_:Number = getStyle("paddingBottom");
         var _loc8_:Number = _loc3_.left + _loc3_.right;
         var _loc9_:Number = _loc3_.top + _loc3_.bottom + 1;
         textField.x = _loc3_.left;
         textField.y = _loc3_.top;
         if(true)
         {
            textField.x += _loc4_;
            textField.y += _loc6_;
            _loc8_ += _loc4_ + _loc5_;
            _loc9_ += _loc6_ + _loc7_;
         }
         textField.width = Math.max(0,param1 - _loc8_);
         textField.height = Math.max(0,param2 - _loc9_);
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return !!textField ? textField.getLineMetrics(param1) : null;
      }
   }
}
