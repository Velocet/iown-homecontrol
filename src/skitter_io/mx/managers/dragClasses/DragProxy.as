package mx.managers.dragClasses
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.core.DragSource;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.effects.Move;
   import mx.effects.Zoom;
   import mx.events.DragEvent;
   import mx.events.EffectEvent;
   import mx.events.InterDragManagerEvent;
   import mx.events.InterManagerRequest;
   import mx.events.SandboxMouseEvent;
   import mx.managers.CursorManager;
   import mx.managers.DragManager;
   import mx.managers.ISystemManager;
   import mx.managers.SystemManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class DragProxy extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var allowMove:Boolean = true;
      
      private var cursorClass:Class = null;
      
      public var action:String;
      
      private var sandboxRoot:IEventDispatcher;
      
      public var target:DisplayObject = null;
      
      public var dragInitiator:IUIComponent;
      
      public var xOffset:Number;
      
      public var yOffset:Number;
      
      public var dragSource:DragSource;
      
      private var cursorID:int = 0;
      
      private var lastMouseEvent:MouseEvent;
      
      public var startX:Number;
      
      public var startY:Number;
      
      private var lastKeyEvent:KeyboardEvent;
      
      public function DragProxy(param1:IUIComponent, param2:DragSource)
      {
         super();
         this.dragInitiator = param1;
         this.dragSource = param2;
         var _loc3_:ISystemManager = param1.systemManager.topLevelSystemManager as ISystemManager;
         var _loc4_:IEventDispatcher;
         (_loc4_ = sandboxRoot = _loc3_.getSandboxRoot()).addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
         _loc4_.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler,true);
         _loc4_.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         _loc4_.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
      }
      
      private static function getObjectsUnderPoint(param1:DisplayObject, param2:Point, param3:Array) : void
      {
         var doc:DisplayObjectContainer = null;
         var rc:Object = null;
         var n:int = 0;
         var i:int = 0;
         var child:DisplayObject = null;
         var obj:DisplayObject = param1;
         var pt:Point = param2;
         var arr:Array = param3;
         if(!obj.visible)
         {
            return;
         }
         if(obj is UIComponent && !UIComponent(obj).mx_internal::$visible)
         {
            return;
         }
         if(obj.hitTestPoint(pt.x,pt.y,true))
         {
            if(obj is InteractiveObject && InteractiveObject(obj).mouseEnabled)
            {
               arr.push(obj);
            }
            if(obj is DisplayObjectContainer)
            {
               doc = obj as DisplayObjectContainer;
               if(doc.mouseChildren)
               {
                  if("rawChildren" in doc)
                  {
                     rc = doc["rawChildren"];
                     n = int(rc.numChildren);
                     i = 0;
                     while(i < n)
                     {
                        try
                        {
                           getObjectsUnderPoint(rc.getChildAt(i),pt,arr);
                        }
                        catch(e:Error)
                        {
                        }
                        i++;
                     }
                  }
                  else if(doc.numChildren)
                  {
                     n = doc.numChildren;
                     i = 0;
                     while(i < n)
                     {
                        try
                        {
                           child = doc.getChildAt(i);
                           getObjectsUnderPoint(child,pt,arr);
                        }
                        catch(e:Error)
                        {
                        }
                        i++;
                     }
                  }
               }
            }
         }
      }
      
      public function mouseUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:DragEvent = null;
         var _loc6_:Point = null;
         var _loc7_:Move = null;
         var _loc8_:Zoom = null;
         var _loc9_:Move = null;
         var _loc3_:ISystemManager = dragInitiator.systemManager.topLevelSystemManager as ISystemManager;
         var _loc4_:IEventDispatcher;
         (_loc4_ = sandboxRoot).removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
         _loc4_.removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler,true);
         _loc4_.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         _loc4_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,mouseLeaveHandler);
         _loc4_.removeEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
         var _loc5_:Object = automationDelegate;
         if(Boolean(target) && action != DragManager.NONE)
         {
            _loc2_ = new DragEvent(DragEvent.DRAG_DROP);
            _loc2_.dragInitiator = dragInitiator;
            _loc2_.dragSource = dragSource;
            _loc2_.action = action;
            _loc2_.ctrlKey = param1.ctrlKey;
            _loc2_.altKey = param1.altKey;
            _loc2_.shiftKey = param1.shiftKey;
            (_loc6_ = new Point()).x = lastMouseEvent.localX;
            _loc6_.y = lastMouseEvent.localY;
            _loc6_ = DisplayObject(lastMouseEvent.target).localToGlobal(_loc6_);
            _loc6_ = DisplayObject(target).globalToLocal(_loc6_);
            _loc2_.localX = _loc6_.x;
            _loc2_.localY = _loc6_.y;
            if(_loc5_)
            {
               _loc5_.recordAutomatableDragDrop(target,_loc2_);
            }
            _dispatchDragEvent(target,_loc2_);
         }
         else
         {
            action = DragManager.NONE;
         }
         if(action == DragManager.NONE)
         {
            (_loc7_ = new Move(this)).addEventListener(EffectEvent.EFFECT_END,effectEndHandler);
            _loc7_.xFrom = x;
            _loc7_.yFrom = y;
            _loc7_.xTo = startX;
            _loc7_.yTo = startY;
            _loc7_.duration = 200;
            _loc7_.play();
         }
         else
         {
            _loc8_ = new Zoom(this);
            _loc8_.zoomWidthFrom = _loc8_.zoomHeightFrom = 1;
            _loc8_.zoomWidthTo = _loc8_.zoomHeightTo = 0;
            _loc8_.duration = 200;
            _loc8_.play();
            (_loc9_ = new Move(this)).addEventListener(EffectEvent.EFFECT_END,effectEndHandler);
            _loc9_.xFrom = x;
            _loc9_.yFrom = this.y;
            _loc9_.xTo = parent.mouseX;
            _loc9_.yTo = parent.mouseY;
            _loc9_.duration = 200;
            _loc9_.play();
         }
         _loc2_ = new DragEvent(DragEvent.DRAG_COMPLETE);
         _loc2_.dragInitiator = dragInitiator;
         _loc2_.dragSource = dragSource;
         _loc2_.relatedObject = InteractiveObject(target);
         _loc2_.action = action;
         _loc2_.ctrlKey = param1.ctrlKey;
         _loc2_.altKey = param1.altKey;
         _loc2_.shiftKey = param1.shiftKey;
         dragInitiator.dispatchEvent(_loc2_);
         if(Boolean(_loc5_) && action == DragManager.NONE)
         {
            _loc5_.recordAutomatableDragCancel(dragInitiator,_loc2_);
         }
         cursorManager.removeCursor(cursorID);
         cursorID = CursorManager.NO_CURSOR;
         this.lastMouseEvent = null;
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
      
      public function showFeedback() : void
      {
         var _loc1_:Class = cursorClass;
         var _loc2_:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DragManager");
         if(action == DragManager.COPY)
         {
            _loc1_ = _loc2_.getStyle("copyCursor");
         }
         else if(action == DragManager.LINK)
         {
            _loc1_ = _loc2_.getStyle("linkCursor");
         }
         else if(action == DragManager.NONE)
         {
            _loc1_ = _loc2_.getStyle("rejectCursor");
         }
         else
         {
            _loc1_ = _loc2_.getStyle("moveCursor");
         }
         if(_loc1_ != cursorClass)
         {
            cursorClass = _loc1_;
            if(cursorID != CursorManager.NO_CURSOR)
            {
               cursorManager.removeCursor(cursorID);
            }
            cursorID = cursorManager.setCursor(cursorClass,2,0,0);
         }
      }
      
      override public function initialize() : void
      {
         super.initialize();
         dragInitiator.systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,mouseLeaveHandler);
         if(!getFocus())
         {
            setFocus();
         }
      }
      
      public function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:int = 0;
         var _loc10_:* = null;
         var _loc14_:Boolean = false;
         var _loc15_:DisplayObject = null;
         lastMouseEvent = param1;
         var _loc5_:Point = new Point();
         var _loc6_:Point = new Point(param1.localX,param1.localY);
         var _loc7_:Point = DisplayObject(param1.target).localToGlobal(_loc6_);
         var _loc8_:Number = (_loc6_ = DisplayObject(sandboxRoot).globalToLocal(_loc7_)).x;
         var _loc9_:Number = _loc6_.y;
         x = _loc8_ - xOffset;
         y = _loc9_ - yOffset;
         if(!param1)
         {
            return;
         }
         var _loc11_:IEventDispatcher = systemManager.getTopLevelRoot();
         _loc10_ = [];
         DragProxy.getObjectsUnderPoint(DisplayObject(sandboxRoot),_loc7_,_loc10_);
         var _loc12_:DisplayObject = null;
         var _loc13_:int = int(_loc10_.length - 1);
         while(_loc13_ >= 0)
         {
            if((_loc12_ = _loc10_[_loc13_]) != this && !contains(_loc12_))
            {
               break;
            }
            _loc13_--;
         }
         if(target)
         {
            _loc14_ = false;
            _loc15_ = target;
            _loc3_ = _loc12_;
            while(_loc3_)
            {
               if(_loc3_ == target)
               {
                  dispatchDragEvent(DragEvent.DRAG_OVER,param1,_loc3_);
                  _loc14_ = true;
                  break;
               }
               dispatchDragEvent(DragEvent.DRAG_ENTER,param1,_loc3_);
               if(target == _loc3_)
               {
                  _loc14_ = false;
                  break;
               }
               _loc3_ = _loc3_.parent;
            }
            if(!_loc14_)
            {
               dispatchDragEvent(DragEvent.DRAG_EXIT,param1,_loc15_);
               if(target == _loc15_)
               {
                  target = null;
               }
            }
         }
         if(!target)
         {
            action = DragManager.MOVE;
            _loc3_ = _loc12_;
            while(_loc3_)
            {
               if(_loc3_ != this)
               {
                  dispatchDragEvent(DragEvent.DRAG_ENTER,param1,_loc3_);
                  if(target)
                  {
                     break;
                  }
               }
               _loc3_ = _loc3_.parent;
            }
            if(!target)
            {
               action = DragManager.NONE;
            }
         }
         showFeedback();
      }
      
      private function dispatchDragEvent(param1:String, param2:MouseEvent, param3:Object) : void
      {
         var _loc4_:DragEvent = new DragEvent(param1);
         var _loc5_:Point = new Point();
         _loc4_.dragInitiator = dragInitiator;
         _loc4_.dragSource = dragSource;
         _loc4_.action = action;
         _loc4_.ctrlKey = param2.ctrlKey;
         _loc4_.altKey = param2.altKey;
         _loc4_.shiftKey = param2.shiftKey;
         _loc5_.x = lastMouseEvent.localX;
         _loc5_.y = lastMouseEvent.localY;
         _loc5_ = DisplayObject(lastMouseEvent.target).localToGlobal(_loc5_);
         _loc5_ = DisplayObject(param3).globalToLocal(_loc5_);
         _loc4_.localX = _loc5_.x;
         _loc4_.localY = _loc5_.y;
         _dispatchDragEvent(DisplayObject(param3),_loc4_);
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         checkKeyEvent(param1);
      }
      
      private function effectEndHandler(param1:EffectEvent) : void
      {
         DragManager.mx_internal::endDrag();
      }
      
      public function checkKeyEvent(param1:KeyboardEvent) : void
      {
         var _loc2_:DragEvent = null;
         var _loc3_:Point = null;
         if(target)
         {
            if(lastKeyEvent && param1.type == lastKeyEvent.type && param1.keyCode == lastKeyEvent.keyCode)
            {
               return;
            }
            lastKeyEvent = param1;
            _loc2_ = new DragEvent(DragEvent.DRAG_OVER);
            _loc2_.dragInitiator = dragInitiator;
            _loc2_.dragSource = dragSource;
            _loc2_.action = action;
            _loc2_.ctrlKey = param1.ctrlKey;
            _loc2_.altKey = param1.altKey;
            _loc2_.shiftKey = param1.shiftKey;
            _loc3_ = new Point();
            _loc3_.x = lastMouseEvent.localX;
            _loc3_.y = lastMouseEvent.localY;
            _loc3_ = DisplayObject(lastMouseEvent.target).localToGlobal(_loc3_);
            _loc3_ = DisplayObject(target).globalToLocal(_loc3_);
            _loc2_.localX = _loc3_.x;
            _loc2_.localY = _loc3_.y;
            _dispatchDragEvent(target,_loc2_);
            showFeedback();
         }
      }
      
      public function mouseLeaveHandler(param1:Event) : void
      {
         mouseUpHandler(lastMouseEvent);
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
            _loc3_.name = "mx.managers::IDragManager";
            sandboxRoot.dispatchEvent(_loc3_);
            _loc4_ = new InterDragManagerEvent(InterDragManagerEvent.DISPATCH_DRAG_EVENT,false,false,param2.localX,param2.localY,param2.relatedObject,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta,param1,param2.type,param2.dragInitiator,param2.dragSource,param2.action,param2.draggedItem);
            sandboxRoot.dispatchEvent(_loc4_);
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         checkKeyEvent(param1);
      }
      
      public function stage_mouseMoveHandler(param1:MouseEvent) : void
      {
         if(param1.target != stage)
         {
            return;
         }
         mouseMoveHandler(param1);
      }
   }
}
