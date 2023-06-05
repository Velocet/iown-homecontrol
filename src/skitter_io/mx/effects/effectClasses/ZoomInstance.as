package mx.effects.effectClasses
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.events.FlexEvent;
   
   public class ZoomInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var newY:Number;
      
      public var originY:Number;
      
      private var origX:Number;
      
      private var origY:Number;
      
      public var originX:Number;
      
      private var origPercentHeight:Number;
      
      public var zoomWidthFrom:Number;
      
      public var zoomWidthTo:Number;
      
      private var newX:Number;
      
      public var captureRollEvents:Boolean;
      
      private var origPercentWidth:Number;
      
      public var zoomHeightFrom:Number;
      
      private var origScaleX:Number;
      
      public var zoomHeightTo:Number;
      
      private var origScaleY:Number;
      
      private var scaledOriginX:Number;
      
      private var scaledOriginY:Number;
      
      private var show:Boolean = true;
      
      private var _mouseHasMoved:Boolean = false;
      
      public function ZoomInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function finishEffect() : void
      {
         if(captureRollEvents)
         {
            target.removeEventListener(MouseEvent.ROLL_OVER,mouseEventHandler,false);
            target.removeEventListener(MouseEvent.ROLL_OUT,mouseEventHandler,false);
            target.removeEventListener(MouseEvent.MOUSE_MOVE,mouseEventHandler,false);
         }
         super.finishEffect();
      }
      
      private function getScaleFromWidth(param1:Number) : Number
      {
         return param1 / (0 / Math.abs(target.scaleX));
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
         if(param1.type == FlexEvent.HIDE || param1.type == Event.REMOVED)
         {
            show = false;
         }
      }
      
      private function getScaleFromHeight(param1:Number) : Number
      {
         return param1 / (0 / Math.abs(target.scaleY));
      }
      
      private function applyPropertyChanges() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc1_:PropertyChanges = propertyChanges;
         if(_loc1_)
         {
            _loc2_ = false;
            _loc3_ = false;
            if(_loc1_.end["scaleX"] !== undefined)
            {
               zoomWidthFrom = isNaN(zoomWidthFrom) ? 0 : zoomWidthFrom;
               zoomWidthTo = isNaN(zoomWidthTo) ? Number(_loc1_.end["scaleX"]) : zoomWidthTo;
               _loc3_ = true;
            }
            if(_loc1_.end["scaleY"] !== undefined)
            {
               zoomHeightFrom = isNaN(zoomHeightFrom) ? 0 : zoomHeightFrom;
               zoomHeightTo = isNaN(zoomHeightTo) ? Number(_loc1_.end["scaleY"]) : zoomHeightTo;
               _loc3_ = true;
            }
            if(_loc3_)
            {
               return;
            }
            if(_loc1_.end["width"] !== undefined)
            {
               zoomWidthFrom = isNaN(zoomWidthFrom) ? getScaleFromWidth(target.width) : zoomWidthFrom;
               zoomWidthTo = isNaN(zoomWidthTo) ? getScaleFromWidth(_loc1_.end["width"]) : zoomWidthTo;
               _loc2_ = true;
            }
            if(_loc1_.end["height"] !== undefined)
            {
               zoomHeightFrom = isNaN(zoomHeightFrom) ? getScaleFromHeight(target.height) : zoomHeightFrom;
               zoomHeightTo = isNaN(zoomHeightTo) ? getScaleFromHeight(_loc1_.end["height"]) : zoomHeightTo;
               _loc2_ = true;
            }
            if(_loc2_)
            {
               return;
            }
            if(_loc1_.end["visible"] !== undefined)
            {
               show = _loc1_.end["visible"];
            }
         }
      }
      
      private function mouseEventHandler(param1:MouseEvent) : void
      {
         if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            _mouseHasMoved = true;
         }
         else if(param1.type == MouseEvent.ROLL_OUT || param1.type == MouseEvent.ROLL_OVER)
         {
            if(!_mouseHasMoved)
            {
               param1.stopImmediatePropagation();
            }
            _mouseHasMoved = false;
         }
      }
      
      override public function play() : void
      {
         super.play();
         applyPropertyChanges();
         if(isNaN(zoomWidthFrom) && isNaN(zoomWidthTo) && isNaN(zoomHeightFrom) && isNaN(zoomHeightTo))
         {
            if(show)
            {
               zoomWidthFrom = zoomHeightFrom = 0;
               zoomWidthTo = target.scaleX;
               zoomHeightTo = target.scaleY;
            }
            else
            {
               zoomWidthFrom = target.scaleX;
               zoomHeightFrom = target.scaleY;
               zoomWidthTo = zoomHeightTo = 0;
            }
         }
         else
         {
            if(isNaN(zoomWidthFrom) && isNaN(zoomWidthTo))
            {
               zoomWidthFrom = zoomWidthTo = target.scaleX;
            }
            else if(isNaN(zoomHeightFrom) && isNaN(zoomHeightTo))
            {
               zoomHeightFrom = zoomHeightTo = target.scaleY;
            }
            if(isNaN(zoomWidthFrom))
            {
               zoomWidthFrom = target.scaleX;
            }
            else if(isNaN(zoomWidthTo))
            {
               zoomWidthTo = zoomWidthFrom == 1 ? 0 : 1;
            }
            if(isNaN(zoomHeightFrom))
            {
               zoomHeightFrom = target.scaleY;
            }
            else if(isNaN(zoomHeightTo))
            {
               zoomHeightTo = zoomHeightFrom == 1 ? 0 : 1;
            }
         }
         if(zoomWidthFrom < 0.01)
         {
            zoomWidthFrom = 0.01;
         }
         if(zoomWidthTo < 0.01)
         {
            zoomWidthTo = 0.01;
         }
         if(zoomHeightFrom < 0.01)
         {
            zoomHeightFrom = 0.01;
         }
         if(zoomHeightTo < 0.01)
         {
            zoomHeightTo = 0.01;
         }
         origScaleX = target.scaleX;
         origScaleY = target.scaleY;
         newX = origX = target.x;
         newY = origY = target.y;
         if(isNaN(originX))
         {
            scaledOriginX = 0;
         }
         else
         {
            scaledOriginX = originX * origScaleX;
         }
         if(isNaN(originY))
         {
            scaledOriginY = 0;
         }
         else
         {
            scaledOriginY = originY * origScaleY;
         }
         scaledOriginX = Number(scaledOriginX.toFixed(1));
         scaledOriginY = Number(scaledOriginY.toFixed(1));
         origPercentWidth = target.percentWidth;
         if(!isNaN(origPercentWidth))
         {
            target.width = target.width;
         }
         origPercentHeight = target.percentHeight;
         if(!isNaN(origPercentHeight))
         {
            target.height = target.height;
         }
         tween = createTween(this,[zoomWidthFrom,zoomHeightFrom],[zoomWidthTo,zoomHeightTo],duration);
         if(captureRollEvents)
         {
            target.addEventListener(MouseEvent.ROLL_OVER,mouseEventHandler,false);
            target.addEventListener(MouseEvent.ROLL_OUT,mouseEventHandler,false);
            target.addEventListener(MouseEvent.MOUSE_MOVE,mouseEventHandler,false);
         }
      }
      
      override public function onTweenEnd(param1:Object) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(!isNaN(origPercentWidth))
         {
            _loc2_ = 0;
            target.percentWidth = origPercentWidth;
            if(false && target.parent.autoLayout == false)
            {
               target.mx_internal::_width = _loc2_;
            }
         }
         if(!isNaN(origPercentHeight))
         {
            _loc3_ = 0;
            target.percentHeight = origPercentHeight;
            if(false && target.parent.autoLayout == false)
            {
               target.mx_internal::_height = _loc3_;
            }
         }
         super.onTweenEnd(param1);
         if(mx_internal::hideOnEffectEnd)
         {
            EffectManager.suspendEventHandling();
            target.scaleX = origScaleX;
            target.scaleY = origScaleY;
            target.move(origX,origY);
            EffectManager.resumeEventHandling();
         }
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         EffectManager.suspendEventHandling();
         if(Math.abs(newX - 0) > 0.1)
         {
            origX += Number(target.x.toFixed(1)) - newX;
         }
         if(Math.abs(newY - 0) > 0.1)
         {
            origY += Number(target.y.toFixed(1)) - newY;
         }
         target.scaleX = param1[0];
         target.scaleY = param1[1];
         var _loc2_:Number = param1[0] / origScaleX;
         var _loc3_:Number = param1[1] / origScaleY;
         var _loc4_:Number = scaledOriginX * _loc2_;
         var _loc5_:Number = scaledOriginY * _loc3_;
         newX = scaledOriginX - _loc4_ + origX;
         newY = scaledOriginY - _loc5_ + origY;
         newX = Number(newX.toFixed(1));
         newY = Number(newY.toFixed(1));
         target.move(newX,newY);
         if(tween)
         {
            tween.mx_internal::needToLayout = true;
         }
         else
         {
            mx_internal::needToLayout = true;
         }
         EffectManager.resumeEventHandling();
      }
   }
}
