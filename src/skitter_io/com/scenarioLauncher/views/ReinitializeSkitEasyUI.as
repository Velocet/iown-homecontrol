package com.scenarioLauncher.views
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.persistence.LocalSQLiteConnection;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.services.ScenarioService;
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
   import mx.collections.ArrayCollection;
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
   import mx.styles.*;
   
   public class ReinitializeSkitEasyUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1578524519disconnectAllSkitter:Canvas;
      
      public var _ReinitializeSkitEasyUI_HBox1:HBox;
      
      public var _ReinitializeSkitEasyUI_HBox2:HBox;
      
      public var _ReinitializeSkitEasyUI_HBox3:HBox;
      
      public var _ReinitializeSkitEasyUI_HBox4:HBox;
      
      public var _ReinitializeSkitEasyUI_HBox5:HBox;
      
      private var _902507638lbReinitInstallationFailedWarn:Text;
      
      private var _1640458701btnCancelReinitInstallation:Button;
      
      private var _1729503309lbReinitInstallation:Text;
      
      private var _626063704reallyReinitInstallation:Canvas;
      
      private var _204125866btnReinitInstallationSuccess:Button;
      
      private var _1413292486reinitInstallationFailed:Canvas;
      
      private var _560208401btnOkDisconnectAllSkitter:Button;
      
      private var _1772336023lbDisconnectAllSkitterTitle:Text;
      
      private var _998030865reinitInstallationInProgress:Canvas;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _2004438503spinner:Spinner;
      
      private var _817204414btnCancelReallyReinitInstallation:Button;
      
      private var _1213839459reinitInstallation:Canvas;
      
      private var _820171117btnRestartReinitInstallationFailed:Button;
      
      private var _76711728lbReinitInstallationSuccess:Text;
      
      private var _embed_mxml__761932093:Class;
      
      private var _1642973786reinitInstallationSuccess:Canvas;
      
      private var _883017774btnStartReallyReinitInstallation:Button;
      
      private var _2089564568lbReinitInstallationFailedTitle:Text;
      
      private var _1133251253imageReinitInstallationFailed:Image;
      
      private var _1129728450lbReallyReinitInstallation:Text;
      
      private var _embed_mxml__928423959:Class;
      
      private var _9529205imageReinitInstallationSuccess:Image;
      
      private var _1682691864lbReallyReinitInstallationInProgressTitle:Text;
      
      private var _1308539752lbReinitInstallationSuccessTitle:Text;
      
      private var _1916957232lbReinitInstallationFailed:Text;
      
      private var _1336814181lbReinitInstallationTitle:Text;
      
      private var _285616100lbSynchronizationInProgress:Text;
      
      private var _491938126vsReinitInstallationUI:ViewStack;
      
      private var _689055139btnStartReinitInstallation:Button;
      
      private var _980045126lbReallyReinitInstallationTitle:Text;
      
      private var _29975632btnCancelReinitInstallationFailed:Button;
      
      private var _757244335btnCancelDisconnectAllSkitter:Button;
      
      mx_internal var _watchers:Array;
      
      private var _1290130649lbReinitInstallationWarn:Text;
      
      private var _1084721967lbDisconnectAllSkitter:Text;
      
      private var _1051288149lbDisconnectAllSkitterWarn:Text;
      
      private var _1342573468lbSynchronizationInProgressTitle:Text;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _embed_mxml__801521088:Class;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ReinitializeSkitEasyUI()
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
                        "source":_embed_mxml__761932093,
                        "x":244,
                        "y":18
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"vsReinitInstallationUI",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "resizeToContent":true,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"disconnectAllSkitter",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"disconnectAllSkitter",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDisconnectAllSkitterTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbdisconnectAllSkitterTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDisconnectAllSkitterWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationWarn",
                                          "percentWidth":100,
                                          "styleName":"VB22RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbDisconnectAllSkitter",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbDisconnectAllSkitter",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkitEasyUI_HBox1",
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
                                             "id":"btnOkDisconnectAllSkitter",
                                             "events":{"click":"__btnOkDisconnectAllSkitter_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnOkDisconnectAllSkitter",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelDisconnectAllSkitter",
                                             "events":{"click":"__btnCancelDisconnectAllSkitter_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelDisconnectAllSkitter",
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
                           "id":"reinitInstallation",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitInstallation",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationWarn",
                                          "percentWidth":100,
                                          "styleName":"VB22RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallation",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallation",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkitEasyUI_HBox2",
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
                                             "id":"btnStartReinitInstallation",
                                             "events":{"click":"__btnStartReinitInstallation_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartReinitInstallation",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReinitInstallation",
                                             "events":{"click":"__btnCancelReinitInstallation_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelReinitInstallation",
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
                           "id":"reallyReinitInstallation",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reallyReinitInstallation",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyReinitInstallationTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyReinitInstallationTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyReinitInstallation",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyReinitInstallation",
                                          "percentWidth":100,
                                          "styleName":"VR18BCLm1"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkitEasyUI_HBox3",
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
                                             "id":"btnStartReallyReinitInstallation",
                                             "events":{"click":"__btnStartReallyReinitInstallation_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartReallyReinitInstallation",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReallyReinitInstallation",
                                             "events":{"click":"__btnCancelReallyReinitInstallation_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelReallyReinitInstallation",
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
                           "id":"reinitInstallationInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitInstallationInProgress",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyReinitInstallationInProgressTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyReinitInstallationInProgressTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbSynchronizationInProgressTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbSynchronizationInProgressTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
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
                                          "x":242
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"reinitInstallationSuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitInstallationSuccess",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "clipContent":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationSuccessTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationSuccessTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageReinitInstallationSuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":55
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationSuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationSuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkitEasyUI_HBox4",
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
                                             "id":"btnReinitInstallationSuccess",
                                             "events":{"click":"__btnReinitInstallationSuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnReinitInstallationSuccess",
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
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"reinitInstallationFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitInstallationFailed",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "clipContent":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationFailedTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationFailedTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageReinitInstallationFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__801521088,
                                          "x":92
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReinitInstallationFailedWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReinitInstallationFailedWarn",
                                          "percentWidth":100,
                                          "styleName":"V18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkitEasyUI_HBox5",
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
                                             "id":"btnRestartReinitInstallationFailed",
                                             "events":{"click":"__btnRestartReinitInstallationFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnRestartReinitInstallationFailed",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReinitInstallationFailed",
                                             "events":{"click":"__btnCancelReinitInstallationFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelReinitInstallationFailed",
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
         this._embed_mxml__761932093 = ReinitializeSkitEasyUI__embed_mxml__761932093;
         this._embed_mxml__801521088 = ReinitializeSkitEasyUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = ReinitializeSkitEasyUI__embed_mxml__928423959;
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
         ReinitializeSkitEasyUI._watcherSetupUtil = param1;
      }
      
      public function __btnStartReallyReinitInstallation_click(param1:MouseEvent) : void
      {
         this.btnStartReallyReinitInstallationClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      public function __btnRestartReinitInstallationFailed_click(param1:MouseEvent) : void
      {
         this.btnRestartReinitInstallationFailedClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartReallyReinitInstallation() : Button
      {
         return this._883017774btnStartReallyReinitInstallation;
      }
      
      public function set btnOkDisconnectAllSkitter(param1:Button) : void
      {
         var _loc2_:Object = this._560208401btnOkDisconnectAllSkitter;
         if(_loc2_ !== param1)
         {
            this._560208401btnOkDisconnectAllSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOkDisconnectAllSkitter",_loc2_,param1));
         }
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
      
      [Bindable(event="propertyChange")]
      public function get btnOkDisconnectAllSkitter() : Button
      {
         return this._560208401btnOkDisconnectAllSkitter;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgress() : Text
      {
         return this._285616100lbSynchronizationInProgress;
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
      
      protected function btnCancelReallyReinitSkittersClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function _ReinitializeSkitEasyUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.lbDisconnectAllSkitterTitle.y + this.lbDisconnectAllSkitterTitle.height + 20;
         _loc1_ = this.lbDisconnectAllSkitterWarn.y + this.lbDisconnectAllSkitterWarn.height;
         _loc1_ = this.lbDisconnectAllSkitter.y + this.lbDisconnectAllSkitter.height + 30;
         _loc1_ = this.lbReinitInstallationTitle.y + this.lbReinitInstallationTitle.height + 20;
         _loc1_ = this.lbReinitInstallationWarn.y + this.lbReinitInstallationWarn.height;
         _loc1_ = this.lbReinitInstallation.y + this.lbReinitInstallation.height + 30;
         _loc1_ = this.lbReallyReinitInstallationTitle.y + this.lbReallyReinitInstallationTitle.height + 20;
         _loc1_ = this.lbReallyReinitInstallation.y + this.lbReallyReinitInstallation.height + 30;
         _loc1_ = this.lbReallyReinitInstallationInProgressTitle.y + this.lbReallyReinitInstallationInProgressTitle.height + 20;
         _loc1_ = this.lbSynchronizationInProgressTitle.y + this.lbSynchronizationInProgressTitle.height + 20;
         _loc1_ = this.lbSynchronizationInProgress.y + this.lbSynchronizationInProgress.height + 20;
         _loc1_ = this.lbReinitInstallationSuccessTitle.y + this.lbReinitInstallationSuccessTitle.height + 20;
         _loc1_ = this.lbReinitInstallationSuccessTitle.y + this.lbReinitInstallationSuccessTitle.height + 17;
         _loc1_ = this.lbReinitInstallationSuccess.y + this.lbReinitInstallationSuccess.height + 30;
         _loc1_ = this.lbReinitInstallationFailedTitle.y + this.lbReinitInstallationFailedTitle.height + 20;
         _loc1_ = this.lbReinitInstallationFailedTitle.y + this.lbReinitInstallationFailedTitle.height + 17;
         _loc1_ = this.lbReinitInstallationFailed.y + this.lbReinitInstallationFailed.height + 20;
         _loc1_ = this.lbReinitInstallationFailedWarn.y + this.lbReinitInstallationFailedWarn.height + 30;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyReinitInstallation() : Text
      {
         return this._1129728450lbReallyReinitInstallation;
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitInstallationFailed() : Canvas
      {
         return this._1413292486reinitInstallationFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReinitInstallation() : Button
      {
         return this._1640458701btnCancelReinitInstallation;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReinitInstallationFailed() : Button
      {
         return this._29975632btnCancelReinitInstallationFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDisconnectAllSkitterWarn() : Text
      {
         return this._1051288149lbDisconnectAllSkitterWarn;
      }
      
      public function set btnStartReallyReinitInstallation(param1:Button) : void
      {
         var _loc2_:Object = this._883017774btnStartReallyReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._883017774btnStartReallyReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartReallyReinitInstallation",_loc2_,param1));
         }
      }
      
      public function set lbDisconnectAllSkitter(param1:Text) : void
      {
         var _loc2_:Object = this._1084721967lbDisconnectAllSkitter;
         if(_loc2_ !== param1)
         {
            this._1084721967lbDisconnectAllSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDisconnectAllSkitter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationTitle() : Text
      {
         return this._1336814181lbReinitInstallationTitle;
      }
      
      public function set btnCancelReinitInstallation(param1:Button) : void
      {
         var _loc2_:Object = this._1640458701btnCancelReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._1640458701btnCancelReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReinitInstallation",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationFailedTitle() : Text
      {
         return this._2089564568lbReinitInstallationFailedTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDisconnectAllSkitterTitle() : Text
      {
         return this._1772336023lbDisconnectAllSkitterTitle;
      }
      
      private function _ReinitializeSkitEasyUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbDisconnectAllSkitterWarn.y = param1;
         },"lbDisconnectAllSkitterWarn.y");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbDisconnectAllSkitter.y = param1;
         },"lbDisconnectAllSkitter.y");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkitEasyUI_HBox1.y = param1;
         },"_ReinitializeSkitEasyUI_HBox1.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReinitInstallationWarn.y = param1;
         },"lbReinitInstallationWarn.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReinitInstallation.y = param1;
         },"lbReinitInstallation.y");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkitEasyUI_HBox2.y = param1;
         },"_ReinitializeSkitEasyUI_HBox2.y");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReallyReinitInstallation.y = param1;
         },"lbReallyReinitInstallation.y");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkitEasyUI_HBox3.y = param1;
         },"_ReinitializeSkitEasyUI_HBox3.y");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbSynchronizationInProgressTitle.y = param1;
         },"lbSynchronizationInProgressTitle.y");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbSynchronizationInProgress.y = param1;
         },"lbSynchronizationInProgress.y");
         result[9] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[10] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            imageReinitInstallationSuccess.y = param1;
         },"imageReinitInstallationSuccess.y");
         result[11] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReinitInstallationSuccess.y = param1;
         },"lbReinitInstallationSuccess.y");
         result[12] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkitEasyUI_HBox4.y = param1;
         },"_ReinitializeSkitEasyUI_HBox4.y");
         result[13] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            imageReinitInstallationFailed.y = param1;
         },"imageReinitInstallationFailed.y");
         result[14] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReinitInstallationFailed.y = param1;
         },"lbReinitInstallationFailed.y");
         result[15] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReinitInstallationFailedWarn.y = param1;
         },"lbReinitInstallationFailedWarn.y");
         result[16] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkitEasyUI_HBox5.y = param1;
         },"_ReinitializeSkitEasyUI_HBox5.y");
         result[17] = binding;
         return result;
      }
      
      protected function btnReinitInstallationSuccessClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function set reinitInstallationFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._1413292486reinitInstallationFailed;
         if(_loc2_ !== param1)
         {
            this._1413292486reinitInstallationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitInstallationFailed",_loc2_,param1));
         }
      }
      
      protected function btnCancelReinitInstallationClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationFailedWarn() : Text
      {
         return this._902507638lbReinitInstallationFailedWarn;
      }
      
      public function set lbReallyReinitInstallation(param1:Text) : void
      {
         var _loc2_:Object = this._1129728450lbReallyReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._1129728450lbReallyReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyReinitInstallation",_loc2_,param1));
         }
      }
      
      protected function btnCancelReallyReinitInstallationClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function onReInitializeInstallationError(param1:InstallationEvent) : void
      {
         this.goToReinitInstallationFailed();
      }
      
      [Bindable(event="propertyChange")]
      public function get imageReinitInstallationSuccess() : Image
      {
         return this._9529205imageReinitInstallationSuccess;
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      [Bindable(event="propertyChange")]
      public function get disconnectAllSkitter() : Canvas
      {
         return this._1578524519disconnectAllSkitter;
      }
      
      public function set btnCancelReinitInstallationFailed(param1:Button) : void
      {
         var _loc2_:Object = this._29975632btnCancelReinitInstallationFailed;
         if(_loc2_ !== param1)
         {
            this._29975632btnCancelReinitInstallationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReinitInstallationFailed",_loc2_,param1));
         }
      }
      
      protected function setSuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbReinitInstallationSuccess.validateNow();
         _loc1_ = this.lbReinitInstallationSuccess.getLineMetrics(0);
         this.imageReinitInstallationSuccess.x = _loc1_.x - this.imageReinitInstallationSuccess.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get reallyReinitInstallation() : Canvas
      {
         return this._626063704reallyReinitInstallation;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnReinitInstallationSuccess() : Button
      {
         return this._204125866btnReinitInstallationSuccess;
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsReinitInstallationUI.selectedChild.id)
         {
            case "disconnectAllSkitter":
               this.width = 529;
               break;
            case "reinitInstallation":
               this.width = 529;
               break;
            case "reallyReinitInstallation":
               this.width = 529;
               break;
            case "reinitInstallationInProgress":
               this.width = 529;
               break;
            case "reinitInstallationSuccess":
               this.width = 529;
               break;
            case "reinitInstallationFailed":
               this.width = 528;
         }
         super.refreshUI();
      }
      
      public function set lbDisconnectAllSkitterWarn(param1:Text) : void
      {
         var _loc2_:Object = this._1051288149lbDisconnectAllSkitterWarn;
         if(_loc2_ !== param1)
         {
            this._1051288149lbDisconnectAllSkitterWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDisconnectAllSkitterWarn",_loc2_,param1));
         }
      }
      
      public function __btnCancelReinitInstallation_click(param1:MouseEvent) : void
      {
         this.btnCancelReinitInstallationClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get imageReinitInstallationFailed() : Image
      {
         return this._1133251253imageReinitInstallationFailed;
      }
      
      protected function btnRestartReinitInstallationFailedClickHandler(param1:MouseEvent = null) : void
      {
         this.goToInitInstallation();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyReinitInstallationTitle() : Text
      {
         return this._980045126lbReallyReinitInstallationTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReallyReinitInstallation() : Button
      {
         return this._817204414btnCancelReallyReinitInstallation;
      }
      
      public function set vsReinitInstallationUI(param1:ViewStack) : void
      {
         var _loc2_:Object = this._491938126vsReinitInstallationUI;
         if(_loc2_ !== param1)
         {
            this._491938126vsReinitInstallationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsReinitInstallationUI",_loc2_,param1));
         }
      }
      
      public function set lbReinitInstallationTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1336814181lbReinitInstallationTitle;
         if(_loc2_ !== param1)
         {
            this._1336814181lbReinitInstallationTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationTitle",_loc2_,param1));
         }
      }
      
      public function set lbReinitInstallationFailedTitle(param1:Text) : void
      {
         var _loc2_:Object = this._2089564568lbReinitInstallationFailedTitle;
         if(_loc2_ !== param1)
         {
            this._2089564568lbReinitInstallationFailedTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationFailedTitle",_loc2_,param1));
         }
      }
      
      public function set lbDisconnectAllSkitterTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1772336023lbDisconnectAllSkitterTitle;
         if(_loc2_ !== param1)
         {
            this._1772336023lbDisconnectAllSkitterTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbDisconnectAllSkitterTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationSuccess() : Text
      {
         return this._76711728lbReinitInstallationSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationWarn() : Text
      {
         return this._1290130649lbReinitInstallationWarn;
      }
      
      public function set btnRestartReinitInstallationFailed(param1:Button) : void
      {
         var _loc2_:Object = this._820171117btnRestartReinitInstallationFailed;
         if(_loc2_ !== param1)
         {
            this._820171117btnRestartReinitInstallationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRestartReinitInstallationFailed",_loc2_,param1));
         }
      }
      
      private function goToReinitInstallationFailed() : void
      {
         this.vsReinitInstallationUI.selectedChild = this.reinitInstallationFailed;
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setFailedIconPosition);
      }
      
      public function set lbReinitInstallationSuccessTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1308539752lbReinitInstallationSuccessTitle;
         if(_loc2_ !== param1)
         {
            this._1308539752lbReinitInstallationSuccessTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationSuccessTitle",_loc2_,param1));
         }
      }
      
      public function __btnCancelReallyReinitInstallation_click(param1:MouseEvent) : void
      {
         this.btnCancelReallyReinitInstallationClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyReinitInstallationInProgressTitle() : Text
      {
         return this._1682691864lbReallyReinitInstallationInProgressTitle;
      }
      
      public function set lbReinitInstallationFailedWarn(param1:Text) : void
      {
         var _loc2_:Object = this._902507638lbReinitInstallationFailedWarn;
         if(_loc2_ !== param1)
         {
            this._902507638lbReinitInstallationFailedWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationFailedWarn",_loc2_,param1));
         }
      }
      
      public function __btnCancelReinitInstallationFailed_click(param1:MouseEvent) : void
      {
         this.btnCancelReinitInstallationFailedClickHandler(param1);
      }
      
      private function goToInitInstallation() : void
      {
         this.vsReinitInstallationUI.selectedChild = this.reinitInstallation;
         this.spinner.stop();
         this.refreshPopup();
      }
      
      public function set imageReinitInstallationSuccess(param1:Image) : void
      {
         var _loc2_:Object = this._9529205imageReinitInstallationSuccess;
         if(_loc2_ !== param1)
         {
            this._9529205imageReinitInstallationSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageReinitInstallationSuccess",_loc2_,param1));
         }
      }
      
      protected function btnCancelReinitInstallationFailedClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function __btnCancelDisconnectAllSkitter_click(param1:MouseEvent) : void
      {
         this.btnCancelDisconnectAllSkitterClickHandler(param1);
      }
      
      private function checkDeviceConnected() : void
      {
         if(InstallationService.instance.hasConnectedAndActivatedDevice())
         {
            this.vsReinitInstallationUI.selectedChild = this.disconnectAllSkitter;
         }
         else
         {
            this.vsReinitInstallationUI.selectedChild = this.reinitInstallation;
         }
         this.refreshPopup();
      }
      
      override protected function initLabels() : void
      {
         switch(this.vsReinitInstallationUI.selectedChild.id)
         {
            case "disconnectAllSkitter":
               this.lbDisconnectAllSkitterTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE");
               this.lbDisconnectAllSkitterWarn.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_WARN");
               this.lbDisconnectAllSkitter.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_WARN2");
               this.btnOkDisconnectAllSkitter.label = resourceManager.getString("common","BTN_OK");
               this.btnCancelDisconnectAllSkitter.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "reinitInstallation":
               this.lbReinitInstallationTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE");
               this.lbReinitInstallationWarn.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_WARN");
               this.lbReinitInstallation.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL");
               this.btnStartReinitInstallation.label = resourceManager.getString("common","BTN_OK");
               this.btnCancelReinitInstallation.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "reallyReinitInstallation":
               this.lbReallyReinitInstallationTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE");
               this.lbReallyReinitInstallation.htmlText = resourceManager.getString("system","MSG_REALLY_REINIT_INSTALL");
               this.btnStartReallyReinitInstallation.label = resourceManager.getString("common","BTN_YES");
               this.btnCancelReallyReinitInstallation.label = resourceManager.getString("common","BTN_NO");
               break;
            case "reinitInstallationInProgress":
               this.lbReallyReinitInstallationInProgressTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE");
               this.lbSynchronizationInProgressTitle.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_TITLE");
               this.lbSynchronizationInProgress.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_IN_PROGRESS");
               break;
            case "reinitInstallationSuccess":
               this.lbReinitInstallationSuccessTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE");
               this.lbReinitInstallationSuccess.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_SUCCESS");
               this.btnReinitInstallationSuccess.label = resourceManager.getString("common","BTN_OK");
               break;
            case "reinitInstallationFailed":
               this.lbReinitInstallationFailedTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE");
               this.lbReinitInstallationFailed.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_FAILED");
               this.lbReinitInstallationFailedWarn.htmlText = resourceManager.getString("system","MSG_REINIT_INSTALL_FAILED_WARN");
               this.btnRestartReinitInstallationFailed.label = resourceManager.getString("common","BTN_RETRY");
               this.btnCancelReinitInstallationFailed.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.vsReinitInstallationUI.addEventListener(FlexEvent.VALUE_COMMIT,this.onVsReinitInstallationUIValueCommit);
         this.checkDeviceConnected();
         SkitterManager.instance.skitterConnectionAllowed = false;
      }
      
      public function set lbSynchronizationInProgressTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1342573468lbSynchronizationInProgressTitle;
         if(_loc2_ !== param1)
         {
            this._1342573468lbSynchronizationInProgressTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSynchronizationInProgressTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbDisconnectAllSkitter() : Text
      {
         return this._1084721967lbDisconnectAllSkitter;
      }
      
      public function set disconnectAllSkitter(param1:Canvas) : void
      {
         var _loc2_:Object = this._1578524519disconnectAllSkitter;
         if(_loc2_ !== param1)
         {
            this._1578524519disconnectAllSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"disconnectAllSkitter",_loc2_,param1));
         }
      }
      
      public function set btnStartReinitInstallation(param1:Button) : void
      {
         var _loc2_:Object = this._689055139btnStartReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._689055139btnStartReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartReinitInstallation",_loc2_,param1));
         }
      }
      
      public function set reinitInstallation(param1:Canvas) : void
      {
         var _loc2_:Object = this._1213839459reinitInstallation;
         if(_loc2_ !== param1)
         {
            this._1213839459reinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitInstallation",_loc2_,param1));
         }
      }
      
      public function set reinitInstallationSuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._1642973786reinitInstallationSuccess;
         if(_loc2_ !== param1)
         {
            this._1642973786reinitInstallationSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitInstallationSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get vsReinitInstallationUI() : ViewStack
      {
         return this._491938126vsReinitInstallationUI;
      }
      
      public function set reallyReinitInstallation(param1:Canvas) : void
      {
         var _loc2_:Object = this._626063704reallyReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._626063704reallyReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reallyReinitInstallation",_loc2_,param1));
         }
      }
      
      public function set btnReinitInstallationSuccess(param1:Button) : void
      {
         var _loc2_:Object = this._204125866btnReinitInstallationSuccess;
         if(_loc2_ !== param1)
         {
            this._204125866btnReinitInstallationSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnReinitInstallationSuccess",_loc2_,param1));
         }
      }
      
      public function set btnCancelDisconnectAllSkitter(param1:Button) : void
      {
         var _loc2_:Object = this._757244335btnCancelDisconnectAllSkitter;
         if(_loc2_ !== param1)
         {
            this._757244335btnCancelDisconnectAllSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelDisconnectAllSkitter",_loc2_,param1));
         }
      }
      
      protected function btnStartDisconnectAllSkitterClickHandler(param1:MouseEvent) : void
      {
         this.checkDeviceConnected();
         this.refreshPopup();
      }
      
      public function onReInitializeInstallationSuccess(param1:InstallationEvent) : void
      {
         this.reInitInstallationSuccess();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationSuccessTitle() : Text
      {
         return this._1308539752lbReinitInstallationSuccessTitle;
      }
      
      public function set imageReinitInstallationFailed(param1:Image) : void
      {
         var _loc2_:Object = this._1133251253imageReinitInstallationFailed;
         if(_loc2_ !== param1)
         {
            this._1133251253imageReinitInstallationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageReinitInstallationFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRestartReinitInstallationFailed() : Button
      {
         return this._820171117btnRestartReinitInstallationFailed;
      }
      
      public function set lbReallyReinitInstallationTitle(param1:Text) : void
      {
         var _loc2_:Object = this._980045126lbReallyReinitInstallationTitle;
         if(_loc2_ !== param1)
         {
            this._980045126lbReallyReinitInstallationTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyReinitInstallationTitle",_loc2_,param1));
         }
      }
      
      public function set lbReinitInstallation(param1:Text) : void
      {
         var _loc2_:Object = this._1729503309lbReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._1729503309lbReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallation",_loc2_,param1));
         }
      }
      
      public function set btnCancelReallyReinitInstallation(param1:Button) : void
      {
         var _loc2_:Object = this._817204414btnCancelReallyReinitInstallation;
         if(_loc2_ !== param1)
         {
            this._817204414btnCancelReallyReinitInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReallyReinitInstallation",_loc2_,param1));
         }
      }
      
      private function reInitInstallationSuccess() : void
      {
         this.vsReinitInstallationUI.selectedChild = this.reinitInstallationSuccess;
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setSuccessIconPosition);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ReinitializeSkitEasyUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ReinitializeSkitEasyUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_ReinitializeSkitEasyUIWatcherSetupUtil");
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
      
      public function __btnReinitInstallationSuccess_click(param1:MouseEvent) : void
      {
         this.btnReinitInstallationSuccessClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgressTitle() : Text
      {
         return this._1342573468lbSynchronizationInProgressTitle;
      }
      
      public function set lbReinitInstallationFailed(param1:Text) : void
      {
         var _loc2_:Object = this._1916957232lbReinitInstallationFailed;
         if(_loc2_ !== param1)
         {
            this._1916957232lbReinitInstallationFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationFailed",_loc2_,param1));
         }
      }
      
      protected function setFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbReinitInstallationFailed.validateNow();
         _loc1_ = this.lbReinitInstallationFailed.getLineMetrics(0);
         this.imageReinitInstallationFailed.x = _loc1_.x - this.imageReinitInstallationFailed.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartReinitInstallation() : Button
      {
         return this._689055139btnStartReinitInstallation;
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitInstallation() : Canvas
      {
         return this._1213839459reinitInstallation;
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitInstallationSuccess() : Canvas
      {
         return this._1642973786reinitInstallationSuccess;
      }
      
      public function set lbReinitInstallationSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._76711728lbReinitInstallationSuccess;
         if(_loc2_ !== param1)
         {
            this._76711728lbReinitInstallationSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelDisconnectAllSkitter() : Button
      {
         return this._757244335btnCancelDisconnectAllSkitter;
      }
      
      public function set lbReinitInstallationWarn(param1:Text) : void
      {
         var _loc2_:Object = this._1290130649lbReinitInstallationWarn;
         if(_loc2_ !== param1)
         {
            this._1290130649lbReinitInstallationWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReinitInstallationWarn",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallation() : Text
      {
         return this._1729503309lbReinitInstallation;
      }
      
      private function onVsReinitInstallationUIValueCommit(param1:FlexEvent) : void
      {
         invalidateDisplayList();
      }
      
      public function set lbReallyReinitInstallationInProgressTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1682691864lbReallyReinitInstallationInProgressTitle;
         if(_loc2_ !== param1)
         {
            this._1682691864lbReallyReinitInstallationInProgressTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyReinitInstallationInProgressTitle",_loc2_,param1));
         }
      }
      
      public function __btnStartReinitInstallation_click(param1:MouseEvent) : void
      {
         this.btnStartReinitInstallationClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReinitInstallationFailed() : Text
      {
         return this._1916957232lbReinitInstallationFailed;
      }
      
      public function set reinitInstallationInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._998030865reinitInstallationInProgress;
         if(_loc2_ !== param1)
         {
            this._998030865reinitInstallationInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitInstallationInProgress",_loc2_,param1));
         }
      }
      
      protected function btnStartReinitInstallationClickHandler(param1:MouseEvent) : void
      {
         this.vsReinitInstallationUI.selectedChild = this.reallyReinitInstallation;
         this.refreshPopup();
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitInstallationInProgress() : Canvas
      {
         return this._998030865reinitInstallationInProgress;
      }
      
      protected function btnStartReallyReinitInstallationClickHandler(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         this.vsReinitInstallationUI.selectedChild = this.reinitInstallationInProgress;
         this.spinner.play();
         this.refreshPopup();
         try
         {
            LocalSQLiteConnection.instance.resetDatabase();
            InstallationService.instance.deleteCustomScenariosImageFiles();
            this.reInitInstallationSuccess();
            ServerCommunicationManager.instance.actuatorsList.removeAll();
            ServerCommunicationManager.instance.scenariosList.removeAll();
            ServerCommunicationManager.instance.devicesList.removeAll();
            ServerCommunicationManager.instance.connectedDevice.removeAll();
            ScenarioService.instance.scenarios = new ArrayCollection();
            InstallationService.instance.desactivateSkitters();
            Application.application.mainUI.installationUI.initializeInstallation();
            InstallationService.instance.refreshActivateDevice();
            Application.application.mainUI.refreshInstallation();
            Application.application.mainUI.refreshScenario();
         }
         catch(err:Error)
         {
            KCTimeAnalyzer.Tracer("resetDatabase ERROR :\n" + err.message,0);
            goToReinitInstallationFailed();
         }
      }
      
      protected function btnCancelDisconnectAllSkitterClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function close() : void
      {
         closeHandler();
         Globals.SYNCHRO_LOCKED = false;
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.skitterList = new ArrayCollection();
      }
      
      public function __btnOkDisconnectAllSkitter_click(param1:MouseEvent) : void
      {
         this.btnStartDisconnectAllSkitterClickHandler(param1);
      }
   }
}
