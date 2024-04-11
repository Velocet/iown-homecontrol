package com.scenarioLauncher.views.renderers
{
   import com.greensock.events.TweenEvent;
   import com.scenarioLauncher.events.ScenarioEvent;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.utils.Images16;
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
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.DynamicEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   import mx.styles.*;
   
   public class ActuatorEmptyRenderer extends Canvas implements IDropInListItemRenderer
   {
       
      
      protected var _listData:BaseListData;
      
      private var currentDraggedItem:com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer = null;
      
      private var _1689631564actuatorImageButton:Button;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ActuatorEmptyRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "events":{
                     "mouseOver":"___ActuatorEmptyRenderer_HBox1_mouseOver",
                     "mouseUp":"___ActuatorEmptyRenderer_HBox1_mouseUp",
                     "mouseOut":"___ActuatorEmptyRenderer_HBox1_mouseOut"
                  },
                  "stylesFactory":function():void
                  {
                     this.verticalAlign = "top";
                     this.horizontalAlign = "center";
                     this.backgroundAlpha = 0;
                     this.backgroundColor = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"actuatorImageButton",
                           "stylesFactory":function():void
                           {
                              this.horizontalCenter = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"actuatorImageButton",
                                 "styleName":"empty",
                                 "labelPlacement":"bottom",
                                 "tabEnabled":true,
                                 "width":72,
                                 "height":72
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
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
      }
      
      public function ___ActuatorEmptyRenderer_HBox1_mouseOver(param1:MouseEvent) : void
      {
         this.hbox1_mouseOverHandler(param1);
      }
      
      public function ___ActuatorEmptyRenderer_HBox1_mouseUp(param1:MouseEvent) : void
      {
         this.hbox1_mouseUpHandler(param1);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function reallyAddActuator(param1:TweenEvent) : void
      {
         var _loc3_:Actuator = null;
         var _loc4_:DynamicEvent = null;
         var _loc2_:com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer = this.currentDraggedItem;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.actuator;
            (_loc4_ = new DynamicEvent(ScenarioEvent.ACTUATOR_ADDED_TO_SCENARIO)).actuator = _loc3_;
            this.listData.owner.dispatchEvent(_loc4_);
         }
         CursorManager.removeAllCursors();
      }
      
      protected function hbox1_mouseOutHandler(param1:MouseEvent) : void
      {
         CursorManager.removeAllCursors();
         com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.lockPosition = false;
      }
      
      private function initEffectAddActuatorHandler(param1:TweenEvent) : void
      {
         if(false)
         {
            this.currentDraggedItem = com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.currentDraggedItem;
         }
      }
      
      public function ___ActuatorEmptyRenderer_HBox1_mouseOut(param1:MouseEvent) : void
      {
         this.hbox1_mouseOutHandler(param1);
      }
      
      protected function hbox1_mouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(false)
         {
            _loc2_ = this.localToGlobal(new Point(this.actuatorImageButton.x - this.actuatorImageButton.width * 0,this.actuatorImageButton.y - this.actuatorImageButton.height * 0));
            _loc2_.x += 15;
            _loc2_.y += 26;
            com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.lockPosition = true;
            com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.proxyImageCanvas.x = _loc2_.x;
            com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.proxyImageCanvas.y = _loc2_.y;
            CursorManager.setCursor(Images16.CursorAdd);
         }
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorImageButton() : Button
      {
         return this._1689631564actuatorImageButton;
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
      
      protected function hbox1_mouseUpHandler(param1:MouseEvent) : void
      {
         param1.preventDefault();
         if(false)
         {
            com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.lockPosition = false;
            com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.resize.addEventListener(TweenEvent.COMPLETE,this.reallyAddActuator);
            com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer.resize.addEventListener(TweenEvent.INIT,this.initEffectAddActuatorHandler);
         }
      }
   }
}
