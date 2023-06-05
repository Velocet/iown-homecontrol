package com.scenarioLauncher.components
{
   import com.scenarioLauncher.model.Globals;
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
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class HelpMySpace extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _2084456067goToMySpaceLabel:String;
      
      mx_internal var _watchers:Array;
      
      private var _530004280mainContainer:VBox;
      
      private var _1870027693titleBox:HBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _935240181topicTitleLabel:Text;
      
      mx_internal var _bindings:Array;
      
      public function HelpMySpace()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "id":"mainContainer",
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 87;
                     this.paddingTop = 17;
                     this.paddingRight = 30;
                     this.paddingBottom = 5;
                     this.verticalGap = 10;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":97,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "id":"titleBox",
                           "stylesFactory":function():void
                           {
                              this.verticalAlign = "middle";
                              this.horizontalAlign = "left";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "verticalScrollPolicy":"off",
                                 "horizontalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function():void
                                    {
                                       this.backgroundColor = 16758037;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":9,
                                          "height":9
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"topicTitleLabel",
                                    "events":{"click":"__topicTitleLabel_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "styleName":"helpTopic",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "mouseChildren":false,
                                          "percentWidth":100
                                       };
                                    }
                                 })]
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
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         HelpMySpace._watcherSetupUtil = param1;
      }
      
      private function set goToMySpaceLabel(param1:String) : void
      {
         var _loc2_:Object = this._2084456067goToMySpaceLabel;
         if(_loc2_ !== param1)
         {
            this._2084456067goToMySpaceLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"goToMySpaceLabel",_loc2_,param1));
         }
      }
      
      private function initLabel() : void
      {
         this.goToMySpaceLabel = "<u>" + resourceManager.getString("help","HELP_MY_SPACE") + "</u>";
      }
      
      [Bindable(event="propertyChange")]
      public function get mainContainer() : VBox
      {
         return this._530004280mainContainer;
      }
      
      [Bindable(event="propertyChange")]
      public function get topicTitleLabel() : Text
      {
         return this._935240181topicTitleLabel;
      }
      
      override protected function resourcesChanged() : void
      {
         this.initLabel();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:HelpMySpace = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._HelpMySpace_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_components_HelpMySpaceWatcherSetupUtil");
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
      public function get titleBox() : HBox
      {
         return this._1870027693titleBox;
      }
      
      protected function text1_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = null;
         _loc2_ = new URLRequest();
         _loc2_.url = resourceManager.getString("system","SOMFY_WEBSITE_URL");
         if(!_loc2_.url)
         {
            _loc2_.url = Globals.SOMFY_WEBSITE__DEFAULT_URL;
         }
         navigateToURL(_loc2_);
      }
      
      private function _HelpMySpace_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.goToMySpaceLabel;
      }
      
      public function set topicTitleLabel(param1:Text) : void
      {
         var _loc2_:Object = this._935240181topicTitleLabel;
         if(_loc2_ !== param1)
         {
            this._935240181topicTitleLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topicTitleLabel",_loc2_,param1));
         }
      }
      
      public function set mainContainer(param1:VBox) : void
      {
         var _loc2_:Object = this._530004280mainContainer;
         if(_loc2_ !== param1)
         {
            this._530004280mainContainer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainContainer",_loc2_,param1));
         }
      }
      
      private function _HelpMySpace_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = goToMySpaceLabel;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            topicTitleLabel.htmlText = param1;
         },"topicTitleLabel.htmlText");
         result[0] = binding;
         return result;
      }
      
      public function __topicTitleLabel_click(param1:MouseEvent) : void
      {
         this.text1_clickHandler(param1);
      }
      
      public function set titleBox(param1:HBox) : void
      {
         var _loc2_:Object = this._1870027693titleBox;
         if(_loc2_ !== param1)
         {
            this._1870027693titleBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleBox",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get goToMySpaceLabel() : String
      {
         return this._2084456067goToMySpaceLabel;
      }
   }
}
