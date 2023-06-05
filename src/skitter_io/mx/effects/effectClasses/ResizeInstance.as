package mx.effects.effectClasses
{
   import flash.events.Event;
   import mx.containers.Panel;
   import mx.core.Application;
   import mx.core.Container;
   import mx.core.IUIComponent;
   import mx.core.ScrollPolicy;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.events.EffectEvent;
   import mx.events.ResizeEvent;
   import mx.styles.IStyleClient;
   
   public class ResizeInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var left;
      
      private var origPercentHeight:Number;
      
      private var parentOrigHorizontalScrollPolicy:String = "";
      
      private var explicitWidthSet:Boolean;
      
      public var widthFrom:Number;
      
      private var origExplicitHeight:Number;
      
      private var _widthTo:Number;
      
      private var parentOrigVerticalScrollPolicy:String = "";
      
      private var right;
      
      private var origExplicitWidth:Number;
      
      private var restoreAutoLayoutArray:Array;
      
      private var restoreVisibleArray:Array;
      
      private var bottom;
      
      private var heightSet:Boolean;
      
      private var _heightBy:Number;
      
      private var widthSet:Boolean;
      
      private var origHorizontalScrollPolicy:String = "";
      
      private var numHideEffectsPlaying:Number = 0;
      
      private var top;
      
      private var origVerticalScrollPolicy:String = "";
      
      private var _heightTo:Number;
      
      private var explicitHeightSet:Boolean;
      
      public var hideChildrenTargets:Array;
      
      private var origPercentWidth:Number;
      
      public var heightFrom:Number;
      
      private var _widthBy:Number;
      
      public function ResizeInstance(param1:Object)
      {
         super(param1);
         mx_internal::needToLayout = true;
      }
      
      public function set widthBy(param1:Number) : void
      {
         _widthBy = param1;
         widthSet = !isNaN(param1);
      }
      
      public function get heightTo() : Number
      {
         return _heightTo;
      }
      
      public function set heightTo(param1:Number) : void
      {
         _heightTo = param1;
         heightSet = !isNaN(param1);
      }
      
      private function hidePanelChildren() : Boolean
      {
         var _loc3_:Object = null;
         var _loc4_:Number = NaN;
         if(!hideChildrenTargets)
         {
            return false;
         }
         restoreVisibleArray = [];
         restoreAutoLayoutArray = [];
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = hideChildrenTargets[_loc2_];
            if(_loc3_ is Panel)
            {
               _loc4_ = numHideEffectsPlaying;
               _loc3_.addEventListener(EffectEvent.EFFECT_START,mx_internal::eventHandler);
               _loc3_.dispatchEvent(new Event("resizeStart"));
               _loc3_.removeEventListener(EffectEvent.EFFECT_START,mx_internal::eventHandler);
               if(numHideEffectsPlaying == _loc4_)
               {
                  makePanelChildrenInvisible(Panel(_loc3_),_loc2_);
               }
            }
            _loc2_++;
         }
         return numHideEffectsPlaying > 0;
      }
      
      override public function play() : void
      {
         super.play();
         calculateExplicitDimensionChanges();
         var _loc1_:Boolean = hidePanelChildren();
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
         }
         if(!_loc1_)
         {
            startResizeTween();
         }
      }
      
      public function set heightBy(param1:Number) : void
      {
         _heightBy = param1;
         heightSet = !isNaN(param1);
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
         if(param1 is ResizeEvent && param1.type == ResizeEvent.RESIZE)
         {
            if(isNaN(widthBy))
            {
               if(isNaN(widthFrom))
               {
                  widthFrom = ResizeEvent(param1).oldWidth;
               }
               if(isNaN(widthTo))
               {
                  _widthTo = target.width;
               }
            }
            if(isNaN(heightBy))
            {
               if(isNaN(heightFrom))
               {
                  heightFrom = ResizeEvent(param1).oldHeight;
               }
               if(isNaN(heightTo))
               {
                  _heightTo = target.height;
               }
            }
         }
      }
      
      public function get widthBy() : Number
      {
         return _widthBy;
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         EffectManager.suspendEventHandling();
         target.width = Math.round(param1[0]);
         target.height = Math.round(param1[1]);
         if(tween)
         {
            tween.mx_internal::needToLayout = true;
         }
         mx_internal::needToLayout = true;
         EffectManager.resumeEventHandling();
      }
      
      override mx_internal function eventHandler(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Container = param1.target as Container;
         super.mx_internal::eventHandler(param1);
         if(param1.type == EffectEvent.EFFECT_START)
         {
            _loc2_.addEventListener(EffectEvent.EFFECT_END,mx_internal::eventHandler);
            ++numHideEffectsPlaying;
         }
         else if(param1.type == EffectEvent.EFFECT_END)
         {
            _loc2_.removeEventListener(EffectEvent.EFFECT_END,mx_internal::eventHandler);
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(hideChildrenTargets[_loc4_] == _loc2_)
               {
                  break;
               }
               _loc4_++;
            }
            makePanelChildrenInvisible(_loc2_,_loc4_);
            if(--numHideEffectsPlaying == 0)
            {
               startResizeTween();
            }
         }
      }
      
      public function set widthTo(param1:Number) : void
      {
         _widthTo = param1;
         widthSet = !isNaN(param1);
      }
      
      private function calculateExplicitDimensionChanges() : void
      {
         var _loc5_:Container = null;
         var _loc6_:Container = null;
         var _loc1_:* = !!propertyChanges ? propertyChanges.end["explicitWidth"] : undefined;
         var _loc2_:* = !!propertyChanges ? propertyChanges.end["explicitHeight"] : undefined;
         var _loc3_:* = !!propertyChanges ? propertyChanges.end["percentWidth"] : undefined;
         var _loc4_:* = !!propertyChanges ? propertyChanges.end["percentHeight"] : undefined;
         if(!heightSet)
         {
            if(_loc4_ !== undefined)
            {
               origPercentHeight = _loc4_;
            }
            else
            {
               origPercentHeight = target.percentHeight;
            }
            if(isNaN(origPercentHeight))
            {
               if(_loc2_ !== undefined)
               {
                  origExplicitHeight = _loc2_;
               }
               else
               {
                  origExplicitHeight = target.explicitHeight;
               }
            }
            if((Boolean(_loc5_ = target as Container)) && _loc5_.verticalScrollBar == null)
            {
               origVerticalScrollPolicy = _loc5_.verticalScrollPolicy;
               _loc5_.verticalScrollPolicy = ScrollPolicy.OFF;
            }
            if(false)
            {
               if((Boolean(_loc6_ = target.parent as Container)) && _loc6_.verticalScrollBar == null)
               {
                  parentOrigVerticalScrollPolicy = _loc6_.verticalScrollPolicy;
                  _loc6_.verticalScrollPolicy = ScrollPolicy.OFF;
               }
            }
         }
         if(!widthSet)
         {
            if(_loc3_ !== undefined)
            {
               origPercentWidth = _loc3_;
            }
            else
            {
               origPercentWidth = target.percentWidth;
            }
            if(isNaN(origPercentWidth))
            {
               if(_loc1_ !== undefined)
               {
                  origExplicitWidth = _loc1_;
               }
               else
               {
                  origExplicitWidth = target.explicitWidth;
               }
            }
            if((Boolean(_loc5_ = target as Container)) && _loc5_.horizontalScrollBar == null)
            {
               origHorizontalScrollPolicy = _loc5_.horizontalScrollPolicy;
               _loc5_.horizontalScrollPolicy = ScrollPolicy.OFF;
            }
            if(false)
            {
               if((Boolean(_loc6_ = target.parent as Container)) && _loc6_.horizontalScrollBar == null)
               {
                  parentOrigHorizontalScrollPolicy = _loc6_.horizontalScrollPolicy;
                  _loc6_.horizontalScrollPolicy = ScrollPolicy.OFF;
               }
            }
         }
         if(isNaN(widthFrom))
         {
            widthFrom = !isNaN(widthTo) && !isNaN(widthBy) ? widthTo - widthBy : Number(target.width);
         }
         if(isNaN(widthTo))
         {
            if(isNaN(widthBy) && propertyChanges && (propertyChanges.end["width"] !== undefined || _loc1_ !== undefined))
            {
               if(_loc1_ !== undefined && !isNaN(_loc1_))
               {
                  explicitWidthSet = true;
                  _widthTo = _loc1_;
               }
               else
               {
                  _widthTo = propertyChanges.end["width"];
               }
            }
            else
            {
               _widthTo = !isNaN(widthBy) ? widthFrom + widthBy : Number(target.width);
            }
         }
         if(isNaN(heightFrom))
         {
            heightFrom = !isNaN(heightTo) && !isNaN(heightBy) ? heightTo - heightBy : Number(target.height);
         }
         if(isNaN(heightTo))
         {
            if(isNaN(heightBy) && propertyChanges && (propertyChanges.end["height"] !== undefined || _loc2_ !== undefined))
            {
               if(_loc2_ !== undefined && !isNaN(_loc2_))
               {
                  explicitHeightSet = true;
                  _heightTo = _loc2_;
               }
               else
               {
                  _heightTo = propertyChanges.end["height"];
               }
            }
            else
            {
               _heightTo = !isNaN(heightBy) ? heightFrom + heightBy : Number(target.height);
            }
         }
      }
      
      private function makePanelChildrenInvisible(param1:Container, param2:Number) : void
      {
         var _loc4_:IUIComponent = null;
         var _loc3_:* = [];
         var _loc5_:int = param1.numChildren;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc4_ = IUIComponent(param1.getChildAt(_loc6_))).visible)
            {
               _loc3_.push(_loc4_);
               _loc4_.setVisible(false,true);
            }
            _loc6_++;
         }
         if((Boolean(_loc4_ = param1.horizontalScrollBar)) && Boolean(_loc4_.visible))
         {
            _loc3_.push(_loc4_);
            _loc4_.setVisible(false,true);
         }
         if((Boolean(_loc4_ = param1.verticalScrollBar)) && Boolean(_loc4_.visible))
         {
            _loc3_.push(_loc4_);
            _loc4_.setVisible(false,true);
         }
         restoreVisibleArray[param2] = _loc3_;
         if(param1.autoLayout)
         {
            param1.autoLayout = false;
            restoreAutoLayoutArray[param2] = true;
         }
      }
      
      override public function end() : void
      {
         if(!tween)
         {
            calculateExplicitDimensionChanges();
            onTweenEnd(!!mx_internal::playReversed ? [widthFrom,heightFrom] : [widthTo,heightTo]);
         }
         super.end();
      }
      
      private function startResizeTween() : void
      {
         EffectManager.mx_internal::startVectorEffect(IUIComponent(target));
         tween = createTween(this,[widthFrom,heightFrom],[widthTo,heightTo],duration);
         mx_internal::applyTweenStartValues();
      }
      
      public function get heightBy() : Number
      {
         return _heightBy;
      }
      
      private function restorePanelChildren() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:IUIComponent = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(hideChildrenTargets)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = hideChildrenTargets[_loc2_];
               if(_loc4_ = restoreVisibleArray[_loc2_])
               {
                  _loc5_ = int(_loc4_.length);
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_)
                  {
                     _loc4_[_loc6_].setVisible(true,true);
                     _loc6_++;
                  }
               }
               if(false)
               {
                  Container(_loc3_).autoLayout = true;
               }
               _loc3_.dispatchEvent(new Event("resizeEnd"));
               _loc2_++;
            }
         }
      }
      
      override public function onTweenEnd(param1:Object) : void
      {
         var _loc2_:Container = null;
         var _loc3_:Container = null;
         EffectManager.mx_internal::endVectorEffect(IUIComponent(target));
         Application.application.callLater(restorePanelChildren);
         super.onTweenEnd(param1);
         EffectManager.suspendEventHandling();
         if(!heightSet)
         {
            target.percentHeight = origPercentHeight;
            target.explicitHeight = origExplicitHeight;
            if(origVerticalScrollPolicy != "")
            {
               _loc2_ = target as Container;
               if(_loc2_)
               {
                  _loc2_.verticalScrollPolicy = origVerticalScrollPolicy;
                  origVerticalScrollPolicy = "";
               }
            }
            if(parentOrigVerticalScrollPolicy != "" && false)
            {
               _loc3_ = target.parent as Container;
               if(_loc3_)
               {
                  _loc3_.verticalScrollPolicy = parentOrigVerticalScrollPolicy;
                  parentOrigVerticalScrollPolicy = "";
               }
            }
         }
         if(!widthSet)
         {
            target.percentWidth = origPercentWidth;
            target.explicitWidth = origExplicitWidth;
            if(origHorizontalScrollPolicy != "")
            {
               _loc2_ = target as Container;
               if(_loc2_)
               {
                  _loc2_.horizontalScrollPolicy = origHorizontalScrollPolicy;
                  origHorizontalScrollPolicy = "";
               }
            }
            if(parentOrigHorizontalScrollPolicy != "" && false)
            {
               _loc3_ = target.parent as Container;
               if(_loc3_)
               {
                  _loc3_.horizontalScrollPolicy = parentOrigHorizontalScrollPolicy;
                  parentOrigHorizontalScrollPolicy = "";
               }
            }
         }
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
         EffectManager.resumeEventHandling();
      }
      
      public function get widthTo() : Number
      {
         return _widthTo;
      }
   }
}
