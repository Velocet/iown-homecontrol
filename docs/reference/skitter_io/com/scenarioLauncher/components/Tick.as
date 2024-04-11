package com.scenarioLauncher.components
{
   import flash.display.Sprite;
   import mx.effects.Fade;
   
   public class Tick extends Sprite
   {
       
      
      private var tickFade:Fade;
      
      public function Tick(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:uint)
      {
         this.tickFade = new Fade(this);
         super();
         this.graphics.lineStyle(param5,param6,1,false,"normal","rounded");
         this.graphics.moveTo(param1,param2);
         this.graphics.lineTo(param3,param4);
      }
      
      public function fade(param1:Number) : void
      {
         this.tickFade.alphaFrom = 1;
         this.tickFade.alphaTo = 0.1;
         this.tickFade.duration = param1;
         this.tickFade.play();
      }
   }
}
