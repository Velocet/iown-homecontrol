package com.scenarioLauncher.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class BitmapUtils
   {
       
      
      public function BitmapUtils()
      {
         super();
      }
      
      public static function resizeBitmap(param1:Bitmap, param2:Number, param3:Number) : void
      {
         var _loc4_:BitmapData = param1.bitmapData;
         var _loc5_:Number = 1;
         var _loc6_:Number = param2;
         var _loc7_:Number = param3;
         if(_loc4_.width > _loc4_.height)
         {
            _loc5_ = param2 / _loc4_.width;
         }
         else
         {
            _loc5_ = param3 / _loc4_.height;
         }
         _loc6_ = _loc4_.width * _loc5_;
         _loc7_ = _loc4_.height * _loc5_;
         var _loc8_:BitmapData = new BitmapData(_loc6_,_loc7_);
         var _loc9_:Matrix;
         (_loc9_ = new Matrix()).scale(_loc5_,_loc5_);
         _loc8_.draw(param1,_loc9_);
         param1.bitmapData = _loc8_;
      }
   }
}
