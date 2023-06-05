package mx.managers
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.automation.IAutomationObject;
   import mx.core.ApplicationGlobals;
   import mx.core.FlexSprite;
   import mx.core.IChildList;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModule;
   import mx.core.IInvalidating;
   import mx.core.ISWFLoader;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.effects.Blur;
   import mx.effects.Fade;
   import mx.effects.IEffect;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.FlexMouseEvent;
   import mx.events.InterManagerRequest;
   import mx.events.MoveEvent;
   import mx.events.SWFBridgeRequest;
   import mx.events.SandboxMouseEvent;
   import mx.styles.IStyleClient;
   import mx.utils.NameUtil;
   
   public class PopUpManagerImpl implements mx.managers.IPopUpManager
   {
      
      private static var instance:mx.managers.IPopUpManager;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var popupInfo:Array;
      
      mx_internal var modalWindowClass:Class;
      
      public function PopUpManagerImpl()
      {
         super();
         var _loc1_:ISystemManager = ISystemManager(SystemManagerGlobals.topLevelSystemManagers[0]);
         _loc1_.addEventListener(SWFBridgeRequest.CREATE_MODAL_WINDOW_REQUEST,createModalWindowRequestHandler,false,0,true);
         _loc1_.addEventListener(SWFBridgeRequest.SHOW_MODAL_WINDOW_REQUEST,showModalWindowRequest,false,0,true);
         _loc1_.addEventListener(SWFBridgeRequest.HIDE_MODAL_WINDOW_REQUEST,hideModalWindowRequest,false,0,true);
      }
      
      private static function nonmodalMouseWheelOutsideHandler(param1:DisplayObject, param2:MouseEvent) : void
      {
         if(!param1.hitTestPoint(param2.stageX,param2.stageY,true))
         {
            if(param1 is IUIComponent)
            {
               if(IUIComponent(param1).owns(DisplayObject(param2.target)))
               {
                  return;
               }
            }
            dispatchMouseWheelOutsideEvent(param1,param2);
         }
      }
      
      private static function dispatchMouseWheelOutsideEvent(param1:DisplayObject, param2:MouseEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc3_:MouseEvent = new FlexMouseEvent(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE);
         var _loc4_:Point = param1.globalToLocal(new Point(param2.stageX,param2.stageY));
         _loc3_.localX = _loc4_.x;
         _loc3_.localY = _loc4_.y;
         _loc3_.buttonDown = param2.buttonDown;
         _loc3_.shiftKey = param2.shiftKey;
         _loc3_.altKey = param2.altKey;
         _loc3_.ctrlKey = param2.ctrlKey;
         _loc3_.delta = param2.delta;
         _loc3_.relatedObject = InteractiveObject(param2.target);
         param1.dispatchEvent(_loc3_);
      }
      
      mx_internal static function updateModalMask(param1:ISystemManager, param2:DisplayObject, param3:IUIComponent, param4:Rectangle, param5:Sprite) : void
      {
         var _loc7_:Rectangle = null;
         var _loc8_:Point = null;
         var _loc9_:Rectangle = null;
         var _loc6_:Rectangle = param2.getBounds(DisplayObject(param1));
         if(param3 is ISWFLoader)
         {
            _loc7_ = ISWFLoader(param3).getVisibleApplicationRect();
            _loc8_ = new Point(_loc7_.x,_loc7_.y);
            _loc8_ = DisplayObject(param1).globalToLocal(_loc8_);
            _loc7_.x = _loc8_.x;
            _loc7_.y = _loc8_.y;
         }
         else if(!param3)
         {
            _loc7_ = _loc6_.clone();
         }
         else
         {
            _loc7_ = DisplayObject(param3).getBounds(DisplayObject(param1));
         }
         if(param4)
         {
            _loc8_ = new Point(param4.x,param4.y);
            _loc8_ = DisplayObject(param1).globalToLocal(_loc8_);
            _loc9_ = new Rectangle(_loc8_.x,_loc8_.y,param4.width,param4.height);
            _loc7_ = _loc7_.intersection(_loc9_);
         }
         param5.graphics.clear();
         param5.graphics.beginFill(0);
         if(_loc7_.y > _loc6_.y)
         {
            param5.graphics.drawRect(_loc6_.x,_loc6_.y,_loc6_.width,_loc7_.y - _loc6_.y);
         }
         if(_loc6_.x < _loc7_.x)
         {
            param5.graphics.drawRect(_loc6_.x,_loc7_.y,_loc7_.x - _loc6_.x,_loc7_.height);
         }
         if(_loc6_.x + _loc6_.width > _loc7_.x + _loc7_.width)
         {
            param5.graphics.drawRect(_loc7_.x + _loc7_.width,_loc7_.y,_loc6_.x + _loc6_.width - _loc7_.x - _loc7_.width,_loc7_.height);
         }
         if(_loc7_.y + _loc7_.height < _loc6_.y + _loc6_.height)
         {
            param5.graphics.drawRect(_loc6_.x,_loc7_.y + _loc7_.height,_loc6_.width,_loc6_.y + _loc6_.height - _loc7_.y - _loc7_.height);
         }
         param5.graphics.endFill();
      }
      
      private static function dispatchMouseDownOutsideEvent(param1:DisplayObject, param2:MouseEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc3_:MouseEvent = new FlexMouseEvent(FlexMouseEvent.MOUSE_DOWN_OUTSIDE);
         var _loc4_:Point = param1.globalToLocal(new Point(param2.stageX,param2.stageY));
         _loc3_.localX = _loc4_.x;
         _loc3_.localY = _loc4_.y;
         _loc3_.buttonDown = param2.buttonDown;
         _loc3_.shiftKey = param2.shiftKey;
         _loc3_.altKey = param2.altKey;
         _loc3_.ctrlKey = param2.ctrlKey;
         _loc3_.delta = param2.delta;
         _loc3_.relatedObject = InteractiveObject(param2.target);
         param1.dispatchEvent(_loc3_);
      }
      
      public static function getInstance() : mx.managers.IPopUpManager
      {
         if(!instance)
         {
            instance = new PopUpManagerImpl();
         }
         return instance;
      }
      
      private static function nonmodalMouseDownOutsideHandler(param1:DisplayObject, param2:MouseEvent) : void
      {
         if(!param1.hitTestPoint(param2.stageX,param2.stageY,true))
         {
            if(param1 is IUIComponent)
            {
               if(IUIComponent(param1).owns(DisplayObject(param2.target)))
               {
                  return;
               }
            }
            dispatchMouseDownOutsideEvent(param1,param2);
         }
      }
      
      private function showModalWindow(param1:PopUpData, param2:ISystemManager, param3:Boolean = true) : void
      {
         var _loc4_:IStyleClient = param1.owner as IStyleClient;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(!isNaN(param1.modalTransparencyDuration))
         {
            _loc5_ = param1.modalTransparencyDuration;
         }
         else if(_loc4_)
         {
            _loc5_ = Number(_loc4_.getStyle("modalTransparencyDuration"));
            param1.modalTransparencyDuration = _loc5_;
         }
         if(!isNaN(param1.modalTransparency))
         {
            _loc6_ = param1.modalTransparency;
         }
         else if(_loc4_)
         {
            _loc6_ = Number(_loc4_.getStyle("modalTransparency"));
            param1.modalTransparency = _loc6_;
         }
         param1.modalWindow.alpha = _loc6_;
         var _loc7_:Number = 0;
         if(!isNaN(param1.modalTransparencyBlur))
         {
            _loc7_ = param1.modalTransparencyBlur;
         }
         else if(_loc4_)
         {
            _loc7_ = Number(_loc4_.getStyle("modalTransparencyBlur"));
            param1.modalTransparencyBlur = _loc7_;
         }
         var _loc8_:Number = 16777215;
         if(!isNaN(param1.modalTransparencyColor))
         {
            _loc8_ = param1.modalTransparencyColor;
         }
         else if(_loc4_)
         {
            _loc8_ = Number(_loc4_.getStyle("modalTransparencyColor"));
            param1.modalTransparencyColor = _loc8_;
         }
         if(param2 is SystemManagerProxy)
         {
            param2 = SystemManagerProxy(param2).systemManager;
         }
         var _loc9_:DisplayObject = param2.getSandboxRoot();
         showModalWindowInternal(param1,_loc5_,_loc6_,_loc8_,_loc7_,param2,_loc9_);
         if(param3 && Boolean(param2.useSWFBridge()))
         {
            dispatchModalWindowRequest(SWFBridgeRequest.SHOW_MODAL_WINDOW_REQUEST,param2,_loc9_,param1,true);
         }
      }
      
      private function popupShowHandler(param1:FlexEvent) : void
      {
         var _loc2_:PopUpData = findPopupInfoByOwner(param1.target);
         if(_loc2_)
         {
            showModalWindow(_loc2_,getTopLevelSystemManager(_loc2_.parent));
         }
      }
      
      public function bringToFront(param1:IFlexDisplayObject) : void
      {
         var _loc2_:PopUpData = null;
         var _loc3_:ISystemManager = null;
         var _loc4_:InterManagerRequest = null;
         if(Boolean(param1) && Boolean(param1.parent))
         {
            _loc2_ = findPopupInfoByOwner(param1);
            if(_loc2_)
            {
               _loc3_ = ISystemManager(param1.parent);
               if(_loc3_ is SystemManagerProxy)
               {
                  _loc4_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"bringToFront",{
                     "topMost":_loc2_.topMost,
                     "popUp":_loc3_
                  });
                  _loc3_.getSandboxRoot().dispatchEvent(_loc4_);
               }
               else if(_loc2_.topMost)
               {
                  _loc3_.popUpChildren.setChildIndex(DisplayObject(param1),_loc3_.popUpChildren.numChildren - 1);
               }
               else
               {
                  _loc3_.setChildIndex(DisplayObject(param1),_loc3_.numChildren - 1);
               }
            }
         }
      }
      
      public function centerPopUp(param1:IFlexDisplayObject) : void
      {
         var _loc4_:ISystemManager = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Rectangle = null;
         var _loc12_:Rectangle = null;
         var _loc13_:Point = null;
         var _loc14_:Point = null;
         var _loc15_:Boolean = false;
         var _loc16_:DisplayObject = null;
         var _loc17_:InterManagerRequest = null;
         var _loc18_:Point = null;
         if(param1 is IInvalidating)
         {
            IInvalidating(param1).validateNow();
         }
         var _loc2_:PopUpData = findPopupInfoByOwner(param1);
         var _loc3_:DisplayObject = _loc2_ && _loc2_.parent && Boolean(_loc2_.parent.stage) ? _loc2_.parent : param1.parent;
         if(_loc3_)
         {
            _loc4_ = _loc2_.systemManager;
            _loc13_ = new Point();
            _loc16_ = _loc4_.getSandboxRoot();
            if(_loc4_ != _loc16_)
            {
               _loc17_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"isTopLevelRoot");
               _loc16_.dispatchEvent(_loc17_);
               _loc15_ = Boolean(_loc17_.value);
            }
            else
            {
               _loc15_ = Boolean(_loc4_.isTopLevelRoot());
            }
            if(_loc15_)
            {
               _loc7_ = (_loc11_ = _loc4_.screen).width;
               _loc8_ = _loc11_.height;
            }
            else
            {
               if(_loc4_ != _loc16_)
               {
                  _loc17_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"getVisibleApplicationRect");
                  _loc16_.dispatchEvent(_loc17_);
                  _loc12_ = Rectangle(_loc17_.value);
               }
               else
               {
                  _loc12_ = _loc4_.getVisibleApplicationRect();
               }
               _loc13_ = new Point(_loc12_.x,_loc12_.y);
               _loc13_ = DisplayObject(_loc4_).globalToLocal(_loc13_);
               _loc7_ = _loc12_.width;
               _loc8_ = _loc12_.height;
            }
            if(_loc3_ is UIComponent)
            {
               _loc12_ = UIComponent(_loc3_).getVisibleRect();
               _loc18_ = _loc3_.globalToLocal(_loc12_.topLeft);
               _loc13_.x += _loc18_.x;
               _loc13_.y += _loc18_.y;
               _loc9_ = _loc12_.width;
               _loc10_ = _loc12_.height;
            }
            else
            {
               _loc9_ = _loc3_.width;
               _loc10_ = _loc3_.height;
            }
            _loc5_ = Math.max(0,(Math.min(_loc7_,_loc9_) - param1.width) / 2);
            _loc6_ = Math.max(0,(Math.min(_loc8_,_loc10_) - param1.height) / 2);
            _loc14_ = new Point(_loc13_.x,_loc13_.y);
            _loc14_ = _loc3_.localToGlobal(_loc14_);
            _loc14_ = param1.parent.globalToLocal(_loc14_);
            param1.move(Math.round(_loc5_) + _loc14_.x,Math.round(_loc6_) + _loc14_.y);
         }
      }
      
      private function showModalWindowRequest(param1:Event) : void
      {
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         if(param1 is SWFBridgeRequest)
         {
            _loc2_ = SWFBridgeRequest(param1);
         }
         else
         {
            _loc2_ = SWFBridgeRequest.marshal(param1);
         }
         var _loc3_:ISystemManager = getTopLevelSystemManager(DisplayObject(ApplicationGlobals.application));
         var _loc4_:DisplayObject = _loc3_.getSandboxRoot();
         var _loc5_:PopUpData;
         (_loc5_ = findHighestRemoteModalPopupInfo()).excludeRect = Rectangle(_loc2_.data);
         _loc5_.modalTransparency = _loc2_.data.transparency;
         _loc5_.modalTransparencyBlur = 0;
         _loc5_.modalTransparencyColor = _loc2_.data.transparencyColor;
         _loc5_.modalTransparencyDuration = _loc2_.data.transparencyDuration;
         if(Boolean(_loc5_.owner) || Boolean(_loc5_.parent))
         {
            throw new Error();
         }
         showModalWindow(_loc5_,_loc3_);
      }
      
      private function hideOwnerHandler(param1:FlexEvent) : void
      {
         var _loc2_:PopUpData = findPopupInfoByOwner(param1.target);
         if(_loc2_)
         {
            removeMouseOutEventListeners(_loc2_);
         }
      }
      
      private function fadeOutDestroyEffectEndHandler(param1:EffectEvent) : void
      {
         var _loc4_:ISystemManager = null;
         effectEndHandler(param1);
         var _loc2_:DisplayObject = DisplayObject(param1.effectInstance.target);
         var _loc3_:DisplayObject = _loc2_.mask;
         if(_loc3_)
         {
            _loc2_.mask = null;
            _loc4_.popUpChildren.removeChild(_loc3_);
         }
         if(_loc2_.parent is ISystemManager)
         {
            if((_loc4_ = ISystemManager(_loc2_.parent)).popUpChildren.contains(_loc2_))
            {
               _loc4_.popUpChildren.removeChild(_loc2_);
            }
            else
            {
               _loc4_.removeChild(_loc2_);
            }
         }
         else if(_loc2_.parent)
         {
            _loc2_.parent.removeChild(_loc2_);
         }
      }
      
      private function createModalWindowRequestHandler(param1:Event) : void
      {
         var _loc2_:SWFBridgeRequest = null;
         if(param1 is SWFBridgeRequest)
         {
            _loc2_ = SWFBridgeRequest(param1);
         }
         else
         {
            _loc2_ = SWFBridgeRequest.marshal(param1);
         }
         var _loc3_:ISystemManager = getTopLevelSystemManager(DisplayObject(ApplicationGlobals.application));
         var _loc4_:DisplayObject = _loc3_.getSandboxRoot();
         var _loc5_:PopUpData;
         (_loc5_ = new PopUpData()).isRemoteModalWindow = true;
         _loc5_.systemManager = _loc3_;
         _loc5_.modalTransparency = _loc2_.data.transparency;
         _loc5_.modalTransparencyBlur = 0;
         _loc5_.modalTransparencyColor = _loc2_.data.transparencyColor;
         _loc5_.modalTransparencyDuration = _loc2_.data.transparencyDuration;
         _loc5_.exclude = _loc3_.swfBridgeGroup.getChildBridgeProvider(_loc2_.requestor) as IUIComponent;
         _loc5_.useExclude = _loc2_.data.useExclude;
         _loc5_.excludeRect = Rectangle(_loc2_.data.excludeRect);
         if(!popupInfo)
         {
            popupInfo = [];
         }
         popupInfo.push(_loc5_);
         createModalWindow(null,_loc5_,_loc3_.popUpChildren,_loc2_.data.show,_loc3_,_loc4_);
      }
      
      private function showOwnerHandler(param1:FlexEvent) : void
      {
         var _loc2_:PopUpData = findPopupInfoByOwner(param1.target);
         if(_loc2_)
         {
            addMouseOutEventListeners(_loc2_);
         }
      }
      
      private function addMouseOutEventListeners(param1:PopUpData) : void
      {
         var _loc2_:DisplayObject = param1.systemManager.getSandboxRoot();
         if(param1.modalWindow)
         {
            param1.modalWindow.addEventListener(MouseEvent.MOUSE_DOWN,param1.mouseDownOutsideHandler);
            param1.modalWindow.addEventListener(MouseEvent.MOUSE_WHEEL,param1.mouseWheelOutsideHandler,true);
         }
         else
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,param1.mouseDownOutsideHandler);
            _loc2_.addEventListener(MouseEvent.MOUSE_WHEEL,param1.mouseWheelOutsideHandler,true);
         }
         _loc2_.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,param1.marshalMouseOutsideHandler);
         _loc2_.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,param1.marshalMouseOutsideHandler,true);
      }
      
      private function fadeInEffectEndHandler(param1:EffectEvent) : void
      {
         var _loc4_:PopUpData = null;
         effectEndHandler(param1);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(Boolean((_loc4_ = popupInfo[_loc3_]).owner) && _loc4_.modalWindow == param1.effectInstance.target)
            {
               IUIComponent(_loc4_.owner).setVisible(true,true);
               break;
            }
            _loc3_++;
         }
      }
      
      private function hideModalWindowRequest(param1:Event) : void
      {
         var _loc2_:SWFBridgeRequest = null;
         if(param1 is SWFBridgeRequest)
         {
            _loc2_ = SWFBridgeRequest(param1);
         }
         else
         {
            _loc2_ = SWFBridgeRequest.marshal(param1);
         }
         var _loc3_:ISystemManager = getTopLevelSystemManager(DisplayObject(ApplicationGlobals.application));
         var _loc4_:DisplayObject = _loc3_.getSandboxRoot();
         var _loc5_:PopUpData;
         if(!(_loc5_ = findHighestRemoteModalPopupInfo()) || _loc5_.owner || Boolean(_loc5_.parent))
         {
            throw new Error();
         }
         hideModalWindow(_loc5_,_loc2_.data.remove);
         if(_loc2_.data.remove)
         {
            popupInfo.splice(popupInfo.indexOf(_loc5_),1);
            --_loc3_.numModalWindows;
         }
      }
      
      private function getTopLevelSystemManager(param1:DisplayObject) : ISystemManager
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:ISystemManager = null;
         if(param1.parent is SystemManagerProxy)
         {
            _loc2_ = DisplayObjectContainer(SystemManagerProxy(param1.parent).systemManager);
         }
         else if(param1 is IUIComponent && IUIComponent(param1).systemManager is SystemManagerProxy)
         {
            _loc2_ = DisplayObjectContainer(SystemManagerProxy(IUIComponent(param1).systemManager).systemManager);
         }
         else
         {
            _loc2_ = DisplayObjectContainer(param1.root);
         }
         if((!_loc2_ || _loc2_ is Stage) && param1 is IUIComponent)
         {
            _loc2_ = DisplayObjectContainer(IUIComponent(param1).systemManager);
         }
         if(_loc2_ is ISystemManager)
         {
            _loc3_ = ISystemManager(_loc2_);
            if(!_loc3_.isTopLevel())
            {
               _loc3_ = _loc3_.topLevelSystemManager;
            }
         }
         return _loc3_;
      }
      
      private function hideModalWindow(param1:PopUpData, param2:Boolean = false) : void
      {
         var _loc6_:Fade = null;
         var _loc7_:Number = NaN;
         var _loc8_:Blur = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:SWFBridgeRequest = null;
         var _loc11_:IEventDispatcher = null;
         var _loc12_:* = null;
         var _loc13_:InterManagerRequest = null;
         if(param2 && Boolean(param1.exclude))
         {
            param1.exclude.removeEventListener(Event.RESIZE,param1.resizeHandler);
            param1.exclude.removeEventListener(MoveEvent.MOVE,param1.resizeHandler);
         }
         var _loc3_:IStyleClient = param1.owner as IStyleClient;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.getStyle("modalTransparencyDuration"));
         }
         endEffects(param1);
         if(_loc4_)
         {
            (_loc6_ = new Fade(param1.modalWindow)).alphaFrom = param1.modalWindow.alpha;
            _loc6_.alphaTo = 0;
            _loc6_.duration = _loc4_;
            _loc6_.addEventListener(EffectEvent.EFFECT_END,param2 ? fadeOutDestroyEffectEndHandler : fadeOutCloseEffectEndHandler);
            param1.modalWindow.visible = true;
            param1.fade = _loc6_;
            _loc6_.play();
            if(_loc7_ = Number(_loc3_.getStyle("modalTransparencyBlur")))
            {
               _loc8_ = new Blur(param1.blurTarget);
               _loc8_.blurXFrom = _loc8_.blurYFrom = _loc7_;
               _loc8_.blurXTo = _loc8_.blurYTo = 0;
               _loc8_.duration = _loc4_;
               _loc8_.addEventListener(EffectEvent.EFFECT_END,effectEndHandler);
               param1.blur = _loc8_;
               _loc8_.play();
            }
         }
         else
         {
            param1.modalWindow.visible = false;
         }
         var _loc5_:ISystemManager;
         if((_loc5_ = ISystemManager(ApplicationGlobals.application.systemManager)).useSWFBridge())
         {
            _loc9_ = _loc5_.getSandboxRoot();
            if(!param1.isRemoteModalWindow && _loc5_ != _loc9_)
            {
               _loc13_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"isTopLevelRoot");
               _loc9_.dispatchEvent(_loc13_);
               if(Boolean(_loc13_.value))
               {
                  return;
               }
            }
            _loc10_ = new SWFBridgeRequest(SWFBridgeRequest.HIDE_MODAL_WINDOW_REQUEST,false,false,null,{
               "skip":!param1.isRemoteModalWindow && _loc5_ != _loc9_,
               "show":false,
               "remove":param2
            });
            _loc11_ = _loc5_.swfBridgeGroup.parentBridge;
            _loc10_.requestor = _loc11_;
            _loc11_.dispatchEvent(_loc10_);
         }
      }
      
      private function popupHideHandler(param1:FlexEvent) : void
      {
         var _loc2_:PopUpData = findPopupInfoByOwner(param1.target);
         if(_loc2_)
         {
            hideModalWindow(_loc2_);
         }
      }
      
      private function showModalWindowInternal(param1:PopUpData, param2:Number, param3:Number, param4:Number, param5:Number, param6:ISystemManager, param7:DisplayObject) : void
      {
         var _loc8_:Fade = null;
         var _loc9_:Number = NaN;
         var _loc10_:Blur = null;
         var _loc11_:* = null;
         var _loc12_:InterManagerRequest = null;
         endEffects(param1);
         if(param2)
         {
            (_loc8_ = new Fade(param1.modalWindow)).alphaFrom = 0;
            _loc8_.alphaTo = param3;
            _loc8_.duration = param2;
            _loc8_.addEventListener(EffectEvent.EFFECT_END,fadeInEffectEndHandler);
            param1.modalWindow.alpha = 0;
            param1.modalWindow.visible = true;
            param1.fade = _loc8_;
            if(param1.owner)
            {
               IUIComponent(param1.owner).setVisible(false,true);
            }
            _loc8_.play();
            if(_loc9_ = param5)
            {
               if(DisplayObject(param6).parent is Stage)
               {
                  param1.blurTarget = param6.document;
               }
               else if(param6 != param7)
               {
                  _loc12_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"application",_loc11_);
                  param7.dispatchEvent(_loc12_);
                  param1.blurTarget = _loc12_.value;
               }
               else
               {
                  param1.blurTarget = ApplicationGlobals.application;
               }
               _loc10_ = new Blur(param1.blurTarget);
               _loc10_.blurXFrom = _loc10_.blurYFrom = 0;
               _loc10_.blurXTo = _loc10_.blurYTo = _loc9_;
               _loc10_.duration = param2;
               _loc10_.addEventListener(EffectEvent.EFFECT_END,effectEndHandler);
               param1.blur = _loc10_;
               _loc10_.play();
            }
         }
         else
         {
            if(param1.owner)
            {
               IUIComponent(param1.owner).setVisible(true,true);
            }
            param1.modalWindow.visible = true;
         }
      }
      
      private function effectEndHandler(param1:EffectEvent) : void
      {
         var _loc4_:PopUpData = null;
         var _loc5_:IEffect = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = popupInfo[_loc3_];
            if((_loc5_ = param1.effectInstance.effect) == _loc4_.fade)
            {
               _loc4_.fade = null;
            }
            else if(_loc5_ == _loc4_.blur)
            {
               _loc4_.blur = null;
            }
            _loc3_++;
         }
      }
      
      private function createModalWindow(param1:DisplayObject, param2:PopUpData, param3:IChildList, param4:Boolean, param5:ISystemManager, param6:DisplayObject) : void
      {
         var _loc7_:IFlexDisplayObject = null;
         var _loc10_:Sprite = null;
         var _loc11_:SystemManagerProxy = null;
         var _loc12_:ISystemManager = null;
         var _loc8_:IStyleClient = (_loc7_ = IFlexDisplayObject(param2.owner)) as IStyleClient;
         var _loc9_:Number = 0;
         if(mx_internal::modalWindowClass)
         {
            _loc10_ = new mx_internal::modalWindowClass();
         }
         else
         {
            (_loc10_ = new FlexSprite()).name = "modalWindow";
         }
         if(!param5 && Boolean(param1))
         {
            param5 = IUIComponent(param1).systemManager;
         }
         if(param5 is SystemManagerProxy)
         {
            _loc12_ = (_loc11_ = SystemManagerProxy(param5)).systemManager;
         }
         else
         {
            _loc12_ = param5;
         }
         ++_loc12_.numModalWindows;
         if(_loc7_)
         {
            param3.addChildAt(_loc10_,param3.getChildIndex(DisplayObject(_loc7_)));
         }
         else
         {
            param3.addChild(_loc10_);
         }
         if(_loc7_ is IAutomationObject)
         {
            IAutomationObject(_loc7_).showInAutomationHierarchy = true;
         }
         if(!isNaN(param2.modalTransparency))
         {
            _loc10_.alpha = param2.modalTransparency;
         }
         else if(_loc8_)
         {
            _loc10_.alpha = _loc8_.getStyle("modalTransparency");
         }
         else
         {
            _loc10_.alpha = 0;
         }
         param2.modalTransparency = _loc10_.alpha;
         _loc10_.tabEnabled = false;
         var _loc13_:Rectangle = _loc12_.screen;
         var _loc14_:Graphics = _loc10_.graphics;
         var _loc15_:Number = 16777215;
         if(!isNaN(param2.modalTransparencyColor))
         {
            _loc15_ = param2.modalTransparencyColor;
         }
         else if(_loc8_)
         {
            _loc15_ = Number(_loc8_.getStyle("modalTransparencyColor"));
            param2.modalTransparencyColor = _loc15_;
         }
         _loc14_.clear();
         _loc14_.beginFill(_loc15_,100);
         _loc14_.drawRect(_loc13_.x,_loc13_.y,_loc13_.width,_loc13_.height);
         _loc14_.endFill();
         param2.modalWindow = _loc10_;
         if(param2.exclude)
         {
            param2.modalMask = new Sprite();
            mx_internal::updateModalMask(_loc12_,_loc10_,param2.useExclude ? param2.exclude : null,param2.excludeRect,param2.modalMask);
            _loc10_.mask = param2.modalMask;
            param3.addChild(param2.modalMask);
            param2.exclude.addEventListener(Event.RESIZE,param2.resizeHandler);
            param2.exclude.addEventListener(MoveEvent.MOVE,param2.resizeHandler);
         }
         param2._mouseDownOutsideHandler = dispatchMouseDownOutsideEvent;
         param2._mouseWheelOutsideHandler = dispatchMouseWheelOutsideEvent;
         _loc12_.addEventListener(Event.RESIZE,param2.resizeHandler);
         if(_loc7_)
         {
            _loc7_.addEventListener(FlexEvent.SHOW,popupShowHandler);
            _loc7_.addEventListener(FlexEvent.HIDE,popupHideHandler);
         }
         if(param4)
         {
            showModalWindow(param2,param5,false);
         }
         else
         {
            _loc7_.visible = param4;
         }
         if(_loc12_.useSWFBridge())
         {
            if(_loc8_)
            {
               param2.modalTransparencyDuration = _loc8_.getStyle("modalTransparencyDuration");
               param2.modalTransparencyBlur = _loc8_.getStyle("modalTransparencyBlur");
            }
            dispatchModalWindowRequest(SWFBridgeRequest.CREATE_MODAL_WINDOW_REQUEST,_loc12_,param6,param2,param4);
         }
      }
      
      private function findPopupInfoByOwner(param1:Object) : PopUpData
      {
         var _loc4_:PopUpData = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = popupInfo[_loc3_]).owner == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function popupRemovedHandler(param1:Event) : void
      {
         var _loc4_:PopUpData = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:ISystemManager = null;
         var _loc9_:ISystemManager = null;
         var _loc10_:IEventDispatcher = null;
         var _loc11_:SWFBridgeRequest = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc5_ = (_loc4_ = popupInfo[_loc3_]).owner) == param1.target)
            {
               _loc6_ = _loc4_.parent;
               _loc7_ = _loc4_.modalWindow;
               if((_loc8_ = _loc4_.systemManager) is SystemManagerProxy)
               {
                  _loc9_ = SystemManagerProxy(_loc8_).systemManager;
               }
               else
               {
                  _loc9_ = _loc8_;
               }
               if(!_loc8_.isTopLevel())
               {
                  _loc8_ = _loc8_.topLevelSystemManager;
               }
               if(_loc5_ is IUIComponent)
               {
                  IUIComponent(_loc5_).isPopUp = false;
               }
               if(_loc5_ is IFocusManagerContainer)
               {
                  _loc8_.removeFocusManager(IFocusManagerContainer(_loc5_));
               }
               _loc5_.removeEventListener(Event.REMOVED,popupRemovedHandler);
               if(_loc8_ is SystemManagerProxy)
               {
                  _loc10_ = _loc9_.swfBridgeGroup.parentBridge;
                  _loc11_ = new SWFBridgeRequest(SWFBridgeRequest.REMOVE_POP_UP_REQUEST,false,false,_loc10_,{
                     "window":DisplayObject(_loc8_),
                     "parent":_loc4_.parent,
                     "modal":_loc4_.modalWindow != null
                  });
                  _loc9_.getSandboxRoot().dispatchEvent(_loc11_);
               }
               else if(_loc8_.useSWFBridge())
               {
                  (_loc11_ = new SWFBridgeRequest(SWFBridgeRequest.REMOVE_POP_UP_PLACE_HOLDER_REQUEST,false,false,null,{"window":DisplayObject(_loc5_)})).requestor = _loc8_.swfBridgeGroup.parentBridge;
                  _loc11_.data.placeHolderId = NameUtil.displayObjectToString(DisplayObject(_loc5_));
                  _loc8_.dispatchEvent(_loc11_);
               }
               if(_loc4_.owner)
               {
                  _loc4_.owner.removeEventListener(FlexEvent.SHOW,showOwnerHandler);
                  _loc4_.owner.removeEventListener(FlexEvent.HIDE,hideOwnerHandler);
               }
               removeMouseOutEventListeners(_loc4_);
               if(_loc7_)
               {
                  _loc9_.removeEventListener(Event.RESIZE,_loc4_.resizeHandler);
                  _loc5_.removeEventListener(FlexEvent.SHOW,popupShowHandler);
                  _loc5_.removeEventListener(FlexEvent.HIDE,popupHideHandler);
                  hideModalWindow(_loc4_,true);
                  --_loc9_.numModalWindows;
               }
               popupInfo.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      private function fadeOutCloseEffectEndHandler(param1:EffectEvent) : void
      {
         effectEndHandler(param1);
         DisplayObject(param1.effectInstance.target).visible = false;
      }
      
      private function endEffects(param1:PopUpData) : void
      {
         if(param1.fade)
         {
            param1.fade.end();
            param1.fade = null;
         }
         if(param1.blur)
         {
            param1.blur.end();
            param1.blur = null;
         }
      }
      
      public function removePopUp(param1:IFlexDisplayObject) : void
      {
         var _loc2_:PopUpData = null;
         var _loc3_:ISystemManager = null;
         var _loc4_:IUIComponent = null;
         if(Boolean(param1) && Boolean(param1.parent))
         {
            _loc2_ = findPopupInfoByOwner(param1);
            if(_loc2_)
            {
               _loc3_ = _loc2_.systemManager;
               if(!_loc3_)
               {
                  if(!(_loc4_ = param1 as IUIComponent))
                  {
                     return;
                  }
                  _loc3_ = ISystemManager(_loc4_.systemManager);
               }
               if(_loc2_.topMost)
               {
                  _loc3_.popUpChildren.removeChild(DisplayObject(param1));
               }
               else
               {
                  _loc3_.removeChild(DisplayObject(param1));
               }
            }
         }
      }
      
      public function addPopUp(param1:IFlexDisplayObject, param2:DisplayObject, param3:Boolean = false, param4:String = null) : void
      {
         var _loc7_:IChildList = null;
         var _loc8_:* = false;
         var _loc5_:Boolean = Boolean(param1.visible);
         if(param2 is IUIComponent && param1 is IUIComponent && IUIComponent(param1).document == null)
         {
            IUIComponent(param1).document = IUIComponent(param2).document;
         }
         if(param2 is IUIComponent && IUIComponent(param2).document is IFlexModule && param1 is UIComponent && UIComponent(param1).moduleFactory == null)
         {
            UIComponent(param1).moduleFactory = IFlexModule(IUIComponent(param2).document).moduleFactory;
         }
         var _loc6_:ISystemManager;
         if(!(_loc6_ = getTopLevelSystemManager(param2)))
         {
            if((_loc6_ = ISystemManager(SystemManagerGlobals.topLevelSystemManagers[0])).getSandboxRoot() != param2)
            {
               return;
            }
         }
         var _loc9_:ISystemManager = _loc6_;
         var _loc10_:DisplayObject = _loc6_.getSandboxRoot();
         var _loc11_:SWFBridgeRequest = null;
         if(_loc6_.useSWFBridge())
         {
            if(_loc10_ != _loc6_)
            {
               _loc9_ = new SystemManagerProxy(_loc6_);
               _loc11_ = new SWFBridgeRequest(SWFBridgeRequest.ADD_POP_UP_REQUEST,false,false,_loc6_.swfBridgeGroup.parentBridge,{
                  "window":DisplayObject(_loc9_),
                  "parent":param2,
                  "modal":param3,
                  "childList":param4
               });
               _loc10_.dispatchEvent(_loc11_);
            }
            else
            {
               _loc9_ = _loc6_;
            }
         }
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).isPopUp = true;
         }
         if(!param4 || param4 == PopUpManagerChildList.PARENT)
         {
            _loc8_ = Boolean(_loc9_.popUpChildren.contains(param2));
         }
         else
         {
            _loc8_ = param4 == PopUpManagerChildList.POPUP;
         }
         (_loc7_ = _loc8_ ? _loc9_.popUpChildren : _loc9_).addChild(DisplayObject(param1));
         param1.visible = false;
         if(!popupInfo)
         {
            popupInfo = [];
         }
         var _loc12_:PopUpData;
         (_loc12_ = new PopUpData()).owner = DisplayObject(param1);
         _loc12_.topMost = _loc8_;
         _loc12_.systemManager = _loc9_;
         popupInfo.push(_loc12_);
         if(param1 is IFocusManagerContainer)
         {
            if(IFocusManagerContainer(param1).focusManager)
            {
               _loc9_.addFocusManager(IFocusManagerContainer(param1));
            }
            else
            {
               IFocusManagerContainer(param1).focusManager = new FocusManager(IFocusManagerContainer(param1),true);
            }
         }
         if(!_loc6_.isTopLevelRoot() && _loc10_ && _loc6_ == _loc10_)
         {
            (_loc11_ = new SWFBridgeRequest(SWFBridgeRequest.ADD_POP_UP_PLACE_HOLDER_REQUEST,false,false,null,{"window":DisplayObject(param1)})).requestor = _loc6_.swfBridgeGroup.parentBridge;
            _loc11_.data.placeHolderId = NameUtil.displayObjectToString(DisplayObject(param1));
            _loc6_.dispatchEvent(_loc11_);
         }
         if(param1 is IAutomationObject)
         {
            IAutomationObject(param1).showInAutomationHierarchy = true;
         }
         if(param1 is ILayoutManagerClient)
         {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(ILayoutManagerClient(param1),true);
         }
         _loc12_.parent = param2;
         if(param1 is IUIComponent)
         {
            IUIComponent(param1).setActualSize(IUIComponent(param1).getExplicitOrMeasuredWidth(),IUIComponent(param1).getExplicitOrMeasuredHeight());
         }
         if(param3)
         {
            createModalWindow(param2,_loc12_,_loc7_,_loc5_,_loc9_,_loc10_);
         }
         else
         {
            _loc12_._mouseDownOutsideHandler = nonmodalMouseDownOutsideHandler;
            _loc12_._mouseWheelOutsideHandler = nonmodalMouseWheelOutsideHandler;
            param1.visible = _loc5_;
         }
         _loc12_.owner.addEventListener(FlexEvent.SHOW,showOwnerHandler);
         _loc12_.owner.addEventListener(FlexEvent.HIDE,hideOwnerHandler);
         addMouseOutEventListeners(_loc12_);
         param1.addEventListener(Event.REMOVED,popupRemovedHandler);
         if(param1 is IFocusManagerContainer && _loc5_)
         {
            if(!(_loc9_ is SystemManagerProxy) && Boolean(_loc9_.useSWFBridge()))
            {
               SystemManager(_loc9_).mx_internal::dispatchActivatedWindowEvent(DisplayObject(param1));
            }
            else
            {
               _loc9_.activate(IFocusManagerContainer(param1));
            }
         }
      }
      
      private function dispatchModalWindowRequest(param1:String, param2:ISystemManager, param3:DisplayObject, param4:PopUpData, param5:Boolean) : void
      {
         var _loc8_:InterManagerRequest = null;
         if(!param4.isRemoteModalWindow && param2 != param3)
         {
            _loc8_ = new InterManagerRequest(InterManagerRequest.SYSTEM_MANAGER_REQUEST,false,false,"isTopLevelRoot");
            param3.dispatchEvent(_loc8_);
            if(Boolean(_loc8_.value))
            {
               return;
            }
         }
         var _loc6_:SWFBridgeRequest = new SWFBridgeRequest(param1,false,false,null,{
            "skip":!param4.isRemoteModalWindow && param2 != param3,
            "useExclude":param4.useExclude,
            "show":param5,
            "remove":false,
            "transparencyDuration":param4.modalTransparencyDuration,
            "transparency":param4.modalTransparency,
            "transparencyColor":param4.modalTransparencyColor,
            "transparencyBlur":param4.modalTransparencyBlur
         });
         var _loc7_:IEventDispatcher = param2.swfBridgeGroup.parentBridge;
         _loc6_.requestor = _loc7_;
         _loc7_.dispatchEvent(_loc6_);
      }
      
      public function createPopUp(param1:DisplayObject, param2:Class, param3:Boolean = false, param4:String = null) : IFlexDisplayObject
      {
         var _loc5_:IUIComponent = new param2();
         addPopUp(_loc5_,param1,param3,param4);
         return _loc5_;
      }
      
      private function removeMouseOutEventListeners(param1:PopUpData) : void
      {
         var _loc2_:DisplayObject = param1.systemManager.getSandboxRoot();
         if(param1.modalWindow)
         {
            param1.modalWindow.removeEventListener(MouseEvent.MOUSE_DOWN,param1.mouseDownOutsideHandler);
            param1.modalWindow.removeEventListener(MouseEvent.MOUSE_WHEEL,param1.mouseWheelOutsideHandler,true);
         }
         else
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,param1.mouseDownOutsideHandler);
            _loc2_.removeEventListener(MouseEvent.MOUSE_WHEEL,param1.mouseWheelOutsideHandler,true);
         }
         _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,param1.marshalMouseOutsideHandler);
         _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,param1.marshalMouseOutsideHandler,true);
      }
      
      private function findHighestRemoteModalPopupInfo() : PopUpData
      {
         var _loc3_:PopUpData = null;
         var _loc1_:int = -1;
         var _loc2_:int = _loc1_;
         while(_loc2_ >= 0)
         {
            _loc3_ = popupInfo[_loc2_];
            if(_loc3_.isRemoteModalWindow)
            {
               return _loc3_;
            }
            _loc2_--;
         }
         return null;
      }
   }
}

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import mx.core.IUIComponent;
import mx.core.mx_internal;
import mx.effects.Effect;
import mx.events.SandboxMouseEvent;
import mx.managers.ISystemManager;
import mx.managers.PopUpManagerImpl;

class PopUpData
{
    
   
   public var fade:Effect;
   
   public var modalTransparencyColor:Number;
   
   public var exclude:IUIComponent;
   
   public var isRemoteModalWindow:Boolean;
   
   public var useExclude:Boolean;
   
   public var blurTarget:Object;
   
   public var modalTransparencyDuration:Number;
   
   public var _mouseWheelOutsideHandler:Function;
   
   public var excludeRect:Rectangle;
   
   public var modalTransparency:Number;
   
   public var blur:Effect;
   
   public var parent:DisplayObject;
   
   public var modalTransparencyBlur:Number;
   
   public var _mouseDownOutsideHandler:Function;
   
   public var owner:DisplayObject;
   
   public var topMost:Boolean;
   
   public var modalMask:Sprite;
   
   public var modalWindow:DisplayObject;
   
   public var systemManager:ISystemManager;
   
   public function PopUpData()
   {
      super();
      useExclude = true;
   }
   
   public function marshalMouseOutsideHandler(param1:Event) : void
   {
      if(!(param1 is SandboxMouseEvent))
      {
         param1 = SandboxMouseEvent.marshal(param1);
      }
      if(owner)
      {
         owner.dispatchEvent(param1);
      }
   }
   
   public function mouseDownOutsideHandler(param1:MouseEvent) : void
   {
      _mouseDownOutsideHandler(owner,param1);
   }
   
   public function mouseWheelOutsideHandler(param1:MouseEvent) : void
   {
      _mouseWheelOutsideHandler(owner,param1);
   }
   
   public function resizeHandler(param1:Event) : void
   {
      var _loc2_:Rectangle = null;
      if(owner && owner.stage == DisplayObject(param1.target).stage || modalWindow && modalWindow.stage == DisplayObject(param1.target).stage)
      {
         _loc2_ = systemManager.screen;
         modalWindow.width = _loc2_.width;
         modalWindow.height = _loc2_.height;
         modalWindow.x = _loc2_.x;
         modalWindow.y = _loc2_.y;
         if(modalMask)
         {
            PopUpManagerImpl.mx_internal::updateModalMask(systemManager,modalWindow,exclude,excludeRect,modalMask);
         }
      }
   }
}
