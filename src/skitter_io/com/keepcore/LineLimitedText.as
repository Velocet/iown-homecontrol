package com.keepcore
{
   import flash.text.TextLineMetrics;
   import mx.controls.Text;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   
   public class LineLimitedText extends Text
   {
       
      
      private var explicitHTMLText:String = null;
      
      private var _isTruncated:Boolean = false;
      
      protected var _maxLines:uint = 0;
      
      public function LineLimitedText()
      {
         super();
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         this.explicitHTMLText = null;
      }
      
      override public function set htmlText(param1:String) : void
      {
         super.htmlText = param1;
         this.explicitHTMLText = param1;
      }
      
      public function set maxLines(param1:uint) : void
      {
         if(this._maxLines != param1)
         {
            this._maxLines = param1;
            invalidateDisplayList();
            invalidateSize();
         }
      }
      
      public function get numLines() : int
      {
         var _loc1_:int = 0;
         var _loc2_:TextLineMetrics = null;
         var _loc3_:Number = NaN;
         if(this._maxLines > 0)
         {
            _loc2_ = textField.getLineMetrics(0);
            _loc3_ = Math.ceil(_loc2_.height) * this._maxLines;
            if(textField.height > _loc3_)
            {
               _loc1_ = int(this._maxLines);
            }
            else
            {
               _loc1_ = 0;
            }
         }
         else
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function get maxLines() : uint
      {
         return this._maxLines;
      }
      
      private function get isHTML() : Boolean
      {
         return false;
      }
      
      override protected function measure() : void
      {
         var _loc1_:TextLineMetrics = null;
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Number = 0;
         super.measure();
         if(!this.isHTML)
         {
            if(this._isTruncated)
            {
               textField.text = super.text;
               textField.validateNow();
            }
         }
         if(this._maxLines > 0 && textField.numLines > this._maxLines)
         {
            if(!this.isHTML)
            {
               this._isTruncated = true;
               _loc3_ = "";
               _loc5_ = 0;
               while(_loc5_ < this._maxLines)
               {
                  _loc4_ = textField.getLineText(_loc5_);
                  if(_loc5_ < this._maxLines - 1)
                  {
                     _loc3_ += _loc4_;
                  }
                  else
                  {
                     _loc4_ = (_loc4_ = _loc4_.substr(0,_loc4_.length - 3)).substr(0,_loc4_.lastIndexOf(" "));
                     _loc3_ += _loc4_ + "...";
                  }
                  _loc5_++;
               }
            }
            _loc1_ = textField.getLineMetrics(0);
            _loc2_ = Math.ceil(_loc1_.height) * this._maxLines;
            measuredHeight = _loc2_ + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
            if(!this.isHTML)
            {
               textField.text = _loc3_;
            }
         }
         else if(!this.isHTML)
         {
            if(this._isTruncated)
            {
               textField.autoSize = "left";
               measuredHeight = NaN;
            }
            this._isTruncated = false;
         }
      }
   }
}
