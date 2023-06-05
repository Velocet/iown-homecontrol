package mx.containers.errors
{
   import mx.core.mx_internal;
   
   public class ConstraintError extends Error
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ConstraintError(param1:String)
      {
         super(param1);
      }
   }
}
