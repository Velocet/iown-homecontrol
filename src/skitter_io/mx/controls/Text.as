package mx.controls
{
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class Text extends Label
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var widthChanged:Boolean = true;
      
      private var lastUnscaledWidth:Number = NaN;
      
      public function Text()
      {
         super();
         selectable = true;
         truncateToFit = false;
         addEventListener(FlexEvent.UPDATE_COMPLETE,updateCompleteHandler);
      }
      
      private function measureUsingWidth(param1:Number) : void
      {
         var _loc6_:Boolean = false;
         var _loc2_:Number = getStyle("paddingLeft");
         var _loc3_:Number = getStyle("paddingTop");
         var _loc4_:Number = getStyle("paddingRight");
         var _loc5_:Number = getStyle("paddingBottom");
         textField.validateNow();
         textField.autoSize = "left";
         if(!isNaN(param1))
         {
            textField.width = param1 - _loc2_ - _loc4_;
            measuredWidth = Math.ceil(textField.textWidth) + UITextField.mx_internal::TEXT_WIDTH_PADDING;
            measuredHeight = Math.ceil(textField.textHeight) + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
         }
         else
         {
            _loc6_ = false;
            textField.wordWrap = false;
            measuredWidth = Math.ceil(textField.textWidth) + UITextField.mx_internal::TEXT_WIDTH_PADDING;
            measuredHeight = Math.ceil(textField.textHeight) + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
            textField.wordWrap = _loc6_;
         }
         textField.autoSize = "none";
         measuredWidth += _loc2_ + _loc4_;
         measuredHeight += _loc3_ + _loc5_;
         if(isNaN(explicitWidth))
         {
            measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
            measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
         }
         else
         {
            measuredMinWidth = measuredWidth;
            measuredMinHeight = measuredHeight;
         }
      }
      
      override public function set percentWidth(param1:Number) : void
      {
         if(param1 != percentWidth)
         {
            widthChanged = true;
            invalidateProperties();
            invalidateSize();
         }
         super.percentWidth = param1;
      }
      
      override public function set explicitWidth(param1:Number) : void
      {
         if(param1 != explicitWidth)
         {
            widthChanged = true;
            invalidateProperties();
            invalidateSize();
         }
         super.explicitWidth = param1;
      }
      
      private function updateCompleteHandler(param1:FlexEvent) : void
      {
         lastUnscaledWidth = NaN;
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
         textField.wordWrap = true;
         textField.multiline = true;
         textField.mouseWheelEnabled = false;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(widthChanged)
         {
            textField.wordWrap = !isNaN(explicitWidth) || !isNaN(explicitMaxWidth) || !isNaN(percentWidth);
            widthChanged = false;
         }
      }
      
      override public function set maxWidth(param1:Number) : void
      {
         if(param1 != maxWidth)
         {
            widthChanged = true;
            invalidateProperties();
            invalidateSize();
         }
         super.maxWidth = param1;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc7_:Boolean = false;
         if(isSpecialCase())
         {
            _loc7_ = isNaN(lastUnscaledWidth) || lastUnscaledWidth != param1;
            lastUnscaledWidth = param1;
            if(_loc7_)
            {
               invalidateSize();
               return;
            }
         }
         var _loc3_:Number = getStyle("paddingLeft");
         var _loc4_:Number = getStyle("paddingTop");
         var _loc5_:Number = getStyle("paddingRight");
         var _loc6_:Number = getStyle("paddingBottom");
         textField.setActualSize(param1 - _loc3_ - _loc5_,param2 - _loc4_ - _loc6_);
         textField.x = _loc3_;
         textField.y = _loc4_;
         if(Math.floor(width) < Math.floor(measuredWidth))
         {
            textField.wordWrap = true;
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         if(isSpecialCase())
         {
            if(!isNaN(lastUnscaledWidth))
            {
               measureUsingWidth(lastUnscaledWidth);
            }
            else
            {
               measuredWidth = 0;
               measuredHeight = 0;
            }
            return;
         }
         if(!isNaN(explicitWidth))
         {
            _loc1_ = explicitWidth;
         }
         else if(!isNaN(explicitMaxWidth))
         {
            _loc1_ = explicitMaxWidth;
         }
         measureUsingWidth(_loc1_);
      }
      
      private function isSpecialCase() : Boolean
      {
         var _loc1_:Number = getStyle("left");
         var _loc2_:Number = getStyle("right");
         return (!isNaN(percentWidth) || !isNaN(_loc1_) && !isNaN(_loc2_)) && isNaN(explicitHeight) && isNaN(percentHeight);
      }
   }
}
