package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.events.UpgradeEvent;
   import com.scenarioLauncher.managers.UpdaterManager;
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
   import ioService.datamodel.Skitter;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.ProgressBar;
   import mx.controls.Text;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class UpdateUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1901467015skitEasyCancelUpdateRequiredButton:Button;
      
      private var _1561040171skitEasyUpdateSuccess:Canvas;
      
      private var _35573670skitEasyUpdateMessageText:Text;
      
      private var _isSkitEasyUpdateRequired:Boolean = false;
      
      private var _embed_mxml__272063275:Class;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _2082994118imageSkitEasyUpdateSuccess:Image;
      
      private var _1051146782btnSkitterUpdateFailedCancel:Button;
      
      private var _88964651skitEasyValidateUpdateRequiredButton:Button;
      
      private var _skitter:Skitter;
      
      private var _isSkitEasyUpdateSuccess:Boolean = false;
      
      private var _419873453skitterCancelUpdateButton:Button;
      
      private var _1134182037VSSkitEasyUpdate:ViewStack;
      
      private var _isSkitEasyUpdateFailed:Boolean = false;
      
      private var _isSkitterUpgrade:Boolean = false;
      
      private var _1878337063skitterUpdate:Canvas;
      
      private var _163723477skitEasyUpdateFailed:Canvas;
      
      public var _UpdateUI_HBox1:HBox;
      
      public var _UpdateUI_HBox2:HBox;
      
      public var _UpdateUI_HBox3:HBox;
      
      public var _UpdateUI_HBox4:HBox;
      
      public var _UpdateUI_HBox5:HBox;
      
      private var _2060488186skitEasyCancelUpdateButton:Button;
      
      private var _1686083113imageSkitterUpdateSuccess:Image;
      
      private var _1217716201imageSkitterUpdateFailed:Image;
      
      private var _embed_mxml__928423959:Class;
      
      private var _465659922lbSkitterUpdateFailed:Text;
      
      private var _604777729lbSkitEasyUpdateSuccess:Text;
      
      private var _2040195192skitEasyUpdateProgressBar:ProgressBar;
      
      private var _1503499777skitterUpdateProgressBar:ProgressBar;
      
      private var _skitEasyValidateUpdateFunction:Function;
      
      private var _1347865338imageskitEasyUpdateFailed:Image;
      
      private var _699414564skitterUpdateSuccess:Canvas;
      
      private var _1201946966skitEasyValidateUpdateButton:Button;
      
      private var _786845997skitterUpdateMessageText:Text;
      
      private var _1713576445SkitEasyUpdateSuccessOkButton:Button;
      
      private var _1966146587skitterUpdateInProgressMessageText:Text;
      
      private var _2970121skitEasyUpdateTitleText:Text;
      
      private var _1986200583skitterUpdateInProgress:Canvas;
      
      private var _1274317990btnSkitterUpdateSuccessOkButton:Button;
      
      private var _1654009991skitEasyUpdateRequiredMessageText:Text;
      
      private var _1281261167skitterValidateUpdateButton:Button;
      
      mx_internal var _watchers:Array;
      
      private var _1795444287lbSkitEasyUpdateFailed:Text;
      
      private var _506944269skitEasyUpdateRequired:Canvas;
      
      private var _skittersToUpgrade:Array;
      
      private var _1363901120skitterUpdateInProgressMessageTextWarm:Text;
      
      private var _1612141428skitterUpdateImage:Image;
      
      private var _1959592384btnSkitterUpdateFailedRetry:Button;
      
      private var _1659949756skitterUpdateFailed:Canvas;
      
      private var _344869472skitEasyUpdateInProgress:Canvas;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1963831922lbSkitterUpdateSuccess:Text;
      
      private var _1200443583btnSkitEasyUpdateFailedRetry:Button;
      
      private var _1007629569btnSkitEasyUpdateFailedCancel:Button;
      
      private var _embed_mxml__801521088:Class;
      
      private var _1837334700skitEasyUpdateInProgressMessageText:Text;
      
      private var _390616883skiteasyUpdateImage:Image;
      
      private var _embed_mxml__404004828:Class;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _251328846skitEasyUpdate:Canvas;
      
      public function UpdateUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":528,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Image,
                     "id":"skiteasyUpdateImage",
                     "stylesFactory":function():void
                     {
                        this.horizontalCenter = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "source":_embed_mxml__272063275,
                           "y":23
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Image,
                     "id":"skitterUpdateImage",
                     "stylesFactory":function():void
                     {
                        this.horizontalCenter = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "source":_embed_mxml__404004828,
                           "y":23,
                           "includeInLayout":false,
                           "visible":false
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Text,
                     "id":"skitEasyUpdateTitleText",
                     "stylesFactory":function():void
                     {
                        this.horizontalCenter = "0";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "selectable":false,
                           "name":"skitEasyUpdateTitleText",
                           "styleName":"VR24BC",
                           "percentWidth":100,
                           "y":4
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"VSSkitEasyUpdate",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "creationPolicy":"all",
                           "percentWidth":100,
                           "resizeToContent":true,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"skitEasyUpdate",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"skitEasyUpdateMessageText",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"skitEasyUpdateMessageText",
                                             "styleName":"VR18BC",
                                             "percentWidth":100,
                                             "y":2
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_UpdateUI_HBox1",
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
                                                "id":"skitEasyValidateUpdateButton",
                                                "events":{"click":"__skitEasyValidateUpdateButton_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"skitEasyValidateUpdateButton",
                                                      "styleName":"btnValidate",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "minWidth":124
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"skitEasyCancelUpdateButton",
                                                "events":{"click":"__skitEasyCancelUpdateButton_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"skitEasyCancelUpdateButton",
                                                      "styleName":"btnCancel",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "minWidth":124
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
                              "id":"skitEasyUpdateInProgress",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"skitEasyUpdateInProgressMessageText",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"skitEasyUpdateInProgressMessageText",
                                             "styleName":"VR18BC",
                                             "percentWidth":100,
                                             "y":2
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":ProgressBar,
                                       "id":"skitEasyUpdateProgressBar",
                                       "stylesFactory":function():void
                                       {
                                          this.trackHeight = 7;
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"skitEasyUpdateProgressBar",
                                             "mode":"manual",
                                             "percentWidth":46,
                                             "height":28,
                                             "styleName":"manualProgressBar",
                                             "label":""
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"skitEasyUpdateSuccess",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbSkitEasyUpdateSuccess",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbSkitEasyUpdateSuccess",
                                             "percentWidth":100,
                                             "styleName":"VR18BCL1"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"imageSkitEasyUpdateSuccess",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "source":_embed_mxml__928423959,
                                             "x":15,
                                             "y":3
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"SkitEasyUpdateSuccessOkButton",
                                       "events":{"click":"__SkitEasyUpdateSuccessOkButton_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"SkitEasyUpdateSuccessOkButton",
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
                              "id":"skitEasyUpdateFailed",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbSkitEasyUpdateFailed",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbSkitEasyUpdateFailed",
                                             "percentWidth":100,
                                             "styleName":"VR18BCL0"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"imageskitEasyUpdateFailed",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "source":_embed_mxml__801521088,
                                             "x":30,
                                             "y":3,
                                             "width":21,
                                             "height":21
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_UpdateUI_HBox2",
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
                                                "id":"btnSkitEasyUpdateFailedRetry",
                                                "events":{"click":"__btnSkitEasyUpdateFailedRetry_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnSkitEasyUpdateFailedRetry",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "styleName":"btnValidate",
                                                      "minWidth":113,
                                                      "height":24
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnSkitEasyUpdateFailedCancel",
                                                "events":{"click":"__btnSkitEasyUpdateFailedCancel_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnSkitEasyUpdateFailedRetry",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "styleName":"btnCancel",
                                                      "width":113,
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
                              "id":"skitEasyUpdateRequired",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"skitEasyUpdateRequiredMessageText",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"skitEasyUpdateRequiredMessageText",
                                             "styleName":"VR18BC",
                                             "percentWidth":100,
                                             "y":2
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_UpdateUI_HBox3",
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
                                                "id":"skitEasyValidateUpdateRequiredButton",
                                                "events":{"click":"__skitEasyValidateUpdateRequiredButton_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"skitEasyValidateUpdateRequiredButton",
                                                      "styleName":"btnValidate",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "minWidth":124
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"skitEasyCancelUpdateRequiredButton",
                                                "events":{"click":"__skitEasyCancelUpdateRequiredButton_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"skitEasyCancelUpdateRequiredButton",
                                                      "styleName":"btnCancel",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "minWidth":124
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
                              "id":"skitterUpdate",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"skitterUpdateMessageText",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"skitterUpdateMessageText",
                                             "styleName":"VR18BC",
                                             "percentWidth":100,
                                             "y":2
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_UpdateUI_HBox4",
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
                                                "id":"skitterValidateUpdateButton",
                                                "events":{"click":"__skitterValidateUpdateButton_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"skitterValidateUpdateButton",
                                                      "styleName":"btnValidate",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "minWidth":124
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"skitterCancelUpdateButton",
                                                "events":{"click":"__skitterCancelUpdateButton_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"skitterCancelUpdateButton",
                                                      "styleName":"btnCancel",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "minWidth":124
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
                              "id":"skitterUpdateInProgress",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"skitterUpdateInProgressMessageText",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"skitterUpdateInProgressMessageText",
                                             "styleName":"VR18BC",
                                             "percentWidth":100,
                                             "y":2
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"skitterUpdateInProgressMessageTextWarm",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"skitterUpdateInProgressMessageTextWarm",
                                             "styleName":"VR18RC",
                                             "percentWidth":100
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":ProgressBar,
                                       "id":"skitterUpdateProgressBar",
                                       "stylesFactory":function():void
                                       {
                                          this.trackHeight = 7;
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"skitterUpdateProgressBar",
                                             "mode":"manual",
                                             "percentWidth":46,
                                             "height":28,
                                             "styleName":"manualProgressBar",
                                             "label":""
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"skitterUpdateSuccess",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbSkitterUpdateSuccess",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbSkitterUpdateSuccess",
                                             "percentWidth":100,
                                             "styleName":"VR18BCL1"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"imageSkitterUpdateSuccess",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "source":_embed_mxml__928423959,
                                             "x":15,
                                             "y":3
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnSkitterUpdateSuccessOkButton",
                                       "events":{"click":"__btnSkitterUpdateSuccessOkButton_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"SkitterUpdateSuccessOkButton",
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
                              "id":"skitterUpdateFailed",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbSkitterUpdateFailed",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbSkitterUpdateFailed",
                                             "percentWidth":100,
                                             "styleName":"VR18BCL0"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"imageSkitterUpdateFailed",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "source":_embed_mxml__801521088,
                                             "x":30,
                                             "y":3,
                                             "width":21,
                                             "height":21
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "id":"_UpdateUI_HBox5",
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
                                                "id":"btnSkitterUpdateFailedRetry",
                                                "events":{"click":"__btnSkitterUpdateFailedRetry_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnSkitterUpdateFailedRetry",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "styleName":"btnValidate",
                                                      "minWidth":113,
                                                      "height":24
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnSkitterUpdateFailedCancel",
                                                "events":{"click":"__btnSkitterUpdateFailedCancel_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnSkitterUpdateFailedRetry",
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
         });
         this._embed_mxml__272063275 = UpdateUI__embed_mxml__272063275;
         this._embed_mxml__404004828 = UpdateUI__embed_mxml__404004828;
         this._embed_mxml__801521088 = UpdateUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = UpdateUI__embed_mxml__928423959;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 528;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         UpdateUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageSkitterUpdateFailed() : Image
      {
         return this._1217716201imageSkitterUpdateFailed;
      }
      
      private function gotoSkitterUpgradeSuccess() : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitterUpdateSuccess;
         invalidateDisplayList();
         this.refreshPopup();
         this.setSkitterUpgradeSuccessIconPosition();
      }
      
      [Bindable(event="propertyChange")]
      public function get SkitEasyUpdateSuccessOkButton() : Button
      {
         return this._1713576445SkitEasyUpdateSuccessOkButton;
      }
      
      public function set lbSkitEasyUpdateSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._604777729lbSkitEasyUpdateSuccess;
         if(_loc2_ !== param1)
         {
            this._604777729lbSkitEasyUpdateSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSkitEasyUpdateSuccess",_loc2_,param1));
         }
      }
      
      public function set SkitEasyUpdateSuccessOkButton(param1:Button) : void
      {
         var _loc2_:Object = this._1713576445SkitEasyUpdateSuccessOkButton;
         if(_loc2_ !== param1)
         {
            this._1713576445SkitEasyUpdateSuccessOkButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"SkitEasyUpdateSuccessOkButton",_loc2_,param1));
         }
      }
      
      public function set btnSkitEasyUpdateFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = this._1007629569btnSkitEasyUpdateFailedCancel;
         if(_loc2_ !== param1)
         {
            this._1007629569btnSkitEasyUpdateFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSkitEasyUpdateFailedCancel",_loc2_,param1));
         }
      }
      
      public function set imageskitEasyUpdateFailed(param1:Image) : void
      {
         var _loc2_:Object = this._1347865338imageskitEasyUpdateFailed;
         if(_loc2_ !== param1)
         {
            this._1347865338imageskitEasyUpdateFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageskitEasyUpdateFailed",_loc2_,param1));
         }
      }
      
      public function set skitterUpdateProgressBar(param1:ProgressBar) : void
      {
         var _loc2_:Object = this._1503499777skitterUpdateProgressBar;
         if(_loc2_ !== param1)
         {
            this._1503499777skitterUpdateProgressBar = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateProgressBar",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateProgressBar() : ProgressBar
      {
         return this._1503499777skitterUpdateProgressBar;
      }
      
      protected function setSkitEasyUpdateFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbSkitEasyUpdateFailed.validateNow();
         _loc1_ = this.lbSkitEasyUpdateFailed.getLineMetrics(0);
         this.imageskitEasyUpdateFailed.x = _loc1_.x - this.imageskitEasyUpdateFailed.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyCancelUpdateButton() : Button
      {
         return this._2060488186skitEasyCancelUpdateButton;
      }
      
      private function gotoSkitterUpgradeInProgress() : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitterUpdateInProgress;
         invalidateDisplayList();
         this.refreshPopup();
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateTitleText() : Text
      {
         return this._2970121skitEasyUpdateTitleText;
      }
      
      public function set skitEasyUpdateRequired(param1:Canvas) : void
      {
         var _loc2_:Object = this._506944269skitEasyUpdateRequired;
         if(_loc2_ !== param1)
         {
            this._506944269skitEasyUpdateRequired = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateRequired",_loc2_,param1));
         }
      }
      
      public function set skitEasyUpdateTitleText(param1:Text) : void
      {
         var _loc2_:Object = this._2970121skitEasyUpdateTitleText;
         if(_loc2_ !== param1)
         {
            this._2970121skitEasyUpdateTitleText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateTitleText",_loc2_,param1));
         }
      }
      
      public function __skitEasyCancelUpdateRequiredButton_click(param1:MouseEvent) : void
      {
         this.skitEasyCancelUpdateRequiredButtonClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateInProgressMessageText() : Text
      {
         return this._1966146587skitterUpdateInProgressMessageText;
      }
      
      public function get skittersToUpgrade() : Array
      {
         return this._skittersToUpgrade;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdate() : Canvas
      {
         return this._1878337063skitterUpdate;
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         super.closeHandler(param1);
         ServerCommunicationManager.instance.currentSkitterInUpgradeProgress = null;
         SkitterManager.instance.skitterConnectionAllowed = true;
         if(SkitterManager.instance.skitterList.length == 0)
         {
            Globals.SYNCHRO_LOCKED = false;
            InstallationService.instance.updateDataModel(this.skitter);
         }
         else
         {
            SkitterManager.instance.connectionProcessing();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageSkitEasyUpdateSuccess() : Image
      {
         return this._2082994118imageSkitEasyUpdateSuccess;
      }
      
      private function _UpdateUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdate.verticalScrollPolicy = param1;
         },"skitEasyUpdate.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdate.horizontalScrollPolicy = param1;
         },"skitEasyUpdate.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _UpdateUI_HBox1.y = param1;
         },"_UpdateUI_HBox1.y");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateInProgress.verticalScrollPolicy = param1;
         },"skitEasyUpdateInProgress.verticalScrollPolicy");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateInProgress.horizontalScrollPolicy = param1;
         },"skitEasyUpdateInProgress.horizontalScrollPolicy");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            skitEasyUpdateProgressBar.y = param1;
         },"skitEasyUpdateProgressBar.y");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateSuccess.verticalScrollPolicy = param1;
         },"skitEasyUpdateSuccess.verticalScrollPolicy");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateSuccess.horizontalScrollPolicy = param1;
         },"skitEasyUpdateSuccess.horizontalScrollPolicy");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            SkitEasyUpdateSuccessOkButton.y = param1;
         },"SkitEasyUpdateSuccessOkButton.y");
         result[8] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateFailed.verticalScrollPolicy = param1;
         },"skitEasyUpdateFailed.verticalScrollPolicy");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateFailed.horizontalScrollPolicy = param1;
         },"skitEasyUpdateFailed.horizontalScrollPolicy");
         result[10] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _UpdateUI_HBox2.y = param1;
         },"_UpdateUI_HBox2.y");
         result[11] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateRequired.verticalScrollPolicy = param1;
         },"skitEasyUpdateRequired.verticalScrollPolicy");
         result[12] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitEasyUpdateRequired.horizontalScrollPolicy = param1;
         },"skitEasyUpdateRequired.horizontalScrollPolicy");
         result[13] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _UpdateUI_HBox3.y = param1;
         },"_UpdateUI_HBox3.y");
         result[14] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdate.verticalScrollPolicy = param1;
         },"skitterUpdate.verticalScrollPolicy");
         result[15] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdate.horizontalScrollPolicy = param1;
         },"skitterUpdate.horizontalScrollPolicy");
         result[16] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _UpdateUI_HBox4.y = param1;
         },"_UpdateUI_HBox4.y");
         result[17] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdateInProgress.verticalScrollPolicy = param1;
         },"skitterUpdateInProgress.verticalScrollPolicy");
         result[18] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdateInProgress.horizontalScrollPolicy = param1;
         },"skitterUpdateInProgress.horizontalScrollPolicy");
         result[19] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            skitterUpdateInProgressMessageTextWarm.y = param1;
         },"skitterUpdateInProgressMessageTextWarm.y");
         result[20] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            skitterUpdateProgressBar.y = param1;
         },"skitterUpdateProgressBar.y");
         result[21] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdateSuccess.verticalScrollPolicy = param1;
         },"skitterUpdateSuccess.verticalScrollPolicy");
         result[22] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdateSuccess.horizontalScrollPolicy = param1;
         },"skitterUpdateSuccess.horizontalScrollPolicy");
         result[23] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            btnSkitterUpdateSuccessOkButton.y = param1;
         },"btnSkitterUpdateSuccessOkButton.y");
         result[24] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdateFailed.verticalScrollPolicy = param1;
         },"skitterUpdateFailed.verticalScrollPolicy");
         result[25] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            skitterUpdateFailed.horizontalScrollPolicy = param1;
         },"skitterUpdateFailed.horizontalScrollPolicy");
         result[26] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _UpdateUI_HBox5.y = param1;
         },"_UpdateUI_HBox5.y");
         result[27] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSkitterUpdateFailedRetry() : Button
      {
         return this._1959592384btnSkitterUpdateFailedRetry;
      }
      
      protected function btnSkitEasyUpdateFailedCancelClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      protected function SkitEasyUpdateSuccessOkButtonClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function initialisation() : void
      {
         if(this._isSkitEasyUpdateFailed)
         {
            this._isSkitEasyUpdateFailed = false;
            this._isSkitEasyUpdateSuccess = false;
            this._isSkitEasyUpdateRequired = false;
            this.goToSkitEasyUpdateFailed();
         }
         else if(this._isSkitEasyUpdateSuccess)
         {
            this._isSkitEasyUpdateSuccess = false;
            this._isSkitEasyUpdateFailed = false;
            this._isSkitEasyUpdateRequired = false;
            this.goToSkitEasyUpdateSuccess();
         }
         else if(this._isSkitEasyUpdateRequired)
         {
            this._isSkitEasyUpdateRequired = false;
            this._isSkitEasyUpdateFailed = false;
            this._isSkitEasyUpdateSuccess = false;
            this.goToSkitEasyUpdateRequired();
         }
         else if(this._isSkitterUpgrade)
         {
            this._isSkitterUpgrade = false;
            this._isSkitEasyUpdateFailed = false;
            this._isSkitEasyUpdateSuccess = false;
            this._isSkitEasyUpdateRequired = false;
            this.startUpgradeList();
         }
         else
         {
            this.VSSkitEasyUpdate.selectedChild = this.skitEasyUpdate;
            this.refreshPopup();
         }
      }
      
      public function get isSkitterUpgrade() : Boolean
      {
         return this._isSkitterUpgrade;
      }
      
      public function set skitEasyUpdateFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._163723477skitEasyUpdateFailed;
         if(_loc2_ !== param1)
         {
            this._163723477skitEasyUpdateFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateFailed",_loc2_,param1));
         }
      }
      
      public function set skittersToUpgrade(param1:Array) : void
      {
         this._skittersToUpgrade = param1;
         SkitterManager.instance.skitterConnectionAllowed = false;
         if(initialized)
         {
            this.skitterUpdateProgressBar.indeterminate = false;
            this.skitterUpdateProgressBar.setProgress(0,100);
            this.initialisation();
         }
      }
      
      public function onSynchronizeSkitterAfterUpgradeFault(param1:FaultEvent) : void
      {
         this.gotoSkitterUpgradeFault();
      }
      
      public function set skitterUpdate(param1:Canvas) : void
      {
         var _loc2_:Object = this._1878337063skitterUpdate;
         if(_loc2_ !== param1)
         {
            this._1878337063skitterUpdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdate",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateInProgress() : Canvas
      {
         return this._344869472skitEasyUpdateInProgress;
      }
      
      public function set skitterUpdateMessageText(param1:Text) : void
      {
         var _loc2_:Object = this._786845997skitterUpdateMessageText;
         if(_loc2_ !== param1)
         {
            this._786845997skitterUpdateMessageText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateMessageText",_loc2_,param1));
         }
      }
      
      private function _UpdateUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.skitEasyUpdateMessageText.y + this.skitEasyUpdateMessageText.height + 43;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.skitEasyUpdateInProgressMessageText.y + this.skitEasyUpdateInProgressMessageText.height + 35;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.lbSkitEasyUpdateSuccess.y + this.lbSkitEasyUpdateSuccess.height + 41;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.lbSkitEasyUpdateFailed.y + this.lbSkitEasyUpdateFailed.height + 44;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.skitEasyUpdateRequiredMessageText.y + this.skitEasyUpdateRequiredMessageText.height + 44;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.skitterUpdateMessageText.y + this.skitterUpdateMessageText.height + 43;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.skitterUpdateInProgressMessageText.y + this.skitterUpdateInProgressMessageText.height + 24;
         _loc1_ = this.skitterUpdateInProgressMessageTextWarm.y + this.skitterUpdateInProgressMessageTextWarm.height + 30;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.lbSkitterUpdateSuccess.y + this.lbSkitterUpdateSuccess.height + 43;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.lbSkitterUpdateFailed.y + this.lbSkitterUpdateFailed.height + 44;
      }
      
      private function skitterUpgradeFaultHandler(param1:UpgradeEvent = null) : void
      {
         this.gotoSkitterUpgradeFault();
      }
      
      private function goToSkitEasyUpdateRequired() : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitEasyUpdateRequired;
         invalidateDisplayList();
         this.refreshPopup();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSkitterUpdateSuccess() : Text
      {
         return this._1963831922lbSkitterUpdateSuccess;
      }
      
      public function __SkitEasyUpdateSuccessOkButton_click(param1:MouseEvent) : void
      {
         this.SkitEasyUpdateSuccessOkButtonClickHandler(param1);
      }
      
      public function set imageSkitEasyUpdateSuccess(param1:Image) : void
      {
         var _loc2_:Object = this._2082994118imageSkitEasyUpdateSuccess;
         if(_loc2_ !== param1)
         {
            this._2082994118imageSkitEasyUpdateSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageSkitEasyUpdateSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateProgressBar() : ProgressBar
      {
         return this._2040195192skitEasyUpdateProgressBar;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyCancelUpdateRequiredButton() : Button
      {
         return this._1901467015skitEasyCancelUpdateRequiredButton;
      }
      
      public function set skitterUpdateInProgressMessageText(param1:Text) : void
      {
         var _loc2_:Object = this._1966146587skitterUpdateInProgressMessageText;
         if(_loc2_ !== param1)
         {
            this._1966146587skitterUpdateInProgressMessageText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateInProgressMessageText",_loc2_,param1));
         }
      }
      
      public function __skitEasyValidateUpdateRequiredButton_click(param1:MouseEvent) : void
      {
         this.skitEasyValidateUpdateButtonClickHandler(param1);
      }
      
      public function set btnSkitterUpdateFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = this._1959592384btnSkitterUpdateFailedRetry;
         if(_loc2_ !== param1)
         {
            this._1959592384btnSkitterUpdateFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSkitterUpdateFailedRetry",_loc2_,param1));
         }
      }
      
      protected function btnSkitEasyUpdateFailedRetryClickHandler(param1:MouseEvent) : void
      {
         UpdaterManager.instance.checkForUpdate();
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateRequiredMessageText() : Text
      {
         return this._1654009991skitEasyUpdateRequiredMessageText;
      }
      
      public function set skitterUpdateFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._1659949756skitterUpdateFailed;
         if(_loc2_ !== param1)
         {
            this._1659949756skitterUpdateFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateFailed",_loc2_,param1));
         }
      }
      
      public function set btnSkitEasyUpdateFailedRetry(param1:Button) : void
      {
         var _loc2_:Object = this._1200443583btnSkitEasyUpdateFailedRetry;
         if(_loc2_ !== param1)
         {
            this._1200443583btnSkitEasyUpdateFailedRetry = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSkitEasyUpdateFailedRetry",_loc2_,param1));
         }
      }
      
      public function set skitterUpdateInProgressMessageTextWarm(param1:Text) : void
      {
         var _loc2_:Object = this._1363901120skitterUpdateInProgressMessageTextWarm;
         if(_loc2_ !== param1)
         {
            this._1363901120skitterUpdateInProgressMessageTextWarm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateInProgressMessageTextWarm",_loc2_,param1));
         }
      }
      
      public function set isSkitterUpgrade(param1:Boolean) : void
      {
         this._isSkitterUpgrade = param1;
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      public function set skitEasyUpdate(param1:Canvas) : void
      {
         var _loc2_:Object = this._251328846skitEasyUpdate;
         if(_loc2_ !== param1)
         {
            this._251328846skitEasyUpdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdate",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSkitterUpdateSuccessOkButton() : Button
      {
         return this._1274317990btnSkitterUpdateSuccessOkButton;
      }
      
      public function set skitEasyUpdateInProgressMessageText(param1:Text) : void
      {
         var _loc2_:Object = this._1837334700skitEasyUpdateInProgressMessageText;
         if(_loc2_ !== param1)
         {
            this._1837334700skitEasyUpdateInProgressMessageText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateInProgressMessageText",_loc2_,param1));
         }
      }
      
      public function set skitterCancelUpdateButton(param1:Button) : void
      {
         var _loc2_:Object = this._419873453skitterCancelUpdateButton;
         if(_loc2_ !== param1)
         {
            this._419873453skitterCancelUpdateButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterCancelUpdateButton",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         switch(this.VSSkitEasyUpdate.selectedChild.id)
         {
            case "skitEasyUpdate":
               this.skiteasyUpdateImage.includeInLayout = true;
               this.skiteasyUpdateImage.visible = true;
               this.skitterUpdateImage.includeInLayout = false;
               this.skitterUpdateImage.visible = false;
               break;
            case "skitEasyUpdateInProgress":
               this.skiteasyUpdateImage.includeInLayout = true;
               this.skiteasyUpdateImage.visible = true;
               this.skitterUpdateImage.includeInLayout = false;
               this.skitterUpdateImage.visible = false;
               break;
            case "skitEasyUpdateSuccess":
               this.skiteasyUpdateImage.includeInLayout = true;
               this.skiteasyUpdateImage.visible = true;
               this.skitterUpdateImage.includeInLayout = false;
               this.skitterUpdateImage.visible = false;
               break;
            case "skitEasyUpdateFailed":
               this.skiteasyUpdateImage.includeInLayout = true;
               this.skiteasyUpdateImage.visible = true;
               this.skitterUpdateImage.includeInLayout = false;
               this.skitterUpdateImage.visible = false;
               break;
            case "skitEasyUpdateRequired":
               this.skiteasyUpdateImage.includeInLayout = true;
               this.skiteasyUpdateImage.visible = true;
               this.skitterUpdateImage.includeInLayout = false;
               this.skitterUpdateImage.visible = false;
               break;
            case "skitterUpdateInProgress":
               this.skiteasyUpdateImage.includeInLayout = false;
               this.skiteasyUpdateImage.visible = false;
               this.skitterUpdateImage.includeInLayout = true;
               this.skitterUpdateImage.visible = true;
               break;
            case "skitterUpdateSuccess":
               this.skiteasyUpdateImage.includeInLayout = false;
               this.skiteasyUpdateImage.visible = false;
               this.skitterUpdateImage.includeInLayout = true;
               this.skitterUpdateImage.visible = true;
               break;
            case "skitterUpdateFailed":
               this.skiteasyUpdateImage.includeInLayout = false;
               this.skiteasyUpdateImage.visible = false;
               this.skitterUpdateImage.includeInLayout = true;
               this.skitterUpdateImage.visible = true;
               break;
            case "skitterUpdate":
               this.skiteasyUpdateImage.includeInLayout = false;
               this.skiteasyUpdateImage.visible = false;
               this.skitterUpdateImage.includeInLayout = true;
               this.skitterUpdateImage.visible = true;
               break;
            default:
               this.skiteasyUpdateImage.includeInLayout = true;
               this.skiteasyUpdateImage.visible = true;
               this.skitterUpdateImage.includeInLayout = false;
               this.skitterUpdateImage.visible = false;
         }
         super.refreshUI();
      }
      
      public function set skitEasyValidateUpdateButton(param1:Button) : void
      {
         var _loc2_:Object = this._1201946966skitEasyValidateUpdateButton;
         if(_loc2_ !== param1)
         {
            this._1201946966skitEasyValidateUpdateButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyValidateUpdateButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterValidateUpdateButton() : Button
      {
         return this._1281261167skitterValidateUpdateButton;
      }
      
      private function skitterValidateUpdateButtonClickHandler(param1:MouseEvent) : void
      {
         Globals.SYNCHRO_LOCKED = true;
         this.gotoSkitterUpgradeInProgress();
         ServerCommunicationManager.instance.upgradeDevice(this.skitter);
      }
      
      public function set skitEasyUpdateInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._344869472skitEasyUpdateInProgress;
         if(_loc2_ !== param1)
         {
            this._344869472skitEasyUpdateInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateInProgress",_loc2_,param1));
         }
      }
      
      private function gotoSkitterUpgrade() : void
      {
         this.isSkitterUpgrade = true;
         this.VSSkitEasyUpdate.selectedChild = this.skitterUpdate;
         invalidateDisplayList();
         this.refreshPopup();
      }
      
      protected function setSkitterUpgradeSuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbSkitterUpdateSuccess.validateNow();
         _loc1_ = this.lbSkitterUpdateSuccess.getLineMetrics(0);
         this.imageSkitterUpdateSuccess.x = _loc1_.x - this.imageSkitterUpdateSuccess.width - 5;
      }
      
      public function __btnSkitterUpdateFailedCancel_click(param1:MouseEvent) : void
      {
         this.skitterUpgradeFailedCancelClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateSuccess() : Canvas
      {
         return this._1561040171skitEasyUpdateSuccess;
      }
      
      public function __btnSkitterUpdateSuccessOkButton_click(param1:MouseEvent) : void
      {
         this.skitterUpgradeSuccessOkButtonClickHandler(param1);
      }
      
      public function get isSkitEasyUpdateRequired() : Boolean
      {
         return this._isSkitEasyUpdateRequired;
      }
      
      [Bindable(event="propertyChange")]
      public function get skiteasyUpdateImage() : Image
      {
         return this._390616883skiteasyUpdateImage;
      }
      
      public function set VSSkitEasyUpdate(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1134182037VSSkitEasyUpdate;
         if(_loc2_ !== param1)
         {
            this._1134182037VSSkitEasyUpdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"VSSkitEasyUpdate",_loc2_,param1));
         }
      }
      
      public function __skitEasyCancelUpdateButton_click(param1:MouseEvent) : void
      {
         this.skitEasyCancelUpdateButtonClickHandler(param1);
      }
      
      public function set skitterValidateUpdateButton(param1:Button) : void
      {
         var _loc2_:Object = this._1281261167skitterValidateUpdateButton;
         if(_loc2_ !== param1)
         {
            this._1281261167skitterValidateUpdateButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterValidateUpdateButton",_loc2_,param1));
         }
      }
      
      public function set skitterUpdateImage(param1:Image) : void
      {
         var _loc2_:Object = this._1612141428skitterUpdateImage;
         if(_loc2_ !== param1)
         {
            this._1612141428skitterUpdateImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateImage",_loc2_,param1));
         }
      }
      
      public function __btnSkitterUpdateFailedRetry_click(param1:MouseEvent) : void
      {
         this.btnSkitterUpdateFailedRetryClickHandler(param1);
      }
      
      public function __btnSkitEasyUpdateFailedCancel_click(param1:MouseEvent) : void
      {
         this.btnSkitEasyUpdateFailedCancelClickHandler(param1);
      }
      
      public function set lbSkitterUpdateSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._1963831922lbSkitterUpdateSuccess;
         if(_loc2_ !== param1)
         {
            this._1963831922lbSkitterUpdateSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSkitterUpdateSuccess",_loc2_,param1));
         }
      }
      
      public function set skitEasyUpdateProgressBar(param1:ProgressBar) : void
      {
         var _loc2_:Object = this._2040195192skitEasyUpdateProgressBar;
         if(_loc2_ !== param1)
         {
            this._2040195192skitEasyUpdateProgressBar = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateProgressBar",_loc2_,param1));
         }
      }
      
      public function set isSkitEasyUpdateFailed(param1:Boolean) : void
      {
         this._isSkitEasyUpdateFailed = param1;
      }
      
      public function set skitEasyCancelUpdateRequiredButton(param1:Button) : void
      {
         var _loc2_:Object = this._1901467015skitEasyCancelUpdateRequiredButton;
         if(_loc2_ !== param1)
         {
            this._1901467015skitEasyCancelUpdateRequiredButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyCancelUpdateRequiredButton",_loc2_,param1));
         }
      }
      
      private function skitterUpgradeSuccessfullHandler(param1:UpgradeEvent) : void
      {
      }
      
      public function __btnSkitEasyUpdateFailedRetry_click(param1:MouseEvent) : void
      {
         this.btnSkitEasyUpdateFailedRetryClickHandler(param1);
      }
      
      public function get skitEasyValidateUpdateFunction() : Function
      {
         return this._skitEasyValidateUpdateFunction;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSkitEasyUpdateSuccess() : Text
      {
         return this._604777729lbSkitEasyUpdateSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSkitEasyUpdateFailedCancel() : Button
      {
         return this._1007629569btnSkitEasyUpdateFailedCancel;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageskitEasyUpdateFailed() : Image
      {
         return this._1347865338imageskitEasyUpdateFailed;
      }
      
      private function btnSkitterUpdateFailedRetryClickHandler(param1:MouseEvent) : void
      {
         this.startUpgradeRetry();
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateRequired() : Canvas
      {
         return this._506944269skitEasyUpdateRequired;
      }
      
      public function set skitEasyUpdateRequiredMessageText(param1:Text) : void
      {
         var _loc2_:Object = this._1654009991skitEasyUpdateRequiredMessageText;
         if(_loc2_ !== param1)
         {
            this._1654009991skitEasyUpdateRequiredMessageText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateRequiredMessageText",_loc2_,param1));
         }
      }
      
      private function goToSkitEasyUpdateSuccess() : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitEasyUpdateSuccess;
         invalidateDisplayList();
         this.refreshPopup();
         callLater(this.setSkitEasyUpdateSuccessIconPosition);
      }
      
      public function skitEasyUpdateProgressBarSetProgress(param1:int, param2:int) : void
      {
         this.skitEasyUpdateProgressBar.indeterminate = param1 == param2;
         this.skitEasyUpdateProgressBar.setProgress(param1,param2);
      }
      
      private function startUpgradeList() : void
      {
         if(this._skittersToUpgrade.length > 0)
         {
            SkitterManager.instance.skitterConnectionAllowed = false;
            Globals.SYNCHRO_LOCKED = true;
            this.skitter = this._skittersToUpgrade.pop();
            this.skitterUpdateProgressBar.setProgress(0,100);
            this.gotoSkitterUpgradeInProgress();
            ServerCommunicationManager.instance.upgradeDevice(this.skitter);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateFailed() : Canvas
      {
         return this._163723477skitEasyUpdateFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateMessageText() : Text
      {
         return this._786845997skitterUpdateMessageText;
      }
      
      override protected function initLabels() : void
      {
         var _loc1_:String = null;
         if(this.skitter != null && this.skitter.name != null)
         {
            _loc1_ = this.skitter.name;
         }
         else
         {
            _loc1_ = "";
         }
         switch(this.VSSkitEasyUpdate.selectedChild.id)
         {
            case "skitEasyUpdate":
               this.skitEasyUpdateMessageText.htmlText = resourceManager.getString("updaters","MSG_SKIT_EASY_UPDATE");
               this.skitEasyValidateUpdateButton.label = resourceManager.getString("common","BTN_UPDATE_NOW");
               this.skitEasyCancelUpdateButton.label = resourceManager.getString("common","BTN_UPDATE_LATER");
               break;
            case "skitEasyUpdateInProgress":
               this.skitEasyUpdateInProgressMessageText.htmlText = resourceManager.getString("updaters","MSG_SKIT_EASY_UPDATE_IN_PROGRESS");
               break;
            case "skitEasyUpdateSuccess":
               this.lbSkitEasyUpdateSuccess.htmlText = resourceManager.getString("updaters","MSG_SKIT_EASY_UPDATE_SUCCESS");
               this.SkitEasyUpdateSuccessOkButton.label = resourceManager.getString("common","BTN_OK");
               break;
            case "skitEasyUpdateFailed":
               this.lbSkitEasyUpdateFailed.htmlText = resourceManager.getString("updaters","MSG_SKIT_EASY_UPDATE_FAILED");
               this.btnSkitEasyUpdateFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               this.btnSkitEasyUpdateFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "skitEasyUpdateRequired":
               this.skitEasyUpdateTitleText.htmlText = resourceManager.getString("updaters","MSG_SKIT_EASY_UPDATE_REQUIRED_TITLE");
               this.skitEasyUpdateRequiredMessageText.htmlText = resourceManager.getString("updaters","MSG_SKIT_EASY_UPDATE_REQUIRED");
               this.skitEasyValidateUpdateRequiredButton.label = resourceManager.getString("common","BTN_UPDATE_NOW");
               this.skitEasyCancelUpdateRequiredButton.label = resourceManager.getString("common","BTN_UPDATE_LATER");
               break;
            case "skitterUpdateInProgress":
               this.skitEasyUpdateTitleText.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_TITLE",[_loc1_]);
               this.skitterUpdateInProgressMessageText.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_IN_PROGRESS",[_loc1_]);
               this.skitterUpdateInProgressMessageTextWarm.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_IN_PROGRESS_WARN");
               break;
            case "skitterUpdateSuccess":
               this.skitEasyUpdateTitleText.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_TITLE",[_loc1_]);
               this.lbSkitterUpdateSuccess.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_SUCCESS");
               this.btnSkitterUpdateSuccessOkButton.label = resourceManager.getString("common","BTN_OK");
               break;
            case "skitterUpdateFailed":
               this.skitEasyUpdateTitleText.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_TITLE",[_loc1_]);
               this.lbSkitterUpdateFailed.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_FAILED");
               this.btnSkitterUpdateFailedRetry.label = resourceManager.getString("common","BTN_RETRY");
               this.btnSkitterUpdateFailedCancel.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "skitterUpdate":
               this.skitterValidateUpdateButton.label = resourceManager.getString("common","BTN_UPDATE_NOW");
               this.skitterCancelUpdateButton.label = resourceManager.getString("common","BTN_CANCEL");
               this.skitEasyUpdateTitleText.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_TITLE",[_loc1_]);
               this.skitterUpdateMessageText.htmlText = resourceManager.getString("updaters","MSG_SKITTER_UPDATE_AVAILABLE");
         }
      }
      
      protected function skitEasyValidateUpdateButtonClickHandler(param1:MouseEvent) : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitEasyUpdateInProgress;
         this.refreshPopup();
         this._skitEasyValidateUpdateFunction();
      }
      
      protected function skitterUpgradeSuccessOkButtonClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      protected function setSkitterUpgradeFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbSkitterUpdateFailed.validateNow();
         _loc1_ = this.lbSkitterUpdateFailed.getLineMetrics(0);
         this.imageSkitterUpdateFailed.x = _loc1_.x - this.imageSkitterUpdateFailed.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateInProgressMessageTextWarm() : Text
      {
         return this._1363901120skitterUpdateInProgressMessageTextWarm;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSkitEasyUpdateFailedRetry() : Button
      {
         return this._1200443583btnSkitEasyUpdateFailedRetry;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateFailed() : Canvas
      {
         return this._1659949756skitterUpdateFailed;
      }
      
      public function set btnSkitterUpdateSuccessOkButton(param1:Button) : void
      {
         var _loc2_:Object = this._1274317990btnSkitterUpdateSuccessOkButton;
         if(_loc2_ !== param1)
         {
            this._1274317990btnSkitterUpdateSuccessOkButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSkitterUpdateSuccessOkButton",_loc2_,param1));
         }
      }
      
      public function __skitEasyValidateUpdateButton_click(param1:MouseEvent) : void
      {
         this.skitEasyValidateUpdateButtonClickHandler(param1);
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.initialisation();
         ServerCommunicationManager.instance.addEventListener(UpgradeEvent.SKITTER_UPGRADE_PROGRESS,this.skitterUpgradeProgressHandler);
         ServerCommunicationManager.instance.addEventListener(UpgradeEvent.SKITTER_UPGRADE_SUCCESSFULL,this.skitterUpgradeSuccessfullHandler);
         ServerCommunicationManager.instance.addEventListener(UpgradeEvent.SKITTER_UPGRADE_FAILDED,this.skitterUpgradeFaultHandler);
         ServerCommunicationManager.instance.addEventListener(UpgradeEvent.SKITTER_SYNCHRONISE_AFTER_UPGRADE,this.onSynchronizeSkitterAfterUpgrade);
      }
      
      public function set skitEasyUpdateMessageText(param1:Text) : void
      {
         var _loc2_:Object = this._35573670skitEasyUpdateMessageText;
         if(_loc2_ !== param1)
         {
            this._35573670skitEasyUpdateMessageText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateMessageText",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateInProgressMessageText() : Text
      {
         return this._1837334700skitEasyUpdateInProgressMessageText;
      }
      
      private function goToSkitEasyUpdateFailed() : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitEasyUpdateFailed;
         invalidateDisplayList();
         this.refreshPopup();
         callLater(this.setSkitEasyUpdateFailedIconPosition);
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterCancelUpdateButton() : Button
      {
         return this._419873453skitterCancelUpdateButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyValidateUpdateButton() : Button
      {
         return this._1201946966skitEasyValidateUpdateButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get VSSkitEasyUpdate() : ViewStack
      {
         return this._1134182037VSSkitEasyUpdate;
      }
      
      private function startUpgradeRetry() : void
      {
         SkitterManager.instance.skitterConnectionAllowed = false;
         Globals.SYNCHRO_LOCKED = true;
         this.skitterUpdateProgressBar.setProgress(0,100);
         this.gotoSkitterUpgradeInProgress();
         ServerCommunicationManager.instance.upgradeDevice(this.skitter);
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdate() : Canvas
      {
         return this._251328846skitEasyUpdate;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateImage() : Image
      {
         return this._1612141428skitterUpdateImage;
      }
      
      public function get isSkitEasyUpdateFailed() : Boolean
      {
         return this._isSkitEasyUpdateFailed;
      }
      
      public function onSynchronizeSkitterAfterUpgradeSuccess() : void
      {
         ServerCommunicationManager.instance.currentSkitterInUpgradeProgress = null;
         InstallationService.instance.refreshActivateDevice();
         InstallationService.instance.saveCurrentInstallation();
         if(this._skittersToUpgrade.length > 0)
         {
            this.startUpgradeList();
         }
         else
         {
            this.gotoSkitterUpgradeSuccess();
         }
      }
      
      public function set skitter(param1:Skitter) : void
      {
         this._skitter = param1;
      }
      
      public function set lbSkitEasyUpdateFailed(param1:Text) : void
      {
         var _loc2_:Object = this._1795444287lbSkitEasyUpdateFailed;
         if(_loc2_ !== param1)
         {
            this._1795444287lbSkitEasyUpdateFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSkitEasyUpdateFailed",_loc2_,param1));
         }
      }
      
      private function skitterCancelUpdateButtonClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function set isSkitEasyUpdateSuccess(param1:Boolean) : void
      {
         this._isSkitEasyUpdateSuccess = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyUpdateMessageText() : Text
      {
         return this._35573670skitEasyUpdateMessageText;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:UpdateUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._UpdateUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_UpdateUIWatcherSetupUtil");
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
      
      public function set skiteasyUpdateImage(param1:Image) : void
      {
         var _loc2_:Object = this._390616883skiteasyUpdateImage;
         if(_loc2_ !== param1)
         {
            this._390616883skiteasyUpdateImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skiteasyUpdateImage",_loc2_,param1));
         }
      }
      
      public function set skitEasyUpdateSuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._1561040171skitEasyUpdateSuccess;
         if(_loc2_ !== param1)
         {
            this._1561040171skitEasyUpdateSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyUpdateSuccess",_loc2_,param1));
         }
      }
      
      public function set isSkitEasyUpdateRequired(param1:Boolean) : void
      {
         this._isSkitEasyUpdateRequired = param1;
      }
      
      public function set skitEasyValidateUpdateRequiredButton(param1:Button) : void
      {
         var _loc2_:Object = this._88964651skitEasyValidateUpdateRequiredButton;
         if(_loc2_ !== param1)
         {
            this._88964651skitEasyValidateUpdateRequiredButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyValidateUpdateRequiredButton",_loc2_,param1));
         }
      }
      
      public function set imageSkitterUpdateSuccess(param1:Image) : void
      {
         var _loc2_:Object = this._1686083113imageSkitterUpdateSuccess;
         if(_loc2_ !== param1)
         {
            this._1686083113imageSkitterUpdateSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageSkitterUpdateSuccess",_loc2_,param1));
         }
      }
      
      public function set skitterUpdateSuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._699414564skitterUpdateSuccess;
         if(_loc2_ !== param1)
         {
            this._699414564skitterUpdateSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateSuccess",_loc2_,param1));
         }
      }
      
      public function get skitter() : Skitter
      {
         return this._skitter;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSkitEasyUpdateFailed() : Text
      {
         return this._1795444287lbSkitEasyUpdateFailed;
      }
      
      protected function skitEasyCancelUpdateButtonClickHandler(param1:MouseEvent) : void
      {
         ServerCommunicationManager.instance.startIoServiceLayer();
         this.closeHandler();
      }
      
      public function set btnSkitterUpdateFailedCancel(param1:Button) : void
      {
         var _loc2_:Object = this._1051146782btnSkitterUpdateFailedCancel;
         if(_loc2_ !== param1)
         {
            this._1051146782btnSkitterUpdateFailedCancel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSkitterUpdateFailedCancel",_loc2_,param1));
         }
      }
      
      protected function skitEasyCancelUpdateRequiredButtonClickHandler(param1:MouseEvent) : void
      {
         this.closeHandler();
      }
      
      public function get isSkitEasyUpdateSuccess() : Boolean
      {
         return this._isSkitEasyUpdateSuccess;
      }
      
      public function onSynchronizeSkitterAfterUpgrade(param1:UpgradeEvent) : void
      {
         var _loc2_:Skitter = InstallationService.instance.getSkitterConnectedByIdentifier(this.skitter);
         _loc2_.updateData(this.skitter);
         ServerCommunicationManager.instance.synchronizeSkitterAfterUpgrade(this.skitter,this.onSynchronizeSkitterAfterUpgradeSuccess,this.onSynchronizeSkitterAfterUpgradeFault);
      }
      
      public function set imageSkitterUpdateFailed(param1:Image) : void
      {
         var _loc2_:Object = this._1217716201imageSkitterUpdateFailed;
         if(_loc2_ !== param1)
         {
            this._1217716201imageSkitterUpdateFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageSkitterUpdateFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitEasyValidateUpdateRequiredButton() : Button
      {
         return this._88964651skitEasyValidateUpdateRequiredButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageSkitterUpdateSuccess() : Image
      {
         return this._1686083113imageSkitterUpdateSuccess;
      }
      
      public function __skitterValidateUpdateButton_click(param1:MouseEvent) : void
      {
         this.skitterValidateUpdateButtonClickHandler(param1);
      }
      
      public function set lbSkitterUpdateFailed(param1:Text) : void
      {
         var _loc2_:Object = this._465659922lbSkitterUpdateFailed;
         if(_loc2_ !== param1)
         {
            this._465659922lbSkitterUpdateFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSkitterUpdateFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSkitterUpdateFailedCancel() : Button
      {
         return this._1051146782btnSkitterUpdateFailedCancel;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateSuccess() : Canvas
      {
         return this._699414564skitterUpdateSuccess;
      }
      
      private function gotoSkitterUpgradeFault() : void
      {
         this.VSSkitEasyUpdate.selectedChild = this.skitterUpdateFailed;
         invalidateDisplayList();
         this.refreshPopup();
         this.setSkitterUpgradeFailedIconPosition();
      }
      
      public function __skitterCancelUpdateButton_click(param1:MouseEvent) : void
      {
         this.skitterCancelUpdateButtonClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSkitterUpdateFailed() : Text
      {
         return this._465659922lbSkitterUpdateFailed;
      }
      
      public function set skitterUpdateInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._1986200583skitterUpdateInProgress;
         if(_loc2_ !== param1)
         {
            this._1986200583skitterUpdateInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterUpdateInProgress",_loc2_,param1));
         }
      }
      
      protected function setSkitEasyUpdateSuccessIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbSkitEasyUpdateSuccess.validateNow();
         _loc1_ = this.lbSkitEasyUpdateSuccess.getLineMetrics(0);
         this.imageSkitEasyUpdateSuccess.x = _loc1_.x - this.imageSkitEasyUpdateSuccess.width - 5;
      }
      
      protected function skitterUpgradeFailedCancelClickHandler(param1:MouseEvent) : void
      {
         if(this._skittersToUpgrade.length > 0)
         {
            this.startUpgradeList();
         }
         else
         {
            this.closeHandler();
         }
      }
      
      public function set skitEasyValidateUpdateFunction(param1:Function) : void
      {
         this._skitEasyValidateUpdateFunction = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterUpdateInProgress() : Canvas
      {
         return this._1986200583skitterUpdateInProgress;
      }
      
      public function set skitEasyCancelUpdateButton(param1:Button) : void
      {
         var _loc2_:Object = this._2060488186skitEasyCancelUpdateButton;
         if(_loc2_ !== param1)
         {
            this._2060488186skitEasyCancelUpdateButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitEasyCancelUpdateButton",_loc2_,param1));
         }
      }
      
      private function skitterUpgradeProgressHandler(param1:UpgradeEvent) : void
      {
         if(ServerCommunicationManager.instance.currentSkitterInUpgradeProgress != this.skitter)
         {
            ServerCommunicationManager.instance.currentSkitterInUpgradeProgress = this.skitter;
         }
         if(this.VSSkitEasyUpdate.selectedChild != this.skitterUpdateInProgress)
         {
            this.gotoSkitterUpgradeInProgress();
         }
         this.skitterUpdateProgressBar.indeterminate = param1.progression == 100;
         this.skitterUpdateProgressBar.setProgress(param1.progression,100);
      }
   }
}
