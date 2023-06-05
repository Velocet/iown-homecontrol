package mx.core
{
   public class EdgeMetrics
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const EMPTY:mx.core.EdgeMetrics = new mx.core.EdgeMetrics(0,0,0,0);
       
      
      public var top:Number;
      
      public var left:Number;
      
      public var bottom:Number;
      
      public var right:Number;
      
      public function EdgeMetrics(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.left = param1;
         this.top = param2;
         this.right = param3;
         this.bottom = param4;
      }
      
      public function clone() : mx.core.EdgeMetrics
      {
         return new mx.core.EdgeMetrics(left,top,right,bottom);
      }
   }
}
