package mx.effects
{
   import flash.events.EventDispatcher;
   import mx.core.mx_internal;
   import mx.effects.effectClasses.TweenEffectInstance;
   import mx.events.TweenEvent;
   
   public class TweenEffect extends Effect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var easingFunction:Function = null;
      
      public function TweenEffect(param1:Object = null)
      {
         super(param1);
         instanceClass = TweenEffectInstance;
      }
      
      protected function tweenEventHandler(param1:TweenEvent) : void
      {
         dispatchEvent(param1);
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         TweenEffectInstance(param1).easingFunction = easingFunction;
         EventDispatcher(param1).addEventListener(TweenEvent.TWEEN_START,tweenEventHandler);
         EventDispatcher(param1).addEventListener(TweenEvent.TWEEN_UPDATE,tweenEventHandler);
         EventDispatcher(param1).addEventListener(TweenEvent.TWEEN_END,tweenEventHandler);
      }
   }
}
