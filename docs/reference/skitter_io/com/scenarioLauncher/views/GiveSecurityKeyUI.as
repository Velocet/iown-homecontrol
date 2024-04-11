package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.events.InstallationEvent;
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
   import ioService.constants.ErrorCodes;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class GiveSecurityKeyUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _17601983btnCancelGiveKeyToIOHomeControlPressKey:Button;
      
      private var _1186030022lbGiveKeyToIOHomeControlSuccessTitle:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var giveKeyTimer:Timer;
      
      private var _1904455569giveKeyToIOHomeControl:Canvas;
      
      private var _1231008597giveKeyToIOHomeControlPressKey:Canvas;
      
      private var _1969876357lbGiveKeyToIOHomeControl:Text;
      
      private var _1700334754btnCancelGiveKeyToIOHomeControlFailed:Button;
      
      private var _990810199btnNoGiveKeyToIOHomeControlSuccess:Button;
      
      private var _418725514lbgiveKeyToIOHomeControlFailedTitle:Text;
      
      private var _538736162lbGiveKeyToIOHomeControlFailed:Text;
      
      public var _GiveSecurityKeyUI_HBox1:HBox;
      
      public var _GiveSecurityKeyUI_HBox2:HBox;
      
      public var _GiveSecurityKeyUI_HBox3:HBox;
      
      public var _GiveSecurityKeyUI_HBox4:HBox;
      
      mx_internal var _watchers:Array;
      
      private var _1717106746giveKeySuccessImage:Image;
      
      private var _1636606783btnRestartGiveKeyToIOHomeControlFailed:Button;
      
      private var _1960985739btnStartGiveKeyToIOHomeControl:Button;
      
      private var _1259627842lbGiveKeyToIOHomeControlSuccess:Text;
      
      private var _895877996giveKeyToIOHomeControlSuccess:Canvas;
      
      private var _1428371095btnYesGiveKeyToIOHomeControlSuccess:Button;
      
      private var _873564495vsGiveSecurityKey:ViewStack;
      
      private var _796484613btnCancelGiveKeyToIOHomeControl:Button;
      
      private var _377648065lbGiveKeyToIOHomeControlPressKey:Text;
      
      private var _118689616giveKeyFailedImage:Image;
      
      private var _embed_mxml__2079810206:Class;
      
      private var _909504279lbGiveKeyToIOHomeControlPressKeyTitle:Text;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _550470028giveKeyToIOHomeControlFailed:Canvas;
      
      mx_internal var _bindings:Array;
      
      private var _embed_mxml__801521088:Class;
      
      private var _embed_mxml__928423959:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _662179885lbGiveKeyToIOHomeControlTitle:Text;
      
      public function GiveSecurityKeyUI()
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
                        "source":_embed_mxml__2079810206,
                        "x":211,
                        "y":28
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"vsGiveSecurityKey",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "resizeToContent":true,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"giveKeyToIOHomeControl",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControlTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControlTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControl",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControl",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GiveSecurityKeyUI_HBox1",
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
                                             "id":"btnStartGiveKeyToIOHomeControl",
                                             "events":{"click":"__btnStartGiveKeyToIOHomeControl_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartGiveKeyToIOHomeControl",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelGiveKeyToIOHomeControl",
                                             "events":{"click":"__btnCancelGiveKeyToIOHomeControl_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelGiveKeyToIOHomeControl",
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
                           "id":"giveKeyToIOHomeControlPressKey",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControlPressKeyTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControlPressKeyTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControlPressKey",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControlPressKey",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GiveSecurityKeyUI_HBox2",
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
                                             "id":"btnCancelGiveKeyToIOHomeControlPressKey",
                                             "events":{"click":"__btnCancelGiveKeyToIOHomeControlPressKey_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelGiveKeyToIOHomeControlPressKey",
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
                           "id":"giveKeyToIOHomeControlSuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControlSuccessTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControlSuccessTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"giveKeySuccessImage",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":24
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControlSuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControlSuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL1"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GiveSecurityKeyUI_HBox3",
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
                                             "id":"btnYesGiveKeyToIOHomeControlSuccess",
                                             "events":{"click":"__btnYesGiveKeyToIOHomeControlSuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesGiveKeyToIOHomeControlSuccess",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoGiveKeyToIOHomeControlSuccess",
                                             "events":{"click":"__btnNoGiveKeyToIOHomeControlSuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNoGiveKeyToIOHomeControlSuccess",
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
                           "id":"giveKeyToIOHomeControlFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbgiveKeyToIOHomeControlFailedTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbgiveKeyToIOHomeControlFailedTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"giveKeyFailedImage",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":101
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbGiveKeyToIOHomeControlFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbGiveKeyToIOHomeControlFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_GiveSecurityKeyUI_HBox4",
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
                                             "id":"btnRestartGiveKeyToIOHomeControlFailed",
                                             "events":{"click":"__btnRestartGiveKeyToIOHomeControlFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnRestartGiveKeyToIOHomeControlFailed",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelGiveKeyToIOHomeControlFailed",
                                             "events":{"click":"__btnCancelGiveKeyToIOHomeControlFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelGiveKeyToIOHomeControlFailed",
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
         this.giveKeyTimer = new Timer(Globals.GIVE_KEY_TIMEOUT);
         this._embed_mxml__2079810206 = GiveSecurityKeyUI__embed_mxml__2079810206;
         this._embed_mxml__801521088 = GiveSecurityKeyUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = GiveSecurityKeyUI__embed_mxml__928423959;
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
         GiveSecurityKeyUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelGiveKeyToIOHomeControl() : Button
      {
         return this._796484613btnCancelGiveKeyToIOHomeControl;
      }
      
      private function close() : void
      {
         closeHandler();
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
      
      public function set btnCancelGiveKeyToIOHomeControl(param1:Button) : void
      {
         var _loc2_:Object = this._796484613btnCancelGiveKeyToIOHomeControl;
         if(_loc2_ !== param1)
         {
            this._796484613btnCancelGiveKeyToIOHomeControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelGiveKeyToIOHomeControl",_loc2_,param1));
         }
      }
      
      private function goTOgiveKeyToIOHomeControlSuccess() : void
      {
         this.giveKeyTimer.stop();
         this.vsGiveSecurityKey.selectedChild = this.giveKeyToIOHomeControlSuccess;
         this.refreshPopup();
         callLater(this.setSuccessIconPosition);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControlPressKeyTitle() : Text
      {
         return this._909504279lbGiveKeyToIOHomeControlPressKeyTitle;
      }
      
      public function set giveKeyToIOHomeControlFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._550470028giveKeyToIOHomeControlFailed;
         if(_loc2_ !== param1)
         {
            this._550470028giveKeyToIOHomeControlFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveKeyToIOHomeControlFailed",_loc2_,param1));
         }
      }
      
      public function set lbGiveKeyToIOHomeControl(param1:Text) : void
      {
         var _loc2_:Object = this._1969876357lbGiveKeyToIOHomeControl;
         if(_loc2_ !== param1)
         {
            this._1969876357lbGiveKeyToIOHomeControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControl",_loc2_,param1));
         }
      }
      
      public function __btnStartGiveKeyToIOHomeControl_click(param1:MouseEvent) : void
      {
         this.onBtnStartGiveKeyToIOHomeControlStartClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControlFailed() : Text
      {
         return this._538736162lbGiveKeyToIOHomeControlFailed;
      }
      
      private function onBtnCancelGiveKeyToIOHomeControlPressKeyClickHandler(param1:MouseEvent) : void
      {
         this.giveKeyTimer.stop();
         this.close();
         ServerCommunicationManager.instance.cancelGiveKey();
      }
      
      public function set lbGiveKeyToIOHomeControlPressKeyTitle(param1:Text) : void
      {
         var _loc2_:Object = this._909504279lbGiveKeyToIOHomeControlPressKeyTitle;
         if(_loc2_ !== param1)
         {
            this._909504279lbGiveKeyToIOHomeControlPressKeyTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControlPressKeyTitle",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         switch(this.vsGiveSecurityKey.selectedChild.id)
         {
            case "giveKeyToIOHomeControl":
               this.lbGiveKeyToIOHomeControlTitle.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_TITLE");
               this.lbGiveKeyToIOHomeControl.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY");
               this.btnStartGiveKeyToIOHomeControl.label = resourceManager.getString("common","BTN_GIVE_KEY");
               this.btnCancelGiveKeyToIOHomeControl.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "giveKeyToIOHomeControlPressKey":
               this.lbGiveKeyToIOHomeControlPressKeyTitle.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_TITLE");
               this.lbGiveKeyToIOHomeControlPressKey.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_PRESS_KEY");
               this.btnCancelGiveKeyToIOHomeControlPressKey.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "giveKeyToIOHomeControlSuccess":
               this.lbGiveKeyToIOHomeControlSuccessTitle.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_TITLE");
               this.lbGiveKeyToIOHomeControlSuccess.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_SUCCESS");
               this.btnYesGiveKeyToIOHomeControlSuccess.label = resourceManager.getString("common","BTN_YES");
               this.btnNoGiveKeyToIOHomeControlSuccess.label = resourceManager.getString("common","BTN_NO");
               break;
            case "giveKeyToIOHomeControlFailed":
               this.lbgiveKeyToIOHomeControlFailedTitle.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_TITLE");
               this.lbGiveKeyToIOHomeControlFailed.htmlText = resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_FAILED");
               this.btnRestartGiveKeyToIOHomeControlFailed.label = resourceManager.getString("common","BTN_RETRY");
               this.btnCancelGiveKeyToIOHomeControlFailed.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      public function __btnCancelGiveKeyToIOHomeControlPressKey_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGiveKeyToIOHomeControlPressKeyClickHandler(param1);
      }
      
      private function OnGiveKeySuccessHandler(param1:InstallationEvent) : void
      {
         this.goTOgiveKeyToIOHomeControlSuccess();
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.vsGiveSecurityKey.addEventListener(FlexEvent.VALUE_COMMIT,this.onVsGiveSecurityKeyValueCommitHandler);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.GIVE_KEY_SUCCESS,this.OnGiveKeySuccessHandler);
         this.giveKeyTimer.addEventListener(TimerEvent.TIMER,this.giveKeyTimerHandler);
         SkitterManager.instance.skitterConnectionAllowed = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRestartGiveKeyToIOHomeControlFailed() : Button
      {
         return this._1636606783btnRestartGiveKeyToIOHomeControlFailed;
      }
      
      public function set giveKeyToIOHomeControlSuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._895877996giveKeyToIOHomeControlSuccess;
         if(_loc2_ !== param1)
         {
            this._895877996giveKeyToIOHomeControlSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveKeyToIOHomeControlSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelGiveKeyToIOHomeControlPressKey() : Button
      {
         return this._17601983btnCancelGiveKeyToIOHomeControlPressKey;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControlSuccessTitle() : Text
      {
         return this._1186030022lbGiveKeyToIOHomeControlSuccessTitle;
      }
      
      public function set btnCancelGiveKeyToIOHomeControlFailed(param1:Button) : void
      {
         var _loc2_:Object = this._1700334754btnCancelGiveKeyToIOHomeControlFailed;
         if(_loc2_ !== param1)
         {
            this._1700334754btnCancelGiveKeyToIOHomeControlFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelGiveKeyToIOHomeControlFailed",_loc2_,param1));
         }
      }
      
      public function __btnYesGiveKeyToIOHomeControlSuccess_click(param1:MouseEvent) : void
      {
         this.onBtnStartGiveKeyToIOHomeControlStartClickHandler(param1);
      }
      
      public function set lbGiveKeyToIOHomeControlFailed(param1:Text) : void
      {
         var _loc2_:Object = this._538736162lbGiveKeyToIOHomeControlFailed;
         if(_loc2_ !== param1)
         {
            this._538736162lbGiveKeyToIOHomeControlFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControlFailed",_loc2_,param1));
         }
      }
      
      private function onVsGiveSecurityKeyValueCommitHandler(param1:FlexEvent) : void
      {
         invalidateDisplayList();
      }
      
      public function set giveKeyToIOHomeControlPressKey(param1:Canvas) : void
      {
         var _loc2_:Object = this._1231008597giveKeyToIOHomeControlPressKey;
         if(_loc2_ !== param1)
         {
            this._1231008597giveKeyToIOHomeControlPressKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveKeyToIOHomeControlPressKey",_loc2_,param1));
         }
      }
      
      private function onBtnStartGiveKeyToIOHomeControlStartClickHandler(param1:MouseEvent) : void
      {
         this.giveKeyTimer.start();
         this.vsGiveSecurityKey.selectedChild = this.giveKeyToIOHomeControlPressKey;
         this.refreshPopup();
         ServerCommunicationManager.instance.giveKeyToAnother2WController();
      }
      
      public function set giveKeyFailedImage(param1:Image) : void
      {
         var _loc2_:Object = this._118689616giveKeyFailedImage;
         if(_loc2_ !== param1)
         {
            this._118689616giveKeyFailedImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveKeyFailedImage",_loc2_,param1));
         }
      }
      
      public function set vsGiveSecurityKey(param1:ViewStack) : void
      {
         var _loc2_:Object = this._873564495vsGiveSecurityKey;
         if(_loc2_ !== param1)
         {
            this._873564495vsGiveSecurityKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsGiveSecurityKey",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNoGiveKeyToIOHomeControlSuccess() : Button
      {
         return this._990810199btnNoGiveKeyToIOHomeControlSuccess;
      }
      
      public function __btnRestartGiveKeyToIOHomeControlFailed_click(param1:MouseEvent) : void
      {
         this.onBtnRestartGiveKeyToIOHomeControlFailedClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesGiveKeyToIOHomeControlSuccess() : Button
      {
         return this._1428371095btnYesGiveKeyToIOHomeControlSuccess;
      }
      
      private function goTOgiveKeyToIOHomeControlFailed() : void
      {
         this.giveKeyTimer.stop();
         this.vsGiveSecurityKey.selectedChild = this.giveKeyToIOHomeControlFailed;
         this.refreshPopup();
         callLater(this.setFailedIconPosition);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartGiveKeyToIOHomeControl() : Button
      {
         return this._1960985739btnStartGiveKeyToIOHomeControl;
      }
      
      [Bindable(event="propertyChange")]
      public function get giveKeyToIOHomeControl() : Canvas
      {
         return this._1904455569giveKeyToIOHomeControl;
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_GIVE_KEY:
               this.goTOgiveKeyToIOHomeControlFailed();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               this.close();
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbgiveKeyToIOHomeControlFailedTitle() : Text
      {
         return this._418725514lbgiveKeyToIOHomeControlFailedTitle;
      }
      
      public function set btnRestartGiveKeyToIOHomeControlFailed(param1:Button) : void
      {
         var _loc2_:Object = this._1636606783btnRestartGiveKeyToIOHomeControlFailed;
         if(_loc2_ !== param1)
         {
            this._1636606783btnRestartGiveKeyToIOHomeControlFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRestartGiveKeyToIOHomeControlFailed",_loc2_,param1));
         }
      }
      
      public function __btnNoGiveKeyToIOHomeControlSuccess_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGiveKeyToIOHomeControlClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControl() : Text
      {
         return this._1969876357lbGiveKeyToIOHomeControl;
      }
      
      public function set btnCancelGiveKeyToIOHomeControlPressKey(param1:Button) : void
      {
         var _loc2_:Object = this._17601983btnCancelGiveKeyToIOHomeControlPressKey;
         if(_loc2_ !== param1)
         {
            this._17601983btnCancelGiveKeyToIOHomeControlPressKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelGiveKeyToIOHomeControlPressKey",_loc2_,param1));
         }
      }
      
      public function set lbGiveKeyToIOHomeControlSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._1259627842lbGiveKeyToIOHomeControlSuccess;
         if(_loc2_ !== param1)
         {
            this._1259627842lbGiveKeyToIOHomeControlSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControlSuccess",_loc2_,param1));
         }
      }
      
      public function set giveKeySuccessImage(param1:Image) : void
      {
         var _loc2_:Object = this._1717106746giveKeySuccessImage;
         if(_loc2_ !== param1)
         {
            this._1717106746giveKeySuccessImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveKeySuccessImage",_loc2_,param1));
         }
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:GiveSecurityKeyUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._GiveSecurityKeyUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_GiveSecurityKeyUIWatcherSetupUtil");
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
         this.lbGiveKeyToIOHomeControlSuccess.validateNow();
         _loc1_ = this.lbGiveKeyToIOHomeControlSuccess.getLineMetrics(0);
         this.giveKeySuccessImage.x = _loc1_.x - this.giveKeySuccessImage.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get giveKeyToIOHomeControlFailed() : Canvas
      {
         return this._550470028giveKeyToIOHomeControlFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelGiveKeyToIOHomeControlFailed() : Button
      {
         return this._1700334754btnCancelGiveKeyToIOHomeControlFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get giveKeyToIOHomeControlPressKey() : Canvas
      {
         return this._1231008597giveKeyToIOHomeControlPressKey;
      }
      
      public function set lbGiveKeyToIOHomeControlSuccessTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1186030022lbGiveKeyToIOHomeControlSuccessTitle;
         if(_loc2_ !== param1)
         {
            this._1186030022lbGiveKeyToIOHomeControlSuccessTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControlSuccessTitle",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsGiveSecurityKey.selectedChild.id)
         {
            case "giveKeyToIOHomeControlFailed":
               this.width = 528;
               break;
            case "giveKeyToIOHomeControlSuccess":
               this.width = 528;
               break;
            case "giveKeyToIOHomeControlInProgress":
               this.width = 528;
               break;
            case "giveKeyToIOHomeControlPressKey":
               this.width = 528;
               break;
            case "giveKeyToIOHomeControl":
            default:
               this.width = 528;
         }
         super.refreshUI();
      }
      
      protected function setFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbGiveKeyToIOHomeControlFailed.validateNow();
         _loc1_ = this.lbGiveKeyToIOHomeControlFailed.getLineMetrics(0);
         this.giveKeyFailedImage.x = _loc1_.x - this.giveKeyFailedImage.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get vsGiveSecurityKey() : ViewStack
      {
         return this._873564495vsGiveSecurityKey;
      }
      
      private function _GiveSecurityKeyUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.lbGiveKeyToIOHomeControlTitle.y + this.lbGiveKeyToIOHomeControlTitle.height + 20;
         _loc1_ = this.lbGiveKeyToIOHomeControl.y + this.lbGiveKeyToIOHomeControl.height + 30;
         _loc1_ = this.lbGiveKeyToIOHomeControlPressKeyTitle.y + this.lbGiveKeyToIOHomeControlPressKeyTitle.height + 20;
         _loc1_ = this.lbGiveKeyToIOHomeControlPressKey.y + this.lbGiveKeyToIOHomeControlPressKey.height + 30;
         _loc1_ = this.lbGiveKeyToIOHomeControlSuccessTitle.y + this.lbGiveKeyToIOHomeControlSuccessTitle.height + 20;
         _loc1_ = this.lbGiveKeyToIOHomeControlSuccessTitle.y + this.lbGiveKeyToIOHomeControlSuccessTitle.height + 17;
         _loc1_ = this.lbGiveKeyToIOHomeControlSuccess.y + this.lbGiveKeyToIOHomeControlSuccess.height + 30;
         _loc1_ = this.lbgiveKeyToIOHomeControlFailedTitle.y + this.lbgiveKeyToIOHomeControlFailedTitle.height + 20;
         _loc1_ = this.lbgiveKeyToIOHomeControlFailedTitle.y + this.lbgiveKeyToIOHomeControlFailedTitle.height + 17;
         _loc1_ = this.lbGiveKeyToIOHomeControlFailed.y + this.lbGiveKeyToIOHomeControlFailed.height + 30;
      }
      
      [Bindable(event="propertyChange")]
      public function get giveKeyToIOHomeControlSuccess() : Canvas
      {
         return this._895877996giveKeyToIOHomeControlSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get giveKeyFailedImage() : Image
      {
         return this._118689616giveKeyFailedImage;
      }
      
      public function set lbGiveKeyToIOHomeControlPressKey(param1:Text) : void
      {
         var _loc2_:Object = this._377648065lbGiveKeyToIOHomeControlPressKey;
         if(_loc2_ !== param1)
         {
            this._377648065lbGiveKeyToIOHomeControlPressKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControlPressKey",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControlSuccess() : Text
      {
         return this._1259627842lbGiveKeyToIOHomeControlSuccess;
      }
      
      private function onBtnRestartGiveKeyToIOHomeControlFailedClickHandler(param1:MouseEvent) : void
      {
         this.giveKeyTimer.stop();
         this.onBtnStartGiveKeyToIOHomeControlStartClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControlPressKey() : Text
      {
         return this._377648065lbGiveKeyToIOHomeControlPressKey;
      }
      
      public function set btnNoGiveKeyToIOHomeControlSuccess(param1:Button) : void
      {
         var _loc2_:Object = this._990810199btnNoGiveKeyToIOHomeControlSuccess;
         if(_loc2_ !== param1)
         {
            this._990810199btnNoGiveKeyToIOHomeControlSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoGiveKeyToIOHomeControlSuccess",_loc2_,param1));
         }
      }
      
      public function __btnCancelGiveKeyToIOHomeControlFailed_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGiveKeyToIOHomeControlClickHandler(param1);
      }
      
      public function set btnYesGiveKeyToIOHomeControlSuccess(param1:Button) : void
      {
         var _loc2_:Object = this._1428371095btnYesGiveKeyToIOHomeControlSuccess;
         if(_loc2_ !== param1)
         {
            this._1428371095btnYesGiveKeyToIOHomeControlSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesGiveKeyToIOHomeControlSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get giveKeySuccessImage() : Image
      {
         return this._1717106746giveKeySuccessImage;
      }
      
      public function set giveKeyToIOHomeControl(param1:Canvas) : void
      {
         var _loc2_:Object = this._1904455569giveKeyToIOHomeControl;
         if(_loc2_ !== param1)
         {
            this._1904455569giveKeyToIOHomeControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"giveKeyToIOHomeControl",_loc2_,param1));
         }
      }
      
      public function set lbGiveKeyToIOHomeControlTitle(param1:Text) : void
      {
         var _loc2_:Object = this._662179885lbGiveKeyToIOHomeControlTitle;
         if(_loc2_ !== param1)
         {
            this._662179885lbGiveKeyToIOHomeControlTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbGiveKeyToIOHomeControlTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbGiveKeyToIOHomeControlTitle() : Text
      {
         return this._662179885lbGiveKeyToIOHomeControlTitle;
      }
      
      private function onBtnCancelGiveKeyToIOHomeControlClickHandler(param1:MouseEvent) : void
      {
         this.giveKeyTimer.stop();
         this.close();
      }
      
      public function set btnStartGiveKeyToIOHomeControl(param1:Button) : void
      {
         var _loc2_:Object = this._1960985739btnStartGiveKeyToIOHomeControl;
         if(_loc2_ !== param1)
         {
            this._1960985739btnStartGiveKeyToIOHomeControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartGiveKeyToIOHomeControl",_loc2_,param1));
         }
      }
      
      public function __btnCancelGiveKeyToIOHomeControl_click(param1:MouseEvent) : void
      {
         this.onBtnCancelGiveKeyToIOHomeControlClickHandler(param1);
      }
      
      private function giveKeyTimerHandler(param1:TimerEvent) : void
      {
         this.giveKeyTimer.stop();
         this.close();
         DialogsManager.showTransferFailedPopup();
      }
      
      private function _GiveSecurityKeyUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGiveKeyToIOHomeControl.y = param1;
         },"lbGiveKeyToIOHomeControl.y");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GiveSecurityKeyUI_HBox1.y = param1;
         },"_GiveSecurityKeyUI_HBox1.y");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGiveKeyToIOHomeControlPressKey.y = param1;
         },"lbGiveKeyToIOHomeControlPressKey.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GiveSecurityKeyUI_HBox2.y = param1;
         },"_GiveSecurityKeyUI_HBox2.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            giveKeySuccessImage.y = param1;
         },"giveKeySuccessImage.y");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGiveKeyToIOHomeControlSuccess.y = param1;
         },"lbGiveKeyToIOHomeControlSuccess.y");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GiveSecurityKeyUI_HBox3.y = param1;
         },"_GiveSecurityKeyUI_HBox3.y");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            giveKeyFailedImage.y = param1;
         },"giveKeyFailedImage.y");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbGiveKeyToIOHomeControlFailed.y = param1;
         },"lbGiveKeyToIOHomeControlFailed.y");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _GiveSecurityKeyUI_HBox4.y = param1;
         },"_GiveSecurityKeyUI_HBox4.y");
         result[9] = binding;
         return result;
      }
      
      public function set lbgiveKeyToIOHomeControlFailedTitle(param1:Text) : void
      {
         var _loc2_:Object = this._418725514lbgiveKeyToIOHomeControlFailedTitle;
         if(_loc2_ !== param1)
         {
            this._418725514lbgiveKeyToIOHomeControlFailedTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbgiveKeyToIOHomeControlFailedTitle",_loc2_,param1));
         }
      }
   }
}
