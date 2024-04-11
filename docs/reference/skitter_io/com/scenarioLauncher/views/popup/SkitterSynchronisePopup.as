package com.scenarioLauncher.views.popup
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
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
   import ioService.datamodel.Skitter;
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.Application;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class SkitterSynchronisePopup extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _47374718lbTitle:Text;
      
      private var _2071701902vsSynchroniseUI:ViewStack;
      
      private var _1110437832lbBody:Text;
      
      mx_internal var _watchers:Array;
      
      private var _cancel:Function;
      
      private var _1378816277btnYes:Button;
      
      private var _94069053btnNo:Button;
      
      private var _1137878700synchroniseVbox:VBox;
      
      private var _skitterListToSynchronise:Array;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _embed_mxml_____________assets_images_remotes_petit_skitter_png_470727833:Class;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _remote:Skitter;
      
      mx_internal var _bindings:Array;
      
      private var _validate:Function;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function SkitterSynchronisePopup()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":550,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Image,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "source":_embed_mxml_____________assets_images_remotes_petit_skitter_png_470727833,
                           "x":261,
                           "y":20
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"vsSynchroniseUI",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "resizeToContent":true,
                           "creationPolicy":"all",
                           "percentWidth":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "id":"synchroniseVbox",
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
                                             "id":"btnYes",
                                             "events":{"click":"__btnYes_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnYesSynchronise",
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
                                             "id":"btnNo",
                                             "events":{"click":"__btnNo_click"},
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "cacheAsBitmap":false,
                                                   "name":"btnNOSynchronise",
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
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml_____________assets_images_remotes_petit_skitter_png_470727833 = SkitterSynchronisePopup__embed_mxml_____________assets_images_remotes_petit_skitter_png_470727833;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 550;
         this.addEventListener("keyDown",this.___SkitterSynchronisePopup_CommonPopup1_keyDown);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         SkitterSynchronisePopup._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbTitle() : Text
      {
         return this._47374718lbTitle;
      }
      
      private function _SkitterSynchronisePopup_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            synchroniseVbox.verticalScrollPolicy = param1;
         },"synchroniseVbox.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            synchroniseVbox.horizontalScrollPolicy = param1;
         },"synchroniseVbox.horizontalScrollPolicy");
         result[1] = binding;
         return result;
      }
      
      private function _SkitterSynchronisePopup_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
      }
      
      public function set remote(param1:Skitter) : void
      {
         this._remote = param1;
         this.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get vsSynchroniseUI() : ViewStack
      {
         return this._2071701902vsSynchroniseUI;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:SkitterSynchronisePopup = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._SkitterSynchronisePopup_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_popup_SkitterSynchronisePopupWatcherSetupUtil");
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
      
      public function set lbTitle(param1:Text) : void
      {
         var _loc2_:Object = this._47374718lbTitle;
         if(_loc2_ !== param1)
         {
            this._47374718lbTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbTitle",_loc2_,param1));
         }
      }
      
      public function __btnYes_click(param1:MouseEvent) : void
      {
         this.btnYesClickHandler(param1);
      }
      
      public function set validateFunction(param1:Function) : void
      {
         this._validate = param1;
      }
      
      public function __btnNo_click(param1:MouseEvent) : void
      {
         this.btnNoClickHandler(param1);
      }
      
      private function btnYesClickHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:* = null;
         if(this._remote.currentKey2W)
         {
            InstallationService.instance.getInstallationByKey2W(this._remote.currentKey2W);
         }
         if(Boolean(InstallationService.instance.currentInstallation.actuators) && InstallationService.instance.currentInstallation.actuators.length == 0)
         {
            Application.application.mainUI.mainUIHeader.selectBtnInstallation();
         }
         if(ServerCommunicationManager.instance.skitterListEmpty != null && ServerCommunicationManager.instance.skitterListEmpty.length > 0)
         {
            ServerCommunicationManager.instance.addSkitterListToInstallation(ServerCommunicationManager.instance.skitterListEmpty);
         }
         InstallationService.instance.checkSkitterKeyAndAddToInstallIfNoPresent(this._remote);
         InstallationService.instance.updateDataModel(this._remote);
         if(this.skitterListToSynchronise != null)
         {
            if(this.skitterListToSynchronise.length == 1)
            {
               ServerCommunicationManager.instance.updateSkitEasyWithSkitterList(this.skitterListToSynchronise.pop());
            }
            else if(this.skitterListToSynchronise.length > 1)
            {
               ServerCommunicationManager.instance.updateSkitEasyWithSkitterList(this.skitterListToSynchronise.pop(),this.skitterListToSynchronise);
            }
         }
         this.closeHandler();
      }
      
      override protected function refreshUI() : void
      {
         super.refreshUI();
      }
      
      public function set vsSynchroniseUI(param1:ViewStack) : void
      {
         var _loc2_:Object = this._2071701902vsSynchroniseUI;
         if(_loc2_ !== param1)
         {
            this._2071701902vsSynchroniseUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vsSynchroniseUI",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         var _loc1_:String = null;
         if(this._remote != null && this._remote.name != null)
         {
            _loc1_ = this._remote.name;
         }
         else
         {
            _loc1_ = "";
         }
         if(this.lbTitle != null)
         {
            this.lbTitle.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_CONNECTED");
         }
         if(this.lbBody != null)
         {
            this.lbBody.htmlText = resourceManager.getString("system","MSG_REINIT_SKITTER_INFORMATION",[_loc1_]);
         }
         if(this.btnYes != null)
         {
            this.btnYes.label = resourceManager.getString("common","BTN_YES");
         }
         if(this.btnNo != null)
         {
            this.btnNo.label = resourceManager.getString("common","BTN_NO");
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbBody() : Text
      {
         return this._1110437832lbBody;
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         super.closeHandler(param1);
         var _loc2_:Boolean = false;
         if(this.skitterListToSynchronise != null)
         {
            if(this.skitterListToSynchronise.length == 0)
            {
               _loc2_ = true;
            }
         }
         else
         {
            _loc2_ = true;
         }
         if(_loc2_)
         {
            SkitterManager.instance.skitterConnectionAllowed = true;
            SkitterManager.instance.connectionProcessing();
            ServerCommunicationManager.instance.startConnectedDevicesListen();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get synchroniseVbox() : VBox
      {
         return this._1137878700synchroniseVbox;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNo() : Button
      {
         return this._94069053btnNo;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
      }
      
      public function set skitterListToSynchronise(param1:Array) : void
      {
         this._skitterListToSynchronise = param1;
      }
      
      public function get remote() : Skitter
      {
         return this._remote;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
      }
      
      protected function commonpopup1_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.btnYesClickHandler();
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.btnNoClickHandler();
         }
      }
      
      public function refresh() : void
      {
         this.initLabels();
      }
      
      public function ___SkitterSynchronisePopup_CommonPopup1_keyDown(param1:KeyboardEvent) : void
      {
         this.commonpopup1_keyDownHandler(param1);
      }
      
      public function set synchroniseVbox(param1:VBox) : void
      {
         var _loc2_:Object = this._1137878700synchroniseVbox;
         if(_loc2_ !== param1)
         {
            this._1137878700synchroniseVbox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"synchroniseVbox",_loc2_,param1));
         }
      }
      
      public function get skitterListToSynchronise() : Array
      {
         return this._skitterListToSynchronise;
      }
      
      public function set cancelFunction(param1:Function) : void
      {
         this._cancel = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYes() : Button
      {
         return this._1378816277btnYes;
      }
      
      public function set btnYes(param1:Button) : void
      {
         var _loc2_:Object = this._1378816277btnYes;
         if(_loc2_ !== param1)
         {
            this._1378816277btnYes = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYes",_loc2_,param1));
         }
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
      
      public function set btnNo(param1:Button) : void
      {
         var _loc2_:Object = this._94069053btnNo;
         if(_loc2_ !== param1)
         {
            this._94069053btnNo = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNo",_loc2_,param1));
         }
      }
      
      private function btnNoClickHandler(param1:MouseEvent = null) : void
      {
         this.closeHandler();
         DialogsManager.showSkitterReinitialisePopup(this._remote,null,this._skitterListToSynchronise);
      }
   }
}
