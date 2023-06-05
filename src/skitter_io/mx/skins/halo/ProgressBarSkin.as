package mx.skins.halo
{
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class ProgressBarSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ProgressBarSkin()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 200;
      }
      
      override public function get measuredHeight() : Number
      {
         return 6;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:* = getStyle("barColor");
         var _loc4_:uint = StyleManager.isValidStyleValue(_loc3_) ? _loc3_ : getStyle("themeColor");
         var _loc5_:Number;
         var _loc6_:Array = [_loc5_ = ColorUtil.adjustBrightness2(_loc4_,40),_loc4_];
         graphics.clear();
         drawRoundRect(0,0,param1,param2,0,_loc6_,0.5,verticalGradientMatrix(0,0,param1 - 2,param2 - 2));
         drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc6_,1,verticalGradientMatrix(0,0,param1 - 2,param2 - 2));
      }
   }
}
