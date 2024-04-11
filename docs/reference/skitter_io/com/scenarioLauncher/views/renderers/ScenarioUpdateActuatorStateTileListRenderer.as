package com.scenarioLauncher.views.renderers
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.views.AdjustActuatorUI;
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
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class ScenarioUpdateActuatorStateTileListRenderer extends Canvas implements IBindingClient, IDropInListItemRenderer
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static const ACTUATOR_ADDED_TO_SCENARIO:String = "actuatorAddedToScenario";
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _watchers:Array;
      
      private var _1689631564actuatorImageButton:Image;
      
      private var adjustActuator:AdjustActuatorUI = null;
      
      private var _1905909775_actuatorIcon:Object;
      
      private var _1832466555actuatorLabel:Text;
      
      private var _guiInitialized:Boolean = false;
      
      private var _317149757_stylename:String;
      
      private var _1469999309_visible:Boolean = true;
      
      private var _1554982056_actuator:Actuator;
      
      private var _1472470539_label:String;
      
      private var _darker:ColorTransform;
      
      private var _listData:BaseListData;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _594782856enableHandCursor:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      private var _situation:Situation;
      
      public function ScenarioUpdateActuatorStateTileListRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"actuatorImageButton",
                  "events":{"complete":"__actuatorImageButton_complete"},
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"actuatorImageButton",
                        "tabEnabled":true,
                        "x":0,
                        "y":0,
                        "width":72,
                        "height":72
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
         this.addEventListener("creationComplete",this.___ScenarioUpdateActuatorStateTileListRenderer_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ScenarioUpdateActuatorStateTileListRenderer._watcherSetupUtil = param1;
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this._actuator = param1;
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
      
      private function _ScenarioUpdateActuatorStateTileListRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return _actuatorIcon;
         },function(param1:Object):void
         {
            actuatorImageButton.source = param1;
         },"actuatorImageButton.source");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            actuatorImageButton.visible = param1;
         },"actuatorImageButton.visible");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            actuatorLabel.htmlText = param1;
         },"actuatorLabel.htmlText");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            actuatorLabel.visible = param1;
         },"actuatorLabel.visible");
         result[3] = binding;
         return result;
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
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
      public function get enableHandCursor() : Boolean
      {
         return this._594782856enableHandCursor;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ScenarioUpdateActuatorStateTileListRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ScenarioUpdateActuatorStateTileListRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorStateTileListRendererWatcherSetupUtil");
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
      
      public function get actuatorIcon() : Object
      {
         return this._actuatorIcon;
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
      
      private function imageCompleteHandler(param1:Event) : void
      {
         this.updateWidgetPositions();
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
      
      public function set actuatorIcon(param1:Object) : void
      {
         this._actuatorIcon = param1;
      }
      
      private function applyActuatorSettingsHandler(param1:ActuatorEvent) : void
      {
         this._listData.owner.dispatchEvent(param1.clone());
      }
      
      private function _ScenarioUpdateActuatorStateTileListRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._actuatorIcon;
         _loc1_ = this._visible;
         _loc1_ = this._label;
         _loc1_ = this._visible;
      }
      
      public function ___ScenarioUpdateActuatorStateTileListRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorImageButton() : Image
      {
         return this._1689631564actuatorImageButton;
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
      
      public function get stylename() : String
      {
         return this._stylename;
      }
      
      [Bindable(event="propertyChange")]
      private function get _stylename() : String
      {
         return this._317149757_stylename;
      }
      
      public function __actuatorImageButton_complete(param1:Event) : void
      {
         this.imageCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get _visible() : Boolean
      {
         return this._1469999309_visible;
      }
      
      private function dataChangedHandler(param1:FlexEvent) : void
      {
         this.updateWidgetPositions();
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
      
      private function getActuatorPositionHandlerFault(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_GET_ACTUATOR_POSITION:
               this._situation.ParameterValue = new ByteArray();
               this._situation.ParameterValue.writeByte(100);
               this._situation.ParameterValue.writeByte(100);
               this._situation.ParameterValue.writeByte(100);
               this.updateWidgetPositions();
               this.removeActuatorPositionListeners();
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _actuator() : Actuator
      {
         return this._1554982056_actuator;
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
            }
         }
         else if(this.actuatorImageButton)
         {
            this._visible = false;
         }
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
      
      private function set _visible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1469999309_visible;
         if(_loc2_ !== param1)
         {
            this._1469999309_visible = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_visible",_loc2_,param1));
         }
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
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
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      public function set stylename(param1:String) : void
      {
         this._stylename = param1;
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
      
      public function set situation(param1:Situation) : void
      {
         this._situation = param1;
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
      
      public function get situation() : Situation
      {
         return this._situation;
      }
   }
}
