package mx.managers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.InterDragManagerEvent;
   import mx.events.InterManagerRequest;
   import mx.managers.dragClasses.DragProxy;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class DragManagerImpl implements mx.managers.IDragManager
   {
      
      private static var instance:mx.managers.IDragManager;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var sm:mx.managers.ISystemManager;
       
      
      private var bDoingDrag:Boolean = false;
      
      private var sandboxRoot:IEventDispatcher;
      
      public var dragProxy:DragProxy;
      
      private var dragInitiator:IUIComponent;
      
      private var mouseIsDown:Boolean = false;
      
      public function DragManagerImpl()
      {
         var _loc1_:IEventDispatcher = null;
         super();
         if(instance)
         {
            throw new Error("Instance already exists.");
         }
         if(!sm.isTopLevelRoot())
         {
            sandboxRoot = sm.getSandboxRoot();
            sandboxRoot.addEventListener(InterDragManagerEvent.DISPATCH_DRAG_EVENT,marshalDispatchEventHandler,false,0,true);
         }
         else
         {
            _loc1_ = sm;
            _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,sm_mouseDownHandler,false,0,true);
            _loc1_.addEventListener(MouseEvent.MOUSE_UP,sm_mouseUpHandler,false,0,true);
            sandboxRoot = sm;
            sandboxRoot.addEventListener(InterDragManagerEvent.DISPATCH_DRAG_EVENT,marshalDispatchEventHandler,false,0,true);
         }
         sandboxRoot.addEventListener(InterManagerRequest.DRAG_MANAGER_REQUEST,marshalDragManagerHandler,false,0,true);
         var _loc2_:InterManagerRequest = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
         _loc2_.name = "update";
         sandboxRoot.dispatchEvent(_loc2_);
      }
      
      public static function getInstance() : mx.managers.IDragManager
      {
         if(!instance)
         {
            sm = SystemManagerGlobals.topLevelSystemManagers[0];
            instance = new DragManagerImpl();
         }
         return instance;
      }
      
      private function marshalDragManagerHandler(param1:Event) : void
      {
         var _loc3_:InterManagerRequest = null;
         if(param1 is InterManagerRequest)
         {
            return;
         }
         var _loc2_:Object = param1;
         switch(_loc2_.name)
         {
            case "isDragging":
               bDoingDrag = _loc2_.value;
               break;
            case "acceptDragDrop":
               if(dragProxy)
               {
                  dragProxy.target = _loc2_.value;
               }
               break;
            case "showFeedback":
               if(dragProxy)
               {
                  showFeedback(_loc2_.value);
               }
               break;
            case "getFeedback":
               if(dragProxy)
               {
                  _loc2_.value = getFeedback();
               }
               break;
            case "endDrag":
               endDrag();
               break;
            case "update":
               if(Boolean(dragProxy) && isDragging)
               {
                  _loc3_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
                  _loc3_.name = "isDragging";
                  _loc3_.value = true;
                  sandboxRoot.dispatchEvent(_loc3_);
               }
         }
      }
      
      private function sm_mouseUpHandler(param1:MouseEvent) : void
      {
         mouseIsDown = false;
      }
      
      public function get isDragging() : Boolean
      {
         return bDoingDrag;
      }
      
      public function doDrag(param1:IUIComponent, param2:DragSource, param3:MouseEvent, param4:IFlexDisplayObject = null, param5:Number = 0, param6:Number = 0, param7:Number = 0.5, param8:Boolean = true) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc18_:CSSStyleDeclaration = null;
         var _loc19_:Class = null;
         if(bDoingDrag)
         {
            return;
         }
         if(!(param3.type == MouseEvent.MOUSE_DOWN || param3.type == MouseEvent.CLICK || mouseIsDown || param3.buttonDown))
         {
            return;
         }
         bDoingDrag = true;
         var _loc11_:InterManagerRequest;
         (_loc11_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST)).name = "isDragging";
         _loc11_.value = true;
         sandboxRoot.dispatchEvent(_loc11_);
         (_loc11_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST)).name = "mouseShield";
         _loc11_.value = true;
         sandboxRoot.dispatchEvent(_loc11_);
         this.dragInitiator = param1;
         dragProxy = new DragProxy(param1,param2);
         sm.addChildToSandboxRoot("popUpChildren",dragProxy);
         if(!param4)
         {
            param4 = new (_loc19_ = (_loc18_ = StyleManager.getStyleDeclaration("DragManager")).getStyle("defaultDragImageSkin"))();
            dragProxy.addChild(DisplayObject(param4));
            _loc9_ = Number(param1.width);
            _loc10_ = Number(param1.height);
         }
         else
         {
            dragProxy.addChild(DisplayObject(param4));
            if(param4 is ILayoutManagerClient)
            {
               UIComponentGlobals.mx_internal::layoutManager.validateClient(ILayoutManagerClient(param4),true);
            }
            if(param4 is IUIComponent)
            {
               _loc9_ = Number((param4 as IUIComponent).getExplicitOrMeasuredWidth());
               _loc10_ = Number((param4 as IUIComponent).getExplicitOrMeasuredHeight());
            }
            else
            {
               _loc9_ = Number(param4.measuredWidth);
               _loc10_ = Number(param4.measuredHeight);
            }
         }
         param4.setActualSize(_loc9_,_loc10_);
         dragProxy.setActualSize(_loc9_,_loc10_);
         dragProxy.alpha = param7;
         dragProxy.allowMove = param8;
         var _loc12_:Object;
         if((_loc12_ = param3.target) == null)
         {
            _loc12_ = param1;
         }
         var _loc13_:Point = new Point(param3.localX,param3.localY);
         _loc13_ = DisplayObject(_loc12_).localToGlobal(_loc13_);
         var _loc14_:Number = (_loc13_ = DisplayObject(sandboxRoot).globalToLocal(_loc13_)).x;
         var _loc15_:Number = _loc13_.y;
         var _loc16_:Point = DisplayObject(_loc12_).localToGlobal(new Point(param3.localX,param3.localY));
         _loc16_ = DisplayObject(param1).globalToLocal(_loc16_);
         dragProxy.xOffset = _loc16_.x + param5;
         dragProxy.yOffset = _loc16_.y + param6;
         dragProxy.x = _loc14_ - 0;
         dragProxy.y = _loc15_ - 0;
         dragProxy.startX = dragProxy.x;
         dragProxy.startY = dragProxy.y;
         if(param4 is DisplayObject)
         {
            DisplayObject(param4).cacheAsBitmap = true;
         }
         var _loc17_:Object;
         if(_loc17_ = dragProxy.automationDelegate)
         {
            _loc17_.recordAutomatableDragStart(param1,param3);
         }
      }
      
      private function sm_mouseDownHandler(param1:MouseEvent) : void
      {
         mouseIsDown = true;
      }
      
      public function showFeedback(param1:String) : void
      {
         var _loc2_:InterManagerRequest = null;
         if(dragProxy)
         {
            if(param1 == DragManager.MOVE && true)
            {
               param1 = "null";
            }
            dragProxy.action = param1;
         }
         else if(isDragging)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc2_.name = "showFeedback";
            _loc2_.value = param1;
            sandboxRoot.dispatchEvent(_loc2_);
         }
      }
      
      public function acceptDragDrop(param1:IUIComponent) : void
      {
         var _loc2_:InterManagerRequest = null;
         if(dragProxy)
         {
            dragProxy.target = param1 as DisplayObject;
         }
         else if(isDragging)
         {
            _loc2_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc2_.name = "acceptDragDrop";
            _loc2_.value = param1;
            sandboxRoot.dispatchEvent(_loc2_);
         }
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
         if(!dragProxy && isDragging)
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc1_.name = "getFeedback";
            sandboxRoot.dispatchEvent(_loc1_);
            return _loc1_.value as String;
         }
         return !!dragProxy ? "null" : DragManager.NONE;
      }
      
      public function endDrag() : void
      {
         var _loc1_:InterManagerRequest = null;
         if(dragProxy)
         {
            sm.removeChildFromSandboxRoot("popUpChildren",dragProxy);
            dragProxy.removeChildAt(0);
            dragProxy = null;
         }
         else if(isDragging)
         {
            _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
            _loc1_.name = "endDrag";
            sandboxRoot.dispatchEvent(_loc1_);
         }
         _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
         _loc1_.name = "mouseShield";
         _loc1_.value = false;
         sandboxRoot.dispatchEvent(_loc1_);
         dragInitiator = null;
         bDoingDrag = false;
         _loc1_ = new InterManagerRequest(InterManagerRequest.DRAG_MANAGER_REQUEST);
         _loc1_.name = "isDragging";
         _loc1_.value = false;
         sandboxRoot.dispatchEvent(_loc1_);
      }
   }
}
