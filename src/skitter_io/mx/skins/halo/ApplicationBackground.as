package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   import mx.utils.ColorUtil;
   
   public class ApplicationBackground extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ApplicationBackground()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 8;
      }
      
      override public function get measuredHeight() : Number
      {
         return 8;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc6_:* = 0;
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         var _loc4_:* = getStyle("backgroundGradientColors");
         var _loc5_:* = getStyle("backgroundGradientAlphas");
         if(!_loc4_)
         {
            _loc6_ = getStyle("backgroundColor");
            if(isNaN(_loc6_))
            {
               _loc6_ = 16777215;
            }
            (_loc4_ = [])[0] = ColorUtil.adjustBrightness(_loc6_,15);
            _loc4_[1] = ColorUtil.adjustBrightness(_loc6_,-25);
         }
         if(!_loc5_)
         {
            _loc5_ = [1,1];
         }
         _loc3_.clear();
         drawRoundRect(0,0,param1,param2,0,_loc4_,_loc5_,verticalGradientMatrix(0,0,param1,param2));
      }
   }
}
