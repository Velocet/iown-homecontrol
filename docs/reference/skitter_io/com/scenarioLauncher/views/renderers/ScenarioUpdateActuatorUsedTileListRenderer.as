package com.scenarioLauncher.views.renderers
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.views.AdjustActuatorUI;
   import com.scenarioLauncher.views.ScenarioUpdateUI;
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
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Situation;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.DragSource;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.DynamicEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class ScenarioUpdateActuatorUsedTileListRenderer extends Canvas implements IBindingClient, IDropInListItemRenderer
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static const ACTUATOR_ADDED_TO_SCENARIO:String = "actuatorAddedToScenario";
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1689631564actuatorImageButton:Image;
      
      private var _1905909775_actuatorIcon:Object;
      
      private var _1832466555actuatorLabel:Text;
      
      private var _1554982056_actuator:Actuator;
      
      private var _317149757_stylename:String;
      
      private var _1469999309_visible:Boolean = true;
      
      private var _1472470539_label:String;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _situation:Situation;
      
      mx_internal var _watchers:Array;
      
      private var _1951146356spinnerRadioInProgress:Spinner;
      
      private var adjustActuator:AdjustActuatorUI = null;
      
      private var _guiInitialized:Boolean = false;
      
      private var _darker:ColorTransform;
      
      private var _listData:BaseListData;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var spinnerFlagChanged:Boolean = false;
      
      private var _594782856enableHandCursor:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      private var _spinnerInProgress:Boolean = false;
      
      public function ScenarioUpdateActuatorUsedTileListRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"actuatorImageButton",
                  "events":{
                     "click":"__actuatorImageButton_click",
                     "complete":"__actuatorImageButton_complete"
                  },
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"actuatorImageButton",
                        "buttonMode":true,
                        "tabEnabled":true,
                        "x":0,
                        "y":0,
                        "width":72,
                        "height":72
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Spinner,
                  "id":"spinnerRadioInProgress",
                  "stylesFactory":function():void
                  {
                     this.tickColor = 4473924;
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "size":36,
                        "tickWidth":6,
                        "autoPlay":false,
                        "y":16,
                        "x":0
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
                        "styleName":"VR12BCL0",
                        "width":72,
                        "y":85
                     };
                  }
               })]};
            }
         });
         this._darker = new ColorTransform(0.3,0.3,0.3,1,0,0,0,0);
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
         this.addEventListener("mouseDown",this.___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_mouseDown);
         this.addEventListener("dragEnter",this.___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_dragEnter);
         this.addEventListener("dragDrop",this.___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_dragDrop);
         this.addEventListener("creationComplete",this.___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ScenarioUpdateActuatorUsedTileListRenderer._watcherSetupUtil = param1;
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this._actuator = param1;
      }
      
      public function set situation(param1:Situation) : void
      {
         this._situation = param1;
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
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
      
      public function get situation() : Situation
      {
         return this._situation;
      }
      
      public function get actuatorIcon() : Object
      {
         return this._actuatorIcon;
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
      
      public function set actuatorIcon(param1:Object) : void
      {
         this._actuatorIcon = param1;
      }
      
      private function applyActuatorSettingsHandler(param1:ActuatorEvent) : void
      {
         this._listData.owner.dispatchEvent(param1.clone());
      }
      
      private function delayStopSpinner() : void
      {
         this.spinnerInProgress = false;
      }
      
      protected function actuatorImageButtonMouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:ScenarioUpdateActuatorUsedTileListRenderer = ScenarioUpdateActuatorUsedTileListRenderer(param1.currentTarget);
         var _loc3_:DragSource = new DragSource();
         _loc3_.addData(_loc2_,"ScenarioUpdateActuatorTileListRenderer");
         var _loc4_:ScenarioUpdateActuatorUsedTileListRenderer = new ScenarioUpdateActuatorUsedTileListRenderer();
         _loc4_ = ScenarioUpdateActuatorUsedTileListRenderer(param1.currentTarget);
         DragManager.doDrag(_loc2_,_loc3_,param1,_loc4_);
      }
      
      [Bindable(event="propertyChange")]
      private function get _stylename() : String
      {
         return this._317149757_stylename;
      }
      
      protected function actuatorImageButtonDragDropHandler(param1:DragEvent) : void
      {
         var _loc4_:DynamicEvent = null;
         var _loc2_:ScenarioUpdateActuatorUsedTileListRenderer = ScenarioUpdateActuatorUsedTileListRenderer(param1.currentTarget);
         var _loc3_:ScenarioUpdateActuatorTileListRenderer = ScenarioUpdateActuatorTileListRenderer(param1.dragInitiator);
         if(this._actuator.profile == Actuator.ACTUATOR_PROFILE__NONE)
         {
            _loc3_.transform.colorTransform = this._darker;
            (_loc4_ = new DynamicEvent(ACTUATOR_ADDED_TO_SCENARIO)).actuatorInitiator = _loc3_.actuator;
            _loc4_.actuatorTarget = _loc2_.actuator;
            this._listData.owner.owner.dispatchEvent(_loc4_);
         }
      }
      
      public function __actuatorImageButton_complete(param1:Event) : void
      {
         this.imageCompleteHandler(param1);
      }
      
      override public function invalidateDisplayList() : void
      {
         super.invalidateDisplayList();
      }
      
      private function dataChangedHandler(param1:FlexEvent) : void
      {
         this.updateWidgetPositions();
      }
      
      public function ___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_dragDrop(param1:DragEvent) : void
      {
         this.actuatorImageButtonDragDropHandler(param1);
      }
      
      public function ___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 is Situation)
         {
            this._situation = param1 as Situation;
            this._actuator = this._situation.actuator;
            if(this._situation != null)
            {
               ServerCommunicationManager.instance.addEventListener(ActuatorEvent.POSITION_ACTUATOR,this.getActuatorPositionHandler);
               ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.getActuatorPositionHandlerFault);
               this._visible = true;
               this._actuatorIcon = ActuatorUtil.getIconControlClass(this._actuator);
               this._label = this._actuator.name;
               this.updateWidgetPositions();
               if(this._situation.radioInProgress > 0)
               {
                  this.spinnerInProgress = true;
               }
               else
               {
                  setTimeout(this.delayStopSpinner,300);
               }
            }
         }
         else if(this.actuatorImageButton)
         {
            this._visible = false;
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _visible() : Boolean
      {
         return this._1469999309_visible;
      }
      
      private function startSpinner() : void
      {
         this.spinnerRadioInProgress.play();
         this.spinnerRadioInProgress.visible = true;
      }
      
      [Bindable(event="propertyChange")]
      private function get _actuator() : Actuator
      {
         return this._1554982056_actuator;
      }
      
      public function __actuatorImageButton_click(param1:MouseEvent) : void
      {
         this.actuatorImageButtonClickHandler(param1);
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
      
      public function get spinnerInProgress() : Boolean
      {
         return this._spinnerInProgress;
      }
      
      private function _ScenarioUpdateActuatorUsedTileListRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return enableHandCursor;
         },function(param1:Boolean):void
         {
            actuatorImageButton.useHandCursor = param1;
         },"actuatorImageButton.useHandCursor");
         result[0] = binding;
         binding = new Binding(this,function():Object
         {
            return _actuatorIcon;
         },function(param1:Object):void
         {
            actuatorImageButton.source = param1;
         },"actuatorImageButton.source");
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
      
      public function set actuatorImageButton(param1:Image) : void
      {
         var _loc2_:Object = this._1689631564actuatorImageButton;
         if(_loc2_ !== param1)
         {
            this._1689631564actuatorImageButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorImageButton",_loc2_,param1));
         }
      }
      
      private function getActuatorPositionHandler(param1:ActuatorEvent) : void
      {
         if(param1.actuator == this._actuator)
         {
            this._situation.ParameterValue = param1.situation.ParameterValue;
            this.updateWidgetPositions();
         }
         this.removeActuatorPositionListeners();
      }
      
      [Bindable(event="propertyChange")]
      public function get spinnerRadioInProgress() : Spinner
      {
         return this._1951146356spinnerRadioInProgress;
      }
      
      protected function actuatorImageButtonClickHandler(param1:MouseEvent) : void
      {
         if(this.adjustActuator == null)
         {
            this.adjustActuator = new AdjustActuatorUI();
            this.adjustActuator.addEventListener(ActuatorEvent.APPLY_ACTUATOR_SETTINGS,this.applyActuatorSettingsHandler);
            this.adjustActuator.addEventListener(ActuatorEvent.APPLY_TO_ALL_ACTUATOR_SETTINGS,this.applyToAllActuatorSettingsHandler);
         }
         this.adjustActuator.addEventListener(ActuatorEvent.POSITION_ACTUATOR,this.getActuatorPositionHandler);
         this.adjustActuator.actuator = this._actuator;
         this.adjustActuator.situation = ScenarioUpdateUI.getSituationByActuator(this._actuator);
         KCPopupManager.singleton.displayPopup(this.adjustActuator);
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set stylename(param1:String) : void
      {
         this._stylename = param1;
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
      public function get actuatorLabel() : Text
      {
         return this._1832466555actuatorLabel;
      }
      
      private function updateWidgetPositions() : void
      {
         var _loc1_:Object = null;
         if(this._guiInitialized && this._situation != null && Boolean(this.actuatorImageButton.content))
         {
            _loc1_ = Object(this.actuatorImageButton.content);
            if(this._situation.p1 >= 0)
            {
               _loc1_.setParam("p1",this._situation.p1);
            }
            if(this._situation.p2 >= 0)
            {
               _loc1_.setParam("p2",this._situation.p2);
            }
            if(this._situation.p3 >= 0)
            {
               _loc1_.setParam("p3",this._situation.p3);
            }
         }
      }
      
      protected function actuatorImageButtonDragEnterHandler(param1:DragEvent) : void
      {
         var _loc3_:ScenarioUpdateActuatorTileListRenderer = null;
         var _loc2_:ScenarioUpdateActuatorUsedTileListRenderer = ScenarioUpdateActuatorUsedTileListRenderer(param1.currentTarget);
         if(param1.dragInitiator is ScenarioUpdateActuatorTileListRenderer)
         {
            _loc3_ = ScenarioUpdateActuatorTileListRenderer(param1.dragInitiator);
            if(_loc2_.actuator.profile == Actuator.ACTUATOR_PROFILE__NONE && !_loc3_.actuator.useInScenario)
            {
               DragManager.acceptDragDrop(this);
               DragManager.showFeedback(DragManager.COPY);
            }
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
         var target:ScenarioUpdateActuatorUsedTileListRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ScenarioUpdateActuatorUsedTileListRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorUsedTileListRendererWatcherSetupUtil");
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
      public function get actuatorImageButton() : Image
      {
         return this._1689631564actuatorImageButton;
      }
      
      private function stopSpinner() : void
      {
         this.spinnerRadioInProgress.stop();
         this.spinnerRadioInProgress.visible = false;
      }
      
      public function get stylename() : String
      {
         return this._stylename;
      }
      
      override protected function commitProperties() : void
      {
         if(this.spinnerFlagChanged)
         {
            if(this._spinnerInProgress)
            {
               this.startSpinner();
            }
            else
            {
               this.stopSpinner();
            }
            this.spinnerFlagChanged = false;
         }
         super.commitProperties();
      }
      
      public function set spinnerInProgress(param1:Boolean) : void
      {
         this._spinnerInProgress = param1;
         this.spinnerFlagChanged = true;
         invalidateProperties();
      }
      
      private function getActuatorPositionHandlerFault(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_GET_ACTUATOR_POSITION:
               if(this._situation.radioInProgress == 2)
               {
                  this._situation.ParameterValue = new ByteArray();
                  this._situation.ParameterValue.writeByte(100);
                  this._situation.ParameterValue.writeByte(100);
                  this._situation.ParameterValue.writeByte(100);
               }
               this.updateWidgetPositions();
               this.removeActuatorPositionListeners();
         }
      }
      
      public function ___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_mouseDown(param1:MouseEvent) : void
      {
         this.actuatorImageButtonMouseDownHandler(param1);
      }
      
      private function set _actuatorIcon(param1:Object) : void
      {
         var _loc2_:Object = this._1905909775_actuatorIcon;
         if(_loc2_ !== param1)
         {
            this._1905909775_actuatorIcon = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_actuatorIcon",_loc2_,param1));
         }
      }
      
      public function set spinnerRadioInProgress(param1:Spinner) : void
      {
         var _loc2_:Object = this._1951146356spinnerRadioInProgress;
         if(_loc2_ !== param1)
         {
            this._1951146356spinnerRadioInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinnerRadioInProgress",_loc2_,param1));
         }
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
      private function get _actuatorIcon() : Object
      {
         return this._1905909775_actuatorIcon;
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         this._guiInitialized = true;
         this.updateWidgetPositions();
         addEventListener(FlexEvent.DATA_CHANGE,this.dataChangedHandler);
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      private function applyToAllActuatorSettingsHandler(param1:ActuatorEvent) : void
      {
         this._listData.owner.dispatchEvent(param1.clone());
      }
      
      private function removeActuatorPositionListeners() : void
      {
         if(ServerCommunicationManager.instance.hasEventListener(ActuatorEvent.POSITION_ACTUATOR))
         {
            ServerCommunicationManager.instance.removeEventListener(ActuatorEvent.POSITION_ACTUATOR,this.getActuatorPositionHandler);
         }
         if(ServerCommunicationManager.instance.hasEventListener(FaultEvent.FAULT))
         {
            ServerCommunicationManager.instance.removeEventListener(FaultEvent.FAULT,this.getActuatorPositionHandlerFault);
         }
         if(this.adjustActuator != null && this.adjustActuator.hasEventListener(ActuatorEvent.POSITION_ACTUATOR))
         {
            this.adjustActuator.removeEventListener(ActuatorEvent.POSITION_ACTUATOR,this.getActuatorPositionHandler);
         }
      }
      
      private function _ScenarioUpdateActuatorUsedTileListRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.enableHandCursor;
         _loc1_ = this._actuatorIcon;
         _loc1_ = this._visible;
         _loc1_ = this._label;
         _loc1_ = this._visible;
      }
      
      public function ___ScenarioUpdateActuatorUsedTileListRenderer_Canvas1_dragEnter(param1:DragEvent) : void
      {
         this.actuatorImageButtonDragEnterHandler(param1);
      }
      
      private function imageCompleteHandler(param1:Event) : void
      {
         this.updateWidgetPositions();
      }
   }
}
