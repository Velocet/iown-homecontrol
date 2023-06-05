package mx.controls.dataGridClasses
{
   import mx.controls.listClasses.BaseListData;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   
   public class DataGridListData extends BaseListData
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var dataField:String;
      
      public function DataGridListData(param1:String, param2:String, param3:int, param4:String, param5:IUIComponent, param6:int = 0)
      {
         super(param1,param4,param5,param6,param3);
         this.dataField = param2;
      }
   }
}
