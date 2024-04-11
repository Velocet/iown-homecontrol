package com.scenarioLauncher.views.popup
{
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.TextInputPassword;
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
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class MaintenanceConnexionPopup extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1110033753lbPass:Text;
      
      private var _239165867btnRestartPasswordFailed:Button;
      
      private var _47374718lbTitle:Text;
      
      private var _1110437832lbBody:Text;
      
      mx_internal var _watchers:Array;
      
      private var _919102792passwordFailed:VBox;
      
      private var _610418986vsMaintenanceUI:ViewStack;
      
      private var _701999509txtInputPass:TextInputPassword;
      
      private var _embed_mxml__761932093:Class;
      
      private var _1299046230maintenanceMode:VBox;
      
      private var _1865720910btnCancelPasswordFailed:Button;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _117924854btnCancel:Button;
      
      private var _1772884355passwordFailedImage:Image;
      
      private var _embed_mxml__801521088:Class;
      
      private var _1317735126lbPasswordFailedTitle:Text;
      
      mx_internal var _bindings:Array;
      
      private var _validate:Function;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _94069048btnOK:Button;
      
      private var _486976974lbPasswordFailed:Text;
      
      public function MaintenanceConnexionPopup()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":432,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Image,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "source":_embed_mxml__761932093,
                           "x":261,
                           "y":20
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"vsMaintenanceUI",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "resizeToContent":true,
                           "creationPolicy":"all",
                           "percentWidth":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "id":"maintenanceMode",
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbTitle",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbTitle",
                                             "percentWidth":100,
                                             "styleName":"VR24BC",
                                             "x":15,
                                             "y":73
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":5};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbBody",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbBody",
                                             "percentWidth":100,
                                             "styleName":"VR18BCL0",
                                             "x":15,
                                             "y":130
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":5};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbPass",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbPass",
                                             "percentWidth":100,
                                             "styleName":"VR24BC",
                                             "x":0,
                                             "y":213
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"childDescriptors":[new UIComponentDescriptor({
                                             "type":TextInputPassword,
                                             "id":"txtInputPass",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "name":"lbPass",
                                                   "width":140,
                                                   "x":221,
                                                   "y":242
                                                };
                                             }
                                          })]};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":15};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {"childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnOK",
                                             "events":{"click":"__btnOK_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnOKSkitterVersionPb",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "x":148,
                                                   "y":306,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Spacer,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"width":15};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancel",
                                             "events":{"click":"__btnCancel_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNOSkitterVersionPb",
                                                   "styleName":"btnCancel",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "x":290,
                                                   "y":305,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          })]};
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "id":"passwordFailed",
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"passwordFailed",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbPasswordFailedTitle",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbPasswordFailedTitle",
                                             "percentWidth":100,
                                             "styleName":"VR24BC",
                                             "y":83
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":5};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"passwordFailedImage",
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
                                                "id":"lbPasswordFailed",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbPasswordFailed",
                                                      "percentWidth":100,
                                                      "styleName":"VR18BC"
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":15};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {"childDescriptors":[new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnRestartPasswordFailed",
                                             "events":{"click":"__btnRestartPasswordFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnRestartPasswordFailed",
                                                   "styleName":"btnValidate",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "x":125,
                                                   "y":203,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Spacer,
                                             "propertiesFactory":function():Object
                                             {
                                                return {"width":20};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Button,
                                             "id":"btnCancelPasswordFailed",
                                             "events":{"click":"__btnCancelPasswordFailed_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnCancelPasswordFailed",
                                                   "styleName":"btnCancel",
                                                   "buttonMode":true,
                                                   "useHandCursor":true,
                                                   "x":295,
                                                   "y":203,
                                                   "minWidth":113,
                                                   "height":24
                                                };
                                             }
                                          })]};
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
         this._embed_mxml__761932093 = MaintenanceConnexionPopup__embed_mxml__761932093;
         this._embed_mxml__801521088 = MaintenanceConnexionPopup__embed_mxml__801521088;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 432;
         this.addEventListener("keyDown",this.___MaintenanceConnexionPopup_CommonPopup1_keyDown);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         MaintenanceConnexionPopup._watcherSetupUtil = param1;
      }
      
      public function ___MaintenanceConnexionPopup_CommonPopup1_keyDown(param1:KeyboardEvent) : void
      {
         this.commonpopup1_keyDownHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbTitle() : Text
      {
         return this._47374718lbTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get passwordFailedImage() : Image
      {
         return this._1772884355passwordFailedImage;
      }
      
      public function set lbTitle(param1:Text) : void
      {
         var _loc2_:Object = this._47374718lbTitle;
         if(_loc2_ !== param1)
         {
            this._47374718lbTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancel() : Button
      {
         return this._117924854btnCancel;
      }
      
      public function set passwordFailedImage(param1:Image) : void
      {
         var _loc2_:Object = this._1772884355passwordFailedImage;
         if(_loc2_ !== param1)
         {
            this._1772884355passwordFailedImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"passwordFailedImage",_loc2_,param1));
         }
      }
      
      private function _MaintenanceConnexionPopup_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            maintenanceMode.verticalScrollPolicy = param1;
         },"maintenanceMode.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            maintenanceMode.horizontalScrollPolicy = param1;
         },"maintenanceMode.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return (0 - 0) / 2;
         },function(param1:Number):void
         {
            lbPasswordFailed.y = param1;
         },"lbPasswordFailed.y");
         result[2] = binding;
         return result;
      }
      
      public function set lbBody(param1:Text) : void
      {
         var _loc2_:Object = this._1110437832lbBody;
         if(_loc2_ !== param1)
         {
            this._1110437832lbBody = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbBody",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MaintenanceConnexionPopup = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._MaintenanceConnexionPopup_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_popup_MaintenanceConnexionPopupWatcherSetupUtil");
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
      
      public function set vsMaintenanceUI(param1:ViewStack) : void
      {
         var _loc2_:Object = this._610418986vsMaintenanceUI;
         if(_loc2_ !== param1)
         {
            this._610418986vsMaintenanceUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsMaintenanceUI",_loc2_,param1));
         }
      }
      
      private function goToPasswordFailed() : void
      {
         this.vsMaintenanceUI.selectedChild = this.passwordFailed;
         this.refreshUI();
      }
      
      public function set validateFunction(param1:Function) : void
      {
         this._validate = param1;
      }
      
      public function set passwordFailed(param1:VBox) : void
      {
         var _loc2_:Object = this._919102792passwordFailed;
         if(_loc2_ !== param1)
         {
            this._919102792passwordFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"passwordFailed",_loc2_,param1));
         }
      }
      
      private function _MaintenanceConnexionPopup_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = (this.passwordFailedImage.height - this.lbPasswordFailed.height) / 2;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbPasswordFailed() : Text
      {
         return this._486976974lbPasswordFailed;
      }
      
      public function __btnCancel_click(param1:MouseEvent) : void
      {
         this.btnCancelClickHandler(param1);
      }
      
      protected function btnCancelPasswordFailedClickHandler(param1:MouseEvent) : void
      {
         this.close();
         this.goToMaintenanceMode();
      }
      
      public function set btnCancelPasswordFailed(param1:Button) : void
      {
         var _loc2_:Object = this._1865720910btnCancelPasswordFailed;
         if(_loc2_ !== param1)
         {
            this._1865720910btnCancelPasswordFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelPasswordFailed",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         if(this.lbTitle != null)
         {
            this.lbTitle.htmlText = resourceManager.getString("installation","MSG_MAINTENANCE_MODE_TITLE");
         }
         if(this.lbBody != null)
         {
            this.lbBody.htmlText = resourceManager.getString("installation","MSG_MAINTENANCE_ACCESS_PRO");
         }
         if(this.lbPass != null)
         {
            this.lbPass.htmlText = resourceManager.getString("installation","MSG_MAINTENANCE_PASS");
         }
         if(this.btnOK != null)
         {
            this.btnOK.label = resourceManager.getString("common","BTN_OK");
         }
         if(this.btnCancel != null)
         {
            this.btnCancel.label = resourceManager.getString("common","BTN_CANCEL");
         }
         if(this.lbPasswordFailedTitle)
         {
            this.lbPasswordFailedTitle.htmlText = resourceManager.getString("installation","MSG_MAINTENANCE_MODE_TITLE");
         }
         if(this.lbPasswordFailed)
         {
            this.lbPasswordFailed.htmlText = resourceManager.getString("installation","MSG_MAINTENANCE_PASS_FAILED");
         }
         if(this.btnRestartPasswordFailed)
         {
            this.btnRestartPasswordFailed.label = resourceManager.getString("common","BTN_RETRY");
         }
         if(this.btnCancelPasswordFailed)
         {
            this.btnCancelPasswordFailed.label = resourceManager.getString("common","BTN_CANCEL");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRestartPasswordFailed() : Button
      {
         return this._239165867btnRestartPasswordFailed;
      }
      
      public function set lbPasswordFailed(param1:Text) : void
      {
         var _loc2_:Object = this._486976974lbPasswordFailed;
         if(_loc2_ !== param1)
         {
            this._486976974lbPasswordFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbPasswordFailed",_loc2_,param1));
         }
      }
      
      override protected function refreshUI() : void
      {
         switch(this.vsMaintenanceUI.selectedChild.id)
         {
            case "maintenanceMode":
               this.width = 550;
               break;
            case "passwordFailed":
               this.width = 528;
               callLater(this.setFailedSpecificIconPosition);
         }
         super.refreshUI();
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.txtInputPass.ti.setFocus();
         SkitterManager.instance.skitterConnectionAllowed = false;
      }
      
      private function btnCancelClickHandler(param1:MouseEvent = null) : void
      {
         this.close();
         this.goToMaintenanceMode();
      }
      
      public function set maintenanceMode(param1:VBox) : void
      {
         var _loc2_:Object = this._1299046230maintenanceMode;
         if(_loc2_ !== param1)
         {
            this._1299046230maintenanceMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maintenanceMode",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOK() : Button
      {
         return this._94069048btnOK;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbPasswordFailedTitle() : Text
      {
         return this._1317735126lbPasswordFailedTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbBody() : Text
      {
         return this._1110437832lbBody;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbPass() : Text
      {
         return this._1110033753lbPass;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get passwordFailed() : VBox
      {
         return this._919102792passwordFailed;
      }
      
      private function goToMaintenanceMode() : void
      {
         this.vsMaintenanceUI.selectedChild = this.maintenanceMode;
         this.txtInputPass.reset();
         this.refreshUI();
      }
      
      public function __btnRestartPasswordFailed_click(param1:MouseEvent) : void
      {
         this.btnRestartPasswordFailedClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelPasswordFailed() : Button
      {
         return this._1865720910btnCancelPasswordFailed;
      }
      
      public function set btnRestartPasswordFailed(param1:Button) : void
      {
         var _loc2_:Object = this._239165867btnRestartPasswordFailed;
         if(_loc2_ !== param1)
         {
            this._239165867btnRestartPasswordFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRestartPasswordFailed",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get vsMaintenanceUI() : ViewStack
      {
         return this._610418986vsMaintenanceUI;
      }
      
      protected function commonpopup1_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.btnOKClickHandler();
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.btnCancelClickHandler();
         }
      }
      
      public function set lbPass(param1:Text) : void
      {
         var _loc2_:Object = this._1110033753lbPass;
         if(_loc2_ !== param1)
         {
            this._1110033753lbPass = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbPass",_loc2_,param1));
         }
      }
      
      public function __btnOK_click(param1:MouseEvent) : void
      {
         this.btnOKClickHandler(param1);
      }
      
      public function set lbPasswordFailedTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1317735126lbPasswordFailedTitle;
         if(_loc2_ !== param1)
         {
            this._1317735126lbPasswordFailedTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbPasswordFailedTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maintenanceMode() : VBox
      {
         return this._1299046230maintenanceMode;
      }
      
      [Bindable(event="propertyChange")]
      public function get txtInputPass() : TextInputPassword
      {
         return this._701999509txtInputPass;
      }
      
      protected function btnRestartPasswordFailedClickHandler(param1:MouseEvent) : void
      {
         this.goToMaintenanceMode();
      }
      
      public function set txtInputPass(param1:TextInputPassword) : void
      {
         var _loc2_:Object = this._701999509txtInputPass;
         if(_loc2_ !== param1)
         {
            this._701999509txtInputPass = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"txtInputPass",_loc2_,param1));
         }
      }
      
      public function set btnOK(param1:Button) : void
      {
         var _loc2_:Object = this._94069048btnOK;
         if(_loc2_ !== param1)
         {
            this._94069048btnOK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOK",_loc2_,param1));
         }
      }
      
      protected function setFailedSpecificIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbPasswordFailed.validateNow();
         _loc1_ = this.lbPasswordFailed.getLineMetrics(0);
         this.passwordFailedImage.x = _loc1_.x - this.passwordFailedImage.width - 5;
      }
      
      public function __btnCancelPasswordFailed_click(param1:MouseEvent) : void
      {
         this.btnCancelPasswordFailedClickHandler(param1);
      }
      
      private function close() : void
      {
         closeHandler();
         SkitterManager.instance.skitterConnectionAllowed = true;
         SkitterManager.instance.connectionProcessing();
      }
      
      private function btnOKClickHandler(param1:MouseEvent = null) : void
      {
         if(this.txtInputPass.text.toUpperCase() == Globals.PASSWORD)
         {
            Globals.ADMIN_IDENTIFIED = true;
            this.close();
            this._validate();
         }
         else
         {
            this.goToPasswordFailed();
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
   }
}
