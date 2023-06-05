package org.efflex.mx.viewStackEffects
{
   import mx.core.UIComponent;
   import mx.effects.IEffectInstance;
   import org.efflex.mx.viewStackEffects.effectClasses.ListInstance;
   
   public class List extends ViewStackTweenEffect
   {
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
      
      private static var AFFECTED_PROPERTIES:Array = ["x","y"];
       
      
      public var scaleDurationByChange:Boolean = true;
      
      public var direction:String = "horizontal";
      
      public function List(param1:UIComponent = null)
      {
         super(param1);
         instanceClass = ListInstance;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         var _loc2_:ListInstance = ListInstance(param1);
         _loc2_.direction = direction;
         _loc2_.scaleDurationByChange = scaleDurationByChange;
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
   }
}
