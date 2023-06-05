package mx.skins
{
   import mx.core.EdgeMetrics;
   import mx.core.IBorder;
   import mx.core.mx_internal;
   
   public class Border extends ProgrammaticSkin implements IBorder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function Border()
      {
         super();
      }
      
      public function get borderMetrics() : EdgeMetrics
      {
         return EdgeMetrics.EMPTY;
      }
   }
}
