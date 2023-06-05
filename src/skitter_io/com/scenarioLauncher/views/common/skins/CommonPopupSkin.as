package com.scenarioLauncher.views.common.skins
{
   import com.scenarioLauncher.utils.FiltersUtils;
   import mx.skins.ProgrammaticSkin;
   
   public class CommonPopupSkin extends ProgrammaticSkin
   {
       
      
      public function CommonPopupSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = 13;
         var _loc4_:Number = 1;
         var _loc5_:Number = 16777215;
         var _loc6_:Number = 16777215;
         graphics.clear();
         drawRoundRect(0,0,param1,param2,{
            "tl":_loc3_,
            "tr":_loc3_,
            "bl":_loc3_,
            "br":_loc3_
         },_loc5_,_loc4_);
         graphics.endFill();
         filters = [FiltersUtils.popupShadow()];
      }
   }
}
