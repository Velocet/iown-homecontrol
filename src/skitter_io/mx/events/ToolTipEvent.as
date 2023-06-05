package mx.events
{
   import flash.events.Event;
   import mx.core.IToolTip;
   import mx.core.mx_internal;
   
   public class ToolTipEvent extends Event
   {
      
      public static const TOOL_TIP_SHOWN:String = "toolTipShown";
      
      public static const TOOL_TIP_CREATE:String = "toolTipCreate";
      
      public static const TOOL_TIP_SHOW:String = "toolTipShow";
      
      public static const TOOL_TIP_HIDE:String = "toolTipHide";
      
      public static const TOOL_TIP_END:String = "toolTipEnd";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const TOOL_TIP_START:String = "toolTipStart";
       
      
      public var toolTip:IToolTip;
      
      public function ToolTipEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:IToolTip = null)
      {
         super(param1,param2,param3);
         this.toolTip = param4;
      }
      
      override public function clone() : Event
      {
         return new ToolTipEvent(type,bubbles,cancelable,toolTip);
      }
   }
}
