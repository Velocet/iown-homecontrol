package com.scenarioLauncher.views.renderers
{
   import com.greensock.TweenMax;
   import com.greensock.events.TweenEvent;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.views.util.ActuatorUtil;
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import ioService.datamodel.Actuator;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.SandboxMouseEvent;
   import mx.styles.*;
   
   public class ScenarioUpdateActuatorTileListRenderer extends Canvas implements IBindingClient, IDropInListItemRenderer
   {
      
      public static var proxyImageCanvas:HBox;
      
      public static var dragMouseEvent:MouseEvent;
      
      public static var currentDraggedItem:com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer;
      
      public static var proxyImage:Image;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static var lockPosition:Boolean = false;
      
      public static const ACTUATOR_DELETED_FROM_SCENARIO:String = "actuatorDeletedFromScenario";
      
      public static var resize:TweenMax;
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1689631564actuatorImageButton:Button;
      
      mx_internal var _watchers:Array;
      
      private var _1832466555actuatorLabel:Text;
      
      private var _1554982056_actuator:Actuator;
      
      private var _317149757_stylename:String;
      
      private var _1469999309_visible:Boolean = true;
      
      private var _1472470539_label:String;
      
      private var _darker:ColorTransform;
      
      private var _listData:BaseListData;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _594782856enableHandCursor:Boolean = true;
      
      private var _ligther:ColorTransform;
      
      mx_internal var _bindings:Array;
      
      public function ScenarioUpdateActuatorTileListRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":96,
                        "height":96,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"actuatorImageButton",
                           "events":{
                              "mouseOver":"__actuatorImageButton_mouseOver",
                              "mouseOut":"__actuatorImageButton_mouseOut"
                           },
                           "stylesFactory":function():void
                           {
                              this.horizontalCenter = "0";
                              this.verticalCenter = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"actuatorImageButton",
                                 "buttonMode":true,
                                 "labelPlacement":"bottom",
                                 "tabEnabled":true,
                                 "x":0,
                                 "y":0,
                                 "width":72,
                                 "height":72
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "id":"actuatorLabel",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "selectable":false,
                        "name":"actuatorLabel",
                        "width":72,
                        "y":85,
                        "styleName":"VR12WCL0"
                     };
                  }
               })]};
            }
         });
         this._darker = new ColorTransform(0.3,0.3,0.3,1,0,0,0,0);
         this._ligther = new ColorTransform(1,1,1,1,0,0,0,0);
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundAlpha = 0;
         };
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("mouseDown",this.___ScenarioUpdateActuatorTileListRenderer_Canvas1_mouseDown);
         this.addEventListener("creationComplete",this.___ScenarioUpdateActuatorTileListRenderer_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorLabel() : Text
      {
         return this._1832466555actuatorLabel;
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
      
      private function _ScenarioUpdateActuatorTileListRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return _stylename;
         },function(param1:Object):void
         {
            actuatorImageButton.styleName = param1;
         },"actuatorImageButton.styleName");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return enableHandCursor;
         },function(param1:Boolean):void
         {
            actuatorImageButton.useHandCursor = param1;
         },"actuatorImageButton.useHandCursor");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            actuatorImageButton.visible = param1;
         },"actuatorImageButton.visible");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            actuatorLabel.htmlText = param1;
         },"actuatorLabel.htmlText");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            actuatorLabel.visible = param1;
         },"actuatorLabel.visible");
         result[4] = binding;
         return result;
      }
      
      private function set _label(param1:String) : void
      {
         var _loc2_:Object = this._1472470539_label;
         if(_loc2_ !== param1)
         {
            this._1472470539_label = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_label",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get enableHandCursor() : Boolean
      {
         return this._594782856enableHandCursor;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ScenarioUpdateActuatorTileListRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorTileListRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      protected function actuatorImageButton_mouseOutHandler(param1:MouseEvent) : void
      {
         this.actuatorImageButton.scaleX = this.actuatorImageButton.scaleY = 1;
      }
      
      protected function actuatorImageButton_mouseOverHandler(param1:MouseEvent) : void
      {
         this.actuatorImageButton.scaleX = this.actuatorImageButton.scaleY = Globals.ACTUATOR_SCALE;
      }
      
      public function set actuatorLabel(param1:Text) : void
      {
         var _loc2_:Object = this._1832466555actuatorLabel;
         if(_loc2_ !== param1)
         {
            this._1832466555actuatorLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorLabel",_loc2_,param1));
         }
      }
      
      public function set enableHandCursor(param1:Boolean) : void
      {
         var _loc2_:Object = this._594782856enableHandCursor;
         if(_loc2_ !== param1)
         {
            this._594782856enableHandCursor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"enableHandCursor",_loc2_,param1));
         }
      }
      
      private function set _actuator(param1:Actuator) : void
      {
         var _loc2_:Object = this._1554982056_actuator;
         if(_loc2_ !== param1)
         {
            this._1554982056_actuator = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_actuator",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorImageButton() : Button
      {
         return this._1689631564actuatorImageButton;
      }
      
      protected function actuatorImageButtonMouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:BitmapData = null;
         var _loc5_:Matrix = null;
         var _loc6_:Bitmap = null;
         if(!this._actuator.useInScenario)
         {
            if(currentDraggedItem == null)
            {
               currentDraggedItem = this;
               dragMouseEvent = param1;
               proxyImageCanvas = new HBox();
               proxyImageCanvas.width = 200;
               proxyImageCanvas.height = 200;
               proxyImageCanvas.setStyle("horizontalAlign","center");
               proxyImageCanvas.setStyle("verticalAlign","middle");
               proxyImageCanvas.mouseChildren = false;
               proxyImageCanvas.mouseEnabled = false;
               proxyImageCanvas.alpha = 0.75;
               proxyImage = new Image();
               proxyImageCanvas.addChild(proxyImage);
               _loc2_ = 0;
               _loc3_ = 0;
               _loc4_ = new BitmapData(_loc2_,_loc3_,true);
               _loc5_ = new Matrix();
               _loc4_.fillRect(_loc4_.rect,0);
               _loc4_.draw(currentDraggedItem,_loc5_);
               _loc6_ = new Bitmap(_loc4_);
               proxyImage.source = _loc6_;
               KCPopupManager.singleton.displayPopup(proxyImageCanvas,20,false);
               proxyImageCanvas.x = param1.stageX - 0;
               proxyImageCanvas.y = param1.stageY - 0;
               this.startDragging(param1);
            }
         }
      }
      
      private function effectStartHandler(param1:TweenEvent) : void
      {
         if(currentDraggedItem != null)
         {
         }
      }
      
      public function get stylename() : String
      {
         return this._stylename;
      }
      
      [Bindable(event="propertyChange")]
      private function get _stylename() : String
      {
         return this._317149757_stylename;
      }
      
      private function _ScenarioUpdateActuatorTileListRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._stylename;
         _loc1_ = this.enableHandCursor;
         _loc1_ = this._visible;
         _loc1_ = this._label;
         _loc1_ = this._visible;
      }
      
      [Bindable(event="propertyChange")]
      private function get _visible() : Boolean
      {
         return this._1469999309_visible;
      }
      
      private function dataChangedHandler(param1:FlexEvent) : void
      {
         if(this._actuator.useInScenario)
         {
            this.transform.colorTransform = this._darker;
         }
         else
         {
            this.transform.colorTransform = this._ligther;
         }
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
      
      public function ___ScenarioUpdateActuatorTileListRenderer_Canvas1_mouseDown(param1:MouseEvent) : void
      {
         this.actuatorImageButtonMouseDownHandler(param1);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 is Actuator)
         {
            this._actuator = param1 as Actuator;
            if(this._actuator != null)
            {
               this._visible = true;
               this._stylename = ActuatorUtil.getImageButtonStyleName(this._actuator);
               this._label = this._actuator.name;
               if(this._actuator.useInScenario)
               {
                  this.transform.colorTransform = this._darker;
               }
            }
         }
         else if(this.actuatorImageButton)
         {
            this._visible = false;
         }
      }
      
      private function stage_mouseLeaveHandler(param1:Event) : void
      {
         this.stopDragging();
      }
      
      private function effectEndHandler(param1:TweenEvent) : void
      {
         if(currentDraggedItem)
         {
            currentDraggedItem.dispatchEvent(param1);
         }
         KCPopupManager.singleton.removePopup(proxyImageCanvas);
         proxyImage = null;
         proxyImageCanvas = null;
         currentDraggedItem = null;
      }
      
      private function set _visible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1469999309_visible;
         if(_loc2_ !== param1)
         {
            this._1469999309_visible = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_visible",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _actuator() : Actuator
      {
         return this._1554982056_actuator;
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      protected function startDragging(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = systemManager.getSandboxRoot();
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.systemManager_mouseMoveHandler,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
         _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.stage_mouseLeaveHandler);
      }
      
      private function systemManager_mouseUpHandler(param1:MouseEvent) : void
      {
         this.stopDragging();
      }
      
      public function __actuatorImageButton_mouseOver(param1:MouseEvent) : void
      {
         this.actuatorImageButton_mouseOverHandler(param1);
      }
      
      protected function stopDragging() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:DisplayObject = systemManager.getSandboxRoot();
         _loc1_.removeEventListener(MouseEvent.MOUSE_MOVE,this.systemManager_mouseMoveHandler,true);
         _loc1_.removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
         _loc1_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.stage_mouseLeaveHandler);
         if(proxyImage != null)
         {
            _loc2_ = Infinity;
            resize = new TweenMax(proxyImage,0.1,{
               "scaleX":_loc2_,
               "scaleY":_loc2_
            });
            resize.addEventListener(TweenEvent.INIT,this.effectStartHandler);
            resize.addEventListener(TweenEvent.COMPLETE,this.effectEndHandler);
            resize.play();
         }
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         addEventListener(FlexEvent.DATA_CHANGE,this.dataChangedHandler);
      }
      
      public function __actuatorImageButton_mouseOut(param1:MouseEvent) : void
      {
         this.actuatorImageButton_mouseOutHandler(param1);
      }
      
      private function systemManager_mouseMoveHandler(param1:MouseEvent) : void
      {
         if(proxyImageCanvas != null && !lockPosition)
         {
            proxyImageCanvas.x = param1.stageX - 0;
            proxyImageCanvas.y = param1.stageY - 0;
         }
      }
      
      public function set actuatorImageButton(param1:Button) : void
      {
         var _loc2_:Object = this._1689631564actuatorImageButton;
         if(_loc2_ !== param1)
         {
            this._1689631564actuatorImageButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorImageButton",_loc2_,param1));
         }
      }
      
      public function set stylename(param1:String) : void
      {
         this._stylename = param1;
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this._actuator = param1;
      }
      
      private function set _stylename(param1:String) : void
      {
         var _loc2_:Object = this._317149757_stylename;
         if(_loc2_ !== param1)
         {
            this._317149757_stylename = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_stylename",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      public function ___ScenarioUpdateActuatorTileListRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
   }
}
