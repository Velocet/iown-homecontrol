package org.efflex.viewStackHelpers
{
   import mx.containers.ViewStack;
   import mx.core.EdgeMetrics;
   
   public class ViewStackHelper implements IViewStackEffectHelper
   {
       
      
      protected var _container:ViewStack;
      
      public function ViewStackHelper(param1:ViewStack)
      {
         super();
         _container = param1;
      }
      
      public function get contentHeight() : Number
      {
         var _loc1_:EdgeMetrics = _container.viewMetricsAndPadding;
         return unscaledHeight - _loc1_.top - _loc1_.bottom;
      }
      
      public function get unscaledHeight() : Number
      {
         return 0 / Math.abs(_container.scaleY);
      }
      
      public function get contentX() : Number
      {
         return _container.getStyle("paddingLeft");
      }
      
      public function get contentY() : Number
      {
         return _container.getStyle("paddingTop");
      }
      
      public function get contentWidth() : Number
      {
         var _loc1_:EdgeMetrics = _container.viewMetricsAndPadding;
         return unscaledWidth - _loc1_.left - _loc1_.right;
      }
      
      public function get unscaledWidth() : Number
      {
         return 0 / Math.abs(_container.scaleX);
      }
   }
}
