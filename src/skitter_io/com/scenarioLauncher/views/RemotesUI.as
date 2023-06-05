package com.scenarioLauncher.views
{
   import com.keepcore.KCBoxNavigation;
   import com.keepcore.KCBoxNavigationEvent;
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.components.CustomTab;
   import com.scenarioLauncher.components.RemoteCanvas;
   import com.scenarioLauncher.events.RemoteEvent;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.services.SkitterService;
   import com.scenarioLauncher.views.common.CustomCanvas;
   import com.scenarioLauncher.views.renderers.RemoteTileListRenderer;
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
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.HRule;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.DynamicEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class RemotesUI extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _931659058remoteUIScenarioTwoLabel:Text;
      
      private var _1041126385remoteName:Text;
      
      private var _1473648416_remoteSelected:Skitter;
      
      private var _363193096remotesUIContent:CustomCanvas;
      
      private var _891588322remoteUIScenarioTwo:Image;
      
      private var _1268149184remotesUITabLabel:CustomTab;
      
      private var _embed_mxml__________assets_images_remotes_petit_skitter_png_1649357928:Class;
      
      private var _2109056578remoteUIDescription:HBox;
      
      private var _1564001383remoteBoxNavigation:KCBoxNavigation;
      
      private var scenarioTwoClass:Class;
      
      private var _1123651928remoteUIScenarioOneLabel:Text;
      
      private var _383225519btnEditRemoteControl:Button;
      
      private var _201643437_arrowPosition:Point;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var scenarioOneClass:Class;
      
      private var _embed_mxml__658891085:Class;
      
      private var _1122941028mainVBRemotesUI:VBox;
      
      private var deviceChanged:Boolean = false;
      
      private var _1275942480btnDeleteRemoteControl:Button;
      
      private var _891583228remoteUIScenarioOne:Image;
      
      mx_internal var _watchers:Array;
      
      private var guiInitialized:Boolean = false;
      
      private var selectedRemoteRenderer:UIComponent;
      
      private var _519795394remoteCanvas:RemoteCanvas;
      
      private var _774414056btnReInitRemoteControl:Button;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _917630400msgRemotesUI:Text;
      
      private var _embed_mxml__658888039:Class;
      
      mx_internal var _bindings:Array;
      
      private var remoteSelectionChanged:Boolean = false;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function RemotesUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {
                  "creationPolicy":"all",
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "id":"mainVBRemotesUI",
                     "stylesFactory":function():void
                     {
                        this.verticalGap = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "name":"mainVBRemotesUI",
                           "width":963,
                           "height":328,
                           "creationPolicy":"all",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":CustomTab,
                              "id":"remotesUITabLabel",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"remotesUITabLabel",
                                    "percentWidth":100
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":CustomCanvas,
                              "id":"remotesUIContent",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"remotesUIContent",
                                    "styleName":"remotesUIContent",
                                    "useCustomCanvasSkin":true,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "y":20,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"msgRemotesUI",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"msgRemotesUI",
                                             "x":19,
                                             "y":11,
                                             "percentWidth":100
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":KCBoxNavigation,
                                       "id":"remoteBoxNavigation",
                                       "events":{
                                          "scrollPrevious":"__remoteBoxNavigation_scrollPrevious",
                                          "scrollNext":"__remoteBoxNavigation_scrollNext"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "y":37,
                                             "x":5,
                                             "previousButtonBarThickness":40,
                                             "nextButtonBarThickness":40,
                                             "itemWidth":216,
                                             "itemHeight":240,
                                             "autoScroll":true,
                                             "rowCount":1,
                                             "columnCount":4,
                                             "itemRenderer":RemoteTileListRenderer,
                                             "previousButtonStyleName":"smallPreviousButtonStyle",
                                             "nextButtonStyleName":"smallNextButtonStyle"
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":RemoteCanvas,
                     "id":"remoteCanvas",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "name":"remoteCanvas",
                           "styleName":"remoteCanvas",
                           "visible":false,
                           "y":328,
                           "width":963,
                           "height":216,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":HBox,
                              "id":"remoteUIDescription",
                              "stylesFactory":function():void
                              {
                                 this.horizontalGap = 0;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"remoteUIDescription",
                                    "x":53,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Canvas,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "height":114,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__________assets_images_remotes_petit_skitter_png_1649357928,
                                                      "x":23,
                                                      "y":30
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"remoteName",
                                                "stylesFactory":function():void
                                                {
                                                   this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"remoteName",
                                                      "styleName":"VB18BC",
                                                      "x":95,
                                                      "maxWidth":200
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"childDescriptors":[new UIComponentDescriptor({
                                             "type":HRule,
                                             "stylesFactory":function():void
                                             {
                                                this.strokeColor = 0;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "width":100,
                                                   "x":9,
                                                   "y":57
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Image,
                                             "id":"remoteUIScenarioOne",
                                             "stylesFactory":function():void
                                             {
                                                this.verticalAlign = "bottom";
                                                this.horizontalAlign = "center";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"remoteUIScenarioOne",
                                                   "source":_embed_mxml__658891085,
                                                   "width":57,
                                                   "maxHeight":58,
                                                   "x":120,
                                                   "y":27
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HRule,
                                             "stylesFactory":function():void
                                             {
                                                this.strokeColor = 0;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "width":114,
                                                   "x":185,
                                                   "y":57
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Image,
                                             "id":"remoteUIScenarioTwo",
                                             "stylesFactory":function():void
                                             {
                                                this.verticalAlign = "bottom";
                                                this.horizontalAlign = "center";
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"remoteUIScenarioTwo",
                                                   "source":_embed_mxml__658888039,
                                                   "width":57,
                                                   "maxHeight":58,
                                                   "x":315,
                                                   "y":27
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HRule,
                                             "stylesFactory":function():void
                                             {
                                                this.strokeColor = 0;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "width":76,
                                                   "x":384,
                                                   "y":57
                                                };
                                             }
                                          })]};
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"remoteUIScenarioOneLabel",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"remoteUIScenarioOneLabel",
                                    "styleName":"VR12BCLm1",
                                    "width":200,
                                    "y":92
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"remoteUIScenarioTwoLabel",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"remoteUIScenarioTwoLabel",
                                    "styleName":"VR12BCLm1",
                                    "width":200,
                                    "y":92
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":HBox,
                              "stylesFactory":function():void
                              {
                                 this.horizontalGap = 39;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":76,
                                    "y":168,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnEditRemoteControl",
                                       "events":{"click":"__btnEditRemoteControl_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"btnEditRemoteControl",
                                             "styleName":"btnValidate",
                                             "minWidth":106,
                                             "buttonMode":true,
                                             "useHandCursor":true
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnDeleteRemoteControl",
                                       "events":{"click":"__btnDeleteRemoteControl_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"btnDeleteRemoteControl",
                                             "styleName":"btnCancel",
                                             "width":96,
                                             "buttonMode":true,
                                             "useHandCursor":true
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnReInitRemoteControl",
                                       "events":{"click":"__btnReInitRemoteControl_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"btnReInitRemoteControl",
                                             "styleName":"btnValidate",
                                             "width":120,
                                             "buttonMode":true,
                                             "useHandCursor":true
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
         this.scenarioOneClass = RemotesUI_scenarioOneClass;
         this.scenarioTwoClass = RemotesUI_scenarioTwoClass;
         this._embed_mxml__658888039 = RemotesUI__embed_mxml__658888039;
         this._embed_mxml__658891085 = RemotesUI__embed_mxml__658891085;
         this._embed_mxml__________assets_images_remotes_petit_skitter_png_1649357928 = RemotesUI__embed_mxml__________assets_images_remotes_petit_skitter_png_1649357928;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.creationPolicy = "all";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RemotesUI._watcherSetupUtil = param1;
      }
      
      public function get remoteSelected() : Skitter
      {
         return this._remoteSelected;
      }
      
      public function set remoteSelected(param1:Skitter) : void
      {
         this._remoteSelected = param1;
      }
      
      private function remoteClickHandler(param1:DynamicEvent) : void
      {
         this.selectedRemoteRenderer = UIComponent(param1.renderer);
         this._arrowPosition = new Point(this.selectedRemoteRenderer.x + this.selectedRemoteRenderer.width / 2 + 80 - this.remoteBoxNavigation.getHorizontalScrollPosition(),this.selectedRemoteRenderer.y + this.selectedRemoteRenderer.height);
         this.remoteCanvas.refresh();
         this.remoteCanvas.visible = true;
         this.remoteCanvas.includeInLayout = true;
         this.mainVBRemotesUI.height = 342;
         this._remoteSelected = param1.remote;
         this.deviceChanged = true;
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteUIScenarioOne() : Image
      {
         return this._891583228remoteUIScenarioOne;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnReInitRemoteControl() : Button
      {
         return this._774414056btnReInitRemoteControl;
      }
      
      private function onBtnReInitRemoteControlClickHandler(param1:MouseEvent) : void
      {
         DialogsManager.showSkitterReinitialisePopup(this._remoteSelected);
      }
      
      private function _RemotesUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ServerCommunicationManager.instance.devicesList;
         _loc1_ = new Point(22,3);
         _loc1_ = new Point(-14,3);
         _loc1_ = this._arrowPosition;
         _loc1_ = !this._remoteSelected.active;
         _loc1_ = !this._remoteSelected.active;
         _loc1_ = this._remoteSelected.active;
         _loc1_ = this._remoteSelected.active;
      }
      
      public function validateDeleteRemote(param1:Skitter) : void
      {
         if(param1 != null)
         {
            InstallationService.instance.currentInstallation.devices.removeItemAt(InstallationService.instance.currentInstallation.devices.getItemIndex(param1));
            SkitterService.instance.deleteSkitter(param1);
            this.remoteCanvas.visible = false;
            this.remoteCanvas.includeInLayout = false;
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _remoteSelected() : Skitter
      {
         return this._1473648416_remoteSelected;
      }
      
      public function __remoteBoxNavigation_scrollPrevious(param1:KCBoxNavigationEvent) : void
      {
         this.remoteBoxNavigation_scrollPreviousHandler(param1);
      }
      
      override protected function initLabels() : void
      {
         this.remotesUITabLabel.tabLabel = resourceManager.getString("remotes","REMOTES_TITLE");
         this.remoteUIScenarioOneLabel.htmlText = resourceManager.getString("remotes","MSG_NO_SCENARIO_ASSOCIATED");
         this.remoteUIScenarioTwoLabel.htmlText = resourceManager.getString("remotes","MSG_NO_SCENARIO_ASSOCIATED");
         this.remoteName.htmlText = resourceManager.getString("remotes","LBL_UNKNOWN_REMOTE");
         this.btnEditRemoteControl.label = resourceManager.getString("common","BTN_PARAM");
         this.btnDeleteRemoteControl.label = resourceManager.getString("common","BTN_DELETE");
         this.btnReInitRemoteControl.label = resourceManager.getString("common","BTN_REINIT");
         this.refreshMsg();
      }
      
      public function set btnReInitRemoteControl(param1:Button) : void
      {
         var _loc2_:Object = this._774414056btnReInitRemoteControl;
         if(_loc2_ !== param1)
         {
            this._774414056btnReInitRemoteControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnReInitRemoteControl",_loc2_,param1));
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.remoteBoxNavigation.addEventListener(RemoteEvent.REMOTE_CONTROL_CLICK,this.remoteClickHandler);
         this.remoteBoxNavigation.addEventListener(KCBoxNavigationEvent.SCROLL_NEXT,this.kcBoxScrollEventHandler);
         this.remoteBoxNavigation.addEventListener(KCBoxNavigationEvent.SCROLL_PREVIOUS,this.kcBoxScrollEventHandler);
         ServerCommunicationManager.instance.devicesList.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.devicesCollectionChangeHandler);
         this.guiInitialized = true;
         this.deviceChanged = true;
         invalidateProperties();
      }
      
      public function set mainVBRemotesUI(param1:VBox) : void
      {
         var _loc2_:Object = this._1122941028mainVBRemotesUI;
         if(_loc2_ !== param1)
         {
            this._1122941028mainVBRemotesUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainVBRemotesUI",_loc2_,param1));
         }
      }
      
      public function set remoteBoxNavigation(param1:KCBoxNavigation) : void
      {
         var _loc2_:Object = this._1564001383remoteBoxNavigation;
         if(_loc2_ !== param1)
         {
            this._1564001383remoteBoxNavigation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteBoxNavigation",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteCanvas() : RemoteCanvas
      {
         return this._519795394remoteCanvas;
      }
      
      private function set _remoteSelected(param1:Skitter) : void
      {
         var _loc2_:Object = this._1473648416_remoteSelected;
         if(_loc2_ !== param1)
         {
            this._1473648416_remoteSelected = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_remoteSelected",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteUIScenarioTwoLabel() : Text
      {
         return this._931659058remoteUIScenarioTwoLabel;
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteUIDescription() : HBox
      {
         return this._2109056578remoteUIDescription;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDeleteRemoteControl() : Button
      {
         return this._1275942480btnDeleteRemoteControl;
      }
      
      private function onBtnDeleteRemoteControlClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:DeleteRemoteUI = new DeleteRemoteUI();
         _loc2_.remote = this._remoteSelected;
         _loc2_.validateFunction = this.validateDeleteRemote;
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      private function get _arrowPosition() : Point
      {
         return this._201643437_arrowPosition;
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteUIScenarioOneLabel() : Text
      {
         return this._1123651928remoteUIScenarioOneLabel;
      }
      
      private function setRemoteUIScenarioLabelCoordinate(param1:Image) : Point
      {
         var _loc2_:Point = new Point(param1.width / 2,param1.height);
         _loc2_ = param1.contentToGlobal(_loc2_);
         _loc2_ = this.remoteCanvas.globalToContent(_loc2_);
         _loc2_.x -= Math.round(this.remoteUIScenarioOneLabel.width / 2);
         return _loc2_;
      }
      
      public function set remoteUIScenarioTwoLabel(param1:Text) : void
      {
         var _loc2_:Object = this._931659058remoteUIScenarioTwoLabel;
         if(_loc2_ !== param1)
         {
            this._931659058remoteUIScenarioTwoLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteUIScenarioTwoLabel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnEditRemoteControl() : Button
      {
         return this._383225519btnEditRemoteControl;
      }
      
      private function kcBoxScrollEventHandler(param1:KCBoxNavigationEvent) : void
      {
         if(this._arrowPosition != null)
         {
            this._arrowPosition = new Point(this._arrowPosition.x + param1.scrollOffset,this._arrowPosition.y);
            this.remoteCanvas.refresh();
         }
      }
      
      public function set remoteCanvas(param1:RemoteCanvas) : void
      {
         var _loc2_:Object = this._519795394remoteCanvas;
         if(_loc2_ !== param1)
         {
            this._519795394remoteCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteCanvas",_loc2_,param1));
         }
      }
      
      public function set msgRemotesUI(param1:Text) : void
      {
         var _loc2_:Object = this._917630400msgRemotesUI;
         if(_loc2_ !== param1)
         {
            this._917630400msgRemotesUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgRemotesUI",_loc2_,param1));
         }
      }
      
      public function __btnReInitRemoteControl_click(param1:MouseEvent) : void
      {
         this.onBtnReInitRemoteControlClickHandler(param1);
      }
      
      public function set remoteUIDescription(param1:HBox) : void
      {
         var _loc2_:Object = this._2109056578remoteUIDescription;
         if(_loc2_ !== param1)
         {
            this._2109056578remoteUIDescription = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteUIDescription",_loc2_,param1));
         }
      }
      
      public function set remotesUITabLabel(param1:CustomTab) : void
      {
         var _loc2_:Object = this._1268149184remotesUITabLabel;
         if(_loc2_ !== param1)
         {
            this._1268149184remotesUITabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remotesUITabLabel",_loc2_,param1));
         }
      }
      
      private function onBtnEditRemoteControlClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:RemoteEvent = null;
         if(!this._remoteSelected.active)
         {
            DialogsManager.showSkitterNotConnectedPopup();
         }
         else
         {
            Globals.SKITTER_EDITION_IN_PROGRESS = true;
            _loc2_ = new RemoteEvent(RemoteEvent.REMOTE_CONTROL_EDITION_CLICK);
            _loc2_.skitterControl = this._remoteSelected;
            this.dispatchEvent(_loc2_);
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RemotesUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RemotesUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_RemotesUIWatcherSetupUtil");
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
      public function get mainVBRemotesUI() : VBox
      {
         return this._1122941028mainVBRemotesUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteBoxNavigation() : KCBoxNavigation
      {
         return this._1564001383remoteBoxNavigation;
      }
      
      public function set btnEditRemoteControl(param1:Button) : void
      {
         var _loc2_:Object = this._383225519btnEditRemoteControl;
         if(_loc2_ !== param1)
         {
            this._383225519btnEditRemoteControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnEditRemoteControl",_loc2_,param1));
         }
      }
      
      private function refreshMsg() : void
      {
         if(ServerCommunicationManager.instance.devicesList == null || ServerCommunicationManager.instance.devicesList.length == 0)
         {
            this.msgRemotesUI.htmlText = resourceManager.getString("remotes","MSG_SKITTER_NO_ACTUATORS");
         }
         else
         {
            this.msgRemotesUI.htmlText = resourceManager.getString("remotes","MSG_CLICK_PRODUCT_FOR_EDIT");
         }
      }
      
      protected function remoteBoxNavigation_scrollPreviousHandler(param1:KCBoxNavigationEvent) : void
      {
         KCTimeAnalyzer.Tracer("remoteBoxNavigation_scrollPreviousHandler",100);
      }
      
      protected function remoteBoxNavigation_scrollNextHandler(param1:KCBoxNavigationEvent) : void
      {
         KCTimeAnalyzer.Tracer("remoteBoxNavigation_scrollNextHandler",100);
      }
      
      public function __remoteBoxNavigation_scrollNext(param1:KCBoxNavigationEvent) : void
      {
         this.remoteBoxNavigation_scrollNextHandler(param1);
      }
      
      public function set btnDeleteRemoteControl(param1:Button) : void
      {
         var _loc2_:Object = this._1275942480btnDeleteRemoteControl;
         if(_loc2_ !== param1)
         {
            this._1275942480btnDeleteRemoteControl = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDeleteRemoteControl",_loc2_,param1));
         }
      }
      
      public function set remoteUIScenarioOneLabel(param1:Text) : void
      {
         var _loc2_:Object = this._1123651928remoteUIScenarioOneLabel;
         if(_loc2_ !== param1)
         {
            this._1123651928remoteUIScenarioOneLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteUIScenarioOneLabel",_loc2_,param1));
         }
      }
      
      private function _RemotesUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():ArrayCollection
         {
            return ServerCommunicationManager.instance.devicesList;
         },function(param1:ArrayCollection):void
         {
            remoteBoxNavigation.dataProvider = param1;
         },"remoteBoxNavigation.dataProvider");
         result[0] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(22,3);
         },function(param1:Point):void
         {
            remoteBoxNavigation.previousButtonPosition = param1;
         },"remoteBoxNavigation.previousButtonPosition");
         result[1] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(-14,3);
         },function(param1:Point):void
         {
            remoteBoxNavigation.nextButtonPosition = param1;
         },"remoteBoxNavigation.nextButtonPosition");
         result[2] = binding;
         binding = new Binding(this,function():Point
         {
            return _arrowPosition;
         },function(param1:Point):void
         {
            remoteCanvas.arrowPosition = param1;
         },"remoteCanvas.arrowPosition");
         result[3] = binding;
         binding = new Binding(this,function():Boolean
         {
            return true;
         },function(param1:Boolean):void
         {
            btnDeleteRemoteControl.includeInLayout = param1;
         },"btnDeleteRemoteControl.includeInLayout");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return true;
         },function(param1:Boolean):void
         {
            btnDeleteRemoteControl.visible = param1;
         },"btnDeleteRemoteControl.visible");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _remoteSelected.active;
         },function(param1:Boolean):void
         {
            btnReInitRemoteControl.includeInLayout = param1;
         },"btnReInitRemoteControl.includeInLayout");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _remoteSelected.active;
         },function(param1:Boolean):void
         {
            btnReInitRemoteControl.visible = param1;
         },"btnReInitRemoteControl.visible");
         result[7] = binding;
         return result;
      }
      
      private function set _arrowPosition(param1:Point) : void
      {
         var _loc2_:Object = this._201643437_arrowPosition;
         if(_loc2_ !== param1)
         {
            this._201643437_arrowPosition = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_arrowPosition",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         this.remoteUIScenarioOneLabel.x = this.setRemoteUIScenarioLabelCoordinate(this.remoteUIScenarioOne).x;
         this.remoteUIScenarioTwoLabel.x = this.setRemoteUIScenarioLabelCoordinate(this.remoteUIScenarioTwo).x;
      }
      
      public function __btnDeleteRemoteControl_click(param1:MouseEvent) : void
      {
         this.onBtnDeleteRemoteControlClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get msgRemotesUI() : Text
      {
         return this._917630400msgRemotesUI;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:File = null;
         var _loc2_:File = null;
         super.commitProperties();
         if(this.remoteSelectionChanged && this.selectedRemoteRenderer != null)
         {
            this.remoteSelectionChanged = false;
            this._arrowPosition = new Point(this.selectedRemoteRenderer.x + this.selectedRemoteRenderer.width / 2 + 80 - this.remoteBoxNavigation.getHorizontalScrollPosition(),this.selectedRemoteRenderer.y + this.selectedRemoteRenderer.height);
         }
         if(this.guiInitialized && this.deviceChanged)
         {
            this.deviceChanged = false;
            this.refreshMsg();
            if(this._remoteSelected != null)
            {
               if(this._remoteSelected.name != "")
               {
                  this.remoteName.htmlText = this._remoteSelected.name;
               }
               else
               {
                  this.remoteName.htmlText = resourceManager.getString("remotes","LBL_UNKNOWN_REMOTE");
               }
               if(this._remoteSelected.ScenarioOnButton1 != null)
               {
                  this.remoteUIScenarioOneLabel.htmlText = this._remoteSelected.ScenarioOnButton1.name;
                  _loc1_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this._remoteSelected.ScenarioOnButton1.id + ".png");
                  if(_loc1_.exists)
                  {
                     this.remoteUIScenarioOne.source = _loc1_.nativePath;
                  }
                  else
                  {
                     this.remoteUIScenarioOne.source = this.scenarioOneClass;
                  }
               }
               else
               {
                  this.remoteUIScenarioOne.source = null;
                  this.remoteUIScenarioOne.source = this.scenarioOneClass;
                  this.remoteUIScenarioOneLabel.htmlText = resourceManager.getString("remotes","MSG_NO_SCENARIO_ASSOCIATED");
               }
               if(this._remoteSelected.ScenarioOnButton2 != null)
               {
                  this.remoteUIScenarioTwoLabel.htmlText = this._remoteSelected.ScenarioOnButton2.name;
                  _loc2_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this._remoteSelected.ScenarioOnButton2.id + ".png");
                  if(_loc2_.exists)
                  {
                     this.remoteUIScenarioTwo.source = _loc2_.nativePath;
                  }
                  else
                  {
                     this.remoteUIScenarioTwo.source = this.scenarioTwoClass;
                  }
               }
               else
               {
                  this.remoteUIScenarioTwo.source = null;
                  this.remoteUIScenarioTwo.source = this.scenarioTwoClass;
                  this.remoteUIScenarioTwoLabel.htmlText = resourceManager.getString("remotes","MSG_NO_SCENARIO_ASSOCIATED");
               }
               callLater(this.refreshUI);
            }
         }
      }
      
      public function set remoteUIScenarioTwo(param1:Image) : void
      {
         var _loc2_:Object = this._891588322remoteUIScenarioTwo;
         if(_loc2_ !== param1)
         {
            this._891588322remoteUIScenarioTwo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteUIScenarioTwo",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remotesUITabLabel() : CustomTab
      {
         return this._1268149184remotesUITabLabel;
      }
      
      public function refresh() : void
      {
         if(this._remoteSelected == null)
         {
            this.hideArrow();
            if(this.mainVBRemotesUI != null)
            {
               this.mainVBRemotesUI.height = 328;
            }
         }
      }
      
      private function devicesCollectionChangeHandler(param1:CollectionEvent) : void
      {
         var _loc2_:* = null;
         if(param1.kind == CollectionEventKind.UPDATE)
         {
            this.deviceChanged = true;
            invalidateProperties();
            if(this._remoteSelected != null)
            {
               for each(_loc2_ in ServerCommunicationManager.instance.devicesList)
               {
                  if(_loc2_.identifier == this._remoteSelected.identifier)
                  {
                     this._remoteSelected = _loc2_;
                     break;
                  }
               }
            }
         }
      }
      
      public function set remoteName(param1:Text) : void
      {
         var _loc2_:Object = this._1041126385remoteName;
         if(_loc2_ !== param1)
         {
            this._1041126385remoteName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteName",_loc2_,param1));
         }
      }
      
      private function hideArrow() : void
      {
         this._arrowPosition = new Point(-500,-500);
         if(this.remoteCanvas != null)
         {
            this.remoteCanvas.visible = false;
            this.remoteCanvas.includeInLayout = false;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteUIScenarioTwo() : Image
      {
         return this._891588322remoteUIScenarioTwo;
      }
      
      public function set remotesUIContent(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._363193096remotesUIContent;
         if(_loc2_ !== param1)
         {
            this._363193096remotesUIContent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remotesUIContent",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteName() : Text
      {
         return this._1041126385remoteName;
      }
      
      public function set remoteUIScenarioOne(param1:Image) : void
      {
         var _loc2_:Object = this._891583228remoteUIScenarioOne;
         if(_loc2_ !== param1)
         {
            this._891583228remoteUIScenarioOne = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteUIScenarioOne",_loc2_,param1));
         }
      }
      
      public function __btnEditRemoteControl_click(param1:MouseEvent) : void
      {
         this.onBtnEditRemoteControlClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get remotesUIContent() : CustomCanvas
      {
         return this._363193096remotesUIContent;
      }
   }
}
