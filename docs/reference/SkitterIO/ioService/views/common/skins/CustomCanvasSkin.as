package ioService.views.common.skins
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
         var _loc5_:Number = getStyle("borderColor") != undefined ? getStyle("borderColor") : 16777215;
         var _loc6_:Number = getStyle("cornerRadius") != undefined ? getStyle("cornerRadius") : 0;
         var _loc7_:Number = getStyle("cornerRadiusTL") != undefined ? getStyle("cornerRadiusTL") : _loc6_;
         var _loc8_:Number = getStyle("cornerRadiusTR") != undefined ? getStyle("cornerRadiusTR") : _loc6_;
         var _loc9_:Number = getStyle("cornerRadiusBL") != undefined ? getStyle("cornerRadiusBL") : _loc6_;
         var _loc10_:Number = getStyle("cornerRadiusBR") != undefined ? getStyle("cornerRadiusBR") : _loc6_;
         graphics.clear();
         graphics.beginFill(_loc4_,_loc3_);
         graphics.drawRoundRectComplex(0,0,param1,param2,_loc7_,_loc8_,_loc9_,_loc10_);
         graphics.endFill();
      }
   }
}
