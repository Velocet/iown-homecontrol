package mx.controls
{
   import flash.display.DisplayObject;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import mx.core.EdgeMetrics;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IRectangularBorder;
   import mx.core.IToolTip;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.styles.ISimpleStyleClient;
   
   public class ToolTip extends UIComponent implements IToolTip, IFontContextComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static var maxWidth:Number = 300;
       
      
      private var textChanged:Boolean;
      
      private var _text:String;
      
      protected var textField:IUITextField;
      
      mx_internal var border:IFlexDisplayObject;
      
      public function ToolTip()
      {
         super();
         mouseEnabled = false;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == "borderStyle" || param1 == "styleName" || param1 == null)
         {
            invalidateDisplayList();
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:TextFormat = null;
         super.commitProperties();
         if(hasFontContextChanged() && textField != null)
         {
            _loc1_ = getChildIndex(DisplayObject(textField));
            mx_internal::removeTextField();
            mx_internal::createTextField(_loc1_);
            invalidateSize();
            textChanged = true;
         }
         if(textChanged)
         {
            _loc2_ = textField.getTextFormat();
            _loc2_.leftMargin = 0;
            _loc2_.rightMargin = 0;
            textField.defaultTextFormat = _loc2_;
            textField.text = _text;
            textChanged = false;
         }
      }
      
      mx_internal function getTextField() : IUITextField
      {
         return textField;
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Class = null;
         super.createChildren();
         if(!mx_internal::border)
         {
            _loc1_ = getStyle("borderSkin");
            mx_internal::border = new _loc1_();
            if(mx_internal::border is ISimpleStyleClient)
            {
               ISimpleStyleClient(mx_internal::border).styleName = this;
            }
            addChild(DisplayObject(mx_internal::border));
         }
         mx_internal::createTextField(-1);
      }
      
      override protected function measure() : void
      {
         var _loc7_:Number = NaN;
         super.measure();
         var _loc1_:EdgeMetrics = borderMetrics;
         var _loc2_:Number = _loc1_.left + getStyle("paddingLeft");
         var _loc3_:Number = _loc1_.top + getStyle("paddingTop");
         var _loc4_:Number = _loc1_.right + getStyle("paddingRight");
         var _loc5_:Number = _loc1_.bottom + getStyle("paddingBottom");
         var _loc6_:Number = _loc2_ + _loc4_;
         _loc7_ = _loc3_ + _loc5_;
         textField.wordWrap = false;
         if(textField.textWidth + _loc6_ > ToolTip.maxWidth)
         {
            textField.width = 0 - _loc6_;
            textField.wordWrap = true;
         }
         measuredWidth = textField.width + _loc6_;
         measuredHeight = textField.height + _loc7_;
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      public function set text(param1:String) : void
      {
         _text = param1;
         textChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      mx_internal function removeTextField() : void
      {
         if(textField)
         {
            removeChild(DisplayObject(textField));
            textField = null;
         }
      }
      
      mx_internal function createTextField(param1:int) : void
      {
         if(!textField)
         {
            textField = IUITextField(createInFontContext(UITextField));
            textField.autoSize = TextFieldAutoSize.LEFT;
            textField.mouseEnabled = false;
            textField.multiline = true;
            textField.selectable = false;
            textField.wordWrap = false;
            textField.styleName = this;
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
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:EdgeMetrics = borderMetrics;
         var _loc4_:Number = _loc3_.left + getStyle("paddingLeft");
         var _loc5_:Number = _loc3_.top + getStyle("paddingTop");
         var _loc6_:Number = _loc3_.right + getStyle("paddingRight");
         var _loc7_:Number = _loc3_.bottom + getStyle("paddingBottom");
         var _loc8_:Number = _loc4_ + _loc6_;
         var _loc9_:Number = _loc5_ + _loc7_;
         mx_internal::border.setActualSize(param1,param2);
         textField.move(_loc4_,_loc5_);
         textField.setActualSize(param1 - _loc8_,param2 - _loc9_);
      }
      
      private function get borderMetrics() : EdgeMetrics
      {
         if(mx_internal::border is IRectangularBorder)
         {
            return IRectangularBorder(mx_internal::border).borderMetrics;
         }
         return EdgeMetrics.EMPTY;
      }
   }
}
