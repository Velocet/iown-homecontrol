package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
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
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.ProgressBar;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class IdentifyOrDeleteActuatorUI extends CommonPopup
   {
       
      
      private var actuatorChanged:Boolean = false;
      
      private var _1830052578actuatorImage:Image;
      
      private var _actuator:Actuator;
      
      private var actuatorControl:Button;
      
      private var _788221659identifyActuator:Canvas;
      
      private var _358539154btnValidate:Button;
      
      private var _refreshActuator:Function;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _631558000vsIdentifyOrDeleteActuator:ViewStack;
      
      private var _1806476442msgActuator:Text;
      
      public function IdentifyOrDeleteActuatorUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":384,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"vsIdentifyOrDeleteActuator",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "creationPolicy":"all",
                           "percentWidth":100,
                           "resizeToContent":true,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"identifyActuator",
                              "propertiesFactory":function():Object
                              {
                                 return {"childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"msgActuator",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"msgActuator",
                                          "styleName":"identifyActuatorUIUILabels",
                                          "y":0,
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"actuatorImage",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"y":84};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":ProgressBar,
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                       this.barColor = 6316128;
                                       this.indeterminateMoveInterval = 36;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "indeterminate":true,
                                          "width":240,
                                          "height":7,
                                          "y":255,
                                          "label":""
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnValidate",
                                    "events":{"click":"__btnValidate_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnValidate",
                                          "styleName":"btnValidate",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "x":138,
                                          "y":300,
                                          "width":113
                                       };
                                    }
                                 })]};
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         super();
         mx_internal::_document = this;
         this.width = 384;
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         if(this._refreshActuator != null)
         {
            this._refreshActuator();
         }
         super.closeHandler(param1);
         ServerCommunicationManager.instance.repeatIdentifyActuator = null;
         ServerCommunicationManager.instance.stopRepeatIndentifyActuator();
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
      
      public function set actuatorImage(param1:Image) : void
      {
         var _loc2_:Object = this._1830052578actuatorImage;
         if(_loc2_ !== param1)
         {
            this._1830052578actuatorImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorImage",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         this.btnValidate.label = resourceManager.getString("common","BTN_OK");
      }
      
      [Bindable(event="propertyChange")]
      public function get vsIdentifyOrDeleteActuator() : ViewStack
      {
         return this._631558000vsIdentifyOrDeleteActuator;
      }
      
      override protected function commitProperties() : void
      {
         if(this.actuatorChanged)
         {
            this.actuatorImage.source = ActuatorUtil.getActuatorImageIdentification(this._actuator);
            this.actuatorChanged = false;
            this.msgActuator.htmlText = this._actuator.name;
            ServerCommunicationManager.instance.startRepeatIndentifyActuator();
            ServerCommunicationManager.instance.repeatIdentifyActuator = this._actuator;
            ServerCommunicationManager.instance.identifyActuator(this._actuator);
         }
         super.commitProperties();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidate() : Button
      {
         return this._358539154btnValidate;
      }
      
      protected function btnValidateClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function set identifyActuator(param1:Canvas) : void
      {
         var _loc2_:Object = this._788221659identifyActuator;
         if(_loc2_ !== param1)
         {
            this._788221659identifyActuator = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"identifyActuator",_loc2_,param1));
         }
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
         setStyle("paddingTop","10");
         super.createChildren();
      }
      
      public function __btnValidate_click(param1:MouseEvent) : void
      {
         this.btnValidateClickHandler(param1);
      }
      
      protected function btnCancelDeletionClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function set vsIdentifyOrDeleteActuator(param1:ViewStack) : void
      {
         var _loc2_:Object = this._631558000vsIdentifyOrDeleteActuator;
         if(_loc2_ !== param1)
         {
            this._631558000vsIdentifyOrDeleteActuator = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsIdentifyOrDeleteActuator",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorImage() : Image
      {
         return this._1830052578actuatorImage;
      }
      
      [Bindable(event="propertyChange")]
      public function get identifyActuator() : Canvas
      {
         return this._788221659identifyActuator;
      }
      
      public function set refreshActuator(param1:Function) : void
      {
         this._refreshActuator = param1;
      }
      
      public function set btnValidate(param1:Button) : void
      {
         var _loc2_:Object = this._358539154btnValidate;
         if(_loc2_ !== param1)
         {
            this._358539154btnValidate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnValidate",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsIdentifyOrDeleteActuator.selectedChild.id)
         {
            case "identifyActuator":
               this.width = 384;
         }
         super.refreshUI();
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this._actuator = param1;
         this.actuatorChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function get refreshActuator() : Function
      {
         return this._refreshActuator;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.refreshPopup();
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
   }
}
