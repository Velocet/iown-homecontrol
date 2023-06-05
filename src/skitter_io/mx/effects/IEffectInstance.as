package mx.effects
{
   import flash.events.Event;
   import mx.effects.effectClasses.PropertyChanges;
   
   public interface IEffectInstance
   {
       
      
      function get playheadTime() : Number;
      
      function get triggerEvent() : Event;
      
      function set triggerEvent(param1:Event) : void;
      
      function get hideFocusRing() : Boolean;
      
      function initEffect(param1:Event) : void;
      
      function set startDelay(param1:int) : void;
      
      function get effectTargetHost() : IEffectTargetHost;
      
      function finishEffect() : void;
      
      function set hideFocusRing(param1:Boolean) : void;
      
      function finishRepeat() : void;
      
      function set repeatDelay(param1:int) : void;
      
      function get effect() : IEffect;
      
      function startEffect() : void;
      
      function get duration() : Number;
      
      function get target() : Object;
      
      function get startDelay() : int;
      
      function stop() : void;
      
      function set effectTargetHost(param1:IEffectTargetHost) : void;
      
      function set propertyChanges(param1:PropertyChanges) : void;
      
      function set effect(param1:IEffect) : void;
      
      function get className() : String;
      
      function set duration(param1:Number) : void;
      
      function set target(param1:Object) : void;
      
      function end() : void;
      
      function resume() : void;
      
      function get propertyChanges() : PropertyChanges;
      
      function set repeatCount(param1:int) : void;
      
      function reverse() : void;
      
      function get repeatCount() : int;
      
      function pause() : void;
      
      function get repeatDelay() : int;
      
      function set suspendBackgroundProcessing(param1:Boolean) : void;
      
      function play() : void;
      
      function get suspendBackgroundProcessing() : Boolean;
   }
}
