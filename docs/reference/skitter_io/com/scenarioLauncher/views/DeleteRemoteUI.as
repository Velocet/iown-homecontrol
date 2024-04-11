package com.scenarioLauncher.views
{
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
   import mx.containers.HBox;
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
   
   public class DeleteRemoteUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _2119673835msgRemoteDeletion:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      private var _936211840btnValidateDeletion:Button;
      
      private var _embed_mxml__871617048:Class;
      
      private var _210824831_skitter:Skitter;
      
      private var _896357860btnCancelDeletion:Button;
      
      private var _validateFunction:Function;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      mx_internal var _bindings:Array;
      
      public function DeleteRemoteUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":384,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "stylesFactory":function():void
                     {
                        this.horizontalAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "horizontalScrollPolicy":"off",
                           "verticalScrollPolicy":"off",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":10};
                              }
                           }),new UIComponentDescriptor({
                              "type":Image,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__871617048,
                                    "width":55,
                                    "height":55
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
                              "id":"msgRemoteDeletion",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"msgRemoteDeletion",
                                    "styleName":"VR18BC",
                                    "percentWidth":100
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":17};
                              }
                           }),new UIComponentDescriptor({
                              "type":HBox,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":88,
                                    "horizontalScrollPolicy":"off",
                                    "verticalScrollPolicy":"off",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":50,
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnValidateDeletion",
                                                "events":{"click":"__btnValidateDeletion_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnValidateDeletion",
                                                      "styleName":"btnValidate",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "x":51,
                                                      "y":234,
                                                      "width":113
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":50,
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnCancelDeletion",
                                                "events":{"click":"__btnCancelDeletion_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnCancelDeletion",
                                                      "styleName":"btnCancel",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "x":221,
                                                      "y":234,
                                                      "width":113
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__871617048 = DeleteRemoteUI__embed_mxml__871617048;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 384;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         DeleteRemoteUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidateDeletion() : Button
      {
         return this._936211840btnValidateDeletion;
      }
      
      protected function btnValidateDeletionClickHandler(param1:MouseEvent) : void
      {
         if(this._validateFunction != null)
         {
            this._validateFunction(this._skitter);
         }
         this.close();
      }
      
      private function set _skitter(param1:Skitter) : void
      {
         var _loc2_:Object = this._210824831_skitter;
         if(_loc2_ !== param1)
         {
            this._210824831_skitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_skitter",_loc2_,param1));
         }
      }
      
      public function get remote() : Skitter
      {
         return this._skitter;
      }
      
      public function set btnCancelDeletion(param1:Button) : void
      {
         var _loc2_:Object = this._896357860btnCancelDeletion;
         if(_loc2_ !== param1)
         {
            this._896357860btnCancelDeletion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelDeletion",_loc2_,param1));
         }
      }
      
      public function set remote(param1:Skitter) : void
      {
         this._skitter = param1;
      }
      
      public function __btnCancelDeletion_click(param1:MouseEvent) : void
      {
         this.btnCancelDeletionClickHandler(param1);
      }
      
      public function set btnValidateDeletion(param1:Button) : void
      {
         var _loc2_:Object = this._936211840btnValidateDeletion;
         if(_loc2_ !== param1)
         {
            this._936211840btnValidateDeletion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnValidateDeletion",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:DeleteRemoteUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._DeleteRemoteUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_DeleteRemoteUIWatcherSetupUtil");
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
      
      private function _DeleteRemoteUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
      }
      
      [Bindable(event="propertyChange")]
      public function get msgRemoteDeletion() : Text
      {
         return this._2119673835msgRemoteDeletion;
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
      
      [Bindable(event="propertyChange")]
      public function get btnCancelDeletion() : Button
      {
         return this._896357860btnCancelDeletion;
      }
      
      protected function btnCancelDeletionClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      override protected function refreshUI() : void
      {
         super.refreshUI();
      }
      
      public function __btnValidateDeletion_click(param1:MouseEvent) : void
      {
         this.btnValidateDeletionClickHandler(param1);
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
      }
      
      private function close() : void
      {
         closeHandler();
      }
      
      public function set msgRemoteDeletion(param1:Text) : void
      {
         var _loc2_:Object = this._2119673835msgRemoteDeletion;
         if(_loc2_ !== param1)
         {
            this._2119673835msgRemoteDeletion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgRemoteDeletion",_loc2_,param1));
         }
      }
      
      private function _DeleteRemoteUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.verticalScrollPolicy = param1;
         },"this.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.horizontalScrollPolicy = param1;
         },"this.horizontalScrollPolicy");
         result[1] = binding;
         return result;
      }
      
      override protected function initLabels() : void
      {
         var _loc1_:String = null;
         if(this._skitter.name != "")
         {
            this.msgRemoteDeletion.htmlText = resourceManager.getString("remotes","MSG_DELETE_REMOTE",[this._skitter.name]);
         }
         else
         {
            _loc1_ = String(resourceManager.getString("remotes","LBL_UNKNOWN_REMOTE"));
            this.msgRemoteDeletion.htmlText = resourceManager.getString("remotes","MSG_DELETE_REMOTE",[_loc1_]);
         }
         this.btnValidateDeletion.label = resourceManager.getString("common","BTN_YES");
         this.btnCancelDeletion.label = resourceManager.getString("common","BTN_NO");
      }
      
      [Bindable(event="propertyChange")]
      private function get _skitter() : Skitter
      {
         return this._210824831_skitter;
      }
   }
}
