package com.scenarioLauncher.views
{
   import com.keepcore.KCBoxNavigation;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.business.SkitterManager;
   import com.scenarioLauncher.components.ButtonCombo;
   import com.scenarioLauncher.components.CustomTab;
   import com.scenarioLauncher.components.SLComboBox;
   import com.scenarioLauncher.configuration.BundleManager;
   import com.scenarioLauncher.configuration.Languages;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.views.common.CustomCanvas;
   import com.scenarioLauncher.views.renderers.ActuatorsTileListRenderer;
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
   import ioService.datamodel.Installation;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.resources.ResourceManager;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   import org.efflex.mx.viewStackEffects.List;
   
   public class InstallationUI extends CustomCanvas implements IBindingClient
   {
      
      private static var askForIOHomecontrolUIPopup:com.scenarioLauncher.views.AskForIOHomecontrolUI = new com.scenarioLauncher.views.AskForIOHomecontrolUI();
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1306084975effect:List;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _82206588incompletePictoImg:Image;
      
      mx_internal var _watchers:Array;
      
      private var _2139752276systemComboBox:SLComboBox;
      
      private var _1757514165installationUIContent:CustomCanvas;
      
      private var _29414044_languages:Array;
      
      private var _1285064941_systemLabels:Array;
      
      private var _1811382319msgInstallationUI:Text;
      
      private var _embed_mxml__2053583044:Class;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1581914427actuatorsBoxNavigation:KCBoxNavigation;
      
      private var _1413827944languagesComboBox:SLComboBox;
      
      private var _71024319incompleteInstallBtn:Button;
      
      private var _1605496787mainVBInstallationUI:VBox;
      
      mx_internal var _bindings:Array;
      
      private var _993869005installationUITabLabel:CustomTab;
      
      public function InstallationUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "id":"mainVBInstallationUI",
                  "stylesFactory":function():void
                  {
                     this.verticalGap = 0;
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"mainVBInstallationUI",
                        "width":963,
                        "minHeight":280,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":CustomTab,
                           "id":"installationUITabLabel",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"installationUITabLabel",
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":CustomCanvas,
                           "id":"installationUIContent",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"installationUIContent",
                                 "styleName":"installationUIContent",
                                 "useCustomCanvasSkin":true,
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "maxHeight":387,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"msgInstallationUI",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"msgInstallationUI",
                                          "x":18,
                                          "y":11,
                                          "percentWidth":100,
                                          "visible":false
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":KCBoxNavigation,
                                    "id":"actuatorsBoxNavigation",
                                    "stylesFactory":function():void
                                    {
                                       this.paddingLeft = 18;
                                       this.paddingRight = 18;
                                       this.paddingTop = 49;
                                       this.paddingBottom = 29;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "x":8,
                                          "y":0,
                                          "itemHorizontalGap":13,
                                          "itemVerticalGap":19,
                                          "previousButtonBarThickness":40,
                                          "itemWidth":107,
                                          "itemHeight":150,
                                          "rowCount":2,
                                          "columnCount":7,
                                          "itemRenderer":ActuatorsTileListRenderer,
                                          "previousButtonStyleName":"previousButtonStyle",
                                          "nextButtonStyleName":"nextButtonStyle"
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"incompletePictoImg",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__2053583044,
                        "name":"incompletePicto",
                        "x":21,
                        "y":492
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"incompleteInstallBtn",
                  "events":{"click":"__incompleteInstallBtn_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"incompleteInstallBtn",
                        "styleName":"btnValidate",
                        "buttonMode":true,
                        "useHandCursor":true,
                        "x":74,
                        "y":490,
                        "minWidth":205,
                        "height":24
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "events":{"click":"___InstallationUI_Button2_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "includeInLayout":false,
                        "label":"TEST"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":SLComboBox,
                  "id":"systemComboBox",
                  "events":{"change":"__systemComboBox_change"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":240,
                        "height":30,
                        "x":516,
                        "y":566,
                        "name":"systemComboBox",
                        "styleName":"comboBox",
                        "highLightSelectedItem":false,
                        "iconSystemVisible":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":SLComboBox,
                  "id":"languagesComboBox",
                  "events":{"change":"__languagesComboBox_change"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":192,
                        "height":30,
                        "x":765,
                        "y":566,
                        "name":"languagesComboBox",
                        "styleName":"comboBox",
                        "highLightSelectedItem":true
                     };
                  }
               })]};
            }
         });
         this._embed_mxml__2053583044 = InstallationUI__embed_mxml__2053583044;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this._InstallationUI_List1_i();
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         InstallationUI._watcherSetupUtil = param1;
      }
      
      public function set msgInstallationUI(param1:Text) : void
      {
         var _loc2_:Object = this._1811382319msgInstallationUI;
         if(_loc2_ !== param1)
         {
            this._1811382319msgInstallationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgInstallationUI",_loc2_,param1));
         }
      }
      
      public function set languagesComboBox(param1:SLComboBox) : void
      {
         var _loc2_:Object = this._1413827944languagesComboBox;
         if(_loc2_ !== param1)
         {
            this._1413827944languagesComboBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languagesComboBox",_loc2_,param1));
         }
      }
      
      private function askForIOHomecontrol(param1:String = null) : void
      {
         askForIOHomecontrolUIPopup.step = param1;
         askForIOHomecontrolUIPopup.msgInstallationUI = this.msgInstallationUI;
         KCPopupManager.singleton.displayPopup(askForIOHomecontrolUIPopup);
      }
      
      public function set actuatorsBoxNavigation(param1:KCBoxNavigation) : void
      {
         var _loc2_:Object = this._1581914427actuatorsBoxNavigation;
         if(_loc2_ !== param1)
         {
            this._1581914427actuatorsBoxNavigation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorsBoxNavigation",_loc2_,param1));
         }
      }
      
      private function _InstallationUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ServerCommunicationManager.instance.actuatorsList;
         _loc1_ = new Point(-10,-33);
         _loc1_ = new Point(-4,-33);
         _loc1_ = ButtonCombo.LARGE;
         _loc1_ = this._systemLabels;
         _loc1_ = [this.languagesComboBox];
         _loc1_ = ButtonCombo.SMALL;
         _loc1_ = this._languages;
         _loc1_ = [this.systemComboBox];
      }
      
      [Bindable(event="propertyChange")]
      public function get effect() : List
      {
         return this._1306084975effect;
      }
      
      private function setSelectedLanguage() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._languages)
         {
            if(_loc1_.value == Globals.locale)
            {
               this.languagesComboBox.selectedItem = _loc1_;
            }
         }
      }
      
      public function openReinitializeSkittersUI() : void
      {
         var _loc1_:ReinitializeSkittersUI = null;
         Globals.SYNCHRO_LOCKED = true;
         _loc1_ = new ReinitializeSkittersUI();
         KCPopupManager.singleton.displayPopup(_loc1_);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:InstallationUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._InstallationUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_InstallationUIWatcherSetupUtil");
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
      
      public function openGiveSecurityKeyUI() : void
      {
         var _loc1_:GiveSecurityKeyUI = null;
         _loc1_ = new GiveSecurityKeyUI();
         KCPopupManager.singleton.displayPopup(_loc1_);
      }
      
      public function openReceiveSecurityKeyUI() : void
      {
         var _loc1_:ReceiveSecurityKeyUI = null;
         _loc1_ = new ReceiveSecurityKeyUI();
         KCPopupManager.singleton.displayPopup(_loc1_);
      }
      
      [Bindable(event="propertyChange")]
      public function get languagesComboBox() : SLComboBox
      {
         return this._1413827944languagesComboBox;
      }
      
      public function ___InstallationUI_Button2_click(param1:MouseEvent) : void
      {
         this.testHelpUI();
      }
      
      public function set installationUITabLabel(param1:CustomTab) : void
      {
         var _loc2_:Object = this._993869005installationUITabLabel;
         if(_loc2_ !== param1)
         {
            this._993869005installationUITabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installationUITabLabel",_loc2_,param1));
         }
      }
      
      public function set effect(param1:List) : void
      {
         var _loc2_:Object = this._1306084975effect;
         if(_loc2_ !== param1)
         {
            this._1306084975effect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _languages() : Array
      {
         return this._29414044_languages;
      }
      
      public function __languagesComboBox_change(param1:ListEvent) : void
      {
         this.onLanguagesChangeHandler(param1);
      }
      
      private function showIncompleteInstallationButton() : void
      {
         this.incompletePictoImg.visible = true;
         this.incompleteInstallBtn.visible = true;
      }
      
      [Bindable(event="propertyChange")]
      public function get incompletePictoImg() : Image
      {
         return this._82206588incompletePictoImg;
      }
      
      private function OnFaultEventInstallationUICallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      private function _InstallationUI_List1_i() : List
      {
         var _loc1_:List = new List();
         this.effect = _loc1_;
         _loc1_.modal = true;
         _loc1_.popUp = false;
         _loc1_.modalTransparency = 0;
         _loc1_.modalTransparencyBlur = 0;
         _loc1_.duration = 1000;
         _loc1_.transparent = true;
         return _loc1_;
      }
      
      protected function onSystemChangeHandler(param1:ListEvent) : void
      {
         var _loc3_:Function = null;
         var _loc2_:String = String(((param1.target as SLComboBox).selectedItem as Object).value);
         switch(_loc2_)
         {
            case "give_key":
               _loc3_ = this.openGiveSecurityKeyUI;
               break;
            case "generate_key":
               _loc3_ = this.openGenerateSecurityKeyUI;
               break;
            case "receive_key":
               _loc3_ = this.openReceiveSecurityKeyUI;
               break;
            case "reinit_skiteasy":
               _loc3_ = this.openReinitializeSkitEasyUI;
               break;
            case "reinit_skitters":
               _loc3_ = this.openReinitializeSkittersUI;
         }
         if(false)
         {
            DialogsManager.showMaintenanceConnexionPopup(_loc3_);
         }
         else
         {
            _loc3_();
         }
      }
      
      public function set installationUIContent(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._1757514165installationUIContent;
         if(_loc2_ !== param1)
         {
            this._1757514165installationUIContent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installationUIContent",_loc2_,param1));
         }
      }
      
      private function activateAutoScroll() : void
      {
         this.actuatorsBoxNavigation.autoScroll = true;
      }
      
      public function openGenerateSecurityKeyUI() : void
      {
         var _loc1_:GenerateSecurityKeyUI = null;
         _loc1_ = new GenerateSecurityKeyUI();
         KCPopupManager.singleton.displayPopup(_loc1_);
      }
      
      public function set mainVBInstallationUI(param1:VBox) : void
      {
         var _loc2_:Object = this._1605496787mainVBInstallationUI;
         if(_loc2_ !== param1)
         {
            this._1605496787mainVBInstallationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainVBInstallationUI",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         this._languages = BundleManager.bundleManager.getAvailableLocales();
         this.languagesComboBox.prompt = resourceManager.getString("common","BTN_LANGUES");
         this.systemComboBox.prompt = resourceManager.getString("common","BTN_SYSTEM");
         this._systemLabels = new Array();
         this._systemLabels.push({
            "label":resourceManager.getString("system","MSG_GIVE_SECURITY_KEY_TITLE"),
            "value":"give_key"
         });
         this._systemLabels.push({
            "label":resourceManager.getString("system","MSG_GENERATE_KEY_TITLE"),
            "value":"generate_key"
         });
         this._systemLabels.push({
            "label":resourceManager.getString("system","MSG_RECEIVE_KEY_TITLE"),
            "value":"receive_key"
         });
         this._systemLabels.push({
            "label":resourceManager.getString("system","MSG_REINIT_SKITEASY_TITLE"),
            "value":"reinit_skiteasy"
         });
         if(this.installationUIContent != null)
         {
            this.installationUITabLabel.tabLabel = resourceManager.getString("installation","INSTALLATION_TITLE");
         }
         if(ServerCommunicationManager.instance.connectedDevice.length > 0 && InstallationService.instance.currentInstallation != null)
         {
            if(this.msgInstallationUI != null)
            {
               this.msgInstallationUI.htmlText = resourceManager.getString("installation","MSG_INTERACT_WITH_ACTUATORS");
            }
         }
         else if(this.msgInstallationUI != null)
         {
            this.msgInstallationUI.htmlText = resourceManager.getString("installation","MSG_PLEASE_PLUG_SKITTY");
         }
         if(this.incompleteInstallBtn != null)
         {
            this.incompleteInstallBtn.label = resourceManager.getString("installation","BTN_INSTALL_INCOMPLETE");
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.initializeInstallation();
         this.setSelectedLanguage();
         this.refresh();
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventInstallationUICallBack);
      }
      
      private function set _languages(param1:Array) : void
      {
         var _loc2_:Object = this._29414044_languages;
         if(_loc2_ !== param1)
         {
            this._29414044_languages = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_languages",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get msgInstallationUI() : Text
      {
         return this._1811382319msgInstallationUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get incompleteInstallBtn() : Button
      {
         return this._71024319incompleteInstallBtn;
      }
      
      public function __systemComboBox_change(param1:ListEvent) : void
      {
         this.onSystemChangeHandler(param1);
      }
      
      public function openReinitializeSkitEasyUI() : void
      {
         var _loc1_:ReinitializeSkitEasyUI = null;
         Globals.SYNCHRO_LOCKED = true;
         _loc1_ = new ReinitializeSkitEasyUI();
         KCPopupManager.singleton.displayPopup(_loc1_);
      }
      
      private function testHelpUI() : void
      {
         var _loc1_:Remote1WHelpAdvancedUI = null;
         _loc1_ = new Remote1WHelpAdvancedUI();
         KCPopupManager.singleton.displayPopup(_loc1_);
      }
      
      [Bindable(event="propertyChange")]
      public function get installationUITabLabel() : CustomTab
      {
         return this._993869005installationUITabLabel;
      }
      
      [Bindable(event="propertyChange")]
      public function get systemComboBox() : SLComboBox
      {
         return this._2139752276systemComboBox;
      }
      
      [Bindable(event="propertyChange")]
      public function get installationUIContent() : CustomCanvas
      {
         return this._1757514165installationUIContent;
      }
      
      [Bindable(event="propertyChange")]
      public function get mainVBInstallationUI() : VBox
      {
         return this._1605496787mainVBInstallationUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorsBoxNavigation() : KCBoxNavigation
      {
         return this._1581914427actuatorsBoxNavigation;
      }
      
      public function refresh() : void
      {
         if(ServerCommunicationManager.instance.connectedDevice.length > 0 && Boolean(InstallationService.instance.currentInstallation))
         {
            this.showIncompleteInstallationButton();
         }
         else
         {
            this.hideIncompleteInstallationButton();
         }
         this.msgInstallationUI.visible = true;
         this.initLabels();
      }
      
      private function _InstallationUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():ArrayCollection
         {
            return ServerCommunicationManager.instance.actuatorsList;
         },function(param1:ArrayCollection):void
         {
            actuatorsBoxNavigation.dataProvider = param1;
         },"actuatorsBoxNavigation.dataProvider");
         result[0] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(-10,-33);
         },function(param1:Point):void
         {
            actuatorsBoxNavigation.previousButtonPosition = param1;
         },"actuatorsBoxNavigation.previousButtonPosition");
         result[1] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(-4,-33);
         },function(param1:Point):void
         {
            actuatorsBoxNavigation.nextButtonPosition = param1;
         },"actuatorsBoxNavigation.nextButtonPosition");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ButtonCombo.LARGE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            systemComboBox.type = param1;
         },"systemComboBox.type");
         result[3] = binding;
         binding = new Binding(this,function():Object
         {
            return _systemLabels;
         },function(param1:Object):void
         {
            systemComboBox.dataProvider = param1;
         },"systemComboBox.dataProvider");
         result[4] = binding;
         binding = new Binding(this,function():Array
         {
            return [languagesComboBox];
         },function(param1:Array):void
         {
            systemComboBox.comboToClose = param1;
         },"systemComboBox.comboToClose");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ButtonCombo.SMALL;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            languagesComboBox.type = param1;
         },"languagesComboBox.type");
         result[6] = binding;
         binding = new Binding(this,function():Object
         {
            return _languages;
         },function(param1:Object):void
         {
            languagesComboBox.dataProvider = param1;
         },"languagesComboBox.dataProvider");
         result[7] = binding;
         binding = new Binding(this,function():Array
         {
            return [systemComboBox];
         },function(param1:Array):void
         {
            languagesComboBox.comboToClose = param1;
         },"languagesComboBox.comboToClose");
         result[8] = binding;
         return result;
      }
      
      public function refreshDiscover() : void
      {
         if(ServerCommunicationManager.instance.connectedDevice.length > 0 && InstallationService.instance.currentInstallation && InstallationService.instance.currentInstallation.actuators.length == 0)
         {
            if(Globals.instance.installationState == null)
            {
               this.askForIOHomecontrol();
               askForIOHomecontrolUIPopup.startDiscover();
               Globals.instance.installationState = Globals.STEP1_DISCOVER_ACTUATOR;
            }
         }
      }
      
      private function onLanguagesChangeHandler(param1:ListEvent) : void
      {
         var _loc2_:String = String(((param1.target as SLComboBox).selectedItem as Object).value);
         ResourceManager.getInstance().localeChain = [_loc2_];
         ResourceManager.getInstance().update();
         Globals.locale = _loc2_;
         Languages.instance.saveLanguage(_loc2_);
      }
      
      public function set systemComboBox(param1:SLComboBox) : void
      {
         var _loc2_:Object = this._2139752276systemComboBox;
         if(_loc2_ !== param1)
         {
            this._2139752276systemComboBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"systemComboBox",_loc2_,param1));
         }
      }
      
      public function initializeInstallation() : void
      {
         this.actuatorsBoxNavigation.autoScroll = false;
         Globals.instance.installationState = null;
         this.hideIncompleteInstallationButton();
         this.msgInstallationUI.visible = true;
         InstallationService.instance.currentInstallation = null;
         InstallationService.instance.installations = InstallationService.instance.returnAll();
         if(InstallationService.instance.installations.length > 0)
         {
            InstallationService.instance.currentInstallation = InstallationService.instance.installations[0];
         }
         else
         {
            InstallationService.instance.currentInstallation = new Installation();
         }
         callLater(this.activateAutoScroll);
      }
      
      public function __incompleteInstallBtn_click(param1:MouseEvent) : void
      {
         this.onInstallIncompleteClickHandler(param1);
      }
      
      private function set _systemLabels(param1:Array) : void
      {
         var _loc2_:Object = this._1285064941_systemLabels;
         if(_loc2_ !== param1)
         {
            this._1285064941_systemLabels = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_systemLabels",_loc2_,param1));
         }
      }
      
      private function hideIncompleteInstallationButton() : void
      {
         this.incompletePictoImg.visible = false;
         this.incompleteInstallBtn.visible = false;
      }
      
      [Bindable(event="propertyChange")]
      private function get _systemLabels() : Array
      {
         return this._1285064941_systemLabels;
      }
      
      public function set incompletePictoImg(param1:Image) : void
      {
         var _loc2_:Object = this._82206588incompletePictoImg;
         if(_loc2_ !== param1)
         {
            this._82206588incompletePictoImg = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incompletePictoImg",_loc2_,param1));
         }
      }
      
      private function onInstallIncompleteClickHandler(param1:MouseEvent) : void
      {
         SkitterManager.instance.skitterConnectionAllowed = false;
         if(ServerCommunicationManager.instance.actuatorsList != null && ServerCommunicationManager.instance.actuatorsList.length == 0 && Globals.instance.installationState == null)
         {
            this.askForIOHomecontrol();
            askForIOHomecontrolUIPopup.startDiscover();
            Globals.instance.installationState = Globals.STEP1_DISCOVER_ACTUATOR;
         }
         else if(ServerCommunicationManager.instance.actuatorsList != null && ServerCommunicationManager.instance.actuatorsList.length > 0 && Globals.instance.installationState == null)
         {
            this.askForIOHomecontrol(Globals.STEP1_DISCOVER_ACTUATOR);
            Globals.instance.installationState = Globals.STEP1_DISCOVER_ACTUATOR;
            askForIOHomecontrolUIPopup.startDiscover();
         }
         else if(Globals.instance.installationState == Globals.STEP1_DISCOVER_ACTUATOR)
         {
            Globals.answerNoFor1W = false;
            this.askForIOHomecontrol(Globals.STEP1_DISCOVER_ACTUATOR);
            askForIOHomecontrolUIPopup.startDiscover();
            Globals.instance.installationState = Globals.STEP2_DISCOVER_ACTUATOR;
         }
         else if(Globals.instance.installationState == Globals.STEP2_DISCOVER_ACTUATOR)
         {
            this.askForIOHomecontrol(Globals.STEP2_DISCOVER_ACTUATOR);
            askForIOHomecontrolUIPopup.startDiscover();
            Globals.instance.installationState = Globals.STEP3_DISCOVER_ACTUATOR;
         }
         else if(Globals.instance.installationState == Globals.STEP3_DISCOVER_ACTUATOR)
         {
            this.askForIOHomecontrol(Globals.STEP3_DISCOVER_ACTUATOR);
            askForIOHomecontrolUIPopup.startDiscover();
            Globals.instance.installationState = Globals.STEP1_DISCOVER_ACTUATOR;
         }
         else if(Globals.instance.installationState == Globals.STEP4_DISCOVER_ACTUATOR)
         {
            this.askForIOHomecontrol(Globals.STEP4_DISCOVER_ACTUATOR);
            askForIOHomecontrolUIPopup.startDiscover();
            Globals.instance.installationState = Globals.STEP4_DISCOVER_ACTUATOR;
         }
      }
      
      public function set incompleteInstallBtn(param1:Button) : void
      {
         var _loc2_:Object = this._71024319incompleteInstallBtn;
         if(_loc2_ !== param1)
         {
            this._71024319incompleteInstallBtn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"incompleteInstallBtn",_loc2_,param1));
         }
      }
   }
}
