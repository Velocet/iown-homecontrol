package com.scenarioLauncher.views
{
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
   import ioService.datamodel.Skitter;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.TextInput;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class RenameSkittyUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _skitter:Skitter;
      
      private var _arrow:Sprite;
      
      mx_internal var _watchers:Array;
      
      private var guiInitialized:Boolean = false;
      
      private var _701851177_arrowXPosition:Number;
      
      private var _1545701967renameSkittyUINewName:TextInput;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _709116980renameSkittyUICANCEL:Button;
      
      private var _tempName:String;
      
      private var _449767274renameSkittyUIOK:Button;
      
      private var _validateFunction:Function;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1073154334renameSkittyCanvas:Canvas;
      
      public function RenameSkittyUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"renameSkittyCanvas",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":TextInput,
                           "id":"renameSkittyUINewName",
                           "stylesFactory":function():void
                           {
                              this.horizontalCenter = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"renameSkittyUINewName",
                                 "styleName":"VR18BCP",
                                 "y":0,
                                 "width":290
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"renameSkittyUIOK",
                           "events":{"click":"__renameSkittyUIOK_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"renameSkittyUIOK",
                                 "styleName":"btnValidate",
                                 "x":35,
                                 "width":113,
                                 "buttonMode":true,
                                 "useHandCursor":true
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"renameSkittyUICANCEL",
                           "events":{"click":"__renameSkittyUICANCEL_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"renameSkittyUICANCEL",
                                 "styleName":"btnCancel",
                                 "x":185,
                                 "width":113,
                                 "buttonMode":true,
                                 "useHandCursor":true
                              };
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
         RenameSkittyUI._watcherSetupUtil = param1;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RenameSkittyUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RenameSkittyUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_RenameSkittyUIWatcherSetupUtil");
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
      
      public function set validateFunction(param1:Function) : void
      {
         this._validateFunction = param1;
      }
      
      public function __renameSkittyUICANCEL_click(param1:MouseEvent) : void
      {
         this.onSkittyActuatorUICANCELClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get renameSkittyCanvas() : Canvas
      {
         return this._1073154334renameSkittyCanvas;
      }
      
      private function _RenameSkittyUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = Globals.SKITTER_NAME_MAX_CHAR;
         _loc1_ = this.renameSkittyUINewName.y + this.renameSkittyUINewName.height + 15;
         _loc1_ = this.renameSkittyUINewName.y + this.renameSkittyUINewName.height + 15;
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
      
      public function init(param1:Skitter, param2:String) : void
      {
         this._skitter = param1;
         this._tempName = param2;
         this.refreshGUI();
      }
      
      [Bindable(event="propertyChange")]
      public function get renameSkittyUIOK() : Button
      {
         return this._449767274renameSkittyUIOK;
      }
      
      override protected function initLabels() : void
      {
         if(this.renameSkittyUIOK != null)
         {
            this.renameSkittyUIOK.label = resourceManager.getString("common","BTN_OK");
         }
         if(this.renameSkittyUICANCEL != null)
         {
            this.renameSkittyUICANCEL.label = resourceManager.getString("remotes","BTN_RENAME_CANCEL");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get renameSkittyUINewName() : TextInput
      {
         return this._1545701967renameSkittyUINewName;
      }
      
      [Bindable(event="propertyChange")]
      public function get renameSkittyUICANCEL() : Button
      {
         return this._709116980renameSkittyUICANCEL;
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
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.drawArrow();
         this.guiInitialized = true;
         this.refreshGUI();
      }
      
      public function get arrowXPosition() : Number
      {
         return this._arrowXPosition;
      }
      
      public function set renameSkittyUIOK(param1:Button) : void
      {
         var _loc2_:Object = this._449767274renameSkittyUIOK;
         if(_loc2_ !== param1)
         {
            this._449767274renameSkittyUIOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameSkittyUIOK",_loc2_,param1));
         }
      }
      
      public function set renameSkittyCanvas(param1:Canvas) : void
      {
         var _loc2_:Object = this._1073154334renameSkittyCanvas;
         if(_loc2_ !== param1)
         {
            this._1073154334renameSkittyCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameSkittyCanvas",_loc2_,param1));
         }
      }
      
      private function _RenameSkittyUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            renameSkittyCanvas.verticalScrollPolicy = param1;
         },"renameSkittyCanvas.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            renameSkittyCanvas.horizontalScrollPolicy = param1;
         },"renameSkittyCanvas.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():int
         {
            return Globals.SKITTER_NAME_MAX_CHAR;
         },function(param1:int):void
         {
            renameSkittyUINewName.maxChars = param1;
         },"renameSkittyUINewName.maxChars");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            renameSkittyUIOK.y = param1;
         },"renameSkittyUIOK.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            renameSkittyUICANCEL.y = param1;
         },"renameSkittyUICANCEL.y");
         result[4] = binding;
         return result;
      }
      
      private function onSkittyActuatorUIOKClickHandler(param1:MouseEvent) : void
      {
         this._validateFunction(this.renameSkittyUINewName.text);
         closeHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      private function get _arrowXPosition() : Number
      {
         return this._701851177_arrowXPosition;
      }
      
      private function refreshGUI() : void
      {
         if(this.guiInitialized)
         {
            if(this._skitter != null)
            {
               if(this._tempName != "")
               {
                  this.renameSkittyUINewName.text = this._tempName;
               }
               else
               {
                  this.renameSkittyUINewName.text = this._skitter.name;
               }
            }
            else
            {
               this.renameSkittyUINewName.text = "";
            }
         }
      }
      
      public function set renameSkittyUINewName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1545701967renameSkittyUINewName;
         if(_loc2_ !== param1)
         {
            this._1545701967renameSkittyUINewName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameSkittyUINewName",_loc2_,param1));
         }
      }
      
      public function set renameSkittyUICANCEL(param1:Button) : void
      {
         var _loc2_:Object = this._709116980renameSkittyUICANCEL;
         if(_loc2_ !== param1)
         {
            this._709116980renameSkittyUICANCEL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameSkittyUICANCEL",_loc2_,param1));
         }
      }
      
      public function set arrowXPosition(param1:Number) : void
      {
         this._arrowXPosition = param1;
      }
      
      private function onSkittyActuatorUICANCELClickHandler(param1:MouseEvent) : void
      {
         closeHandler(param1);
      }
      
      public function __renameSkittyUIOK_click(param1:MouseEvent) : void
      {
         this.onSkittyActuatorUIOKClickHandler(param1);
      }
   }
}
