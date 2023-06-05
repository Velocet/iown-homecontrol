package mx.skins.halo
{
   import mx.core.mx_internal;
   import mx.utils.ColorUtil;
   
   public class HaloColors
   {
      
      private static var cache:Object = {};
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function HaloColors()
      {
         super();
      }
      
      public static function getCacheKey(... rest) : String
      {
         return rest.join(",");
      }
      
      public static function addHaloColors(param1:Object, param2:uint, param3:uint, param4:uint) : void
      {
         var _loc5_:String = getCacheKey(param2,param3,param4);
         var _loc6_:Object;
         if(!(_loc6_ = cache[_loc5_]))
         {
            (_loc6_ = cache[_loc5_] = {}).themeColLgt = ColorUtil.adjustBrightness(param2,100);
            _loc6_.themeColDrk1 = ColorUtil.adjustBrightness(param2,-75);
            _loc6_.themeColDrk2 = ColorUtil.adjustBrightness(param2,-25);
            _loc6_.fillColorBright1 = ColorUtil.adjustBrightness2(param3,15);
            _loc6_.fillColorBright2 = ColorUtil.adjustBrightness2(param4,15);
            _loc6_.fillColorPress1 = ColorUtil.adjustBrightness2(param2,85);
            _loc6_.fillColorPress2 = ColorUtil.adjustBrightness2(param2,60);
            _loc6_.bevelHighlight1 = ColorUtil.adjustBrightness2(param3,40);
            _loc6_.bevelHighlight2 = ColorUtil.adjustBrightness2(param4,40);
         }
         param1.themeColLgt = _loc6_.themeColLgt;
         param1.themeColDrk1 = _loc6_.themeColDrk1;
         param1.themeColDrk2 = _loc6_.themeColDrk2;
         param1.fillColorBright1 = _loc6_.fillColorBright1;
         param1.fillColorBright2 = _loc6_.fillColorBright2;
         param1.fillColorPress1 = _loc6_.fillColorPress1;
         param1.fillColorPress2 = _loc6_.fillColorPress2;
         param1.bevelHighlight1 = _loc6_.bevelHighlight1;
         param1.bevelHighlight2 = _loc6_.bevelHighlight2;
      }
   }
}
