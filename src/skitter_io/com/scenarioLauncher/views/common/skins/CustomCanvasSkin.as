package com.scenarioLauncher.views.common.skins
{
   import mx.skins.ProgrammaticSkin;
   
   public class CustomCanvasSkin extends ProgrammaticSkin
   {
       
      
      public function CustomCanvasSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("backgroundAlpha") != undefined ? getStyle("backgroundAlpha") : 1;
         var _loc4_:Number = getStyle("backgroundColor") != undefined ? getStyle("backgroundColor") : 16777215;
         var _loc5_:Number = getStyle("cornerRadius") != undefined ? getStyle("cornerRadius") : 0;
         var _loc6_:Number = getStyle("cornerRadiusTL") != undefined ? getStyle("cornerRadiusTL") : _loc5_;
         var _loc7_:Number = getStyle("cornerRadiusTR") != undefined ? getStyle("cornerRadiusTR") : _loc5_;
         var _loc8_:Number = getStyle("cornerRadiusBL") != undefined ? getStyle("cornerRadiusBL") : _loc5_;
         var _loc9_:Number = getStyle("cornerRadiusBR") != undefined ? getStyle("cornerRadiusBR") : _loc5_;
         var _loc10_:Number = getStyle("borderThickness") != undefined ? getStyle("borderThickness") : 0;
         var _loc11_:Number = getStyle("borderThicknessTop") != undefined ? getStyle("borderThicknessTop") : _loc10_;
         var _loc12_:Number = getStyle("borderThicknessRight") != undefined ? getStyle("borderThicknessRight") : _loc10_;
         var _loc13_:Number = getStyle("borderThicknessBottom") != undefined ? getStyle("borderThicknessBottom") : _loc10_;
         var _loc14_:Number = getStyle("borderThicknessLeft") != undefined ? getStyle("borderThicknessLeft") : _loc10_;
         var _loc15_:Number = getStyle("borderColor") != undefined ? getStyle("borderColor") : 0;
         graphics.clear();
         graphics.beginFill(_loc4_,_loc3_);
         graphics.drawRoundRectComplex(0,0,param1,param2,_loc6_,_loc7_,_loc8_,_loc9_);
         graphics.endFill();
         if(_loc10_ > 0)
         {
            graphics.lineStyle(_loc10_,_loc15_,_loc3_);
            graphics.moveTo(0,0);
            graphics.lineTo(param1,0);
            graphics.moveTo(0,0);
            graphics.lineTo(0,param2 - _loc8_ / 2 - 2);
         }
      }
   }
}
