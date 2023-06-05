package com.scenarioLauncher.views
{
   import com.scenarioLauncher.managers.CookieManager;
   import com.scenarioLauncher.managers.UpdaterManager;
   import com.scenarioLauncher.views.common.CustomCanvas;
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
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class MainUIFooter extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1812259351startUpdateLabel:Text;
      
      private var _612735267startUpdateButton:HBox;
      
      private var _2046293082StartUpdateUp:Class;
      
      mx_internal var _watchers:Array;
      
      private var _217795817productVersion:Text;
      
      private var _embed_mxml__1436356814:Class;
      
      private var _607200031StartUpdateOver:Class;
      
      private var _1813014581startUpdate:Image;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1491817446productName:Text;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function MainUIFooter()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__1436356814,
                        "width":13,
                        "height":13,
                        "x":30,
                        "y":17
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "id":"productName",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "selectable":false,
                        "name":"productName",
                        "styleName":"VB15WC",
                        "x":44,
                        "y":11
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "selectable":false,
                        "styleName":"VR12WC",
                        "x":150,
                        "y":14,
                        "text":"- "
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Text,
                  "id":"productVersion",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "selectable":false,
                        "name":"productVersion",
                        "styleName":"VR12WC",
                        "x":160,
                        "y":14
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "id":"startUpdateButton",
                  "events":{
                     "mouseOver":"__startUpdateButton_mouseOver",
                     "mouseOut":"__startUpdateButton_mouseOut",
                     "click":"__startUpdateButton_click"
                  },
                  "stylesFactory":function():void
                  {
                     this.verticalAlign = "middle";
                     this.backgroundColor = 0;
                     this.backgroundAlpha = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"startUpdateButton",
                        "includeInLayout":false,
                        "visible":false,
                        "x":208,
                        "y":12,
                        "mouseEnabled":true,
                        "useHandCursor":true,
                        "buttonMode":true,
                        "mouseChildren":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "styleName":"VR12WC",
                                 "text":"-"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Image,
                           "id":"startUpdate",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"startUpdate",
                                 "styleName":"startUpdate"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"startUpdateLabel",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "name":"startUpdateLabel",
                                 "styleName":"VB12WC"
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._2046293082StartUpdateUp = MainUIFooter_StartUpdateUp;
         this._607200031StartUpdateOver = MainUIFooter_StartUpdateOver;
         this._embed_mxml__1436356814 = MainUIFooter__embed_mxml__1436356814;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MainUIFooter._watcherSetupUtil = param1;
      }
      
      protected function startUpdateButtonMouseOutHandler(param1:MouseEvent) : void
      {
         this.startUpdate.source = this.StartUpdateUp;
         this.startUpdateLabel.styleName = "VB12WC";
      }
      
      [Bindable(event="propertyChange")]
      public function get productName() : Text
      {
         return this._1491817446productName;
      }
      
      protected function startUpdateButtonClickHandler(param1:MouseEvent) : void
      {
         UpdaterManager.instance.updateRequired();
      }
      
      public function set startUpdate(param1:Image) : void
      {
         var _loc2_:Object = this._1813014581startUpdate;
         if(_loc2_ !== param1)
         {
            this._1813014581startUpdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startUpdate",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get StartUpdateUp() : Class
      {
         return this._2046293082StartUpdateUp;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MainUIFooter = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._MainUIFooter_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_MainUIFooterWatcherSetupUtil");
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
      
      public function displayStartUpdate() : void
      {
         this.startUpdateButton.includeInLayout = true;
         this.startUpdateButton.visible = true;
      }
      
      [Bindable(event="propertyChange")]
      private function get StartUpdateOver() : Class
      {
         return this._607200031StartUpdateOver;
      }
      
      override protected function initLabels() : void
      {
         this.productName.text = resourceManager.getString("common","PRODUCT_NAME");
         this.productVersion.text = "V " + CookieManager.instance.getVersion();
         this.startUpdateLabel.htmlText = resourceManager.getString("updaters","MSG_START_UPDATE");
      }
      
      public function hideStartUpdate() : void
      {
         this.startUpdateButton.includeInLayout = false;
         this.startUpdateButton.visible = false;
      }
      
      public function set productName(param1:Text) : void
      {
         var _loc2_:Object = this._1491817446productName;
         if(_loc2_ !== param1)
         {
            this._1491817446productName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productName",_loc2_,param1));
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
      }
      
      public function set startUpdateButton(param1:HBox) : void
      {
         var _loc2_:Object = this._612735267startUpdateButton;
         if(_loc2_ !== param1)
         {
            this._612735267startUpdateButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startUpdateButton",_loc2_,param1));
         }
      }
      
      private function set StartUpdateOver(param1:Class) : void
      {
         var _loc2_:Object = this._607200031StartUpdateOver;
         if(_loc2_ !== param1)
         {
            this._607200031StartUpdateOver = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"StartUpdateOver",_loc2_,param1));
         }
      }
      
      public function __startUpdateButton_click(param1:MouseEvent) : void
      {
         this.startUpdateButtonClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get startUpdate() : Image
      {
         return this._1813014581startUpdate;
      }
      
      private function _MainUIFooter_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.StartUpdateUp;
      }
      
      public function set productVersion(param1:Text) : void
      {
         var _loc2_:Object = this._217795817productVersion;
         if(_loc2_ !== param1)
         {
            this._217795817productVersion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productVersion",_loc2_,param1));
         }
      }
      
      private function set StartUpdateUp(param1:Class) : void
      {
         var _loc2_:Object = this._2046293082StartUpdateUp;
         if(_loc2_ !== param1)
         {
            this._2046293082StartUpdateUp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"StartUpdateUp",_loc2_,param1));
         }
      }
      
      public function __startUpdateButton_mouseOver(param1:MouseEvent) : void
      {
         this.startUpdateButtonMouseOverHandler(param1);
      }
      
      public function set startUpdateLabel(param1:Text) : void
      {
         var _loc2_:Object = this._1812259351startUpdateLabel;
         if(_loc2_ !== param1)
         {
            this._1812259351startUpdateLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startUpdateLabel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startUpdateButton() : HBox
      {
         return this._612735267startUpdateButton;
      }
      
      private function _MainUIFooter_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return StartUpdateUp;
         },function(param1:Object):void
         {
            startUpdate.source = param1;
         },"startUpdate.source");
         result[0] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get productVersion() : Text
      {
         return this._217795817productVersion;
      }
      
      public function __startUpdateButton_mouseOut(param1:MouseEvent) : void
      {
         this.startUpdateButtonMouseOutHandler(param1);
      }
      
      protected function startUpdateButtonMouseOverHandler(param1:MouseEvent) : void
      {
         this.startUpdate.source = this.StartUpdateOver;
         this.startUpdateLabel.styleName = "VB12GC";
      }
      
      [Bindable(event="propertyChange")]
      public function get startUpdateLabel() : Text
      {
         return this._1812259351startUpdateLabel;
      }
   }
}
