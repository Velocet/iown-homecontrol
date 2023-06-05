package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   
   public class FramePlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      protected var _target:MovieClip;
      
      public var frame:int;
      
      public function FramePlugin()
      {
         super();
         this.propName = "frame";
         this.overwriteProps = ["frame","frameLabel"];
         this.round = true;
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         if(!(param1 is MovieClip) || isNaN(param2))
         {
            return false;
         }
         _target = param1 as MovieClip;
         this.frame = _target.currentFrame;
         addTween(this,"frame",this.frame,param2,"frame");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         updateTweens(param1);
         _target.gotoAndStop(this.frame);
      }
   }
}
