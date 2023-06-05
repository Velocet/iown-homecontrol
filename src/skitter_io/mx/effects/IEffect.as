package mx.effects
{
   import flash.events.Event;
   
   public interface IEffect extends IAbstractEffect
   {
       
      
      function captureMoreStartValues(param1:Array) : void;
      
      function get triggerEvent() : Event;
      
      function set targets(param1:Array) : void;
      
      function captureStartValues() : void;
      
      function get hideFocusRing() : Boolean;
      
      function get customFilter() : EffectTargetFilter;
      
      function get effectTargetHost() : IEffectTargetHost;
      
      function set triggerEvent(param1:Event) : void;
      
      function set hideFocusRing(param1:Boolean) : void;
      
      function captureEndValues() : void;
      
      function get target() : Object;
      
      function set customFilter(param1:EffectTargetFilter) : void;
      
      function get duration() : Number;
      
      function get perElementOffset() : Number;
      
      function get targets() : Array;
      
      function set effectTargetHost(param1:IEffectTargetHost) : void;
      
      function get relevantStyles() : Array;
      
      function set relevantProperties(param1:Array) : void;
      
      function set target(param1:Object) : void;
      
      function get className() : String;
      
      function get isPlaying() : Boolean;
      
      function deleteInstance(param1:IEffectInstance) : void;
      
      function set duration(param1:Number) : void;
      
      function createInstances(param1:Array = null) : Array;
      
      function end(param1:IEffectInstance = null) : void;
      
      function set perElementOffset(param1:Number) : void;
      
      function resume() : void;
      
      function stop() : void;
      
      function set filter(param1:String) : void;
      
      function createInstance(param1:Object = null) : IEffectInstance;
      
      function play(param1:Array = null, param2:Boolean = false) : Array;
      
      function pause() : void;
      
      function get relevantProperties() : Array;
      
      function get filter() : String;
      
      function reverse() : void;
      
      function getAffectedProperties() : Array;
      
      function set relevantStyles(param1:Array) : void;
   }
}
