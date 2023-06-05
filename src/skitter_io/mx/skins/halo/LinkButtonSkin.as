package mx.skins.halo
{
   import mx.core.EdgeMetrics;
   import mx.core.mx_internal;
   import mx.skins.Border;
   
   public class LinkButtonSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function LinkButtonSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("cornerRadius");
         var _loc4_:uint = getStyle("rollOverColor");
         var _loc5_:uint = getStyle("selectionColor");
         graphics.clear();
         switch(name)
         {
            case "upSkin":
               drawRoundRect(0,0,param1,param2,_loc3_,0,0);
               break;
            case "overSkin":
               drawRoundRect(0,0,param1,param2,_loc3_,_loc4_,1);
               break;
            case "downSkin":
               drawRoundRect(0,0,param1,param2,_loc3_,_loc5_,1);
               break;
            case "disabledSkin":
               drawRoundRect(0,0,param1,param2,_loc3_,0,0);
         }
      }
      
      override public function get borderMetrics() : EdgeMetrics
      {
         return EdgeMetrics.EMPTY;
      }
   }
}
