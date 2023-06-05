package com.scenarioLauncher.views.skins
{
   import mx.skins.halo.HaloFocusRect;
   import mx.styles.StyleManager;
   
   public class ButtonFocus extends HaloFocusRect
   {
       
      
      public function ButtonFocus()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Object = this.styleName.styleName;
         var _loc4_:uint = StyleManager.getStyleDeclaration("." + _loc3_).getStyle("focusColor");
         super.setStyle("focusColor",_loc4_);
         super.updateDisplayList(param1,param2);
      }
   }
}
