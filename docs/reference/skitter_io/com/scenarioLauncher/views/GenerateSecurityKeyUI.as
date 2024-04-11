package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.managers.DialogsManager;
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
   import ioService.constants.ErrorCodes;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.Application;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class GenerateSecurityKeyUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1108891366lbGenerateKeyInProgress:Text;
      
      private var _808279396btnStartGenerateKey:Button;
      
      private var _embed_mxml__928423959:Class;
      
      private var _1762163719generateKeySuccess:Canvas;
      
      private var _152628924generateKeyInProgress:Canvas;
      
      public var _GenerateSecurityKeyUI_HBox2:HBox;
      
      public var _GenerateSecurityKeyUI_HBox3:HBox;
      
      public var _GenerateSecurityKeyUI_HBox4:HBox;
      
      public var _GenerateSecurityKeyUI_HBox1:HBox;
      
      private var _886710442generateKey:Canvas;
      
      private var _1667287266generateKeySuccessImage:Image;
      
      private var _425369389lbGenerateKeyEquipConnected:Text;
      
      private var _425157612generateKeyFailedImage:Image;
      
      private var _830116140btnCancelGenerateKey:Button;
      
      private var _697029972lbGenerateKey:Text;
      
      private var _1053784716lbGenerateKeyInProgressWarn:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1340047409btnCancelGenerateKeyFailed:Button;
      
      private var _540459724lbGenerateKeyConfirm:Text;
      
      private var _embed_mxml__2146821453:Class;
      
      private var _565809508lbGenerateKeyTitle:Text;
      
      private var _1975931882btnNoGenerateKeySuccess:Button;
      
      private var _711070202lbGenerateKeyWarn:Text;
      
      private var _2004438503spinner:Spinner;
      
      private var _835735001lbGenerateKeyFailedTitle:Text;
      
      private var _48298319lbGenerateKeyFailed:Text;
      
      private var _23048468lbGenerateKeyConfirmTitle:Text;
      
      private var _1694942446lbGenerateKeyInProgressTitle:Text;
      
      private var _245430663generateKeyFailed:Canvas;
      
      private var _459794868btnRestartGenerateKeyFailed:Button;
      
      mx_internal var _watchers:Array;
      
      private var _2017139727lbGenerateKeySuccess:Text;
      
      private var _1522550665lbGenerateKeySuccessTitle:Text;
      
      private var _282356292btnYesGenerateKeySuccess:Button;
      
      private var _842355411btnNoGenerateKeyConfirm:Button;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1869632435vsGenerateSecurityKey:ViewStack;
      
      private var _embed_mxml__801521088:Class;
      
      mx_internal var _bindings:Array;
      
      private var _1056123574generateKeyConfirm:Canvas;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1194323711btnYesGenerateKeyConfirm:Button;
      
      public function GenerateSecurityKeyUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__2146821453,
                        "x":212,
                        "y":16
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"vsGenerateSecurityKey",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "resizeToContent":true,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"generateKey",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyWarn",
                                          "percentWidth":100,
                                          "styleName":"VB22RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKey",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKey",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyEquipConnected",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyEquipConnected",
                                          "percentWidth":100,
                                          "styleName":"V18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GenerateSecurityKeyUI_HBox1",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalGap = 58;
                                       this.horizontalAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnStartGenerateKey",
                                             "events":{"click":"__btnStartGenerateKey_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartGenerateKey",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelGenerateKey",
                                             "events":{"click":"__btnCancelGenerateKey_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelGenerateKey",
                                                   "styleName":"btnCancel",
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
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"generateKeyConfirm",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyConfirmTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyConfirmTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyConfirm",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyPressKey",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GenerateSecurityKeyUI_HBox2",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalGap = 58;
                                       this.horizontalAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnYesGenerateKeyConfirm",
                                             "events":{"click":"__btnYesGenerateKeyConfirm_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesGenerateKeyConfirm",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoGenerateKeyConfirm",
                                             "events":{"click":"__btnNoGenerateKeyConfirm_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesGenerateKeyConfirm",
                                                   "styleName":"btnCancel",
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
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"generateKeyInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyInProgressTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyInProgressTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyInProgress",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyInProgress",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyInProgressWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyInProgressWarn",
                                          "percentWidth":100,
                                          "styleName":"VR18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spinner,
                                    "id":"spinner",
                                    "stylesFactory":function():void
                                    {
                                       this.tickColor = 16758037;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "size":48,
                                          "tickWidth":4,
                                          "autoPlay":false,
                                          "x":238
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"generateKeySuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "clipContent":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeySuccessTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeySuccessTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"generateKeySuccessImage",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":50
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeySuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL1"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GenerateSecurityKeyUI_HBox3",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalGap = 58;
                                       this.horizontalAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnYesGenerateKeySuccess",
                                             "events":{"click":"__btnYesGenerateKeySuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesGenerateKeySuccess",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoGenerateKeySuccess",
                                             "events":{"click":"__btnNoGenerateKeySuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNoGenerateKeySuccess",
                                                   "styleName":"btnCancel",
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
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"generateKeyFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyFailedTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyFailedTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"generateKeyFailedImage",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":31
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGenerateKeyFailed",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGenerateKeyFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GenerateSecurityKeyUI_HBox4",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalGap = 58;
                                       this.horizontalAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnRestartGenerateKeyFailed",
                                             "events":{"click":"__btnRestartGenerateKeyFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnRestartGenerateKeyFailed",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelGenerateKeyFailed",
                                             "events":{"click":"__btnCancelGenerateKeyFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelGenerateKeyFailed",
                                                   "styleName":"btnCancel",
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
                        })]
                     };
                  }
               })]};
            }
         });
         this._embed_mxml__2146821453 = GenerateSecurityKeyUI__embed_mxml__2146821453;
         this._embed_mxml__801521088 = GenerateSecurityKeyUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = GenerateSecurityKeyUI__embed_mxml__928423959;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.clipContent = false;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         GenerateSecurityKeyUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesGenerateKeyConfirm() : Button
      {
         return this._1194323711btnYesGenerateKeyConfirm;
      }
      
      public function set btnYesGenerateKeyConfirm(param1:Button) : void
      {
         var _loc2_:Object = this._1194323711btnYesGenerateKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._1194323711btnYesGenerateKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesGenerateKeyConfirm",_loc2_,param1));
         }
      }
      
      public function set generateKeySuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._1762163719generateKeySuccess;
         if(_loc2_ !== param1)
         {
            this._1762163719generateKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKeySuccess",_loc2_,param1));
         }
      }
      
      public function set lbGenerateKeyWarn(param1:Text) : void
      {
         var _loc2_:Object = this._711070202lbGenerateKeyWarn;
         if(_loc2_ !== param1)
         {
            this._711070202lbGenerateKeyWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyWarn",_loc2_,param1));
         }
      }
      
      public function __btnStartGenerateKey_click(param1:MouseEvent) : void
      {
         this.onBtnStartGenerateKeyStartClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeySuccess() : Text
      {
         return this._2017139727lbGenerateKeySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyInProgressTitle() : Text
      {
         return this._1694942446lbGenerateKeyInProgressTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyInProgress() : Text
      {
         return this._1108891366lbGenerateKeyInProgress;
      }
      
      public function set generateKeyFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._245430663generateKeyFailed;
         if(_loc2_ !== param1)
         {
            this._245430663generateKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKeyFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNoGenerateKeySuccess() : Button
      {
         return this._1975931882btnNoGenerateKeySuccess;
      }
      
      public function set lbGenerateKeyInProgressWarn(param1:Text) : void
      {
         var _loc2_:Object = this._1053784716lbGenerateKeyInProgressWarn;
         if(_loc2_ !== param1)
         {
            this._1053784716lbGenerateKeyInProgressWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyInProgressWarn",_loc2_,param1));
         }
      }
      
      public function set lbGenerateKeySuccessTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1522550665lbGenerateKeySuccessTitle;
         if(_loc2_ !== param1)
         {
            this._1522550665lbGenerateKeySuccessTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeySuccessTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKeyFailedImage() : Image
      {
         return this._425157612generateKeyFailedImage;
      }
      
      public function set lbGenerateKeySuccess(param1:Text) : void
      {
         var _loc2_:Object = this._2017139727lbGenerateKeySuccess;
         if(_loc2_ !== param1)
         {
            this._2017139727lbGenerateKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeySuccess",_loc2_,param1));
         }
      }
      
      public function set lbGenerateKeyInProgressTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1694942446lbGenerateKeyInProgressTitle;
         if(_loc2_ !== param1)
         {
            this._1694942446lbGenerateKeyInProgressTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyInProgressTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyFailedTitle() : Text
      {
         return this._835735001lbGenerateKeyFailedTitle;
      }
      
      public function set generateKeyFailedImage(param1:Image) : void
      {
         var _loc2_:Object = this._425157612generateKeyFailedImage;
         if(_loc2_ !== param1)
         {
            this._425157612generateKeyFailedImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKeyFailedImage",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyEquipConnected() : Text
      {
         return this._425369389lbGenerateKeyEquipConnected;
      }
      
      public function set spinner(param1:Spinner) : void
      {
         var _loc2_:Object = this._2004438503spinner;
         if(_loc2_ !== param1)
         {
            this._2004438503spinner = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinner",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         switch(this.vsGenerateSecurityKey.selectedChild.id)
         {
            case "generateKey":
               this.lbGenerateKeyTitle.htmlText = resourceManager.getString("system","MSG_GENERATE_KEY_TITLE");
               this.lbGenerateKeyWarn.htmlText = resourceManager.getString("system","MSG_GENERATE_KEY_WARN");
               this.lbGenerateKey.htmlText = resourceManager.getString("system","MSG_GENERATE_SECURITY_KEY");
               this.lbGenerateKeyEquipConnected.htmlText = resourceManager.getString("system","MSG_GENERATE_SECURITY_KEY_EQUIP_CONNECTED");
               this.btnStartGenerateKey.label = resourceManager.getString("common","BTN_GENERATE_KEY");
               this.btnCancelGenerateKey.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "generateKeyConfirm":
               this.lbGenerateKeyConfirmTitle.htmlText = resourceManager.getString("system","MSG_GENERATE_KEY_TITLE");
               this.lbGenerateKeyConfirm.htmlText = resourceManager.getString("system","MSG_REALLY_GENERATE_KEY");
               this.btnYesGenerateKeyConfirm.label = resourceManager.getString("common","BTN_YES");
               this.btnNoGenerateKeyConfirm.label = resourceManager.getString("common","BTN_NO");
               break;
            case "generateKeyInProgress":
               this.lbGenerateKeyInProgressTitle.htmlText = resourceManager.getString("system","MSG_GENERATE_KEY_TITLE");
               this.lbGenerateKeyInProgress.htmlText = resourceManager.getString("system","MSG_GENERATE_SECURITY_KEY_IN_PROGRESS");
               this.lbGenerateKeyInProgressWarn.htmlText = resourceManager.getString("system","MSG_GENERATE_SECURITY_KEY_IN_PROGRESS2");
               break;
            case "generateKeySuccess":
               this.lbGenerateKeySuccessTitle.htmlText = resourceManager.getString("system","MSG_GENERATE_KEY_TITLE");
               this.lbGenerateKeySuccess.htmlText = resourceManager.getString("system","MSG_GENERATE_SECURITY_KEY_SUCCESS");
               this.btnYesGenerateKeySuccess.label = resourceManager.getString("common","BTN_YES");
               this.btnNoGenerateKeySuccess.label = resourceManager.getString("common","BTN_NO");
               break;
            case "generateKeyFailed":
               this.lbGenerateKeyFailedTitle.htmlText = resourceManager.getString("system","MSG_GENERATE_KEY_TITLE");
               this.lbGenerateKeyFailed.htmlText = resourceManager.getString("system","MSG_GENERATE_SECURITY_KEY_FAILED");
               this.btnRestartGenerateKeyFailed.label = resourceManager.getString("common","BTN_RETRY");
               this.btnCancelGenerateKeyFailed.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelGenerateKeyFailed() : Button
      {
         return this._1340047409btnCancelGenerateKeyFailed;
      }
      
      private function goTOgenerateKeyInProgress() : void
      {
         this.vsGenerateSecurityKey.selectedChild = this.generateKeyInProgress;
         invalidateDisplayList();
         this.spinner.play();
         this.refreshPopup();
      }
      
      public function set btnNoGenerateKeySuccess(param1:Button) : void
      {
         var _loc2_:Object = this._1975931882btnNoGenerateKeySuccess;
         if(_loc2_ !== param1)
         {
            this._1975931882btnNoGenerateKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoGenerateKeySuccess",_loc2_,param1));
         }
      }
      
      public function __btnNoGenerateKeyConfirm_click(param1:MouseEvent) : void
      {
         this.onBtnNoGenerateKeyConfirmClickHandler(param1);
      }
      
      public function __btnCancelGenerateKey_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGenerateKeyClickHandler(param1);
      }
      
      public function __btnNoGenerateKeySuccess_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGenerateKeyClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesGenerateKeySuccess() : Button
      {
         return this._282356292btnYesGenerateKeySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get vsGenerateSecurityKey() : ViewStack
      {
         return this._1869632435vsGenerateSecurityKey;
      }
      
      public function set lbGenerateKeyFailedTitle(param1:Text) : void
      {
         var _loc2_:Object = this._835735001lbGenerateKeyFailedTitle;
         if(_loc2_ !== param1)
         {
            this._835735001lbGenerateKeyFailedTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyFailedTitle",_loc2_,param1));
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.UPDATE_KEY_SUCCESS,this.goTOgenerateKeySuccess);
         SkitterManager.instance.skitterConnectionAllowed = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      public function set generateKey(param1:Canvas) : void
      {
         var _loc2_:Object = this._886710442generateKey;
         if(_loc2_ !== param1)
         {
            this._886710442generateKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKey",_loc2_,param1));
         }
      }
      
      public function set lbGenerateKeyEquipConnected(param1:Text) : void
      {
         var _loc2_:Object = this._425369389lbGenerateKeyEquipConnected;
         if(_loc2_ !== param1)
         {
            this._425369389lbGenerateKeyEquipConnected = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyEquipConnected",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKey() : Text
      {
         return this._697029972lbGenerateKey;
      }
      
      public function __btnRestartGenerateKeyFailed_click(param1:MouseEvent) : void
      {
         this.onBtnRestartGenerateKeyFailedClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartGenerateKey() : Button
      {
         return this._808279396btnStartGenerateKey;
      }
      
      public function set btnRestartGenerateKeyFailed(param1:Button) : void
      {
         var _loc2_:Object = this._459794868btnRestartGenerateKeyFailed;
         if(_loc2_ !== param1)
         {
            this._459794868btnRestartGenerateKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRestartGenerateKeyFailed",_loc2_,param1));
         }
      }
      
      public function set btnCancelGenerateKeyFailed(param1:Button) : void
      {
         var _loc2_:Object = this._1340047409btnCancelGenerateKeyFailed;
         if(_loc2_ !== param1)
         {
            this._1340047409btnCancelGenerateKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelGenerateKeyFailed",_loc2_,param1));
         }
      }
      
      public function set generateKeyConfirm(param1:Canvas) : void
      {
         var _loc2_:Object = this._1056123574generateKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._1056123574generateKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKeyConfirm",_loc2_,param1));
         }
      }
      
      public function set lbGenerateKeyFailed(param1:Text) : void
      {
         var _loc2_:Object = this._48298319lbGenerateKeyFailed;
         if(_loc2_ !== param1)
         {
            this._48298319lbGenerateKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyTitle() : Text
      {
         return this._565809508lbGenerateKeyTitle;
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_NEW_SYSTEM_KEY:
               this.goTOgenerateKeyFailed();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               this.spinner.stop();
               this.close();
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      public function set generateKeyInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._152628924generateKeyInProgress;
         if(_loc2_ !== param1)
         {
            this._152628924generateKeyInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKeyInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKeyFailed() : Canvas
      {
         return this._245430663generateKeyFailed;
      }
      
      public function set btnYesGenerateKeySuccess(param1:Button) : void
      {
         var _loc2_:Object = this._282356292btnYesGenerateKeySuccess;
         if(_loc2_ !== param1)
         {
            this._282356292btnYesGenerateKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesGenerateKeySuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeySuccessTitle() : Text
      {
         return this._1522550665lbGenerateKeySuccessTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyInProgressWarn() : Text
      {
         return this._1053784716lbGenerateKeyInProgressWarn;
      }
      
      private function _GenerateSecurityKeyUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeyWarn.y = param1;
         },"lbGenerateKeyWarn.y");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKey.y = param1;
         },"lbGenerateKey.y");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeyEquipConnected.y = param1;
         },"lbGenerateKeyEquipConnected.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GenerateSecurityKeyUI_HBox1.y = param1;
         },"_GenerateSecurityKeyUI_HBox1.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeyConfirm.y = param1;
         },"lbGenerateKeyConfirm.y");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GenerateSecurityKeyUI_HBox2.y = param1;
         },"_GenerateSecurityKeyUI_HBox2.y");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeyInProgress.y = param1;
         },"lbGenerateKeyInProgress.y");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeyInProgressWarn.y = param1;
         },"lbGenerateKeyInProgressWarn.y");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            generateKeySuccessImage.y = param1;
         },"generateKeySuccessImage.y");
         result[9] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeySuccess.y = param1;
         },"lbGenerateKeySuccess.y");
         result[10] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GenerateSecurityKeyUI_HBox3.y = param1;
         },"_GenerateSecurityKeyUI_HBox3.y");
         result[11] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            generateKeyFailedImage.y = param1;
         },"generateKeyFailedImage.y");
         result[12] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGenerateKeyFailed.y = param1;
         },"lbGenerateKeyFailed.y");
         result[13] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GenerateSecurityKeyUI_HBox4.y = param1;
         },"_GenerateSecurityKeyUI_HBox4.y");
         result[14] = binding;
         return result;
      }
      
      private function onBtnCancelGenerateKeyClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      private function _GenerateSecurityKeyUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.lbGenerateKeyTitle.y + this.lbGenerateKeyTitle.height + 20;
         _loc1_ = this.lbGenerateKeyWarn.y + this.lbGenerateKeyWarn.height - 5;
         _loc1_ = this.lbGenerateKey.y + this.lbGenerateKey.height + 10;
         _loc1_ = this.lbGenerateKeyEquipConnected.y + this.lbGenerateKeyEquipConnected.height + 30;
         _loc1_ = this.lbGenerateKeyConfirmTitle.y + this.lbGenerateKeyConfirmTitle.height + 20;
         _loc1_ = this.lbGenerateKeyConfirm.y + this.lbGenerateKeyConfirm.height + 30;
         _loc1_ = this.lbGenerateKeyInProgressTitle.y + this.lbGenerateKeyInProgressTitle.height + 20;
         _loc1_ = this.lbGenerateKeyInProgress.y + this.lbGenerateKeyInProgress.height + 20;
         _loc1_ = this.lbGenerateKeyInProgressWarn.y + this.lbGenerateKeyInProgressWarn.height + 20;
         _loc1_ = this.lbGenerateKeySuccessTitle.y + this.lbGenerateKeySuccessTitle.height + 20;
         _loc1_ = this.lbGenerateKeySuccessTitle.y + this.lbGenerateKeySuccessTitle.height + 17;
         _loc1_ = this.lbGenerateKeySuccess.y + this.lbGenerateKeySuccess.height + 38;
         _loc1_ = this.lbGenerateKeyFailedTitle.y + this.lbGenerateKeyFailedTitle.height + 20;
         _loc1_ = this.lbGenerateKeyFailedTitle.y + this.lbGenerateKeyFailedTitle.height + 17;
         _loc1_ = this.lbGenerateKeyFailed.y + this.lbGenerateKeyFailed.height + 30;
      }
      
      public function set vsGenerateSecurityKey(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1869632435vsGenerateSecurityKey;
         if(_loc2_ !== param1)
         {
            this._1869632435vsGenerateSecurityKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsGenerateSecurityKey",_loc2_,param1));
         }
      }
      
      private function goTOgenerateKeySuccess(param1:InstallationEvent) : void
      {
         this.vsGenerateSecurityKey.selectedChild = this.generateKeySuccess;
         invalidateDisplayList();
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setSuccessIconPosition);
      }
      
      private function onBtnRestartGenerateKeyFailedClickHandler(param1:MouseEvent) : void
      {
         this.onBtnYesGenerateKeyConfirmClickHandler(param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GenerateSecurityKeyUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._GenerateSecurityKeyUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_GenerateSecurityKeyUIWatcherSetupUtil");
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
      
      protected function setSuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbGenerateKeySuccess.validateNow();
         _loc1_ = this.lbGenerateKeySuccess.getLineMetrics(0);
         this.generateKeySuccessImage.x = _loc1_.x - this.generateKeySuccessImage.width - 5;
      }
      
      private function goTOgenerateKeyFailed() : void
      {
         this.vsGenerateSecurityKey.selectedChild = this.generateKeyFailed;
         invalidateDisplayList();
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setFailedIconPosition);
      }
      
      public function __btnYesGenerateKeyConfirm_click(param1:MouseEvent) : void
      {
         this.onBtnYesGenerateKeyConfirmClickHandler(param1);
      }
      
      public function __btnYesGenerateKeySuccess_click(param1:MouseEvent) : void
      {
         this.onBtnStartTransfertKeyClickHandler(param1);
      }
      
      private function onBtnStartGenerateKeyStartClickHandler(param1:MouseEvent) : void
      {
         this.vsGenerateSecurityKey.selectedChild = this.generateKeyConfirm;
         this.refreshPopup();
         invalidateDisplayList();
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsGenerateSecurityKey.selectedChild.id)
         {
            case "generateKeyFailed":
               this.width = 528;
               break;
            case "generateKeySuccess":
               this.width = 528;
               break;
            case "generateKeyInProgress":
               this.width = 528;
               break;
            case "generateKeyConfirm":
               this.width = 528;
               break;
            case "generateKey":
            default:
               this.width = 529;
         }
         super.refreshUI();
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKey() : Canvas
      {
         return this._886710442generateKey;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRestartGenerateKeyFailed() : Button
      {
         return this._459794868btnRestartGenerateKeyFailed;
      }
      
      public function set btnNoGenerateKeyConfirm(param1:Button) : void
      {
         var _loc2_:Object = this._842355411btnNoGenerateKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._842355411btnNoGenerateKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoGenerateKeyConfirm",_loc2_,param1));
         }
      }
      
      private function onBtnNoGenerateKeyConfirmClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function set btnCancelGenerateKey(param1:Button) : void
      {
         var _loc2_:Object = this._830116140btnCancelGenerateKey;
         if(_loc2_ !== param1)
         {
            this._830116140btnCancelGenerateKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelGenerateKey",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyFailed() : Text
      {
         return this._48298319lbGenerateKeyFailed;
      }
      
      protected function setFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbGenerateKeyFailed.validateNow();
         _loc1_ = this.lbGenerateKeyFailed.getLineMetrics(0);
         this.generateKeyFailedImage.x = _loc1_.x - this.generateKeyFailedImage.width - 5;
      }
      
      public function set lbGenerateKeyConfirm(param1:Text) : void
      {
         var _loc2_:Object = this._540459724lbGenerateKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._540459724lbGenerateKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyConfirm",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKeyInProgress() : Canvas
      {
         return this._152628924generateKeyInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKeyConfirm() : Canvas
      {
         return this._1056123574generateKeyConfirm;
      }
      
      public function set lbGenerateKey(param1:Text) : void
      {
         var _loc2_:Object = this._697029972lbGenerateKey;
         if(_loc2_ !== param1)
         {
            this._697029972lbGenerateKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKey",_loc2_,param1));
         }
      }
      
      private function onBtnYesGenerateKeyConfirmClickHandler(param1:MouseEvent) : void
      {
         this.goTOgenerateKeyInProgress();
         ServerCommunicationManager.instance.generateNewKey("");
      }
      
      public function set generateKeySuccessImage(param1:Image) : void
      {
         var _loc2_:Object = this._1667287266generateKeySuccessImage;
         if(_loc2_ !== param1)
         {
            this._1667287266generateKeySuccessImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateKeySuccessImage",_loc2_,param1));
         }
      }
      
      public function set btnStartGenerateKey(param1:Button) : void
      {
         var _loc2_:Object = this._808279396btnStartGenerateKey;
         if(_loc2_ !== param1)
         {
            this._808279396btnStartGenerateKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartGenerateKey",_loc2_,param1));
         }
      }
      
      public function set lbGenerateKeyTitle(param1:Text) : void
      {
         var _loc2_:Object = this._565809508lbGenerateKeyTitle;
         if(_loc2_ !== param1)
         {
            this._565809508lbGenerateKeyTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyTitle",_loc2_,param1));
         }
      }
      
      private function onBtnCancelGenerateKeyPressKeyClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelGenerateKey() : Button
      {
         return this._830116140btnCancelGenerateKey;
      }
      
      public function set lbGenerateKeyConfirmTitle(param1:Text) : void
      {
         var _loc2_:Object = this._23048468lbGenerateKeyConfirmTitle;
         if(_loc2_ !== param1)
         {
            this._23048468lbGenerateKeyConfirmTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyConfirmTitle",_loc2_,param1));
         }
      }
      
      public function __btnCancelGenerateKeyFailed_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGenerateKeyClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyConfirm() : Text
      {
         return this._540459724lbGenerateKeyConfirm;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNoGenerateKeyConfirm() : Button
      {
         return this._842355411btnNoGenerateKeyConfirm;
      }
      
      public function set lbGenerateKeyInProgress(param1:Text) : void
      {
         var _loc2_:Object = this._1108891366lbGenerateKeyInProgress;
         if(_loc2_ !== param1)
         {
            this._1108891366lbGenerateKeyInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGenerateKeyInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKeySuccessImage() : Image
      {
         return this._1667287266generateKeySuccessImage;
      }
      
      private function close() : void
      {
         closeHandler();
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
      
      [Bindable(event="propertyChange")]
      public function get generateKeySuccess() : Canvas
      {
         return this._1762163719generateKeySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyWarn() : Text
      {
         return this._711070202lbGenerateKeyWarn;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGenerateKeyConfirmTitle() : Text
      {
         return this._23048468lbGenerateKeyConfirmTitle;
      }
      
      private function onBtnStartTransfertKeyClickHandler(param1:MouseEvent) : void
      {
         this.close();
         Application.application.mainUI.installationUI.openGiveSecurityKeyUI();
      }
   }
}
