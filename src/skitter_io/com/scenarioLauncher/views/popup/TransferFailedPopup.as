package com.scenarioLauncher.views.popup
{
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
   
   public class TransferFailedPopup extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1100195425lbNewIOHomecontrolDiscoveryFailed:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      private var _571055605newIOHomecontrolDiscoveryFailed:VBox;
      
      private var _embed_mxml__801521088:Class;
      
      private var _605388403btnOKIOHomecontrolDiscoveryFailed:Button;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function TransferFailedPopup()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":432,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "id":"newIOHomecontrolDiscoveryFailed",
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
                              "type":Image,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__801521088,
                                    "x":31,
                                    "y":52,
                                    "width":29
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":7};
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"lbNewIOHomecontrolDiscoveryFailed",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"lbNewIOHomecontrolDiscoveryFailed",
                                    "percentWidth":100,
                                    "styleName":"VR18BCL0",
                                    "x":15,
                                    "y":49
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":15};
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"btnOKIOHomecontrolDiscoveryFailed",
                              "events":{"click":"__btnOKIOHomecontrolDiscoveryFailed_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "name":"btnOKIOHomecontrolDiscoveryFailed",
                                    "styleName":"btnValidate",
                                    "buttonMode":true,
                                    "useHandCursor":true,
                                    "x":140,
                                    "y":150,
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
         this._embed_mxml__801521088 = TransferFailedPopup__embed_mxml__801521088;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 432;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TransferFailedPopup._watcherSetupUtil = param1;
      }
      
      public function set btnOKIOHomecontrolDiscoveryFailed(param1:Button) : void
      {
         var _loc2_:Object = this._605388403btnOKIOHomecontrolDiscoveryFailed;
         if(_loc2_ !== param1)
         {
            this._605388403btnOKIOHomecontrolDiscoveryFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOKIOHomecontrolDiscoveryFailed",_loc2_,param1));
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKIOHomecontrolDiscoveryFailed() : Button
      {
         return this._605388403btnOKIOHomecontrolDiscoveryFailed;
      }
      
      private function btnOKIOHomecontrolDiscoveryFailedClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TransferFailedPopup = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._TransferFailedPopup_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_popup_TransferFailedPopupWatcherSetupUtil");
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
      public function get lbNewIOHomecontrolDiscoveryFailed() : Text
      {
         return this._1100195425lbNewIOHomecontrolDiscoveryFailed;
      }
      
      public function set lbNewIOHomecontrolDiscoveryFailed(param1:Text) : void
      {
         var _loc2_:Object = this._1100195425lbNewIOHomecontrolDiscoveryFailed;
         if(_loc2_ !== param1)
         {
            this._1100195425lbNewIOHomecontrolDiscoveryFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbNewIOHomecontrolDiscoveryFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newIOHomecontrolDiscoveryFailed() : VBox
      {
         return this._571055605newIOHomecontrolDiscoveryFailed;
      }
      
      public function set newIOHomecontrolDiscoveryFailed(param1:VBox) : void
      {
         var _loc2_:Object = this._571055605newIOHomecontrolDiscoveryFailed;
         if(_loc2_ !== param1)
         {
            this._571055605newIOHomecontrolDiscoveryFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newIOHomecontrolDiscoveryFailed",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         if(this.lbNewIOHomecontrolDiscoveryFailed != null)
         {
            this.lbNewIOHomecontrolDiscoveryFailed.htmlText = resourceManager.getString("installation","MSG_DISCOVERY_FAILED_FOR_NEW_2W");
         }
         if(this.btnOKIOHomecontrolDiscoveryFailed != null)
         {
            this.btnOKIOHomecontrolDiscoveryFailed.label = resourceManager.getString("common","BTN_OK");
         }
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         GB.triggerGC();
         super.closeHandler(param1);
      }
      
      private function _TransferFailedPopup_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
      }
      
      private function _TransferFailedPopup_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolDiscoveryFailed.verticalScrollPolicy = param1;
         },"newIOHomecontrolDiscoveryFailed.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolDiscoveryFailed.horizontalScrollPolicy = param1;
         },"newIOHomecontrolDiscoveryFailed.horizontalScrollPolicy");
         result[1] = binding;
         return result;
      }
      
      public function __btnOKIOHomecontrolDiscoveryFailed_click(param1:MouseEvent) : void
      {
         this.btnOKIOHomecontrolDiscoveryFailedClickHandler(param1);
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
      }
      
      override protected function refreshUI() : void
      {
         this.width = 384;
         super.refreshUI();
      }
   }
}
