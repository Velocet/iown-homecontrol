package mx.utils
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   
   public class GraphicsUtil
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function GraphicsUtil()
      {
         super();
      }
      
      public static function drawRoundRectComplex(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = param2 + param4;
         var _loc11_:Number = param3 + param5;
         var _loc12_:Number = param4 < param5 ? param4 * 2 : param5 * 2;
         param6 = param6 < _loc12_ ? param6 : _loc12_;
         param7 = param7 < _loc12_ ? param7 : _loc12_;
         param8 = param8 < _loc12_ ? param8 : _loc12_;
         var _loc13_:Number = (param9 = param9 < _loc12_ ? param9 : _loc12_) * 0.292893218813453;
         var _loc14_:Number = param9 * 0.585786437626905;
         param1.moveTo(_loc10_,_loc11_ - param9);
         param1.curveTo(_loc10_,_loc11_ - _loc14_,_loc10_ - _loc13_,_loc11_ - _loc13_);
         param1.curveTo(_loc10_ - _loc14_,_loc11_,_loc10_ - param9,_loc11_);
         _loc13_ = param8 * 0.292893218813453;
         _loc14_ = param8 * 0.585786437626905;
         param1.lineTo(param2 + param8,_loc11_);
         param1.curveTo(param2 + _loc14_,_loc11_,param2 + _loc13_,_loc11_ - _loc13_);
         param1.curveTo(param2,_loc11_ - _loc14_,param2,_loc11_ - param8);
         _loc13_ = param6 * 0.292893218813453;
         _loc14_ = param6 * 0.585786437626905;
         param1.lineTo(param2,param3 + param6);
         param1.curveTo(param2,param3 + _loc14_,param2 + _loc13_,param3 + _loc13_);
         param1.curveTo(param2 + _loc14_,param3,param2 + param6,param3);
         _loc13_ = param7 * 0.292893218813453;
         _loc14_ = param7 * 0.585786437626905;
         param1.lineTo(_loc10_ - param7,param3);
         param1.curveTo(_loc10_ - _loc14_,param3,_loc10_ - _loc13_,param3 + _loc13_);
         param1.curveTo(_loc10_,param3 + _loc14_,_loc10_,param3 + param7);
         param1.lineTo(_loc10_,_loc11_ - param9);
      }
   }
}
