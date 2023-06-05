package com.scenarioLauncher.views
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.services.InstallationService;
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
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class AskForIOHomecontrolUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var _AskForIOHomecontrolUI_HBox9:HBox;
      
      private var _1811125952isUserHaveNewIOHomecontrolWithFeedback:Canvas;
      
      private var _847324571lbNewIOHomecontrolCommunicationEquipmentPartialyFailed:Text;
      
      private var _1146815043lbCommunicationRemoteFailed:Text;
      
      private var _419447015communicationRemoteFailed:Canvas;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _768174890btnNoUserHaveOneWRemotecontrol:Button;
      
      private var _1954334886discoveryNewIOHomecontrolInProgress:Canvas;
      
      private var _2050624522btnDiscoveryOneWayCommunicationEquipmentFailedRetry:Button;
      
      private var _526899487lbNewIOHomecontrolDiscoverySuccess:Text;
      
      private var _1231026784lbDiscoveryOneWaySuccess:Text;
      
      private var _394693683discoverySuccess:Canvas;
      
      private var _974582950btUserOneWRemotecontrolManipulationsThenOK:Button;
      
      private var _1198521823btnNewIOHomecontrolCommunicationEquipmentFailedRetry:Button;
      
      private var _108802431spinnerDiscoveryNewIOHomecontrolInProgress:Spinner;
      
      private var _638775849btnNoIsUserHaveIOHomecontrolWithFeedback:Button;
      
      private var _200124242lbUserManipulationsThenOK:Text;
      
      private var _2042659701btnCommunicationRemoteFailedRetry:Button;
      
      private var _embed_mxml__928423959:Class;
      
      private var _1133939806popupPicto2W:Image;
      
      private var _1644008315imageDiscoveryOneWaySuccess:Image;
      
      private var _154722957imageDiscoveryOneWayCommunicationEquipmentFailed:Image;
      
      private var _629572308lbNewIOHomecontrolDiscoveryInProgress:Text;
      
      private var _1564048550isUserHaveIOHomecontrolWithFeedback:Canvas;
      
      private var _908609483discoveryOneWayInProgress:Canvas;
      
      private var _523221340lbPleaseRestartProcedure:Text;
      
      private var _719933716lbDiscoveryInProgress:Text;
      
      private var _1958094882lbNewIOHomecontrolDiscoveryInProgress2:Text;
      
      private var _1279633800lbDiscoveryOneWayCommunicationEquipmentFailed:Text;
      
      private var _890508279btnCommunicationEquipmentFailedRetry:Button;
      
      private var _1277349431lbDiscoverySuccess:Text;
      
      private var _1933854173btnNewIOHomecontrolCommunicationEquipmentFailedCancel:Button;
      
      private var _1697037048btnUserManipulationsThenOK:Button;
      
      private var _571055605newIOHomecontrolDiscoveryFailed:Canvas;
      
      private var _1047624934btnOKPleaseRestartProcedure:Button;
      
      private var _195210318spinnerDiscoveryOneWayInProgress:Spinner;
      
      private var _45329660userManipulationsThenOK:Canvas;
      
      private var _msgInstallationUI:Text;
      
      private var _retry:Boolean;
      
      private var _1967454539lbCommunicationEquipmentFailed:Text;
      
      private var _1333412619VSAskForIOHomecontrol:ViewStack;
      
      public var _AskForIOHomecontrolUI_HBox10:HBox;
      
      public var _AskForIOHomecontrolUI_HBox11:HBox;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _478218851lbNewIOHomecontrolCommunicationEquipmentFailed:Text;
      
      private var _2022136658btnOkOneWRemotecontrol:Button;
      
      private var _1408101957btnOKSuccessDiscovery:Button;
      
      private var _1402627851btnCommunicationEquipmentFailedCancel:Button;
      
      private var _481892950lbIsUserHaveNewIOHomecontrolWithFeedback:Text;
      
      private var _1388198565btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel:Button;
      
      private var _257725109newIOHomecontrolDiscoverySuccess:Canvas;
      
      private var _embed_mxml__485684283:Class;
      
      private var _734759231btnYesOtherOneWRemotecontrol:Button;
      
      private var _20802117btnYesIsUserHaveIOHomecontrolWithFeedback:Button;
      
      private var _1411393256btnYesUserHaveOneWRemotecontrol:Button;
      
      private var _588393507lbDiscoveryOneWayInProgress2:Text;
      
      private var _1896496521isUserHaveOneWRemotecontrol:Canvas;
      
      private var _102585970pleaseRestartProcedure:Canvas;
      
      private var _1352536378imageNewIOHomecontrolDiscoverySuccess:Image;
      
      private var _1298104429btnNoOtherOneWRemotecontrol:Button;
      
      private var _2026544210imageDiscoverySuccess:Image;
      
      private var _990716616imageNewIOHomecontrolCommunicationEquipmentFailed:Image;
      
      private var _421824236btnDiscoveryOneWayCommunicationEquipmentFailedCancel:Button;
      
      private var _1914223550discoveryInProgress:Canvas;
      
      private var _459186637lbIsUserHaveOneWRemotecontrol:Text;
      
      private var _294319872imageNewIOHomecontrolCommunicationEquipmentPartialyFailed:Image;
      
      private var _1213997566imageCommunicationRemoteFailed:Image;
      
      private var _327470094btnYesNewIOHomecontrolWithFeedback:Button;
      
      private var _668733687btnCommunicationRemoteFailedCancel:Button;
      
      private var _1980234065btnHelpIsUserH1aveOneWRemotecontrol:Button;
      
      private var _1820095755lbDiscoveryOneWayInProgress:Text;
      
      private var _128413536btnNoNewIOHomecontrolWithFeedback:Button;
      
      private var _1278210175btnOKSuccessDiscoveryNewIO:Button;
      
      private var _1979188405communicationEquipmentFailed:Canvas;
      
      private var _1651662154discoveryOneWaySuccess:Canvas;
      
      private var _1947237296imageCommunicationEquipmentFailed:Image;
      
      private var _1294095184lbIsUserHaveIOHomecontrolWithFeedback:Text;
      
      private var _1406072471spinnerDiscoveryInProgress:Spinner;
      
      private var _94069080btnOk:Button;
      
      private var _723539033btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry:Button;
      
      private var _embed_mxml__23418909:Class;
      
      private var _1866782868lbOneWRemotecontrolUserManipulationsThenOK:Text;
      
      private var _645721339newIOHomecontrolCommunicationEquipmentPartialyFailed:Canvas;
      
      private var _1133939775popupPicto1W:Image;
      
      mx_internal var _watchers:Array;
      
      private var _step:String;
      
      private var _1870447052userOneWRemotecontrolManipulationsThenOK:Canvas;
      
      private var _2120889906discoveryOneWayCommunicationEquipmentFailed:Canvas;
      
      private var _843108666lbDiscoveryInProgress2:Text;
      
      private var _1834741847btnHelpIsUserHaveIOHomecontrolWithFeedback:Button;
      
      private var _426210618lbOneWRemotecontrolUserManipulationsThenOKWarn:Text;
      
      private var _169083341newIOHomecontrolCommunicationEquipmentFailed:Canvas;
      
      mx_internal var _bindings:Array;
      
      public var _AskForIOHomecontrolUI_HBox3:HBox;
      
      public var _AskForIOHomecontrolUI_HBox4:HBox;
      
      public var _AskForIOHomecontrolUI_HBox5:HBox;
      
      public var _AskForIOHomecontrolUI_HBox6:HBox;
      
      public var _AskForIOHomecontrolUI_HBox7:HBox;
      
      public var _AskForIOHomecontrolUI_HBox2:HBox;
      
      public var _AskForIOHomecontrolUI_HBox8:HBox;
      
      public var _AskForIOHomecontrolUI_HBox1:HBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml__801521088:Class;
      
      public function AskForIOHomecontrolUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"popupPicto1W",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__23418909,
                        "visible":false,
                        "includeInLayout":false,
                        "y":23
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"popupPicto2W",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__485684283,
                        "y":25,
                        "x":172
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"VSAskForIOHomecontrol",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "resizeToContent":true,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"isUserHaveIOHomecontrolWithFeedback",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbIsUserHaveIOHomecontrolWithFeedback",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbIsUserHaveIOHomecontrolWithFeedback",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox1",
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
                                             "id":"btnYesIsUserHaveIOHomecontrolWithFeedback",
                                             "events":{"click":"__btnYesIsUserHaveIOHomecontrolWithFeedback_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesIsUserHaveIOHomecontrolWithFeedback",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoIsUserHaveIOHomecontrolWithFeedback",
                                             "events":{"click":"__btnNoIsUserHaveIOHomecontrolWithFeedback_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNoIsUserHaveIOHomecontrolWithFeedback",
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
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnHelpIsUserHaveIOHomecontrolWithFeedback",
                                    "events":{"click":"__btnHelpIsUserHaveIOHomecontrolWithFeedback_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnHelpIsUserHaveIOHomecontrolWithFeedback",
                                          "styleName":"btnHelp",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "height":24,
                                          "width":30
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"userManipulationsThenOK",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbUserManipulationsThenOK",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbUserManipulationsThenOK",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox2",
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
                                             "id":"btnOk",
                                             "events":{"click":"__btnOk_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnOk",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "x":186,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnUserManipulationsThenOK",
                                    "events":{"click":"__btnUserManipulationsThenOK_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "styleName":"btnHelp",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "height":24,
                                          "width":30
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"discoveryInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoveryInProgress",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoveryInProgress",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoveryInProgress2",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoveryInProgress2",
                                          "percentWidth":100,
                                          "styleName":"VR18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spinner,
                                    "id":"spinnerDiscoveryInProgress",
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
                                          "autoPlay":false
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"communicationRemoteFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageCommunicationRemoteFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":30,
                                          "y":12,
                                          "width":21,
                                          "height":21
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbCommunicationRemoteFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbCommunicationRemoteFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox3",
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
                                             "id":"btnCommunicationRemoteFailedRetry",
                                             "events":{"click":"__btnCommunicationRemoteFailedRetry_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCommunicationRemoteFailedRetry",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "styleName":"btnValidate",
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCommunicationRemoteFailedCancel",
                                             "events":{"click":"__btnCommunicationRemoteFailedCancel_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCommunicationRemoteFailedCancel",
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
                           "id":"communicationEquipmentFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageCommunicationEquipmentFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":30,
                                          "y":12,
                                          "width":21,
                                          "height":21
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbCommunicationEquipmentFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbCommunicationEquipmentFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox4",
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
                                             "id":"btnCommunicationEquipmentFailedRetry",
                                             "events":{"click":"__btnCommunicationEquipmentFailedRetry_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCommunicationEquipmentFailedRetry",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "styleName":"btnValidate",
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCommunicationEquipmentFailedCancel",
                                             "events":{"click":"__btnCommunicationEquipmentFailedCancel_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCommunicationEquipmentFailedCancel",
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
                           "id":"discoverySuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageDiscoverySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":29,
                                          "y":16
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoverySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoverySuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnOKSuccessDiscovery",
                                    "events":{"click":"__btnOKSuccessDiscovery_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnOKSuccessDiscovery",
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
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"isUserHaveOneWRemotecontrol",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbIsUserHaveOneWRemotecontrol",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbIsUserHaveOneWRemotecontrol",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox5",
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
                                             "id":"btnYesUserHaveOneWRemotecontrol",
                                             "events":{"click":"__btnYesUserHaveOneWRemotecontrol_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesUserHaveOneWRemotecontrol",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoUserHaveOneWRemotecontrol",
                                             "events":{"click":"__btnNoUserHaveOneWRemotecontrol_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNoUserHaveOneWRemotecontrol",
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
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnHelpIsUserH1aveOneWRemotecontrol",
                                    "events":{"click":"__btnHelpIsUserH1aveOneWRemotecontrol_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "styleName":"btnHelp",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "height":24,
                                          "width":30
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"userOneWRemotecontrolManipulationsThenOK",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbOneWRemotecontrolUserManipulationsThenOK",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbOneWRemotecontrolUserManipulationsThenOK",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbOneWRemotecontrolUserManipulationsThenOKWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbOneWRemotecontrolUserManipulationsThenOKWarn",
                                          "percentWidth":100,
                                          "styleName":"VRI18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox6",
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
                                             "id":"btnOkOneWRemotecontrol",
                                             "events":{"click":"__btnOkOneWRemotecontrol_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnOkOneWRemotecontrol",
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
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btUserOneWRemotecontrolManipulationsThenOK",
                                    "events":{"click":"__btUserOneWRemotecontrolManipulationsThenOK_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "styleName":"btnHelp",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "height":24,
                                          "width":30
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"discoveryOneWayInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoveryOneWayInProgress",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoveryOneWayInProgress",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoveryOneWayInProgress2",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoveryOneWayInProgress2",
                                          "percentWidth":100,
                                          "styleName":"VR18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spinner,
                                    "id":"spinnerDiscoveryOneWayInProgress",
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
                                          "autoPlay":false
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"discoveryOneWayCommunicationEquipmentFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageDiscoveryOneWayCommunicationEquipmentFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":29,
                                          "y":13,
                                          "width":21,
                                          "height":21
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoveryOneWayCommunicationEquipmentFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoveryOneWayCommunicationEquipmentFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox7",
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
                                             "id":"btnDiscoveryOneWayCommunicationEquipmentFailedRetry",
                                             "events":{"click":"__btnDiscoveryOneWayCommunicationEquipmentFailedRetry_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnDiscoveryOneWayCommunicationEquipmentFailedRetry",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "styleName":"btnValidate",
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnDiscoveryOneWayCommunicationEquipmentFailedCancel",
                                             "events":{"click":"__btnDiscoveryOneWayCommunicationEquipmentFailedCancel_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnDiscoveryOneWayCommunicationEquipmentFailedCancel",
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
                           "id":"discoveryOneWaySuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageDiscoveryOneWaySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":23,
                                          "y":13
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDiscoveryOneWaySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDiscoveryOneWaySuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox8",
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
                                             "id":"btnYesOtherOneWRemotecontrol",
                                             "events":{"click":"__btnYesOtherOneWRemotecontrol_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesOtherOneWRemotecontrol",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoOtherOneWRemotecontrol",
                                             "events":{"click":"__btnNoOtherOneWRemotecontrol_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNoOtherOneWRemotecontrol",
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
                           "id":"pleaseRestartProcedure",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbPleaseRestartProcedure",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbPleaseRestartProcedure",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnOKPleaseRestartProcedure",
                                    "events":{"click":"__btnOKPleaseRestartProcedure_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnOKPleaseRestartProcedure",
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
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"isUserHaveNewIOHomecontrolWithFeedback",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbIsUserHaveNewIOHomecontrolWithFeedback",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbIsUserHaveNewIOHomecontrolWithFeedback",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox9",
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
                                             "id":"btnYesNewIOHomecontrolWithFeedback",
                                             "events":{"click":"__btnYesNewIOHomecontrolWithFeedback_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesNewIOHomecontrolWithFeedback",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNoNewIOHomecontrolWithFeedback",
                                             "events":{"click":"__btnNoNewIOHomecontrolWithFeedback_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNoNewIOHomecontrolWithFeedback",
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
                           "id":"discoveryNewIOHomecontrolInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbNewIOHomecontrolDiscoveryInProgress",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbNewIOHomecontrolDiscoveryInProgress",
                                          "percentWidth":100,
                                          "styleName":"VR18BC",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbNewIOHomecontrolDiscoveryInProgress2",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbNewIOHomecontrolDiscoveryInProgress2",
                                          "percentWidth":100,
                                          "styleName":"VR18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Spinner,
                                    "id":"spinnerDiscoveryNewIOHomecontrolInProgress",
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
                                          "autoPlay":false
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"newIOHomecontrolCommunicationEquipmentFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageNewIOHomecontrolCommunicationEquipmentFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":44,
                                          "y":11,
                                          "width":21,
                                          "height":21
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbNewIOHomecontrolCommunicationEquipmentFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbNewIOHomecontrolCommunicationEquipmentFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox10",
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
                                             "id":"btnNewIOHomecontrolCommunicationEquipmentFailedRetry",
                                             "events":{"click":"__btnNewIOHomecontrolCommunicationEquipmentFailedRetry_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNewIOHomecontrolCommunicationEquipmentFailedRetry",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "styleName":"btnValidate",
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNewIOHomecontrolCommunicationEquipmentFailedCancel",
                                             "events":{"click":"__btnNewIOHomecontrolCommunicationEquipmentFailedCancel_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNewIOHomecontrolCommunicationEquipmentFailedCancel",
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
                           "id":"newIOHomecontrolCommunicationEquipmentPartialyFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageNewIOHomecontrolCommunicationEquipmentPartialyFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":34,
                                          "y":11,
                                          "width":21,
                                          "height":21
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbNewIOHomecontrolCommunicationEquipmentPartialyFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbNewIOHomecontrolCommunicationEquipmentFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_AskForIOHomecontrolUI_HBox11",
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
                                             "id":"btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry",
                                             "events":{"click":"__btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "styleName":"btnValidate",
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel",
                                             "events":{"click":"__btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel",
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
                           "id":"newIOHomecontrolDiscoverySuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageNewIOHomecontrolDiscoverySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":31,
                                          "y":13,
                                          "width":29
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbNewIOHomecontrolDiscoverySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbNewIOHomecontrolDiscoverySuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL0",
                                          "y":10
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnOKSuccessDiscoveryNewIO",
                                    "events":{"click":"__btnOKSuccessDiscoveryNewIO_click"},
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnOKSuccessDiscoveryNewIO",
                                          "styleName":"btnValidate",
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "width":113,
                                          "height":24
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"newIOHomecontrolDiscoveryFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "clipContent":false,
                                 "percentWidth":100
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._embed_mxml__23418909 = AskForIOHomecontrolUI__embed_mxml__23418909;
         this._embed_mxml__485684283 = AskForIOHomecontrolUI__embed_mxml__485684283;
         this._embed_mxml__801521088 = AskForIOHomecontrolUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = AskForIOHomecontrolUI__embed_mxml__928423959;
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
         AskForIOHomecontrolUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbNewIOHomecontrolDiscoveryInProgress2() : Text
      {
         return this._1958094882lbNewIOHomecontrolDiscoveryInProgress2;
      }
      
      public function __btnOk_click(param1:MouseEvent) : void
      {
         this.onBtnOkClickHandler(param1);
      }
      
      private function onBtnRetryNewIOHomecontrolClickHandler(param1:MouseEvent = null) : void
      {
         this.VSAskForIOHomecontrol.selectedChild = this.discoveryNewIOHomecontrolInProgress;
         this.refreshPopup();
         this.spinnerDiscoveryNewIOHomecontrolInProgress.play();
      }
      
      public function __btnNoNewIOHomecontrolWithFeedback_click(param1:MouseEvent) : void
      {
         this.onBtnNoNewIOHomecontrolWithFeedbackClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesNewIOHomecontrolWithFeedback() : Button
      {
         return this._327470094btnYesNewIOHomecontrolWithFeedback;
      }
      
      private function _AskForIOHomecontrolUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         var _loc2_:* = this.lbIsUserHaveIOHomecontrolWithFeedback.y + this.lbIsUserHaveIOHomecontrolWithFeedback.height + 30;
         _loc1_ = this.lbIsUserHaveIOHomecontrolWithFeedback.y + this.lbIsUserHaveIOHomecontrolWithFeedback.height + 30;
         _loc2_;
         _loc2_ = this.btnNoIsUserHaveIOHomecontrolWithFeedback.x + this.btnNoIsUserHaveIOHomecontrolWithFeedback.width + 18;
         _loc1_ = this.btnNoIsUserHaveIOHomecontrolWithFeedback.x + this.btnNoIsUserHaveIOHomecontrolWithFeedback.width + 18;
         _loc2_;
         _loc2_ = this.lbIsUserHaveIOHomecontrolWithFeedback.y + this.lbIsUserHaveIOHomecontrolWithFeedback.height + 30;
         _loc1_ = this.lbIsUserHaveIOHomecontrolWithFeedback.y + this.lbIsUserHaveIOHomecontrolWithFeedback.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbUserManipulationsThenOK.y + this.lbUserManipulationsThenOK.height + 30;
         _loc1_ = this.lbUserManipulationsThenOK.y + this.lbUserManipulationsThenOK.height + 30;
         _loc2_;
         _loc2_ = this.lbUserManipulationsThenOK.y + this.lbUserManipulationsThenOK.height + 30;
         _loc1_ = this.lbUserManipulationsThenOK.y + this.lbUserManipulationsThenOK.height + 30;
         _loc2_;
         _loc2_ = this.btnOk.x + this.btnOk.width + 30;
         _loc1_ = this.btnOk.x + this.btnOk.width + 30;
         _loc2_;
         _loc2_ = this.lbUserManipulationsThenOK.y + this.lbUserManipulationsThenOK.height + 30;
         _loc1_ = this.lbUserManipulationsThenOK.y + this.lbUserManipulationsThenOK.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbDiscoveryInProgress.y + this.lbDiscoveryInProgress.height + 20;
         _loc1_ = this.lbDiscoveryInProgress.y + this.lbDiscoveryInProgress.height + 20;
         _loc2_;
         _loc2_ = this.lbDiscoveryInProgress2.y + this.lbDiscoveryInProgress2.height + 20;
         _loc1_ = this.lbDiscoveryInProgress2.y + this.lbDiscoveryInProgress2.height + 20;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbCommunicationRemoteFailed.y + this.lbCommunicationRemoteFailed.height + 30;
         _loc1_ = this.lbCommunicationRemoteFailed.y + this.lbCommunicationRemoteFailed.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbCommunicationEquipmentFailed.y + this.lbCommunicationEquipmentFailed.height + 30;
         _loc1_ = this.lbCommunicationEquipmentFailed.y + this.lbCommunicationEquipmentFailed.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbDiscoverySuccess.y + this.lbDiscoverySuccess.height + 30;
         _loc1_ = this.lbDiscoverySuccess.y + this.lbDiscoverySuccess.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbIsUserHaveOneWRemotecontrol.y + this.lbIsUserHaveOneWRemotecontrol.height + 30;
         _loc1_ = this.lbIsUserHaveOneWRemotecontrol.y + this.lbIsUserHaveOneWRemotecontrol.height + 30;
         _loc2_;
         _loc2_ = this.btnNoUserHaveOneWRemotecontrol.x + this.btnNoUserHaveOneWRemotecontrol.width + 18;
         _loc1_ = this.btnNoUserHaveOneWRemotecontrol.x + this.btnNoUserHaveOneWRemotecontrol.width + 18;
         _loc2_;
         _loc2_ = this.lbIsUserHaveOneWRemotecontrol.y + this.lbIsUserHaveOneWRemotecontrol.height + 30;
         _loc1_ = this.lbIsUserHaveOneWRemotecontrol.y + this.lbIsUserHaveOneWRemotecontrol.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbOneWRemotecontrolUserManipulationsThenOK.y + this.lbOneWRemotecontrolUserManipulationsThenOK.height + 20;
         _loc1_ = this.lbOneWRemotecontrolUserManipulationsThenOK.y + this.lbOneWRemotecontrolUserManipulationsThenOK.height + 20;
         _loc2_;
         _loc2_ = this.lbOneWRemotecontrolUserManipulationsThenOKWarn.y + this.lbOneWRemotecontrolUserManipulationsThenOKWarn.height + 30;
         _loc1_ = this.lbOneWRemotecontrolUserManipulationsThenOKWarn.y + this.lbOneWRemotecontrolUserManipulationsThenOKWarn.height + 30;
         _loc2_;
         _loc2_ = this.lbOneWRemotecontrolUserManipulationsThenOKWarn.y + this.lbOneWRemotecontrolUserManipulationsThenOKWarn.height + 30;
         _loc1_ = this.lbOneWRemotecontrolUserManipulationsThenOKWarn.y + this.lbOneWRemotecontrolUserManipulationsThenOKWarn.height + 30;
         _loc2_;
         _loc2_ = this.btnOkOneWRemotecontrol.x + this.btnOkOneWRemotecontrol.width + 30;
         _loc1_ = this.btnOkOneWRemotecontrol.x + this.btnOkOneWRemotecontrol.width + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbDiscoveryOneWayInProgress.y + this.lbDiscoveryOneWayInProgress.height + 20;
         _loc1_ = this.lbDiscoveryOneWayInProgress.y + this.lbDiscoveryOneWayInProgress.height + 20;
         _loc2_;
         _loc2_ = this.lbDiscoveryOneWayInProgress2.y + this.lbDiscoveryOneWayInProgress2.height + 20;
         _loc1_ = this.lbDiscoveryOneWayInProgress2.y + this.lbDiscoveryOneWayInProgress2.height + 20;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbDiscoveryOneWayCommunicationEquipmentFailed.y + this.lbDiscoveryOneWayCommunicationEquipmentFailed.height + 30;
         _loc1_ = this.lbDiscoveryOneWayCommunicationEquipmentFailed.y + this.lbDiscoveryOneWayCommunicationEquipmentFailed.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbDiscoveryOneWaySuccess.y + this.lbDiscoveryOneWaySuccess.height + 30;
         _loc1_ = this.lbDiscoveryOneWaySuccess.y + this.lbDiscoveryOneWaySuccess.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbPleaseRestartProcedure.y + this.lbPleaseRestartProcedure.height + 30;
         _loc1_ = this.lbPleaseRestartProcedure.y + this.lbPleaseRestartProcedure.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbIsUserHaveNewIOHomecontrolWithFeedback.y + this.lbIsUserHaveNewIOHomecontrolWithFeedback.height + 30;
         _loc1_ = this.lbIsUserHaveNewIOHomecontrolWithFeedback.y + this.lbIsUserHaveNewIOHomecontrolWithFeedback.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbNewIOHomecontrolDiscoveryInProgress.y + this.lbNewIOHomecontrolDiscoveryInProgress.height + 20;
         _loc1_ = this.lbNewIOHomecontrolDiscoveryInProgress.y + this.lbNewIOHomecontrolDiscoveryInProgress.height + 20;
         _loc2_;
         _loc2_ = this.lbNewIOHomecontrolDiscoveryInProgress2.y + this.lbNewIOHomecontrolDiscoveryInProgress2.height + 20;
         _loc1_ = this.lbNewIOHomecontrolDiscoveryInProgress2.y + this.lbNewIOHomecontrolDiscoveryInProgress2.height + 20;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbNewIOHomecontrolCommunicationEquipmentFailed.y + this.lbNewIOHomecontrolCommunicationEquipmentFailed.height + 30;
         _loc1_ = this.lbNewIOHomecontrolCommunicationEquipmentFailed.y + this.lbNewIOHomecontrolCommunicationEquipmentFailed.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.y + this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.height + 30;
         _loc1_ = this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.y + this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc2_ = this.lbNewIOHomecontrolDiscoverySuccess.y + this.lbNewIOHomecontrolDiscoverySuccess.height + 30;
         _loc1_ = this.lbNewIOHomecontrolDiscoverySuccess.y + this.lbNewIOHomecontrolDiscoverySuccess.height + 30;
         _loc2_;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
      }
      
      public function set btnYesNewIOHomecontrolWithFeedback(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._327470094btnYesNewIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._327470094btnYesNewIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesNewIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      public function __btnDiscoveryOneWayCommunicationEquipmentFailedRetry_click(param1:MouseEvent) : void
      {
         this.onBtnRetryDiscoveryOneWayCommunicationEquipmentFailedClickHandler(param1);
      }
      
      public function __btnCommunicationRemoteFailedCancel_click(param1:MouseEvent) : void
      {
         this.onBtnCancelClickHandler(param1);
      }
      
      private function onKeyDownHandler(param1:KeyboardEvent) : void
      {
         param1.preventDefault();
         if(param1.keyCode == Keyboard.ENTER)
         {
            switch(this.VSAskForIOHomecontrol.selectedChild.id)
            {
               case "newIOHomecontrolDiscoverySuccess":
                  this.btnOKSuccessDiscoveryClickHandler();
                  break;
               case "newIOHomecontrolDiscoveryFailed":
                  break;
               case "newIOHomecontrolCommunicationEquipmentPartialyFailed":
                  this.onBtnRetryNewIOHomecontrolClickHandler();
                  break;
               case "newIOHomecontrolCommunicationEquipmentFailed":
                  this.onBtnRetryNewIOHomecontrolClickHandler();
                  break;
               case "discoveryNewIOHomecontrolInProgress":
                  break;
               case "isUserHaveNewIOHomecontrolWithFeedback":
                  this.onBtnYesNewIOHomecontrolWithFeedbackClickHandler();
                  break;
               case "pleaseRestartProcedure":
                  this.btnOKPleaseRestartProcedureClickHandler();
                  break;
               case "discoveryOneWaySuccess":
                  this.onBtnYesOtherOneWRemotecontrolClickHandler();
                  break;
               case "discoveryOneWayInProgress":
                  break;
               case "discoveryOneWayCommunicationEquipmentFailed":
                  this.onBtnRetryDiscoveryOneWayCommunicationEquipmentFailedClickHandler();
                  break;
               case "userOneWRemotecontrolManipulationsThenOK":
                  this.onBtnOkOneWRemotecontrolClickHandler();
                  break;
               case "isUserHaveOneWRemotecontrol":
                  this.onBtnYesUserHaveOneWRemotecontrolClickHandler();
                  break;
               case "discoverySuccess":
                  this.btnOKSuccessDiscoveryClickHandler();
                  break;
               case "discoveryInProgress":
                  break;
               case "communicationEquipmentFailed":
                  this.onBtnRetryClickHandler();
                  break;
               case "communicationRemoteFailed":
                  this.onBtnRetryClickHandler();
                  break;
               case "userManipulationsThenOK":
                  this.onBtnOkClickHandler();
                  break;
               case "isUserHaveIOHomecontrolWithFeedback":
                  this.onBtnYesIsUserHaveIOHomecontrolWithFeedbackClickHandler();
            }
         }
      }
      
      private function onBtnNewIOHomecontrolCancelClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function get msgInstallationUI() : Text
      {
         return this._msgInstallationUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get discoveryInProgress() : Canvas
      {
         return this._1914223550discoveryInProgress;
      }
      
      public function set btnNewIOHomecontrolCommunicationEquipmentFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1933854173btnNewIOHomecontrolCommunicationEquipmentFailedCancel;
         if(_loc2_ !== param1)
         {
            this._1933854173btnNewIOHomecontrolCommunicationEquipmentFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNewIOHomecontrolCommunicationEquipmentFailedCancel",_loc2_,param1));
         }
      }
      
      private function onBtnYesUserHaveOneWRemotecontrolClickHandler(param1:MouseEvent = null) : void
      {
         this.VSAskForIOHomecontrol.selectedChild = this.userOneWRemotecontrolManipulationsThenOK;
         this.refreshPopup();
      }
      
      [Bindable(event="propertyChange")]
      public function get popupPicto1W() : Image
      {
         return this._1133939775popupPicto1W;
      }
      
      [Bindable(event="propertyChange")]
      public function get discoverySuccess() : Canvas
      {
         return this._394693683discoverySuccess;
      }
      
      public function set btnNoIsUserHaveIOHomecontrolWithFeedback(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._638775849btnNoIsUserHaveIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._638775849btnNoIsUserHaveIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoIsUserHaveIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      public function set discoverySuccess(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._394693683discoverySuccess;
         if(_loc2_ !== param1)
         {
            this._394693683discoverySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discoverySuccess",_loc2_,param1));
         }
      }
      
      public function set userOneWRemotecontrolManipulationsThenOK(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1870447052userOneWRemotecontrolManipulationsThenOK;
         if(_loc2_ !== param1)
         {
            this._1870447052userOneWRemotecontrolManipulationsThenOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userOneWRemotecontrolManipulationsThenOK",_loc2_,param1));
         }
      }
      
      private function onBtnRetryDiscoveryOneWayCommunicationEquipmentFailedClickHandler(param1:MouseEvent = null) : void
      {
         this._step = Globals.STEP2_DISCOVER_ACTUATOR;
         this.startDiscover();
      }
      
      public function set msgInstallationUI(param1:Text) : void
      {
         this._msgInstallationUI = param1;
      }
      
      public function set lbIsUserHaveOneWRemotecontrol(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._459186637lbIsUserHaveOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._459186637lbIsUserHaveOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbIsUserHaveOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popupPicto2W() : Image
      {
         return this._1133939806popupPicto2W;
      }
      
      private function onBtnNoNewIOHomecontrolWithFeedbackClickHandler(param1:MouseEvent = null) : void
      {
         if(false)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.pleaseRestartProcedure;
            this.refreshPopup();
         }
         else
         {
            this.close();
         }
      }
      
      public function set discoveryInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1914223550discoveryInProgress;
         if(_loc2_ !== param1)
         {
            this._1914223550discoveryInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discoveryInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDiscoveryOneWaySuccess() : Image
      {
         return this._1644008315imageDiscoveryOneWaySuccess;
      }
      
      public function set lbCommunicationRemoteFailed(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1146815043lbCommunicationRemoteFailed;
         if(_loc2_ !== param1)
         {
            this._1146815043lbCommunicationRemoteFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbCommunicationRemoteFailed",_loc2_,param1));
         }
      }
      
      public function set btnOKSuccessDiscovery(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1408101957btnOKSuccessDiscovery;
         if(_loc2_ !== param1)
         {
            this._1408101957btnOKSuccessDiscovery = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOKSuccessDiscovery",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCommunicationRemoteFailedRetry() : Button
      {
         return this._2042659701btnCommunicationRemoteFailedRetry;
      }
      
      public function __btnNewIOHomecontrolCommunicationEquipmentFailedCancel_click(param1:MouseEvent) : void
      {
         this.onBtnNewIOHomecontrolCancelClickHandler(param1);
      }
      
      public function set popupPicto1W(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1133939775popupPicto1W;
         if(_loc2_ !== param1)
         {
            this._1133939775popupPicto1W = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popupPicto1W",_loc2_,param1));
         }
      }
      
      public function __btUserOneWRemotecontrolManipulationsThenOK_click(param1:MouseEvent) : void
      {
         this.btUserOneWRemotecontrolManipulationsThenOK_clickHandler(param1);
      }
      
      protected function setCommunicationEquipmentFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbCommunicationEquipmentFailed.validateNow();
         _loc1_ = this.lbCommunicationEquipmentFailed.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageCommunicationEquipmentFailed.width - 5;
         this.imageCommunicationEquipmentFailed.x = _loc1_.x - this.imageCommunicationEquipmentFailed.width - 5;
         _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbOneWRemotecontrolUserManipulationsThenOK() : Text
      {
         return this._1866782868lbOneWRemotecontrolUserManipulationsThenOK;
      }
      
      [Bindable(event="propertyChange")]
      public function get btUserOneWRemotecontrolManipulationsThenOK() : Button
      {
         return this._974582950btUserOneWRemotecontrolManipulationsThenOK;
      }
      
      private function btnOKPleaseRestartProcedureClickHandler(param1:MouseEvent = null) : void
      {
         this.close();
         Globals.instance.installationState = null;
      }
      
      public function set lbIsUserHaveNewIOHomecontrolWithFeedback(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._481892950lbIsUserHaveNewIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._481892950lbIsUserHaveNewIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbIsUserHaveNewIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isUserHaveIOHomecontrolWithFeedback() : Canvas
      {
         return this._1564048550isUserHaveIOHomecontrolWithFeedback;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOkOneWRemotecontrol() : Button
      {
         return this._2022136658btnOkOneWRemotecontrol;
      }
      
      [Bindable(event="propertyChange")]
      public function get communicationEquipmentFailed() : Canvas
      {
         return this._1979188405communicationEquipmentFailed;
      }
      
      public function set popupPicto2W(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1133939806popupPicto2W;
         if(_loc2_ !== param1)
         {
            this._1133939806popupPicto2W = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popupPicto2W",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbUserManipulationsThenOK() : Text
      {
         return this._200124242lbUserManipulationsThenOK;
      }
      
      public function __btnNoUserHaveOneWRemotecontrol_click(param1:MouseEvent) : void
      {
         this.onBtnNoUserHaveOneWRemotecontrolClickHandler(param1);
      }
      
      public function set lbNewIOHomecontrolCommunicationEquipmentFailed(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._478218851lbNewIOHomecontrolCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._478218851lbNewIOHomecontrolCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbNewIOHomecontrolCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      public function set lbDiscoveryOneWaySuccess(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1231026784lbDiscoveryOneWaySuccess;
         if(_loc2_ !== param1)
         {
            this._1231026784lbDiscoveryOneWaySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoveryOneWaySuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNoUserHaveOneWRemotecontrol() : Button
      {
         return this._768174890btnNoUserHaveOneWRemotecontrol;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKPleaseRestartProcedure() : Button
      {
         return this._1047624934btnOKPleaseRestartProcedure;
      }
      
      protected function setNewIOHomecontrolCommunicationEquipmentPartialyFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.validateNow();
         _loc1_ = this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageNewIOHomecontrolCommunicationEquipmentPartialyFailed.width - 5;
         this.imageNewIOHomecontrolCommunicationEquipmentPartialyFailed.x = _loc1_.x - this.imageNewIOHomecontrolCommunicationEquipmentPartialyFailed.width - 5;
         _loc2_;
      }
      
      private function onBtnRetryClickHandler(param1:MouseEvent = null) : void
      {
         this._step = null;
         this.startDiscover();
      }
      
      public function __btnCommunicationRemoteFailedRetry_click(param1:MouseEvent) : void
      {
         this.onBtnRetryClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCommunicationRemoteFailedCancel() : Button
      {
         return this._668733687btnCommunicationRemoteFailedCancel;
      }
      
      public function set lbDiscoveryOneWayCommunicationEquipmentFailed(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1279633800lbDiscoveryOneWayCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._1279633800lbDiscoveryOneWayCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoveryOneWayCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageNewIOHomecontrolCommunicationEquipmentPartialyFailed() : Image
      {
         return this._294319872imageNewIOHomecontrolCommunicationEquipmentPartialyFailed;
      }
      
      protected function btUserTwoWRemotecontrolManipulationsThenOK_clickHandler(param1:MouseEvent) : void
      {
         DialogsManager.showRemote2WHelpAdvancedPopup();
      }
      
      private function onBtnNoOtherOneWRemotecontrolClickHandler(param1:MouseEvent) : void
      {
         Globals.instance.installationState = Globals.STEP4_DISCOVER_ACTUATOR;
         this.close();
      }
      
      private function onBtnYesOtherOneWRemotecontrolClickHandler(param1:MouseEvent = null) : void
      {
         this.onBtnYesUserHaveOneWRemotecontrolClickHandler();
      }
      
      public function set imageDiscoveryOneWaySuccess(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1644008315imageDiscoveryOneWaySuccess;
         if(_loc2_ !== param1)
         {
            this._1644008315imageDiscoveryOneWaySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDiscoveryOneWaySuccess",_loc2_,param1));
         }
      }
      
      public function __btnOKPleaseRestartProcedure_click(param1:MouseEvent) : void
      {
         this.btnOKPleaseRestartProcedureClickHandler(param1);
      }
      
      public function set spinnerDiscoveryNewIOHomecontrolInProgress(param1:Spinner) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._108802431spinnerDiscoveryNewIOHomecontrolInProgress;
         if(_loc2_ !== param1)
         {
            this._108802431spinnerDiscoveryNewIOHomecontrolInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinnerDiscoveryNewIOHomecontrolInProgress",_loc2_,param1));
         }
      }
      
      public function set btnCommunicationRemoteFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2042659701btnCommunicationRemoteFailedRetry;
         if(_loc2_ !== param1)
         {
            this._2042659701btnCommunicationRemoteFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCommunicationRemoteFailedRetry",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnUserManipulationsThenOK() : Button
      {
         return this._1697037048btnUserManipulationsThenOK;
      }
      
      private function onBtnOkSkitterNotConnectedClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function set lbOneWRemotecontrolUserManipulationsThenOK(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1866782868lbOneWRemotecontrolUserManipulationsThenOK;
         if(_loc2_ !== param1)
         {
            this._1866782868lbOneWRemotecontrolUserManipulationsThenOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbOneWRemotecontrolUserManipulationsThenOK",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         switch(this.VSAskForIOHomecontrol.selectedChild.id)
         {
            case "newIOHomecontrolDiscoverySuccess":
               if(this.lbNewIOHomecontrolDiscoverySuccess != null)
               {
                  this.lbNewIOHomecontrolDiscoverySuccess.htmlText = resourceManager.getString("installation","MSG_DISCOVERY_SUCCESS_FOR_NEW_2W");
               }
               if(this.btnOKSuccessDiscoveryNewIO != null)
               {
                  this.btnOKSuccessDiscoveryNewIO.label = resourceManager.getString("common","BTN_OK");
               }
               break;
            case "newIOHomecontrolDiscoveryFailed":
               break;
            case "newIOHomecontrolCommunicationEquipmentPartialyFailed":
               if(this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed != null)
               {
                  this.lbNewIOHomecontrolCommunicationEquipmentPartialyFailed.htmlText = resourceManager.getString("installation","COMMUNICATION_EQUIPMENT_FAILED_PARTIALY_FOR_NEW_2W");
               }
               if(this.btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry != null)
               {
                  this.btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               }
               if(this.btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel != null)
               {
                  this.btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               }
               break;
            case "newIOHomecontrolCommunicationEquipmentFailed":
               if(this.lbNewIOHomecontrolCommunicationEquipmentFailed != null)
               {
                  this.lbNewIOHomecontrolCommunicationEquipmentFailed.htmlText = resourceManager.getString("installation","COMMUNICATION_EQUIPMENT_FAILED_FOR_NEW_2W");
               }
               if(this.btnNewIOHomecontrolCommunicationEquipmentFailedRetry != null)
               {
                  this.btnNewIOHomecontrolCommunicationEquipmentFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               }
               if(this.btnNewIOHomecontrolCommunicationEquipmentFailedCancel != null)
               {
                  this.btnNewIOHomecontrolCommunicationEquipmentFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               }
               break;
            case "discoveryNewIOHomecontrolInProgress":
               if(this.lbNewIOHomecontrolDiscoveryInProgress != null)
               {
                  this.lbNewIOHomecontrolDiscoveryInProgress.htmlText = resourceManager.getString("installation","MSG_DISCOVERING_FOR_NEW_2W");
               }
               if(this.lbNewIOHomecontrolDiscoveryInProgress2 != null)
               {
                  this.lbNewIOHomecontrolDiscoveryInProgress2.htmlText = resourceManager.getString("installation","MSG_DISCOVERING2_FOR_2W");
               }
               break;
            case "isUserHaveNewIOHomecontrolWithFeedback":
               if(this.lbIsUserHaveNewIOHomecontrolWithFeedback != null)
               {
                  this.lbIsUserHaveNewIOHomecontrolWithFeedback.htmlText = resourceManager.getString("installation","MSG_ASK_FOR_2W");
               }
               if(this.btnYesNewIOHomecontrolWithFeedback != null)
               {
                  this.btnYesNewIOHomecontrolWithFeedback.label = resourceManager.getString("common","BTN_YES");
               }
               if(this.btnNoNewIOHomecontrolWithFeedback != null)
               {
                  this.btnNoNewIOHomecontrolWithFeedback.label = resourceManager.getString("common","BTN_NO");
               }
               break;
            case "pleaseRestartProcedure":
               if(this.lbPleaseRestartProcedure != null)
               {
                  this.lbPleaseRestartProcedure.htmlText = resourceManager.getString("installation","MSG_PLEASE_RESTART_DISCOVERY");
               }
               if(this.btnOKPleaseRestartProcedure != null)
               {
                  this.btnOKPleaseRestartProcedure.label = resourceManager.getString("common","BTN_OK");
               }
               break;
            case "discoveryOneWaySuccess":
               if(this.lbDiscoveryOneWaySuccess != null)
               {
                  this.lbDiscoveryOneWaySuccess.htmlText = resourceManager.getString("installation","MSG_DISCOVERY_SUCCESS_FOR_1W");
               }
               if(this.btnYesOtherOneWRemotecontrol != null)
               {
                  this.btnYesOtherOneWRemotecontrol.label = resourceManager.getString("common","BTN_YES");
               }
               if(this.btnNoOtherOneWRemotecontrol != null)
               {
                  this.btnNoOtherOneWRemotecontrol.label = resourceManager.getString("common","BTN_NO");
               }
               break;
            case "discoveryOneWayInProgress":
               if(this.lbDiscoveryOneWayInProgress != null)
               {
                  this.lbDiscoveryOneWayInProgress.htmlText = resourceManager.getString("installation","MSG_DISCOVERING_FOR_2W");
               }
               if(this.lbDiscoveryOneWayInProgress2 != null)
               {
                  this.lbDiscoveryOneWayInProgress2.htmlText = resourceManager.getString("installation","MSG_DISCOVERING2_FOR_2W");
               }
               if(this.msgInstallationUI != null)
               {
                  this.msgInstallationUI.htmlText = resourceManager.getString("installation","MSG_INTERACT_WITH_ACTUATORS");
               }
               break;
            case "discoveryOneWayCommunicationEquipmentFailed":
               if(this.lbDiscoveryOneWayCommunicationEquipmentFailed != null)
               {
                  this.lbDiscoveryOneWayCommunicationEquipmentFailed.htmlText = resourceManager.getString("installation","COMMUNICATION_EQUIPMENT_FAILED");
               }
               if(this.btnDiscoveryOneWayCommunicationEquipmentFailedRetry != null)
               {
                  this.btnDiscoveryOneWayCommunicationEquipmentFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               }
               if(this.btnDiscoveryOneWayCommunicationEquipmentFailedCancel != null)
               {
                  this.btnDiscoveryOneWayCommunicationEquipmentFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               }
               break;
            case "userOneWRemotecontrolManipulationsThenOK":
               if(this.lbOneWRemotecontrolUserManipulationsThenOK != null)
               {
                  this.lbOneWRemotecontrolUserManipulationsThenOK.htmlText = resourceManager.getString("installation","MSG_KEY_FOR_1W");
               }
               if(this.lbOneWRemotecontrolUserManipulationsThenOKWarn != null)
               {
                  this.lbOneWRemotecontrolUserManipulationsThenOKWarn.htmlText = resourceManager.getString("installation","MSG_KEY_FOR_1W_WARN");
               }
               if(this.btnOkOneWRemotecontrol != null)
               {
                  this.btnOkOneWRemotecontrol.label = resourceManager.getString("common","BTN_OK");
               }
               break;
            case "isUserHaveOneWRemotecontrol":
               if(this.lbIsUserHaveOneWRemotecontrol != null)
               {
                  this.lbIsUserHaveOneWRemotecontrol.htmlText = resourceManager.getString("installation","MSG_ASK_FOR_1W");
               }
               if(this.btnYesUserHaveOneWRemotecontrol != null)
               {
                  this.btnYesUserHaveOneWRemotecontrol.label = resourceManager.getString("common","BTN_YES");
               }
               if(this.btnNoUserHaveOneWRemotecontrol != null)
               {
                  this.btnNoUserHaveOneWRemotecontrol.label = resourceManager.getString("common","BTN_NO");
               }
               break;
            case "discoverySuccess":
               if(this.lbDiscoverySuccess != null)
               {
                  this.lbDiscoverySuccess.htmlText = resourceManager.getString("installation","MSG_DISCOVERY_SUCCESS_FOR_2W");
               }
               if(this.btnOKSuccessDiscovery != null)
               {
                  this.btnOKSuccessDiscovery.label = resourceManager.getString("common","BTN_OK");
               }
               break;
            case "discoveryInProgress":
               if(this.lbDiscoveryInProgress != null)
               {
                  this.lbDiscoveryInProgress.htmlText = resourceManager.getString("installation","MSG_DISCOVERING_FOR_2W");
               }
               if(this.lbDiscoveryInProgress2 != null)
               {
                  this.lbDiscoveryInProgress2.htmlText = resourceManager.getString("installation","MSG_DISCOVERING2_FOR_2W");
               }
               if(this.msgInstallationUI != null)
               {
                  this.msgInstallationUI.htmlText = resourceManager.getString("installation","MSG_INTERACT_WITH_ACTUATORS");
               }
               break;
            case "communicationEquipmentFailed":
               if(this.lbCommunicationEquipmentFailed != null)
               {
                  this.lbCommunicationEquipmentFailed.htmlText = resourceManager.getString("installation","COMMUNICATION_EQUIPMENT_FAILED");
               }
               if(this.btnCommunicationEquipmentFailedRetry != null)
               {
                  this.btnCommunicationEquipmentFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               }
               if(this.btnCommunicationEquipmentFailedCancel != null)
               {
                  this.btnCommunicationEquipmentFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               }
               break;
            case "communicationRemoteFailed":
               if(this.lbCommunicationRemoteFailed != null)
               {
                  this.lbCommunicationRemoteFailed.htmlText = resourceManager.getString("installation","COMMUNICATION_REMOTE_FAILED");
               }
               if(this.btnCommunicationRemoteFailedRetry != null)
               {
                  this.btnCommunicationRemoteFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               }
               if(this.btnCommunicationRemoteFailedCancel != null)
               {
                  this.btnCommunicationRemoteFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               }
               break;
            case "userManipulationsThenOK":
               if(this.lbUserManipulationsThenOK != null)
               {
                  this.lbUserManipulationsThenOK.htmlText = resourceManager.getString("installation","MSG_KEY_FOR_2W");
               }
               if(this.btnOk != null)
               {
                  this.btnOk.label = resourceManager.getString("common","BTN_OK");
               }
               break;
            case "isUserHaveIOHomecontrolWithFeedback":
               if(this.lbIsUserHaveIOHomecontrolWithFeedback != null)
               {
                  this.lbIsUserHaveIOHomecontrolWithFeedback.htmlText = resourceManager.getString("installation","MSG_ASK_FOR_2W");
               }
               if(this.btnYesIsUserHaveIOHomecontrolWithFeedback != null)
               {
                  this.btnYesIsUserHaveIOHomecontrolWithFeedback.label = resourceManager.getString("common","BTN_YES");
               }
               if(this.btnNoIsUserHaveIOHomecontrolWithFeedback != null)
               {
                  this.btnNoIsUserHaveIOHomecontrolWithFeedback.label = resourceManager.getString("common","BTN_NO");
               }
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDownHandler);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.DISCOVERY_END,this.OnDiscoveryEndHandler);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.DISCOVERY_FAILURE,this.OnDiscoveryFailedHandler);
      }
      
      public function __btnHelpIsUserH1aveOneWRemotecontrol_click(param1:MouseEvent) : void
      {
         this.btnHelpIsUserHaveOneWRemotecontrol_clickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbOneWRemotecontrolUserManipulationsThenOKWarn() : Text
      {
         return this._426210618lbOneWRemotecontrolUserManipulationsThenOKWarn;
      }
      
      [Bindable(event="propertyChange")]
      public function get isUserHaveNewIOHomecontrolWithFeedback() : Canvas
      {
         return this._1811125952isUserHaveNewIOHomecontrolWithFeedback;
      }
      
      public function set lbPleaseRestartProcedure(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._523221340lbPleaseRestartProcedure;
         if(_loc2_ !== param1)
         {
            this._523221340lbPleaseRestartProcedure = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbPleaseRestartProcedure",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbCommunicationEquipmentFailed() : Text
      {
         return this._1967454539lbCommunicationEquipmentFailed;
      }
      
      public function set btUserOneWRemotecontrolManipulationsThenOK(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._974582950btUserOneWRemotecontrolManipulationsThenOK;
         if(_loc2_ !== param1)
         {
            this._974582950btUserOneWRemotecontrolManipulationsThenOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btUserOneWRemotecontrolManipulationsThenOK",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnHelpIsUserH1aveOneWRemotecontrol() : Button
      {
         return this._1980234065btnHelpIsUserH1aveOneWRemotecontrol;
      }
      
      public function __btnHelpIsUserHaveIOHomecontrolWithFeedback_click(param1:MouseEvent) : void
      {
         this.btnHelpIsUserHaveIOHomecontrolWithFeedback_clickHandler(param1);
      }
      
      public function set isUserHaveIOHomecontrolWithFeedback(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1564048550isUserHaveIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._1564048550isUserHaveIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isUserHaveIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOk() : Button
      {
         return this._94069080btnOk;
      }
      
      [Bindable(event="propertyChange")]
      public function get discoveryOneWaySuccess() : Canvas
      {
         return this._1651662154discoveryOneWaySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get newIOHomecontrolDiscoverySuccess() : Canvas
      {
         return this._257725109newIOHomecontrolDiscoverySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel() : Button
      {
         return this._1388198565btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel;
      }
      
      private function onBtnYesIsUserHaveIOHomecontrolWithFeedbackClickHandler(param1:MouseEvent = null) : void
      {
         this.VSAskForIOHomecontrol.selectedChild = this.userManipulationsThenOK;
         this.refreshPopup();
      }
      
      private function OnDiscoveryFailedHandler(param1:InstallationEvent) : void
      {
         if(this._step == Globals.STEP1_DISCOVER_ACTUATOR || this._step == Globals.STEP_GENERATE_NEW_KEY)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.communicationEquipmentFailed;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.stop();
            callLater(this.setCommunicationEquipmentFailedIconPosition);
         }
         else if(this._step == Globals.STEP2_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.discoveryOneWayCommunicationEquipmentFailed;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.stop();
            callLater(this.setDiscoveryOneWayCommunicationEquipmentFailedIconPosition);
         }
         else if(this._step == Globals.STEP3_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.newIOHomecontrolCommunicationEquipmentFailed;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.stop();
            callLater(this.setNewIOHomecontrolCommunicationEquipmentFailedIconPosition);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spinnerDiscoveryInProgress() : Spinner
      {
         return this._1406072471spinnerDiscoveryInProgress;
      }
      
      public function set communicationEquipmentFailed(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1979188405communicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._1979188405communicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"communicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      public function set btnOkOneWRemotecontrol(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2022136658btnOkOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._2022136658btnOkOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOkOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDiscoveryOneWayCommunicationEquipmentFailed() : Image
      {
         return this._154722957imageDiscoveryOneWayCommunicationEquipmentFailed;
      }
      
      protected function btnHelpIsUserHaveIOHomecontrolWithFeedback_clickHandler(param1:MouseEvent) : void
      {
         DialogsManager.showRemote2WHelpPopup();
      }
      
      public function set btnYesOtherOneWRemotecontrol(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._734759231btnYesOtherOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._734759231btnYesOtherOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesOtherOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isUserHaveOneWRemotecontrol() : Canvas
      {
         return this._1896496521isUserHaveOneWRemotecontrol;
      }
      
      public function set lbDiscoveryInProgress2(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._843108666lbDiscoveryInProgress2;
         if(_loc2_ !== param1)
         {
            this._843108666lbDiscoveryInProgress2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoveryInProgress2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pleaseRestartProcedure() : Canvas
      {
         return this._102585970pleaseRestartProcedure;
      }
      
      public function set imageNewIOHomecontrolCommunicationEquipmentFailed(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._990716616imageNewIOHomecontrolCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._990716616imageNewIOHomecontrolCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageNewIOHomecontrolCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      public function __btnYesUserHaveOneWRemotecontrol_click(param1:MouseEvent) : void
      {
         this.onBtnYesUserHaveOneWRemotecontrolClickHandler(param1);
      }
      
      public function set lbUserManipulationsThenOK(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._200124242lbUserManipulationsThenOK;
         if(_loc2_ !== param1)
         {
            this._200124242lbUserManipulationsThenOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbUserManipulationsThenOK",_loc2_,param1));
         }
      }
      
      public function set step(param1:String) : void
      {
         this._step = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbNewIOHomecontrolCommunicationEquipmentPartialyFailed() : Text
      {
         return this._847324571lbNewIOHomecontrolCommunicationEquipmentPartialyFailed;
      }
      
      public function set imageNewIOHomecontrolDiscoverySuccess(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1352536378imageNewIOHomecontrolDiscoverySuccess;
         if(_loc2_ !== param1)
         {
            this._1352536378imageNewIOHomecontrolDiscoverySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageNewIOHomecontrolDiscoverySuccess",_loc2_,param1));
         }
      }
      
      public function set lbNewIOHomecontrolDiscoveryInProgress(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._629572308lbNewIOHomecontrolDiscoveryInProgress;
         if(_loc2_ !== param1)
         {
            this._629572308lbNewIOHomecontrolDiscoveryInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbNewIOHomecontrolDiscoveryInProgress",_loc2_,param1));
         }
      }
      
      public function set btnNoUserHaveOneWRemotecontrol(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._768174890btnNoUserHaveOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._768174890btnNoUserHaveOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoUserHaveOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      protected function setNewIOHomecontrolCommunicationEquipmentFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbNewIOHomecontrolCommunicationEquipmentFailed.validateNow();
         _loc1_ = this.lbNewIOHomecontrolCommunicationEquipmentFailed.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageNewIOHomecontrolCommunicationEquipmentFailed.width - 5;
         this.imageNewIOHomecontrolCommunicationEquipmentFailed.x = _loc1_.x - this.imageNewIOHomecontrolCommunicationEquipmentFailed.width - 5;
         _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesIsUserHaveIOHomecontrolWithFeedback() : Button
      {
         return this._20802117btnYesIsUserHaveIOHomecontrolWithFeedback;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoverySuccess() : Text
      {
         return this._1277349431lbDiscoverySuccess;
      }
      
      public function __btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel_click(param1:MouseEvent) : void
      {
         this.onBtnNewIOHomecontrolCancelClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get newIOHomecontrolCommunicationEquipmentFailed() : Canvas
      {
         return this._169083341newIOHomecontrolCommunicationEquipmentFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get discoveryOneWayCommunicationEquipmentFailed() : Canvas
      {
         return this._2120889906discoveryOneWayCommunicationEquipmentFailed;
      }
      
      public function set btnYesUserHaveOneWRemotecontrol(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1411393256btnYesUserHaveOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._1411393256btnYesUserHaveOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesUserHaveOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      public function set lbNewIOHomecontrolDiscoverySuccess(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._526899487lbNewIOHomecontrolDiscoverySuccess;
         if(_loc2_ !== param1)
         {
            this._526899487lbNewIOHomecontrolDiscoverySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbNewIOHomecontrolDiscoverySuccess",_loc2_,param1));
         }
      }
      
      public function set btnOKPleaseRestartProcedure(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1047624934btnOKPleaseRestartProcedure;
         if(_loc2_ !== param1)
         {
            this._1047624934btnOKPleaseRestartProcedure = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOKPleaseRestartProcedure",_loc2_,param1));
         }
      }
      
      public function set btnDiscoveryOneWayCommunicationEquipmentFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._421824236btnDiscoveryOneWayCommunicationEquipmentFailedCancel;
         if(_loc2_ !== param1)
         {
            this._421824236btnDiscoveryOneWayCommunicationEquipmentFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDiscoveryOneWayCommunicationEquipmentFailedCancel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNewIOHomecontrolCommunicationEquipmentFailedRetry() : Button
      {
         return this._1198521823btnNewIOHomecontrolCommunicationEquipmentFailedRetry;
      }
      
      public function set lbDiscoveryInProgress(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._719933716lbDiscoveryInProgress;
         if(_loc2_ !== param1)
         {
            this._719933716lbDiscoveryInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoveryInProgress",_loc2_,param1));
         }
      }
      
      public function set lbDiscoveryOneWayInProgress(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1820095755lbDiscoveryOneWayInProgress;
         if(_loc2_ !== param1)
         {
            this._1820095755lbDiscoveryOneWayInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoveryOneWayInProgress",_loc2_,param1));
         }
      }
      
      public function set btnCommunicationRemoteFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._668733687btnCommunicationRemoteFailedCancel;
         if(_loc2_ !== param1)
         {
            this._668733687btnCommunicationRemoteFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCommunicationRemoteFailedCancel",_loc2_,param1));
         }
      }
      
      private function onBtnNoIsUserHaveIOHomecontrolWithFeedbackClickHandler(param1:MouseEvent) : void
      {
         this._step = Globals.STEP_GENERATE_NEW_KEY;
         this.startDiscover();
      }
      
      public function __btnYesNewIOHomecontrolWithFeedback_click(param1:MouseEvent) : void
      {
         this.onBtnYesNewIOHomecontrolWithFeedbackClickHandler(param1);
      }
      
      private function close() : void
      {
         closeHandler();
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
      
      private function onBtnOkClickHandler(param1:MouseEvent = null) : void
      {
         this._step = Globals.STEP1_DISCOVER_ACTUATOR;
         this.startDiscover();
      }
      
      public function __btnNoOtherOneWRemotecontrol_click(param1:MouseEvent) : void
      {
         this.onBtnNoOtherOneWRemotecontrolClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get imageCommunicationRemoteFailed() : Image
      {
         return this._1213997566imageCommunicationRemoteFailed;
      }
      
      public function set imageNewIOHomecontrolCommunicationEquipmentPartialyFailed(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._294319872imageNewIOHomecontrolCommunicationEquipmentPartialyFailed;
         if(_loc2_ !== param1)
         {
            this._294319872imageNewIOHomecontrolCommunicationEquipmentPartialyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageNewIOHomecontrolCommunicationEquipmentPartialyFailed",_loc2_,param1));
         }
      }
      
      public function set userManipulationsThenOK(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._45329660userManipulationsThenOK;
         if(_loc2_ !== param1)
         {
            this._45329660userManipulationsThenOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userManipulationsThenOK",_loc2_,param1));
         }
      }
      
      public function set newIOHomecontrolCommunicationEquipmentPartialyFailed(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._645721339newIOHomecontrolCommunicationEquipmentPartialyFailed;
         if(_loc2_ !== param1)
         {
            this._645721339newIOHomecontrolCommunicationEquipmentPartialyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newIOHomecontrolCommunicationEquipmentPartialyFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get newIOHomecontrolDiscoveryFailed() : Canvas
      {
         return this._571055605newIOHomecontrolDiscoveryFailed;
      }
      
      protected function setDiscoverySuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbDiscoverySuccess.validateNow();
         _loc1_ = this.lbDiscoverySuccess.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageDiscoverySuccess.width - 5;
         this.imageDiscoverySuccess.x = _loc1_.x - this.imageDiscoverySuccess.width - 5;
         _loc2_;
      }
      
      public function set btnUserManipulationsThenOK(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1697037048btnUserManipulationsThenOK;
         if(_loc2_ !== param1)
         {
            this._1697037048btnUserManipulationsThenOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnUserManipulationsThenOK",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNewIOHomecontrolCommunicationEquipmentFailedCancel() : Button
      {
         return this._1933854173btnNewIOHomecontrolCommunicationEquipmentFailedCancel;
      }
      
      public function __btnYesIsUserHaveIOHomecontrolWithFeedback_click(param1:MouseEvent) : void
      {
         this.onBtnYesIsUserHaveIOHomecontrolWithFeedbackClickHandler(param1);
      }
      
      public function set VSAskForIOHomecontrol(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1333412619VSAskForIOHomecontrol;
         if(_loc2_ !== param1)
         {
            this._1333412619VSAskForIOHomecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"VSAskForIOHomecontrol",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNoIsUserHaveIOHomecontrolWithFeedback() : Button
      {
         return this._638775849btnNoIsUserHaveIOHomecontrolWithFeedback;
      }
      
      public function set btnCommunicationEquipmentFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1402627851btnCommunicationEquipmentFailedCancel;
         if(_loc2_ !== param1)
         {
            this._1402627851btnCommunicationEquipmentFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCommunicationEquipmentFailedCancel",_loc2_,param1));
         }
      }
      
      public function set communicationRemoteFailed(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._419447015communicationRemoteFailed;
         if(_loc2_ !== param1)
         {
            this._419447015communicationRemoteFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"communicationRemoteFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbIsUserHaveOneWRemotecontrol() : Text
      {
         return this._459186637lbIsUserHaveOneWRemotecontrol;
      }
      
      [Bindable(event="propertyChange")]
      public function get userOneWRemotecontrolManipulationsThenOK() : Canvas
      {
         return this._1870447052userOneWRemotecontrolManipulationsThenOK;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbCommunicationRemoteFailed() : Text
      {
         return this._1146815043lbCommunicationRemoteFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKSuccessDiscovery() : Button
      {
         return this._1408101957btnOKSuccessDiscovery;
      }
      
      private function _AskForIOHomecontrolUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            isUserHaveIOHomecontrolWithFeedback.verticalScrollPolicy = param1;
         },"isUserHaveIOHomecontrolWithFeedback.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            isUserHaveIOHomecontrolWithFeedback.horizontalScrollPolicy = param1;
         },"isUserHaveIOHomecontrolWithFeedback.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox1.y = param1;
         },"_AskForIOHomecontrolUI_HBox1.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnHelpIsUserHaveIOHomecontrolWithFeedback.x = param1;
         },"btnHelpIsUserHaveIOHomecontrolWithFeedback.x");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnHelpIsUserHaveIOHomecontrolWithFeedback.y = param1;
         },"btnHelpIsUserHaveIOHomecontrolWithFeedback.y");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            userManipulationsThenOK.verticalScrollPolicy = param1;
         },"userManipulationsThenOK.verticalScrollPolicy");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            userManipulationsThenOK.horizontalScrollPolicy = param1;
         },"userManipulationsThenOK.horizontalScrollPolicy");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox2.y = param1;
         },"_AskForIOHomecontrolUI_HBox2.y");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnOk.y = param1;
         },"btnOk.y");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnUserManipulationsThenOK.x = param1;
         },"btnUserManipulationsThenOK.x");
         result[9] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnUserManipulationsThenOK.y = param1;
         },"btnUserManipulationsThenOK.y");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryInProgress.verticalScrollPolicy = param1;
         },"discoveryInProgress.verticalScrollPolicy");
         result[11] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryInProgress.horizontalScrollPolicy = param1;
         },"discoveryInProgress.horizontalScrollPolicy");
         result[12] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbDiscoveryInProgress2.y = param1;
         },"lbDiscoveryInProgress2.y");
         result[13] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinnerDiscoveryInProgress.y = param1;
         },"spinnerDiscoveryInProgress.y");
         result[14] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            communicationRemoteFailed.verticalScrollPolicy = param1;
         },"communicationRemoteFailed.verticalScrollPolicy");
         result[15] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            communicationRemoteFailed.horizontalScrollPolicy = param1;
         },"communicationRemoteFailed.horizontalScrollPolicy");
         result[16] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox3.y = param1;
         },"_AskForIOHomecontrolUI_HBox3.y");
         result[17] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            communicationEquipmentFailed.verticalScrollPolicy = param1;
         },"communicationEquipmentFailed.verticalScrollPolicy");
         result[18] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            communicationEquipmentFailed.horizontalScrollPolicy = param1;
         },"communicationEquipmentFailed.horizontalScrollPolicy");
         result[19] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox4.y = param1;
         },"_AskForIOHomecontrolUI_HBox4.y");
         result[20] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoverySuccess.verticalScrollPolicy = param1;
         },"discoverySuccess.verticalScrollPolicy");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoverySuccess.horizontalScrollPolicy = param1;
         },"discoverySuccess.horizontalScrollPolicy");
         result[22] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnOKSuccessDiscovery.y = param1;
         },"btnOKSuccessDiscovery.y");
         result[23] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            isUserHaveOneWRemotecontrol.verticalScrollPolicy = param1;
         },"isUserHaveOneWRemotecontrol.verticalScrollPolicy");
         result[24] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            isUserHaveOneWRemotecontrol.horizontalScrollPolicy = param1;
         },"isUserHaveOneWRemotecontrol.horizontalScrollPolicy");
         result[25] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox5.y = param1;
         },"_AskForIOHomecontrolUI_HBox5.y");
         result[26] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnHelpIsUserH1aveOneWRemotecontrol.x = param1;
         },"btnHelpIsUserH1aveOneWRemotecontrol.x");
         result[27] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnHelpIsUserH1aveOneWRemotecontrol.y = param1;
         },"btnHelpIsUserH1aveOneWRemotecontrol.y");
         result[28] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            userOneWRemotecontrolManipulationsThenOK.verticalScrollPolicy = param1;
         },"userOneWRemotecontrolManipulationsThenOK.verticalScrollPolicy");
         result[29] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            userOneWRemotecontrolManipulationsThenOK.horizontalScrollPolicy = param1;
         },"userOneWRemotecontrolManipulationsThenOK.horizontalScrollPolicy");
         result[30] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbOneWRemotecontrolUserManipulationsThenOKWarn.y = param1;
         },"lbOneWRemotecontrolUserManipulationsThenOKWarn.y");
         result[31] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox6.y = param1;
         },"_AskForIOHomecontrolUI_HBox6.y");
         result[32] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btUserOneWRemotecontrolManipulationsThenOK.y = param1;
         },"btUserOneWRemotecontrolManipulationsThenOK.y");
         result[33] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btUserOneWRemotecontrolManipulationsThenOK.x = param1;
         },"btUserOneWRemotecontrolManipulationsThenOK.x");
         result[34] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryOneWayInProgress.verticalScrollPolicy = param1;
         },"discoveryOneWayInProgress.verticalScrollPolicy");
         result[35] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryOneWayInProgress.horizontalScrollPolicy = param1;
         },"discoveryOneWayInProgress.horizontalScrollPolicy");
         result[36] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbDiscoveryOneWayInProgress2.y = param1;
         },"lbDiscoveryOneWayInProgress2.y");
         result[37] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinnerDiscoveryOneWayInProgress.y = param1;
         },"spinnerDiscoveryOneWayInProgress.y");
         result[38] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryOneWayCommunicationEquipmentFailed.verticalScrollPolicy = param1;
         },"discoveryOneWayCommunicationEquipmentFailed.verticalScrollPolicy");
         result[39] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryOneWayCommunicationEquipmentFailed.horizontalScrollPolicy = param1;
         },"discoveryOneWayCommunicationEquipmentFailed.horizontalScrollPolicy");
         result[40] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox7.y = param1;
         },"_AskForIOHomecontrolUI_HBox7.y");
         result[41] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryOneWaySuccess.verticalScrollPolicy = param1;
         },"discoveryOneWaySuccess.verticalScrollPolicy");
         result[42] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryOneWaySuccess.horizontalScrollPolicy = param1;
         },"discoveryOneWaySuccess.horizontalScrollPolicy");
         result[43] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox8.y = param1;
         },"_AskForIOHomecontrolUI_HBox8.y");
         result[44] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            pleaseRestartProcedure.verticalScrollPolicy = param1;
         },"pleaseRestartProcedure.verticalScrollPolicy");
         result[45] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            pleaseRestartProcedure.horizontalScrollPolicy = param1;
         },"pleaseRestartProcedure.horizontalScrollPolicy");
         result[46] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnOKPleaseRestartProcedure.y = param1;
         },"btnOKPleaseRestartProcedure.y");
         result[47] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            isUserHaveNewIOHomecontrolWithFeedback.verticalScrollPolicy = param1;
         },"isUserHaveNewIOHomecontrolWithFeedback.verticalScrollPolicy");
         result[48] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            isUserHaveNewIOHomecontrolWithFeedback.horizontalScrollPolicy = param1;
         },"isUserHaveNewIOHomecontrolWithFeedback.horizontalScrollPolicy");
         result[49] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox9.y = param1;
         },"_AskForIOHomecontrolUI_HBox9.y");
         result[50] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryNewIOHomecontrolInProgress.verticalScrollPolicy = param1;
         },"discoveryNewIOHomecontrolInProgress.verticalScrollPolicy");
         result[51] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            discoveryNewIOHomecontrolInProgress.horizontalScrollPolicy = param1;
         },"discoveryNewIOHomecontrolInProgress.horizontalScrollPolicy");
         result[52] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbNewIOHomecontrolDiscoveryInProgress2.y = param1;
         },"lbNewIOHomecontrolDiscoveryInProgress2.y");
         result[53] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinnerDiscoveryNewIOHomecontrolInProgress.y = param1;
         },"spinnerDiscoveryNewIOHomecontrolInProgress.y");
         result[54] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolCommunicationEquipmentFailed.verticalScrollPolicy = param1;
         },"newIOHomecontrolCommunicationEquipmentFailed.verticalScrollPolicy");
         result[55] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolCommunicationEquipmentFailed.horizontalScrollPolicy = param1;
         },"newIOHomecontrolCommunicationEquipmentFailed.horizontalScrollPolicy");
         result[56] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox10.y = param1;
         },"_AskForIOHomecontrolUI_HBox10.y");
         result[57] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolCommunicationEquipmentPartialyFailed.verticalScrollPolicy = param1;
         },"newIOHomecontrolCommunicationEquipmentPartialyFailed.verticalScrollPolicy");
         result[58] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolCommunicationEquipmentPartialyFailed.horizontalScrollPolicy = param1;
         },"newIOHomecontrolCommunicationEquipmentPartialyFailed.horizontalScrollPolicy");
         result[59] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _AskForIOHomecontrolUI_HBox11.y = param1;
         },"_AskForIOHomecontrolUI_HBox11.y");
         result[60] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolDiscoverySuccess.verticalScrollPolicy = param1;
         },"newIOHomecontrolDiscoverySuccess.verticalScrollPolicy");
         result[61] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolDiscoverySuccess.horizontalScrollPolicy = param1;
         },"newIOHomecontrolDiscoverySuccess.horizontalScrollPolicy");
         result[62] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnOKSuccessDiscoveryNewIO.y = param1;
         },"btnOKSuccessDiscoveryNewIO.y");
         result[63] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolDiscoveryFailed.verticalScrollPolicy = param1;
         },"newIOHomecontrolDiscoveryFailed.verticalScrollPolicy");
         result[64] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            newIOHomecontrolDiscoveryFailed.horizontalScrollPolicy = param1;
         },"newIOHomecontrolDiscoveryFailed.horizontalScrollPolicy");
         result[65] = binding;
         return result;
      }
      
      public function __btnDiscoveryOneWayCommunicationEquipmentFailedCancel_click(param1:MouseEvent) : void
      {
         this.onBtnCancelDiscoveryOneWayCommunicationEquipmentFailedClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbIsUserHaveNewIOHomecontrolWithFeedback() : Text
      {
         return this._481892950lbIsUserHaveNewIOHomecontrolWithFeedback;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoveryOneWaySuccess() : Text
      {
         return this._1231026784lbDiscoveryOneWaySuccess;
      }
      
      public function startDiscover() : void
      {
         SkitterManager.instance.skitterConnectionAllowed = false;
         if(this._step == null)
         {
            KCTimeAnalyzer.Tracer("startDiscover",50,this.className);
            this.VSAskForIOHomecontrol.selectedChild = this.isUserHaveIOHomecontrolWithFeedback;
            this.refreshPopup();
         }
         else if(this._step == Globals.STEP1_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.discoveryInProgress;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.play();
            if(Boolean(InstallationService.instance.currentInstallation) && InstallationService.instance.currentInstallation.actuators.length == 0)
            {
               ServerCommunicationManager.instance.getKeyFrom2WController();
            }
            else
            {
               ServerCommunicationManager.instance.pairEquipmentInSystem();
            }
         }
         else if(this._step == Globals.STEP2_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.isUserHaveOneWRemotecontrol;
            this.refreshPopup();
         }
         else if(this._step == Globals.STEP3_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.isUserHaveNewIOHomecontrolWithFeedback;
            this.refreshPopup();
         }
         else if(this._step == Globals.STEP4_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.pleaseRestartProcedure;
            this.refreshPopup();
         }
         else if(this._step == Globals.STEP_GENERATE_NEW_KEY)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.discoveryInProgress;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.play();
            ServerCommunicationManager.instance.generateNewKey("2w");
         }
      }
      
      public function set lbOneWRemotecontrolUserManipulationsThenOKWarn(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._426210618lbOneWRemotecontrolUserManipulationsThenOKWarn;
         if(_loc2_ !== param1)
         {
            this._426210618lbOneWRemotecontrolUserManipulationsThenOKWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbOneWRemotecontrolUserManipulationsThenOKWarn",_loc2_,param1));
         }
      }
      
      protected function btnHelpIsUserHaveOneWRemotecontrol_clickHandler(param1:MouseEvent) : void
      {
         DialogsManager.showRemote1WHelpPopup();
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_NEW_SYSTEM_KEY:
               this.VSAskForIOHomecontrol.selectedChild = this.communicationRemoteFailed;
               this.refreshPopup();
               this.spinnerDiscoveryInProgress.stop();
               callLater(this.setCommunicationRemoteFailedIconPosition);
               break;
            case ErrorCodes.ERROR_PAIR_EQUIPMENT_IN_SYSTEM:
               this.VSAskForIOHomecontrol.selectedChild = this.communicationEquipmentFailed;
               this.refreshPopup();
               this.spinnerDiscoveryInProgress.stop();
               callLater(this.setCommunicationEquipmentFailedIconPosition);
               break;
            case ErrorCodes.ERROR_PAIR_NEW_EQUIPMENT:
               this.VSAskForIOHomecontrol.selectedChild = this.communicationEquipmentFailed;
               this.refreshPopup();
               this.spinnerDiscoveryInProgress.stop();
               callLater(this.setCommunicationEquipmentFailedIconPosition);
               break;
            case ErrorCodes.ERROR_PAIR_EQUIPMENT_STIMULATED_BY_1W_CONTROLLER:
               this.VSAskForIOHomecontrol.selectedChild = this.discoveryOneWayCommunicationEquipmentFailed;
               this.refreshPopup();
               this.spinnerDiscoveryInProgress.stop();
               callLater(this.setDiscoveryOneWayCommunicationEquipmentFailedIconPosition);
               break;
            case ErrorCodes.ERROR_WRONG_SYSTEM_KEY:
               this.spinnerDiscoveryInProgress.stop();
               this.close();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               this.spinnerDiscoveryInProgress.stop();
               this.close();
               Globals.instance.installationState = null;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoveryOneWayCommunicationEquipmentFailed() : Text
      {
         return this._1279633800lbDiscoveryOneWayCommunicationEquipmentFailed;
      }
      
      public function set isUserHaveNewIOHomecontrolWithFeedback(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1811125952isUserHaveNewIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._1811125952isUserHaveNewIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isUserHaveNewIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spinnerDiscoveryNewIOHomecontrolInProgress() : Spinner
      {
         return this._108802431spinnerDiscoveryNewIOHomecontrolInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbNewIOHomecontrolCommunicationEquipmentFailed() : Text
      {
         return this._478218851lbNewIOHomecontrolCommunicationEquipmentFailed;
      }
      
      public function __btnYesOtherOneWRemotecontrol_click(param1:MouseEvent) : void
      {
         this.onBtnYesOtherOneWRemotecontrolClickHandler(param1);
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      public function set discoveryOneWaySuccess(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1651662154discoveryOneWaySuccess;
         if(_loc2_ !== param1)
         {
            this._1651662154discoveryOneWaySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discoveryOneWaySuccess",_loc2_,param1));
         }
      }
      
      public function set lbCommunicationEquipmentFailed(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1967454539lbCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._1967454539lbCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      public function __btnOkOneWRemotecontrol_click(param1:MouseEvent) : void
      {
         this.onBtnOkOneWRemotecontrolClickHandler(param1);
      }
      
      public function set newIOHomecontrolDiscoverySuccess(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._257725109newIOHomecontrolDiscoverySuccess;
         if(_loc2_ !== param1)
         {
            this._257725109newIOHomecontrolDiscoverySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newIOHomecontrolDiscoverySuccess",_loc2_,param1));
         }
      }
      
      public function set lbIsUserHaveIOHomecontrolWithFeedback(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1294095184lbIsUserHaveIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._1294095184lbIsUserHaveIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbIsUserHaveIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      public function set btnHelpIsUserH1aveOneWRemotecontrol(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1980234065btnHelpIsUserH1aveOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._1980234065btnHelpIsUserH1aveOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnHelpIsUserH1aveOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbPleaseRestartProcedure() : Text
      {
         return this._523221340lbPleaseRestartProcedure;
      }
      
      override protected function refreshUI() : void
      {
         switch(this.VSAskForIOHomecontrol.selectedChild.id)
         {
            case "newIOHomecontrolDiscoverySuccess":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "newIOHomecontrolDiscoveryFailed":
               break;
            case "newIOHomecontrolCommunicationEquipmentPartialyFailed":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "newIOHomecontrolCommunicationEquipmentFailed":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "discoveryNewIOHomecontrolInProgress":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "isUserHaveNewIOHomecontrolWithFeedback":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "pleaseRestartProcedure":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "discoveryOneWaySuccess":
               this.width = 384;
               this.popupPicto1W.visible = true;
               this.popupPicto1W.includeInLayout = true;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "discoveryOneWayInProgress":
               this.width = 384;
               this.popupPicto1W.visible = true;
               this.popupPicto1W.includeInLayout = true;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "discoveryOneWayCommunicationEquipmentFailed":
               this.width = 384;
               this.popupPicto1W.visible = true;
               this.popupPicto1W.includeInLayout = true;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "userOneWRemotecontrolManipulationsThenOK":
               this.width = 524;
               this.popupPicto1W.visible = true;
               this.popupPicto1W.includeInLayout = true;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "isUserHaveOneWRemotecontrol":
               this.width = 384;
               this.popupPicto1W.visible = true;
               this.popupPicto1W.includeInLayout = true;
               this.popupPicto2W.visible = false;
               this.popupPicto2W.includeInLayout = false;
               break;
            case "discoverySuccess":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = true;
               this.popupPicto2W.includeInLayout = true;
               break;
            case "discoveryInProgress":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = true;
               this.popupPicto2W.includeInLayout = true;
               break;
            case "communicationEquipmentFailed":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = true;
               this.popupPicto2W.includeInLayout = true;
               break;
            case "communicationRemoteFailed":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = true;
               this.popupPicto2W.includeInLayout = true;
               break;
            case "userManipulationsThenOK":
               this.width = 484;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = true;
               this.popupPicto2W.includeInLayout = true;
               break;
            case "isUserHaveIOHomecontrolWithFeedback":
               this.width = 384;
               this.popupPicto1W.visible = false;
               this.popupPicto1W.includeInLayout = false;
               this.popupPicto2W.visible = true;
               this.popupPicto2W.includeInLayout = true;
         }
         super.refreshUI();
      }
      
      public function set btnOk(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._94069080btnOk;
         if(_loc2_ !== param1)
         {
            this._94069080btnOk = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOk",_loc2_,param1));
         }
      }
      
      public function set discoveryNewIOHomecontrolInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1954334886discoveryNewIOHomecontrolInProgress;
         if(_loc2_ !== param1)
         {
            this._1954334886discoveryNewIOHomecontrolInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discoveryNewIOHomecontrolInProgress",_loc2_,param1));
         }
      }
      
      private function onBtnCancelDiscoveryOneWayCommunicationEquipmentFailedClickHandler(param1:MouseEvent = null) : void
      {
         Globals.instance.installationState = Globals.STEP4_DISCOVER_ACTUATOR;
         this.close();
      }
      
      public function set btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1388198565btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel;
         if(_loc2_ !== param1)
         {
            this._1388198565btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNewIOHomecontrolCommunicationEquipmentPartialyFailedCancel",_loc2_,param1));
         }
      }
      
      private function onBtnOkOneWRemotecontrolClickHandler(param1:MouseEvent = null) : void
      {
         this.VSAskForIOHomecontrol.selectedChild = this.discoveryOneWayInProgress;
         this.refreshPopup();
         this.spinnerDiscoveryOneWayInProgress.play();
         if(InstallationService.instance.is2WKeyExits())
         {
            ServerCommunicationManager.instance.pairEquipmentStimulatedBy1WController();
         }
         else
         {
            ServerCommunicationManager.instance.generateNewKey("1w");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesOtherOneWRemotecontrol() : Button
      {
         return this._734759231btnYesOtherOneWRemotecontrol;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoveryInProgress2() : Text
      {
         return this._843108666lbDiscoveryInProgress2;
      }
      
      public function set btnNoNewIOHomecontrolWithFeedback(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._128413536btnNoNewIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._128413536btnNoNewIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoNewIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageNewIOHomecontrolCommunicationEquipmentFailed() : Image
      {
         return this._990716616imageNewIOHomecontrolCommunicationEquipmentFailed;
      }
      
      public function get step() : String
      {
         return this._step;
      }
      
      public function __btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry_click(param1:MouseEvent) : void
      {
         this.onBtnRetryNewIOHomecontrolClickHandler(param1);
      }
      
      public function set spinnerDiscoveryInProgress(param1:Spinner) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1406072471spinnerDiscoveryInProgress;
         if(_loc2_ !== param1)
         {
            this._1406072471spinnerDiscoveryInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinnerDiscoveryInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbNewIOHomecontrolDiscoveryInProgress() : Text
      {
         return this._629572308lbNewIOHomecontrolDiscoveryInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageNewIOHomecontrolDiscoverySuccess() : Image
      {
         return this._1352536378imageNewIOHomecontrolDiscoverySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbNewIOHomecontrolDiscoverySuccess() : Text
      {
         return this._526899487lbNewIOHomecontrolDiscoverySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDiscoveryOneWayCommunicationEquipmentFailedCancel() : Button
      {
         return this._421824236btnDiscoveryOneWayCommunicationEquipmentFailedCancel;
      }
      
      public function set imageDiscoveryOneWayCommunicationEquipmentFailed(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._154722957imageDiscoveryOneWayCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._154722957imageDiscoveryOneWayCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDiscoveryOneWayCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      protected function setDiscoveryOneWayCommunicationEquipmentFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbDiscoveryOneWayCommunicationEquipmentFailed.validateNow();
         _loc1_ = this.lbDiscoveryOneWayCommunicationEquipmentFailed.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageDiscoveryOneWayCommunicationEquipmentFailed.width - 5;
         this.imageDiscoveryOneWayCommunicationEquipmentFailed.x = _loc1_.x - this.imageDiscoveryOneWayCommunicationEquipmentFailed.width - 5;
         _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoveryInProgress() : Text
      {
         return this._719933716lbDiscoveryInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoveryOneWayInProgress() : Text
      {
         return this._1820095755lbDiscoveryOneWayInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesUserHaveOneWRemotecontrol() : Button
      {
         return this._1411393256btnYesUserHaveOneWRemotecontrol;
      }
      
      public function set btnOKSuccessDiscoveryNewIO(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1278210175btnOKSuccessDiscoveryNewIO;
         if(_loc2_ !== param1)
         {
            this._1278210175btnOKSuccessDiscoveryNewIO = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOKSuccessDiscoveryNewIO",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userManipulationsThenOK() : Canvas
      {
         return this._45329660userManipulationsThenOK;
      }
      
      [Bindable(event="propertyChange")]
      public function get newIOHomecontrolCommunicationEquipmentPartialyFailed() : Canvas
      {
         return this._645721339newIOHomecontrolCommunicationEquipmentPartialyFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get VSAskForIOHomecontrol() : ViewStack
      {
         return this._1333412619VSAskForIOHomecontrol;
      }
      
      public function __btnNewIOHomecontrolCommunicationEquipmentFailedRetry_click(param1:MouseEvent) : void
      {
         this.onBtnRetryNewIOHomecontrolClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCommunicationEquipmentFailedCancel() : Button
      {
         return this._1402627851btnCommunicationEquipmentFailedCancel;
      }
      
      private function onBtnCancelClickHandler(param1:MouseEvent) : void
      {
         this.close();
         Globals.instance.installationState = Globals.STEP2_DISCOVER_ACTUATOR;
      }
      
      public function set pleaseRestartProcedure(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._102585970pleaseRestartProcedure;
         if(_loc2_ !== param1)
         {
            this._102585970pleaseRestartProcedure = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pleaseRestartProcedure",_loc2_,param1));
         }
      }
      
      public function __btnCommunicationEquipmentFailedRetry_click(param1:MouseEvent) : void
      {
         this.onBtnRetryClickHandler(param1);
      }
      
      public function set isUserHaveOneWRemotecontrol(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1896496521isUserHaveOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._1896496521isUserHaveOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isUserHaveOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      override protected function createChildren() : void
      {
         this.setStyle("paddingLeft",35);
         this.setStyle("paddingRight",35);
         super.createChildren();
      }
      
      public function set btnNoOtherOneWRemotecontrol(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1298104429btnNoOtherOneWRemotecontrol;
         if(_loc2_ !== param1)
         {
            this._1298104429btnNoOtherOneWRemotecontrol = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNoOtherOneWRemotecontrol",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get communicationRemoteFailed() : Canvas
      {
         return this._419447015communicationRemoteFailed;
      }
      
      public function __btnOKSuccessDiscoveryNewIO_click(param1:MouseEvent) : void
      {
         this.btnOKSuccessDiscoveryClickHandler(param1);
      }
      
      protected function setDiscoveryOneWaySuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbDiscoveryOneWaySuccess.validateNow();
         _loc1_ = this.lbDiscoveryOneWaySuccess.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageDiscoveryOneWaySuccess.width - 5;
         this.imageDiscoveryOneWaySuccess.x = _loc1_.x - this.imageDiscoveryOneWaySuccess.width - 5;
         _loc2_;
      }
      
      protected function setNewIOHomecontrolDiscoverySuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbNewIOHomecontrolDiscoverySuccess.validateNow();
         _loc1_ = this.lbNewIOHomecontrolDiscoverySuccess.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageNewIOHomecontrolDiscoverySuccess.width - 5;
         this.imageNewIOHomecontrolDiscoverySuccess.x = _loc1_.x - this.imageNewIOHomecontrolDiscoverySuccess.width - 5;
         _loc2_;
      }
      
      public function set lbNewIOHomecontrolCommunicationEquipmentPartialyFailed(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._847324571lbNewIOHomecontrolCommunicationEquipmentPartialyFailed;
         if(_loc2_ !== param1)
         {
            this._847324571lbNewIOHomecontrolCommunicationEquipmentPartialyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbNewIOHomecontrolCommunicationEquipmentPartialyFailed",_loc2_,param1));
         }
      }
      
      protected function setCommunicationRemoteFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbCommunicationRemoteFailed.validateNow();
         _loc1_ = this.lbCommunicationRemoteFailed.getLineMetrics(0);
         var _loc2_:* = _loc1_.x - this.imageCommunicationRemoteFailed.width - 5;
         this.imageCommunicationRemoteFailed.x = _loc1_.x - this.imageCommunicationRemoteFailed.width - 5;
         _loc2_;
      }
      
      public function __btnOKSuccessDiscovery_click(param1:MouseEvent) : void
      {
         this.btnOKSuccessDiscoveryClickHandler(param1);
      }
      
      private function OnDiscoveryEndHandler(param1:InstallationEvent) : void
      {
         if(this._step == Globals.STEP1_DISCOVER_ACTUATOR || this._step == Globals.STEP_GENERATE_NEW_KEY)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.discoverySuccess;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.stop();
            callLater(this.setDiscoverySuccessIconPosition);
         }
         else if(this._step == Globals.STEP2_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.discoveryOneWaySuccess;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.stop();
            callLater(this.setDiscoveryOneWaySuccessIconPosition);
         }
         else if(this._step == Globals.STEP3_DISCOVER_ACTUATOR)
         {
            this.VSAskForIOHomecontrol.selectedChild = this.newIOHomecontrolDiscoverySuccess;
            this.refreshPopup();
            this.spinnerDiscoveryInProgress.stop();
            callLater(this.setNewIOHomecontrolDiscoverySuccessIconPosition);
         }
      }
      
      public function set btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._723539033btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry;
         if(_loc2_ !== param1)
         {
            this._723539033btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbIsUserHaveIOHomecontrolWithFeedback() : Text
      {
         return this._1294095184lbIsUserHaveIOHomecontrolWithFeedback;
      }
      
      [Bindable(event="propertyChange")]
      public function get discoveryNewIOHomecontrolInProgress() : Canvas
      {
         return this._1954334886discoveryNewIOHomecontrolInProgress;
      }
      
      public function set btnHelpIsUserHaveIOHomecontrolWithFeedback(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1834741847btnHelpIsUserHaveIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._1834741847btnHelpIsUserHaveIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnHelpIsUserHaveIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      public function set imageDiscoverySuccess(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2026544210imageDiscoverySuccess;
         if(_loc2_ !== param1)
         {
            this._2026544210imageDiscoverySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDiscoverySuccess",_loc2_,param1));
         }
      }
      
      public function set spinnerDiscoveryOneWayInProgress(param1:Spinner) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._195210318spinnerDiscoveryOneWayInProgress;
         if(_loc2_ !== param1)
         {
            this._195210318spinnerDiscoveryOneWayInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinnerDiscoveryOneWayInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNoNewIOHomecontrolWithFeedback() : Button
      {
         return this._128413536btnNoNewIOHomecontrolWithFeedback;
      }
      
      public function __btnUserManipulationsThenOK_click(param1:MouseEvent) : void
      {
         this.btUserTwoWRemotecontrolManipulationsThenOK_clickHandler(param1);
      }
      
      public function set imageCommunicationEquipmentFailed(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1947237296imageCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._1947237296imageCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      public function __btnCommunicationEquipmentFailedCancel_click(param1:MouseEvent) : void
      {
         this.onBtnCancelClickHandler(param1);
      }
      
      public function set btnYesIsUserHaveIOHomecontrolWithFeedback(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._20802117btnYesIsUserHaveIOHomecontrolWithFeedback;
         if(_loc2_ !== param1)
         {
            this._20802117btnYesIsUserHaveIOHomecontrolWithFeedback = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesIsUserHaveIOHomecontrolWithFeedback",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKSuccessDiscoveryNewIO() : Button
      {
         return this._1278210175btnOKSuccessDiscoveryNewIO;
      }
      
      private function btnOKSuccessDiscoveryClickHandler(param1:MouseEvent = null) : void
      {
         this.close();
         Globals.instance.installationState = Globals.STEP2_DISCOVER_ACTUATOR;
      }
      
      private function onBtnYesNewIOHomecontrolWithFeedbackClickHandler(param1:MouseEvent = null) : void
      {
         this.VSAskForIOHomecontrol.selectedChild = this.newIOHomecontrolCommunicationEquipmentFailed;
         this.refreshPopup();
         callLater(this.setNewIOHomecontrolCommunicationEquipmentFailedIconPosition);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:AskForIOHomecontrolUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._AskForIOHomecontrolUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_AskForIOHomecontrolUIWatcherSetupUtil");
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
      public function get btnNoOtherOneWRemotecontrol() : Button
      {
         return this._1298104429btnNoOtherOneWRemotecontrol;
      }
      
      public function set lbDiscoverySuccess(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1277349431lbDiscoverySuccess;
         if(_loc2_ !== param1)
         {
            this._1277349431lbDiscoverySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoverySuccess",_loc2_,param1));
         }
      }
      
      public function set newIOHomecontrolCommunicationEquipmentFailed(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._169083341newIOHomecontrolCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._169083341newIOHomecontrolCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newIOHomecontrolCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      protected function btUserOneWRemotecontrolManipulationsThenOK_clickHandler(param1:MouseEvent) : void
      {
         DialogsManager.showRemote1WHelpAdvancedPopup(null,this);
      }
      
      public function set discoveryOneWayCommunicationEquipmentFailed(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2120889906discoveryOneWayCommunicationEquipmentFailed;
         if(_loc2_ !== param1)
         {
            this._2120889906discoveryOneWayCommunicationEquipmentFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discoveryOneWayCommunicationEquipmentFailed",_loc2_,param1));
         }
      }
      
      public function set discoveryOneWayInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._908609483discoveryOneWayInProgress;
         if(_loc2_ !== param1)
         {
            this._908609483discoveryOneWayInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"discoveryOneWayInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry() : Button
      {
         return this._723539033btnNewIOHomecontrolCommunicationEquipmentPartialyFailedRetry;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnHelpIsUserHaveIOHomecontrolWithFeedback() : Button
      {
         return this._1834741847btnHelpIsUserHaveIOHomecontrolWithFeedback;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageCommunicationEquipmentFailed() : Image
      {
         return this._1947237296imageCommunicationEquipmentFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get spinnerDiscoveryOneWayInProgress() : Spinner
      {
         return this._195210318spinnerDiscoveryOneWayInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDiscoverySuccess() : Image
      {
         return this._2026544210imageDiscoverySuccess;
      }
      
      public function set lbDiscoveryOneWayInProgress2(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._588393507lbDiscoveryOneWayInProgress2;
         if(_loc2_ !== param1)
         {
            this._588393507lbDiscoveryOneWayInProgress2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDiscoveryOneWayInProgress2",_loc2_,param1));
         }
      }
      
      public function set lbNewIOHomecontrolDiscoveryInProgress2(param1:Text) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1958094882lbNewIOHomecontrolDiscoveryInProgress2;
         if(_loc2_ !== param1)
         {
            this._1958094882lbNewIOHomecontrolDiscoveryInProgress2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbNewIOHomecontrolDiscoveryInProgress2",_loc2_,param1));
         }
      }
      
      public function set btnNewIOHomecontrolCommunicationEquipmentFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1198521823btnNewIOHomecontrolCommunicationEquipmentFailedRetry;
         if(_loc2_ !== param1)
         {
            this._1198521823btnNewIOHomecontrolCommunicationEquipmentFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNewIOHomecontrolCommunicationEquipmentFailedRetry",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get discoveryOneWayInProgress() : Canvas
      {
         return this._908609483discoveryOneWayInProgress;
      }
      
      public function __btnNoIsUserHaveIOHomecontrolWithFeedback_click(param1:MouseEvent) : void
      {
         this.onBtnNoIsUserHaveIOHomecontrolWithFeedbackClickHandler(param1);
      }
      
      private function onBtnNoUserHaveOneWRemotecontrolClickHandler(param1:MouseEvent = null) : void
      {
         this.VSAskForIOHomecontrol.selectedChild = this.pleaseRestartProcedure;
         this.refreshPopup();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDiscoveryOneWayInProgress2() : Text
      {
         return this._588393507lbDiscoveryOneWayInProgress2;
      }
      
      public function set newIOHomecontrolDiscoveryFailed(param1:Canvas) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._571055605newIOHomecontrolDiscoveryFailed;
         if(_loc2_ !== param1)
         {
            this._571055605newIOHomecontrolDiscoveryFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"newIOHomecontrolDiscoveryFailed",_loc2_,param1));
         }
      }
      
      public function set btnDiscoveryOneWayCommunicationEquipmentFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2050624522btnDiscoveryOneWayCommunicationEquipmentFailedRetry;
         if(_loc2_ !== param1)
         {
            this._2050624522btnDiscoveryOneWayCommunicationEquipmentFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDiscoveryOneWayCommunicationEquipmentFailedRetry",_loc2_,param1));
         }
      }
      
      public function set btnCommunicationEquipmentFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._890508279btnCommunicationEquipmentFailedRetry;
         if(_loc2_ !== param1)
         {
            this._890508279btnCommunicationEquipmentFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCommunicationEquipmentFailedRetry",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDiscoveryOneWayCommunicationEquipmentFailedRetry() : Button
      {
         return this._2050624522btnDiscoveryOneWayCommunicationEquipmentFailedRetry;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCommunicationEquipmentFailedRetry() : Button
      {
         return this._890508279btnCommunicationEquipmentFailedRetry;
      }
      
      public function set imageCommunicationRemoteFailed(param1:Image) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1213997566imageCommunicationRemoteFailed;
         if(_loc2_ !== param1)
         {
            this._1213997566imageCommunicationRemoteFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageCommunicationRemoteFailed",_loc2_,param1));
         }
      }
   }
}
