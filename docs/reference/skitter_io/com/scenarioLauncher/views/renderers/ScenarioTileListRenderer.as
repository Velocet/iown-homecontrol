package com.scenarioLauncher.views.renderers
{
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
   import ioService.datamodel.Scenario;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Image;
   import mx.controls.LinkButton;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class ScenarioTileListRenderer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _ScenarioTileListRenderer_Text1:Text;
      
      mx_internal var _watchers:Array;
      
      private var guiInitialized:Boolean = false;
      
      private var dataChanged:Boolean = false;
      
      private var _1197736021scenarioImage:Image;
      
      private var _1469999309_visible:Boolean = true;
      
      private var _1472470539_label:String;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1156991773scenarioImageCanvas:HBox;
      
      private var _1166973251scenarioImageButton:LinkButton;
      
      private var _594782856enableHandCursor:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      private var _scenario:Scenario;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ScenarioTileListRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"scenarioImageButton",
                           "stylesFactory":function():void
                           {
                              this.horizontalCenter = "0";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "buttonMode":true,
                                 "styleName":"default",
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
                  "type":HBox,
                  "id":"scenarioImageCanvas",
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0,
                        "height":72,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Image,
                           "id":"scenarioImage",
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                              this.verticalAlign = "middle";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "buttonMode":true,
                                 "width":72,
                                 "height":72
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "id":"_ScenarioTileListRenderer_Text1",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "selectable":false,
                        "width":96,
                        "y":82,
                        "styleName":"VR12WCL0"
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
         this.addEventListener("creationComplete",this.___ScenarioTileListRenderer_Canvas1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ScenarioTileListRenderer._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get enableHandCursor() : Boolean
      {
         return this._594782856enableHandCursor;
      }
      
      private function _ScenarioTileListRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Boolean
         {
            return enableHandCursor;
         },function(param1:Boolean):void
         {
            scenarioImageButton.useHandCursor = param1;
         },"scenarioImageButton.useHandCursor");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            scenarioImageButton.visible = param1;
         },"scenarioImageButton.visible");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return width;
         },function(param1:Number):void
         {
            scenarioImageCanvas.width = param1;
         },"scenarioImageCanvas.width");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return enableHandCursor;
         },function(param1:Boolean):void
         {
            scenarioImage.useHandCursor = param1;
         },"scenarioImage.useHandCursor");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ScenarioTileListRenderer_Text1.htmlText = param1;
         },"_ScenarioTileListRenderer_Text1.htmlText");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            _ScenarioTileListRenderer_Text1.visible = param1;
         },"_ScenarioTileListRenderer_Text1.visible");
         result[5] = binding;
         return result;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ScenarioTileListRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ScenarioTileListRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_renderers_ScenarioTileListRendererWatcherSetupUtil");
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
      public function get scenarioImage() : Image
      {
         return this._1197736021scenarioImage;
      }
      
      [Bindable(event="propertyChange")]
      private function get _visible() : Boolean
      {
         return this._1469999309_visible;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioImageButton() : LinkButton
      {
         return this._1166973251scenarioImageButton;
      }
      
      private function _ScenarioTileListRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.enableHandCursor;
         _loc1_ = this._visible;
         _loc1_ = width;
         _loc1_ = this.enableHandCursor;
         _loc1_ = this._label;
         _loc1_ = this._visible;
      }
      
      public function set scenarioImageCanvas(param1:HBox) : void
      {
         var _loc2_:Object = this._1156991773scenarioImageCanvas;
         if(_loc2_ !== param1)
         {
            this._1156991773scenarioImageCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioImageCanvas",_loc2_,param1));
         }
      }
      
      private function dataChangedHandler(param1:FlexEvent) : void
      {
         this.dataChanged = true;
         invalidateProperties();
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:File = null;
         super.commitProperties();
         if(this.dataChanged && this.guiInitialized)
         {
            this.dataChanged = false;
            if(this._scenario != null)
            {
               this._visible = true;
               this._label = this._scenario.name;
               _loc1_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this._scenario.id + ".png");
               if(_loc1_.exists)
               {
                  this.scenarioImage.source = null;
                  this.scenarioImageButton.visible = false;
                  this.scenarioImageCanvas.visible = true;
                  this.scenarioImage.source = _loc1_.nativePath;
               }
               else
               {
                  this.scenarioImageButton.visible = true;
                  this.scenarioImageCanvas.visible = false;
               }
            }
            else if(this.scenarioImageButton)
            {
               this._visible = false;
            }
         }
      }
      
      public function set scenarioImage(param1:Image) : void
      {
         var _loc2_:Object = this._1197736021scenarioImage;
         if(_loc2_ !== param1)
         {
            this._1197736021scenarioImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioImage",_loc2_,param1));
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._scenario = param1 as Scenario;
         this.dataChanged = true;
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioImageCanvas() : HBox
      {
         return this._1156991773scenarioImageCanvas;
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
      
      private function set _label(param1:String) : void
      {
         var _loc2_:Object = this._1472470539_label;
         if(_loc2_ !== param1)
         {
            this._1472470539_label = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_label",_loc2_,param1));
         }
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         this.guiInitialized = true;
         addEventListener(FlexEvent.DATA_CHANGE,this.dataChangedHandler);
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      public function set scenarioImageButton(param1:LinkButton) : void
      {
         var _loc2_:Object = this._1166973251scenarioImageButton;
         if(_loc2_ !== param1)
         {
            this._1166973251scenarioImageButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioImageButton",_loc2_,param1));
         }
      }
      
      public function ___ScenarioTileListRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
   }
}
