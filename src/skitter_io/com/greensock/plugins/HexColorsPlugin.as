package com.greensock.plugins
{
   import com.greensock.*;
   import flash.display.*;
   
   public class HexColorsPlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      protected var _colors:Array;
      
      public function HexColorsPlugin()
      {
         super();
         this.propName = "hexColors";
         this.overwriteProps = [];
         _colors = [];
      }
      
      override public function killProps(param1:Object) : void
      {
         var _loc2_:int = -1;
         while(_loc2_ > -1)
         {
            if(param1[_colors[_loc2_][1]] != undefined)
            {
               _colors.splice(_loc2_,1);
            }
            _loc2_--;
         }
         super.killProps(param1);
      }
      
      public function initColor(param1:Object, param2:String, param3:uint, param4:uint) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param3 != param4)
         {
            _loc5_ = param3 >> 16;
            _loc6_ = param3 >> 8 & 255;
            _loc7_ = param3 & 255;
            _colors[_colors.length] = [param1,param2,_loc5_,(param4 >> 16) - _loc5_,_loc6_,(param4 >> 8 & 255) - _loc6_,_loc7_,(param4 & 255) - _loc7_];
            this.overwriteProps[this.overwriteProps.length] = param2;
         }
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         _loc2_ = -1;
         while(_loc2_ > -1)
         {
            _loc3_ = _colors[_loc2_];
            _loc3_[0][_loc3_[1]] = _loc3_[2] + param1 * _loc3_[3] << 16 | _loc3_[4] + param1 * _loc3_[5] << 8 | _loc3_[6] + param1 * _loc3_[7];
            _loc2_--;
         }
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         var _loc4_:String = null;
         for(_loc4_ in param2)
         {
            initColor(param1,_loc4_,uint(param1[_loc4_]),uint(param2[_loc4_]));
         }
         return true;
      }
   }
}
