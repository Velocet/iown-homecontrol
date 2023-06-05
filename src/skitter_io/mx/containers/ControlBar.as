package mx.containers
{
   import mx.core.Container;
   import mx.core.ScrollPolicy;
   import mx.core.mx_internal;
   
   public class ControlBar extends Box
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ControlBar()
      {
         super();
         direction = BoxDirection.HORIZONTAL;
      }
      
      override public function set verticalScrollPolicy(param1:String) : void
      {
      }
      
      override public function set horizontalScrollPolicy(param1:String) : void
      {
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(mx_internal::contentPane)
         {
            mx_internal::contentPane.opaqueBackground = null;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(param1 != super.enabled)
         {
            super.enabled = param1;
            alpha = param1 ? 1 : 0.4;
         }
      }
      
      override public function get horizontalScrollPolicy() : String
      {
         return ScrollPolicy.OFF;
      }
      
      override public function invalidateSize() : void
      {
         super.invalidateSize();
         if(parent)
         {
            Container(parent).mx_internal::invalidateViewMetricsAndPadding();
         }
      }
      
      override public function get verticalScrollPolicy() : String
      {
         return ScrollPolicy.OFF;
      }
      
      override public function set includeInLayout(param1:Boolean) : void
      {
         var _loc2_:Container = null;
         if(includeInLayout != param1)
         {
            super.includeInLayout = param1;
            _loc2_ = parent as Container;
            if(_loc2_)
            {
               _loc2_.mx_internal::invalidateViewMetricsAndPadding();
            }
         }
      }
   }
}
