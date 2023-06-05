package org.efflex.mx.viewStackEffects.effectClasses
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import mx.containers.ViewStack;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.effects.effectClasses.TweenEffectInstance;
   import mx.events.FlexEvent;
   import mx.managers.PopUpManager;
   import org.efflex.viewStackHelpers.IViewStackEffectHelper;
   
   public class ViewStackTweenEffectInstance extends TweenEffectInstance
   {
       
      
      private var _effectType:String;
      
      private var _prevBlendMode:String;
      
      public var modalTransparency:Number;
      
      protected var _indicesRequired:Array;
      
      public var modalTransparencyBlur:Number;
      
      public var modal:Boolean;
      
      private var _wasInterrupted:Boolean;
      
      public var modalTransparencyColor:Number;
      
      private var _contentPane:ViewStackInstanceContainer;
      
      public var popUp:Boolean;
      
      private var _helper:IViewStackEffectHelper;
      
      public var transparent:Boolean;
      
      public var modalTransparencyDuration:Number;
      
      private var _waitingForCreation:Boolean;
      
      private var _viewStack:ViewStack;
      
      public var hideTarget:Boolean;
      
      public function ViewStackTweenEffectInstance(param1:UIComponent)
      {
         super(param1);
         if(param1.parent is ViewStack)
         {
            _viewStack = ViewStack(param1.parent);
            return;
         }
         throw new Error("ViewStackInstance must have a target with a parent property that is a ViewStack or is a subclass of ViewStack");
      }
      
      final public function get bitmapDatum() : Array
      {
         return _contentPane.bitmapDatum;
      }
      
      protected function createBitmapDatum() : void
      {
         var _loc1_:BitmapData = null;
         var _loc4_:UIComponent = null;
         var _loc6_:Number = 0;
         var _loc2_:Number = viewStack.getStyle("backgroundColor");
         if(isNaN(_loc2_))
         {
            _loc2_ = 16777215;
         }
         var _loc3_:int = transparent ? 0 : int(_loc2_);
         var _loc5_:Number = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ = bitmapDatum[_indicesRequired[_loc6_]] as BitmapData;
            if(!_loc1_)
            {
               _loc4_ = UIComponent(viewStack.getChildAt(_indicesRequired[_loc6_]));
               _loc1_ = new BitmapData(_loc4_.width,_loc4_.height,transparent,_loc3_);
               _loc1_.draw(_loc4_);
               bitmapDatum[_indicesRequired[_loc6_]] = _loc1_;
            }
            _loc6_++;
         }
      }
      
      final protected function get contentY() : Number
      {
         return _helper.contentY;
      }
      
      protected function takeSnapShot() : void
      {
         var _loc1_:BitmapData = _contentPane.hideDisplay.bitmapData;
         var _loc2_:Number = viewStack.getStyle("backgroundColor");
         if(isNaN(_loc2_))
         {
            _loc2_ = 16777215;
         }
         var _loc3_:int = transparent ? 0 : int(_loc2_);
         var _loc4_:BitmapData = new BitmapData(contentWidth,contentHeight,transparent,_loc3_);
         if(wasInterrupted)
         {
            _loc4_.draw(_contentPane);
         }
         else
         {
            _loc4_.draw(viewStack,new Matrix(1,0,0,1,-(contentX + viewStack.borderMetrics.left),-(contentY + viewStack.borderMetrics.top)));
         }
         _contentPane.hideDisplay.bitmapData = _loc4_;
         if(_loc1_)
         {
            _loc1_.dispose();
         }
      }
      
      final protected function get contentHeight() : Number
      {
         return _helper.contentHeight;
      }
      
      override public function startEffect() : void
      {
         if(!_contentPane.containerResizeAndCreator.complete)
         {
            _waitingForCreation = true;
         }
         else
         {
            _waitingForCreation = false;
            super.startEffect();
         }
      }
      
      final protected function get wasInterrupted() : Boolean
      {
         return _contentPane.wasInterrupted;
      }
      
      override public function finishEffect() : void
      {
         super.finishEffect();
         if(_prevBlendMode)
         {
            applyEraseBlendMode(false);
         }
         if(_wasInterrupted)
         {
            return;
         }
         if(_effectType == FlexEvent.SHOW)
         {
            if(display)
            {
               if(_contentPane.contains(display))
               {
                  _contentPane.removeChild(display);
               }
            }
            if(_contentPane)
            {
               if(false)
               {
                  if(_contentPane.contains(_contentPane.hideDisplay))
                  {
                     _contentPane.removeChild(_contentPane.hideDisplay);
                  }
                  if(_contentPane.hideDisplay.bitmapData)
                  {
                     _contentPane.hideDisplay.bitmapData.dispose();
                  }
               }
               if(false)
               {
                  if(_contentPane.contains(_contentPane.mask))
                  {
                     _contentPane.removeChild(_contentPane.mask);
                  }
               }
               if(_viewStack.rawChildren.contains(_contentPane))
               {
                  _viewStack.rawChildren.removeChild(_contentPane);
               }
               if(false)
               {
                  if(_contentPane.popUp.contains(display))
                  {
                     _contentPane.popUp.removeChild(display);
                  }
                  if(_contentPane.popUp.contains(_contentPane.hideDisplay))
                  {
                     _contentPane.popUp.removeChild(_contentPane.hideDisplay);
                  }
                  if(_contentPane.popUp.mask)
                  {
                     _contentPane.popUp.removeChild(_contentPane.popUp.mask);
                  }
                  PopUpManager.removePopUp(_contentPane.popUp);
               }
            }
            removeChildren();
            destroyBitmapDatum();
            _contentPane.data = null;
            _contentPane.bitmapDatum = null;
            _contentPane.containerResizeAndCreator = null;
            _contentPane.display = null;
            _contentPane.hideDisplay = null;
            _contentPane.popUp = null;
            _contentPane = null;
         }
      }
      
      public function get hideDisplay() : Bitmap
      {
         return _contentPane.hideDisplay;
      }
      
      protected function removeChildren() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = _loc1_ - 1;
         while(_loc2_ > -1)
         {
            display.removeChild(DisplayObject(display.getChildAt(_loc2_)));
            _loc2_--;
         }
      }
      
      public function get data() : Object
      {
         return _contentPane.data;
      }
      
      protected function createContainers() : void
      {
         var _loc2_:Point = null;
         var _loc3_:Sprite = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc1_:Sprite = _viewStack.mx_internal::contentPane;
         _contentPane = new ViewStackInstanceContainer();
         _contentPane.name = "ViewStackInstance";
         _contentPane.bitmapDatum = new Array(_viewStack.numChildren);
         _contentPane.selectedIndexFrom = _viewStack.getChildIndex(DisplayObject(target));
         _contentPane.x = contentX + viewStack.borderMetrics.left;
         _contentPane.y = contentY + viewStack.borderMetrics.top;
         _contentPane.data = new Object();
         _contentPane.display = new Sprite();
         _contentPane.hideDisplay = new Bitmap();
         _contentPane.hideDisplay.visible = false;
         _contentPane.containerResizeAndCreator = new ContainerResizeAndCreator();
         _contentPane.containerResizeAndCreator.addEventListener(Event.COMPLETE,onContainerResizeAndCreatorComplete,false,0,true);
         if(popUp)
         {
            _contentPane.popUp = new UIComponent();
            _loc2_ = viewStack.parent.localToGlobal(new Point(viewStack.x + contentX,viewStack.y + contentY));
            _contentPane.popUp.x = _loc2_.x;
            _contentPane.popUp.y = _loc2_.y;
            _contentPane.popUp.setStyle("modalTransparency",modalTransparency);
            _contentPane.popUp.setStyle("modalTransparencyColor",modalTransparencyColor);
            _contentPane.popUp.setStyle("modalTransparencyBlur",modalTransparencyBlur);
            _contentPane.popUp.setStyle("modalTransparencyDuration",modalTransparencyDuration);
            _contentPane.popUp.addChild(_contentPane.hideDisplay);
            _contentPane.popUp.addChild(_contentPane.display);
            PopUpManager.addPopUp(_contentPane.popUp,viewStack,modal);
         }
         else
         {
            _contentPane.addChild(_contentPane.hideDisplay);
            _contentPane.addChild(_contentPane.display);
         }
         if(false)
         {
            _loc3_ = new Sprite();
            _loc3_.graphics.beginFill(6710886,1);
            _loc3_.graphics.drawRect(0,0,contentWidth,contentHeight);
            (_loc4_ = popUp ? _contentPane.popUp : _contentPane).mask = _loc3_;
            _loc4_.addChild(_loc3_);
         }
         _viewStack.rawChildren.addChild(_contentPane);
      }
      
      private function onContainerResizeAndCreatorComplete(param1:Event) : void
      {
         if(_waitingForCreation)
         {
            startEffect();
         }
      }
      
      protected function destroyBitmapDatum() : void
      {
         var _loc1_:BitmapData = null;
         if(!bitmapDatum)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = BitmapData(bitmapDatum[_loc3_]);
            if(_loc1_)
            {
               _loc1_.dispose();
            }
            _loc3_++;
         }
      }
      
      protected function playViewStackEffect() : void
      {
      }
      
      override public function play() : void
      {
         super.play();
         switch(_effectType)
         {
            case FlexEvent.HIDE:
               takeSnapShot();
               removeChildren();
               _contentPane.hideDisplay.visible = true;
               if(hideTarget)
               {
                  applyEraseBlendMode(true);
               }
               viewStack.callLater(finishRepeat);
               break;
            case FlexEvent.SHOW:
               removeChildren();
               createBitmapDatum();
               playViewStackEffect();
               _contentPane.hideDisplay.visible = false;
               if(hideTarget)
               {
                  applyEraseBlendMode(true);
               }
         }
      }
      
      protected function setIndicesRequired() : void
      {
      }
      
      protected function setInturruptionParams() : void
      {
      }
      
      final public function get selectedIndexFrom() : int
      {
         return _contentPane.selectedIndexFrom;
      }
      
      public function get display() : DisplayObjectContainer
      {
         return _contentPane.display;
      }
      
      override public function initEffect(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.initEffect(param1);
         _contentPane = _viewStack.rawChildren.getChildByName("ViewStackInstance") as ViewStackInstanceContainer;
         if(!_contentPane)
         {
            createContainers();
         }
         _indicesRequired = new Array();
         _contentPane.selectedIndexTo = _viewStack.selectedIndex;
         _effectType = param1.type;
         switch(_effectType)
         {
            case FlexEvent.HIDE:
               addRequiredIndex(selectedIndexFrom);
               break;
            case FlexEvent.SHOW:
               setIndicesRequired();
         }
         if(true)
         {
            addRequiredIndex(selectedIndexFrom);
            addRequiredIndex(selectedIndexTo);
         }
         else if(false && false)
         {
            _indicesRequired = new Array();
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               addRequiredIndex(_loc3_);
               _loc3_++;
            }
         }
         _indicesRequired = removeDuplicatesFromArray(_indicesRequired);
         _contentPane.containerResizeAndCreator.initialize(_indicesRequired,viewStack,new Rectangle(contentX,contentY,contentWidth,contentHeight));
      }
      
      final protected function get contentWidth() : Number
      {
         return _helper.contentWidth;
      }
      
      private function applyEraseBlendMode(param1:Boolean) : void
      {
         if(param1)
         {
            _prevBlendMode = target.blendMode;
            target.blendMode = BlendMode.ERASE;
         }
         else
         {
            target.blendMode = !!_prevBlendMode ? _prevBlendMode : BlendMode.NORMAL;
         }
      }
      
      override public function end() : void
      {
         if(!_contentPane)
         {
            return;
         }
         if(_effectType == FlexEvent.SHOW && _contentPane && !_wasInterrupted)
         {
            _wasInterrupted = _contentPane.wasInterrupted = true;
            setInturruptionParams();
         }
         _contentPane.containerResizeAndCreator.cancel();
         mx_internal::stopRepeat = true;
         if(mx_internal::delayTimer)
         {
            mx_internal::delayTimer.reset();
         }
         if(tween)
         {
            tween.stop();
            tween = null;
         }
         finishRepeat();
      }
      
      final public function set helper(param1:Class) : void
      {
         _helper = IViewStackEffectHelper(new param1(_viewStack));
      }
      
      final public function get viewStack() : ViewStack
      {
         return _viewStack;
      }
      
      final public function get snapShot() : BitmapData
      {
         return _contentPane.hideDisplay.bitmapData;
      }
      
      final protected function removeDuplicatesFromArray(param1:Array) : Array
      {
         var _loc4_:* = undefined;
         var _loc2_:Dictionary = new Dictionary(true);
         var _loc3_:Array = new Array();
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param1[_loc6_];
            if(_loc2_[_loc4_] == undefined)
            {
               _loc2_[_loc4_] = true;
               _loc3_.push(_loc4_);
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      final protected function addRequiredIndex(param1:int) : void
      {
         _indicesRequired.push(param1);
      }
      
      final public function get selectedIndexTo() : int
      {
         return _contentPane.selectedIndexTo;
      }
      
      final protected function get contentX() : Number
      {
         return _helper.contentX;
      }
   }
}

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Rectangle;
import mx.containers.ViewStack;
import mx.core.Container;
import mx.core.mx_internal;
import mx.events.FlexEvent;

class ContainerResizeAndCreator extends EventDispatcher
{
    
   
   private var _complete:Boolean;
   
   private var _creatingContainers:Array;
   
   private var _creationCount:int;
   
   private var _creationCompleteCount:int;
   
   public function ContainerResizeAndCreator()
   {
      super();
   }
   
   private function checkCreationStatus() : void
   {
      if(_creationCompleteCount == _creationCount && !_complete)
      {
         _complete = true;
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
   
   private function onContainerCreationComplete(param1:FlexEvent) : void
   {
      var _loc2_:Container = Container(param1.currentTarget);
      _loc2_.removeEventListener(FlexEvent.CREATION_COMPLETE,onContainerCreationComplete,false);
      ++_creationCompleteCount;
      checkCreationStatus();
   }
   
   public function get complete() : Boolean
   {
      return _complete;
   }
   
   public function cancel() : void
   {
      var _loc1_:Container = null;
      var _loc2_:int = 0;
      _complete = true;
      var _loc3_:int = 0;
      while(_loc3_ < _loc2_)
      {
         _loc1_ = Container(_creatingContainers[_loc3_]);
         _loc1_.removeEventListener(FlexEvent.CREATION_COMPLETE,onContainerCreationComplete,false);
         _loc3_++;
      }
   }
   
   public function initialize(param1:Array, param2:ViewStack, param3:Rectangle) : void
   {
      var _loc4_:int = 0;
      var _loc5_:* = 0;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      var _loc9_:Container = null;
      var _loc10_:int = 0;
      _complete = false;
      _creationCount = 0;
      _creationCompleteCount = 0;
      var _loc6_:int = param2.numChildren;
      _creatingContainers = new Array();
      _loc5_ = param1.length;
      _loc4_ = 0;
      while(_loc4_ < _loc5_)
      {
         if((_loc10_ = Number(param1[_loc4_])) >= 0 && _loc10_ < _loc6_)
         {
            if((_loc9_ = param2.getChildAt(_loc10_) as Container).mx_internal::numChildrenCreated == -1 && _loc9_.numChildren != 0 || !_loc9_.initialized)
            {
               ++_creationCount;
            }
         }
         _loc4_++;
      }
      _loc5_ = param1.length;
      _loc4_ = 0;
      while(_loc4_ < _loc5_)
      {
         if((_loc10_ = Number(param1[_loc4_])) >= 0 && _loc10_ < _loc6_ && !isNaN(_loc10_))
         {
            if((_loc9_ = param2.getChildAt(_loc10_) as Container).mx_internal::numChildrenCreated == -1 && _loc9_.numChildren != 0 || !_loc9_.initialized)
            {
               _creatingContainers.push(_loc9_);
               _loc9_.addEventListener(FlexEvent.CREATION_COMPLETE,onContainerCreationComplete,false,0,true);
               _loc9_.createComponentsFromDescriptors(true);
            }
            _loc7_ = param3.width;
            _loc8_ = param3.height;
            if(!isNaN(_loc9_.percentWidth))
            {
               if(_loc7_ > _loc9_.maxWidth)
               {
                  _loc7_ = _loc9_.maxWidth;
               }
            }
            else if(_loc7_ > _loc9_.explicitWidth)
            {
               _loc7_ = _loc9_.explicitWidth;
            }
            if(!isNaN(_loc9_.percentHeight))
            {
               if(_loc8_ > _loc9_.maxHeight)
               {
                  _loc8_ = _loc9_.maxHeight;
               }
            }
            else if(_loc8_ > _loc9_.explicitHeight)
            {
               _loc8_ = _loc9_.explicitHeight;
            }
            if(_loc9_.x != param3.x || _loc9_.y != param3.y)
            {
               _loc9_.move(param3.x,param3.y);
            }
            if(_loc9_.width != _loc7_ || _loc9_.height != _loc8_)
            {
               _loc9_.setActualSize(_loc7_,_loc8_);
            }
            if(Boolean(_loc9_.mx_internal::invalidateDisplayListFlag) || Boolean(_loc9_.mx_internal::invalidateSizeFlag) || Boolean(_loc9_.mx_internal::invalidatePropertiesFlag))
            {
               _loc9_.validateNow();
            }
         }
         _loc4_++;
      }
      if(_creationCount == 0)
      {
         checkCreationStatus();
      }
   }
}

import flash.display.Bitmap;
import flash.display.Sprite;
import mx.core.UIComponent;

class ViewStackInstanceContainer extends Sprite
{
    
   
   public var bitmapDatum:Array;
   
   public var selectedIndexFrom:int;
   
   public var display:Sprite;
   
   public var data:Object;
   
   public var popUp:UIComponent;
   
   public var hideDisplay:Bitmap;
   
   public var containerResizeAndCreator:ContainerResizeAndCreator;
   
   public var selectedIndexTo:int;
   
   public var wasInterrupted:Boolean;
   
   public function ViewStackInstanceContainer()
   {
      super();
   }
}
