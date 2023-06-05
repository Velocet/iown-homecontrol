package mx.utils
{
   import mx.core.mx_internal;
   
   public class ColorUtil
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ColorUtil()
      {
         super();
      }
      
      public static function adjustBrightness2(param1:uint, param2:Number) : uint
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(param2 == 0)
         {
            return param1;
         }
         if(param2 < 0)
         {
            param2 = (100 + param2) / 100;
            _loc3_ = (param1 >> 16 & 255) * param2;
            _loc4_ = (param1 >> 8 & 255) * param2;
            _loc5_ = (param1 & 255) * param2;
         }
         else
         {
            param2 /= 100;
            _loc3_ = param1 >> 16 & 255;
            _loc4_ = param1 >> 8 & 255;
            _loc5_ = param1 & 255;
            _loc3_ += (255 - _loc3_) * param2;
            _loc4_ += (255 - _loc4_) * param2;
            _loc5_ += (255 - _loc5_) * param2;
            _loc3_ = Math.min(_loc3_,255);
            _loc4_ = Math.min(_loc4_,255);
            _loc5_ = Math.min(_loc5_,255);
         }
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function rgbMultiply(param1:uint, param2:uint) : uint
      {
         var _loc3_:Number = param1 >> 16 & 255;
         var _loc4_:Number = param1 >> 8 & 255;
         var _loc5_:Number = param1 & 255;
         var _loc6_:Number = param2 >> 16 & 255;
         var _loc7_:Number = param2 >> 8 & 255;
         var _loc8_:Number = param2 & 255;
         return _loc3_ * _loc6_ / 255 << 16 | _loc4_ * _loc7_ / 255 << 8 | _loc5_ * _loc8_ / 255;
      }
      
      public static function adjustBrightness(param1:uint, param2:Number) : uint
      {
         var _loc3_:Number = Math.max(Math.min((param1 >> 16 & 255) + param2,255),0);
         var _loc4_:Number = Math.max(Math.min((param1 >> 8 & 255) + param2,255),0);
         var _loc5_:Number = Math.max(Math.min((param1 & 255) + param2,255),0);
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
   }
}
