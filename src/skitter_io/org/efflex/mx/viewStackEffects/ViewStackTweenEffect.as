package org.efflex.mx.viewStackEffects
{
   import mx.core.UIComponent;
   import mx.effects.IEffectInstance;
   import mx.effects.TweenEffect;
   import org.efflex.mx.viewStackEffects.effectClasses.ViewStackTweenEffectInstance;
   import org.efflex.viewStackHelpers.ViewStackHelper;
   
   public class ViewStackTweenEffect extends TweenEffect
   {
       
      
      public var modalTransparency:Number = 0;
      
      public var popUp:Boolean = false;
      
      public var modal:Boolean = false;
      
      public var helper:Class;
      
      public var transparent:Boolean = false;
      
      public var hideTarget:Boolean = true;
      
      public var modalTransparencyDuration:Number = 0;
      
      public var modalTransparencyBlur:Number = 0;
      
      public var modalTransparencyColor:Number = 16777215;
      
      public function ViewStackTweenEffect(param1:UIComponent = null)
      {
         helper = ViewStackHelper;
         super(param1);
         instanceClass = ViewStackTweenEffectInstance;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         super.initInstance(param1);
         var _loc2_:ViewStackTweenEffectInstance = ViewStackTweenEffectInstance(param1);
         _loc2_.helper = helper;
         _loc2_.hideTarget = hideTarget;
         _loc2_.transparent = transparent;
         _loc2_.popUp = popUp;
         _loc2_.modal = modal;
         _loc2_.modalTransparencyColor = modalTransparencyColor;
         _loc2_.modalTransparency = modalTransparency;
         _loc2_.modalTransparencyBlur = modalTransparencyBlur;
         _loc2_.modalTransparencyDuration = modalTransparencyDuration;
      }
   }
}
