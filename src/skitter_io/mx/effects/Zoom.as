package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.ZoomInstance;
   
   public class Zoom extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var AFFECTED_PROPERTIES:Array = ["scaleX","scaleY","x","y","width","height"];
       
      
      public var zoomHeightFrom:Number;
      
      public var zoomWidthTo:Number;
      
      public var originX:Number;
      
      public var zoomHeightTo:Number;
      
      public var originY:Number;
      
      public var captureRollEvents:Boolean;
      
      public var zoomWidthFrom:Number;
      
      public function Zoom(param1:Object = null)
      {
         super(param1);
         instanceClass = ZoomInstance;
         mx_internal::applyActualDimensions = false;
         relevantProperties = ["scaleX","scaleY","width","height","visible"];
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:ZoomInstance = null;
         super.initInstance(param1);
         _loc2_ = ZoomInstance(param1);
         _loc2_.zoomWidthFrom = zoomWidthFrom;
         _loc2_.zoomWidthTo = zoomWidthTo;
         _loc2_.zoomHeightFrom = zoomHeightFrom;
         _loc2_.zoomHeightTo = zoomHeightTo;
         _loc2_.originX = originX;
         _loc2_.originY = originY;
         _loc2_.captureRollEvents = captureRollEvents;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
