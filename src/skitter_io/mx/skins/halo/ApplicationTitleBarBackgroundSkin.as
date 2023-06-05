package mx.skins.halo
{
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   import mx.styles.StyleManager;
   
   public class ApplicationTitleBarBackgroundSkin extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ApplicationTitleBarBackgroundSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("cornerRadius");
         var _loc4_:Array = getStyle("titleBarColors");
         StyleManager.getColorNames(_loc4_);
         graphics.clear();
         drawRoundRect(0,0,param1,param2,{
            "tl":_loc3_,
            "tr":_loc3_,
            "bl":0,
            "br":0
         },_loc4_,[1,1],verticalGradientMatrix(0,0,param1,param2));
         graphics.lineStyle(1,16777215,0.2);
         graphics.moveTo(0,param2 - 1);
         graphics.lineTo(0,_loc3_);
         graphics.curveTo(0,0,_loc3_,0);
         graphics.lineTo(param1 - 1 - _loc3_,0);
         graphics.curveTo(param1 - 1,0,param1 - 1,_loc3_);
         graphics.lineTo(param1 - 1,param2 - 1);
         graphics.moveTo(0,param2 - 1);
         graphics.lineStyle(1,0,0.35);
         graphics.lineTo(param1,param2 - 1);
      }
   }
}
