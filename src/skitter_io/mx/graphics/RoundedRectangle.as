package mx.graphics
{
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   
   public class RoundedRectangle extends Rectangle
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var cornerRadius:Number = 0;
      
      public function RoundedRectangle(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         super(param1,param2,param3,param4);
         this.cornerRadius = param5;
      }
   }
}
