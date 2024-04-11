package com.scenarioLauncher.views
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.views.common.CommonPopup;
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
   import ioService.datamodel.Situation;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class AdjustActuatorUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _watchers:Array;
      
      private var actuatorControl:Image;
      
      private var _1806476442msgActuator:Text;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _2080616050btnApply:Button;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _actuator:Actuator;
      
      public var _AdjustActuatorUI_Spacer2:Spacer;
      
      private var _1378838065btnBox:HBox;
      
      private var _117924854btnCancel:Button;
      
      private var _87961700actuatorControlCanvas:Canvas;
      
      mx_internal var _bindings:Array;
      
      private var _1081390548btnApplyToAll:Button;
      
      private var actuatorChanged:Boolean = false;
      
      private var _situation:Situation;
      
      public function AdjustActuatorUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"msgActuator",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "name":"msgActuator",
                                 "styleName":"identifyActuatorUIUILabels",
                                 "y":5,
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"actuatorControlCanvas",
                           "stylesFactory":function():void
                           {
                              this.horizontalCenter = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"y":50};
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "id":"btnBox",
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                              this.horizontalGap = 10;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "y":300,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnApplyToAll",
                                    "events":{"click":"__btnApplyToAll_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnApplyToAll",
                                          "styleName":"btnValidate",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "x":11,
                                          "y":324,
                                          "minWidth":155
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnApply",
                                    "events":{"click":"__btnApply_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnApply",
                                          "styleName":"btnValidate",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "x":176,
                                          "y":324,
                                          "minWidth":113
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"width":2};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnCancel",
                                    "events":{"click":"__btnCancel_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnCancel",
                                          "styleName":"btnCancel",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "x":307,
                                          "y":324,
                                          "minWidth":113
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "id":"_AdjustActuatorUI_Spacer2",
                           "propertiesFactory":function():Object
                           {
                              return {"height":5};
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.minWidth = 432;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         AdjustActuatorUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnApply() : Button
      {
         return this._2080616050btnApply;
      }
      
      public function set situation(param1:Situation) : void
      {
         this._situation = param1;
         this.actuatorChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function get situation() : Situation
      {
         return this._situation;
      }
      
      private function _AdjustActuatorUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AdjustActuatorUI_Spacer2.y = param1;
         },"_AdjustActuatorUI_Spacer2.y");
         result[0] = binding;
         return result;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:AdjustActuatorUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._AdjustActuatorUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_AdjustActuatorUIWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      public function get msgActuator() : Text
      {
         return this._1806476442msgActuator;
      }
      
      override protected function createChildren() : void
      {
         this.setStyle("paddingLeft",5);
         this.setStyle("paddingRight",5);
         super.createChildren();
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorControlCanvas() : Canvas
      {
         return this._87961700actuatorControlCanvas;
      }
      
      private function _AdjustActuatorUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.btnBox.y + this.btnBox.height;
      }
      
      public function set btnBox(param1:HBox) : void
      {
         var _loc2_:Object = this._1378838065btnBox;
         if(_loc2_ !== param1)
         {
            this._1378838065btnBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnBox",_loc2_,param1));
         }
      }
      
      public function __btnCancel_click(param1:MouseEvent) : void
      {
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancel() : Button
      {
         return this._117924854btnCancel;
      }
      
      public function set btnApplyToAll(param1:Button) : void
      {
         var _loc2_:Object = this._1081390548btnApplyToAll;
         if(_loc2_ !== param1)
         {
            this._1081390548btnApplyToAll = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnApplyToAll",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         this.btnApplyToAll.label = resourceManager.getString("common","BTN_APPLY_TO_ALL");
         this.btnApply.label = resourceManager.getString("common","BTN_APPLY");
         this.btnCancel.label = resourceManager.getString("common","BTN_CANCEL");
      }
      
      public function set msgActuator(param1:Text) : void
      {
         var _loc2_:Object = this._1806476442msgActuator;
         if(_loc2_ !== param1)
         {
            this._1806476442msgActuator = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgActuator",_loc2_,param1));
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         SkitterManager.instance.skitterConnectionAllowed = false;
      }
      
      public function set actuatorControlCanvas(param1:Canvas) : void
      {
         var _loc2_:Object = this._87961700actuatorControlCanvas;
         if(_loc2_ !== param1)
         {
            this._87961700actuatorControlCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorControlCanvas",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         this.minWidth = 432;
         super.refreshUI();
      }
      
      override protected function commitProperties() : void
      {
         if(this.actuatorChanged)
         {
            if(this.actuatorControl != null)
            {
               this.actuatorControl.removeEventListener(Event.COMPLETE,this.completeHandler);
            }
            this.actuatorChanged = false;
            this.actuatorControl = new Image();
            this.actuatorControl.addEventListener(Event.COMPLETE,this.completeHandler);
            this.actuatorControlCanvas.removeAllChildren();
            this.actuatorControlCanvas.addChild(this.actuatorControl);
            this.msgActuator.htmlText = this._actuator.name;
            this.actuatorControl.source = ActuatorUtil.getControlClass(this._actuator);
         }
         super.commitProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnBox() : HBox
      {
         return this._1378838065btnBox;
      }
      
      private function completeHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._situation != null)
         {
            _loc2_ = this._situation.degreeByNum(1);
            if(_loc2_ >= 0)
            {
               Object(this.actuatorControl.content).setParam("p1",_loc2_);
            }
            _loc3_ = this._situation.degreeByNum(2);
            if(_loc3_ >= 0)
            {
               Object(this.actuatorControl.content).setParam("p2",_loc3_);
            }
            if((_loc4_ = this._situation.degreeByNum(3)) >= 0)
            {
               Object(this.actuatorControl.content).setParam("p3",_loc4_);
            }
         }
      }
      
      private function applyToAllHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:ActuatorEvent = null;
         var _loc6_:ByteArray = null;
         if(this.actuatorControl.source != null)
         {
            _loc2_ = Object(this.actuatorControl.content).getParam("p1");
            _loc3_ = Object(this.actuatorControl.content).getParam("p2");
            _loc4_ = Object(this.actuatorControl.content).getParam("p3");
            KCTimeAnalyzer.Tracer("p1=" + _loc2_,0);
            KCTimeAnalyzer.Tracer("p2=" + _loc3_,0);
            KCTimeAnalyzer.Tracer("p3=" + _loc4_,0);
            (_loc5_ = new ActuatorEvent(ActuatorEvent.APPLY_TO_ALL_ACTUATOR_SETTINGS)).actuator = this.actuator;
            _loc6_ = new ByteArray();
            if(_loc2_ != null)
            {
               _loc6_.writeByte(_loc2_);
            }
            if(_loc3_ != null)
            {
               _loc6_.writeByte(_loc3_);
            }
            if(_loc4_ != null)
            {
               _loc6_.writeByte(_loc4_);
            }
            if(this._situation == null)
            {
               this._situation = new Situation();
            }
            this._situation.actuator = this.actuator;
            this._situation.ParameterValue.clear();
            this._situation.ParameterValue.writeBytes(_loc6_);
            _loc5_.situation = this._situation;
            dispatchEvent(_loc5_);
         }
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnApplyToAll() : Button
      {
         return this._1081390548btnApplyToAll;
      }
      
      private function onVsIdentifyOrDeleteActuatorValueCommitHandler(param1:FlexEvent) : void
      {
         invalidateDisplayList();
      }
      
      public function __btnApply_click(param1:MouseEvent) : void
      {
         this.applyHandler(param1);
      }
      
      public function set btnApply(param1:Button) : void
      {
         var _loc2_:Object = this._2080616050btnApply;
         if(_loc2_ !== param1)
         {
            this._2080616050btnApply = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnApply",_loc2_,param1));
         }
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this._actuator = param1;
         this.actuatorChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function set btnCancel(param1:Button) : void
      {
         var _loc2_:Object = this._117924854btnCancel;
         if(_loc2_ !== param1)
         {
            this._117924854btnCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancel",_loc2_,param1));
         }
      }
      
      private function close() : void
      {
         this.actuatorControl.unloadAndStop(true);
         this.actuatorControl.source = null;
         this.actuatorControl.load(null);
         this.actuatorControlCanvas.removeAllChildren();
         closeHandler();
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
      
      private function applyHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:ByteArray = null;
         var _loc6_:ActuatorEvent = null;
         if(this.actuatorControl.source != null)
         {
            _loc2_ = Object(this.actuatorControl.content).getParam("p1");
            _loc3_ = Object(this.actuatorControl.content).getParam("p2");
            _loc4_ = Object(this.actuatorControl.content).getParam("p3");
            KCTimeAnalyzer.Tracer("p1=" + _loc2_,0);
            KCTimeAnalyzer.Tracer("p2=" + _loc3_,0);
            KCTimeAnalyzer.Tracer("p3=" + _loc4_,0);
            _loc5_ = new ByteArray();
            if(_loc2_ != null)
            {
               _loc5_.writeByte(_loc2_);
            }
            if(_loc3_ != null)
            {
               _loc5_.writeByte(_loc3_);
            }
            if(_loc4_ != null)
            {
               _loc5_.writeByte(_loc4_);
            }
            if(this._situation == null)
            {
               this._situation = new Situation();
            }
            (_loc6_ = new ActuatorEvent(ActuatorEvent.APPLY_ACTUATOR_SETTINGS)).actuator = this.actuator;
            _loc6_.situation = this._situation;
            this._situation.actuator = this.actuator;
            this._situation.ParameterValue.clear();
            this._situation.ParameterValue.writeBytes(_loc5_);
            dispatchEvent(_loc6_);
         }
         this.close();
      }
      
      public function __btnApplyToAll_click(param1:MouseEvent) : void
      {
         this.applyToAllHandler(param1);
      }
   }
}
