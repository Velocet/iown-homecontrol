package com.greensock.plugins
{
   import com.greensock.*;
   import com.greensock.core.*;
   import flash.display.*;
   import flash.filters.*;
   
   public class FilterPlugin extends TweenPlugin
   {
      
      public static const VERSION:Number = 2.03;
      
      public static const API:Number = 1;
       
      
      protected var _remove:Boolean;
      
      protected var _target:Object;
      
      protected var _index:int;
      
      protected var _filter:BitmapFilter;
      
      protected var _type:Class;
      
      public function FilterPlugin()
      {
         super();
      }
      
      public function onCompleteTween() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         if(_remove)
         {
            _loc1_ = _target.filters;
            if(!(_loc1_[_index] is _type))
            {
               _loc2_ = int(_loc1_.length);
               while(_loc2_--)
               {
                  if(_loc1_[_loc2_] is _type)
                  {
                     _loc1_.splice(_loc2_,1);
                     break;
                  }
               }
            }
            else
            {
               _loc1_.splice(_index,1);
            }
            _target.filters = _loc1_;
         }
      }
      
      protected function initFilter(param1:Object, param2:BitmapFilter, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:HexColorsPlugin = null;
         var _loc4_:Array = _target.filters;
         var _loc8_:Object = param1 is BitmapFilter ? {} : param1;
         _index = -1;
         if(_loc8_.index != null)
         {
            _index = _loc8_.index;
         }
         else
         {
            _loc6_ = int(_loc4_.length);
            while(_loc6_--)
            {
               if(_loc4_[_loc6_] is _type)
               {
                  _index = _loc6_;
                  break;
               }
            }
         }
         if(_index == -1 || _loc4_[_index] == null || _loc8_.addFilter == true)
         {
            _index = _loc8_.index != null ? int(_loc8_.index) : int(_loc4_.length);
            _loc4_[_index] = param2;
            _target.filters = _loc4_;
         }
         _filter = _loc4_[_index];
         if(_loc8_.remove == true)
         {
            _remove = true;
            this.onComplete = onCompleteTween;
         }
         _loc6_ = int(param3.length);
         while(_loc6_--)
         {
            if((_loc5_ = String(param3[_loc6_])) in param1 && _filter[_loc5_] != param1[_loc5_])
            {
               if(_loc5_ == "color" || _loc5_ == "highlightColor" || _loc5_ == "shadowColor")
               {
                  (_loc7_ = new HexColorsPlugin()).initColor(_filter,_loc5_,_filter[_loc5_],param1[_loc5_]);
                  _tweens[_tweens.length] = new PropTween(_loc7_,"changeFactor",0,1,_loc5_,false);
               }
               else if(_loc5_ == "quality" || _loc5_ == "inner" || _loc5_ == "knockout" || _loc5_ == "hideObject")
               {
                  _filter[_loc5_] = param1[_loc5_];
               }
               else
               {
                  addTween(_filter,_loc5_,_filter[_loc5_],param1[_loc5_],_loc5_);
               }
            }
         }
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc3_:PropTween = null;
         var _loc2_:int = 0;
         var _loc4_:Array = _target.filters;
         while(_loc2_--)
         {
            _loc3_ = _tweens[_loc2_];
            _loc3_.target[_loc3_.property] = _loc3_.start + _loc3_.change * param1;
         }
         if(!(_loc4_[_index] is _type))
         {
            _loc2_ = _index = _loc4_.length;
            while(_loc2_--)
            {
               if(_loc4_[_loc2_] is _type)
               {
                  _index = _loc2_;
                  break;
               }
            }
         }
         _loc4_[_index] = _filter;
         _target.filters = _loc4_;
      }
   }
}
