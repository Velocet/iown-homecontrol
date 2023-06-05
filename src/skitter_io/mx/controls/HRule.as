package mx.controls
{
   import flash.display.Graphics;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   public class HRule extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const DEFAULT_PREFERRED_WIDTH:Number = 100;
       
      
      public function HRule()
      {
         super();
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredWidth = DEFAULT_PREFERRED_WIDTH;
         measuredHeight = getStyle("strokeWidth");
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         var _loc4_:Number = getStyle("strokeColor");
         var _loc5_:Number = getStyle("shadowColor");
         var _loc6_:Number;
         if((_loc6_ = getStyle("strokeWidth")) > param2)
         {
            _loc6_ = param2;
         }
         var _loc7_:Number = 0;
         var _loc8_:Number = (param2 - _loc6_) / 2;
         var _loc9_:Number = param1;
         var _loc10_:Number = _loc8_ + _loc6_;
         if(_loc6_ == 1)
         {
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_,param1,_loc10_ - _loc8_);
            _loc3_.endFill();
         }
         else if(_loc6_ == 2)
         {
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_,param1,1);
            _loc3_.endFill();
            _loc3_.beginFill(_loc5_);
            _loc3_.drawRect(_loc7_,_loc10_ - 1,param1,1);
            _loc3_.endFill();
         }
         else if(_loc6_ > 2)
         {
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_,param1 - 1,1);
            _loc3_.endFill();
            _loc3_.beginFill(_loc5_);
            _loc3_.drawRect(_loc9_ - 1,_loc8_,1,_loc10_ - _loc8_ - 1);
            _loc3_.drawRect(_loc7_,_loc10_ - 1,param1,1);
            _loc3_.endFill();
            _loc3_.beginFill(_loc4_);
            _loc3_.drawRect(_loc7_,_loc8_ + 1,1,_loc10_ - _loc8_ - 2);
            _loc3_.endFill();
         }
      }
   }
}
