package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.managers.DialogsManager;
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
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class ReceiveSecurityKeyUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1917984824lbReceiveKeyWarn:Text;
      
      private var _674542874lbReceiveKeyTitle:Text;
      
      private var _31689287vsReceiveSecurityKey:ViewStack;
      
      private var _46842070lbReceiveKeyConfirmTitle:Text;
      
      private var _70391678btnStartReceiveKey:Button;
      
      private var _1827526617receiveKeyFailed:Canvas;
      
      private var _1732238386lbReceiveKeyConfirm:Text;
      
      private var _1398389497btnYesReceiveKeyConfirm:Button;
      
      private var _255558383lbReceiveKeySuccess:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1860535788lbReceiveKeyInProgressTitle:Text;
      
      private var _2005760052imageReceiveKeySuccess:Image;
      
      private var _embed_mxml__2146821453:Class;
      
      private var _155483503lbReceiveKeyFailed:Text;
      
      private var _2004438503spinner:Spinner;
      
      private var _1767789044btnRestartReceiveKeyFailed:Button;
      
      private var _2016488465btnCancelReceiveKeyFailed:Button;
      
      private var _209233020receiveKey:Canvas;
      
      mx_internal var _watchers:Array;
      
      private var _846588178btnCancelReceiveKey:Button;
      
      private var _1498757063lbReceiveKeySuccessTitle:Text;
      
      public var _ReceiveSecurityKeyUI_HBox1:HBox;
      
      public var _ReceiveSecurityKeyUI_HBox2:HBox;
      
      public var _ReceiveSecurityKeyUI_HBox3:HBox;
      
      public var _ReceiveSecurityKeyUI_HBox4:HBox;
      
      private var _593711276imageReceiveKeyFailed:Image;
      
      private var _1639295986receiveKeyInProgress:Canvas;
      
      private var _38170599receiveKeySuccess:Canvas;
      
      private var _1023950500lbReceiveKeyInProgress:Text;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1991124119lbReceiveKeyConnected:Text;
      
      private var _1419897796btnYesReceiveKeySuccess:Button;
      
      private var _826065449lbReceiveKeyFailedTitle:Text;
      
      private var _1438509404receiveKeyConfirm:Canvas;
      
      private var _embed_mxml__801521088:Class;
      
      private var _343892658btnCancelReceiveKeyConfirm:Button;
      
      private var _337030326lbReceiveKeyInProgressWarn:Text;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml__928423959:Class;
      
      public function ReceiveSecurityKeyUI()
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
                  "id":"vsReceiveSecurityKey",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "creationPolicy":"all",
                        "percentWidth":100,
                        "resizeToContent":true,
                        "clipContent":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"receiveKey",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyWarn",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReceiveSecurityKeyUI_HBox1",
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
                                             "id":"btnStartReceiveKey",
                                             "events":{"click":"__btnStartReceiveKey_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnStartReceiveKey",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReceiveKey",
                                             "events":{"click":"__btnCancelReceiveKey_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelReceiveKey",
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
                           "id":"receiveKeyConfirm",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyConfirmTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyConfirmTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyConfirm",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyPressKey",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyConnected",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyConnected",
                                          "percentWidth":100,
                                          "styleName":"V18RCL0"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReceiveSecurityKeyUI_HBox2",
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
                                             "id":"btnYesReceiveKeyConfirm",
                                             "events":{"click":"__btnYesReceiveKeyConfirm_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesReceiveKeyConfirm",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReceiveKeyConfirm",
                                             "events":{"click":"__btnCancelReceiveKeyConfirm_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesReceiveKeyConfirm",
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
                           "id":"receiveKeyInProgress",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyInProgressTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyInProgressTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyInProgress",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyInProgress",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyInProgressWarn",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyInProgress2",
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
                                          "x":238
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"receiveKeySuccess",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeySuccessTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeySuccessTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageReceiveKeySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "source":_embed_mxml__928423959,
                                          "x":15
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeySuccess",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeySuccess",
                                          "percentWidth":100,
                                          "styleName":"VR18BCL1"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReceiveSecurityKeyUI_HBox3",
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
                                             "id":"btnYesReceiveKeySuccess",
                                             "events":{"click":"__btnYesReceiveKeySuccess_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesReceiveKeySuccess",
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
                           "id":"receiveKeyFailed",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lbReceiveKeyFailedTitle",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyFailedTitle",
                                          "percentWidth":100,
                                          "styleName":"VR24BC",
                                          "y":0
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imageReceiveKeyFailed",
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
                                    "id":"lbReceiveKeyFailed",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"lbReceiveKeyFailed",
                                          "percentWidth":100,
                                          "styleName":"VR18BC"
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_ReceiveSecurityKeyUI_HBox4",
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
                                             "id":"btnRestartReceiveKeyFailed",
                                             "events":{"click":"__btnRestartReceiveKeyFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnRestartReceiveKeyFailed",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelReceiveKeyFailed",
                                             "events":{"click":"__btnCancelReceiveKeyFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelReceiveKeyFailed",
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
         this._embed_mxml__2146821453 = ReceiveSecurityKeyUI__embed_mxml__2146821453;
         this._embed_mxml__801521088 = ReceiveSecurityKeyUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = ReceiveSecurityKeyUI__embed_mxml__928423959;
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
         ReceiveSecurityKeyUI._watcherSetupUtil = param1;
      }
      
      public function set lbReceiveKeyFailed(param1:Text) : void
      {
         var _loc2_:Object = this._155483503lbReceiveKeyFailed;
         if(_loc2_ !== param1)
         {
            this._155483503lbReceiveKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyFailed",_loc2_,param1));
         }
      }
      
      public function set btnStartReceiveKey(param1:Button) : void
      {
         var _loc2_:Object = this._70391678btnStartReceiveKey;
         if(_loc2_ !== param1)
         {
            this._70391678btnStartReceiveKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnStartReceiveKey",_loc2_,param1));
         }
      }
      
      private function _ReceiveSecurityKeyUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeyWarn.y = param1;
         },"lbReceiveKeyWarn.y");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReceiveSecurityKeyUI_HBox1.y = param1;
         },"_ReceiveSecurityKeyUI_HBox1.y");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeyConfirm.y = param1;
         },"lbReceiveKeyConfirm.y");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeyConnected.y = param1;
         },"lbReceiveKeyConnected.y");
         result[3] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReceiveSecurityKeyUI_HBox2.y = param1;
         },"_ReceiveSecurityKeyUI_HBox2.y");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeyInProgress.y = param1;
         },"lbReceiveKeyInProgress.y");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeyInProgressWarn.y = param1;
         },"lbReceiveKeyInProgressWarn.y");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[7] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            imageReceiveKeySuccess.y = param1;
         },"imageReceiveKeySuccess.y");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeySuccess.y = param1;
         },"lbReceiveKeySuccess.y");
         result[9] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReceiveSecurityKeyUI_HBox3.y = param1;
         },"_ReceiveSecurityKeyUI_HBox3.y");
         result[10] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            imageReceiveKeyFailed.y = param1;
         },"imageReceiveKeyFailed.y");
         result[11] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            lbReceiveKeyFailed.y = param1;
         },"lbReceiveKeyFailed.y");
         result[12] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            _ReceiveSecurityKeyUI_HBox4.y = param1;
         },"_ReceiveSecurityKeyUI_HBox4.y");
         result[13] = binding;
         return result;
      }
      
      public function set receiveKey(param1:Canvas) : void
      {
         var _loc2_:Object = this._209233020receiveKey;
         if(_loc2_ !== param1)
         {
            this._209233020receiveKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"receiveKey",_loc2_,param1));
         }
      }
      
      public function set vsReceiveSecurityKey(param1:ViewStack) : void
      {
         var _loc2_:Object = this._31689287vsReceiveSecurityKey;
         if(_loc2_ !== param1)
         {
            this._31689287vsReceiveSecurityKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsReceiveSecurityKey",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRestartReceiveKeyFailed() : Button
      {
         return this._1767789044btnRestartReceiveKeyFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get receiveKeyInProgress() : Canvas
      {
         return this._1639295986receiveKeyInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeySuccess() : Text
      {
         return this._255558383lbReceiveKeySuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReceiveKey() : Button
      {
         return this._846588178btnCancelReceiveKey;
      }
      
      public function set btnRestartReceiveKeyFailed(param1:Button) : void
      {
         var _loc2_:Object = this._1767789044btnRestartReceiveKeyFailed;
         if(_loc2_ !== param1)
         {
            this._1767789044btnRestartReceiveKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRestartReceiveKeyFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      public function set btnYesReceiveKeyConfirm(param1:Button) : void
      {
         var _loc2_:Object = this._1398389497btnYesReceiveKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._1398389497btnYesReceiveKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesReceiveKeyConfirm",_loc2_,param1));
         }
      }
      
      public function set lbReceiveKeySuccess(param1:Text) : void
      {
         var _loc2_:Object = this._255558383lbReceiveKeySuccess;
         if(_loc2_ !== param1)
         {
            this._255558383lbReceiveKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeySuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyInProgressTitle() : Text
      {
         return this._1860535788lbReceiveKeyInProgressTitle;
      }
      
      public function set btnCancelReceiveKey(param1:Button) : void
      {
         var _loc2_:Object = this._846588178btnCancelReceiveKey;
         if(_loc2_ !== param1)
         {
            this._846588178btnCancelReceiveKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReceiveKey",_loc2_,param1));
         }
      }
      
      private function _ReceiveSecurityKeyUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.lbReceiveKeyTitle.y + this.lbReceiveKeyTitle.height + 20;
         _loc1_ = this.lbReceiveKeyWarn.y + this.lbReceiveKeyWarn.height + 30;
         _loc1_ = this.lbReceiveKeyConfirmTitle.y + this.lbReceiveKeyConfirmTitle.height + 20;
         _loc1_ = this.lbReceiveKeyConfirm.y + this.lbReceiveKeyConfirm.height + 20;
         _loc1_ = this.lbReceiveKeyConnected.y + this.lbReceiveKeyConnected.height + 30;
         _loc1_ = this.lbReceiveKeyInProgressTitle.y + this.lbReceiveKeyInProgressTitle.height + 20;
         _loc1_ = this.lbReceiveKeyInProgress.y + this.lbReceiveKeyInProgress.height + 20;
         _loc1_ = this.lbReceiveKeyInProgressWarn.y + this.lbReceiveKeyInProgressWarn.height + 20;
         _loc1_ = this.lbReceiveKeySuccessTitle.y + this.lbReceiveKeySuccessTitle.height + 20;
         _loc1_ = this.lbReceiveKeySuccessTitle.y + this.lbReceiveKeySuccessTitle.height + 17;
         _loc1_ = this.lbReceiveKeySuccess.y + this.lbReceiveKeySuccess.height + 30;
         _loc1_ = this.lbReceiveKeyFailedTitle.y + this.lbReceiveKeyFailedTitle.height + 20;
         _loc1_ = this.lbReceiveKeyFailedTitle.y + this.lbReceiveKeyFailedTitle.height + 17;
         _loc1_ = this.lbReceiveKeyFailed.y + this.lbReceiveKeyFailed.height + 30;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyConfirmTitle() : Text
      {
         return this._46842070lbReceiveKeyConfirmTitle;
      }
      
      public function set receiveKeyInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._1639295986receiveKeyInProgress;
         if(_loc2_ !== param1)
         {
            this._1639295986receiveKeyInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"receiveKeyInProgress",_loc2_,param1));
         }
      }
      
      public function set lbReceiveKeyConnected(param1:Text) : void
      {
         var _loc2_:Object = this._1991124119lbReceiveKeyConnected;
         if(_loc2_ !== param1)
         {
            this._1991124119lbReceiveKeyConnected = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyConnected",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         switch(this.vsReceiveSecurityKey.selectedChild.id)
         {
            case "receiveKey":
               this.lbReceiveKeyTitle.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_TITLE");
               this.lbReceiveKeyWarn.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_WARN");
               this.btnStartReceiveKey.label = resourceManager.getString("common","BTN_RECEIVE_KEY");
               this.btnCancelReceiveKey.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "receiveKeyConfirm":
               this.lbReceiveKeyConfirmTitle.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_TITLE");
               this.lbReceiveKeyConfirm.htmlText = resourceManager.getString("system","MSG_REALLY_RECEIVE_KEY");
               this.lbReceiveKeyConnected.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_CONNECTED");
               this.btnYesReceiveKeyConfirm.label = resourceManager.getString("common","BTN_OK");
               this.btnCancelReceiveKeyConfirm.label = resourceManager.getString("common","BTN_CANCEL");
               break;
            case "receiveKeyInProgress":
               this.lbReceiveKeyInProgressTitle.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_TITLE");
               this.lbReceiveKeyInProgress.htmlText = resourceManager.getString("system","MSG_RECEIVE_SECURITY_KEY_IN_PROGRESS");
               this.lbReceiveKeyInProgressWarn.htmlText = resourceManager.getString("system","MSG_RECEIVE_SECURITY_KEY_IN_PROGRESS_WARN");
               break;
            case "receiveKeySuccess":
               this.lbReceiveKeySuccessTitle.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_TITLE");
               this.lbReceiveKeySuccess.htmlText = resourceManager.getString("system","MSG_RECEIVE_SECURITY_KEY_SUCCESS");
               this.btnYesReceiveKeySuccess.label = resourceManager.getString("common","BTN_OK");
               break;
            case "receiveKeyFailed":
               this.lbReceiveKeyFailedTitle.htmlText = resourceManager.getString("system","MSG_RECEIVE_KEY_TITLE");
               this.lbReceiveKeyFailed.htmlText = resourceManager.getString("system","MSG_RECEIVE_SECURITY_KEY_FAILED");
               this.btnRestartReceiveKeyFailed.label = resourceManager.getString("common","BTN_RETRY");
               this.btnCancelReceiveKeyFailed.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      private function goToReceiveKeyInProgress() : void
      {
         this.vsReceiveSecurityKey.selectedChild = this.receiveKeyInProgress;
         invalidateDisplayList();
         this.spinner.play();
         this.refreshPopup();
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
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.UPDATE_KEY_SUCCESS,this.goToReceiveKeySuccess);
         SkitterManager.instance.skitterConnectionAllowed = false;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyWarn() : Text
      {
         return this._1917984824lbReceiveKeyWarn;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyFailedTitle() : Text
      {
         return this._826065449lbReceiveKeyFailedTitle;
      }
      
      public function __btnCancelReceiveKeyConfirm_click(param1:MouseEvent) : void
      {
         this.onBtnNoreceiveKeyConfirmClickHandler(param1);
      }
      
      public function __btnCancelReceiveKey_click(param1:MouseEvent) : void
      {
         this.onBtnCancelReceiveKeyClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesReceiveKeySuccess() : Button
      {
         return this._1419897796btnYesReceiveKeySuccess;
      }
      
      public function set lbReceiveKeyInProgress(param1:Text) : void
      {
         var _loc2_:Object = this._1023950500lbReceiveKeyInProgress;
         if(_loc2_ !== param1)
         {
            this._1023950500lbReceiveKeyInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyInProgress",_loc2_,param1));
         }
      }
      
      public function set lbReceiveKeyFailedTitle(param1:Text) : void
      {
         var _loc2_:Object = this._826065449lbReceiveKeyFailedTitle;
         if(_loc2_ !== param1)
         {
            this._826065449lbReceiveKeyFailedTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyFailedTitle",_loc2_,param1));
         }
      }
      
      private function onBtnCancelReceiveKeyPressKeyClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReceiveKeyConfirm() : Button
      {
         return this._343892658btnCancelReceiveKeyConfirm;
      }
      
      public function set receiveKeyConfirm(param1:Canvas) : void
      {
         var _loc2_:Object = this._1438509404receiveKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._1438509404receiveKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"receiveKeyConfirm",_loc2_,param1));
         }
      }
      
      public function __btnCancelReceiveKeyFailed_click(param1:MouseEvent) : void
      {
         this.onBtnCancelReceiveKeyClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyInProgressWarn() : Text
      {
         return this._337030326lbReceiveKeyInProgressWarn;
      }
      
      public function set lbReceiveKeyInProgressTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1860535788lbReceiveKeyInProgressTitle;
         if(_loc2_ !== param1)
         {
            this._1860535788lbReceiveKeyInProgressTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyInProgressTitle",_loc2_,param1));
         }
      }
      
      private function onBtnStartReceiveKeyStartClickHandler(param1:MouseEvent = null) : void
      {
         this.vsReceiveSecurityKey.selectedChild = this.receiveKeyConfirm;
         this.refreshPopup();
         invalidateDisplayList();
      }
      
      [Bindable(event="propertyChange")]
      public function get imageReceiveKeyFailed() : Image
      {
         return this._593711276imageReceiveKeyFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyFailed() : Text
      {
         return this._155483503lbReceiveKeyFailed;
      }
      
      public function __btnStartReceiveKey_click(param1:MouseEvent) : void
      {
         this.onBtnStartReceiveKeyStartClickHandler(param1);
      }
      
      public function __btnRestartReceiveKeyFailed_click(param1:MouseEvent) : void
      {
         this.onBtnRestartReceiveKeyFailedClickHandler(param1);
      }
      
      public function set lbReceiveKeyWarn(param1:Text) : void
      {
         var _loc2_:Object = this._1917984824lbReceiveKeyWarn;
         if(_loc2_ !== param1)
         {
            this._1917984824lbReceiveKeyWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyWarn",_loc2_,param1));
         }
      }
      
      public function set btnYesReceiveKeySuccess(param1:Button) : void
      {
         var _loc2_:Object = this._1419897796btnYesReceiveKeySuccess;
         if(_loc2_ !== param1)
         {
            this._1419897796btnYesReceiveKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYesReceiveKeySuccess",_loc2_,param1));
         }
      }
      
      private function goToReceiveKeyFailed() : void
      {
         this.vsReceiveSecurityKey.selectedChild = this.receiveKeyFailed;
         invalidateDisplayList();
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setFailedIconPosition);
      }
      
      public function set lbReceiveKeyConfirmTitle(param1:Text) : void
      {
         var _loc2_:Object = this._46842070lbReceiveKeyConfirmTitle;
         if(_loc2_ !== param1)
         {
            this._46842070lbReceiveKeyConfirmTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyConfirmTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnStartReceiveKey() : Button
      {
         return this._70391678btnStartReceiveKey;
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_NEW_SYSTEM_KEY:
               this.goToReceiveKeyFailed();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               this.spinner.stop();
               this.close();
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get receiveKey() : Canvas
      {
         return this._209233020receiveKey;
      }
      
      private function onBtnRestartReceiveKeyFailedClickHandler(param1:MouseEvent) : void
      {
         this.onBtnStartReceiveKeyStartClickHandler();
      }
      
      private function onBtnNoreceiveKeyConfirmClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      public function set lbReceiveKeySuccessTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1498757063lbReceiveKeySuccessTitle;
         if(_loc2_ !== param1)
         {
            this._1498757063lbReceiveKeySuccessTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeySuccessTitle",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ReceiveSecurityKeyUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ReceiveSecurityKeyUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_ReceiveSecurityKeyUIWatcherSetupUtil");
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
         this.lbReceiveKeySuccess.validateNow();
         _loc1_ = this.lbReceiveKeySuccess.getLineMetrics(0);
         this.imageReceiveKeySuccess.x = _loc1_.x - this.imageReceiveKeySuccess.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyConnected() : Text
      {
         return this._1991124119lbReceiveKeyConnected;
      }
      
      public function set imageReceiveKeySuccess(param1:Image) : void
      {
         var _loc2_:Object = this._2005760052imageReceiveKeySuccess;
         if(_loc2_ !== param1)
         {
            this._2005760052imageReceiveKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageReceiveKeySuccess",_loc2_,param1));
         }
      }
      
      private function goToReceiveKeySuccess(param1:InstallationEvent) : void
      {
         this.vsReceiveSecurityKey.selectedChild = this.receiveKeySuccess;
         invalidateDisplayList();
         this.spinner.stop();
         this.refreshPopup();
         callLater(this.setSuccessIconPosition);
      }
      
      public function set lbReceiveKeyInProgressWarn(param1:Text) : void
      {
         var _loc2_:Object = this._337030326lbReceiveKeyInProgressWarn;
         if(_loc2_ !== param1)
         {
            this._337030326lbReceiveKeyInProgressWarn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyInProgressWarn",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyInProgress() : Text
      {
         return this._1023950500lbReceiveKeyInProgress;
      }
      
      public function set btnCancelReceiveKeyConfirm(param1:Button) : void
      {
         var _loc2_:Object = this._343892658btnCancelReceiveKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._343892658btnCancelReceiveKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReceiveKeyConfirm",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsReceiveSecurityKey.selectedChild.id)
         {
            case "receiveKeyFailed":
               this.width = 528;
               break;
            case "receiveKeySuccess":
               this.width = 528;
               break;
            case "receiveKeyInProgress":
               this.width = 528;
               break;
            case "receiveKeyConfirm":
               this.width = 528;
               break;
            case "receiveKey":
            default:
               this.width = 529;
         }
         super.refreshUI();
      }
      
      public function set imageReceiveKeyFailed(param1:Image) : void
      {
         var _loc2_:Object = this._593711276imageReceiveKeyFailed;
         if(_loc2_ !== param1)
         {
            this._593711276imageReceiveKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageReceiveKeyFailed",_loc2_,param1));
         }
      }
      
      protected function setFailedIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbReceiveKeyFailed.validateNow();
         _loc1_ = this.lbReceiveKeyFailed.getLineMetrics(0);
         this.imageReceiveKeyFailed.x = _loc1_.x - this.imageReceiveKeyFailed.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get receiveKeyConfirm() : Canvas
      {
         return this._1438509404receiveKeyConfirm;
      }
      
      public function set lbReceiveKeyConfirm(param1:Text) : void
      {
         var _loc2_:Object = this._1732238386lbReceiveKeyConfirm;
         if(_loc2_ !== param1)
         {
            this._1732238386lbReceiveKeyConfirm = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyConfirm",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get vsReceiveSecurityKey() : ViewStack
      {
         return this._31689287vsReceiveSecurityKey;
      }
      
      public function set receiveKeyFailed(param1:Canvas) : void
      {
         var _loc2_:Object = this._1827526617receiveKeyFailed;
         if(_loc2_ !== param1)
         {
            this._1827526617receiveKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"receiveKeyFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeySuccessTitle() : Text
      {
         return this._1498757063lbReceiveKeySuccessTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyConfirm() : Text
      {
         return this._1732238386lbReceiveKeyConfirm;
      }
      
      public function set receiveKeySuccess(param1:Canvas) : void
      {
         var _loc2_:Object = this._38170599receiveKeySuccess;
         if(_loc2_ !== param1)
         {
            this._38170599receiveKeySuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"receiveKeySuccess",_loc2_,param1));
         }
      }
      
      private function onBtnYesReceiveKeyConfirmClickHandler(param1:MouseEvent) : void
      {
         if(InstallationService.instance.hasConnectedAndActivatedDevice())
         {
            this.goToReceiveKeyInProgress();
            ServerCommunicationManager.instance.getKeyFrom2WControllerSystem();
         }
         else
         {
            DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      public function set btnCancelReceiveKeyFailed(param1:Button) : void
      {
         var _loc2_:Object = this._2016488465btnCancelReceiveKeyFailed;
         if(_loc2_ !== param1)
         {
            this._2016488465btnCancelReceiveKeyFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelReceiveKeyFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get receiveKeyFailed() : Canvas
      {
         return this._1827526617receiveKeyFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageReceiveKeySuccess() : Image
      {
         return this._2005760052imageReceiveKeySuccess;
      }
      
      public function __btnYesReceiveKeySuccess_click(param1:MouseEvent) : void
      {
         this.onBtnStartTransfertKeyClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get receiveKeySuccess() : Canvas
      {
         return this._38170599receiveKeySuccess;
      }
      
      public function set lbReceiveKeyTitle(param1:Text) : void
      {
         var _loc2_:Object = this._674542874lbReceiveKeyTitle;
         if(_loc2_ !== param1)
         {
            this._674542874lbReceiveKeyTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbReceiveKeyTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelReceiveKeyFailed() : Button
      {
         return this._2016488465btnCancelReceiveKeyFailed;
      }
      
      public function __btnYesReceiveKeyConfirm_click(param1:MouseEvent) : void
      {
         this.onBtnYesReceiveKeyConfirmClickHandler(param1);
      }
      
      private function onBtnCancelReceiveKeyClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYesReceiveKeyConfirm() : Button
      {
         return this._1398389497btnYesReceiveKeyConfirm;
      }
      
      private function onBtnStartTransfertKeyClickHandler(param1:MouseEvent) : void
      {
         this.close();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbReceiveKeyTitle() : Text
      {
         return this._674542874lbReceiveKeyTitle;
      }
      
      private function close() : void
      {
         closeHandler();
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
   }
}
