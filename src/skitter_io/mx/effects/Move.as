package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.MoveInstance;
   
   public class Move extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var AFFECTED_PROPERTIES:Array = ["x","y"];
       
      
      public var xFrom:Number;
      
      public var yFrom:Number;
      
      public var xBy:Number;
      
      public var yBy:Number;
      
      public var yTo:Number;
      
      public var xTo:Number;
      
      public function Move(param1:Object = null)
      {
         super(param1);
         instanceClass = MoveInstance;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:MoveInstance = null;
         super.initInstance(param1);
         _loc2_ = MoveInstance(param1);
         _loc2_.xFrom = xFrom;
         _loc2_.xTo = xTo;
         _loc2_.xBy = xBy;
         _loc2_.yFrom = yFrom;
         _loc2_.yTo = yTo;
         _loc2_.yBy = yBy;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
