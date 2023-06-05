package mx.events
{
   import flash.events.Event;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.mx_internal;
   
   public class ListEvent extends Event
   {
      
      public static const ITEM_ROLL_OUT:String = "itemRollOut";
      
      public static const ITEM_DOUBLE_CLICK:String = "itemDoubleClick";
      
      public static const ITEM_EDIT_BEGIN:String = "itemEditBegin";
      
      public static const ITEM_ROLL_OVER:String = "itemRollOver";
      
      public static const ITEM_EDIT_END:String = "itemEditEnd";
      
      public static const ITEM_EDIT_BEGINNING:String = "itemEditBeginning";
      
      public static const CHANGE:String = "change";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const ITEM_FOCUS_OUT:String = "itemFocusOut";
      
      public static const ITEM_CLICK:String = "itemClick";
      
      public static const ITEM_FOCUS_IN:String = "itemFocusIn";
       
      
      public var reason:String;
      
      public var itemRenderer:IListItemRenderer;
      
      public var rowIndex:int;
      
      public var columnIndex:int;
      
      public function ListEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:String = null, param7:IListItemRenderer = null)
      {
         super(param1,param2,param3);
         this.columnIndex = param4;
         this.rowIndex = param5;
         this.reason = param6;
         this.itemRenderer = param7;
      }
      
      override public function clone() : Event
      {
         return new ListEvent(type,bubbles,cancelable,columnIndex,rowIndex,reason,itemRenderer);
      }
   }
}
