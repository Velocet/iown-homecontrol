package mx.effects.effectClasses
{
   import flash.events.Event;
   import mx.core.Container;
   import mx.core.EdgeMetrics;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.events.MoveEvent;
   import mx.styles.IStyleClient;
   
   public class MoveInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var xFrom:Number;
      
      public var yFrom:Number;
      
      private var left;
      
      private var forceClipping:Boolean = false;
      
      public var xTo:Number;
      
      private var top;
      
      private var horizontalCenter;
      
      public var yTo:Number;
      
      private var oldWidth:Number;
      
      private var right;
      
      private var bottom;
      
      private var oldHeight:Number;
      
      public var xBy:Number;
      
      public var yBy:Number;
      
      private var checkClipping:Boolean = true;
      
      private var verticalCenter;
      
      public function MoveInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
         if(param1 is MoveEvent && param1.type == MoveEvent.MOVE)
         {
            if(isNaN(xFrom) && isNaN(xTo) && isNaN(xBy) && isNaN(yFrom) && isNaN(yTo) && isNaN(yBy))
            {
               xFrom = MoveEvent(param1).oldX;
               xTo = target.x;
               yFrom = MoveEvent(param1).oldY;
               yTo = target.y;
            }
         }
      }
      
      override public function play() : void
      {
         var _loc2_:EdgeMetrics = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         super.play();
         EffectManager.mx_internal::startBitmapEffect(IUIComponent(target));
         if(isNaN(xFrom))
         {
            xFrom = !isNaN(xTo) && !isNaN(xBy) ? xTo - xBy : Number(target.x);
         }
         if(isNaN(xTo))
         {
            if(isNaN(xBy) && propertyChanges && propertyChanges.end["x"] !== undefined)
            {
               xTo = propertyChanges.end["x"];
            }
            else
            {
               xTo = !isNaN(xBy) ? xFrom + xBy : Number(target.x);
            }
         }
         if(isNaN(yFrom))
         {
            yFrom = !isNaN(yTo) && !isNaN(yBy) ? yTo - yBy : Number(target.y);
         }
         if(isNaN(yTo))
         {
            if(isNaN(yBy) && propertyChanges && propertyChanges.end["y"] !== undefined)
            {
               yTo = propertyChanges.end["y"];
            }
            else
            {
               yTo = !isNaN(yBy) ? yFrom + yBy : Number(target.y);
            }
         }
         tween = createTween(this,[xFrom,yFrom],[xTo,yTo],duration);
         var _loc1_:Container = target.parent as Container;
         if(_loc1_)
         {
            _loc2_ = _loc1_.viewMetrics;
            _loc3_ = _loc2_.left;
            _loc4_ = _loc1_.width - _loc2_.right;
            _loc5_ = _loc2_.top;
            _loc6_ = _loc1_.height - _loc2_.bottom;
            if(xFrom < _loc3_ || xTo < _loc3_ || xFrom + target.width > _loc4_ || xTo + target.width > _loc4_ || yFrom < _loc5_ || yTo < _loc5_ || yFrom + target.height > _loc6_ || yTo + target.height > _loc6_)
            {
               forceClipping = true;
               _loc1_.mx_internal::forceClipping = true;
            }
         }
         mx_internal::applyTweenStartValues();
         if(target is IStyleClient)
         {
            left = target.getStyle("left");
            if(left != undefined)
            {
               target.setStyle("left",undefined);
            }
            right = target.getStyle("right");
            if(right != undefined)
            {
               target.setStyle("right",undefined);
            }
            top = target.getStyle("top");
            if(top != undefined)
            {
               target.setStyle("top",undefined);
            }
            bottom = target.getStyle("bottom");
            if(bottom != undefined)
            {
               target.setStyle("bottom",undefined);
            }
            horizontalCenter = target.getStyle("horizontalCenter");
            if(horizontalCenter != undefined)
            {
               target.setStyle("horizontalCenter",undefined);
            }
            verticalCenter = target.getStyle("verticalCenter");
            if(verticalCenter != undefined)
            {
               target.setStyle("verticalCenter",undefined);
            }
            if(left != undefined && right != undefined)
            {
               _loc7_ = 0;
               oldWidth = target.explicitWidth;
               target.width = _loc7_;
            }
            if(top != undefined && bottom != undefined)
            {
               _loc8_ = 0;
               oldHeight = target.explicitHeight;
               target.height = _loc8_;
            }
         }
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         var _loc2_:Container = null;
         var _loc3_:EdgeMetrics = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         EffectManager.suspendEventHandling();
         if(!forceClipping && checkClipping)
         {
            _loc2_ = target.parent as Container;
            if(_loc2_)
            {
               _loc3_ = _loc2_.viewMetrics;
               _loc4_ = _loc3_.left;
               _loc5_ = _loc2_.width - _loc3_.right;
               _loc6_ = _loc3_.top;
               _loc7_ = _loc2_.height - _loc3_.bottom;
               if(param1[0] < _loc4_ || param1[0] + target.width > _loc5_ || param1[1] < _loc6_ || param1[1] + target.height > _loc7_)
               {
                  forceClipping = true;
                  _loc2_.mx_internal::forceClipping = true;
               }
            }
         }
         target.move(param1[0],param1[1]);
         EffectManager.resumeEventHandling();
      }
      
      override public function onTweenEnd(param1:Object) : void
      {
         var _loc2_:Container = null;
         EffectManager.mx_internal::endBitmapEffect(IUIComponent(target));
         if(left != undefined)
         {
            target.setStyle("left",left);
         }
         if(right != undefined)
         {
            target.setStyle("right",right);
         }
         if(top != undefined)
         {
            target.setStyle("top",top);
         }
         if(bottom != undefined)
         {
            target.setStyle("bottom",bottom);
         }
         if(horizontalCenter != undefined)
         {
            target.setStyle("horizontalCenter",horizontalCenter);
         }
         if(verticalCenter != undefined)
         {
            target.setStyle("verticalCenter",verticalCenter);
         }
         if(left != undefined && right != undefined)
         {
            target.explicitWidth = oldWidth;
         }
         if(top != undefined && bottom != undefined)
         {
            target.explicitHeight = oldHeight;
         }
         if(forceClipping)
         {
            _loc2_ = target.parent as Container;
            if(_loc2_)
            {
               forceClipping = false;
               _loc2_.mx_internal::forceClipping = false;
            }
         }
         checkClipping = false;
         super.onTweenEnd(param1);
      }
   }
}
