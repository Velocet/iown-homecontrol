package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.model.Globals;
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
   import ioService.datamodel.Actuator;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.TextInput;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class RenameActuatorUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _197719076actuatorName:TextInput;
      
      private var _arrow:Sprite;
      
      mx_internal var _watchers:Array;
      
      private var guiInitialized:Boolean = false;
      
      private var actuatorOldName:String;
      
      private var _701851177_arrowXPosition:Number;
      
      private var _refreshActuator:Function;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _actuator:Actuator;
      
      private var _1703153366mainViewStack:ViewStack;
      
      private var _1742746011renameActuatorUICANCEL:Button;
      
      private var _1092523121renameActuatorCanvas:Canvas;
      
      private var _1350343865renameActuatorUIOK:Button;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function RenameActuatorUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"mainViewStack",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "creationPolicy":"all",
                        "resizeToContent":true,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"renameActuatorCanvas",
                           "propertiesFactory":function():Object
                           {
                              return {"childDescriptors":[new UIComponentDescriptor({
                                 "type":TextInput,
                                 "id":"actuatorName",
                                 "stylesFactory":function():void
                                 {
                                    this.horizontalCenter = "0";
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "name":"renameActuatorUINewName",
                                       "styleName":"VR18BCP",
                                       "y":0,
                                       "width":290
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "id":"renameActuatorUIOK",
                                 "events":{"click":"__renameActuatorUIOK_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "cacheAsBitmap":false,
                                       "name":"renameActuatorUIOK",
                                       "styleName":"btnValidate",
                                       "x":35,
                                       "width":113,
                                       "buttonMode":true,
                                       "useHandCursor":true
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "id":"renameActuatorUICANCEL",
                                 "events":{"click":"__renameActuatorUICANCEL_click"},
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "cacheAsBitmap":false,
                                       "name":"renameActuatorUICANCEL",
                                       "styleName":"btnCancel",
                                       "x":185,
                                       "width":113,
                                       "buttonMode":true,
                                       "useHandCursor":true
                                    };
                                 }
                              })]};
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
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RenameActuatorUI._watcherSetupUtil = param1;
      }
      
      public function __renameActuatorUICANCEL_click(param1:MouseEvent) : void
      {
         this.onRenameActuatorUICANCELClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get renameActuatorCanvas() : Canvas
      {
         return this._1092523121renameActuatorCanvas;
      }
      
      private function _RenameActuatorUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = Globals.ACTUATOR_NAME_MAX_CHAR;
         _loc1_ = this.actuatorName.y + this.actuatorName.height + 15;
         _loc1_ = this.actuatorName.y + this.actuatorName.height + 15;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RenameActuatorUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RenameActuatorUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_RenameActuatorUIWatcherSetupUtil");
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
      
      override protected function createChildren() : void
      {
         this.setStyle("paddingLeft",5);
         this.setStyle("paddingRight",5);
         super.createChildren();
      }
      
      public function set renameActuatorUIOK(param1:Button) : void
      {
         var _loc2_:Object = this._1350343865renameActuatorUIOK;
         if(_loc2_ !== param1)
         {
            this._1350343865renameActuatorUIOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameActuatorUIOK",_loc2_,param1));
         }
      }
      
      public function set renameActuatorCanvas(param1:Canvas) : void
      {
         var _loc2_:Object = this._1092523121renameActuatorCanvas;
         if(_loc2_ !== param1)
         {
            this._1092523121renameActuatorCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameActuatorCanvas",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorName() : TextInput
      {
         return this._197719076actuatorName;
      }
      
      private function drawArrow() : void
      {
         var _loc1_:Number = 25;
         if(this._arrow == null)
         {
            this._arrow = new Sprite();
            this._arrow.graphics.clear();
            this._arrow.graphics.beginFill(16777215,1);
            this._arrow.graphics.lineTo(0,_loc1_);
            this._arrow.graphics.lineTo(12,_loc1_);
            this._arrow.graphics.lineTo(0,0);
            this._arrow.graphics.endFill();
            this._arrow.y = -_loc1_;
            this._arrow.x = this._arrowXPosition;
         }
         this.rawChildren.addChild(this._arrow);
      }
      
      [Bindable(event="propertyChange")]
      public function get mainViewStack() : ViewStack
      {
         return this._1703153366mainViewStack;
      }
      
      private function set _arrowXPosition(param1:Number) : void
      {
         var _loc2_:Object = this._701851177_arrowXPosition;
         if(_loc2_ !== param1)
         {
            this._701851177_arrowXPosition = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_arrowXPosition",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         if(this._refreshActuator != null)
         {
            this._refreshActuator();
         }
         super.closeHandler(param1);
      }
      
      override protected function initLabels() : void
      {
         if(this.renameActuatorUIOK != null)
         {
            this.renameActuatorUIOK.label = resourceManager.getString("installation","BTN_RENAME_VALIDATE");
         }
         if(this.renameActuatorUICANCEL != null)
         {
            this.renameActuatorUICANCEL.label = resourceManager.getString("remotes","BTN_RENAME_CANCEL");
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.guiInitialized = true;
         this.drawArrow();
         this.refreshGUI();
      }
      
      public function get arrowXPosition() : Number
      {
         return this._arrowXPosition;
      }
      
      private function _RenameActuatorUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            renameActuatorCanvas.verticalScrollPolicy = param1;
         },"renameActuatorCanvas.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            renameActuatorCanvas.horizontalScrollPolicy = param1;
         },"renameActuatorCanvas.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():int
         {
            return Globals.ACTUATOR_NAME_MAX_CHAR;
         },function(param1:int):void
         {
            actuatorName.maxChars = param1;
         },"actuatorName.maxChars");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            renameActuatorUIOK.y = param1;
         },"renameActuatorUIOK.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            renameActuatorUICANCEL.y = param1;
         },"renameActuatorUICANCEL.y");
         result[4] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get renameActuatorUIOK() : Button
      {
         return this._1350343865renameActuatorUIOK;
      }
      
      private function onRenameActuatorUIOKClickHandler(param1:MouseEvent) : void
      {
         if(this.actuatorName.text != "")
         {
            if(this._actuator != null && this._actuator.name != this.actuatorName.text)
            {
               this.closeHandler();
               this.actuatorName.enabled = false;
               this.renameActuatorUIOK.enabled = false;
               DialogsManager.showRadioInProgressPopup(this._actuator);
               ServerCommunicationManager.instance.setActuatorName(this.actuator,this.actuatorName.text);
            }
            else
            {
               this.closeHandler();
            }
         }
      }
      
      private function onBtnOkRenameActuatorErrorClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function set actuatorName(param1:TextInput) : void
      {
         var _loc2_:Object = this._197719076actuatorName;
         if(_loc2_ !== param1)
         {
            this._197719076actuatorName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorName",_loc2_,param1));
         }
      }
      
      public function set renameActuatorUICANCEL(param1:Button) : void
      {
         var _loc2_:Object = this._1742746011renameActuatorUICANCEL;
         if(_loc2_ !== param1)
         {
            this._1742746011renameActuatorUICANCEL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameActuatorUICANCEL",_loc2_,param1));
         }
      }
      
      public function set mainViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1703153366mainViewStack;
         if(_loc2_ !== param1)
         {
            this._1703153366mainViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStack",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _arrowXPosition() : Number
      {
         return this._701851177_arrowXPosition;
      }
      
      [Bindable(event="propertyChange")]
      public function get renameActuatorUICANCEL() : Button
      {
         return this._1742746011renameActuatorUICANCEL;
      }
      
      private function onRenameActuatorUICANCELClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      private function refreshGUI() : void
      {
         if(this.guiInitialized)
         {
            if(this._actuator != null)
            {
               this.actuatorName.setFocus();
               this.actuatorName.text = this._actuator.name;
               this.actuatorName.setSelection(this.actuatorName.text.length,this.actuatorName.text.length);
            }
            else
            {
               this.actuatorName.text = "";
            }
         }
      }
      
      public function set refreshActuator(param1:Function) : void
      {
         this._refreshActuator = param1;
      }
      
      public function __renameActuatorUIOK_click(param1:MouseEvent) : void
      {
         this.onRenameActuatorUIOKClickHandler(param1);
      }
      
      public function set actuator(param1:Actuator) : void
      {
         this._actuator = param1;
         this.refreshGUI();
      }
      
      public function get refreshActuator() : Function
      {
         return this._refreshActuator;
      }
      
      public function set arrowXPosition(param1:Number) : void
      {
         this._arrowXPosition = param1;
      }
      
      public function get actuator() : Actuator
      {
         return this._actuator;
      }
   }
}
