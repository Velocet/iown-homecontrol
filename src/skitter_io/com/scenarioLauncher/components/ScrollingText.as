package com.scenarioLauncher.components
{
   import flash.display.Shape;
   import flash.events.Event;
   import mx.controls.Label;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   
   public class ScrollingText extends UIComponent
   {
      
      public static const BOTTOM_TO_TOP:String = "bottomToTop";
      
      public static const LEFT_TO_RIGHT:String = "leftToRight";
      
      public static const RIGHT_TO_LEFT:String = "rightToLeft";
      
      public static const TOP_TO_BOTTOM:String = "topToBottom";
       
      
      private var messageSpeed:int = 5;
      
      private var cache:Array;
      
      private var secondIndex:int = 1;
      
      private var textDirection:String = "rightToLeft";
      
      private var messageText:String;
      
      private var _1550783935running:Boolean = false;
      
      private var currentIndex:int = 0;
      
      private var clipMask:Shape;
      
      public function ScrollingText()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get running() : Boolean
      {
         return this._1550783935running;
      }
      
      public function stop() : void
      {
         if(this.running)
         {
            removeEventListener(Event.ENTER_FRAME,this.moveText);
         }
         this.running = false;
      }
      
      override protected function commitProperties() : void
      {
         if(this.text == null)
         {
            this.messageText = "";
         }
         this.cache[0].text = this.text;
         this.cache[1].text = this.text;
         this.cache[0].validateNow();
         this.cache[1].validateNow();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function set running(param1:Boolean) : void
      {
         var _loc2_:Object = this._1550783935running;
         if(_loc2_ !== param1)
         {
            this._1550783935running = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"running",_loc2_,param1));
         }
      }
      
      public function get speed() : int
      {
         return this.messageSpeed;
      }
      
      public function set speed(param1:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this.messageSpeed = param1;
      }
      
      public function set text(param1:String) : void
      {
         this.messageText = param1;
         invalidateProperties();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.cache = [new Label(),new Label()];
         (this.cache[0] as Label).styleName = this;
         (this.cache[0] as Label).cacheAsBitmap = true;
         addChild(this.cache[0]);
         (this.cache[1] as Label).styleName = this;
         (this.cache[1] as Label).cacheAsBitmap = true;
         addChild(this.cache[1]);
         this.clipMask = new Shape();
         addChild(this.clipMask);
         mask = this.clipMask;
      }
      
      override protected function measure() : void
      {
         var _loc2_:Label = null;
         super.measure();
         measuredWidth = 0;
         measuredHeight = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.cache.length)
         {
            _loc2_ = this.cache[_loc1_] as Label;
            _loc2_.setActualSize(_loc2_.getExplicitOrMeasuredWidth(),_loc2_.getExplicitOrMeasuredHeight());
            measuredWidth = Math.max(measuredWidth,_loc2_.getExplicitOrMeasuredWidth());
            measuredHeight = Math.max(measuredHeight,_loc2_.getExplicitOrMeasuredHeight());
            _loc1_++;
         }
      }
      
      public function start() : void
      {
         if(!this.running)
         {
            addEventListener(Event.ENTER_FRAME,this.moveText);
         }
         this.running = true;
      }
      
      private function moveText(param1:Event) : void
      {
         if(this.direction == RIGHT_TO_LEFT)
         {
            this.cache[this.currentIndex].x -= this.messageSpeed;
            if(this.cache[this.currentIndex].x <= 0)
            {
               this.cache[this.secondIndex].x -= this.messageSpeed;
            }
            if(this.cache[this.currentIndex].x + this.cache[this.currentIndex].width <= 0)
            {
               this.cache[this.currentIndex].x = Math.max(this.cache[this.currentIndex].parent.width,this.cache[this.secondIndex].width + 10);
               this.currentIndex = 1 - this.currentIndex;
               this.secondIndex = 1 - this.secondIndex;
            }
         }
         else if(this.direction == LEFT_TO_RIGHT)
         {
            this.cache[this.currentIndex].x += this.messageSpeed;
            if(this.cache[this.currentIndex].x > 0 && this.cache[this.currentIndex].x + this.cache[this.currentIndex].width > this.cache[this.currentIndex].parent.width)
            {
               this.cache[this.secondIndex].x += this.messageSpeed;
            }
            if(this.cache[this.currentIndex].x > this.cache[this.currentIndex].parent.width)
            {
               this.cache[this.currentIndex].x = 0 - this.cache[this.currentIndex].width - 10;
               this.currentIndex = 1 - this.currentIndex;
               this.secondIndex = 1 - this.secondIndex;
            }
         }
         else if(this.direction == BOTTOM_TO_TOP)
         {
            this.cache[this.currentIndex].y -= this.messageSpeed;
            if(this.cache[this.currentIndex].y <= 0)
            {
               this.cache[this.secondIndex].y -= this.messageSpeed;
            }
            if(this.cache[this.currentIndex].y + this.cache[this.currentIndex].height <= 0)
            {
               this.cache[this.currentIndex].y = this.cache[this.currentIndex].parent.height;
               this.currentIndex = 1 - this.currentIndex;
               this.secondIndex = 1 - this.secondIndex;
            }
         }
         else if(this.direction == TOP_TO_BOTTOM)
         {
            this.cache[this.currentIndex].y += this.messageSpeed;
            if(this.cache[this.currentIndex].y + this.cache[this.currentIndex].height > this.cache[this.currentIndex].parent.height)
            {
               this.cache[this.secondIndex].y += this.messageSpeed;
            }
            if(this.cache[this.currentIndex].y > this.cache[this.currentIndex].parent.height)
            {
               this.cache[this.currentIndex].y = 0 - this.cache[this.currentIndex].height;
               this.currentIndex = 1 - this.currentIndex;
               this.secondIndex = 1 - this.secondIndex;
            }
         }
      }
      
      public function get text() : String
      {
         return this.messageText;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Label = this.cache[0] as Label;
         var _loc4_:Label = this.cache[1] as Label;
         var _loc5_:Number = (param1 - _loc3_.width) / 2;
         var _loc6_:Number = (param2 - _loc3_.height) / 2;
         switch(this.direction)
         {
            case RIGHT_TO_LEFT:
               _loc3_.move(param1,_loc6_);
               _loc4_.move(Math.max(param1,_loc3_.width + 10),_loc6_);
               break;
            case LEFT_TO_RIGHT:
               _loc3_.move(0 - _loc3_.width,_loc6_);
               _loc4_.move(0 - _loc4_.width - 10,_loc6_);
               break;
            case BOTTOM_TO_TOP:
               _loc3_.move(_loc5_,param2);
               _loc4_.move(_loc5_,param2);
               break;
            case TOP_TO_BOTTOM:
               _loc3_.move(_loc5_,0 - _loc3_.height);
               _loc4_.move(_loc5_,0 - _loc4_.height);
         }
         this.clipMask.graphics.clear();
         this.clipMask.graphics.beginFill(0);
         this.clipMask.graphics.drawRect(0,0,param1,param2);
         this.clipMask.graphics.endFill();
      }
      
      public function set direction(param1:String) : void
      {
         this.textDirection = param1;
         invalidateProperties();
      }
      
      public function get direction() : String
      {
         return this.textDirection;
      }
   }
}
