package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.FadeInstance;
   
   public class Fade extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var AFFECTED_PROPERTIES:Array = ["alpha","visible"];
       
      
      public var alphaFrom:Number;
      
      public var alphaTo:Number;
      
      public function Fade(param1:Object = null)
      {
         super(param1);
         instanceClass = FadeInstance;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         var _loc2_:FadeInstance = FadeInstance(param1);
         _loc2_.alphaFrom = alphaFrom;
         _loc2_.alphaTo = alphaTo;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
