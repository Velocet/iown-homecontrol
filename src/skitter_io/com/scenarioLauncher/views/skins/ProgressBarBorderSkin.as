package com.scenarioLauncher.views.skins
{
   import mx.skins.Border;
   
   public class ProgressBarBorderSkin extends Border
   {
       
      
      public function ProgressBarBorderSkin()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 195;
      }
      
      override public function get measuredHeight() : Number
      {
         return 6;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = 12037546;
         var _loc4_:Number = 9866375;
         var _loc5_:Number = 12037546;
         var _loc6_:Number = getStyle("indeterminateMoveInterval");
         if(isNaN(_loc6_) || _loc6_ == 0)
         {
            _loc6_ = 28;
         }
         graphics.clear();
         graphics.beginFill(_loc4_,1);
         graphics.drawRect(0,0,param1,param2);
         graphics.endFill();
         graphics.beginFill(_loc5_,1);
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            graphics.beginFill(_loc5_,1);
            graphics.moveTo(_loc7_,1);
            graphics.lineTo(Math.min(_loc7_ + 14,param1),0);
            graphics.lineTo(Math.min(_loc7_ + 10,param1),param2);
            graphics.lineTo(Math.max(_loc7_ - 4,0),param2);
            graphics.lineTo(_loc7_,0);
            graphics.endFill();
            _loc7_ += _loc6_;
         }
      }
   }
}
