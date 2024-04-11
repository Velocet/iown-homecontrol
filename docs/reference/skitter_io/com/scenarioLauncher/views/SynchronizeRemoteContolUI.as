package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.Spinner;
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
   import ioService.datamodel.Skitter;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
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
   
   public class SynchronizeRemoteContolUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1882073789synchronizationFailed:Canvas;
      
      private var _1729132931synchronizationSuccess:Canvas;
      
      private var _1360119842imageSynchronizationFailed:Image;
      
      private var _709048393vsSynchronizationUI:ViewStack;
      
      private var _1456631065lbSynchronizationFailed:Text;
      
      private var _1165213269pictoWarn:Image;
      
      private var _1765677962btnCancelSynchronization:Button;
      
      private var _885272812btnRetrySynchronization:Button;
      
      private var _285616100lbSynchronizationInProgress:Text;
      
      private var _1216695452cancelConfiguration:Canvas;
      
      public var _SynchronizeRemoteContolUI_HBox1:HBox;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _SynchronizeRemoteContolUI_HBox2:HBox;
      
      private var _1851878158synchronizationInProgress:Canvas;
      
      private var _remote:Skitter;
      
      private var _1883982010lbCancelConfiguration:Text;
      
      private var _cancelState:Boolean = false;
      
      private var _2004438503spinner:Spinner;
      
      private var _1054064102btnStartSynchronization:Button;
      
      private var _1308497561lbSynchronizationSuccess:Text;
      
      private var _embed_mxml__887363175:Class;
      
      private var _1538199172btnExitConfiguration:Button;
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml__947407771:Class;
      
      private var _264164458lbSynchronizationInProgress2:Text;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1805160984btnOkSynchronization:Button;
      
      mx_internal var _bindings:Array;
      
      private var _485323493pictoSynchro:Image;
      
      private var _embed_mxml__801521088:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml__928423959:Class;
      
      private var _518669928synchronizationSuccessImage:Image;
      
      public function SynchronizeRemoteContolUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":385,
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
                              "type":Image,
                              "id":"pictoWarn",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__887363175,
                                    "visible":false,
                                    "includeInLayout":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Image,
                              "id":"pictoSynchro",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__947407771,
                                    "width":34
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":ViewStack,
                              "id":"vsSynchronizationUI",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "creationPolicy":"all",
                                    "percentWidth":100,
                                    "resizeToContent":true,
                                    "clipContent":false,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"synchronizationInProgress",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "creationPolicy":"all",
                                             "name":"synchronizationInProgress",
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbSynchronizationInProgress",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbSynchronizationInProgress",
                                                      "percentWidth":100,
                                                      "styleName":"VR18BC"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbSynchronizationInProgress2",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbSynchronizationInProgress2",
                                                      "percentWidth":100,
                                                      "styleName":"V18RCL0"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Spinner,
                                                "id":"spinner",
                                                "stylesFactory":function():void
                                                {
                                                   this.tickColor = 16758037;
                                                   this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "size":48,
                                                      "tickWidth":4,
                                                      "autoPlay":false,
                                                      "height":50,
                                                      "includeInLayout":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"synchronizationSuccess",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"synchronizationSuccess",
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "clipContent":false,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"synchronizationSuccessImage",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__928423959,
                                                      "x":71,
                                                      "y":5,
                                                      "width":28
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbSynchronizationSuccess",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "x":18,
                                                      "name":"lbSynchronizationSuccess",
                                                      "percentWidth":100,
                                                      "styleName":"VR18BCL0"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnOkSynchronization",
                                                "events":{"click":"__btnOkSynchronization_click"},
                                                "stylesFactory":function():void
                                                {
                                                   this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnOkSynchronization",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "styleName":"btnValidate",
                                                      "minWidth":136,
                                                      "height":24
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"synchronizationFailed",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"synchronizationFailed",
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "clipContent":false,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imageSynchronizationFailed",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__801521088,
                                                      "y":3,
                                                      "width":22,
                                                      "height":22
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbSynchronizationFailed",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbSynchronizationFailed",
                                                      "percentWidth":100,
                                                      "styleName":"VR18BCL0",
                                                      "y":1
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":HBox,
                                                "id":"_SynchronizeRemoteContolUI_HBox1",
                                                "stylesFactory":function():void
                                                {
                                                   this.horizontalGap = 18;
                                                   this.horizontalAlign = "center";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":100,
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":Button,
                                                         "id":"btnRetrySynchronization",
                                                         "events":{"click":"__btnRetrySynchronization_click"},
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "cacheAsBitmap":false,
                                                               "name":"btnRetrySynchronization",
                                                               "buttonMode":true,
                                                               "useHandCursor":true,
                                                               "styleName":"btnValidate",
                                                               "minWidth":113,
                                                               "height":24
                                                            };
                                                         }
                                                      }),new UIComponentDescriptor({
                                                         "type":Button,
                                                         "id":"btnCancelSynchronization",
                                                         "events":{"click":"__btnCancelSynchronization_click"},
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "cacheAsBitmap":false,
                                                               "name":"btnCancelSynchronization",
                                                               "buttonMode":true,
                                                               "useHandCursor":true,
                                                               "styleName":"btnCancel",
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
                                       "id":"cancelConfiguration",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"cancelConfiguration",
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbCancelConfiguration",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbCancelConfiguration",
                                                      "percentWidth":100,
                                                      "styleName":"VR18BCL3"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":HBox,
                                                "id":"_SynchronizeRemoteContolUI_HBox2",
                                                "stylesFactory":function():void
                                                {
                                                   this.horizontalGap = 23;
                                                   this.horizontalAlign = "center";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":100,
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":Button,
                                                         "id":"btnStartSynchronization",
                                                         "events":{"click":"__btnStartSynchronization_click"},
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "cacheAsBitmap":false,
                                                               "name":"btnStartSynchronization",
                                                               "buttonMode":true,
                                                               "useHandCursor":true,
                                                               "styleName":"btnValidate",
                                                               "minWidth":128,
                                                               "height":24
                                                            };
                                                         }
                                                      }),new UIComponentDescriptor({
                                                         "type":Button,
                                                         "id":"btnExitConfiguration",
                                                         "events":{"click":"__btnExitConfiguration_click"},
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "cacheAsBitmap":false,
                                                               "name":"btnExitConfiguration",
                                                               "buttonMode":true,
                                                               "useHandCursor":true,
                                                               "styleName":"btnCancel",
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
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__801521088 = SynchronizeRemoteContolUI__embed_mxml__801521088;
         this._embed_mxml__887363175 = SynchronizeRemoteContolUI__embed_mxml__887363175;
         this._embed_mxml__928423959 = SynchronizeRemoteContolUI__embed_mxml__928423959;
         this._embed_mxml__947407771 = SynchronizeRemoteContolUI__embed_mxml__947407771;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 385;
         this.clipContent = false;
         this.addEventListener("preinitialize",this.___SynchronizeRemoteContolUI_CommonPopup1_preinitialize);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         SynchronizeRemoteContolUI._watcherSetupUtil = param1;
      }
      
      public function set synchronizationSuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._1729132931synchronizationSuccess;
         if(_loc2_ !== param1)
         {
            this._1729132931synchronizationSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"synchronizationSuccess",_loc2_,param1));
         }
      }
      
      public function set btnExitConfiguration(param1:Button) : void
      {
         var _loc2_:Object = this._1538199172btnExitConfiguration;
         if(_loc2_ !== param1)
         {
            this._1538199172btnExitConfiguration = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnExitConfiguration",_loc2_,param1));
         }
      }
      
      public function set btnCancelSynchronization(param1:Button) : void
      {
         var _loc2_:Object = this._1765677962btnCancelSynchronization;
         if(_loc2_ !== param1)
         {
            this._1765677962btnCancelSynchronization = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelSynchronization",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRetrySynchronization() : Button
      {
         return this._885272812btnRetrySynchronization;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgress() : Text
      {
         return this._285616100lbSynchronizationInProgress;
      }
      
      private function _SynchronizeRemoteContolUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.lbSynchronizationInProgress.y + this.lbSynchronizationInProgress.height + 20;
         _loc1_ = this.lbSynchronizationInProgress2.y + this.lbSynchronizationInProgress2.height + 20;
         _loc1_ = this.lbSynchronizationSuccess.y + this.lbSynchronizationSuccess.height + 40;
         _loc1_ = this.lbSynchronizationFailed.y + this.lbSynchronizationFailed.height + 20;
         _loc1_ = this.lbCancelConfiguration.y + this.lbCancelConfiguration.height + 20;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartSynchronization() : Button
      {
         return this._1054064102btnStartSynchronization;
      }
      
      public function set btnRetrySynchronization(param1:Button) : void
      {
         var _loc2_:Object = this._885272812btnRetrySynchronization;
         if(_loc2_ !== param1)
         {
            this._885272812btnRetrySynchronization = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRetrySynchronization",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         this.lbSynchronizationInProgress.htmlText = resourceManager.getString("remotes","SYNCHRONIZATION_IN_PROGRESS");
         this.lbSynchronizationInProgress2.htmlText = resourceManager.getString("remotes","SYNCHRONIZATION_IN_PROGRESS2");
         this.lbSynchronizationSuccess.htmlText = resourceManager.getString("remotes","SYNCHRONIZATION_SUCCESS");
         this.lbSynchronizationFailed.htmlText = resourceManager.getString("remotes","SYNCHRONIZATION_FAILED");
         this.btnRetrySynchronization.label = resourceManager.getString("common","BTN_RETRY");
         this.btnCancelSynchronization.label = resourceManager.getString("common","BTN_CANCEL");
         this.lbCancelConfiguration.htmlText = resourceManager.getString("remotes","MSG_WARN_FOR_CANCEL");
         this.btnStartSynchronization.label = resourceManager.getString("common","BTN_SYNCHRONIZE");
         this.btnExitConfiguration.label = resourceManager.getString("common","BTN_CANCEL");
         this.btnOkSynchronization.label = resourceManager.getString("common","BTN_OK");
      }
      
      public function set synchronizationSuccessImage(param1:Image) : void
      {
         var _loc2_:Object = this._518669928synchronizationSuccessImage;
         if(_loc2_ !== param1)
         {
            this._518669928synchronizationSuccessImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"synchronizationSuccessImage",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageSynchronizationFailed() : Image
      {
         return this._1360119842imageSynchronizationFailed;
      }
      
      public function get cancelState() : Boolean
      {
         return this._cancelState;
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         super.closeHandler();
         Globals.SYNCHRO_LOCKED = false;
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         if(this._cancelState)
         {
            this.vsSynchronizationUI.selectedChild = this.cancelConfiguration;
         }
         else
         {
            this.vsSynchronizationUI.selectedChild = this.synchronizationInProgress;
         }
      }
      
      public function set cancelConfiguration(param1:Canvas) : void
      {
         var _loc2_:Object = this._1216695452cancelConfiguration;
         if(_loc2_ !== param1)
         {
            this._1216695452cancelConfiguration = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelConfiguration",_loc2_,param1));
         }
      }
      
      public function set lbSynchronizationSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._1308497561lbSynchronizationSuccess;
         if(_loc2_ !== param1)
         {
            this._1308497561lbSynchronizationSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSynchronizationSuccess",_loc2_,param1));
         }
      }
      
      public function __btnStartSynchronization_click(param1:MouseEvent) : void
      {
         this.btnStartSynchronizationClickHandler(param1);
      }
      
      protected function btnExitConfigurationClickHandler(param1:MouseEvent) : void
      {
         ServerCommunicationManager.instance.currentSkitterInSynchroniseProgress = null;
         Globals.SKITTER_EDITION_IN_PROGRESS = false;
         this.closeHandler();
         Application.application.mainUI.mainUIHeader.selectBtnTelecommandes();
      }
      
      public function get remote() : Skitter
      {
         return this._remote;
      }
      
      public function set lbSynchronizationInProgress(param1:Text) : void
      {
         var _loc2_:Object = this._285616100lbSynchronizationInProgress;
         if(_loc2_ !== param1)
         {
            this._285616100lbSynchronizationInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSynchronizationInProgress",_loc2_,param1));
         }
      }
      
      public function set imageSynchronizationFailed(param1:Image) : void
      {
         var _loc2_:Object = this._1360119842imageSynchronizationFailed;
         if(_loc2_ !== param1)
         {
            this._1360119842imageSynchronizationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageSynchronizationFailed",_loc2_,param1));
         }
      }
      
      public function set btnStartSynchronization(param1:Button) : void
      {
         var _loc2_:Object = this._1054064102btnStartSynchronization;
         if(_loc2_ !== param1)
         {
            this._1054064102btnStartSynchronization = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartSynchronization",_loc2_,param1));
         }
      }
      
      public function set lbSynchronizationInProgress2(param1:Text) : void
      {
         var _loc2_:Object = this._264164458lbSynchronizationInProgress2;
         if(_loc2_ !== param1)
         {
            this._264164458lbSynchronizationInProgress2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSynchronizationInProgress2",_loc2_,param1));
         }
      }
      
      public function ___SynchronizeRemoteContolUI_CommonPopup1_preinitialize(param1:FlexEvent) : void
      {
         this.commonpopup1_preinitializeHandler(param1);
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
      
      public function set pictoWarn(param1:Image) : void
      {
         var _loc2_:Object = this._1165213269pictoWarn;
         if(_loc2_ !== param1)
         {
            this._1165213269pictoWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pictoWarn",_loc2_,param1));
         }
      }
      
      private function goToSynchronization() : void
      {
         this.vsSynchronizationUI.selectedChild = this.synchronizationInProgress;
         this.refreshPopup();
         this.spinner.play();
         Application.application.mainUI.remoteConfigurationUI.btnSynchronizeClickHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbCancelConfiguration() : Text
      {
         return this._1883982010lbCancelConfiguration;
      }
      
      public function __btnOkSynchronization_click(param1:MouseEvent) : void
      {
         this.btnCloseSynchronizationClickHandler(param1);
      }
      
      public function set cancelState(param1:Boolean) : void
      {
         this._cancelState = param1;
      }
      
      public function __btnCancelSynchronization_click(param1:MouseEvent) : void
      {
         this.btnFailedCloseSynchronizationClickHandler(param1);
      }
      
      public function set vsSynchronizationUI(param1:ViewStack) : void
      {
         var _loc2_:Object = this._709048393vsSynchronizationUI;
         if(_loc2_ !== param1)
         {
            this._709048393vsSynchronizationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsSynchronizationUI",_loc2_,param1));
         }
      }
      
      public function set synchronizationFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._1882073789synchronizationFailed;
         if(_loc2_ !== param1)
         {
            this._1882073789synchronizationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"synchronizationFailed",_loc2_,param1));
         }
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_SYNCHRONISE_SKITTER:
               this.goToSynchronizationFailed();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               this.closeHandler();
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnExitConfiguration() : Button
      {
         return this._1538199172btnExitConfiguration;
      }
      
      protected function btnCloseSynchronizationClickHandler(param1:MouseEvent) : void
      {
         ServerCommunicationManager.instance.currentSkitterInSynchroniseProgress = null;
         Globals.SKITTER_EDITION_IN_PROGRESS = false;
         this.closeHandler();
         Application.application.mainUI.mainUIHeader.selectBtnTelecommandes();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelSynchronization() : Button
      {
         return this._1765677962btnCancelSynchronization;
      }
      
      public function set remote(param1:Skitter) : void
      {
         this._remote = param1;
      }
      
      protected function commonpopup1_preinitializeHandler(param1:FlexEvent) : void
      {
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:SynchronizeRemoteContolUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._SynchronizeRemoteContolUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_SynchronizeRemoteContolUIWatcherSetupUtil");
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
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      public function set lbCancelConfiguration(param1:Text) : void
      {
         var _loc2_:Object = this._1883982010lbCancelConfiguration;
         if(_loc2_ !== param1)
         {
            this._1883982010lbCancelConfiguration = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbCancelConfiguration",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationSuccess() : Text
      {
         return this._1308497561lbSynchronizationSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelConfiguration() : Canvas
      {
         return this._1216695452cancelConfiguration;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgress2() : Text
      {
         return this._264164458lbSynchronizationInProgress2;
      }
      
      [Bindable(event="propertyChange")]
      public function get synchronizationSuccessImage() : Image
      {
         return this._518669928synchronizationSuccessImage;
      }
      
      protected function setFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbSynchronizationFailed.validateNow();
         _loc1_ = this.lbSynchronizationFailed.getLineMetrics(0);
         this.imageSynchronizationFailed.x = _loc1_.x - this.imageSynchronizationFailed.width - 5;
      }
      
      public function onAddedToStage(param1:Event) : void
      {
         if(this._cancelState)
         {
            this.vsSynchronizationUI.selectedChild = this.cancelConfiguration;
         }
         else
         {
            this.vsSynchronizationUI.selectedChild = this.synchronizationInProgress;
         }
         this.refreshPopup();
      }
      
      protected function setSuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbSynchronizationSuccess.validateNow();
         _loc1_ = this.lbSynchronizationSuccess.getLineMetrics(0);
         this.synchronizationSuccessImage.x = _loc1_.x - this.synchronizationSuccessImage.width + 14;
      }
      
      [Bindable(event="propertyChange")]
      public function get synchronizationSuccess() : Canvas
      {
         return this._1729132931synchronizationSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get pictoWarn() : Image
      {
         return this._1165213269pictoWarn;
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsSynchronizationUI.selectedChild.id)
         {
            case "synchronizationInProgress":
               this.pictoSynchro.visible = true;
               this.pictoSynchro.includeInLayout = true;
               this.pictoWarn.visible = false;
               this.pictoWarn.includeInLayout = false;
               this.spinner.play();
               break;
            case "synchronizationSuccess":
               this.pictoSynchro.visible = true;
               this.pictoSynchro.includeInLayout = true;
               this.pictoWarn.visible = false;
               this.pictoWarn.includeInLayout = false;
               break;
            case "synchronizationFailed":
               this.pictoSynchro.visible = true;
               this.pictoSynchro.includeInLayout = true;
               this.pictoWarn.visible = false;
               this.pictoWarn.includeInLayout = false;
               break;
            case "cancelConfiguration":
               this.pictoSynchro.visible = false;
               this.pictoSynchro.includeInLayout = false;
               this.pictoWarn.visible = true;
               this.pictoWarn.includeInLayout = true;
         }
         super.refreshUI();
      }
      
      [Bindable(event="propertyChange")]
      public function get vsSynchronizationUI() : ViewStack
      {
         return this._709048393vsSynchronizationUI;
      }
      
      private function _SynchronizeRemoteContolUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbSynchronizationInProgress2.y = param1;
         },"lbSynchronizationInProgress2.y");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnOkSynchronization.y = param1;
         },"btnOkSynchronization.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _SynchronizeRemoteContolUI_HBox1.y = param1;
         },"_SynchronizeRemoteContolUI_HBox1.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _SynchronizeRemoteContolUI_HBox2.y = param1;
         },"_SynchronizeRemoteContolUI_HBox2.y");
         result[4] = binding;
         return result;
      }
      
      public function __btnRetrySynchronization_click(param1:MouseEvent) : void
      {
         this.btnRetrySynchronizationClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get synchronizationFailed() : Canvas
      {
         return this._1882073789synchronizationFailed;
      }
      
      public function set lbSynchronizationFailed(param1:Text) : void
      {
         var _loc2_:Object = this._1456631065lbSynchronizationFailed;
         if(_loc2_ !== param1)
         {
            this._1456631065lbSynchronizationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSynchronizationFailed",_loc2_,param1));
         }
      }
      
      public function set btnOkSynchronization(param1:Button) : void
      {
         var _loc2_:Object = this._1805160984btnOkSynchronization;
         if(_loc2_ !== param1)
         {
            this._1805160984btnOkSynchronization = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOkSynchronization",_loc2_,param1));
         }
      }
      
      public function set pictoSynchro(param1:Image) : void
      {
         var _loc2_:Object = this._485323493pictoSynchro;
         if(_loc2_ !== param1)
         {
            this._485323493pictoSynchro = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pictoSynchro",_loc2_,param1));
         }
      }
      
      protected function btnRetrySynchronizationClickHandler(param1:MouseEvent) : void
      {
         this.goToSynchronization();
      }
      
      protected function btnStartSynchronizationClickHandler(param1:MouseEvent) : void
      {
         this.goToSynchronization();
      }
      
      override protected function onInitialize(param1:FlexEvent) : void
      {
         super.onInitialize(param1);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
      }
      
      protected function btnFailedCloseSynchronizationClickHandler(param1:MouseEvent) : void
      {
         Application.application.mainUI.remoteConfigurationUI.resetChange();
         ServerCommunicationManager.instance.currentSkitterInSynchroniseProgress = null;
         Globals.SKITTER_EDITION_IN_PROGRESS = false;
         this.closeHandler();
         Application.application.mainUI.mainUIHeader.selectBtnTelecommandes();
      }
      
      public function set synchronizationInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._1851878158synchronizationInProgress;
         if(_loc2_ !== param1)
         {
            this._1851878158synchronizationInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"synchronizationInProgress",_loc2_,param1));
         }
      }
      
      public function __btnExitConfiguration_click(param1:MouseEvent) : void
      {
         this.btnExitConfigurationClickHandler(param1);
      }
      
      public function goToSynchronizationSuccess() : void
      {
         this.vsSynchronizationUI.selectedChild = this.synchronizationSuccess;
         this.refreshPopup();
         this.spinner.stop();
         callLater(this.setSuccessIconPosition);
         ServerCommunicationManager.instance.currentSkitterInSynchroniseProgress = null;
         Globals.SYNCHRO_LOCKED = true;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationFailed() : Text
      {
         return this._1456631065lbSynchronizationFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOkSynchronization() : Button
      {
         return this._1805160984btnOkSynchronization;
      }
      
      [Bindable(event="propertyChange")]
      public function get pictoSynchro() : Image
      {
         return this._485323493pictoSynchro;
      }
      
      [Bindable(event="propertyChange")]
      public function get synchronizationInProgress() : Canvas
      {
         return this._1851878158synchronizationInProgress;
      }
      
      private function goToSynchronizationFailed() : void
      {
         this.vsSynchronizationUI.selectedChild = this.synchronizationFailed;
         this.spinner.stop();
         callLater(this.setFailedIconPosition);
         Globals.SYNCHRO_LOCKED = true;
      }
   }
}
