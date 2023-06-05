package mx.containers
{
   import mx.core.mx_internal;
   
   public class VBox extends Box
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function VBox()
      {
         super();
         mx_internal::layoutObject.direction = BoxDirection.VERTICAL;
      }
      
      override public function set direction(param1:String) : void
      {
      }
   }
}
