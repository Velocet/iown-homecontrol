package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.events.NavigationEvent;
   import com.scenarioLauncher.events.RemoteEvent;
   import com.scenarioLauncher.events.ScenarioEvent;
   import com.scenarioLauncher.managers.CookieManager;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.managers.UpdaterManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.views.common.CustomCanvas;
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
   import mx.containers.ViewStack;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.core.Application;
   import mx.core.SpriteAsset;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class MainUI extends CustomCanvas
   {
       
      
      private var _1983306276scenarioUI:com.scenarioLauncher.views.ScenariosUI;
      
      private var _1220932203helpUI:com.scenarioLauncher.views.QuestionsUI;
      
      private var _745618866installationUI:com.scenarioLauncher.views.InstallationUI;
      
      private var _1442797048mainUIFooter:com.scenarioLauncher.views.MainUIFooter;
      
      private var _embed_mxml__914773147:Class;
      
      private var _1395206406mainUIHeader:com.scenarioLauncher.views.MainUIHeader;
      
      private var _1703153366mainViewStack:ViewStack;
      
      private var _1878686492remoteConfigurationUI:com.scenarioLauncher.views.RemoteConfigurationUI;
      
      private var _1280545857remotesUI:com.scenarioLauncher.views.RemotesUI;
      
      private var _1278182195scenarioUpdateUI:com.scenarioLauncher.views.ScenarioUpdateUI;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function MainUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Label,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "text":"HOME  MOTION",
                        "styleName":"VB13BCLSm04",
                        "x":19,
                        "y":51
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "text":"BY",
                        "styleName":"VR12BC",
                        "x":131,
                        "y":52
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__914773147,
                        "name":"logo",
                        "x":175,
                        "y":32
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":com.scenarioLauncher.views.MainUIHeader,
                  "id":"mainUIHeader",
                  "stylesFactory":function():void
                  {
                     this.top = "0";
                     this.left = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"mainUIHeader",
                        "styleName":"mainUIHeader",
                        "percentWidth":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"mainViewStack",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"mainViewStack",
                        "percentWidth":100,
                        "percentHeight":100,
                        "x":29,
                        "y":152,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":com.scenarioLauncher.views.InstallationUI,
                           "id":"installationUI",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"installationUI",
                                 "styleName":"mainContent",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":com.scenarioLauncher.views.ScenariosUI,
                           "id":"scenarioUI",
                           "events":{"createScenarioManuallyClick":"__scenarioUI_createScenarioManuallyClick"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"scenarioUI",
                                 "styleName":"mainContent",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":com.scenarioLauncher.views.RemotesUI,
                           "id":"remotesUI",
                           "events":{"remoteEditionClick":"__remotesUI_remoteEditionClick"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"remotesUI",
                                 "styleName":"mainContent",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":com.scenarioLauncher.views.RemoteConfigurationUI,
                           "id":"remoteConfigurationUI",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"remoteConfigurationUI",
                                 "styleName":"mainContent",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":com.scenarioLauncher.views.ScenarioUpdateUI,
                           "id":"scenarioUpdateUI",
                           "events":{
                              "scenarioUpdateValidate":"__scenarioUpdateUI_scenarioUpdateValidate",
                              "scenarioUpdateCancel":"__scenarioUpdateUI_scenarioUpdateCancel"
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"scenarioUpdateUI",
                                 "styleName":"mainContent",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":com.scenarioLauncher.views.QuestionsUI,
                           "id":"helpUI",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"helpUI",
                                 "styleName":"questionsUI",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":com.scenarioLauncher.views.MainUIFooter,
                  "id":"mainUIFooter",
                  "stylesFactory":function():void
                  {
                     this.bottom = "0";
                     this.left = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"mainUIFooter",
                        "styleName":"mainUIFooter",
                        "percentWidth":100,
                        "height":55
                     };
                  }
               })]};
            }
         });
         this._embed_mxml__914773147 = MainUI__embed_mxml__914773147;
         super();
         mx_internal::_document = this;
      }
      
      public function __scenarioUpdateUI_scenarioUpdateValidate(param1:ScenarioEvent) : void
      {
         this.scenarioUpdateUIScenarioUpdateValidateHandler(param1);
      }
      
      public function set remotesUI(param1:com.scenarioLauncher.views.RemotesUI) : void
      {
         var _loc2_:Object = this._1280545857remotesUI;
         if(_loc2_ !== param1)
         {
            this._1280545857remotesUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remotesUI",_loc2_,param1));
         }
      }
      
      private function goToScenarioUI() : void
      {
         this.mainViewStack.selectedChild = this.scenarioUI;
         this.scenarioUI.currentScenario = null;
         this.scenarioUI.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get mainUIFooter() : com.scenarioLauncher.views.MainUIFooter
      {
         return this._1442797048mainUIFooter;
      }
      
      public function refreshScenario() : void
      {
         this.scenarioUI.refresh();
      }
      
      [Bindable(event="propertyChange")]
      public function get helpUI() : com.scenarioLauncher.views.QuestionsUI
      {
         return this._1220932203helpUI;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set scenarioUpdateUI(param1:com.scenarioLauncher.views.ScenarioUpdateUI) : void
      {
         var _loc2_:Object = this._1278182195scenarioUpdateUI;
         if(_loc2_ !== param1)
         {
            this._1278182195scenarioUpdateUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioUpdateUI",_loc2_,param1));
         }
      }
      
      public function set mainUIFooter(param1:com.scenarioLauncher.views.MainUIFooter) : void
      {
         var _loc2_:Object = this._1442797048mainUIFooter;
         if(_loc2_ !== param1)
         {
            this._1442797048mainUIFooter = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainUIFooter",_loc2_,param1));
         }
      }
      
      private function onCreateScenarioManuallyClickHandler(param1:ScenarioEvent) : void
      {
         this.mainViewStack.selectedChild = this.scenarioUpdateUI;
         this.scenarioUpdateUI.currentScenario = param1.scenario;
      }
      
      public function set installationUI(param1:com.scenarioLauncher.views.InstallationUI) : void
      {
         var _loc2_:Object = this._745618866installationUI;
         if(_loc2_ !== param1)
         {
            this._745618866installationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"installationUI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioUI() : com.scenarioLauncher.views.ScenariosUI
      {
         return this._1983306276scenarioUI;
      }
      
      public function __scenarioUpdateUI_scenarioUpdateCancel(param1:ScenarioEvent) : void
      {
         this.scenarioUpdateUIScenarioUpdateCancelHandler(param1);
      }
      
      private function navigateToQuestionsHandler(param1:NavigationEvent) : void
      {
      }
      
      public function set helpUI(param1:com.scenarioLauncher.views.QuestionsUI) : void
      {
         var _loc2_:Object = this._1220932203helpUI;
         if(_loc2_ !== param1)
         {
            this._1220932203helpUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpUI",_loc2_,param1));
         }
      }
      
      public function set remoteConfigurationUI(param1:com.scenarioLauncher.views.RemoteConfigurationUI) : void
      {
         var _loc2_:Object = this._1878686492remoteConfigurationUI;
         if(_loc2_ !== param1)
         {
            this._1878686492remoteConfigurationUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteConfigurationUI",_loc2_,param1));
         }
      }
      
      private function goToInstallationUI() : void
      {
         this.mainViewStack.selectedChild = this.installationUI;
      }
      
      public function refreshInstallation() : void
      {
         this.installationUI.refresh();
         InstallationService.instance.refreshActivateDevice();
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.displayUpdateSuccess();
         addEventListener(MouseEvent.MOUSE_DOWN,this.startMove,false,0,true);
         this.helpUI.addEventListener(NavigationEvent.NAVIGATE_TO_QUESTIONS,this.navigateToQuestionsHandler);
         this.helpUI.addEventListener(NavigationEvent.NAVIGATE_TO_MYSPACE,this.navigateToMyspaceHandler);
         ServerCommunicationManager.instance.startIoServiceLayer();
      }
      
      [Bindable(event="propertyChange")]
      public function get mainViewStack() : ViewStack
      {
         return this._1703153366mainViewStack;
      }
      
      public function set scenarioUI(param1:com.scenarioLauncher.views.ScenariosUI) : void
      {
         var _loc2_:Object = this._1983306276scenarioUI;
         if(_loc2_ !== param1)
         {
            this._1983306276scenarioUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioUI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remotesUI() : com.scenarioLauncher.views.RemotesUI
      {
         return this._1280545857remotesUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioUpdateUI() : com.scenarioLauncher.views.ScenarioUpdateUI
      {
         return this._1278182195scenarioUpdateUI;
      }
      
      protected function scenarioUpdateUIScenarioUpdateValidateHandler(param1:ScenarioEvent) : void
      {
         this.mainViewStack.selectedChild = this.scenarioUI;
         this.scenarioUI.refresh();
      }
      
      override protected function onInitialize(param1:FlexEvent) : void
      {
         super.onInitialize(param1);
         this.mainUIHeader.navigateToInstallation = this.goToInstallationUI;
         this.mainUIHeader.navigateToScenarios = this.goToScenarioUI;
         this.mainUIHeader.navigateToRemotesControl = this.goToRemotesUI;
         this.mainUIHeader.navigateToHelp = this.goToHelpUI;
      }
      
      private function startMove(param1:MouseEvent) : void
      {
         if(!(param1.target is SpriteAsset))
         {
            if(param1.target.hasOwnProperty("document") && param1.target.document is MainUI)
            {
               Application.application.nativeWindow.startMove();
            }
         }
      }
      
      public function set mainViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1703153366mainViewStack;
         if(_loc2_ !== param1)
         {
            this._1703153366mainViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStack",_loc2_,param1));
         }
      }
      
      private function onRemoteControlEditionClickHandler(param1:RemoteEvent) : void
      {
         this.mainViewStack.selectedChild = this.remoteConfigurationUI;
         this.remoteConfigurationUI.currentSkitter = param1.skitterControl;
      }
      
      private function displayUpdateSuccess() : void
      {
         var _loc3_:UpdateUI = null;
         var _loc1_:Number = Number(CookieManager.instance.skiteasyVersion);
         var _loc2_:Number = Number(UpdaterManager.getAppVersion());
         if(CookieManager.instance.skiteasyUpdateSuccess && _loc2_ > _loc1_)
         {
            CookieManager.instance.resetAndSave();
            _loc3_ = new UpdateUI();
            _loc3_.isSkitEasyUpdateSuccess = true;
            KCPopupManager.singleton.displayPopup(_loc3_,60);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get installationUI() : com.scenarioLauncher.views.InstallationUI
      {
         return this._745618866installationUI;
      }
      
      protected function scenarioUpdateUIScenarioUpdateCancelHandler(param1:ScenarioEvent) : void
      {
         this.mainViewStack.selectedChild = this.scenarioUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteConfigurationUI() : com.scenarioLauncher.views.RemoteConfigurationUI
      {
         return this._1878686492remoteConfigurationUI;
      }
      
      public function __scenarioUI_createScenarioManuallyClick(param1:ScenarioEvent) : void
      {
         this.onCreateScenarioManuallyClickHandler(param1);
      }
      
      public function set mainUIHeader(param1:com.scenarioLauncher.views.MainUIHeader) : void
      {
         var _loc2_:Object = this._1395206406mainUIHeader;
         if(_loc2_ !== param1)
         {
            this._1395206406mainUIHeader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainUIHeader",_loc2_,param1));
         }
      }
      
      public function __remotesUI_remoteEditionClick(param1:RemoteEvent) : void
      {
         this.onRemoteControlEditionClickHandler(param1);
      }
      
      private function goToHelpUI() : void
      {
         this.mainViewStack.selectedChild = this.helpUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get mainUIHeader() : com.scenarioLauncher.views.MainUIHeader
      {
         return this._1395206406mainUIHeader;
      }
      
      private function navigateToMyspaceHandler(param1:NavigationEvent) : void
      {
         var _loc2_:URLRequest = null;
         _loc2_ = new URLRequest();
         _loc2_.url = resourceManager.getString("system","SOMFY_WEBSITE_URL");
         if(!_loc2_.url)
         {
            _loc2_.url = Globals.SOMFY_WEBSITE__DEFAULT_URL;
         }
         navigateToURL(_loc2_);
      }
      
      private function goToRemotesUI() : void
      {
         this.mainViewStack.selectedChild = this.remotesUI;
         this.remotesUI.remoteSelected = null;
         this.remotesUI.refresh();
         this.remoteConfigurationUI.resetData();
      }
   }
}
