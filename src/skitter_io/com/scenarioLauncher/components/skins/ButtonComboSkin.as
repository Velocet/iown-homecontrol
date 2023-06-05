package com.scenarioLauncher.components.skins
{
   import mx.skins.halo.ButtonSkin;
   
   public class ButtonComboSkin extends ButtonSkin
   {
       
      
      public function ButtonComboSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = 1;
         var _loc4_:Number = 12827575;
         switch(name)
         {
            case "selectedUpSkin":
            case "selectedOverSkin":
            case "selectedDownSkin":
               _loc4_ = 16777215;
               break;
            case "overSkin":
            case "downSkin":
            case "upSkin":
               _loc4_ = 12827575;
         }
         graphics.clear();
         graphics.beginFill(_loc4_,_loc3_);
         graphics.lineStyle(0,_loc4_,0);
         graphics.drawRoundRectComplex(0,0,param1,param2,4,4,4,4);
         graphics.endFill();
      }
   }
}
