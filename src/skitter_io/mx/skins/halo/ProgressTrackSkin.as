package mx.skins.halo
{
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class ProgressTrackSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ProgressTrackSkin()
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
         var _loc3_:uint = getStyle("borderColor");
         var _loc4_:Array = getStyle("trackColors") as Array;
         StyleManager.getColorNames(_loc4_);
         var _loc5_:Number = ColorUtil.adjustBrightness2(_loc3_,-30);
         graphics.clear();
         drawRoundRect(0,0,param1,param2,0,[_loc5_,_loc3_],1,verticalGradientMatrix(0,0,param1,param2));
         drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc4_,1,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
      }
   }
}
