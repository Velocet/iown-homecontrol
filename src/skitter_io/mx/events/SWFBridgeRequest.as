package mx.events
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import mx.core.mx_internal;
   
   public class SWFBridgeRequest extends Event
   {
      
      public static const SHOW_MOUSE_CURSOR_REQUEST:String = "showMouseCursorRequest";
      
      public static const DEACTIVATE_POP_UP_REQUEST:String = "deactivatePopUpRequest";
      
      public static const SET_ACTUAL_SIZE_REQUEST:String = "setActualSizeRequest";
      
      public static const MOVE_FOCUS_REQUEST:String = "moveFocusRequest";
      
      public static const GET_VISIBLE_RECT_REQUEST:String = "getVisibleRectRequest";
      
      public static const ADD_POP_UP_PLACE_HOLDER_REQUEST:String = "addPopUpPlaceHolderRequest";
      
      public static const REMOVE_POP_UP_PLACE_HOLDER_REQUEST:String = "removePopUpPlaceHolderRequest";
      
      public static const RESET_MOUSE_CURSOR_REQUEST:String = "resetMouseCursorRequest";
      
      public static const ADD_POP_UP_REQUEST:String = "addPopUpRequest";
      
      public static const GET_SIZE_REQUEST:String = "getSizeRequest";
      
      public static const SHOW_MODAL_WINDOW_REQUEST:String = "showModalWindowRequest";
      
      public static const ACTIVATE_FOCUS_REQUEST:String = "activateFocusRequest";
      
      public static const DEACTIVATE_FOCUS_REQUEST:String = "deactivateFocusRequest";
      
      public static const HIDE_MOUSE_CURSOR_REQUEST:String = "hideMouseCursorRequest";
      
      public static const ACTIVATE_POP_UP_REQUEST:String = "activatePopUpRequest";
      
      public static const IS_BRIDGE_CHILD_REQUEST:String = "isBridgeChildRequest";
      
      public static const CAN_ACTIVATE_POP_UP_REQUEST:String = "canActivateRequestPopUpRequest";
      
      public static const HIDE_MODAL_WINDOW_REQUEST:String = "hideModalWindowRequest";
      
      public static const INVALIDATE_REQUEST:String = "invalidateRequest";
      
      public static const SET_SHOW_FOCUS_INDICATOR_REQUEST:String = "setShowFocusIndicatorRequest";
      
      public static const CREATE_MODAL_WINDOW_REQUEST:String = "createModalWindowRequest";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const REMOVE_POP_UP_REQUEST:String = "removePopUpRequest";
       
      
      public var requestor:IEventDispatcher;
      
      public var data:Object;
      
      public function SWFBridgeRequest(param1:String, param2:Boolean = false, param3:Boolean = false, param4:IEventDispatcher = null, param5:Object = null)
      {
         super(param1,param2,param3);
         this.requestor = param4;
         this.data = param5;
      }
      
      public static function marshal(param1:Event) : SWFBridgeRequest
      {
         var _loc2_:Object = param1;
         return new SWFBridgeRequest(_loc2_.type,_loc2_.bubbles,_loc2_.cancelable,_loc2_.requestor,_loc2_.data);
      }
      
      override public function clone() : Event
      {
         return new SWFBridgeRequest(type,bubbles,cancelable,requestor,data);
      }
   }
}
