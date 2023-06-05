package mx.effects
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.getQualifiedClassName;
   import mx.core.IFlexDisplayObject;
   import mx.core.mx_internal;
   import mx.effects.effectClasses.AddRemoveEffectTargetFilter;
   import mx.effects.effectClasses.HideShowEffectTargetFilter;
   import mx.effects.effectClasses.PropertyChanges;
   import mx.events.EffectEvent;
   import mx.managers.LayoutManager;
   
   public class Effect extends EventDispatcher implements IEffect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _perElementOffset:Number = 0;
      
      private var _hideFocusRing:Boolean = false;
      
      private var _customFilter:mx.effects.EffectTargetFilter;
      
      public var repeatCount:int = 1;
      
      public var suspendBackgroundProcessing:Boolean = false;
      
      public var startDelay:int = 0;
      
      private var _relevantProperties:Array;
      
      private var _callValidateNow:Boolean = false;
      
      mx_internal var applyActualDimensions:Boolean = true;
      
      private var _filter:String;
      
      private var _triggerEvent:Event;
      
      private var _effectTargetHost:mx.effects.IEffectTargetHost;
      
      mx_internal var durationExplicitlySet:Boolean = false;
      
      public var repeatDelay:int = 0;
      
      private var _targets:Array;
      
      mx_internal var propertyChangesArray:Array;
      
      mx_internal var filterObject:mx.effects.EffectTargetFilter;
      
      protected var endValuesCaptured:Boolean = false;
      
      public var instanceClass:Class;
      
      private var _duration:Number = 500;
      
      private var isPaused:Boolean = false;
      
      private var _relevantStyles:Array;
      
      private var _instances:Array;
      
      public function Effect(param1:Object = null)
      {
         _instances = [];
         instanceClass = IEffectInstance;
         _relevantStyles = [];
         _targets = [];
         super();
         this.target = param1;
      }
      
      private static function mergeArrays(param1:Array, param2:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               _loc4_ = true;
               _loc5_ = 0;
               while(_loc5_ < param1.length)
               {
                  if(param1[_loc5_] == param2[_loc3_])
                  {
                     _loc4_ = false;
                     break;
                  }
                  _loc5_++;
               }
               if(_loc4_)
               {
                  param1.push(param2[_loc3_]);
               }
               _loc3_++;
            }
         }
         return param1;
      }
      
      private static function stripUnchangedValues(param1:Array) : Array
      {
         var _loc3_:Object = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            for(_loc3_ in param1[_loc2_].start)
            {
               if(param1[_loc2_].start[_loc3_] == param1[_loc2_].end[_loc3_] || typeof param1[_loc2_].start[_loc3_] == "number" && typeof param1[_loc2_].end[_loc3_] == "number" && isNaN(param1[_loc2_].start[_loc3_]) && isNaN(param1[_loc2_].end[_loc3_]))
               {
                  delete param1[_loc2_].start[_loc3_];
                  delete param1[_loc2_].end[_loc3_];
               }
            }
            _loc2_++;
         }
         return param1;
      }
      
      public function get targets() : Array
      {
         return _targets;
      }
      
      public function set targets(param1:Array) : void
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:int = _loc2_ - 1;
         while(_loc3_ > 0)
         {
            if(param1[_loc3_] == null)
            {
               param1.splice(_loc3_,1);
            }
            _loc3_--;
         }
         _targets = param1;
      }
      
      public function set hideFocusRing(param1:Boolean) : void
      {
         _hideFocusRing = param1;
      }
      
      public function get hideFocusRing() : Boolean
      {
         return _hideFocusRing;
      }
      
      public function stop() : void
      {
         var _loc3_:IEffectInstance = null;
         var _loc1_:int = 0;
         var _loc2_:int = _loc1_;
         while(_loc2_ >= 0)
         {
            _loc3_ = IEffectInstance(_instances[_loc2_]);
            if(_loc3_)
            {
               _loc3_.stop();
            }
            _loc2_--;
         }
      }
      
      public function captureStartValues() : void
      {
         if(false)
         {
            mx_internal::propertyChangesArray = mx_internal::captureValues(null,true);
            _callValidateNow = true;
         }
         endValuesCaptured = false;
      }
      
      mx_internal function captureValues(param1:Array, param2:Boolean) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(!param1)
         {
            param1 = [];
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               param1.push(new PropertyChanges(targets[_loc4_]));
               _loc4_++;
            }
         }
         var _loc5_:Array;
         if((Boolean(_loc5_ = !mx_internal::filterObject ? relevantProperties : mergeArrays(relevantProperties,mx_internal::filterObject.filterProperties))) && _loc5_.length > 0)
         {
            _loc3_ = int(param1.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc7_ = param1[_loc4_].target;
               _loc6_ = param2 ? param1[_loc4_].start : param1[_loc4_].end;
               _loc8_ = int(_loc5_.length);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc6_[_loc5_[_loc9_]] = getValueFromTarget(_loc7_,_loc5_[_loc9_]);
                  _loc9_++;
               }
               _loc4_++;
            }
         }
         var _loc10_:Array;
         if((Boolean(_loc10_ = !mx_internal::filterObject ? relevantStyles : mergeArrays(relevantStyles,mx_internal::filterObject.filterStyles))) && _loc10_.length > 0)
         {
            _loc3_ = int(param1.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc7_ = param1[_loc4_].target;
               _loc6_ = param2 ? param1[_loc4_].start : param1[_loc4_].end;
               _loc8_ = int(_loc10_.length);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc6_[_loc10_[_loc9_]] = _loc7_.getStyle(_loc10_[_loc9_]);
                  _loc9_++;
               }
               _loc4_++;
            }
         }
         return param1;
      }
      
      protected function getValueFromTarget(param1:Object, param2:String) : *
      {
         if(param2 in param1)
         {
            return param1[param2];
         }
         return undefined;
      }
      
      public function set target(param1:Object) : void
      {
         _targets.splice(0);
         if(param1)
         {
            _targets[0] = param1;
         }
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
      
      public function set perElementOffset(param1:Number) : void
      {
         _perElementOffset = param1;
      }
      
      public function resume() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(isPlaying && isPaused)
         {
            isPaused = false;
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               IEffectInstance(_instances[_loc2_]).resume();
               _loc2_++;
            }
         }
      }
      
      public function set duration(param1:Number) : void
      {
         mx_internal::durationExplicitlySet = true;
         _duration = param1;
      }
      
      public function play(param1:Array = null, param2:Boolean = false) : Array
      {
         var _loc6_:IEffectInstance = null;
         if(param1 == null && mx_internal::propertyChangesArray != null)
         {
            if(_callValidateNow)
            {
               LayoutManager.getInstance().validateNow();
            }
            if(!endValuesCaptured)
            {
               mx_internal::propertyChangesArray = mx_internal::captureValues(mx_internal::propertyChangesArray,false);
            }
            mx_internal::propertyChangesArray = stripUnchangedValues(mx_internal::propertyChangesArray);
            mx_internal::applyStartValues(mx_internal::propertyChangesArray,this.targets);
         }
         var _loc3_:Array = createInstances(param1);
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = IEffectInstance(_loc3_[_loc5_]);
            Object(_loc6_).playReversed = param2;
            _loc6_.startEffect();
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function captureEndValues() : void
      {
         mx_internal::propertyChangesArray = mx_internal::captureValues(mx_internal::propertyChangesArray,false);
         endValuesCaptured = true;
      }
      
      protected function filterInstance(param1:Array, param2:Object) : Boolean
      {
         if(mx_internal::filterObject)
         {
            return mx_internal::filterObject.filterInstance(param1,effectTargetHost,param2);
         }
         return true;
      }
      
      public function get customFilter() : mx.effects.EffectTargetFilter
      {
         return _customFilter;
      }
      
      public function get effectTargetHost() : mx.effects.IEffectTargetHost
      {
         return _effectTargetHost;
      }
      
      public function set relevantProperties(param1:Array) : void
      {
         _relevantProperties = param1;
      }
      
      public function captureMoreStartValues(param1:Array) : void
      {
         var _loc2_:Array = null;
         if(param1.length > 0)
         {
            _loc2_ = mx_internal::captureValues(null,true);
            mx_internal::propertyChangesArray = mx_internal::propertyChangesArray.concat(_loc2_);
         }
      }
      
      public function deleteInstance(param1:IEffectInstance) : void
      {
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_START,effectStartHandler);
         EventDispatcher(param1).removeEventListener(EffectEvent.EFFECT_END,effectEndHandler);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_instances[_loc3_] === param1)
            {
               _instances.splice(_loc3_,1);
            }
            _loc3_++;
         }
      }
      
      public function get filter() : String
      {
         return _filter;
      }
      
      public function set triggerEvent(param1:Event) : void
      {
         _triggerEvent = param1;
      }
      
      public function get target() : Object
      {
         if(false)
         {
            return _targets[0];
         }
         return null;
      }
      
      public function get duration() : Number
      {
         return _duration;
      }
      
      public function set customFilter(param1:mx.effects.EffectTargetFilter) : void
      {
         _customFilter = param1;
         mx_internal::filterObject = param1;
      }
      
      public function get perElementOffset() : Number
      {
         return _perElementOffset;
      }
      
      public function set effectTargetHost(param1:mx.effects.IEffectTargetHost) : void
      {
         _effectTargetHost = param1;
      }
      
      public function get isPlaying() : Boolean
      {
         return Boolean(_instances) && false;
      }
      
      protected function effectEndHandler(param1:EffectEvent) : void
      {
         var _loc2_:IEffectInstance = IEffectInstance(param1.effectInstance);
         deleteInstance(_loc2_);
         dispatchEvent(param1);
      }
      
      public function get relevantProperties() : Array
      {
         if(_relevantProperties)
         {
            return _relevantProperties;
         }
         return getAffectedProperties();
      }
      
      public function createInstance(param1:Object = null) : IEffectInstance
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1)
         {
            param1 = this.target;
         }
         var _loc2_:IEffectInstance = null;
         var _loc3_:* = null;
         var _loc4_:Boolean = true;
         var _loc5_:Boolean = false;
         if(mx_internal::propertyChangesArray)
         {
            _loc5_ = true;
            _loc4_ = filterInstance(mx_internal::propertyChangesArray,param1);
         }
         if(_loc4_)
         {
            _loc2_ = IEffectInstance(new instanceClass(param1));
            initInstance(_loc2_);
            if(_loc5_)
            {
               _loc6_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(mx_internal::propertyChangesArray[_loc7_].target == param1)
                  {
                     _loc2_.propertyChanges = mx_internal::propertyChangesArray[_loc7_];
                  }
                  _loc7_++;
               }
            }
            EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_START,effectStartHandler);
            EventDispatcher(_loc2_).addEventListener(EffectEvent.EFFECT_END,effectEndHandler);
            _instances.push(_loc2_);
            if(triggerEvent)
            {
               _loc2_.initEffect(triggerEvent);
            }
         }
         return _loc2_;
      }
      
      protected function effectStartHandler(param1:EffectEvent) : void
      {
         dispatchEvent(param1);
      }
      
      public function getAffectedProperties() : Array
      {
         return [];
      }
      
      public function set relevantStyles(param1:Array) : void
      {
         _relevantStyles = param1;
      }
      
      public function get triggerEvent() : Event
      {
         return _triggerEvent;
      }
      
      protected function applyValueToTarget(param1:Object, param2:String, param3:*, param4:Object) : void
      {
         var target:Object = param1;
         var property:String = param2;
         var value:* = param3;
         var props:Object = param4;
         if(property in target)
         {
            try
            {
               if(mx_internal::applyActualDimensions && target is IFlexDisplayObject && property == "height")
               {
                  target.setActualSize(target.width,value);
               }
               else if(mx_internal::applyActualDimensions && target is IFlexDisplayObject && property == "width")
               {
                  target.setActualSize(value,target.height);
               }
               else
               {
                  target[property] = value;
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      protected function initInstance(param1:IEffectInstance) : void
      {
         param1.duration = duration;
         Object(param1).durationExplicitlySet = mx_internal::durationExplicitlySet;
         param1.effect = this;
         param1.effectTargetHost = effectTargetHost;
         param1.hideFocusRing = hideFocusRing;
         param1.repeatCount = repeatCount;
         param1.repeatDelay = repeatDelay;
         param1.startDelay = startDelay;
         param1.suspendBackgroundProcessing = suspendBackgroundProcessing;
      }
      
      mx_internal function applyStartValues(param1:Array, param2:Array) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:Boolean = false;
         var _loc3_:Array = relevantProperties;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = param1[_loc5_].target;
            _loc9_ = false;
            _loc6_ = int(param2.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if(param2[_loc7_] == _loc8_)
               {
                  _loc9_ = filterInstance(param1,_loc8_);
                  break;
               }
               _loc7_++;
            }
            if(_loc9_)
            {
               _loc6_ = int(_loc3_.length);
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(_loc3_[_loc7_] in param1[_loc5_].start && _loc3_[_loc7_] in _loc8_)
                  {
                     applyValueToTarget(_loc8_,_loc3_[_loc7_],param1[_loc5_].start[_loc3_[_loc7_]],param1[_loc5_].start);
                  }
                  _loc7_++;
               }
               _loc6_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(relevantStyles[_loc7_] in param1[_loc5_].start)
                  {
                     _loc8_.setStyle(relevantStyles[_loc7_],param1[_loc5_].start[relevantStyles[_loc7_]]);
                  }
                  _loc7_++;
               }
            }
            _loc5_++;
         }
      }
      
      public function end(param1:IEffectInstance = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:IEffectInstance = null;
         if(param1)
         {
            param1.end();
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = _loc2_;
            while(_loc3_ >= 0)
            {
               if(_loc4_ = IEffectInstance(_instances[_loc3_]))
               {
                  _loc4_.end();
               }
               _loc3_--;
            }
         }
      }
      
      public function get relevantStyles() : Array
      {
         return _relevantStyles;
      }
      
      public function createInstances(param1:Array = null) : Array
      {
         var _loc6_:IEffectInstance = null;
         if(!param1)
         {
            param1 = this.targets;
         }
         var _loc2_:* = [];
         var _loc3_:int = int(param1.length);
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if(_loc6_ = createInstance(param1[_loc5_]))
            {
               _loc6_.startDelay += _loc4_;
               _loc4_ += perElementOffset;
               _loc2_.push(_loc6_);
            }
            _loc5_++;
         }
         triggerEvent = null;
         return _loc2_;
      }
      
      public function pause() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(isPlaying && !isPaused)
         {
            isPaused = true;
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               IEffectInstance(_instances[_loc2_]).pause();
               _loc2_++;
            }
         }
      }
      
      public function set filter(param1:String) : void
      {
         if(!customFilter)
         {
            _filter = param1;
            switch(param1)
            {
               case "add":
               case "remove":
                  mx_internal::filterObject = new AddRemoveEffectTargetFilter();
                  AddRemoveEffectTargetFilter(mx_internal::filterObject).add = param1 == "add";
                  break;
               case "hide":
               case "show":
                  mx_internal::filterObject = new HideShowEffectTargetFilter();
                  HideShowEffectTargetFilter(mx_internal::filterObject).show = param1 == "show";
                  break;
               case "move":
                  mx_internal::filterObject = new mx.effects.EffectTargetFilter();
                  mx_internal::filterObject.filterProperties = ["x","y"];
                  break;
               case "resize":
                  mx_internal::filterObject = new mx.effects.EffectTargetFilter();
                  mx_internal::filterObject.filterProperties = ["width","height"];
                  break;
               case "addItem":
                  mx_internal::filterObject = new mx.effects.EffectTargetFilter();
                  mx_internal::filterObject.requiredSemantics = {"added":true};
                  break;
               case "removeItem":
                  mx_internal::filterObject = new mx.effects.EffectTargetFilter();
                  mx_internal::filterObject.requiredSemantics = {"removed":true};
                  break;
               case "replacedItem":
                  mx_internal::filterObject = new mx.effects.EffectTargetFilter();
                  mx_internal::filterObject.requiredSemantics = {"replaced":true};
                  break;
               case "replacementItem":
                  mx_internal::filterObject = new mx.effects.EffectTargetFilter();
                  mx_internal::filterObject.requiredSemantics = {"replacement":true};
                  break;
               default:
                  mx_internal::filterObject = null;
            }
         }
      }
      
      public function reverse() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(isPlaying)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               IEffectInstance(_instances[_loc2_]).reverse();
               _loc2_++;
            }
         }
      }
   }
}
