package com.scenarioLauncher.views.skins
{
   import mx.skins.halo.ButtonSkin;
   
   public class ButtonTabSkin extends ButtonSkin
   {
       
      
      public function ButtonTabSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("backgroundAlpha") != undefined ? getStyle("backgroundAlpha") : 1;
         var _loc4_:Number = getStyle("backgroundColor") != undefined ? getStyle("backgroundColor") : 16777215;
         graphics.clear();
         graphics.beginFill(_loc4_,_loc3_);
         graphics.drawRoundRectComplex(0,0,param1,param2,9,9,9,9);
         graphics.endFill();
      }
   }
}
