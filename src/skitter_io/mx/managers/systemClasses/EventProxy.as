package mx.managers.systemClasses
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import mx.events.SandboxMouseEvent;
   import mx.managers.ISystemManager;
   import mx.utils.EventUtil;
   
   public class EventProxy extends EventDispatcher
   {
       
      
      private var systemManager:ISystemManager;
      
      public function EventProxy(param1:ISystemManager)
      {
         super();
         this.systemManager = param1;
      }
      
      public function marshalListener(param1:Event) : void
      {
         var _loc2_:MouseEvent = null;
         var _loc3_:SandboxMouseEvent = null;
         if(param1 is MouseEvent)
         {
            _loc2_ = param1 as MouseEvent;
            _loc3_ = new SandboxMouseEvent(EventUtil.mouseEventMap[param1.type],false,false,_loc2_.ctrlKey,_loc2_.altKey,_loc2_.shiftKey,_loc2_.buttonDown);
            systemManager.dispatchEventFromSWFBridges(_loc3_,null,true,true);
         }
         else if(param1.type == Event.MOUSE_LEAVE)
         {
            _loc3_ = new SandboxMouseEvent(SandboxMouseEvent.MOUSE_UP_SOMEWHERE);
            systemManager.dispatchEventFromSWFBridges(_loc3_,null,true,true);
            systemManager.dispatchEvent(_loc3_);
         }
      }
   }
}
