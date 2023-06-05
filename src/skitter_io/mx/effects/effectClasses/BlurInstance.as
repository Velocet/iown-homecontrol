package mx.effects.effectClasses
{
   import flash.events.Event;
   import flash.filters.BlurFilter;
   import mx.core.mx_internal;
   
   public class BlurInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var blurXTo:Number;
      
      public var blurYTo:Number;
      
      public var blurXFrom:Number;
      
      public var blurYFrom:Number;
      
      public function BlurInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
      }
      
      override public function onTweenEnd(param1:Object) : void
      {
         setBlurFilter(param1[0],param1[1]);
         super.onTweenEnd(param1);
      }
      
      private function setBlurFilter(param1:Number, param2:Number) : void
      {
         var _loc3_:Array = target.filters;
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc3_[_loc5_] is BlurFilter)
            {
               _loc3_.splice(_loc5_,1);
            }
            _loc5_++;
         }
         if(Boolean(param1) || Boolean(param2))
         {
            _loc3_.push(new BlurFilter(param1,param2));
         }
         target.filters = _loc3_;
      }
      
      override public function play() : void
      {
         super.play();
         if(isNaN(blurXFrom))
         {
            blurXFrom = 4;
         }
         if(isNaN(blurXTo))
         {
            blurXTo = 0;
         }
         if(isNaN(blurYFrom))
         {
            blurYFrom = 4;
         }
         if(isNaN(blurYTo))
         {
            blurYTo = 0;
         }
         tween = createTween(this,[blurXFrom,blurYFrom],[blurXTo,blurYTo],duration);
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         setBlurFilter(param1[0],param1[1]);
      }
   }
}
