package mx.controls.listClasses
{
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   
   public class BaseListData
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _uid:String;
      
      public var owner:IUIComponent;
      
      [Bindable("dataChange")]
      public var label:String;
      
      public var rowIndex:int;
      
      public var columnIndex:int;
      
      public function BaseListData(param1:String, param2:String, param3:IUIComponent, param4:int = 0, param5:int = 0)
      {
         super();
         this.label = param1;
         this.uid = param2;
         this.owner = param3;
         this.rowIndex = param4;
         this.columnIndex = param5;
      }
      
      public function set uid(param1:String) : void
      {
         _uid = param1;
      }
      
      public function get uid() : String
      {
         return _uid;
      }
   }
}
