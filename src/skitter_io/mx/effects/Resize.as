package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.ResizeInstance;
   
   public class Resize extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var AFFECTED_PROPERTIES:Array = ["width","height","explicitWidth","explicitHeight","percentWidth","percentHeight"];
       
      
      public var hideChildrenTargets:Array;
      
      public var widthTo:Number;
      
      public var heightTo:Number;
      
      public var widthFrom:Number;
      
      public var heightFrom:Number;
      
      public var widthBy:Number;
      
      public var heightBy:Number;
      
      public function Resize(param1:Object = null)
      {
         super(param1);
         instanceClass = ResizeInstance;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         var _loc2_:ResizeInstance = ResizeInstance(param1);
         if(!isNaN(widthFrom))
         {
            _loc2_.widthFrom = widthFrom;
         }
         if(!isNaN(widthTo))
         {
            _loc2_.widthTo = widthTo;
         }
         if(!isNaN(widthBy))
         {
            _loc2_.widthBy = widthBy;
         }
         if(!isNaN(heightFrom))
         {
            _loc2_.heightFrom = heightFrom;
         }
         if(!isNaN(heightTo))
         {
            _loc2_.heightTo = heightTo;
         }
         if(!isNaN(heightBy))
         {
            _loc2_.heightBy = heightBy;
         }
         _loc2_.hideChildrenTargets = hideChildrenTargets;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
