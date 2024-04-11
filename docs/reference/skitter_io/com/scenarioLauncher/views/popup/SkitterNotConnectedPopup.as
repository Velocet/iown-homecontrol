package com.scenarioLauncher.views.popup
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.utils.GB;
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
   import mx.binding.*;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class SkitterNotConnectedPopup extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _20591652btnOKSkitterVersionPb:Button;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml__273023564:Class;
      
      private var _1575658594lbSkitterVersionPb:Text;
      
      mx_internal var _bindings:Array;
      
      private var _1047265588skitterVersionPb:VBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function SkitterNotConnectedPopup()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":432,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "id":"skitterVersionPb",
                     "stylesFactory":function():void
                     {
                        this.horizontalAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":7};
                              }
                           }),new UIComponentDescriptor({
                              "type":Image,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__273023564,
                                    "x":183,
                                    "y":20,
                                    "width":29
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":17};
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"lbSkitterVersionPb",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"lbSkitterVersionPb",
                                    "percentWidth":100,
                                    "styleName":"VR18BCL0",
                                    "x":15,
                                    "y":76
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":5};
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"btnOKSkitterVersionPb",
                              "events":{"click":"__btnOKSkitterVersionPb_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "name":"btnOKSkitterVersionPb",
                                    "styleName":"btnValidate",
                                    "buttonMode":true,
                                    "useHandCursor":true,
                                    "minWidth":113,
                                    "height":24
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__273023564 = SkitterNotConnectedPopup__embed_mxml__273023564;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 432;
         this.minHeight = 250;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         SkitterNotConnectedPopup._watcherSetupUtil = param1;
      }
      
      public function set lbSkitterVersionPb(param1:Text) : void
      {
         var _loc2_:Object = this._1575658594lbSkitterVersionPb;
         if(_loc2_ !== param1)
         {
            this._1575658594lbSkitterVersionPb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSkitterVersionPb",_loc2_,param1));
         }
      }
      
      private function _SkitterNotConnectedPopup_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterVersionPb.verticalScrollPolicy = param1;
         },"skitterVersionPb.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterVersionPb.horizontalScrollPolicy = param1;
         },"skitterVersionPb.horizontalScrollPolicy");
         result[1] = binding;
         return result;
      }
      
      public function set btnOKSkitterVersionPb(param1:Button) : void
      {
         var _loc2_:Object = this._20591652btnOKSkitterVersionPb;
         if(_loc2_ !== param1)
         {
            this._20591652btnOKSkitterVersionPb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOKSkitterVersionPb",_loc2_,param1));
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
      }
      
      private function btnNOSkitterVersionPbClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function __btnOKSkitterVersionPb_click(param1:MouseEvent) : void
      {
         this.btnOKSkitterVersionPbClickHandler(param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:SkitterNotConnectedPopup = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._SkitterNotConnectedPopup_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_popup_SkitterNotConnectedPopupWatcherSetupUtil");
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
      public function get skitterVersionPb() : VBox
      {
         return this._1047265588skitterVersionPb;
      }
      
      public function set skitterVersionPb(param1:VBox) : void
      {
         var _loc2_:Object = this._1047265588skitterVersionPb;
         if(_loc2_ !== param1)
         {
            this._1047265588skitterVersionPb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterVersionPb",_loc2_,param1));
         }
      }
      
      private function _SkitterNotConnectedPopup_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKSkitterVersionPb() : Button
      {
         return this._20591652btnOKSkitterVersionPb;
      }
      
      private function btnOKSkitterVersionPbClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
         ServerCommunicationManager.instance.actuatorsList.refresh();
      }
      
      override protected function initLabels() : void
      {
         if(this.lbSkitterVersionPb.htmlText == "")
         {
            if(this.lbSkitterVersionPb != null)
            {
               this.lbSkitterVersionPb.htmlText = resourceManager.getString("installation","MSG_SKITTER_NOT_CONNECTED");
            }
            if(this.btnOKSkitterVersionPb != null)
            {
               this.btnOKSkitterVersionPb.label = resourceManager.getString("common","BTN_OK");
            }
         }
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         GB.triggerGC();
         super.closeHandler(param1);
      }
      
      override protected function refreshUI() : void
      {
         this.width = 384;
         super.refreshUI();
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         ServerCommunicationManager.instance.stopRepeatIndentifyActuator();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSkitterVersionPb() : Text
      {
         return this._1575658594lbSkitterVersionPb;
      }
   }
}
