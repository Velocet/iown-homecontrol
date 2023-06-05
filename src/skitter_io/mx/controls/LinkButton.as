package mx.controls
{
   import flash.text.TextLineMetrics;
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   
   public class LinkButton extends Button
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      mx_internal static var createAccessibilityImplementation:Function;
       
      
      public function LinkButton()
      {
         super();
         buttonMode = true;
         mx_internal::extraSpacing = 4;
      }
      
      override public function set emphasized(param1:Boolean) : void
      {
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:TextLineMetrics = null;
         super.measure();
         if(false)
         {
            _loc1_ = 8;
            _loc2_ = 8;
            if(label)
            {
               _loc7_ = measureText(label);
               _loc1_ += _loc7_.width;
               _loc2_ += _loc7_.height;
            }
            _loc1_ += getStyle("paddingLeft") + getStyle("paddingRight");
            mx_internal::viewIcon();
            mx_internal::viewSkin();
            _loc3_ = !!mx_internal::currentIcon ? 0 : 0;
            _loc4_ = !!mx_internal::currentIcon ? 0 : 0;
            _loc5_ = 0;
            _loc6_ = 0;
            if(labelPlacement == ButtonLabelPlacement.LEFT || labelPlacement == ButtonLabelPlacement.RIGHT)
            {
               if(Boolean(label) && false)
               {
                  _loc5_ = _loc1_ + _loc3_;
               }
               else
               {
                  _loc5_ = _loc3_;
               }
               if(_loc3_ != 0)
               {
                  _loc5_ += getStyle("horizontalGap");
               }
               _loc6_ = Math.max(_loc2_,_loc4_);
            }
            else
            {
               _loc5_ = Math.max(_loc1_,_loc3_);
               if(Boolean(label) && false)
               {
                  _loc6_ = _loc2_ + _loc4_;
               }
               else
               {
                  _loc6_ = _loc4_;
               }
               if(_loc4_ != 0)
               {
                  _loc6_ += getStyle("verticalGap");
               }
            }
            if(Boolean(label) && label != "")
            {
               _loc5_ += mx_internal::extraSpacing;
            }
            _loc5_ = Math.max(20,_loc5_);
            _loc6_ = Math.max(14,_loc6_);
            measuredMinWidth = measuredWidth = _loc5_;
            measuredMinHeight = measuredHeight = _loc6_;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         buttonMode = param1;
      }
      
      override protected function initializeAccessibility() : void
      {
         if(mx_internal::createAccessibilityImplementation != null)
         {
            mx_internal::createAccessibilityImplementation(this);
         }
      }
   }
}
