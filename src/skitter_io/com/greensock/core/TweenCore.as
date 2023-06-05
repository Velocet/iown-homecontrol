package com.greensock.core
{
   import com.greensock.*;
   
   public class TweenCore
   {
      
      public static const version:Number = 1.35;
      
      protected static var _classInitted:Boolean;
       
      
      public var initted:Boolean;
      
      protected var _hasUpdate:Boolean;
      
      public var active:Boolean;
      
      protected var _delay:Number;
      
      public var cachedTime:Number;
      
      public var cachedReversed:Boolean;
      
      public var nextNode:com.greensock.core.TweenCore;
      
      protected var _rawPrevTime:Number = -1;
      
      public var vars:Object;
      
      public var cachedTotalTime:Number;
      
      public var timeline:com.greensock.core.SimpleTimeline;
      
      public var data;
      
      public var cachedStartTime:Number;
      
      public var prevNode:com.greensock.core.TweenCore;
      
      public var cachedDuration:Number;
      
      public var gc:Boolean;
      
      protected var _pauseTime:Number;
      
      public var cacheIsDirty:Boolean;
      
      public var cachedPaused:Boolean;
      
      public var cachedTimeScale:Number;
      
      public var cachedTotalDuration:Number;
      
      public function TweenCore(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 != null ? param2 : {};
         this.cachedDuration = this.cachedTotalDuration = param1;
         _delay = "delay" in this.vars ? Number(this.vars.delay) : 0;
         this.cachedTimeScale = "timeScale" in this.vars ? Number(this.vars.timeScale) : 1;
         this.active = Boolean(param1 == 0 && _delay == 0 && this.vars.immediateRender != false);
         this.cachedTotalTime = this.cachedTime = 0;
         this.data = this.vars.data;
         if(!_classInitted)
         {
            if(!isNaN(TweenLite.rootFrame))
            {
               return;
            }
            TweenLite.initClass();
            _classInitted = true;
         }
         var _loc3_:com.greensock.core.SimpleTimeline = this.vars.timeline is com.greensock.core.SimpleTimeline ? this.vars.timeline : (!!this.vars.useFrames ? TweenLite.rootFramesTimeline : TweenLite.rootTimeline);
         this.cachedStartTime = _loc3_.cachedTotalTime + _delay;
         _loc3_.addChild(this);
         if(this.vars.reversed)
         {
            this.cachedReversed = true;
         }
         if(this.vars.paused)
         {
            this.paused = true;
         }
      }
      
      public function renderTime(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function get delay() : Number
      {
         return _delay;
      }
      
      public function get duration() : Number
      {
         return this.cachedDuration;
      }
      
      public function restart(param1:Boolean = false, param2:Boolean = true) : void
      {
         this.reversed = false;
         this.paused = false;
         this.setTotalTime(param1 ? -_delay : 0,param2);
      }
      
      public function set reversed(param1:Boolean) : void
      {
         if(param1 != this.cachedReversed)
         {
            this.cachedReversed = param1;
            setTotalTime(this.cachedTotalTime,true);
         }
      }
      
      public function set startTime(param1:Number) : void
      {
         var _loc2_:Boolean = Boolean(this.timeline != null && (param1 != this.cachedStartTime || this.gc));
         this.cachedStartTime = param1;
         if(_loc2_)
         {
            this.timeline.addChild(this);
         }
      }
      
      public function set delay(param1:Number) : void
      {
         this.startTime += param1 - _delay;
         _delay = param1;
      }
      
      public function resume() : void
      {
         this.paused = false;
      }
      
      public function get paused() : Boolean
      {
         return this.cachedPaused;
      }
      
      public function play() : void
      {
         this.reversed = false;
         this.paused = false;
      }
      
      public function set duration(param1:Number) : void
      {
         this.cachedDuration = this.cachedTotalDuration = param1;
         setDirtyCache(false);
      }
      
      public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!param1)
         {
            renderTime(this.cachedTotalDuration,param2,false);
            return;
         }
         if(this.timeline.autoRemoveChildren)
         {
            this.setEnabled(false,false);
         }
         else
         {
            this.active = false;
         }
         if(!param2)
         {
            if(this.vars.onComplete && this.cachedTotalTime == this.cachedTotalDuration && !this.cachedReversed)
            {
               this.vars.onComplete.apply(null,this.vars.onCompleteParams);
            }
            else if(this.cachedReversed && this.cachedTotalTime == 0 && Boolean(this.vars.onReverseComplete))
            {
               this.vars.onReverseComplete.apply(null,this.vars.onReverseCompleteParams);
            }
         }
      }
      
      public function invalidate() : void
      {
      }
      
      public function get totalTime() : Number
      {
         return this.cachedTotalTime;
      }
      
      public function get reversed() : Boolean
      {
         return this.cachedReversed;
      }
      
      public function get startTime() : Number
      {
         return this.cachedStartTime;
      }
      
      public function set currentTime(param1:Number) : void
      {
         setTotalTime(param1,false);
      }
      
      protected function setDirtyCache(param1:Boolean = true) : void
      {
         var _loc2_:com.greensock.core.TweenCore = param1 ? {} : this.timeline;
         while(_loc2_)
         {
            _loc2_.cacheIsDirty = true;
            _loc2_ = _loc2_.timeline;
         }
      }
      
      public function reverse(param1:Boolean = true) : void
      {
         this.reversed = true;
         if(param1)
         {
            this.paused = false;
         }
         else if(this.gc)
         {
            this.setEnabled(true,false);
         }
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(param1 != this.cachedPaused && Boolean(this.timeline))
         {
            if(param1)
            {
               _pauseTime = this.timeline.rawTime;
            }
            else
            {
               this.cachedStartTime += this.timeline.rawTime - _pauseTime;
               _pauseTime = NaN;
               setDirtyCache(false);
            }
            this.cachedPaused = param1;
            this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.cachedTotalDuration);
         }
         if(!param1 && this.gc)
         {
            this.setTotalTime(this.cachedTotalTime,false);
            this.setEnabled(true,false);
         }
      }
      
      public function kill() : void
      {
         setEnabled(false,false);
      }
      
      public function set totalTime(param1:Number) : void
      {
         setTotalTime(param1,false);
      }
      
      public function get currentTime() : Number
      {
         return this.cachedTime;
      }
      
      protected function setTotalTime(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.timeline)
         {
            _loc3_ = Boolean(_pauseTime) || _pauseTime == 0 ? _pauseTime : this.timeline.cachedTotalTime;
            if(this.cachedReversed)
            {
               _loc4_ = this.cacheIsDirty ? this.totalDuration : this.cachedTotalDuration;
               this.cachedStartTime = _loc3_ - (_loc4_ - param1) / this.cachedTimeScale;
            }
            else
            {
               this.cachedStartTime = _loc3_ - param1 / this.cachedTimeScale;
            }
            if(!this.timeline.cacheIsDirty)
            {
               setDirtyCache(false);
            }
            if(this.cachedTotalTime != param1)
            {
               renderTime(param1,param2,false);
            }
         }
      }
      
      public function pause() : void
      {
         this.paused = true;
      }
      
      public function set totalDuration(param1:Number) : void
      {
         this.duration = param1;
      }
      
      public function get totalDuration() : Number
      {
         return this.cachedTotalDuration;
      }
      
      public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         if(param1)
         {
            this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.cachedTotalDuration);
            if(!param2 && this.gc)
            {
               this.timeline.addChild(this);
            }
         }
         else
         {
            this.active = false;
            if(!param2)
            {
               this.timeline.remove(this,true);
            }
         }
         this.gc = !param1;
         return false;
      }
   }
}
