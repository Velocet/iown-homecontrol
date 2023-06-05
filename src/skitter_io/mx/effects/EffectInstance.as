package mx.effects
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.effects.effectClasses.PropertyChanges;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   
   public class EffectInstance extends EventDispatcher implements IEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _hideFocusRing:Boolean;
      
      private var delayStartTime:Number = 0;
      
      mx_internal var stopRepeat:Boolean = false;
      
      private var playCount:int = 0;
      
      private var _repeatCount:int = 0;
      
      private var _suspendBackgroundProcessing:Boolean = false;
      
      mx_internal var delayTimer:Timer;
      
      private var _triggerEvent:Event;
      
      private var _effectTargetHost:mx.effects.IEffectTargetHost;
      
      mx_internal var parentCompositeEffectInstance:mx.effects.EffectInstance;
      
      mx_internal var durationExplicitlySet:Boolean = false;
      
      private var _effect:mx.effects.IEffect;
      
      private var _target:Object;
      
      mx_internal var hideOnEffectEnd:Boolean = false;
      
      private var _startDelay:int = 0;
      
      private var delayElapsedTime:Number = 0;
      
      private var _repeatDelay:int = 0;
      
      private var _propertyChanges:PropertyChanges;
      
      private var _duration:Number = 500;
      
      private var _playReversed:Boolean;
      
      public function EffectInstance(param1:Object)
      {
         super();
         this.target = param1;
      }
      
      public function get playheadTime() : Number
      {
         return Math.max(playCount - 1,0) * duration + Math.max(playCount - 2,0) * repeatDelay + (mx_internal::playReversed ? 0 : startDelay);
      }
      
      public function get hideFocusRing() : Boolean
      {
         return _hideFocusRing;
      }
      
      public function stop() : void
      {
         if(mx_internal::delayTimer)
         {
            mx_internal::delayTimer.reset();
         }
         mx_internal::stopRepeat = true;
         finishEffect();
      }
      
      public function finishEffect() : void
      {
         playCount = 0;
         dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END,false,false,this));
         if(target)
         {
            target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END,false,false,this));
         }
         if(target is UIComponent)
         {
            UIComponent(target).effectFinished(this);
         }
         EffectManager.mx_internal::effectFinished(this);
      }
      
      public function set hideFocusRing(param1:Boolean) : void
      {
         _hideFocusRing = param1;
      }
      
      public function finishRepeat() : void
      {
         if(!mx_internal::stopRepeat && playCount != 0 && (playCount < repeatCount || repeatCount == 0))
         {
            if(repeatDelay > 0)
            {
               mx_internal::delayTimer = new Timer(repeatDelay,1);
               delayStartTime = getTimer();
               mx_internal::delayTimer.addEventListener(TimerEvent.TIMER,delayTimerHandler);
               mx_internal::delayTimer.start();
            }
            else
            {
               play();
            }
         }
         else
         {
            finishEffect();
         }
      }
      
      mx_internal function get playReversed() : Boolean
      {
         return _playReversed;
      }
      
      public function set effect(param1:mx.effects.IEffect) : void
      {
         _effect = param1;
      }
      
      public function get className() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         var _loc2_:int = _loc1_.indexOf("::");
         if(_loc2_ != -1)
         {
            _loc1_ = _loc1_.substr(_loc2_ + 2);
         }
         return _loc1_;
      }
      
      public function set duration(param1:Number) : void
      {
         mx_internal::durationExplicitlySet = true;
         _duration = param1;
      }
      
      mx_internal function set playReversed(param1:Boolean) : void
      {
         _playReversed = param1;
      }
      
      public function resume() : void
      {
         if(mx_internal::delayTimer && !isNaN(delayElapsedTime))
         {
            mx_internal::delayTimer.delay = !mx_internal::playReversed ? 0 - delayElapsedTime : delayElapsedTime;
            mx_internal::delayTimer.start();
         }
      }
      
      public function get propertyChanges() : PropertyChanges
      {
         return _propertyChanges;
      }
      
      public function set target(param1:Object) : void
      {
         _target = param1;
      }
      
      public function get repeatCount() : int
      {
         return _repeatCount;
      }
      
      mx_internal function playWithNoDuration() : void
      {
         duration = 0;
         repeatCount = 1;
         repeatDelay = 0;
         startDelay = 0;
         startEffect();
      }
      
      public function get startDelay() : int
      {
         return _startDelay;
      }
      
      mx_internal function get actualDuration() : Number
      {
         var _loc1_:Number = NaN;
         if(repeatCount > 0)
         {
            _loc1_ = duration * repeatCount + (repeatDelay * repeatCount - 1) + startDelay;
         }
         return _loc1_;
      }
      
      public function play() : void
      {
         ++playCount;
         dispatchEvent(new EffectEvent(EffectEvent.EFFECT_START,false,false,this));
         if(target)
         {
            target.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_START,false,false,this));
         }
      }
      
      public function get suspendBackgroundProcessing() : Boolean
      {
         return _suspendBackgroundProcessing;
      }
      
      public function get effectTargetHost() : mx.effects.IEffectTargetHost
      {
         return _effectTargetHost;
      }
      
      public function set repeatDelay(param1:int) : void
      {
         _repeatDelay = param1;
      }
      
      public function set propertyChanges(param1:PropertyChanges) : void
      {
         _propertyChanges = param1;
      }
      
      mx_internal function eventHandler(param1:Event) : void
      {
         if(param1.type == FlexEvent.SHOW && mx_internal::hideOnEffectEnd == true)
         {
            mx_internal::hideOnEffectEnd = false;
            param1.target.removeEventListener(FlexEvent.SHOW,mx_internal::eventHandler);
         }
      }
      
      public function set repeatCount(param1:int) : void
      {
         _repeatCount = param1;
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         mx_internal::delayTimer.reset();
         delayStartTime = NaN;
         delayElapsedTime = NaN;
         play();
      }
      
      public function set suspendBackgroundProcessing(param1:Boolean) : void
      {
         _suspendBackgroundProcessing = param1;
      }
      
      public function set triggerEvent(param1:Event) : void
      {
         _triggerEvent = param1;
      }
      
      public function set startDelay(param1:int) : void
      {
         _startDelay = param1;
      }
      
      public function get effect() : mx.effects.IEffect
      {
         return _effect;
      }
      
      public function set effectTargetHost(param1:mx.effects.IEffectTargetHost) : void
      {
         _effectTargetHost = param1;
      }
      
      public function get target() : Object
      {
         return _target;
      }
      
      public function startEffect() : void
      {
         EffectManager.mx_internal::effectStarted(this);
         if(target is UIComponent)
         {
            UIComponent(target).effectStarted(this);
         }
         if(startDelay > 0 && !mx_internal::playReversed)
         {
            mx_internal::delayTimer = new Timer(startDelay,1);
            delayStartTime = getTimer();
            mx_internal::delayTimer.addEventListener(TimerEvent.TIMER,delayTimerHandler);
            mx_internal::delayTimer.start();
         }
         else
         {
            play();
         }
      }
      
      public function get repeatDelay() : int
      {
         return _repeatDelay;
      }
      
      public function get duration() : Number
      {
         if(!mx_internal::durationExplicitlySet && Boolean(mx_internal::parentCompositeEffectInstance))
         {
            return mx_internal::parentCompositeEffectInstance.duration;
         }
         return _duration;
      }
      
      public function initEffect(param1:Event) : void
      {
         triggerEvent = param1;
         switch(param1.type)
         {
            case "resizeStart":
            case "resizeEnd":
               if(!mx_internal::durationExplicitlySet)
               {
                  duration = 250;
               }
               break;
            case FlexEvent.HIDE:
               target.setVisible(true,true);
               mx_internal::hideOnEffectEnd = true;
               target.addEventListener(FlexEvent.SHOW,mx_internal::eventHandler);
         }
      }
      
      public function get triggerEvent() : Event
      {
         return _triggerEvent;
      }
      
      public function end() : void
      {
         if(mx_internal::delayTimer)
         {
            mx_internal::delayTimer.reset();
         }
         mx_internal::stopRepeat = true;
         finishEffect();
      }
      
      public function reverse() : void
      {
         if(repeatCount > 0)
         {
            playCount = repeatCount - playCount + 1;
         }
      }
      
      public function pause() : void
      {
         if(mx_internal::delayTimer && false && !isNaN(delayStartTime))
         {
            mx_internal::delayTimer.stop();
            delayElapsedTime = getTimer() - delayStartTime;
         }
      }
   }
}
