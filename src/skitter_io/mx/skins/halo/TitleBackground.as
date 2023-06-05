package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class TitleBackground extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function TitleBackground()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("borderAlpha");
         var _loc4_:Number = getStyle("cornerRadius");
         var _loc5_:Array = getStyle("highlightAlphas");
         var _loc6_:Array;
         var _loc7_:* = (_loc6_ = getStyle("headerColors")) != null;
         StyleManager.getColorNames(_loc6_);
         var _loc8_:Number = ColorUtil.adjustBrightness2(!!_loc6_ ? uint(_loc6_[1]) : 16777215,-20);
         var _loc9_:Graphics;
         (_loc9_ = graphics).clear();
         if(param2 < 3)
         {
            return;
         }
         if(_loc7_)
         {
            _loc9_.lineStyle(0,_loc8_,_loc3_);
            _loc9_.moveTo(0,param2);
            _loc9_.lineTo(param1,param2);
            _loc9_.lineStyle(0,0,0);
            drawRoundRect(0,0,param1,param2,{
               "tl":_loc4_,
               "tr":_loc4_,
               "bl":0,
               "br":0
            },_loc6_,_loc3_,verticalGradientMatrix(0,0,param1,param2));
            drawRoundRect(0,0,param1,param2 / 2,{
               "tl":_loc4_,
               "tr":_loc4_,
               "bl":0,
               "br":0
            },[16777215,16777215],_loc5_,verticalGradientMatrix(0,0,param1,param2 / 2));
            drawRoundRect(0,0,param1,param2,{
               "tl":_loc4_,
               "tr":_loc4_,
               "bl":0,
               "br":0
            },16777215,_loc5_[0],null,GradientType.LINEAR,null,{
               "x":0,
               "y":1,
               "w":param1,
               "h":param2 - 1,
               "r":{
                  "tl":_loc4_,
                  "tr":_loc4_,
                  "bl":0,
                  "br":0
               }
            });
         }
      }
   }
}
