package mx.controls.listClasses
{
   import mx.core.mx_internal;
   
   public class ListRowInfo
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var itemOldY:Number;
      
      public var height:Number;
      
      public var uid:String;
      
      public var data:Object;
      
      public var oldY:Number;
      
      public var y:Number;
      
      public function ListRowInfo(param1:Number, param2:Number, param3:String, param4:Object = null)
      {
         super();
         this.y = param1;
         this.height = param2;
         this.uid = param3;
         this.data = param4;
      }
   }
}
