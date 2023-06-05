package mx.managers
{
   import flash.desktop.Clipboard;
   import flash.desktop.NativeDragManager;
   import flash.desktop.NativeDragOptions;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.NativeDragEvent;
   import flash.geom.Point;
   import flash.system.Capabilities;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.InterDragManagerEvent;
   import mx.events.InterManagerRequest;
   import mx.managers.dragClasses.DragProxy;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class NativeDragManagerImpl implements mx.managers.IDragManager
   {
      
      private static var sm:mx.managers.ISystemManager;
      
      private static var instance:mx.managers.IDragManager;
       
      
      private var _dragImage:IFlexDisplayObject;
      
      private var sandboxRoot:IEventDispatcher;
      
      private var _relatedObject:InteractiveObject;
      
      private var _allowedActions:NativeDragOptions;
      
      private var _action:String;
      
      private var _clipboard:Clipboard;
      
      public var dragProxy:DragProxy;
      
      private var _dragInitiator:IUIComponent;
      
      private var mouseIsDown:Boolean = false;
      
      private var _offset:Point;
      
      private var _allowMove:Boolean;
      
      public function NativeDragManagerImpl()
      {
         super();
         if(instance)
         {
            throw new Error("Instance already exists.");
         }
         mx_internal::registerSystemManager(sm);
         sandboxRoot = sm.getSandboxRoot();
         sandboxRoot.addEventListener(InterDragManagerEvent.DISPATCH_DRAG_EVENT,marshalDispatchEventHandler,false,0,true);
         sandboxRoot.addEventListener(InterManagerRequest.DRAG_MANAGER_REQUEST,marshalDragManagerHandler,false,0,true);
         var _loc1_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
         _loc1_.name = "update";
         sandboxRoot.dispatchEvent(_loc1_);
      }
      
      public static function getInstance() : mx.managers.IDragManager
      {
         if(!instance)
         {
            sm = SystemManagerGlobals.topLevelSystemManagers[0];
            instance = new NativeDragManagerImpl();
         }
         return instance;
      }
      
      private function marshalDispatchEventHandler(param1:Event) : void
      {
         if(param1 is InterDragManagerEvent)
         {
            return;
         }
         var _loc2_:Object = param1;
         var _loc3_:DisplayObject = SystemManager.getSWFRoot(_loc2_.dropTarget);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:DragEvent;
         (_loc4_ = new DragEvent(_loc2_.dragEventType,_loc2_.bubbles,_loc2_.cancelable)).localX = _loc2_.localX;
         _loc4_.localY = _loc2_.localY;
         _loc4_.action = _loc2_.action;
         _loc4_.ctrlKey = _loc2_.ctrlKey;
         _loc4_.altKey = _loc2_.altKey;
         _loc4_.shiftKey = _loc2_.shiftKey;
         _loc4_.draggedItem = _loc2_.draggedItem;
         _loc4_.dragSource = new DragSource();
         var _loc5_:Array;
         var _loc6_:int = int((_loc5_ = _loc2_.dragSource.formats).length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_.dragSource.addData(_loc2_.dragSource.dataForFormat(_loc5_[_loc7_]),_loc5_[_loc7_]);
            _loc7_++;
         }
         if(!_loc2_.dropTarget.dispatchEvent(_loc4_))
         {
            param1.preventDefault();
         }
      }
      
      public function getFeedback() : String
      {
         var _loc1_:InterManagerRequest = null;
         if(!isDragging)
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc1_.name = "getFeedback";
            sandboxRoot.dispatchEvent(_loc1_);
            return _loc1_.value as String;
         }
         return NativeDragManager.dropAction;
      }
      
      private function marshalDragManagerHandler(param1:Event) : void
      {
         var _loc3_:InteractiveObject = null;
         var _loc4_:InterManagerRequest = null;
         if(param1 is InterManagerRequest)
         {
            return;
         }
         var _loc2_:Object = param1;
         switch(_loc2_.name)
         {
            case "isDragging":
               break;
            case "acceptDragDrop":
               if(isDragging)
               {
                  _loc3_ = _loc2_.value as InteractiveObject;
                  if(_loc3_)
                  {
                     NativeDragManager.acceptDragDrop(_loc3_);
                  }
               }
               break;
            case "showFeedback":
               if(isDragging)
               {
                  showFeedback(_loc2_.value);
               }
               break;
            case "getFeedback":
               if(isDragging)
               {
                  _loc2_.value = getFeedback();
               }
               break;
            case "endDrag":
               endDrag();
               break;
            case "update":
               if(isDragging)
               {
                  (_loc4_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST)).name = "isDragging";
                  _loc4_.value = true;
                  sandboxRoot.dispatchEvent(_loc4_);
               }
         }
      }
      
      mx_internal function unregisterSystemManager(param1:mx.managers.ISystemManager) : void
      {
         if(param1.isTopLevel())
         {
            param1.removeEventListener(MouseEvent.MOUSE_DOWN,sm_mouseDownHandler);
            param1.removeEventListener(MouseEvent.MOUSE_UP,sm_mouseUpHandler);
         }
         param1.stage.removeEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,nativeDragEventHandler,true);
         param1.stage.removeEventListener(NativeDragEvent.NATIVE_DRAG_COMPLETE,nativeDragEventHandler,true);
         param1.stage.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP,nativeDragEventHandler,true);
         param1.stage.removeEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,nativeDragEventHandler,true);
         param1.stage.removeEventListener(NativeDragEvent.NATIVE_DRAG_OVER,nativeDragEventHandler,true);
         param1.stage.removeEventListener(NativeDragEvent.NATIVE_DRAG_START,nativeDragEventHandler,true);
      }
      
      public function get isDragging() : Boolean
      {
         return NativeDragManager.isDragging;
      }
      
      mx_internal function registerSystemManager(param1:mx.managers.ISystemManager) : void
      {
         if(param1.isTopLevel())
         {
            param1.addEventListener(MouseEvent.MOUSE_DOWN,sm_mouseDownHandler);
            param1.addEventListener(MouseEvent.MOUSE_UP,sm_mouseUpHandler);
         }
         param1.stage.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,nativeDragEventHandler,true);
         param1.stage.addEventListener(NativeDragEvent.NATIVE_DRAG_COMPLETE,nativeDragEventHandler,true);
         param1.stage.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,nativeDragEventHandler,true);
         param1.stage.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,nativeDragEventHandler,true);
         param1.stage.addEventListener(NativeDragEvent.NATIVE_DRAG_OVER,nativeDragEventHandler,true);
         param1.stage.addEventListener(NativeDragEvent.NATIVE_DRAG_START,nativeDragEventHandler,true);
      }
      
      private function sm_mouseUpHandler(param1:MouseEvent) : void
      {
         mouseIsDown = false;
      }
      
      public function doDrag(param1:IUIComponent, param2:DragSource, param3:MouseEvent, param4:IFlexDisplayObject = null, param5:Number = 0, param6:Number = 0, param7:Number = 0.5, param8:Boolean = true) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc13_:String = null;
         var _loc14_:DragDataFormatFetcher = null;
         var _loc15_:CSSStyleDeclaration = null;
         var _loc16_:Class = null;
         if(isDragging)
         {
            return;
         }
         if(!(param3.type == MouseEvent.MOUSE_DOWN || param3.type == MouseEvent.CLICK || mouseIsDown || param3.buttonDown))
         {
            return;
         }
         var _loc11_:InterManagerRequest;
         (_loc11_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST)).name = "isDragging";
         _loc11_.value = true;
         sandboxRoot.dispatchEvent(_loc11_);
         (_loc11_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST)).name = "mouseShield";
         _loc11_.value = true;
         sandboxRoot.dispatchEvent(_loc11_);
         _clipboard = new Clipboard();
         _dragInitiator = param1;
         _offset = new Point(param5,param6);
         _allowMove = param8;
         _offset.y = 0 - InteractiveObject(param1).mouseY;
         _offset.x = 0 - InteractiveObject(param1).mouseX;
         _allowedActions = new NativeDragOptions();
         _allowedActions.allowCopy = true;
         _allowedActions.allowLink = true;
         _allowedActions.allowMove = param8;
         var _loc12_:int = 0;
         while(_loc12_ < param2.formats.length)
         {
            _loc13_ = param2.formats[_loc12_] as String;
            (_loc14_ = new DragDataFormatFetcher()).dragSource = param2;
            _loc14_.format = _loc13_;
            _clipboard.setDataHandler(_loc13_,_loc14_.getDragSourceData,false);
            _loc12_++;
         }
         if(!param4)
         {
            param4 = new (_loc16_ = (_loc15_ = StyleManager.getStyleDeclaration("DragManager")).getStyle("defaultDragImageSkin"))();
            _loc9_ = !!param1 ? Number(param1.width) : 0;
            _loc10_ = !!param1 ? Number(param1.height) : 0;
            if(param4 is IFlexDisplayObject)
            {
               IFlexDisplayObject(param4).setActualSize(_loc9_,_loc10_);
            }
         }
         else
         {
            _loc9_ = Number(param4.width);
            _loc10_ = Number(param4.height);
         }
         _dragImage = param4;
         if(param4 is IUIComponent && param4 is ILayoutManagerClient && !ILayoutManagerClient(param4).initialized && Boolean(param1))
         {
            param4.addEventListener(FlexEvent.UPDATE_COMPLETE,initiateDrag);
            param1.systemManager.popUpChildren.addChild(DisplayObject(param4));
            if(param4 is ILayoutManagerClient)
            {
               UIComponentGlobals.mx_internal::layoutManager.validateClient(ILayoutManagerClient(param4),true);
            }
            if(param4 is IUIComponent)
            {
               param4.setActualSize(_loc9_,_loc10_);
               _loc9_ = Number((param4 as IUIComponent).getExplicitOrMeasuredWidth());
               _loc10_ = Number((param4 as IUIComponent).getExplicitOrMeasuredHeight());
            }
            else
            {
               _loc9_ = Number(param4.measuredWidth);
               _loc10_ = Number(param4.measuredHeight);
            }
            if(param4 is ILayoutManagerClient)
            {
               UIComponentGlobals.mx_internal::layoutManager.validateClient(ILayoutManagerClient(param4));
            }
            return;
         }
         initiateDrag(null,false);
      }
      
      private function isSameOrChildApplicationDomain(param1:Object) : Boolean
      {
         var _loc2_:DisplayObject = SystemManager.getSWFRoot(param1);
         if(_loc2_)
         {
            return true;
         }
         var _loc3_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST);
         _loc3_.name = "hasSWFBridges";
         sandboxRoot.dispatchEvent(_loc3_);
         if(!_loc3_.value)
         {
            return true;
         }
         return false;
      }
      
      public function showFeedback(param1:String) : void
      {
         var _loc2_:InterManagerRequest = null;
         if(isDragging)
         {
            if(param1 == DragManager.MOVE && true)
            {
               return;
            }
            if(param1 == DragManager.COPY && true)
            {
               return;
            }
            if(param1 == DragManager.LINK && true)
            {
               return;
            }
            NativeDragManager.dropAction = param1;
         }
         else
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc2_.name = "showFeedback";
            _loc2_.value = param1;
            sandboxRoot.dispatchEvent(_loc2_);
         }
      }
      
      public function acceptDragDrop(param1:IUIComponent) : void
      {
         var _loc2_:InteractiveObject = null;
         var _loc3_:InterManagerRequest = null;
         if(isDragging)
         {
            _loc2_ = param1 as InteractiveObject;
            if(_loc2_)
            {
               NativeDragManager.acceptDragDrop(_loc2_);
            }
         }
         else
         {
            _loc3_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc3_.name = "acceptDragDrop";
            _loc3_.value = param1;
            sandboxRoot.dispatchEvent(_loc3_);
         }
      }
      
      private function initiateDrag(param1:FlexEvent, param2:Boolean = true) : void
      {
         var _loc3_:BitmapData = null;
         if(param2)
         {
            _dragImage.removeEventListener(FlexEvent.UPDATE_COMPLETE,initiateDrag);
         }
         if(false && false)
         {
            _loc3_ = new BitmapData(_dragImage.width,_dragImage.height,true,0);
         }
         else
         {
            _loc3_ = new BitmapData(1,1,true,0);
         }
         _loc3_.draw(_dragImage);
         if(param2 && _dragImage is IUIComponent && Boolean(_dragInitiator))
         {
            _dragInitiator.systemManager.popUpChildren.removeChild(DisplayObject(_dragImage));
         }
         NativeDragManager.doDrag(InteractiveObject(_dragInitiator),_clipboard,_loc3_,_offset,_allowedActions);
      }
      
      public function endDrag() : void
      {
         var _loc1_:InterManagerRequest = null;
         _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
         _loc1_.name = "mouseShield";
         _loc1_.value = false;
         sandboxRoot.dispatchEvent(_loc1_);
         _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
         _loc1_.name = "isDragging";
         _loc1_.value = false;
         sandboxRoot.dispatchEvent(_loc1_);
      }
      
      private function sm_mouseDownHandler(param1:MouseEvent) : void
      {
         mouseIsDown = true;
      }
      
      private function _dispatchDragEvent(param1:DisplayObject, param2:DragEvent) : void
      {
         var _loc3_:InterManagerRequest = null;
         var _loc4_:InterDragManagerEvent = null;
         if(isSameOrChildApplicationDomain(param1))
         {
            param1.dispatchEvent(param2);
         }
         else
         {
            _loc3_ = new InterManagerRequest(InterManagerRequest.INIT_MANAGER_REQUEST);
            _loc3_.name = "mx.managers.IDragManagerImpl";
            sandboxRoot.dispatchEvent(_loc3_);
            _loc4_ = new InterDragManagerEvent(InterDragManagerEvent.DISPATCH_DRAG_EVENT,false,false,param2.localX,param2.localY,param2.relatedObject,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta,param1,param2.type,param2.dragInitiator,param2.dragSource,param2.action,param2.draggedItem);
            sandboxRoot.dispatchEvent(_loc4_);
         }
      }
      
      private function nativeDragEventHandler(param1:NativeDragEvent) : void
      {
         var _loc8_:String = null;
         var _loc9_:* = null;
         var _loc10_:InterManagerRequest = null;
         var _loc13_:int = 0;
         var _loc14_:DragDataFormatFetcher = null;
         var _loc2_:String = String(param1.type.charAt(6).toLowerCase() + param1.type.substr(7));
         var _loc3_:DragSource = new DragSource();
         var _loc4_:DisplayObject = param1.target as DisplayObject;
         var _loc6_:Array;
         var _loc5_:Clipboard;
         var _loc7_:int = int((_loc6_ = (_loc5_ = param1.clipboard).formats).length);
         _allowedActions = param1.allowedActions;
         var _loc11_:Boolean = false;
         if(Capabilities.os.substring(0,3) == "Mac")
         {
            _loc11_ = Boolean(param1.commandKey);
         }
         else
         {
            _loc11_ = Boolean(param1.controlKey);
         }
         if(false && param1.type == NativeDragEvent.NATIVE_DRAG_START)
         {
            NativeDragManager.dropAction = _loc11_ || !_allowMove ? "null" : DragManager.MOVE;
         }
         if(param1.type != NativeDragEvent.NATIVE_DRAG_EXIT)
         {
            _loc13_ = 0;
            while(_loc13_ < _loc7_)
            {
               _loc8_ = String(_loc6_[_loc13_]);
               if(_loc5_.hasFormat(_loc8_))
               {
                  (_loc14_ = new DragDataFormatFetcher()).clipboard = _loc5_;
                  _loc14_.format = _loc8_;
                  _loc3_.addHandler(_loc14_.getClipboardData,_loc8_);
               }
               _loc13_++;
            }
         }
         if(param1.type == NativeDragEvent.NATIVE_DRAG_DROP)
         {
            _relatedObject = param1.target as InteractiveObject;
         }
         var _loc12_:DragEvent;
         (_loc12_ = new DragEvent(_loc2_,false,param1.cancelable,NativeDragManager.dragInitiator as IUIComponent,_loc3_,param1.dropAction,_loc11_,param1.altKey,param1.shiftKey)).buttonDown = param1.buttonDown;
         _loc12_.delta = param1.delta;
         _loc12_.localX = param1.localX;
         _loc12_.localY = param1.localY;
         if(_loc2_ == DragEvent.DRAG_COMPLETE)
         {
            _loc12_.relatedObject = _relatedObject;
         }
         else
         {
            _loc12_.relatedObject = param1.relatedObject;
         }
         _dispatchDragEvent(_loc4_,_loc12_);
         if(_loc2_ == DragEvent.DRAG_COMPLETE)
         {
            if(sm == sandboxRoot)
            {
               endDrag();
            }
            else
            {
               (_loc10_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST)).name = "endDrag";
               sandboxRoot.dispatchEvent(_loc10_);
            }
         }
      }
   }
}

import flash.desktop.Clipboard;
import mx.core.DragSource;
import mx.core.mx_internal;

class DragDataFormatFetcher
{
   
   mx_internal static const VERSION:String = "3.5.0.12683";
    
   
   public var clipboard:Clipboard;
   
   public var format:String;
   
   public var dragSource:DragSource;
   
   public function DragDataFormatFetcher()
   {
      super();
   }
   
   public function getDragSourceData() : Object
   {
      if(dragSource)
      {
         return dragSource.dataForFormat(format);
      }
      return null;
   }
   
   public function getClipboardData() : Object
   {
      if(clipboard)
      {
         return clipboard.getData(format);
      }
      return null;
   }
}
