package com.scenarioLauncher.views
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.Spinner;
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
   import ioService.datamodel.Skitter;
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
   
   public class ReinitializeSkittersUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _563100520reinitSkitterFailed:Canvas;
      
      private var _2138276066btnCancelreinitSkitterFailed:Button;
      
      private var _skitterListToSynchronise:Array = null;
      
      private var _1408946558lbreinitSkitterSuccess:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _2071320211lbreinitSkitterTitle:Text;
      
      public var _ReinitializeSkittersUI_HBox1:HBox;
      
      public var _ReinitializeSkittersUI_HBox2:HBox;
      
      public var _ReinitializeSkittersUI_HBox3:HBox;
      
      public var _ReinitializeSkittersUI_HBox4:HBox;
      
      public var _ReinitializeSkittersUI_HBox5:HBox;
      
      private var _skitterListToReinitialise:Array = null;
      
      private var _2121275686btnCancelReallyreinitSkitter:Button;
      
      private var _1375113941btnStartreinitSkitter:Button;
      
      private var _2004438503spinner:Spinner;
      
      private var connectedDeviceActivateListEverTreated:Array;
      
      private var connectedDeviceActivateList:Array;
      
      private var _2135935497btnNOSkitterVersionPb:Button;
      
      private var _embed_mxml__761932093:Class;
      
      private var _1575658594lbSkitterVersionPb:Text;
      
      private var _1870252365reinitSkitterInProgress:Canvas;
      
      private var _1838599877lbreinitSkitter:Text;
      
      private var _903239848lbReallyReinitSkitterWarnTitle:Text;
      
      private var _20591652btnOKSkitterVersionPb:Button;
      
      private var _1728864390lbreinitSkitterSuccessTitle:Text;
      
      private var _236899451reinitSkitter:Canvas;
      
      private var _622106782lbreinitSkitterFailed:Text;
      
      private var _embed_mxml__928423959:Class;
      
      private var _2043495165imageReinitSkitterSuccess:Image;
      
      private var _976934624lbReallyReinitSkitterWarn:Text;
      
      private var _2031186034btnStartReinitSkitterSuccess:Button;
      
      private var _currentResettedSkitter:Skitter = null;
      
      private var _1164965819btnCancelreinitSkitter:Button;
      
      private var _285616100lbSynchronizationInProgress:Text;
      
      private var _2072992782vsreinitSkitterUI:ViewStack;
      
      private var _343993067lbreinitSkitterWarn:Text;
      
      private var _1623872226lbReallyreinitSkitterTitle:Text;
      
      private var skitterName:String;
      
      private var _1780981072reallyreinitSkitter:Canvas;
      
      private var _1356261354lbreinitSkitterFailedTitle:Text;
      
      private var _1980401859imageReinitSkitterFailed:Image;
      
      private var _1056826616reinitSkitterSuccess:Canvas;
      
      private var _1342082878lbSynchronizationInProgressWarn:Text;
      
      mx_internal var _watchers:Array;
      
      private var _1374176618btnStartReallyreinitSkitter:Button;
      
      private var _skittersIncompatible:Array = null;
      
      private var _1047265588skitterVersionPb:Canvas;
      
      private var _1609488843lbreinitSkitterQuestion:Text;
      
      private var _586691238lbReallyreinitSkitter:Text;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1970825819btnRestartreinitSkitterFailed:Button;
      
      private var _embed_mxml__801521088:Class;
      
      private var _1342573468lbSynchronizationInProgressTitle:Text;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ReinitializeSkittersUI()
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
                  "id":"vsreinitSkitterUI",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "percentHeight":100,
                        "resizeToContent":true,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"skitterVersionPb",
                           "propertiesFactory":function():Object
                           {
                              return {"childDescriptors":[new UIComponentDescriptor({
                                 "type":Text,
                                 "id":"lbSkitterVersionPb",
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "selectable":false,
                                       "name":"lbSkitterVersionPb",
                                       "percentWidth":100,
                                       "styleName":"VR18BCL0",
                                       "y":0
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":HBox,
                                 "id":"_ReinitializeSkittersUI_HBox1",
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
                                       }),new UIComponentDescriptor({
                                          "type":Button,
                                          "id":"btnNOSkitterVersionPb",
                                          "events":{"click":"__btnNOSkitterVersionPb_click"},
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "cacheAsBitmap":false,
                                                "name":"btnNOSkitterVersionPb",
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
                              })]};
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"reinitSkitter",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitSkitter",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbreinitSkitterTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbreinitSkitterQuestion",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterQuestion",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbreinitSkitterWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterWarn",
                                          "percentWidth":100,
                                          "styleName":"VB22RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbreinitSkitter",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitter",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkittersUI_HBox2",
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
                                             "id":"btnStartreinitSkitter",
                                             "events":{"click":"__btnStartreinitSkitter_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartreinitSkitter",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelreinitSkitter",
                                             "events":{"click":"__btnCancelreinitSkitter_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelreinitSkitter",
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
                           "id":"reallyreinitSkitter",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reallyreinitSkitter",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyreinitSkitterTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyreinitSkitterTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyReinitSkitterWarnTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyReinitSkitterWarnTitle",
                                          "percentWidth":100,
                                          "styleName":"VB22RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyReinitSkitterWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyReinitSkitterWarn",
                                          "percentWidth":100,
                                          "styleName":"V18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReallyreinitSkitter",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReallyreinitSkitter",
                                          "percentWidth":100,
                                          "styleName":"VR18BCLm1"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkittersUI_HBox3",
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
                                             "id":"btnStartReallyreinitSkitter",
                                             "events":{"click":"__btnStartReallyreinitSkitter_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartReallyreinitSkitter",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReallyreinitSkitter",
                                             "events":{"click":"__btnCancelReallyreinitSkitter_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelReallyreinitSkitter",
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
                           "id":"reinitSkitterInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitSkitterInProgress",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbSynchronizationInProgressTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbSynchronizationInProgressTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
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
                                    "type":Text,
                                    "id":"lbSynchronizationInProgressWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbSynchronizationInProgressWarn",
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
                           "id":"reinitSkitterSuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitSkitterSuccess",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "clipContent":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbreinitSkitterSuccessTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterSuccessTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageReinitSkitterSuccess",
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
                                    "id":"lbreinitSkitterSuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterSuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkittersUI_HBox4",
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
                                             "id":"btnStartReinitSkitterSuccess",
                                             "events":{"click":"__btnStartReinitSkitterSuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartReinitSkitterSuccess",
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
                           "id":"reinitSkitterFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"reinitSkitterFailed",
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "clipContent":false,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbreinitSkitterFailedTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterFailedTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageReinitSkitterFailed",
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
                                    "id":"lbreinitSkitterFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbreinitSkitterFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReinitializeSkittersUI_HBox5",
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
                                             "id":"btnRestartreinitSkitterFailed",
                                             "events":{"click":"__btnRestartreinitSkitterFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnRestartreinitSkitterFailed",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelreinitSkitterFailed",
                                             "events":{"click":"__btnCancelreinitSkitterFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelreinitSkitterFailed",
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
         this._embed_mxml__761932093 = ReinitializeSkittersUI__embed_mxml__761932093;
         this._embed_mxml__801521088 = ReinitializeSkittersUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = ReinitializeSkittersUI__embed_mxml__928423959;
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
         ReinitializeSkittersUI._watcherSetupUtil = param1;
      }
      
      public function get currentResettedSkitter() : Skitter
      {
         return this._currentResettedSkitter;
      }
      
      public function set currentResettedSkitter(param1:Skitter) : void
      {
         this._currentResettedSkitter = param1;
         if(this._currentResettedSkitter != null)
         {
            this.skitterName = this._currentResettedSkitter.name;
         }
         else
         {
            this.skitterName = "";
         }
      }
      
      public function set imageReinitSkitterSuccess(param1:Image) : void
      {
         var _loc2_:Object = this._2043495165imageReinitSkitterSuccess;
         if(_loc2_ !== param1)
         {
            this._2043495165imageReinitSkitterSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageReinitSkitterSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNOSkitterVersionPb() : Button
      {
         return this._2135935497btnNOSkitterVersionPb;
      }
      
      private function goToReallyReinitSkitter() : void
      {
         this.vsreinitSkitterUI.selectedChild = this.reallyreinitSkitter;
         this.spinner.stop();
         this.refreshPopup();
      }
      
      public function set reinitSkitterSuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._1056826616reinitSkitterSuccess;
         if(_loc2_ !== param1)
         {
            this._1056826616reinitSkitterSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitSkitterSuccess",_loc2_,param1));
         }
      }
      
      protected function btnStartreinitSkitterClickHandler(param1:MouseEvent) : void
      {
         this.goToReallyReinitSkitter();
      }
      
      public function set btnNOSkitterVersionPb(param1:Button) : void
      {
         var _loc2_:Object = this._2135935497btnNOSkitterVersionPb;
         if(_loc2_ !== param1)
         {
            this._2135935497btnNOSkitterVersionPb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNOSkitterVersionPb",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgress() : Text
      {
         return this._285616100lbSynchronizationInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterFailedTitle() : Text
      {
         return this._1356261354lbreinitSkitterFailedTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKSkitterVersionPb() : Button
      {
         return this._20591652btnOKSkitterVersionPb;
      }
      
      public function set lbreinitSkitterFailedTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1356261354lbreinitSkitterFailedTitle;
         if(_loc2_ !== param1)
         {
            this._1356261354lbreinitSkitterFailedTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterFailedTitle",_loc2_,param1));
         }
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         super.closeHandler(param1);
         Globals.SYNCHRO_LOCKED = false;
      }
      
      private function onVsreinitSkitterUIValueCommit(param1:FlexEvent) : void
      {
         invalidateDisplayList();
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
      
      public function set spinner(param1:Spinner) : void
      {
         var _loc2_:Object = this._2004438503spinner;
         if(_loc2_ !== param1)
         {
            this._2004438503spinner = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinner",_loc2_,param1));
         }
      }
      
      private function goToreinitSkitterFailed() : void
      {
         this.vsreinitSkitterUI.selectedChild = this.reinitSkitterFailed;
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setFailedIconPosition);
      }
      
      public function set lbReallyreinitSkitterTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1623872226lbReallyreinitSkitterTitle;
         if(_loc2_ !== param1)
         {
            this._1623872226lbReallyreinitSkitterTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyreinitSkitterTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelreinitSkitter() : Button
      {
         return this._1164965819btnCancelreinitSkitter;
      }
      
      private function skitterReinitialisedHandler(param1:InstallationEvent) : void
      {
         this.goToreinitSkitterSuccess();
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
      
      [Bindable(event="propertyChange")]
      public function get lbSkitterVersionPb() : Text
      {
         return this._1575658594lbSkitterVersionPb;
      }
      
      public function set imageReinitSkitterFailed(param1:Image) : void
      {
         var _loc2_:Object = this._1980401859imageReinitSkitterFailed;
         if(_loc2_ !== param1)
         {
            this._1980401859imageReinitSkitterFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageReinitSkitterFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitSkitter() : Canvas
      {
         return this._236899451reinitSkitter;
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_RESET_SKITTER:
               this.goToreinitSkitterFailed();
         }
      }
      
      public function __btnRestartreinitSkitterFailed_click(param1:MouseEvent) : void
      {
         this.btnRestartreinitSkitterFailedClickHandler(param1);
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      public function __btnStartReallyreinitSkitter_click(param1:MouseEvent) : void
      {
         this.btnStartReallyreinitSkitterClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitSkitterFailed() : Canvas
      {
         return this._563100520reinitSkitterFailed;
      }
      
      public function set btnCancelreinitSkitter(param1:Button) : void
      {
         var _loc2_:Object = this._1164965819btnCancelreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._1164965819btnCancelreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelreinitSkitter",_loc2_,param1));
         }
      }
      
      protected function btnCancelReallyreinitSkitterClickHandler(param1:MouseEvent) : void
      {
         this.manageClose();
      }
      
      public function set reinitSkitterInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._1870252365reinitSkitterInProgress;
         if(_loc2_ !== param1)
         {
            this._1870252365reinitSkitterInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitSkitterInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterTitle() : Text
      {
         return this._2071320211lbreinitSkitterTitle;
      }
      
      protected function setSuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbreinitSkitterSuccess.validateNow();
         _loc1_ = this.lbreinitSkitterSuccess.getLineMetrics(0);
         this.imageReinitSkitterSuccess.x = _loc1_.x - this.imageReinitSkitterSuccess.width - 5;
      }
      
      protected function btnCancelreinitSkitterFailedClickHandler(param1:MouseEvent) : void
      {
         this.manageClose();
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsreinitSkitterUI.selectedChild.id)
         {
            case "skitterVersionPb":
               this.width = 384;
               break;
            case "reinitSkitter":
               this.width = 529;
               break;
            case "reallyreinitSkitter":
               this.width = 529;
               break;
            case "reinitSkitterInProgress":
               this.width = 570;
               break;
            case "reinitSkitterSuccess":
               this.width = 529;
               break;
            case "reinitSkitterFailed":
               this.width = 528;
         }
         super.refreshUI();
      }
      
      public function set lbReallyReinitSkitterWarnTitle(param1:Text) : void
      {
         var _loc2_:Object = this._903239848lbReallyReinitSkitterWarnTitle;
         if(_loc2_ !== param1)
         {
            this._903239848lbReallyReinitSkitterWarnTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyReinitSkitterWarnTitle",_loc2_,param1));
         }
      }
      
      public function set lbReallyreinitSkitter(param1:Text) : void
      {
         var _loc2_:Object = this._586691238lbReallyreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._586691238lbReallyreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyreinitSkitter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get reallyreinitSkitter() : Canvas
      {
         return this._1780981072reallyreinitSkitter;
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
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitter() : Text
      {
         return this._1838599877lbreinitSkitter;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgressWarn() : Text
      {
         return this._1342082878lbSynchronizationInProgressWarn;
      }
      
      private function _ReinitializeSkittersUI_bindingsSetup() : Array
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
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkittersUI_HBox1.y = param1;
         },"_ReinitializeSkittersUI_HBox1.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbreinitSkitterQuestion.y = param1;
         },"lbreinitSkitterQuestion.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbreinitSkitterWarn.y = param1;
         },"lbreinitSkitterWarn.y");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbreinitSkitter.y = param1;
         },"lbreinitSkitter.y");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkittersUI_HBox2.y = param1;
         },"_ReinitializeSkittersUI_HBox2.y");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReallyReinitSkitterWarnTitle.y = param1;
         },"lbReallyReinitSkitterWarnTitle.y");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReallyReinitSkitterWarn.y = param1;
         },"lbReallyReinitSkitterWarn.y");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReallyreinitSkitter.y = param1;
         },"lbReallyreinitSkitter.y");
         result[9] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkittersUI_HBox3.y = param1;
         },"_ReinitializeSkittersUI_HBox3.y");
         result[10] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbSynchronizationInProgress.y = param1;
         },"lbSynchronizationInProgress.y");
         result[11] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbSynchronizationInProgressWarn.y = param1;
         },"lbSynchronizationInProgressWarn.y");
         result[12] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[13] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            imageReinitSkitterSuccess.y = param1;
         },"imageReinitSkitterSuccess.y");
         result[14] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbreinitSkitterSuccess.y = param1;
         },"lbreinitSkitterSuccess.y");
         result[15] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkittersUI_HBox4.y = param1;
         },"_ReinitializeSkittersUI_HBox4.y");
         result[16] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            imageReinitSkitterFailed.y = param1;
         },"imageReinitSkitterFailed.y");
         result[17] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbreinitSkitterFailed.y = param1;
         },"lbreinitSkitterFailed.y");
         result[18] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReinitializeSkittersUI_HBox5.y = param1;
         },"_ReinitializeSkittersUI_HBox5.y");
         result[19] = binding;
         return result;
      }
      
      public function set lbreinitSkitterFailed(param1:Text) : void
      {
         var _loc2_:Object = this._622106782lbreinitSkitterFailed;
         if(_loc2_ !== param1)
         {
            this._622106782lbreinitSkitterFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterFailed",_loc2_,param1));
         }
      }
      
      public function get skittersIncompatible() : Array
      {
         return this._skittersIncompatible;
      }
      
      public function set btnStartReallyreinitSkitter(param1:Button) : void
      {
         var _loc2_:Object = this._1374176618btnStartReallyreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._1374176618btnStartReallyreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartReallyreinitSkitter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartreinitSkitter() : Button
      {
         return this._1375113941btnStartreinitSkitter;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReallyreinitSkitter() : Button
      {
         return this._2121275686btnCancelReallyreinitSkitter;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterVersionPb() : Canvas
      {
         return this._1047265588skitterVersionPb;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyReinitSkitterWarn() : Text
      {
         return this._976934624lbReallyReinitSkitterWarn;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelreinitSkitterFailed() : Button
      {
         return this._2138276066btnCancelreinitSkitterFailed;
      }
      
      protected function btnRestartreinitSkitterFailedClickHandler(param1:MouseEvent) : void
      {
         this.resetCurrentSkitter();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterWarn() : Text
      {
         return this._343993067lbreinitSkitterWarn;
      }
      
      public function __btnCancelreinitSkitter_click(param1:MouseEvent) : void
      {
         this.btnCancelreinitSkitterClickHandler(param1);
      }
      
      public function get skitterListToSynchronise() : Array
      {
         return this._skitterListToSynchronise;
      }
      
      public function set lbreinitSkitterSuccessTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1728864390lbreinitSkitterSuccessTitle;
         if(_loc2_ !== param1)
         {
            this._1728864390lbreinitSkitterSuccessTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterSuccessTitle",_loc2_,param1));
         }
      }
      
      private function btnOKSkitterVersionPbClickHandler(param1:MouseEvent) : void
      {
         this.vsreinitSkitterUI.selectedChild = this.reinitSkitter;
         this.spinner.stop();
         this.refreshPopup();
      }
      
      public function set reinitSkitter(param1:Canvas) : void
      {
         var _loc2_:Object = this._236899451reinitSkitter;
         if(_loc2_ !== param1)
         {
            this._236899451reinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitSkitter",_loc2_,param1));
         }
      }
      
      public function set lbreinitSkitterSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._1408946558lbreinitSkitterSuccess;
         if(_loc2_ !== param1)
         {
            this._1408946558lbreinitSkitterSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageReinitSkitterSuccess() : Image
      {
         return this._2043495165imageReinitSkitterSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitSkitterSuccess() : Canvas
      {
         return this._1056826616reinitSkitterSuccess;
      }
      
      private function init() : void
      {
         this.goToreinitSkitter();
      }
      
      private function goToreinitSkitterSuccess() : void
      {
         this.vsreinitSkitterUI.selectedChild = this.reinitSkitterSuccess;
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setSuccessIconPosition);
      }
      
      public function set btnStartReinitSkitterSuccess(param1:Button) : void
      {
         var _loc2_:Object = this._2031186034btnStartReinitSkitterSuccess;
         if(_loc2_ !== param1)
         {
            this._2031186034btnStartReinitSkitterSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartReinitSkitterSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyreinitSkitterTitle() : Text
      {
         return this._1623872226lbReallyreinitSkitterTitle;
      }
      
      public function set lbreinitSkitterTitle(param1:Text) : void
      {
         var _loc2_:Object = this._2071320211lbreinitSkitterTitle;
         if(_loc2_ !== param1)
         {
            this._2071320211lbreinitSkitterTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterTitle",_loc2_,param1));
         }
      }
      
      protected function btnStartReallyreinitSkitterClickHandler(param1:MouseEvent) : void
      {
         this.resetCurrentSkitter();
      }
      
      override protected function initLabels() : void
      {
         switch(this.vsreinitSkitterUI.selectedChild.id)
         {
            case "skitterVersionPb":
               if(this.lbSkitterVersionPb != null)
               {
                  this.lbSkitterVersionPb.htmlText = resourceManager.getString("installation","MSG_SKITTER_KEY_INCOMPATIBLE");
               }
               if(this.btnOKSkitterVersionPb != null)
               {
                  this.btnOKSkitterVersionPb.label = resourceManager.getString("common","BTN_YES");
               }
               if(this.btnNOSkitterVersionPb != null)
               {
                  this.btnNOSkitterVersionPb.label = resourceManager.getString("common","BTN_NO");
               }
               break;
            case "reinitSkitter":
               this.lbreinitSkitterTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_TITLE",[this.skitterName]);
               this.lbreinitSkitterQuestion.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER2");
               this.lbreinitSkitterWarn.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_WARN");
               this.lbreinitSkitter.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER");
               this.btnStartreinitSkitter.label = resourceManager.getString("common","BTN_REINIT");
               this.btnCancelreinitSkitter.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "reallyreinitSkitter":
               this.lbReallyreinitSkitterTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_TITLE",[this.skitterName]);
               this.lbReallyReinitSkitterWarnTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_WARN");
               this.lbReallyReinitSkitterWarn.htmlText = resourceManager.getString("system","MSG_REALLY_REINIT_LAST_SKITTER_WARN");
               this.lbReallyreinitSkitter.htmlText = resourceManager.getString("system","MSG_REALLY_REINIT_SKITTER");
               this.btnStartReallyreinitSkitter.label = resourceManager.getString("common","BTN_YES");
               this.btnCancelReallyreinitSkitter.label = resourceManager.getString("common","BTN_NO");
               break;
            case "reinitSkitterInProgress":
               this.lbSynchronizationInProgressTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_TITLE",[this.skitterName]);
               this.lbSynchronizationInProgress.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_IN_PROGRESS");
               this.lbSynchronizationInProgressWarn.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_IN_PROGRESS_WARN");
               break;
            case "reinitSkitterSuccess":
               this.lbreinitSkitterSuccessTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_TITLE",[this.skitterName]);
               this.lbreinitSkitterSuccess.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_SUCCESS");
               this.btnStartReinitSkitterSuccess.label = resourceManager.getString("common","BTN_OK");
               break;
            case "reinitSkitterFailed":
               this.lbreinitSkitterFailedTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_TITLE",[this.skitterName]);
               this.lbreinitSkitterFailed.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_FAILED");
               this.btnRestartreinitSkitterFailed.label = resourceManager.getString("common","BTN_RETRY");
               this.btnCancelreinitSkitterFailed.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      public function set reinitSkitterFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._563100520reinitSkitterFailed;
         if(_loc2_ !== param1)
         {
            this._563100520reinitSkitterFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reinitSkitterFailed",_loc2_,param1));
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         KCTimeAnalyzer.Tracer("C R E A T I O N    C O M P L E T E",0);
         this.vsreinitSkitterUI.addEventListener(FlexEvent.VALUE_COMMIT,this.onVsreinitSkitterUIValueCommit);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.SKITTER_REINITIALISED,this.skitterReinitialisedHandler);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         SkitterManager.instance.skitterConnectionAllowed = false;
         this.init();
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
      public function get imageReinitSkitterFailed() : Image
      {
         return this._1980401859imageReinitSkitterFailed;
      }
      
      private function resetCurrentSkitter() : void
      {
         ServerCommunicationManager.instance.resetSkitter(this.currentResettedSkitter);
         this.vsreinitSkitterUI.selectedChild = this.reinitSkitterInProgress;
         this.spinner.play();
         this.refreshPopup();
      }
      
      public function set btnRestartreinitSkitterFailed(param1:Button) : void
      {
         var _loc2_:Object = this._1970825819btnRestartreinitSkitterFailed;
         if(_loc2_ !== param1)
         {
            this._1970825819btnRestartreinitSkitterFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRestartreinitSkitterFailed",_loc2_,param1));
         }
      }
      
      private function btnNOSkitterVersionPbClickHandler(param1:MouseEvent) : void
      {
         this.manageClose();
      }
      
      [Bindable(event="propertyChange")]
      public function get reinitSkitterInProgress() : Canvas
      {
         return this._1870252365reinitSkitterInProgress;
      }
      
      protected function btnStartReinitSkitterSuccessClickHandler(param1:MouseEvent) : void
      {
         this.manageClose();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyReinitSkitterWarnTitle() : Text
      {
         return this._903239848lbReallyReinitSkitterWarnTitle;
      }
      
      public function set reallyreinitSkitter(param1:Canvas) : void
      {
         var _loc2_:Object = this._1780981072reallyreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._1780981072reallyreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reallyreinitSkitter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterFailed() : Text
      {
         return this._622106782lbreinitSkitterFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartReallyreinitSkitter() : Button
      {
         return this._1374176618btnStartReallyreinitSkitter;
      }
      
      public function __btnStartReinitSkitterSuccess_click(param1:MouseEvent) : void
      {
         this.btnStartReinitSkitterSuccessClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterSuccess() : Text
      {
         return this._1408946558lbreinitSkitterSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterSuccessTitle() : Text
      {
         return this._1728864390lbreinitSkitterSuccessTitle;
      }
      
      public function set lbSynchronizationInProgressWarn(param1:Text) : void
      {
         var _loc2_:Object = this._1342082878lbSynchronizationInProgressWarn;
         if(_loc2_ !== param1)
         {
            this._1342082878lbSynchronizationInProgressWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSynchronizationInProgressWarn",_loc2_,param1));
         }
      }
      
      protected function btnCancelreinitSkitterClickHandler(param1:MouseEvent) : void
      {
         this.manageClose();
      }
      
      public function set lbreinitSkitter(param1:Text) : void
      {
         var _loc2_:Object = this._1838599877lbreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._1838599877lbreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitter",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartReinitSkitterSuccess() : Button
      {
         return this._2031186034btnStartReinitSkitterSuccess;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ReinitializeSkittersUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ReinitializeSkittersUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_ReinitializeSkittersUIWatcherSetupUtil");
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
      
      private function manageClose() : void
      {
         if(this.skittersIncompatible != null && this.skittersIncompatible.length > 0)
         {
            this.currentResettedSkitter = this.skittersIncompatible.pop();
            this.init();
         }
         else if(this.skitterListToSynchronise != null && this.skitterListToSynchronise.length > 0)
         {
            if(this.skitterListToSynchronise.length == 1)
            {
               DialogsManager.showSkitterSynchronise(this.skitterListToSynchronise.pop());
            }
            else if(this.skitterListToSynchronise.length > 1)
            {
               DialogsManager.showSkitterSynchronise(this.skitterListToSynchronise.pop(),this.skitterListToSynchronise);
            }
         }
         else if(this.skitterListToReinitialise != null && this.skitterListToReinitialise.length > 0)
         {
            if(this.skitterListToReinitialise.length == 1)
            {
               ServerCommunicationManager.instance.updateSkitEasyWithSkitterList(this.skitterListToReinitialise.pop());
            }
            else if(this.skitterListToReinitialise.length > 1)
            {
               ServerCommunicationManager.instance.updateSkitEasyWithSkitterList(this.skitterListToReinitialise.pop(),this.skitterListToReinitialise);
            }
         }
         else
         {
            this.closeHandler();
            SkitterManager.instance.skitterConnectionAllowed = true;
            SkitterManager.instance.connectionProcessing();
            ServerCommunicationManager.instance.startConnectedDevicesListen();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSynchronizationInProgressTitle() : Text
      {
         return this._1342573468lbSynchronizationInProgressTitle;
      }
      
      public function set lbreinitSkitterQuestion(param1:Text) : void
      {
         var _loc2_:Object = this._1609488843lbreinitSkitterQuestion;
         if(_loc2_ !== param1)
         {
            this._1609488843lbreinitSkitterQuestion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterQuestion",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReallyreinitSkitter() : Text
      {
         return this._586691238lbReallyreinitSkitter;
      }
      
      protected function setFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbreinitSkitterFailed.validateNow();
         _loc1_ = this.lbreinitSkitterFailed.getLineMetrics(0);
         this.imageReinitSkitterFailed.x = _loc1_.x - this.imageReinitSkitterFailed.width - 5;
      }
      
      public function set skittersIncompatible(param1:Array) : void
      {
         this._skittersIncompatible = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRestartreinitSkitterFailed() : Button
      {
         return this._1970825819btnRestartreinitSkitterFailed;
      }
      
      public function set skitterVersionPb(param1:Canvas) : void
      {
         var _loc2_:Object = this._1047265588skitterVersionPb;
         if(_loc2_ !== param1)
         {
            this._1047265588skitterVersionPb = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterVersionPb",_loc2_,param1));
         }
      }
      
      public function set btnStartreinitSkitter(param1:Button) : void
      {
         var _loc2_:Object = this._1375113941btnStartreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._1375113941btnStartreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartreinitSkitter",_loc2_,param1));
         }
      }
      
      public function set btnCancelReallyreinitSkitter(param1:Button) : void
      {
         var _loc2_:Object = this._2121275686btnCancelReallyreinitSkitter;
         if(_loc2_ !== param1)
         {
            this._2121275686btnCancelReallyreinitSkitter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReallyreinitSkitter",_loc2_,param1));
         }
      }
      
      public function __btnStartreinitSkitter_click(param1:MouseEvent) : void
      {
         this.btnStartreinitSkitterClickHandler(param1);
      }
      
      public function set lbReallyReinitSkitterWarn(param1:Text) : void
      {
         var _loc2_:Object = this._976934624lbReallyReinitSkitterWarn;
         if(_loc2_ !== param1)
         {
            this._976934624lbReallyReinitSkitterWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReallyReinitSkitterWarn",_loc2_,param1));
         }
      }
      
      public function set skitterListToReinitialise(param1:Array) : void
      {
         this._skitterListToReinitialise = param1;
      }
      
      public function __btnCancelReallyreinitSkitter_click(param1:MouseEvent) : void
      {
         this.btnCancelReallyreinitSkitterClickHandler(param1);
      }
      
      public function set btnCancelreinitSkitterFailed(param1:Button) : void
      {
         var _loc2_:Object = this._2138276066btnCancelreinitSkitterFailed;
         if(_loc2_ !== param1)
         {
            this._2138276066btnCancelreinitSkitterFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelreinitSkitterFailed",_loc2_,param1));
         }
      }
      
      public function __btnCancelreinitSkitterFailed_click(param1:MouseEvent) : void
      {
         this.btnCancelreinitSkitterFailedClickHandler(param1);
      }
      
      public function __btnOKSkitterVersionPb_click(param1:MouseEvent) : void
      {
         this.btnOKSkitterVersionPbClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbreinitSkitterQuestion() : Text
      {
         return this._1609488843lbreinitSkitterQuestion;
      }
      
      public function set lbreinitSkitterWarn(param1:Text) : void
      {
         var _loc2_:Object = this._343993067lbreinitSkitterWarn;
         if(_loc2_ !== param1)
         {
            this._343993067lbreinitSkitterWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbreinitSkitterWarn",_loc2_,param1));
         }
      }
      
      public function set skitterListToSynchronise(param1:Array) : void
      {
         this._skitterListToSynchronise = param1;
      }
      
      private function goToreinitSkitter() : void
      {
         if(this.skittersIncompatible != null && this.skittersIncompatible.length >= 0)
         {
            this.vsreinitSkitterUI.selectedChild = this.skitterVersionPb;
         }
         else
         {
            this.vsreinitSkitterUI.selectedChild = this.reinitSkitter;
         }
         this.spinner.stop();
         this.refreshPopup();
      }
      
      public function get skitterListToReinitialise() : Array
      {
         return this._skitterListToReinitialise;
      }
      
      public function set vsreinitSkitterUI(param1:ViewStack) : void
      {
         var _loc2_:Object = this._2072992782vsreinitSkitterUI;
         if(_loc2_ !== param1)
         {
            this._2072992782vsreinitSkitterUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsreinitSkitterUI",_loc2_,param1));
         }
      }
      
      private function _ReinitializeSkittersUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.lbSkitterVersionPb.y + this.lbSkitterVersionPb.height + 30;
         _loc1_ = this.lbreinitSkitterTitle.y + this.lbreinitSkitterTitle.height;
         _loc1_ = this.lbreinitSkitterQuestion.y + this.lbreinitSkitterQuestion.height + 20;
         _loc1_ = this.lbreinitSkitterWarn.y + this.lbreinitSkitterWarn.height;
         _loc1_ = this.lbreinitSkitter.y + this.lbreinitSkitter.height + 30;
         _loc1_ = this.lbReallyreinitSkitterTitle.y + this.lbReallyreinitSkitterTitle.height + 20;
         _loc1_ = this.lbReallyReinitSkitterWarnTitle.y + this.lbReallyReinitSkitterWarnTitle.height + 20;
         _loc1_ = this.lbReallyReinitSkitterWarn.y + this.lbReallyReinitSkitterWarn.height + 20;
         _loc1_ = this.lbReallyreinitSkitter.y + this.lbReallyreinitSkitter.height + 30;
         _loc1_ = this.lbSynchronizationInProgressTitle.y + this.lbSynchronizationInProgressTitle.height + 20;
         _loc1_ = this.lbSynchronizationInProgress.y + this.lbSynchronizationInProgress.height + 20;
         _loc1_ = this.lbSynchronizationInProgressWarn.y + this.lbSynchronizationInProgressWarn.height + 20;
         _loc1_ = this.lbreinitSkitterSuccessTitle.y + this.lbreinitSkitterSuccessTitle.height + 20;
         _loc1_ = this.lbreinitSkitterSuccessTitle.y + this.lbreinitSkitterSuccessTitle.height + 17;
         _loc1_ = this.lbreinitSkitterSuccess.y + this.lbreinitSkitterSuccess.height + 30;
         _loc1_ = this.lbreinitSkitterFailedTitle.y + this.lbreinitSkitterFailedTitle.height + 20;
         _loc1_ = this.lbreinitSkitterFailedTitle.y + this.lbreinitSkitterFailedTitle.height + 17;
         _loc1_ = this.lbreinitSkitterFailed.y + this.lbreinitSkitterFailed.height + 30;
      }
      
      protected function btnCancelReinitSkitterSuccessClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function __btnNOSkitterVersionPb_click(param1:MouseEvent) : void
      {
         this.btnNOSkitterVersionPbClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get vsreinitSkitterUI() : ViewStack
      {
         return this._2072992782vsreinitSkitterUI;
      }
   }
}
