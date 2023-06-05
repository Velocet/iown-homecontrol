package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class ProgressIndeterminateSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ProgressIndeterminateSkin()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 195;
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
         var _loc5_:Number = ColorUtil.adjustBrightness2(_loc4_,60);
         var _loc6_:Number = getStyle("indeterminateMoveInterval");
         if(isNaN(_loc6_) || _loc6_ == 0)
         {
            _loc6_ = 28;
         }
         var _loc7_:Graphics;
         (_loc7_ = graphics).clear();
         var _loc8_:int = 0;
         while(_loc8_ < param1)
         {
            _loc7_.beginFill(_loc5_,0.8);
            _loc7_.moveTo(_loc8_,1);
            _loc7_.lineTo(Math.min(_loc8_ + 14,param1),1);
            _loc7_.lineTo(Math.min(_loc8_ + 10,param1),param2 - 1);
            _loc7_.lineTo(Math.max(_loc8_ - 4,0),param2 - 1);
            _loc7_.lineTo(_loc8_,1);
            _loc7_.endFill();
            _loc8_ += _loc6_;
         }
      }
   }
}
