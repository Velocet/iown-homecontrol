package com.scenarioLauncher.utils
{
   import flash.filters.DropShadowFilter;
   
   public class FiltersUtils
   {
       
      
      public function FiltersUtils()
      {
         super();
      }
      
      public static function buttonShadow() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.blurX = 9;
         _loc1_.blurY = 9;
         _loc1_.alpha = 0.5;
         _loc1_.angle = 45;
         _loc1_.color = 2236962;
         _loc1_.distance = 3;
         return _loc1_;
      }
      
      public static function popupShadow() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.blurX = 14;
         _loc1_.blurY = 14;
         _loc1_.alpha = 0.7;
         _loc1_.angle = 45;
         _loc1_.color = 2236962;
         _loc1_.distance = 6;
         return _loc1_;
      }
   }
}
