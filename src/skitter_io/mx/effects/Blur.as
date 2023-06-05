package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.BlurInstance;
   
   public class Blur extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var AFFECTED_PROPERTIES:Array = ["filters"];
       
      
      public var blurXTo:Number;
      
      public var blurXFrom:Number;
      
      public var blurYFrom:Number;
      
      public var blurYTo:Number;
      
      public function Blur(param1:Object = null)
      {
         super(param1);
         instanceClass = BlurInstance;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:BlurInstance = null;
         super.initInstance(param1);
         _loc2_ = BlurInstance(param1);
         _loc2_.blurXFrom = blurXFrom;
         _loc2_.blurXTo = blurXTo;
         _loc2_.blurYFrom = blurYFrom;
         _loc2_.blurYTo = blurYTo;
      }
   }
}
