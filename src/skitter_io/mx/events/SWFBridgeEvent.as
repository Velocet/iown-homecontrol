package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class SWFBridgeEvent extends Event
   {
      
      public static const BRIDGE_FOCUS_MANAGER_ACTIVATE:String = "bridgeFocusManagerActivate";
      
      public static const BRIDGE_WINDOW_ACTIVATE:String = "bridgeWindowActivate";
      
      public static const BRIDGE_WINDOW_DEACTIVATE:String = "brdigeWindowDeactivate";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const BRIDGE_NEW_APPLICATION:String = "bridgeNewApplication";
      
      public static const BRIDGE_APPLICATION_UNLOADING:String = "bridgeApplicationUnloading";
      
      public static const BRIDGE_APPLICATION_ACTIVATE:String = "bridgeApplicationActivate";
       
      
      public var data:Object;
      
      public function SWFBridgeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Object = null)
      {
         super(param1,param2,param3);
         this.data = param4;
      }
      
      public static function marshal(param1:Event) : SWFBridgeEvent
      {
         var _loc2_:Object = param1;
         return new SWFBridgeEvent(_loc2_.type,_loc2_.bubbles,_loc2_.cancelable,_loc2_.data);
      }
      
      override public function clone() : Event
      {
         return new SWFBridgeEvent(type,bubbles,cancelable,data);
      }
   }
}
