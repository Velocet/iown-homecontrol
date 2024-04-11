package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.services.ActuatorService;
   import com.scenarioLauncher.views.common.CommonPopup;
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
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class RadioContolUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _2004438503spinner:Spinner;
      
      mx_internal var _watchers:Array;
      
      private var _709048393vsSynchronizationUI:ViewStack;
      
      private var _709955227lbRadioInProgress2:Text;
      
      private var _embed_mxml__947407771:Class;
      
      private var _1585729331radioInProgress:Canvas;
      
      private var _946929545lbRadioInProgress:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _actuator:Actuator;
      
      mx_internal var _bindings:Array;
      
      private var _485323493pictoSynchro:Image;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function RadioContolUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":385,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "stylesFactory":function():void
                     {
                        this.horizontalAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "horizontalScrollPolicy":"off",
                           "verticalScrollPolicy":"off",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Image,
                              "id":"pictoSynchro",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__947407771,
                                    "width":34
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":ViewStack,
                              "id":"vsSynchronizationUI",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "creationPolicy":"all",
                                    "percentWidth":100,
                                    "resizeToContent":true,
                                    "clipContent":false,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"radioInProgress",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"radioInProgress",
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbRadioInProgress",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbRadioInProgress",
                                                      "percentWidth":100,
                                                      "styleName":"VR18BC"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbRadioInProgress2",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbRadioInProgress2",
                                                      "percentWidth":100,
                                                      "styleName":"V18RCL0"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Spinner,
                                                "id":"spinner",
                                                "stylesFactory":function():void
                                                {
                                                   this.tickColor = 16758037;
                                                   this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "size":48,
                                                      "tickWidth":4,
                                                      "autoPlay":false
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__947407771 = RadioContolUI__embed_mxml__947407771;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 385;
         this.clipContent = false;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RadioContolUI._watcherSetupUtil = param1;
      }
      
      private function _RadioContolUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.lbRadioInProgress.y + this.lbRadioInProgress.height + 20;
         _loc1_ = this.lbRadioInProgress2.y + this.lbRadioInProgress2.height + 20;
      }
      
      private function bindListeners() : void
      {
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(ActuatorEvent.RENAME_ACTUATOR,this.OnRenameActuatorHandler);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RadioContolUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RadioContolUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_RadioContolUIWatcherSetupUtil");
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
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      public function set radioInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._1585729331radioInProgress;
         if(_loc2_ !== param1)
         {
            this._1585729331radioInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioInProgress",_loc2_,param1));
         }
      }
      
      private function removeListeners() : void
      {
         ServerCommunicationManager.instance.removeEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.removeEventListener(ActuatorEvent.RENAME_ACTUATOR,this.OnRenameActuatorHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbRadioInProgress2() : Text
      {
         return this._709955227lbRadioInProgress2;
      }
      
      private function _RadioContolUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbRadioInProgress2.y = param1;
         },"lbRadioInProgress2.y");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[1] = binding;
         return result;
      }
      
      public function set spinner(param1:Spinner) : void
      {
         var _loc2_:Object = this._2004438503spinner;
         if(_loc2_ !== param1)
         {
            this._2004438503spinner = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinner",_loc2_,param1));
         }
      }
      
      private function OnRenameActuatorHandler(param1:ActuatorEvent) : void
      {
         this.removeListeners();
         closeHandler();
         this._actuator.name = param1.actuatorNewName;
         ActuatorService.instance.saveActuator(this._actuator);
      }
      
      public function set lbRadioInProgress2(param1:Text) : void
      {
         var _loc2_:Object = this._709955227lbRadioInProgress2;
         if(_loc2_ !== param1)
         {
            this._709955227lbRadioInProgress2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbRadioInProgress2",_loc2_,param1));
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.bindListeners();
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsSynchronizationUI.selectedChild.id)
         {
            case "radioInProgress":
               this.pictoSynchro.visible = true;
               this.pictoSynchro.includeInLayout = true;
         }
         super.refreshUI();
      }
      
      override protected function initLabels() : void
      {
         this.lbRadioInProgress.htmlText = resourceManager.getString("remotes","WORK_IN_PROGRESS");
         this.lbRadioInProgress2.htmlText = resourceManager.getString("remotes","WORK_IN_PROGRESS2");
      }
      
      [Bindable(event="propertyChange")]
      public function get radioInProgress() : Canvas
      {
         return this._1585729331radioInProgress;
      }
      
      override protected function onInitialize(param1:FlexEvent) : void
      {
         super.onInitialize(param1);
         this.refreshPopup();
         this.spinner.play();
      }
      
      public function set pictoSynchro(param1:Image) : void
      {
         var _loc2_:Object = this._485323493pictoSynchro;
         if(_loc2_ !== param1)
         {
            this._485323493pictoSynchro = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pictoSynchro",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get vsSynchronizationUI() : ViewStack
      {
         return this._709048393vsSynchronizationUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get pictoSynchro() : Image
      {
         return this._485323493pictoSynchro;
      }
      
      private function goToradioInProgress() : void
      {
         this.vsSynchronizationUI.selectedChild = this.radioInProgress;
         this.refreshPopup();
         this.spinner.play();
      }
      
      public function set lbRadioInProgress(param1:Text) : void
      {
         var _loc2_:Object = this._946929545lbRadioInProgress;
         if(_loc2_ !== param1)
         {
            this._946929545lbRadioInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbRadioInProgress",_loc2_,param1));
         }
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this.bindListeners();
         this._actuator = param1;
      }
      
      public function set vsSynchronizationUI(param1:ViewStack) : void
      {
         var _loc2_:Object = this._709048393vsSynchronizationUI;
         if(_loc2_ !== param1)
         {
            this._709048393vsSynchronizationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsSynchronizationUI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbRadioInProgress() : Text
      {
         return this._946929545lbRadioInProgress;
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_RENAME_ACTUATOR:
               closeHandler();
               DialogsManager.showTransferFailedPopup();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               closeHandler();
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
   }
}
