package com.scenarioLauncher.views
{
   import com.greensock.events.TweenEvent;
   import com.keepcore.KCBoxNavigation;
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.CustomTab;
   import com.scenarioLauncher.components.RemoteCircleUI;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.utils.Images16;
   import com.scenarioLauncher.views.common.CustomCanvas;
   import com.scenarioLauncher.views.renderers.ScenarioRemoteConfigurationTileListRenderer;
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
   import ioService.datamodel.Skitter;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.Box;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.Application;
   import mx.core.DragSource;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   import mx.managers.DragManager;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class RemoteConfigurationUI extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _890446064remoteConfigurationUICasePurple:Button;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1517128130msgRemotesConfigurationUI:Text;
      
      private var _2041194020_currentSkitter:Skitter;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1849433479scenarioTwoImg:Class;
      
      private var recordSkitterName:String = "";
      
      private var temporaryScenarioOnButton1:Scenario;
      
      private var temporaryScenarioOnButton2:Scenario;
      
      private var _117924854btnCancel:Button;
      
      private var recordScenarioOnButton1:Scenario;
      
      private var recordScenarioOnButton2:Scenario;
      
      private var _696838287scenarioBoxNavigation:KCBoxNavigation;
      
      private var _62827356remoteConfigurationUICanvas:CustomCanvas;
      
      private var currentDraggedItem:ScenarioRemoteConfigurationTileListRenderer = null;
      
      private var guiInitialized:Boolean = false;
      
      private var _862062527mainVBRemoteConfigurationUI:VBox;
      
      private var _1497781579scenarioTwoFull:Image;
      
      private var _1352952988scenarioTwo:Image;
      
      private var _1360216880circle:RemoteCircleUI;
      
      private var _616482850scenarioOneLabel:Text;
      
      private var _embed_mxml__1001613089:Class;
      
      private var currentSkitterChanged:Boolean = false;
      
      private var _1088332901scenarioOneFull:Image;
      
      private var _embed_mxml__86666056:Class;
      
      private var _1118569132btnSynchronize:Button;
      
      private var _1946566923remoteConfigurationUIContent:CustomCanvas;
      
      private var _1285138291trashBox:Box;
      
      private var temporarySkitterColor:String = "";
      
      private var _571799197remoteConfigurationUITabLabel:CustomTab;
      
      private var recordSkitterColor:String = "";
      
      private var _1249896437remoteConfigurationUIRemoteName:Text;
      
      private var synchronize:com.scenarioLauncher.views.SynchronizeRemoteContolUI;
      
      private var _1146348632temporarySkitterName:String = "";
      
      private var _embed_mxml__658891085:Class;
      
      private var _embed_mxml__86663010:Class;
      
      private var _374220595remoteConfigurationUICaseGrey:Button;
      
      private var _717313057_allScenarios:ArrayCollection;
      
      private var _1697678125scenarioOneImg:Class;
      
      private var _213831723labelSkitterName:String = "";
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml__1306214841:Class;
      
      private var _1352947894scenarioOne:Image;
      
      private var _embed_mxml__1912698616:Class;
      
      private var _1553660693lbRemoteConfigurationUIPersonnalisation:Text;
      
      private var _embed_mxml__2010198820:Class;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _808475720scenarioTwoLabel:Text;
      
      private var _embed_mxml__658888039:Class;
      
      mx_internal var _bindings:Array;
      
      private var _820675625btnDeleteScenario:Button;
      
      private var _1284063953remoteConfigurationUICaseGreen:Button;
      
      public function RemoteConfigurationUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "id":"mainVBRemoteConfigurationUI",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"mainVBRemoteConfigurationUI",
                        "styleName":"mainVBRemoteConfigurationUI",
                        "width":960,
                        "height":544,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":CustomTab,
                           "id":"remoteConfigurationUITabLabel",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"remoteConfigurationUITabLabel",
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":CustomCanvas,
                           "id":"remoteConfigurationUIContent",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"remoteConfigurationUIContent",
                                 "styleName":"remoteConfigurationUIContent",
                                 "useCustomCanvasSkin":true,
                                 "percentWidth":100,
                                 "height":192,
                                 "y":20,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"msgRemotesConfigurationUI",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"msgRemotesConfigurationUI",
                                          "styleName":"msgRemotesUI",
                                          "x":19,
                                          "y":11,
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":KCBoxNavigation,
                                    "id":"scenarioBoxNavigation",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "x":15,
                                          "y":48,
                                          "width":922,
                                          "itemHorizontalGap":0,
                                          "rowCount":1,
                                          "columnCount":9,
                                          "itemWidth":96,
                                          "itemHeight":120,
                                          "itemRenderer":ScenarioRemoteConfigurationTileListRenderer,
                                          "previousButtonStyleName":"smallPreviousButtonStyle",
                                          "nextButtonStyleName":"smallNextButtonStyle"
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":CustomCanvas,
                           "id":"remoteConfigurationUICanvas",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"remoteConfigurationUICanvas",
                                 "styleName":"remoteConfigurationUICanvas",
                                 "clipContent":true,
                                 "useCustomCanvasSkin":true,
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "y":170,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"remoteConfigurationUIRemoteName",
                                    "events":{"click":"__remoteConfigurationUIRemoteName_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"remoteConfigurationUIRemoteName",
                                          "styleName":"VR18BC",
                                          "y":15,
                                          "x":173,
                                          "width":400,
                                          "mouseChildren":false,
                                          "buttonMode":true,
                                          "useHandCursor":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__1001613089,
                                          "x":199,
                                          "y":61
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbRemoteConfigurationUIPersonnalisation",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbRemoteConfigurationUIPersonnalisation",
                                          "styleName":"lbRemoteConfigurationUIPersonnalisation",
                                          "y":58,
                                          "x":597,
                                          "width":350
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"remoteConfigurationUICaseGrey",
                                    "events":{"click":"__remoteConfigurationUICaseGrey_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.icon = _embed_mxml__2010198820;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"remoteConfigurationUICaseGrey",
                                          "styleName":"remoteConfigurationUICase",
                                          "buttonMode":true,
                                          "width":18,
                                          "height":18,
                                          "x":601,
                                          "y":88,
                                          "mouseChildren":true,
                                          "useHandCursor":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"remoteConfigurationUICaseGreen",
                                    "events":{"click":"__remoteConfigurationUICaseGreen_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.icon = _embed_mxml__1912698616;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"remoteConfigurationUICaseGreen",
                                          "styleName":"remoteConfigurationUICase",
                                          "buttonMode":true,
                                          "width":18,
                                          "height":18,
                                          "x":625,
                                          "y":88,
                                          "mouseChildren":true,
                                          "useHandCursor":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"remoteConfigurationUICasePurple",
                                    "events":{"click":"__remoteConfigurationUICasePurple_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.icon = _embed_mxml__1306214841;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"remoteConfigurationUICasePurple",
                                          "styleName":"remoteConfigurationUICase",
                                          "buttonMode":true,
                                          "width":18,
                                          "height":18,
                                          "x":649,
                                          "y":88,
                                          "mouseChildren":true,
                                          "useHandCursor":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"scenarioOne",
                                    "events":{
                                       "mouseOver":"__scenarioOne_mouseOver",
                                       "mouseUp":"__scenarioOne_mouseUp",
                                       "mouseOut":"__scenarioOne_mouseOut"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"scenarioOne",
                                          "source":_embed_mxml__86666056,
                                          "x":303,
                                          "y":158
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"scenarioTwo",
                                    "events":{
                                       "mouseOver":"__scenarioTwo_mouseOver",
                                       "mouseUp":"__scenarioTwo_mouseUp",
                                       "mouseOut":"__scenarioTwo_mouseOut"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"scenarioTwo",
                                          "source":_embed_mxml__86663010,
                                          "x":394,
                                          "y":157
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"scenarioOneFull",
                                    "events":{
                                       "mouseDown":"__scenarioOneFull_mouseDown",
                                       "mouseOver":"__scenarioOneFull_mouseOver",
                                       "mouseOut":"__scenarioOneFull_mouseOut",
                                       "mouseUp":"__scenarioOneFull_mouseUp"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "width":58,
                                          "maxHeight":58,
                                          "name":"scenarioOneFull",
                                          "useHandCursor":true,
                                          "buttonMode":true,
                                          "source":_embed_mxml__658891085,
                                          "x":303,
                                          "y":158,
                                          "includeInLayout":false,
                                          "visible":false
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"scenarioTwoFull",
                                    "events":{
                                       "mouseDown":"__scenarioTwoFull_mouseDown",
                                       "mouseOver":"__scenarioTwoFull_mouseOver",
                                       "mouseOut":"__scenarioTwoFull_mouseOut",
                                       "mouseUp":"__scenarioTwoFull_mouseUp"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "width":58,
                                          "maxHeight":58,
                                          "name":"scenarioTwoFull",
                                          "useHandCursor":true,
                                          "buttonMode":true,
                                          "source":_embed_mxml__658888039,
                                          "x":394,
                                          "y":157,
                                          "includeInLayout":false,
                                          "visible":false
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"scenarioOneLabel",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"scenarioOneLabel",
                                          "visible":false,
                                          "x":284,
                                          "y":255,
                                          "width":80,
                                          "styleName":"VR12BCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"scenarioTwoLabel",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"scenarioTwoLabel",
                                          "visible":false,
                                          "x":379,
                                          "y":255,
                                          "width":80,
                                          "styleName":"VR12BCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":RemoteCircleUI,
                                    "id":"circle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "x":189,
                                          "y":51,
                                          "visible":false,
                                          "mouseChildren":false,
                                          "mouseEnabled":false
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnSynchronize",
                                    "events":{"click":"__btnSynchronize_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnSynchronize",
                                          "styleName":"btnValidate",
                                          "x":593,
                                          "y":264,
                                          "minWidth":118,
                                          "height":25,
                                          "useHandCursor":true,
                                          "buttonMode":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnCancel",
                                    "events":{"click":"__btnCancel_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnCancel",
                                          "styleName":"btnCancel",
                                          "y":264,
                                          "minWidth":113,
                                          "height":25,
                                          "useHandCursor":true,
                                          "buttonMode":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Box,
                                    "id":"trashBox",
                                    "events":{
                                       "dragEnter":"__trashBox_dragEnter",
                                       "dragDrop":"__trashBox_dragDrop",
                                       "dragExit":"__trashBox_dragExit",
                                       "dragComplete":"__trashBox_dragComplete"
                                    },
                                    "stylesFactory":function():void
                                    {
                                       this.backgroundAlpha = 0;
                                       this.backgroundColor = 16777215;
                                       this.paddingBottom = 20;
                                       this.paddingLeft = 20;
                                       this.paddingRight = 20;
                                       this.paddingTop = 20;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "y":236,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnDeleteScenario",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnDeleteScenario",
                                                   "styleName":"btnDeleteScenario",
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
               })]};
            }
         });
         this._1697678125scenarioOneImg = RemoteConfigurationUI_scenarioOneImg;
         this._1849433479scenarioTwoImg = RemoteConfigurationUI_scenarioTwoImg;
         this._717313057_allScenarios = new ArrayCollection();
         this.synchronize = new com.scenarioLauncher.views.SynchronizeRemoteContolUI();
         this._embed_mxml__1001613089 = RemoteConfigurationUI__embed_mxml__1001613089;
         this._embed_mxml__1306214841 = RemoteConfigurationUI__embed_mxml__1306214841;
         this._embed_mxml__1912698616 = RemoteConfigurationUI__embed_mxml__1912698616;
         this._embed_mxml__2010198820 = RemoteConfigurationUI__embed_mxml__2010198820;
         this._embed_mxml__658888039 = RemoteConfigurationUI__embed_mxml__658888039;
         this._embed_mxml__658891085 = RemoteConfigurationUI__embed_mxml__658891085;
         this._embed_mxml__86663010 = RemoteConfigurationUI__embed_mxml__86663010;
         this._embed_mxml__86666056 = RemoteConfigurationUI__embed_mxml__86666056;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RemoteConfigurationUI._watcherSetupUtil = param1;
      }
      
      public function __trashBox_dragComplete(param1:DragEvent) : void
      {
         this.deleteDragExit(param1);
      }
      
      public function get currentSkitter() : Skitter
      {
         return this._currentSkitter;
      }
      
      public function set currentSkitter(param1:Skitter) : void
      {
         this._currentSkitter = param1;
         if(param1 != null)
         {
            this.temporaryScenarioOnButton1 = param1.ScenarioOnButton1;
            this.temporaryScenarioOnButton2 = param1.ScenarioOnButton2;
            this.temporarySkitterName = param1.name;
            this.temporarySkitterColor = param1.RubberColour;
            this.recordScenarioOnButton1 = param1.ScenarioOnButton1;
            this.recordScenarioOnButton2 = param1.ScenarioOnButton2;
            this.recordSkitterColor = param1.RubberColour;
            this.recordSkitterName = param1.name;
         }
         else
         {
            this.temporaryScenarioOnButton1 = null;
            this.temporaryScenarioOnButton2 = null;
            this.temporarySkitterName = "";
            this.temporarySkitterColor = "";
         }
         this.currentSkitterChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioOneLabel() : Text
      {
         return this._616482850scenarioOneLabel;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioTwoLabel() : Text
      {
         return this._808475720scenarioTwoLabel;
      }
      
      public function btnSynchronizeClickHandler(param1:MouseEvent = null) : void
      {
         if(!ServerCommunicationManager.instance.hasEventListener(InstallationEvent.SKITTER_SYNCHRONISED))
         {
            ServerCommunicationManager.instance.addEventListener(InstallationEvent.SKITTER_SYNCHRONISED,this.skitterSynchronizedHandler);
         }
         if(!ServerCommunicationManager.instance.hasEventListener(FaultEvent.FAULT))
         {
            ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         }
         var _loc2_:Object = ServerCommunicationManager.instance.ifDeviceConnected(this._currentSkitter);
         this._currentSkitter.name = this.temporarySkitterName;
         this._currentSkitter.RubberColour = this.temporarySkitterColor;
         this._currentSkitter.ScenarioOnButton1 = InstallationService.instance.findScenarioInInstallationById(this.temporaryScenarioOnButton1);
         this._currentSkitter.ScenarioOnButton2 = InstallationService.instance.findScenarioInInstallationById(this.temporaryScenarioOnButton2);
         ServerCommunicationManager.instance.currentSkitterInSynchroniseProgress = this._currentSkitter;
         this.synchronize.cancelState = false;
         this.synchronize.remote = this._currentSkitter;
         if(_loc2_.plugged)
         {
            SkitterManager.instance.skitterConnectionAllowed = false;
            KCPopupManager.singleton.displayPopup(this.synchronize);
            ServerCommunicationManager.instance.synchronizeSkitterInConfiguration(this._currentSkitter);
         }
         else
         {
            DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      public function __trashBox_dragEnter(param1:DragEvent) : void
      {
         this.deleteDragEnterHandler(param1);
      }
      
      public function __btnCancel_click(param1:MouseEvent) : void
      {
         this.btnCancelClickHandler(param1);
      }
      
      public function set remoteConfigurationUICasePurple(param1:Button) : void
      {
         var _loc2_:Object = this._890446064remoteConfigurationUICasePurple;
         if(_loc2_ !== param1)
         {
            this._890446064remoteConfigurationUICasePurple = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUICasePurple",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _allScenarios() : ArrayCollection
      {
         return this._717313057_allScenarios;
      }
      
      private function button1MouseUpHandler(param1:MouseEvent) : void
      {
         ScenarioRemoteConfigurationTileListRenderer.lockPosition = false;
         param1.preventDefault();
         if(false)
         {
            ScenarioRemoteConfigurationTileListRenderer.resize.addEventListener(TweenEvent.COMPLETE,this.saveAndUpdateSkitterButton1);
            ScenarioRemoteConfigurationTileListRenderer.resize.addEventListener(TweenEvent.INIT,this.initEffectButton1Handler);
            CursorManager.removeAllCursors();
         }
      }
      
      public function set lbRemoteConfigurationUIPersonnalisation(param1:Text) : void
      {
         var _loc2_:Object = this._1553660693lbRemoteConfigurationUIPersonnalisation;
         if(_loc2_ !== param1)
         {
            this._1553660693lbRemoteConfigurationUIPersonnalisation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbRemoteConfigurationUIPersonnalisation",_loc2_,param1));
         }
      }
      
      protected function scenarioOneFull_mouseUpHandler(param1:MouseEvent) : void
      {
         ScenarioRemoteConfigurationTileListRenderer.currentDraggedItem = null;
         CursorManager.removeAllCursors();
      }
      
      private function initEffectButton1Handler(param1:TweenEvent) : void
      {
         if(false)
         {
            this.currentDraggedItem = ScenarioRemoteConfigurationTileListRenderer.currentDraggedItem;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get msgRemotesConfigurationUI() : Text
      {
         return this._1517128130msgRemotesConfigurationUI;
      }
      
      private function set _allScenarios(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._717313057_allScenarios;
         if(_loc2_ !== param1)
         {
            this._717313057_allScenarios = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_allScenarios",_loc2_,param1));
         }
      }
      
      private function set _currentSkitter(param1:Skitter) : void
      {
         var _loc2_:Object = this._2041194020_currentSkitter;
         if(_loc2_ !== param1)
         {
            this._2041194020_currentSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_currentSkitter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _currentSkitter() : Skitter
      {
         return this._2041194020_currentSkitter;
      }
      
      public function setLabelSkitterName(param1:String) : void
      {
         this.temporarySkitterName = param1;
         if(param1 != "" && param1 != Globals.SOMFY_SKITTER_NAME_DEFAULT)
         {
            this.labelSkitterName = param1;
         }
         else
         {
            this.labelSkitterName = resourceManager.getString("remotes","MSG_NAME_REMOTE");
         }
      }
      
      public function set scenarioOneImg(param1:Class) : void
      {
         var _loc2_:Object = this._1697678125scenarioOneImg;
         if(_loc2_ !== param1)
         {
            this._1697678125scenarioOneImg = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioOneImg",_loc2_,param1));
         }
      }
      
      public function set remoteConfigurationUICaseGreen(param1:Button) : void
      {
         var _loc2_:Object = this._1284063953remoteConfigurationUICaseGreen;
         if(_loc2_ !== param1)
         {
            this._1284063953remoteConfigurationUICaseGreen = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUICaseGreen",_loc2_,param1));
         }
      }
      
      protected function scenarioTwoFull_mouseOverHandler(param1:MouseEvent) : void
      {
         if(!this.scenarioTwo.visible && false)
         {
            CursorManager.setCursor(Images16.CursorNone);
         }
      }
      
      private function button2MouseUpHandler(param1:MouseEvent) : void
      {
         ScenarioRemoteConfigurationTileListRenderer.lockPosition = false;
         param1.preventDefault();
         if(false)
         {
            ScenarioRemoteConfigurationTileListRenderer.resize.addEventListener(TweenEvent.COMPLETE,this.saveAndUpdateSkitterButton2);
            ScenarioRemoteConfigurationTileListRenderer.resize.addEventListener(TweenEvent.INIT,this.initEffectButton2Handler);
            CursorManager.removeAllCursors();
         }
      }
      
      public function __scenarioOneFull_mouseUp(param1:MouseEvent) : void
      {
         this.scenarioOneFull_mouseUpHandler(param1);
      }
      
      public function __remoteConfigurationUICaseGreen_click(param1:MouseEvent) : void
      {
         this.remoteConfigurationUICaseGreenClickHandler(param1);
      }
      
      private function deleteDragEnterHandler(param1:DragEvent) : void
      {
         var _loc2_:Image = null;
         KCTimeAnalyzer.Tracer("deleteDragEnterHandler " + param1.dragInitiator,0);
         if(param1.dragInitiator is Image)
         {
            _loc2_ = Image(param1.dragInitiator);
            DragManager.acceptDragDrop(this.trashBox);
            DragManager.showFeedback(DragManager.COPY);
            this.setTrashIconOpened();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioOneFull() : Image
      {
         return this._1088332901scenarioOneFull;
      }
      
      public function set remoteConfigurationUICaseGrey(param1:Button) : void
      {
         var _loc2_:Object = this._374220595remoteConfigurationUICaseGrey;
         if(_loc2_ !== param1)
         {
            this._374220595remoteConfigurationUICaseGrey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUICaseGrey",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get temporarySkitterName() : String
      {
         return this._1146348632temporarySkitterName;
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         if(ServerCommunicationManager.instance.hasEventListener(InstallationEvent.SKITTER_SYNCHRONISED))
         {
            ServerCommunicationManager.instance.removeEventListener(InstallationEvent.SKITTER_SYNCHRONISED,this.skitterSynchronizedHandler);
         }
         if(ServerCommunicationManager.instance.hasEventListener(FaultEvent.FAULT))
         {
            ServerCommunicationManager.instance.removeEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         }
      }
      
      protected function scenarioTwoFull_mouseUpHandler(param1:MouseEvent) : void
      {
         ScenarioRemoteConfigurationTileListRenderer.currentDraggedItem = null;
         CursorManager.removeAllCursors();
      }
      
      public function set msgRemotesConfigurationUI(param1:Text) : void
      {
         var _loc2_:Object = this._1517128130msgRemotesConfigurationUI;
         if(_loc2_ !== param1)
         {
            this._1517128130msgRemotesConfigurationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgRemotesConfigurationUI",_loc2_,param1));
         }
      }
      
      protected function scenarioOneFull_mouseOverHandler(param1:MouseEvent) : void
      {
         if(!this.scenarioOne.visible && false)
         {
            CursorManager.setCursor(Images16.CursorNone);
         }
      }
      
      private function displayScenarioInSkitter() : void
      {
         var _loc3_:File = null;
         var _loc4_:File = null;
         var _loc1_:* = this.temporaryScenarioOnButton1 != null;
         var _loc2_:* = this.temporaryScenarioOnButton2 != null;
         this.scenarioOne.visible = !_loc1_;
         this.scenarioOne.includeInLayout = !_loc1_;
         this.scenarioOneFull.visible = _loc1_;
         this.scenarioOneFull.includeInLayout = _loc1_;
         this.scenarioOneLabel.visible = _loc1_;
         this.scenarioTwo.visible = !_loc2_;
         this.scenarioTwo.includeInLayout = !_loc2_;
         this.scenarioTwoFull.visible = _loc2_;
         this.scenarioTwoFull.includeInLayout = _loc2_;
         this.scenarioTwoLabel.visible = _loc2_;
         if(_loc1_)
         {
            this.scenarioOneLabel.text = this.temporaryScenarioOnButton1.name;
            _loc3_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this.temporaryScenarioOnButton1.id + ".png");
            if(_loc3_.exists)
            {
               this.scenarioOneFull.source = _loc3_.nativePath;
            }
            else
            {
               this.scenarioOneFull.source = this.scenarioOneImg;
            }
         }
         if(_loc2_)
         {
            this.scenarioTwoLabel.text = this.temporaryScenarioOnButton2.name;
            if((_loc4_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this.temporaryScenarioOnButton2.id + ".png")).exists)
            {
               this.scenarioTwoFull.source = _loc4_.nativePath;
            }
            else
            {
               this.scenarioTwoFull.source = this.scenarioTwoImg;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioBoxNavigation() : KCBoxNavigation
      {
         return this._696838287scenarioBoxNavigation;
      }
      
      public function __scenarioTwo_mouseOut(param1:MouseEvent) : void
      {
         this.button2MouseOutHandler(param1);
      }
      
      public function set scenarioTwoFull(param1:Image) : void
      {
         var _loc2_:Object = this._1497781579scenarioTwoFull;
         if(_loc2_ !== param1)
         {
            this._1497781579scenarioTwoFull = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioTwoFull",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioTwo() : Image
      {
         return this._1352952988scenarioTwo;
      }
      
      public function set btnSynchronize(param1:Button) : void
      {
         var _loc2_:Object = this._1118569132btnSynchronize;
         if(_loc2_ !== param1)
         {
            this._1118569132btnSynchronize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSynchronize",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioOne() : Image
      {
         return this._1352947894scenarioOne;
      }
      
      private function deleteDropHandler(param1:DragEvent) : void
      {
         KCTimeAnalyzer.Tracer("deleteDropHandler " + param1.dragInitiator,0);
         this.setTrashIconOpened(false);
         if(param1.dragSource.hasFormat("scenarioOneFull"))
         {
            this.scenarioOne.visible = true;
            this.scenarioOne.includeInLayout = true;
            this.scenarioOneLabel.visible = false;
            this.scenarioOneLabel.text = "";
            this.scenarioOneFull.source = null;
            this.scenarioOneFull.visible = false;
            this.scenarioOneFull.includeInLayout = false;
            this.temporaryScenarioOnButton1 = null;
         }
         if(param1.dragSource.hasFormat("scenarioTwoFull"))
         {
            trace("delete scenarioTwo");
            this.scenarioTwo.visible = true;
            this.scenarioTwo.includeInLayout = true;
            this.scenarioTwoLabel.visible = false;
            this.scenarioTwoLabel.text = "";
            this.scenarioTwoFull.source = null;
            this.scenarioTwoFull.visible = false;
            this.scenarioTwoFull.includeInLayout = false;
            this.temporaryScenarioOnButton2 = null;
         }
      }
      
      public function set remoteConfigurationUICanvas(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._62827356remoteConfigurationUICanvas;
         if(_loc2_ !== param1)
         {
            this._62827356remoteConfigurationUICanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUICanvas",_loc2_,param1));
         }
      }
      
      public function __scenarioTwoFull_mouseOut(param1:MouseEvent) : void
      {
         this.scenarioTwoFull_mouseOutHandler(param1);
      }
      
      private function set temporarySkitterName(param1:String) : void
      {
         var _loc2_:Object = this._1146348632temporarySkitterName;
         if(_loc2_ !== param1)
         {
            this._1146348632temporarySkitterName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"temporarySkitterName",_loc2_,param1));
         }
      }
      
      public function set remoteConfigurationUITabLabel(param1:CustomTab) : void
      {
         var _loc2_:Object = this._571799197remoteConfigurationUITabLabel;
         if(_loc2_ !== param1)
         {
            this._571799197remoteConfigurationUITabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUITabLabel",_loc2_,param1));
         }
      }
      
      public function set scenarioOneFull(param1:Image) : void
      {
         var _loc2_:Object = this._1088332901scenarioOneFull;
         if(_loc2_ !== param1)
         {
            this._1088332901scenarioOneFull = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioOneFull",_loc2_,param1));
         }
      }
      
      public function __btnSynchronize_click(param1:MouseEvent) : void
      {
         this.btnSynchronizeClickHandler(param1);
      }
      
      protected function scenarioOneFull_mouseOutHandler(param1:MouseEvent) : void
      {
         CursorManager.removeAllCursors();
      }
      
      [Bindable(event="propertyChange")]
      public function get circle() : RemoteCircleUI
      {
         return this._1360216880circle;
      }
      
      private function setTrashIconOpened(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.trashBox.setStyle("paddingTop",8);
            this.btnDeleteScenario.styleName = "btnDeleteScenarioOpen";
         }
         else
         {
            this.trashBox.setStyle("paddingTop",20);
            this.btnDeleteScenario.styleName = "btnDeleteScenario";
         }
      }
      
      public function showSynchronizeCancelRemoteControlUI() : void
      {
         this.synchronize.cancelState = true;
         this.synchronize.remote = this._currentSkitter;
         KCPopupManager.singleton.displayPopup(this.synchronize);
      }
      
      public function __scenarioOneFull_mouseOut(param1:MouseEvent) : void
      {
         this.scenarioOneFull_mouseOutHandler(param1);
      }
      
      public function __remoteConfigurationUIRemoteName_click(param1:MouseEvent) : void
      {
         this.onSkittyNameClickHandler(param1);
      }
      
      public function set trashBox(param1:Box) : void
      {
         var _loc2_:Object = this._1285138291trashBox;
         if(_loc2_ !== param1)
         {
            this._1285138291trashBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trashBox",_loc2_,param1));
         }
      }
      
      public function __scenarioOne_mouseOver(param1:MouseEvent) : void
      {
         this.button1MouseOverHandler(param1);
      }
      
      private function onSkittyNameClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:RenameSkittyUI = new RenameSkittyUI();
         _loc2_.init(this._currentSkitter,this.temporarySkitterName);
         _loc2_.width = 335;
         _loc2_.height = 120;
         _loc2_.validateFunction = this.setLabelSkitterName;
         var _loc3_:Point = this.remoteConfigurationUIRemoteName.localToGlobal(new Point(this.remoteConfigurationUIRemoteName.width / 2,this.remoteConfigurationUIRemoteName.height));
         var _loc4_:Number = Number(Application.application.width);
         _loc2_.x = _loc3_.x - _loc2_.width / 2;
         _loc2_.arrowXPosition = _loc2_.width / 2;
         _loc2_.y = _loc3_.y + 30;
         KCPopupManager.singleton.displayPopup(_loc2_);
         _loc2_.renameSkittyUINewName.setFocus();
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUIContent() : CustomCanvas
      {
         return this._1946566923remoteConfigurationUIContent;
      }
      
      private function skitterSynchronizedHandler(param1:InstallationEvent) : void
      {
         var _loc2_:int = 0;
         if(ServerCommunicationManager.instance.hasEventListener(InstallationEvent.SKITTER_SYNCHRONISED))
         {
            ServerCommunicationManager.instance.removeEventListener(InstallationEvent.SKITTER_SYNCHRONISED,this.skitterSynchronizedHandler);
         }
         if(ServerCommunicationManager.instance.hasEventListener(FaultEvent.FAULT))
         {
            ServerCommunicationManager.instance.removeEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         }
         _loc2_ = ServerCommunicationManager.instance.getDeviceIndex(this._currentSkitter);
         if(_loc2_ > -1)
         {
            ServerCommunicationManager.instance.devicesList.setItemAt(this._currentSkitter,_loc2_);
         }
         KCTimeAnalyzer.Tracer("Skitter synchronized, saving installation...",50);
         InstallationService.instance.saveCurrentInstallation();
         this.synchronize.goToSynchronizationSuccess();
      }
      
      private function saveAndUpdateSkitterButton1(param1:TweenEvent) : void
      {
         this.temporaryScenarioOnButton1 = this.currentDraggedItem.scenario;
         this.scenarioOneFull.visible = true;
         this.scenarioOneFull.includeInLayout = true;
         this.scenarioOneFull.source = this.scenarioOneImg;
         this.scenarioOneLabel.visible = true;
         this.scenarioOneLabel.text = this.currentDraggedItem.scenario.name;
         this.scenarioOne.visible = false;
         this.scenarioOne.includeInLayout = false;
         if(false)
         {
            ScenarioRemoteConfigurationTileListRenderer.resize.removeEventListener(TweenEvent.COMPLETE,this.saveAndUpdateSkitterButton1);
         }
         this.currentDraggedItem = null;
         callLater(this.displayScenarioInSkitter);
      }
      
      private function saveAndUpdateSkitterButton2(param1:TweenEvent) : void
      {
         this.temporaryScenarioOnButton2 = this.currentDraggedItem.scenario;
         this.scenarioTwoFull.visible = true;
         this.scenarioTwoFull.includeInLayout = true;
         this.scenarioTwoFull.source = this.scenarioTwoImg;
         this.scenarioTwoLabel.visible = true;
         this.scenarioTwoLabel.text = this.currentDraggedItem.scenario.name;
         this.scenarioTwo.visible = false;
         this.scenarioTwo.includeInLayout = false;
         ScenarioRemoteConfigurationTileListRenderer.resize.removeEventListener(TweenEvent.COMPLETE,this.saveAndUpdateSkitterButton2);
         this.currentDraggedItem = null;
         callLater(this.displayScenarioInSkitter);
      }
      
      private function initEffectButton2Handler(param1:TweenEvent) : void
      {
         if(false)
         {
            this.currentDraggedItem = ScenarioRemoteConfigurationTileListRenderer.currentDraggedItem;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUICasePurple() : Button
      {
         return this._890446064remoteConfigurationUICasePurple;
      }
      
      public function __scenarioTwoFull_mouseDown(param1:MouseEvent) : void
      {
         this.scenario_mouseDownHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbRemoteConfigurationUIPersonnalisation() : Text
      {
         return this._1553660693lbRemoteConfigurationUIPersonnalisation;
      }
      
      public function set scenarioTwoImg(param1:Class) : void
      {
         var _loc2_:Object = this._1849433479scenarioTwoImg;
         if(_loc2_ !== param1)
         {
            this._1849433479scenarioTwoImg = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioTwoImg",_loc2_,param1));
         }
      }
      
      public function set scenarioBoxNavigation(param1:KCBoxNavigation) : void
      {
         var _loc2_:Object = this._696838287scenarioBoxNavigation;
         if(_loc2_ !== param1)
         {
            this._696838287scenarioBoxNavigation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioBoxNavigation",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioOneImg() : Class
      {
         return this._1697678125scenarioOneImg;
      }
      
      override protected function initLabels() : void
      {
         if(this.remoteConfigurationUITabLabel)
         {
            this.remoteConfigurationUITabLabel.tabLabel = resourceManager.getString("remotes","MSG_REMOTE_CONFIGURATION_TITLE");
         }
         if(this.lbRemoteConfigurationUIPersonnalisation)
         {
            this.lbRemoteConfigurationUIPersonnalisation.htmlText = resourceManager.getString("remotes","MSG_REMOTE_CONFIGURATION_TITLE2");
         }
         if(this.msgRemotesConfigurationUI)
         {
            this.msgRemotesConfigurationUI.htmlText = resourceManager.getString("remotes","MSG_SCENARIO_REMOTE");
         }
         if(this.btnSynchronize)
         {
            this.btnSynchronize.label = resourceManager.getString("common","BTN_SYNCHRONIZE");
         }
         if(this.btnCancel)
         {
            this.btnCancel.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUICaseGrey() : Button
      {
         return this._374220595remoteConfigurationUICaseGrey;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.guiInitialized = true;
         invalidateProperties();
      }
      
      protected function scenario_mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc3_:DragSource = null;
         var _loc4_:Image = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:BitmapData = null;
         var _loc8_:Matrix = null;
         var _loc9_:Bitmap = null;
         var _loc2_:Image = Image(param1.currentTarget);
         if(_loc2_)
         {
            CursorManager.removeAllCursors();
            _loc3_ = new DragSource();
            _loc3_.addData(_loc2_,Image(param1.currentTarget).name);
            _loc4_ = new Image();
            _loc5_ = Image(param1.currentTarget).width;
            _loc6_ = Image(param1.currentTarget).height;
            _loc7_ = new BitmapData(_loc5_,_loc6_,true);
            _loc8_ = new Matrix();
            _loc7_.fillRect(_loc7_.rect,0);
            _loc7_.draw(Image(param1.currentTarget),_loc8_);
            _loc9_ = new Bitmap(_loc7_);
            _loc4_.source = _loc9_;
            DragManager.doDrag(_loc2_,_loc3_,param1,_loc4_,0,0,1);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUICaseGreen() : Button
      {
         return this._1284063953remoteConfigurationUICaseGreen;
      }
      
      public function set scenarioTwo(param1:Image) : void
      {
         var _loc2_:Object = this._1352952988scenarioTwo;
         if(_loc2_ !== param1)
         {
            this._1352952988scenarioTwo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioTwo",_loc2_,param1));
         }
      }
      
      private function button2MouseOutHandler(param1:MouseEvent) : void
      {
         ScenarioRemoteConfigurationTileListRenderer.playResizeEffect = false;
         ScenarioRemoteConfigurationTileListRenderer.lockPosition = false;
         CursorManager.removeAllCursors();
      }
      
      private function setAllSCenarioUI() : void
      {
         this._allScenarios.removeAll();
         this._allScenarios.addAll(ServerCommunicationManager.instance.scenariosList);
      }
      
      private function deleteDragExit(param1:DragEvent) : void
      {
         this.setTrashIconOpened(false);
      }
      
      public function __scenarioTwoFull_mouseOver(param1:MouseEvent) : void
      {
         this.scenarioTwoFull_mouseOverHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioTwoFull() : Image
      {
         return this._1497781579scenarioTwoFull;
      }
      
      public function __scenarioTwoFull_mouseUp(param1:MouseEvent) : void
      {
         this.scenarioTwoFull_mouseUpHandler(param1);
      }
      
      private function button2MouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(false)
         {
            ScenarioRemoteConfigurationTileListRenderer.playResizeEffect = true;
            _loc2_ = this.remoteConfigurationUICanvas.localToGlobal(new Point(this.scenarioTwo.x - this.scenarioTwo.width,this.scenarioTwo.y - this.scenarioTwo.height));
            _loc2_.x += -15;
            _loc2_.y += 2;
            ScenarioRemoteConfigurationTileListRenderer.lockPosition = true;
            ScenarioRemoteConfigurationTileListRenderer.proxyImageCanvas.x = _loc2_.x;
            ScenarioRemoteConfigurationTileListRenderer.proxyImageCanvas.y = _loc2_.y;
            CursorManager.setCursor(Images16.CursorAdd);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSynchronize() : Button
      {
         return this._1118569132btnSynchronize;
      }
      
      public function __scenarioTwo_mouseOver(param1:MouseEvent) : void
      {
         this.button2MouseOverHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUICanvas() : CustomCanvas
      {
         return this._62827356remoteConfigurationUICanvas;
      }
      
      private function button1MouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(false)
         {
            ScenarioRemoteConfigurationTileListRenderer.playResizeEffect = true;
            _loc2_ = this.remoteConfigurationUICanvas.localToGlobal(new Point(this.scenarioOne.x - this.scenarioOne.width,this.scenarioOne.y - this.scenarioOne.height));
            _loc2_.x += -15;
            _loc2_.y += 2;
            ScenarioRemoteConfigurationTileListRenderer.lockPosition = true;
            ScenarioRemoteConfigurationTileListRenderer.proxyImageCanvas.x = _loc2_.x;
            ScenarioRemoteConfigurationTileListRenderer.proxyImageCanvas.y = _loc2_.y;
            CursorManager.setCursor(Images16.CursorAdd);
         }
      }
      
      private function button1MouseOutHandler(param1:MouseEvent) : void
      {
         ScenarioRemoteConfigurationTileListRenderer.playResizeEffect = false;
         ScenarioRemoteConfigurationTileListRenderer.lockPosition = false;
         CursorManager.removeAllCursors();
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUITabLabel() : CustomTab
      {
         return this._571799197remoteConfigurationUITabLabel;
      }
      
      public function set scenarioOne(param1:Image) : void
      {
         var _loc2_:Object = this._1352947894scenarioOne;
         if(_loc2_ !== param1)
         {
            this._1352947894scenarioOne = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioOne",_loc2_,param1));
         }
      }
      
      public function set scenarioTwoLabel(param1:Text) : void
      {
         var _loc2_:Object = this._808475720scenarioTwoLabel;
         if(_loc2_ !== param1)
         {
            this._808475720scenarioTwoLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioTwoLabel",_loc2_,param1));
         }
      }
      
      protected function remoteConfigurationUICaseGreenClickHandler(param1:MouseEvent) : void
      {
         this.circle.color = 5276275;
         this.circle.visible = true;
         this.temporarySkitterColor = Skitter.GREEN;
      }
      
      [Bindable(event="propertyChange")]
      public function get trashBox() : Box
      {
         return this._1285138291trashBox;
      }
      
      protected function remoteConfigurationUICaseGreyClickHandler(param1:MouseEvent) : void
      {
         this.circle.color = 14277854;
         this.circle.visible = true;
         this.temporarySkitterColor = Skitter.GREY;
      }
      
      public function set mainVBRemoteConfigurationUI(param1:VBox) : void
      {
         var _loc2_:Object = this._862062527mainVBRemoteConfigurationUI;
         if(_loc2_ !== param1)
         {
            this._862062527mainVBRemoteConfigurationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainVBRemoteConfigurationUI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioTwoImg() : Class
      {
         return this._1849433479scenarioTwoImg;
      }
      
      private function _RemoteConfigurationUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():ArrayCollection
         {
            return _allScenarios;
         },function(param1:ArrayCollection):void
         {
            scenarioBoxNavigation.dataProvider = param1;
         },"scenarioBoxNavigation.dataProvider");
         result[0] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(0,-40);
         },function(param1:Point):void
         {
            scenarioBoxNavigation.previousButtonPosition = param1;
         },"scenarioBoxNavigation.previousButtonPosition");
         result[1] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(0,-40);
         },function(param1:Point):void
         {
            scenarioBoxNavigation.nextButtonPosition = param1;
         },"scenarioBoxNavigation.nextButtonPosition");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = labelSkitterName;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            remoteConfigurationUIRemoteName.htmlText = param1;
         },"remoteConfigurationUIRemoteName.htmlText");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnCancel.x = param1;
         },"btnCancel.x");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            trashBox.x = param1;
         },"trashBox.x");
         result[5] = binding;
         return result;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RemoteConfigurationUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RemoteConfigurationUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_RemoteConfigurationUIWatcherSetupUtil");
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
      
      public function resetData() : void
      {
         this.currentSkitter = null;
         this.temporaryScenarioOnButton1 = null;
         this.temporaryScenarioOnButton2 = null;
         this.temporarySkitterColor = null;
         this.temporarySkitterName = null;
         this.currentSkitterChanged = true;
         invalidateProperties();
      }
      
      public function __remoteConfigurationUICaseGrey_click(param1:MouseEvent) : void
      {
         this.remoteConfigurationUICaseGreyClickHandler(param1);
      }
      
      public function __scenarioTwo_mouseUp(param1:MouseEvent) : void
      {
         this.button2MouseUpHandler(param1);
      }
      
      public function set circle(param1:RemoteCircleUI) : void
      {
         var _loc2_:Object = this._1360216880circle;
         if(_loc2_ !== param1)
         {
            this._1360216880circle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circle",_loc2_,param1));
         }
      }
      
      private function set labelSkitterName(param1:String) : void
      {
         var _loc2_:Object = this._213831723labelSkitterName;
         if(_loc2_ !== param1)
         {
            this._213831723labelSkitterName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelSkitterName",_loc2_,param1));
         }
      }
      
      protected function scenarioTwoFull_mouseOutHandler(param1:MouseEvent) : void
      {
         CursorManager.removeAllCursors();
      }
      
      public function set btnDeleteScenario(param1:Button) : void
      {
         var _loc2_:Object = this._820675625btnDeleteScenario;
         if(_loc2_ !== param1)
         {
            this._820675625btnDeleteScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDeleteScenario",_loc2_,param1));
         }
      }
      
      public function __trashBox_dragDrop(param1:DragEvent) : void
      {
         this.deleteDropHandler(param1);
      }
      
      public function __scenarioOne_mouseOut(param1:MouseEvent) : void
      {
         this.button1MouseOutHandler(param1);
      }
      
      public function __scenarioOne_mouseUp(param1:MouseEvent) : void
      {
         this.button1MouseUpHandler(param1);
      }
      
      public function __remoteConfigurationUICasePurple_click(param1:MouseEvent) : void
      {
         this.remoteConfigurationUICasePurpleClickHandler(param1);
      }
      
      public function __scenarioOneFull_mouseDown(param1:MouseEvent) : void
      {
         this.scenario_mouseDownHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get mainVBRemoteConfigurationUI() : VBox
      {
         return this._862062527mainVBRemoteConfigurationUI;
      }
      
      public function set scenarioOneLabel(param1:Text) : void
      {
         var _loc2_:Object = this._616482850scenarioOneLabel;
         if(_loc2_ !== param1)
         {
            this._616482850scenarioOneLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioOneLabel",_loc2_,param1));
         }
      }
      
      protected function btnCancelClickHandler(param1:MouseEvent) : void
      {
         this.showSynchronizeCancelRemoteControlUI();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.guiInitialized)
         {
            if(this.currentSkitterChanged)
            {
               this.currentSkitterChanged = false;
               if(this._currentSkitter != null)
               {
                  if(this.temporarySkitterColor != Skitter.DEFAULT)
                  {
                     if(this.temporarySkitterColor == Skitter.GREEN)
                     {
                        this.circle.color = 5276275;
                     }
                     else if(this.temporarySkitterColor == Skitter.PURPLE)
                     {
                        this.circle.color = 5390145;
                     }
                     else if(this.temporarySkitterColor == Skitter.GREY)
                     {
                        this.circle.color = 14277854;
                     }
                     this.circle.visible = true;
                  }
                  else
                  {
                     this.circle.visible = false;
                  }
               }
               this.setAllSCenarioUI();
               if(this._currentSkitter != null)
               {
                  this.btnSynchronize.enabled = this._currentSkitter.active;
                  this.displayScenarioInSkitter();
                  this.setLabelSkitterName(this._currentSkitter.name);
               }
            }
         }
      }
      
      protected function remoteConfigurationUICasePurpleClickHandler(param1:MouseEvent) : void
      {
         this.circle.color = 5390145;
         this.circle.visible = true;
         this.temporarySkitterColor = Skitter.PURPLE;
      }
      
      private function _RemoteConfigurationUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._allScenarios;
         _loc1_ = new Point(0,-40);
         _loc1_ = new Point(0,-40);
         _loc1_ = this.labelSkitterName;
         _loc1_ = this.btnSynchronize.x + this.btnSynchronize.width + 15;
         _loc1_ = this.btnCancel.x + this.btnCancel.width;
      }
      
      [Bindable(event="propertyChange")]
      private function get labelSkitterName() : String
      {
         return this._213831723labelSkitterName;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDeleteScenario() : Button
      {
         return this._820675625btnDeleteScenario;
      }
      
      public function __trashBox_dragExit(param1:DragEvent) : void
      {
         this.deleteDragExit(param1);
      }
      
      public function resetChange() : void
      {
         if(this.currentSkitter != null)
         {
            this.currentSkitter.ScenarioOnButton1 = this.recordScenarioOnButton1;
            this.currentSkitter.ScenarioOnButton2 = this.recordScenarioOnButton2;
            this.currentSkitter.RubberColour = this.recordSkitterColor;
            this.currentSkitter.name = this.recordSkitterName;
         }
      }
      
      public function set remoteConfigurationUIContent(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._1946566923remoteConfigurationUIContent;
         if(_loc2_ !== param1)
         {
            this._1946566923remoteConfigurationUIContent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUIContent",_loc2_,param1));
         }
      }
      
      public function __scenarioOneFull_mouseOver(param1:MouseEvent) : void
      {
         this.scenarioOneFull_mouseOverHandler(param1);
      }
      
      public function set remoteConfigurationUIRemoteName(param1:Text) : void
      {
         var _loc2_:Object = this._1249896437remoteConfigurationUIRemoteName;
         if(_loc2_ !== param1)
         {
            this._1249896437remoteConfigurationUIRemoteName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUIRemoteName",_loc2_,param1));
         }
      }
      
      public function set btnCancel(param1:Button) : void
      {
         var _loc2_:Object = this._117924854btnCancel;
         if(_loc2_ !== param1)
         {
            this._117924854btnCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUIRemoteName() : Text
      {
         return this._1249896437remoteConfigurationUIRemoteName;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancel() : Button
      {
         return this._117924854btnCancel;
      }
   }
}
