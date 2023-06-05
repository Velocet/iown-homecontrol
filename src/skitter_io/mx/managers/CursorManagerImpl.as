package mx.managers
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.ui.Mouse;
   import mx.core.ApplicationGlobals;
   import mx.core.EventPriority;
   import mx.core.FlexSprite;
   import mx.core.mx_internal;
   import mx.events.InterManagerRequest;
   import mx.events.SWFBridgeRequest;
   import mx.events.SandboxMouseEvent;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class CursorManagerImpl implements mx.managers.ICursorManager
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var instance:mx.managers.ICursorManager;
       
      
      private var showSystemCursor:Boolean = false;
      
      private var nextCursorID:int = 1;
      
      private var systemManager:mx.managers.ISystemManager = null;
      
      private var cursorList:Array;
      
      private var _currentCursorYOffset:Number = 0;
      
      private var cursorHolder:Sprite;
      
      private var currentCursor:DisplayObject;
      
      private var sandboxRoot:IEventDispatcher = null;
      
      private var showCustomCursor:Boolean = false;
      
      private var listenForContextMenu:Boolean = false;
      
      private var customCursorLeftStage:Boolean = false;
      
      private var _currentCursorID:int = 0;
      
      private var initialized:Boolean = false;
      
      private var overTextField:Boolean = false;
      
      private var _currentCursorXOffset:Number = 0;
      
      private var busyCursorList:Array;
      
      private var overLink:Boolean = false;
      
      private var sourceArray:Array;
      
      public function CursorManagerImpl(param1:mx.managers.ISystemManager = null)
      {
         cursorList = [];
         busyCursorList = [];
         sourceArray = [];
         super();
         if(Boolean(instance) && !param1)
         {
            throw new Error("Instance already exists.");
         }
         if(param1)
         {
            this.systemManager = param1 as mx.managers.ISystemManager;
         }
         else
         {
            this.systemManager = SystemManagerGlobals.topLevelSystemManagers[0] as mx.managers.ISystemManager;
         }
         sandboxRoot = this.systemManager.getSandboxRoot();
         sandboxRoot.addEventListener(InterManagerRequest.CURSOR_MANAGER_REQUEST,marshalCursorManagerHandler,false,0,true);
         var _loc2_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
         _loc2_.name = "update";
         sandboxRoot.dispatchEvent(_loc2_);
      }
      
      public static function getInstance() : mx.managers.ICursorManager
      {
         if(!instance)
         {
            instance = new CursorManagerImpl();
         }
         return instance;
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
         sandboxRoot.removeEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
         mouseMoveHandler(param1);
      }
      
      public function set currentCursorYOffset(param1:Number) : void
      {
         var _loc2_:InterManagerRequest = null;
         _currentCursorYOffset = param1;
         if(!cursorHolder)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc2_.name = "currentCursorYOffset";
            _loc2_.value = currentCursorYOffset;
            sandboxRoot.dispatchEvent(_loc2_);
         }
      }
      
      public function get currentCursorXOffset() : Number
      {
         return _currentCursorXOffset;
      }
      
      public function removeCursor(param1:int) : void
      {
         var _loc2_:Object = null;
         var _loc3_:InterManagerRequest = null;
         var _loc4_:CursorQueueItem = null;
         if(initialized && !cursorHolder)
         {
            _loc3_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc3_.name = "removeCursor";
            _loc3_.value = param1;
            sandboxRoot.dispatchEvent(_loc3_);
            return;
         }
         for(_loc2_ in cursorList)
         {
            if((_loc4_ = cursorList[_loc2_]).cursorID == param1)
            {
               cursorList.splice(_loc2_,1);
               showCurrentCursor();
               break;
            }
         }
      }
      
      public function get currentCursorID() : int
      {
         return _currentCursorID;
      }
      
      private function removeContextMenuHandlers() : void
      {
         var _loc1_:InteractiveObject = null;
         var _loc2_:InteractiveObject = null;
         if(listenForContextMenu)
         {
            _loc1_ = systemManager.document as InteractiveObject;
            _loc2_ = systemManager as InteractiveObject;
            if(Boolean(_loc1_) && Boolean(_loc1_.contextMenu))
            {
               _loc1_.contextMenu.removeEventListener(ContextMenuEvent.MENU_SELECT,contextMenu_menuSelectHandler,true);
            }
            if(Boolean(_loc2_) && Boolean(_loc2_.contextMenu))
            {
               _loc2_.contextMenu.removeEventListener(ContextMenuEvent.MENU_SELECT,contextMenu_menuSelectHandler,true);
            }
            listenForContextMenu = false;
         }
      }
      
      private function marshalMouseMoveHandler(param1:Event) : void
      {
         var _loc2_:SWFBridgeRequest = null;
         var _loc3_:IEventDispatcher = null;
         if(false)
         {
            cursorHolder.visible = false;
            _loc2_ = new SWFBridgeRequest(SWFBridgeRequest.SHOW_MOUSE_CURSOR_REQUEST);
            if(systemManager.useSWFBridge())
            {
               _loc3_ = systemManager.swfBridgeGroup.parentBridge;
            }
            else
            {
               _loc3_ = systemManager;
            }
            _loc2_.requestor = _loc3_;
            _loc3_.dispatchEvent(_loc2_);
            if(_loc2_.data)
            {
               Mouse.show();
            }
         }
      }
      
      public function set currentCursorID(param1:int) : void
      {
         var _loc2_:InterManagerRequest = null;
         _currentCursorID = param1;
         if(!cursorHolder)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc2_.name = "currentCursorID";
            _loc2_.value = currentCursorID;
            sandboxRoot.dispatchEvent(_loc2_);
         }
      }
      
      private function priorityCompare(param1:CursorQueueItem, param2:CursorQueueItem) : int
      {
         if(param1.priority < param2.priority)
         {
            return -1;
         }
         if(param1.priority == param2.priority)
         {
            return 0;
         }
         return 1;
      }
      
      private function mouseOutHandler(param1:MouseEvent) : void
      {
         if(param1.relatedObject == null && false)
         {
            customCursorLeftStage = true;
            hideCursor();
            Mouse.show();
         }
      }
      
      public function setBusyCursor() : void
      {
         var _loc3_:InterManagerRequest = null;
         if(initialized && !cursorHolder)
         {
            _loc3_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc3_.name = "setBusyCursor";
            sandboxRoot.dispatchEvent(_loc3_);
            return;
         }
         var _loc1_:CSSStyleDeclaration = StyleManager.getStyleDeclaration("CursorManager");
         var _loc2_:Class = _loc1_.getStyle("busyCursor");
         busyCursorList.push(setCursor(_loc2_,CursorManagerPriority.LOW));
      }
      
      private function findSource(param1:Object) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(sourceArray[_loc3_] === param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function showCurrentCursor() : void
      {
         var _loc1_:CursorQueueItem = null;
         var _loc2_:InterManagerRequest = null;
         var _loc3_:Point = null;
         if(false)
         {
            if(!initialized)
            {
               cursorHolder = new FlexSprite();
               cursorHolder.name = "cursorHolder";
               cursorHolder.mouseEnabled = false;
               cursorHolder.mouseChildren = false;
               systemManager.addChildToSandboxRoot("cursorChildren",cursorHolder);
               initialized = true;
               _loc2_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
               _loc2_.name = "initialized";
               sandboxRoot.dispatchEvent(_loc2_);
            }
            _loc1_ = cursorList[0];
            if(currentCursorID == CursorManager.NO_CURSOR)
            {
               Mouse.hide();
            }
            if(_loc1_.cursorID != currentCursorID)
            {
               if(false)
               {
                  cursorHolder.removeChildAt(0);
               }
               currentCursor = new _loc1_.cursorClass();
               if(currentCursor)
               {
                  if(currentCursor is InteractiveObject)
                  {
                     InteractiveObject(currentCursor).mouseEnabled = false;
                  }
                  if(currentCursor is DisplayObjectContainer)
                  {
                     DisplayObjectContainer(currentCursor).mouseChildren = false;
                  }
                  cursorHolder.addChild(currentCursor);
                  addContextMenuHandlers();
                  if(systemManager is SystemManager)
                  {
                     _loc3_ = new Point(SystemManager(systemManager).mouseX + _loc1_.x,SystemManager(systemManager).mouseY + _loc1_.y);
                     _loc3_ = SystemManager(systemManager).localToGlobal(_loc3_);
                     _loc3_ = cursorHolder.parent.globalToLocal(_loc3_);
                     cursorHolder.x = _loc3_.x;
                     cursorHolder.y = _loc3_.y;
                  }
                  else if(systemManager is DisplayObject)
                  {
                     _loc3_ = new Point(DisplayObject(systemManager).mouseX + _loc1_.x,DisplayObject(systemManager).mouseY + _loc1_.y);
                     _loc3_ = DisplayObject(systemManager).localToGlobal(_loc3_);
                     _loc3_ = cursorHolder.parent.globalToLocal(_loc3_);
                     cursorHolder.x = DisplayObject(systemManager).mouseX + _loc1_.x;
                     cursorHolder.y = DisplayObject(systemManager).mouseY + _loc1_.y;
                  }
                  else
                  {
                     cursorHolder.x = _loc1_.x;
                     cursorHolder.y = _loc1_.y;
                  }
                  if(systemManager.useSWFBridge())
                  {
                     sandboxRoot.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true,EventPriority.CURSOR_MANAGEMENT);
                  }
                  else
                  {
                     systemManager.stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true,EventPriority.CURSOR_MANAGEMENT);
                  }
                  sandboxRoot.addEventListener(SandboxMouseEvent.MOUSE_MOVE_SOMEWHERE,marshalMouseMoveHandler,false,EventPriority.CURSOR_MANAGEMENT);
                  if(systemManager.useSWFBridge())
                  {
                     sandboxRoot.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler,true,EventPriority.CURSOR_MANAGEMENT);
                  }
                  else
                  {
                     systemManager.stage.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler,true,EventPriority.CURSOR_MANAGEMENT);
                  }
               }
               currentCursorID = _loc1_.cursorID;
               currentCursorXOffset = _loc1_.x;
               currentCursorYOffset = _loc1_.y;
            }
         }
         else
         {
            showCustomCursor = false;
            if(currentCursorID != CursorManager.NO_CURSOR)
            {
               currentCursorID = CursorManager.NO_CURSOR;
               currentCursorXOffset = 0;
               currentCursorYOffset = 0;
               cursorHolder.removeChild(currentCursor);
               removeSystemManagerHandlers();
               removeContextMenuHandlers();
            }
            Mouse.show();
         }
      }
      
      public function get currentCursorYOffset() : Number
      {
         return _currentCursorYOffset;
      }
      
      private function contextMenu_menuSelectHandler(param1:ContextMenuEvent) : void
      {
         showCustomCursor = true;
         sandboxRoot.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
      }
      
      public function hideCursor() : void
      {
         var _loc1_:InterManagerRequest = null;
         if(cursorHolder)
         {
            cursorHolder.visible = false;
         }
         else
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc1_.name = "hideCursor";
            sandboxRoot.dispatchEvent(_loc1_);
         }
      }
      
      public function showCursor() : void
      {
         var _loc1_:InterManagerRequest = null;
         if(cursorHolder)
         {
            cursorHolder.visible = true;
         }
         else
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc1_.name = "showCursor";
            sandboxRoot.dispatchEvent(_loc1_);
         }
      }
      
      private function marshalCursorManagerHandler(param1:Event) : void
      {
         var _loc3_:InterManagerRequest = null;
         if(param1 is InterManagerRequest)
         {
            return;
         }
         var _loc2_:Object = param1;
         switch(_loc2_.name)
         {
            case "initialized":
               initialized = _loc2_.value;
               break;
            case "currentCursorID":
               _currentCursorID = _loc2_.value;
               break;
            case "currentCursorXOffset":
               _currentCursorXOffset = _loc2_.value;
               break;
            case "currentCursorYOffset":
               _currentCursorYOffset = _loc2_.value;
               break;
            case "showCursor":
               if(cursorHolder)
               {
                  cursorHolder.visible = true;
               }
               break;
            case "hideCursor":
               if(cursorHolder)
               {
                  cursorHolder.visible = false;
               }
               break;
            case "setCursor":
               if(cursorHolder)
               {
                  _loc2_.value = setCursor.apply(this,_loc2_.value);
               }
               break;
            case "removeCursor":
               if(cursorHolder)
               {
                  removeCursor.apply(this,[_loc2_.value]);
               }
               break;
            case "removeAllCursors":
               if(cursorHolder)
               {
                  removeAllCursors();
               }
               break;
            case "setBusyCursor":
               if(cursorHolder)
               {
                  setBusyCursor();
               }
               break;
            case "removeBusyCursor":
               if(cursorHolder)
               {
                  removeBusyCursor();
               }
               break;
            case "registerToUseBusyCursor":
               if(cursorHolder)
               {
                  registerToUseBusyCursor.apply(this,_loc2_.value);
               }
               break;
            case "unRegisterToUseBusyCursor":
               if(cursorHolder)
               {
                  unRegisterToUseBusyCursor.apply(this,_loc2_.value);
               }
               break;
            case "update":
               if(cursorHolder)
               {
                  _loc3_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
                  _loc3_.name = "initialized";
                  _loc3_.value = true;
                  sandboxRoot.dispatchEvent(_loc3_);
                  _loc3_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
                  _loc3_.name = "currentCursorID";
                  _loc3_.value = currentCursorID;
                  sandboxRoot.dispatchEvent(_loc3_);
                  _loc3_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
                  _loc3_.name = "currentCursorXOffset";
                  _loc3_.value = currentCursorXOffset;
                  sandboxRoot.dispatchEvent(_loc3_);
                  _loc3_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
                  _loc3_.name = "currentCursorYOffset";
                  _loc3_.value = currentCursorYOffset;
                  sandboxRoot.dispatchEvent(_loc3_);
               }
         }
      }
      
      public function removeAllCursors() : void
      {
         var _loc1_:InterManagerRequest = null;
         if(initialized && !cursorHolder)
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc1_.name = "removeAllCursors";
            sandboxRoot.dispatchEvent(_loc1_);
            return;
         }
         cursorList.splice(0);
         showCurrentCursor();
      }
      
      private function completeHandler(param1:Event) : void
      {
         var _loc2_:int = findSource(param1.target);
         if(_loc2_ != -1)
         {
            sourceArray.splice(_loc2_,1);
            removeBusyCursor();
         }
      }
      
      public function removeBusyCursor() : void
      {
         var _loc1_:InterManagerRequest = null;
         if(initialized && !cursorHolder)
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc1_.name = "removeBusyCursor";
            sandboxRoot.dispatchEvent(_loc1_);
            return;
         }
         if(false)
         {
            removeCursor(int(busyCursorList.pop()));
         }
      }
      
      private function addContextMenuHandlers() : void
      {
         var _loc1_:InteractiveObject = null;
         var _loc2_:InteractiveObject = null;
         if(!listenForContextMenu)
         {
            _loc1_ = systemManager.document as InteractiveObject;
            _loc2_ = systemManager as InteractiveObject;
            if(Boolean(_loc1_) && Boolean(_loc1_.contextMenu))
            {
               _loc1_.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,contextMenu_menuSelectHandler,true,EventPriority.CURSOR_MANAGEMENT);
               listenForContextMenu = true;
            }
            if(Boolean(_loc2_) && Boolean(_loc2_.contextMenu))
            {
               _loc2_.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,contextMenu_menuSelectHandler,true,EventPriority.CURSOR_MANAGEMENT);
               listenForContextMenu = true;
            }
         }
      }
      
      public function setCursor(param1:Class, param2:int = 2, param3:Number = 0, param4:Number = 0) : int
      {
         var _loc7_:InterManagerRequest = null;
         if(initialized && !cursorHolder)
         {
            (_loc7_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST)).name = "setCursor";
            _loc7_.value = [param1,param2,param3,param4];
            sandboxRoot.dispatchEvent(_loc7_);
            return _loc7_.value as int;
         }
         var _loc5_:int = int(nextCursorID++);
         var _loc6_:CursorQueueItem;
         (_loc6_ = new CursorQueueItem()).cursorID = _loc5_;
         _loc6_.cursorClass = param1;
         _loc6_.priority = param2;
         _loc6_.x = param3;
         _loc6_.y = param4;
         if(systemManager)
         {
            _loc6_.systemManager = systemManager;
         }
         else
         {
            _loc6_.systemManager = ApplicationGlobals.application.systemManager;
         }
         cursorList.push(_loc6_);
         cursorList.sort(priorityCompare);
         showCurrentCursor();
         return _loc5_;
      }
      
      private function progressHandler(param1:ProgressEvent) : void
      {
         var _loc2_:int = findSource(param1.target);
         if(_loc2_ == -1)
         {
            sourceArray.push(param1.target);
            setBusyCursor();
         }
      }
      
      private function removeSystemManagerHandlers() : void
      {
         if(systemManager.useSWFBridge())
         {
            sandboxRoot.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
         }
         else
         {
            systemManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
         }
         sandboxRoot.removeEventListener(SandboxMouseEvent.MOUSE_MOVE_SOMEWHERE,marshalMouseMoveHandler,false);
         if(systemManager.useSWFBridge())
         {
            sandboxRoot.removeEventListener(MouseEvent.MOUSE_OUT,mouseMoveHandler,true);
         }
         else
         {
            systemManager.stage.removeEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler,true);
         }
      }
      
      public function registerToUseBusyCursor(param1:Object) : void
      {
         var _loc2_:InterManagerRequest = null;
         if(initialized && !cursorHolder)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc2_.name = "registerToUseBusyCursor";
            _loc2_.value = param1;
            sandboxRoot.dispatchEvent(_loc2_);
            return;
         }
         if(Boolean(param1) && param1 is EventDispatcher)
         {
            param1.addEventListener(ProgressEvent.PROGRESS,progressHandler);
            param1.addEventListener(Event.COMPLETE,completeHandler);
            param1.addEventListener(IOErrorEvent.IO_ERROR,completeHandler);
         }
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc4_:SWFBridgeRequest = null;
         var _loc5_:IEventDispatcher = null;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         _loc2_ = cursorHolder.parent.globalToLocal(_loc2_);
         _loc2_.x += currentCursorXOffset;
         _loc2_.y += currentCursorYOffset;
         cursorHolder.x = _loc2_.x;
         cursorHolder.y = _loc2_.y;
         var _loc3_:Object = param1.target;
         if(!overTextField && _loc3_ is TextField && _loc3_.type == TextFieldType.INPUT)
         {
            overTextField = true;
            showSystemCursor = true;
         }
         else if(overTextField && !(_loc3_ is TextField && _loc3_.type == TextFieldType.INPUT))
         {
            overTextField = false;
            showCustomCursor = true;
         }
         else
         {
            showCustomCursor = true;
         }
         if(showSystemCursor)
         {
            showSystemCursor = false;
            cursorHolder.visible = false;
            Mouse.show();
         }
         if(showCustomCursor)
         {
            showCustomCursor = false;
            cursorHolder.visible = true;
            Mouse.hide();
            _loc4_ = new SWFBridgeRequest(SWFBridgeRequest.HIDE_MOUSE_CURSOR_REQUEST);
            if(systemManager.useSWFBridge())
            {
               _loc5_ = systemManager.swfBridgeGroup.parentBridge;
            }
            else
            {
               _loc5_ = systemManager;
            }
            _loc4_.requestor = _loc5_;
            _loc5_.dispatchEvent(_loc4_);
         }
      }
      
      public function unRegisterToUseBusyCursor(param1:Object) : void
      {
         var _loc2_:InterManagerRequest = null;
         if(initialized && !cursorHolder)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc2_.name = "unRegisterToUseBusyCursor";
            _loc2_.value = param1;
            sandboxRoot.dispatchEvent(_loc2_);
            return;
         }
         if(Boolean(param1) && param1 is EventDispatcher)
         {
            param1.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
            param1.removeEventListener(Event.COMPLETE,completeHandler);
            param1.removeEventListener(IOErrorEvent.IO_ERROR,completeHandler);
         }
      }
      
      public function set currentCursorXOffset(param1:Number) : void
      {
         var _loc2_:InterManagerRequest = null;
         _currentCursorXOffset = param1;
         if(!cursorHolder)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.CURSOR_MANAGER_REQUEST);
            _loc2_.name = "currentCursorXOffset";
            _loc2_.value = currentCursorXOffset;
            sandboxRoot.dispatchEvent(_loc2_);
         }
      }
   }
}

import mx.core.mx_internal;
import mx.managers.ISystemManager;

class CursorQueueItem
{
   
   mx_internal static const VERSION:String = "3.5.0.12683";
    
   
   public var priority:int = 2;
   
   public var cursorClass:Class = null;
   
   public var cursorID:int = 0;
   
   public var x:Number;
   
   public var y:Number;
   
   public var systemManager:ISystemManager;
   
   public function CursorQueueItem()
   {
      super();
   }
}
