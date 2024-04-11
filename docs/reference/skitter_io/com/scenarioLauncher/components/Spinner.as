package com.scenarioLauncher.components
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class Spinner extends UIComponent
   {
      
      private static var classConstructed:Boolean = classConstruct();
      
      private static var STYLE_TICK_COLOR:String = "tickColor";
       
      
      public var autoPlay:Boolean = true;
      
      private var numTicksChanged:Boolean;
      
      private var tickWidthChanged:Boolean;
      
      private var tickColorChanged:Boolean;
      
      private var _speed:int = 1000;
      
      private var creation:Boolean = true;
      
      private var _size:Number = 30;
      
      private var _isPlaying:Boolean;
      
      private var fadeTimer:Timer;
      
      private var _tickWidth:Number = 3;
      
      private var _numTicks:int = 12;
      
      private var sizeChanged:Boolean;
      
      private var _895162581fadeSpeed:int = 600;
      
      public function Spinner()
      {
         super();
         addEventListener(FlexEvent.CREATION_COMPLETE,this.handleCreationComplete);
      }
      
      private static function classConstruct() : Boolean
      {
         return true;
      }
      
      public function get size() : Number
      {
         return this._size;
      }
      
      public function stop() : void
      {
         if(this.fadeTimer != null && this.fadeTimer.running)
         {
            this._isPlaying = false;
            this.fadeTimer.stop();
         }
      }
      
      private function handleCreationComplete(param1:FlexEvent) : void
      {
         removeEventListener(FlexEvent.CREATION_COMPLETE,this.handleCreationComplete);
         if(this.autoPlay)
         {
            this.play();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set size(param1:Number) : void
      {
         var _loc2_:Object = this.size;
         if(_loc2_ !== param1)
         {
            this._3530753size = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"size",_loc2_,param1));
         }
      }
      
      public function get speed() : int
      {
         return this._speed;
      }
      
      private function set _84384215tickWidth(param1:int) : void
      {
         if(param1 != this._tickWidth)
         {
            this._tickWidth = param1;
            this.tickWidthChanged = true;
            invalidateDisplayList();
         }
      }
      
      public function get numTicks() : int
      {
         return this._numTicks;
      }
      
      [Bindable(event="propertyChange")]
      public function set tickWidth(param1:int) : void
      {
         var _loc2_:Object = this.tickWidth;
         if(_loc2_ !== param1)
         {
            this._84384215tickWidth = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tickWidth",_loc2_,param1));
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(param1 == STYLE_TICK_COLOR)
         {
            this.tickColorChanged = true;
            invalidateDisplayList();
         }
      }
      
      public function set fadeSpeed(param1:int) : void
      {
         var _loc2_:Object = this._895162581fadeSpeed;
         if(_loc2_ !== param1)
         {
            this._895162581fadeSpeed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeSpeed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set speed(param1:int) : void
      {
         var _loc2_:Object = this.speed;
         if(_loc2_ !== param1)
         {
            this._109641799speed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speed",_loc2_,param1));
         }
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      [Bindable(event="propertyChange")]
      public function set numTicks(param1:int) : void
      {
         var _loc2_:Object = this.numTicks;
         if(_loc2_ !== param1)
         {
            this._1899263344numTicks = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"numTicks",_loc2_,param1));
         }
      }
      
      private function set _109641799speed(param1:int) : void
      {
         if(param1 != this._speed)
         {
            this._speed = param1;
            if(this.fadeTimer != null)
            {
               this.fadeTimer.stop();
               this.fadeTimer.delay = param1 / this._numTicks;
               this.fadeTimer.start();
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeSpeed() : int
      {
         return this._895162581fadeSpeed;
      }
      
      override protected function measure() : void
      {
         super.measure();
         width = this._size;
         height = this._size;
      }
      
      public function play() : void
      {
         if(!this._isPlaying)
         {
            this.fadeTimer = new Timer(this.speed / this._numTicks,0);
            this.fadeTimer.addEventListener(TimerEvent.TIMER,function(param1:TimerEvent):void
            {
               var _loc3_:Tick = null;
               var _loc2_:int = int(0 % _numTicks);
               if(numChildren > _loc2_)
               {
                  _loc3_ = getChildAt(_loc2_) as Tick;
                  _loc3_.fade(fadeSpeed != 1 ? fadeSpeed : speed * 6 / 10);
               }
            });
            this.fadeTimer.start();
            this._isPlaying = true;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = 0;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Tick = null;
         if(this.tickColorChanged || this.numTicksChanged || this.sizeChanged || this.tickWidthChanged || this.creation)
         {
            this.creation = false;
            _loc3_ = this._isPlaying;
            this.stop();
            _loc4_ = numChildren - 1;
            while(_loc4_ >= 0)
            {
               removeChildAt(_loc4_);
               _loc4_--;
            }
            _loc5_ = this.size / 2;
            _loc6_ = 0 / this._numTicks;
            _loc7_ = this._tickWidth != -1 ? this._tickWidth : this.size / 10;
            _loc8_ = getStyle(STYLE_TICK_COLOR);
            _loc9_ = 0;
            _loc10_ = 0;
            while(_loc10_ < this._numTicks)
            {
               _loc11_ = _loc5_ + Math.sin(_loc9_) * ((this._numTicks + 2) * _loc7_ / 2 / 0);
               _loc12_ = _loc5_ - Math.cos(_loc9_) * ((this._numTicks + 2) * _loc7_ / 2 / 0);
               _loc13_ = _loc5_ + Math.sin(_loc9_) * (_loc5_ - _loc7_);
               _loc14_ = _loc5_ - Math.cos(_loc9_) * (_loc5_ - _loc7_);
               (_loc15_ = new Tick(_loc11_,_loc12_,_loc13_,_loc14_,_loc7_,_loc8_)).alpha = 0.1;
               this.addChild(_loc15_);
               _loc9_ += _loc6_;
               _loc10_++;
            }
            if(_loc3_)
            {
               this.play();
            }
            this.tickColorChanged = false;
            this.numTicksChanged = false;
            this.sizeChanged = false;
            this.tickWidthChanged = false;
         }
      }
      
      public function get tickWidth() : int
      {
         return this._tickWidth;
      }
      
      private function set _1899263344numTicks(param1:int) : void
      {
         if(param1 != this._numTicks)
         {
            this._numTicks = param1;
            this.numTicksChanged = true;
            invalidateDisplayList();
         }
      }
      
      private function set _3530753size(param1:Number) : void
      {
         if(param1 != this._size)
         {
            this._size = param1;
            this.sizeChanged = true;
            invalidateDisplayList();
            invalidateSize();
         }
      }
   }
}
