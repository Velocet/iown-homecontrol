package com.scenarioLauncher.views.renderers
{
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.views.IdentifyOrDeleteActuatorUI;
   import com.scenarioLauncher.views.RenameActuatorUI;
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
   import mx.controls.Button;
   import mx.controls.Text;
   import mx.core.Application;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class ActuatorsTileListRenderer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1689631564actuatorImageButton:Button;
      
      mx_internal var _watchers:Array;
      
      private var dataChanged:Boolean = false;
      
      private var _1832466555actuatorLabel:Text;
      
      private var _317149757_stylename:String;
      
      private var _1469999309_visible:Boolean = true;
      
      private var _1472470539_label:String;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _actuator:Actuator;
      
      private var _594782856enableHandCursor:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      private var reinitActuatorUI:Boolean = true;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ActuatorsTileListRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "events":{
                     "mouseOver":"___ActuatorsTileListRenderer_Canvas2_mouseOver",
                     "mouseOut":"___ActuatorsTileListRenderer_Canvas2_mouseOut"
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "events":{"click":"___ActuatorsTileListRenderer_Canvas3_click"},
                        "propertiesFactory":function():Object
                        {
                           return {
                              "width":107,
                              "height":107,
                              "horizontalScrollPolicy":"off",
                              "verticalScrollPolicy":"off",
                              "mouseChildren":false,
                              "buttonMode":true,
                              "useHandCursor":true,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Button,
                                 "id":"actuatorImageButton",
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
                                       "width":97,
                                       "height":97
                                    };
                                 }
                              })]
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Text,
                        "id":"actuatorLabel",
                        "events":{"click":"__actuatorLabel_click"},
                        "stylesFactory":function():void
                        {
                           this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "selectable":false,
                              "name":"actuatorLabel",
                              "width":97,
                              "y":107,
                              "height":40,
                              "styleName":"VR12WCL0",
                              "useHandCursor":true,
                              "mouseChildren":false,
                              "buttonMode":true
                           };
                        }
                     })]};
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
         this.addEventListener("creationComplete",this.___ActuatorsTileListRenderer_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ActuatorsTileListRenderer._watcherSetupUtil = param1;
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
      public function get enableHandCursor() : Boolean
      {
         return this._594782856enableHandCursor;
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
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ActuatorsTileListRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ActuatorsTileListRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_renderers_ActuatorsTileListRendererWatcherSetupUtil");
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
         if(this.reinitActuatorUI)
         {
            this.reinitActuator();
         }
      }
      
      protected function actuatorImageButton_mouseOverHandler(param1:MouseEvent) : void
      {
         this.actuatorImageButton.scaleX = this.actuatorImageButton.scaleY = Globals.ACTUATOR_SCALE;
         this.actuatorLabel.scaleX = this.actuatorLabel.scaleY = Globals.ACTUATOR_SCALE;
         this.actuatorLabel.styleName = "VB12WCL0";
      }
      
      public function ___ActuatorsTileListRenderer_Canvas2_mouseOut(param1:MouseEvent) : void
      {
         this.actuatorImageButton_mouseOutHandler(param1);
      }
      
      public function ___ActuatorsTileListRenderer_Canvas2_mouseOver(param1:MouseEvent) : void
      {
         this.actuatorImageButton_mouseOverHandler(param1);
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
      
      [Bindable(event="propertyChange")]
      public function get actuatorImageButton() : Button
      {
         return this._1689631564actuatorImageButton;
      }
      
      [Bindable(event="propertyChange")]
      private function get _stylename() : String
      {
         return this._317149757_stylename;
      }
      
      private function dataChangedHandler(param1:FlexEvent) : void
      {
         this.dataChanged = true;
         invalidateProperties();
      }
      
      override protected function commitProperties() : void
      {
         if(this.dataChanged)
         {
            this.dataChanged = false;
            if(this._actuator != null)
            {
               this._visible = true;
               this._stylename = ActuatorUtil.getImageButtonStyleName(this._actuator);
               this._label = this._actuator.name;
               if(this._label == "" || this._actuator.name == null)
               {
                  this._label = "---";
               }
            }
            else if(this.actuatorImageButton)
            {
               this._visible = false;
            }
            this.reinitActuator();
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _visible() : Boolean
      {
         return this._1469999309_visible;
      }
      
      private function _ActuatorsTileListRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._stylename;
         _loc1_ = this.enableHandCursor;
         _loc1_ = this._visible;
         _loc1_ = this._label;
         _loc1_ = this._visible;
      }
      
      public function ___ActuatorsTileListRenderer_Canvas3_click(param1:MouseEvent) : void
      {
         this.actuatorImageButtonClickHandler(param1);
      }
      
      public function ___ActuatorsTileListRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._actuator = param1 as Actuator;
         this.dataChanged = true;
         invalidateProperties();
      }
      
      private function reinitActuator() : void
      {
         this.reinitActuatorUI = true;
         this.actuatorImageButton.scaleX = this.actuatorImageButton.scaleY = 1;
         this.actuatorLabel.scaleX = this.actuatorLabel.scaleY = 1;
         this.actuatorLabel.styleName = "VR12WCL0";
      }
      
      public function __actuatorLabel_click(param1:MouseEvent) : void
      {
         this.onActuatorNameClickHandler(param1);
      }
      
      private function onActuatorNameClickHandler(param1:MouseEvent) : void
      {
         this.reinitActuatorUI = false;
         var _loc2_:RenameActuatorUI = new RenameActuatorUI();
         _loc2_.refreshActuator = this.reinitActuator;
         _loc2_.actuator = this._actuator;
         _loc2_.width = 335;
         _loc2_.height = 120;
         var _loc3_:Point = this.actuatorLabel.localToGlobal(new Point(this.actuatorLabel.width / 2,this.actuatorLabel.height));
         var _loc4_:Number = Number(Application.application.width);
         if(_loc3_.x + _loc2_.width / 2 > _loc4_)
         {
            _loc2_.x = Application.application.width - _loc2_.width - 5;
            _loc2_.arrowXPosition = _loc2_.width / 2 + (_loc3_.x + _loc2_.width / 2 - _loc4_);
         }
         else if(_loc3_.x - _loc2_.width / 2 < 0)
         {
            _loc2_.x = 5;
            _loc2_.arrowXPosition = _loc2_.width / 2 + (_loc3_.x - _loc2_.width / 2);
         }
         else
         {
            _loc2_.x = _loc3_.x - _loc2_.width / 2;
            _loc2_.arrowXPosition = _loc2_.width / 2;
         }
         _loc2_.y = _loc3_.y + 17;
         KCPopupManager.singleton.displayPopup(_loc2_);
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
      
      public function set actuatorImageButton(param1:Button) : void
      {
         var _loc2_:Object = this._1689631564actuatorImageButton;
         if(_loc2_ !== param1)
         {
            this._1689631564actuatorImageButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorImageButton",_loc2_,param1));
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
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         addEventListener(FlexEvent.DATA_CHANGE,this.dataChangedHandler);
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      protected function actuatorImageButtonClickHandler(param1:MouseEvent) : void
      {
         this.reinitActuatorUI = false;
         var _loc2_:IdentifyOrDeleteActuatorUI = new IdentifyOrDeleteActuatorUI();
         _loc2_.actuator = this._actuator;
         _loc2_.refreshActuator = this.reinitActuator;
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      private function _ActuatorsTileListRenderer_bindingsSetup() : Array
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
      
      [Bindable(event="propertyChange")]
      public function get actuatorLabel() : Text
      {
         return this._1832466555actuatorLabel;
      }
   }
}
