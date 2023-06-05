package com.scenarioLauncher.views.skins
{
   import mx.skins.halo.ButtonSkin;
   
   public class ButtonWhiteSkin extends ButtonSkin
   {
       
      
      public function ButtonWhiteSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         graphics.clear();
         graphics.beginFill(16777215,1);
         graphics.drawRect(0,0,param1,param2);
         graphics.endFill();
      }
   }
}
