package mx.skins.halo
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.display.Shape;
   import flash.events.Event;
   import mx.core.FlexShape;
   import mx.core.FlexSprite;
   import mx.core.mx_internal;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class BusyCursor extends FlexSprite
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var hourHand:Shape;
      
      private var minuteHand:Shape;
      
      public function BusyCursor()
      {
         var _loc6_:Graphics = null;
         super();
         var _loc1_:CSSStyleDeclaration = StyleManager.getStyleDeclaration("CursorManager");
         var _loc2_:Class = _loc1_.getStyle("busyCursorBackground");
         var _loc3_:DisplayObject = new _loc2_();
         if(_loc3_ is InteractiveObject)
         {
            InteractiveObject(_loc3_).mouseEnabled = false;
         }
         addChild(_loc3_);
         var _loc4_:Number = -0.5;
         var _loc5_:Number = -0.5;
         minuteHand = new FlexShape();
         minuteHand.name = "minuteHand";
         (_loc6_ = minuteHand.graphics).beginFill(0);
         _loc6_.moveTo(_loc4_,_loc5_);
         _loc6_.lineTo(1 + _loc4_,0 + _loc5_);
         _loc6_.lineTo(1 + _loc4_,5 + _loc5_);
         _loc6_.lineTo(0 + _loc4_,5 + _loc5_);
         _loc6_.lineTo(0 + _loc4_,0 + _loc5_);
         _loc6_.endFill();
         addChild(minuteHand);
         hourHand = new FlexShape();
         hourHand.name = "hourHand";
         (_loc6_ = hourHand.graphics).beginFill(0);
         _loc6_.moveTo(_loc4_,_loc5_);
         _loc6_.lineTo(4 + _loc4_,0 + _loc5_);
         _loc6_.lineTo(4 + _loc4_,1 + _loc5_);
         _loc6_.lineTo(0 + _loc4_,1 + _loc5_);
         _loc6_.lineTo(0 + _loc4_,0 + _loc5_);
         _loc6_.endFill();
         addChild(hourHand);
         addEventListener(Event.ADDED,handleAdded);
         addEventListener(Event.REMOVED,handleRemoved);
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         minuteHand.rotation = NaN;
         hourHand.rotation = NaN;
      }
      
      private function handleAdded(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,enterFrameHandler);
      }
      
      private function handleRemoved(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
      }
   }
}
