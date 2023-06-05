package mx.controls
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextLineMetrics;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.FlexVersion;
   import mx.core.IDataRenderer;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class Label extends UIComponent implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer, IFontContextComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _selectable:Boolean = false;
      
      private var _text:String = "";
      
      private var _data:Object;
      
      mx_internal var htmlTextChanged:Boolean = false;
      
      private var _tabIndex:int = -1;
      
      private var styleSheetChanged:Boolean = false;
      
      private var explicitHTMLText:String = null;
      
      private var _textWidth:Number;
      
      private var enabledChanged:Boolean = false;
      
      private var condenseWhiteChanged:Boolean = false;
      
      private var _listData:BaseListData;
      
      protected var textField:IUITextField;
      
      private var _htmlText:String = "";
      
      private var _condenseWhite:Boolean = false;
      
      private var _textHeight:Number;
      
      private var _styleSheet:StyleSheet;
      
      mx_internal var textChanged:Boolean = false;
      
      public var truncateToFit:Boolean = true;
      
      private var textSet:Boolean;
      
      private var selectableChanged:Boolean;
      
      private var toolTipSet:Boolean = false;
      
      public function Label()
      {
         super();
         tabChildren = true;
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
      }
      
      private function textField_textFieldStyleChangeHandler(param1:Event) : void
      {
         textFieldChanged(true);
      }
      
      override public function get baselinePosition() : Number
      {
         var _loc1_:String = null;
         var _loc2_:TextLineMetrics = null;
         if(false)
         {
            if(!textField)
            {
               return NaN;
            }
            validateNow();
            _loc1_ = isHTML ? explicitHTMLText : text;
            if(_loc1_ == "")
            {
               _loc1_ = " ";
            }
            _loc2_ = isHTML ? measureHTMLText(_loc1_) : measureText(_loc1_);
            return textField.y + _loc2_.ascent;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         return NaN;
      }
      
      private function textField_textModifiedHandler(param1:Event) : void
      {
         textFieldChanged(false);
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
            mx_internal::htmlTextChanged = true;
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
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!textField)
         {
            mx_internal::createTextField(-1);
         }
      }
      
      mx_internal function getTextField() : IUITextField
      {
         return textField;
      }
      
      private function measureTextFieldBounds(param1:String) : Rectangle
      {
         var _loc2_:TextLineMetrics = isHTML ? measureHTMLText(param1) : measureText(param1);
         return new Rectangle(0,0,_loc2_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING,_loc2_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
      }
      
      mx_internal function getMinimumText(param1:String) : String
      {
         if(!param1 || param1.length < 2)
         {
            param1 = "Wj";
         }
         return param1;
      }
      
      private function textFieldChanged(param1:Boolean) : void
      {
         var _loc2_:* = false;
         var _loc3_:* = false;
         if(!param1)
         {
            _loc2_ = _text != textField.text;
            _text = textField.text;
         }
         _loc3_ = _htmlText != textField.htmlText;
         _htmlText = textField.htmlText;
         if(_loc2_)
         {
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
         }
         if(_loc3_)
         {
            dispatchEvent(new Event("htmlTextChanged"));
         }
         _textWidth = textField.textWidth;
         _textHeight = textField.textHeight;
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      [Bindable("valueCommit")]
      public function get text() : String
      {
         return _text;
      }
      
      public function get textHeight() : Number
      {
         return _textHeight;
      }
      
      public function get styleSheet() : StyleSheet
      {
         return _styleSheet;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(param1 == selectable)
         {
            return;
         }
         _selectable = param1;
         selectableChanged = true;
         invalidateProperties();
      }
      
      override public function get tabIndex() : int
      {
         return _tabIndex;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      mx_internal function removeTextField() : void
      {
         if(textField)
         {
            textField.removeEventListener("textFieldStyleChange",textField_textFieldStyleChangeHandler);
            textField.removeEventListener("textInsert",textField_textModifiedHandler);
            textField.removeEventListener("textReplace",textField_textModifiedHandler);
            removeChild(DisplayObject(textField));
            textField = null;
         }
      }
      
      override public function set toolTip(param1:String) : void
      {
         super.toolTip = param1;
         toolTipSet = param1 != null;
      }
      
      mx_internal function createTextField(param1:int) : void
      {
         if(!textField)
         {
            textField = IUITextField(createInFontContext(UITextField));
            textField.enabled = enabled;
            textField.ignorePadding = true;
            textField.selectable = selectable;
            textField.styleName = this;
            textField.addEventListener("textFieldStyleChange",textField_textFieldStyleChangeHandler);
            textField.addEventListener("textInsert",textField_textModifiedHandler);
            textField.addEventListener("textReplace",textField_textModifiedHandler);
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
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(hasFontContextChanged() && textField != null)
         {
            mx_internal::removeTextField();
            condenseWhiteChanged = true;
            enabledChanged = true;
            selectableChanged = true;
            mx_internal::textChanged = true;
         }
         if(!textField)
         {
            mx_internal::createTextField(-1);
         }
         if(condenseWhiteChanged)
         {
            textField.condenseWhite = _condenseWhite;
            condenseWhiteChanged = false;
         }
         textField.tabIndex = tabIndex;
         if(enabledChanged)
         {
            textField.enabled = enabled;
            enabledChanged = false;
         }
         if(selectableChanged)
         {
            textField.selectable = _selectable;
            selectableChanged = false;
         }
         if(styleSheetChanged)
         {
            textField.styleSheet = _styleSheet;
            styleSheetChanged = false;
         }
         if(mx_internal::textChanged || mx_internal::htmlTextChanged)
         {
            if(isHTML)
            {
               textField.htmlText = explicitHTMLText;
            }
            else
            {
               textField.text = _text;
            }
            textFieldChanged(false);
            mx_internal::textChanged = false;
            mx_internal::htmlTextChanged = false;
         }
      }
      
      [Bindable("condenseWhiteChanged")]
      public function get condenseWhite() : Boolean
      {
         return _condenseWhite;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         _listData = param1;
      }
      
      private function get isHTML() : Boolean
      {
         return explicitHTMLText != null;
      }
      
      public function get selectable() : Boolean
      {
         return _selectable;
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
         mx_internal::textChanged = true;
         _htmlText = null;
         explicitHTMLText = null;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
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
         }
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:String = isHTML ? explicitHTMLText : text;
         _loc1_ = mx_internal::getMinimumText(_loc1_);
         var _loc2_:Rectangle = measureTextFieldBounds(_loc1_);
         var _loc3_:* = _loc2_.width + getStyle("paddingLeft") + getStyle("paddingRight");
         measuredWidth = _loc2_.width + getStyle("paddingLeft") + getStyle("paddingRight");
         measuredMinWidth = _loc3_;
         _loc3_ = _loc2_.height + getStyle("paddingTop") + getStyle("paddingBottom");
         measuredHeight = _loc2_.height + getStyle("paddingTop") + getStyle("paddingBottom");
         measuredMinHeight = _loc3_;
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      [Bindable("dataChange")]
      public function get listData() : BaseListData
      {
         return _listData;
      }
      
      public function set styleSheet(param1:StyleSheet) : void
      {
         _styleSheet = param1;
         styleSheetChanged = true;
         mx_internal::htmlTextChanged = true;
         invalidateProperties();
      }
      
      public function set htmlText(param1:String) : void
      {
         textSet = true;
         if(!param1)
         {
            param1 = "";
         }
         if(isHTML && param1 == explicitHTMLText)
         {
            return;
         }
         _htmlText = param1;
         mx_internal::htmlTextChanged = true;
         _text = null;
         explicitHTMLText = param1;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("htmlTextChanged"));
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc9_:* = false;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("paddingLeft");
         var _loc4_:Number = getStyle("paddingTop");
         var _loc5_:Number = getStyle("paddingRight");
         var _loc6_:Number = getStyle("paddingBottom");
         textField.setActualSize(param1 - _loc3_ - _loc5_,param2 - _loc4_ - _loc6_);
         textField.x = _loc3_;
         textField.y = _loc4_;
         var _loc7_:String = isHTML ? explicitHTMLText : text;
         var _loc8_:Rectangle = measureTextFieldBounds(_loc7_);
         if(truncateToFit)
         {
            if(isHTML)
            {
               _loc9_ = _loc8_.width > textField.width;
            }
            else
            {
               textField.text = _text;
               _loc9_ = textField.truncateToFit();
            }
            if(!toolTipSet)
            {
               super.toolTip = _loc9_ ? text : null;
            }
         }
      }
      
      [Bindable("htmlTextChanged")]
      public function get htmlText() : String
      {
         return _htmlText;
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return !!textField ? textField.getLineMetrics(param1) : null;
      }
      
      override public function set tabIndex(param1:int) : void
      {
         _tabIndex = param1;
         invalidateProperties();
      }
   }
}
