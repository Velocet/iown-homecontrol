package mx.managers
{
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.core.IFlexModuleFactory;
   import mx.core.ISWFBridgeGroup;
   import mx.core.ISWFBridgeProvider;
   import mx.core.mx_internal;
   import mx.events.SWFBridgeEvent;
   import mx.utils.NameUtil;
   import mx.utils.SecurityUtil;
   
   public class SystemManagerProxy extends SystemManager
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _systemManager:mx.managers.ISystemManager;
      
      public function SystemManagerProxy(param1:mx.managers.ISystemManager)
      {
         super();
         _systemManager = param1;
         mx_internal::topLevel = true;
         super.addEventListener(MouseEvent.MOUSE_DOWN,proxyMouseDownHandler,true);
      }
      
      override public function create(... rest) : Object
      {
         return IFlexModuleFactory(_systemManager).create.apply(this,rest);
      }
      
      public function get systemManager() : mx.managers.ISystemManager
      {
         return _systemManager;
      }
      
      override public function activate(param1:IFocusManagerContainer) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:SWFBridgeEvent = null;
         var _loc2_:IEventDispatcher = !!_systemManager.swfBridgeGroup ? _systemManager.swfBridgeGroup.parentBridge : null;
         if(_loc2_)
         {
            _loc3_ = SecurityUtil.hasMutualTrustBetweenParentAndChild(ISWFBridgeProvider(_systemManager));
            _loc4_ = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_WINDOW_ACTIVATE,false,false,{
               "notifier":_loc2_,
               "window":(_loc3_ ? {} : NameUtil.displayObjectToString(this))
            });
            _systemManager.getSandboxRoot().dispatchEvent(_loc4_);
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         _systemManager.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function deactivateByProxy(param1:IFocusManagerContainer) : void
      {
         if(param1)
         {
            param1.focusManager.deactivate();
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         _systemManager.removeEventListener(param1,param2,param3);
      }
      
      override public function get document() : Object
      {
         return mx_internal::findFocusManagerContainer(this);
      }
      
      public function activateByProxy(param1:IFocusManagerContainer) : void
      {
         super.activate(param1);
      }
      
      override public function removeChildBridge(param1:IEventDispatcher) : void
      {
         _systemManager.removeChildBridge(param1);
      }
      
      override public function get swfBridgeGroup() : ISWFBridgeGroup
      {
         return _systemManager.swfBridgeGroup;
      }
      
      override public function addChildBridge(param1:IEventDispatcher, param2:DisplayObject) : void
      {
         _systemManager.addChildBridge(param1,param2);
      }
      
      override public function useSWFBridge() : Boolean
      {
         return _systemManager.useSWFBridge();
      }
      
      override public function get screen() : Rectangle
      {
         return _systemManager.screen;
      }
      
      override public function set swfBridgeGroup(param1:ISWFBridgeGroup) : void
      {
      }
      
      private function proxyMouseDownHandler(param1:MouseEvent) : void
      {
         if(mx_internal::findFocusManagerContainer(this))
         {
            SystemManager(_systemManager).mx_internal::dispatchActivatedWindowEvent(this);
         }
      }
      
      override public function deactivate(param1:IFocusManagerContainer) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:SWFBridgeEvent = null;
         var _loc2_:mx.managers.ISystemManager = _systemManager;
         var _loc3_:IEventDispatcher = !!_loc2_.swfBridgeGroup ? _loc2_.swfBridgeGroup.parentBridge : null;
         if(_loc3_)
         {
            _loc4_ = SecurityUtil.hasMutualTrustBetweenParentAndChild(ISWFBridgeProvider(_systemManager));
            _loc5_ = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_WINDOW_DEACTIVATE,false,false,{
               "notifier":_loc3_,
               "window":(_loc4_ ? {} : NameUtil.displayObjectToString(this))
            });
            _systemManager.getSandboxRoot().dispatchEvent(_loc5_);
         }
      }
      
      override public function set document(param1:Object) : void
      {
      }
      
      override public function getVisibleApplicationRect(param1:Rectangle = null) : Rectangle
      {
         return _systemManager.getVisibleApplicationRect(param1);
      }
      
      override public function getDefinitionByName(param1:String) : Object
      {
         return _systemManager.getDefinitionByName(param1);
      }
   }
}
