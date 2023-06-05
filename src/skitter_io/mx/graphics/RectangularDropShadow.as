package mx.graphics
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.FlexShape;
   import mx.core.mx_internal;
   import mx.utils.GraphicsUtil;
   
   public class RectangularDropShadow
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var leftShadow:BitmapData;
      
      private var _tlRadius:Number = 0;
      
      private var _trRadius:Number = 0;
      
      private var _angle:Number = 45;
      
      private var topShadow:BitmapData;
      
      private var _distance:Number = 4;
      
      private var rightShadow:BitmapData;
      
      private var _alpha:Number = 0.4;
      
      private var shadow:BitmapData;
      
      private var _brRadius:Number = 0;
      
      private var _blRadius:Number = 0;
      
      private var _color:int = 0;
      
      private var bottomShadow:BitmapData;
      
      private var changed:Boolean = true;
      
      public function RectangularDropShadow()
      {
         super();
      }
      
      public function get blRadius() : Number
      {
         return _blRadius;
      }
      
      public function set brRadius(param1:Number) : void
      {
         if(_brRadius != param1)
         {
            _brRadius = param1;
            changed = true;
         }
      }
      
      public function set color(param1:int) : void
      {
         if(_color != param1)
         {
            _color = param1;
            changed = true;
         }
      }
      
      public function drawShadow(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         if(changed)
         {
            createShadowBitmaps();
            changed = false;
         }
         param4 = Math.ceil(param4);
         param5 = Math.ceil(param5);
         var _loc6_:int = !!leftShadow ? 0 : 0;
         var _loc7_:int = !!rightShadow ? 0 : 0;
         var _loc8_:int = !!topShadow ? 0 : 0;
         var _loc9_:int = !!bottomShadow ? 0 : 0;
         var _loc10_:int = _loc6_ + _loc7_;
         var _loc11_:int = _loc8_ + _loc9_;
         var _loc12_:Number = (param5 + _loc11_) / 2;
         var _loc13_:Number = (param4 + _loc10_) / 2;
         var _loc14_:Matrix = new Matrix();
         if(Boolean(leftShadow) || Boolean(topShadow))
         {
            _loc15_ = Math.min(tlRadius + _loc10_,_loc13_);
            _loc16_ = Math.min(tlRadius + _loc11_,_loc12_);
            _loc14_.tx = param2 - _loc6_;
            _loc14_.ty = param3 - _loc8_;
            param1.beginBitmapFill(shadow,_loc14_);
            param1.drawRect(param2 - _loc6_,param3 - _loc8_,_loc15_,_loc16_);
            param1.endFill();
         }
         if(Boolean(rightShadow) || Boolean(topShadow))
         {
            _loc17_ = Math.min(trRadius + _loc10_,_loc13_);
            _loc18_ = Math.min(trRadius + _loc11_,_loc12_);
            _loc14_.tx = param2 + param4 + _loc7_ - 0;
            _loc14_.ty = param3 - _loc8_;
            param1.beginBitmapFill(shadow,_loc14_);
            param1.drawRect(param2 + param4 + _loc7_ - _loc17_,param3 - _loc8_,_loc17_,_loc18_);
            param1.endFill();
         }
         if(Boolean(leftShadow) || Boolean(bottomShadow))
         {
            _loc19_ = Math.min(blRadius + _loc10_,_loc13_);
            _loc20_ = Math.min(blRadius + _loc11_,_loc12_);
            _loc14_.tx = param2 - _loc6_;
            _loc14_.ty = param3 + param5 + _loc9_ - 0;
            param1.beginBitmapFill(shadow,_loc14_);
            param1.drawRect(param2 - _loc6_,param3 + param5 + _loc9_ - _loc20_,_loc19_,_loc20_);
            param1.endFill();
         }
         if(Boolean(rightShadow) || Boolean(bottomShadow))
         {
            _loc21_ = Math.min(brRadius + _loc10_,_loc13_);
            _loc22_ = Math.min(brRadius + _loc11_,_loc12_);
            _loc14_.tx = param2 + param4 + _loc7_ - 0;
            _loc14_.ty = param3 + param5 + _loc9_ - 0;
            param1.beginBitmapFill(shadow,_loc14_);
            param1.drawRect(param2 + param4 + _loc7_ - _loc21_,param3 + param5 + _loc9_ - _loc22_,_loc21_,_loc22_);
            param1.endFill();
         }
         if(leftShadow)
         {
            _loc14_.tx = param2 - _loc6_;
            _loc14_.ty = 0;
            param1.beginBitmapFill(leftShadow,_loc14_);
            param1.drawRect(param2 - _loc6_,param3 - _loc8_ + _loc16_,_loc6_,param5 + _loc8_ + _loc9_ - _loc16_ - _loc20_);
            param1.endFill();
         }
         if(rightShadow)
         {
            _loc14_.tx = param2 + param4;
            _loc14_.ty = 0;
            param1.beginBitmapFill(rightShadow,_loc14_);
            param1.drawRect(param2 + param4,param3 - _loc8_ + _loc18_,_loc7_,param5 + _loc8_ + _loc9_ - _loc18_ - _loc22_);
            param1.endFill();
         }
         if(topShadow)
         {
            _loc14_.tx = 0;
            _loc14_.ty = param3 - _loc8_;
            param1.beginBitmapFill(topShadow,_loc14_);
            param1.drawRect(param2 - _loc6_ + _loc15_,param3 - _loc8_,param4 + _loc6_ + _loc7_ - _loc15_ - _loc17_,_loc8_);
            param1.endFill();
         }
         if(bottomShadow)
         {
            _loc14_.tx = 0;
            _loc14_.ty = param3 + param5;
            param1.beginBitmapFill(bottomShadow,_loc14_);
            param1.drawRect(param2 - _loc6_ + _loc19_,param3 + param5,param4 + _loc6_ + _loc7_ - _loc19_ - _loc21_,_loc9_);
            param1.endFill();
         }
      }
      
      public function get brRadius() : Number
      {
         return _brRadius;
      }
      
      public function get angle() : Number
      {
         return _angle;
      }
      
      private function createShadowBitmaps() : void
      {
         var _loc1_:Number = Math.max(tlRadius,blRadius) + 2 * distance + Math.max(trRadius,brRadius);
         var _loc2_:Number = Math.max(tlRadius,trRadius) + 2 * distance + Math.max(blRadius,brRadius);
         if(_loc1_ < 0 || _loc2_ < 0)
         {
            return;
         }
         var _loc3_:Shape = new FlexShape();
         var _loc4_:Graphics;
         (_loc4_ = _loc3_.graphics).beginFill(16777215);
         GraphicsUtil.drawRoundRectComplex(_loc4_,0,0,_loc1_,_loc2_,tlRadius,trRadius,blRadius,brRadius);
         _loc4_.endFill();
         var _loc5_:BitmapData;
         (_loc5_ = new BitmapData(_loc1_,_loc2_,true,0)).draw(_loc3_,new Matrix());
         var _loc6_:DropShadowFilter;
         (_loc6_ = new DropShadowFilter(distance,angle,color,alpha)).knockout = true;
         var _loc7_:Rectangle = new Rectangle(0,0,_loc1_,_loc2_);
         var _loc8_:Rectangle = _loc5_.generateFilterRect(_loc7_,_loc6_);
         var _loc9_:Number = _loc7_.left - _loc8_.left;
         var _loc10_:Number = _loc8_.right - _loc7_.right;
         var _loc11_:Number = _loc7_.top - _loc8_.top;
         var _loc12_:Number = _loc8_.bottom - _loc7_.bottom;
         shadow = new BitmapData(_loc8_.width,_loc8_.height);
         shadow.applyFilter(_loc5_,_loc7_,new Point(_loc9_,_loc11_),_loc6_);
         var _loc13_:Point = new Point(0,0);
         var _loc14_:Rectangle = new Rectangle();
         if(_loc9_ > 0)
         {
            _loc14_.x = 0;
            _loc14_.y = tlRadius + _loc11_ + _loc12_;
            _loc14_.width = _loc9_;
            _loc14_.height = 1;
            leftShadow = new BitmapData(_loc9_,1);
            leftShadow.copyPixels(shadow,_loc14_,_loc13_);
         }
         else
         {
            leftShadow = null;
         }
         if(_loc10_ > 0)
         {
            _loc14_.x = 0 - _loc10_;
            _loc14_.y = trRadius + _loc11_ + _loc12_;
            _loc14_.width = _loc10_;
            _loc14_.height = 1;
            rightShadow = new BitmapData(_loc10_,1);
            rightShadow.copyPixels(shadow,_loc14_,_loc13_);
         }
         else
         {
            rightShadow = null;
         }
         if(_loc11_ > 0)
         {
            _loc14_.x = tlRadius + _loc9_ + _loc10_;
            _loc14_.y = 0;
            _loc14_.width = 1;
            _loc14_.height = _loc11_;
            topShadow = new BitmapData(1,_loc11_);
            topShadow.copyPixels(shadow,_loc14_,_loc13_);
         }
         else
         {
            topShadow = null;
         }
         if(_loc12_ > 0)
         {
            _loc14_.x = blRadius + _loc9_ + _loc10_;
            _loc14_.y = 0 - _loc12_;
            _loc14_.width = 1;
            _loc14_.height = _loc12_;
            bottomShadow = new BitmapData(1,_loc12_);
            bottomShadow.copyPixels(shadow,_loc14_,_loc13_);
         }
         else
         {
            bottomShadow = null;
         }
      }
      
      public function get alpha() : Number
      {
         return _alpha;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function set angle(param1:Number) : void
      {
         if(_angle != param1)
         {
            _angle = param1;
            changed = true;
         }
      }
      
      public function set trRadius(param1:Number) : void
      {
         if(_trRadius != param1)
         {
            _trRadius = param1;
            changed = true;
         }
      }
      
      public function set tlRadius(param1:Number) : void
      {
         if(_tlRadius != param1)
         {
            _tlRadius = param1;
            changed = true;
         }
      }
      
      public function get trRadius() : Number
      {
         return _trRadius;
      }
      
      public function set distance(param1:Number) : void
      {
         if(_distance != param1)
         {
            _distance = param1;
            changed = true;
         }
      }
      
      public function get distance() : Number
      {
         return _distance;
      }
      
      public function get tlRadius() : Number
      {
         return _tlRadius;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(_alpha != param1)
         {
            _alpha = param1;
            changed = true;
         }
      }
      
      public function set blRadius(param1:Number) : void
      {
         if(_blRadius != param1)
         {
            _blRadius = param1;
            changed = true;
         }
      }
   }
}
