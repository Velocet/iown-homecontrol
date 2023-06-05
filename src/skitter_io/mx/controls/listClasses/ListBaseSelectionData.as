package mx.controls.listClasses
{
   import mx.core.mx_internal;
   
   public class ListBaseSelectionData
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var data:Object;
      
      mx_internal var prevSelectionData:mx.controls.listClasses.ListBaseSelectionData;
      
      mx_internal var nextSelectionData:mx.controls.listClasses.ListBaseSelectionData;
      
      public var approximate:Boolean;
      
      public var index:int;
      
      public function ListBaseSelectionData(param1:Object, param2:int, param3:Boolean)
      {
         super();
         this.data = param1;
         this.index = param2;
         this.approximate = param3;
      }
   }
}
