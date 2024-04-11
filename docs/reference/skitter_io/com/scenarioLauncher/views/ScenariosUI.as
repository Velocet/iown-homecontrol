package com.scenarioLauncher.views
{
   import com.keepcore.KCBoxNavigation;
   import com.keepcore.KCBoxNavigationEvent;
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.components.CustomTab;
   import com.scenarioLauncher.components.ScenarioCanvas;
   import com.scenarioLauncher.events.ScenarioEvent;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.services.ScenarioService;
   import com.scenarioLauncher.views.common.CustomCanvas;
   import com.scenarioLauncher.views.renderers.ScenarioTileListRenderer;
   import com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorStateTileListRenderer;
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
   import ioService.datamodel.Situation;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Text;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.codec.PNGEncoder;
   import mx.styles.*;
   import mx.utils.StringUtil;
   
   public class ScenariosUI extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _95084086scenariosUITabLabel:CustomTab;
      
      private var _242588431scenarioUIUpdateBtn:Button;
      
      private var _1342433544scenarioCanvas:ScenarioCanvas;
      
      private var _2000476846mainVBScenariosUI:VBox;
      
      private var _1833077485scenarioUIDeleteBtn:Button;
      
      private var _1420202586scenarioUITestBtn:Button;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _959803365_actuators:ArrayCollection;
      
      private var _1238151860createNewScenario:Button;
      
      private var _201643437_arrowPosition:Point;
      
      private var _483578486msgScenariosUI:Text;
      
      private var _createScenarioChooseMode:com.scenarioLauncher.views.CreateScenarioChooseModeUI;
      
      private var _696838287scenarioBoxNavigation:KCBoxNavigation;
      
      private var _816675902scenariosUIContent:CustomCanvas;
      
      mx_internal var _watchers:Array;
      
      private var _1320492339msgCreateNewScenario:Text;
      
      private var _scenarioListIndex:uint = 0;
      
      private var _878621077scenarioUIDuplicateBtn:Button;
      
      private var _221798890_currentScenario:Scenario;
      
      private var _guiInitialized:Boolean = false;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public var _ScenariosUI_KCBoxNavigation2:KCBoxNavigation;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ScenariosUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {
                  "creationPolicy":"all",
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "id":"mainVBScenariosUI",
                     "stylesFactory":function():void
                     {
                        this.verticalGap = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "name":"mainVBScenariosUI",
                           "width":963,
                           "height":232,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":CustomTab,
                              "id":"scenariosUITabLabel",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"scenariosUITabLabel",
                                    "percentWidth":100
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":CustomCanvas,
                              "id":"scenariosUIContent",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"scenariosUIContent",
                                    "styleName":"scenariosListUIContent",
                                    "useCustomCanvasSkin":true,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "y":20,
                                    "creationPolicy":"all",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"msgScenariosUI",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"msgScenariosUI",
                                             "x":19,
                                             "y":11,
                                             "percentWidth":100
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":KCBoxNavigation,
                                       "id":"scenarioBoxNavigation",
                                       "events":{"itemClick":"__scenarioBoxNavigation_itemClick"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":38,
                                             "y":48,
                                             "width":730,
                                             "rowCount":1,
                                             "columnCount":7,
                                             "itemWidth":96,
                                             "itemHeight":120,
                                             "itemRenderer":ScenarioTileListRenderer,
                                             "previousButtonStyleName":"smallPreviousButtonStyle",
                                             "nextButtonStyleName":"smallNextButtonStyle"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"createNewScenario",
                                       "events":{"click":"__createNewScenario_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"createNewScenario",
                                             "styleName":"create",
                                             "buttonMode":true,
                                             "useHandCursor":true,
                                             "x":819,
                                             "y":49
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"msgCreateNewScenario",
                                       "events":{"click":"__msgCreateNewScenario_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"msgCreateNewScenario",
                                             "styleName":"VRI12YCL0",
                                             "useHandCursor":true,
                                             "buttonMode":true,
                                             "mouseChildren":false,
                                             "y":130
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":ScenarioCanvas,
                     "id":"scenarioCanvas",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "name":"scenarioCanvas",
                           "styleName":"scenarioCanvas",
                           "visible":false,
                           "y":232,
                           "width":963,
                           "height":312,
                           "creationPolicy":"all",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":KCBoxNavigation,
                              "id":"_ScenariosUI_KCBoxNavigation2",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "rowCount":1,
                                    "columnCount":7,
                                    "itemWidth":80,
                                    "x":22,
                                    "y":48,
                                    "width":845,
                                    "previousButtonBarThickness":40,
                                    "itemHorizontalGap":16,
                                    "itemHeight":120,
                                    "itemRenderer":ScenarioUpdateActuatorStateTileListRenderer,
                                    "previousButtonStyleName":"previousButtonStyle",
                                    "nextButtonStyleName":"nextButtonStyle"
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"scenarioUITestBtn",
                              "events":{"click":"__scenarioUITestBtn_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "name":"scenarioUITestBtn",
                                    "x":75,
                                    "y":264,
                                    "width":113,
                                    "styleName":"btnValidate",
                                    "buttonMode":true,
                                    "useHandCursor":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"scenarioUIUpdateBtn",
                              "events":{"click":"__scenarioUIUpdateBtn_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "name":"scenarioUIUpdateBtn",
                                    "x":204,
                                    "y":264,
                                    "width":113,
                                    "styleName":"btnValidate",
                                    "buttonMode":true,
                                    "useHandCursor":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"scenarioUIDuplicateBtn",
                              "events":{"click":"__scenarioUIDuplicateBtn_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "name":"scenarioUIDuplicateBtn",
                                    "x":334,
                                    "y":264,
                                    "width":113,
                                    "styleName":"btnValidate",
                                    "buttonMode":true,
                                    "useHandCursor":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"scenarioUIDeleteBtn",
                              "events":{"click":"__scenarioUIDeleteBtn_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "name":"scenarioUIDeleteBtn",
                                    "x":503,
                                    "y":264,
                                    "width":113,
                                    "styleName":"btnCancel",
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
         });
         this._959803365_actuators = new ArrayCollection();
         this._201643437_arrowPosition = new Point(-100,-100);
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.creationPolicy = "all";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ScenariosUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioCanvas() : ScenarioCanvas
      {
         return this._1342433544scenarioCanvas;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioUIUpdateBtn() : Button
      {
         return this._242588431scenarioUIUpdateBtn;
      }
      
      public function set scenarioCanvas(param1:ScenarioCanvas) : void
      {
         var _loc2_:Object = this._1342433544scenarioCanvas;
         if(_loc2_ !== param1)
         {
            this._1342433544scenarioCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioCanvas",_loc2_,param1));
         }
      }
      
      protected function onScenarioUIDuplicateBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc7_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc2_:DuplicateScenarioUI = new DuplicateScenarioUI();
         var _loc3_:Scenario = this._currentScenario.duplicate();
         _loc2_.duplicatedScenarioID = this._currentScenario.id;
         var _loc4_:String = _loc3_.name;
         var _loc5_:RegExp = /(.)*([0-9]+)^/;
         var _loc6_:int = 1;
         if(_loc5_.test(_loc3_.name))
         {
            _loc9_ = _loc3_.name.lastIndexOf("(");
            _loc10_ = _loc3_.name.lastIndexOf(")");
            _loc4_ = StringUtil.trim(_loc3_.name.substr(0,_loc9_));
            _loc6_ = parseInt(_loc3_.name.substr(_loc9_ + 1,_loc10_ - _loc9_ - 1));
         }
         var _loc8_:Boolean = true;
         while(_loc8_)
         {
            _loc7_ = _loc4_ + " (" + (_loc6_ + 1) + ")";
            _loc8_ = false;
            for each(_loc11_ in ServerCommunicationManager.instance.scenariosList)
            {
               if(_loc11_.name == _loc7_)
               {
                  _loc8_ = true;
                  _loc6_++;
                  break;
               }
            }
         }
         _loc3_.name = _loc7_;
         _loc2_.scenario = _loc3_;
         _loc2_.addEventListener(ScenarioEvent.SCENARIO_UPDATE_VALIDATE,this.scenarioDuplicationSaveHandler);
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      private function get _actuators() : ArrayCollection
      {
         return this._959803365_actuators;
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
      
      public function set scenarioUIUpdateBtn(param1:Button) : void
      {
         var _loc2_:Object = this._242588431scenarioUIUpdateBtn;
         if(_loc2_ !== param1)
         {
            this._242588431scenarioUIUpdateBtn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioUIUpdateBtn",_loc2_,param1));
         }
      }
      
      public function get currentScenario() : Scenario
      {
         return this._currentScenario;
      }
      
      override protected function initLabels() : void
      {
         if(this.scenariosUITabLabel != null)
         {
            this.scenariosUITabLabel.tabLabel = resourceManager.getString("scenarios","SCENARIOS_TITLE");
            this.msgScenariosUI.htmlText = resourceManager.getString("scenarios","MSG_SCENARIO");
            this.scenarioUITestBtn.label = resourceManager.getString("scenarios","BTN_TEST_SCENARIO");
            this.scenarioUIUpdateBtn.label = resourceManager.getString("scenarios","BTN_UPDATE_SCENARIO");
            this.scenarioUIDuplicateBtn.label = resourceManager.getString("scenarios","BTN_DUPLICATE_SCENARIO");
            this.scenarioUIDeleteBtn.label = resourceManager.getString("scenarios","BTN_DELETE_SCENARIO");
            this.msgCreateNewScenario.htmlText = resourceManager.getString("scenarios","BTN_CREATE_NEW_SCENARIO");
         }
      }
      
      public function set scenarioUIDuplicateBtn(param1:Button) : void
      {
         var _loc2_:Object = this._878621077scenarioUIDuplicateBtn;
         if(_loc2_ !== param1)
         {
            this._878621077scenarioUIDuplicateBtn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioUIDuplicateBtn",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenariosUITabLabel() : CustomTab
      {
         return this._95084086scenariosUITabLabel;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         if(this.scenarioBoxNavigation)
         {
            this.scenarioBoxNavigation.addEventListener(KCBoxNavigationEvent.SCROLL_NEXT,this.kcBoxScrollEventHandler);
            this.scenarioBoxNavigation.addEventListener(KCBoxNavigationEvent.SCROLL_PREVIOUS,this.kcBoxScrollEventHandler);
         }
         this._guiInitialized = true;
         this.refreshEnabledComponents();
      }
      
      [Bindable(event="propertyChange")]
      public function get msgCreateNewScenario() : Text
      {
         return this._1320492339msgCreateNewScenario;
      }
      
      private function set _actuators(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._959803365_actuators;
         if(_loc2_ !== param1)
         {
            this._959803365_actuators = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_actuators",_loc2_,param1));
         }
      }
      
      public function __scenarioUIDuplicateBtn_click(param1:MouseEvent) : void
      {
         this.onScenarioUIDuplicateBtnClickHandler(param1);
      }
      
      public function set scenarioUITestBtn(param1:Button) : void
      {
         var _loc2_:Object = this._1420202586scenarioUITestBtn;
         if(_loc2_ !== param1)
         {
            this._1420202586scenarioUITestBtn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioUITestBtn",_loc2_,param1));
         }
      }
      
      public function set currentScenario(param1:Scenario) : void
      {
         this._currentScenario = param1;
      }
      
      [Bindable(event="propertyChange")]
      private function get _arrowPosition() : Point
      {
         return this._201643437_arrowPosition;
      }
      
      public function __createNewScenario_click(param1:MouseEvent) : void
      {
         this.onScenarioUICreateBtnClickHandler(param1);
      }
      
      protected function onScenarioUIDeleteBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:DeleteScenarioUI = new DeleteScenarioUI();
         _loc2_.scenario = this._currentScenario;
         _loc2_.addEventListener(ScenarioEvent.SCENARIO_DELETE,this.scenarioDeleteHandler);
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      public function get mainVBScenariosUI() : VBox
      {
         return this._2000476846mainVBScenariosUI;
      }
      
      public function __msgCreateNewScenario_click(param1:MouseEvent) : void
      {
         this.onScenarioUICreateBtnClickHandler(param1);
      }
      
      public function set msgCreateNewScenario(param1:Text) : void
      {
         var _loc2_:Object = this._1320492339msgCreateNewScenario;
         if(_loc2_ !== param1)
         {
            this._1320492339msgCreateNewScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgCreateNewScenario",_loc2_,param1));
         }
      }
      
      private function _ScenariosUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():ArrayCollection
         {
            return ScenarioService.instance.scenarios;
         },function(param1:ArrayCollection):void
         {
            scenarioBoxNavigation.dataProvider = param1;
         },"scenarioBoxNavigation.dataProvider");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            msgCreateNewScenario.x = param1;
         },"msgCreateNewScenario.x");
         result[1] = binding;
         binding = new Binding(this,function():Point
         {
            return _arrowPosition;
         },function(param1:Point):void
         {
            scenarioCanvas.arrowPosition = param1;
         },"scenarioCanvas.arrowPosition");
         result[2] = binding;
         binding = new Binding(this,function():ArrayCollection
         {
            return _currentScenario.situations;
         },function(param1:ArrayCollection):void
         {
            _ScenariosUI_KCBoxNavigation2.dataProvider = param1;
         },"_ScenariosUI_KCBoxNavigation2.dataProvider");
         result[3] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(-4,-9);
         },function(param1:Point):void
         {
            _ScenariosUI_KCBoxNavigation2.previousButtonPosition = param1;
         },"_ScenariosUI_KCBoxNavigation2.previousButtonPosition");
         result[4] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(0,-9);
         },function(param1:Point):void
         {
            _ScenariosUI_KCBoxNavigation2.nextButtonPosition = param1;
         },"_ScenariosUI_KCBoxNavigation2.nextButtonPosition");
         result[5] = binding;
         return result;
      }
      
      public function set scenariosUITabLabel(param1:CustomTab) : void
      {
         var _loc2_:Object = this._95084086scenariosUITabLabel;
         if(_loc2_ !== param1)
         {
            this._95084086scenariosUITabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenariosUITabLabel",_loc2_,param1));
         }
      }
      
      public function set createNewScenario(param1:Button) : void
      {
         var _loc2_:Object = this._1238151860createNewScenario;
         if(_loc2_ !== param1)
         {
            this._1238151860createNewScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createNewScenario",_loc2_,param1));
         }
      }
      
      private function onScenarioUIUpdateBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.CREATE_SCENARIO_MANUALLY_CLICK);
         _loc2_.scenario = this._currentScenario;
         dispatchEvent(_loc2_);
      }
      
      private function scenarioDeleteHandler(param1:ScenarioEvent) : void
      {
         var _loc2_:File = null;
         if(param1.scenario != null)
         {
            _loc2_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + param1.scenario.id + ".png");
            if(_loc2_.exists)
            {
               _loc2_.deleteFile();
            }
            ScenarioService.instance.scenarios.removeItemAt(ScenarioService.instance.scenarios.getItemIndex(param1.scenario));
            ScenarioService.instance.deleteScenario(param1.scenario);
            this._currentScenario = null;
            this.hideArrow();
            this.refresh();
         }
      }
      
      private function kcBoxScrollEventHandler(param1:KCBoxNavigationEvent) : void
      {
         if(this._arrowPosition.x >= 0)
         {
            if(param1.type == KCBoxNavigationEvent.SCROLL_NEXT)
            {
               this._arrowPosition = new Point(this._arrowPosition.x - this.scenarioBoxNavigation.itemWidth - this.scenarioBoxNavigation.itemHorizontalGap,this._arrowPosition.y);
            }
            else if(param1.type == KCBoxNavigationEvent.SCROLL_PREVIOUS)
            {
               this._arrowPosition = new Point(this._arrowPosition.x + this.scenarioBoxNavigation.itemWidth + this.scenarioBoxNavigation.itemHorizontalGap,this._arrowPosition.y);
            }
            if(this._arrowPosition.x < 0)
            {
            }
            this.scenarioCanvas.refresh();
         }
      }
      
      public function __scenarioUIUpdateBtn_click(param1:MouseEvent) : void
      {
         this.onScenarioUIUpdateBtnClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get msgScenariosUI() : Text
      {
         return this._483578486msgScenariosUI;
      }
      
      public function set scenariosUIContent(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._816675902scenariosUIContent;
         if(_loc2_ !== param1)
         {
            this._816675902scenariosUIContent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenariosUIContent",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioBoxNavigation() : KCBoxNavigation
      {
         return this._696838287scenarioBoxNavigation;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ScenariosUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ScenariosUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_ScenariosUIWatcherSetupUtil");
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
      
      private function refreshEnabledComponents() : void
      {
         if(this._guiInitialized)
         {
            if(Boolean(this.scenarioUITestBtn) && this.scenarioUITestBtn.label == "")
            {
               this.initLabels();
            }
            if(ServerCommunicationManager.instance.actuatorsList == null || ServerCommunicationManager.instance.actuatorsList.length == 0)
            {
               if(this.msgCreateNewScenario != null)
               {
                  this.msgCreateNewScenario.enabled = false;
               }
               if(this.msgScenariosUI != null)
               {
                  this.msgScenariosUI.htmlText = resourceManager.getString("scenarios","MSG_SCENARIO_NO_ACTUATORS");
               }
            }
            else
            {
               if(this.msgCreateNewScenario != null)
               {
                  this.msgCreateNewScenario.enabled = true;
               }
               if(this.msgScenariosUI != null)
               {
                  this.msgScenariosUI.htmlText = resourceManager.getString("scenarios","MSG_SCENARIO");
               }
            }
            if(this.scenarioBoxNavigation)
            {
               if(!this.scenarioBoxNavigation.hasEventListener(KCBoxNavigationEvent.SCROLL_NEXT))
               {
                  this.scenarioBoxNavigation.addEventListener(KCBoxNavigationEvent.SCROLL_NEXT,this.kcBoxScrollEventHandler);
               }
               if(!this.scenarioBoxNavigation.hasEventListener(KCBoxNavigationEvent.SCROLL_PREVIOUS))
               {
                  this.scenarioBoxNavigation.addEventListener(KCBoxNavigationEvent.SCROLL_PREVIOUS,this.kcBoxScrollEventHandler);
               }
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioUITestBtn() : Button
      {
         return this._1420202586scenarioUITestBtn;
      }
      
      private function _ScenariosUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScenarioService.instance.scenarios;
         _loc1_ = this.createNewScenario.x + this.createNewScenario.width / 2 - this.msgCreateNewScenario.width / 2;
         _loc1_ = this._arrowPosition;
         _loc1_ = this._currentScenario.situations;
         _loc1_ = new Point(-4,-9);
         _loc1_ = new Point(0,-9);
      }
      
      public function set mainVBScenariosUI(param1:VBox) : void
      {
         var _loc2_:Object = this._2000476846mainVBScenariosUI;
         if(_loc2_ !== param1)
         {
            this._2000476846mainVBScenariosUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainVBScenariosUI",_loc2_,param1));
         }
      }
      
      public function __scenarioBoxNavigation_itemClick(param1:KCBoxNavigationEvent) : void
      {
         this.onScenarioClickHandler(param1);
      }
      
      override protected function refreshUI() : void
      {
         this.getScenarioActuatorsUI();
         this.refreshEnabledComponents();
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get createNewScenario() : Button
      {
         return this._1238151860createNewScenario;
      }
      
      private function set _arrowPosition(param1:Point) : void
      {
         var _loc2_:Object = this._201643437_arrowPosition;
         if(_loc2_ !== param1)
         {
            this._201643437_arrowPosition = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_arrowPosition",_loc2_,param1));
         }
      }
      
      private function scenarioDuplicationSaveHandler(param1:ScenarioEvent) : void
      {
         var _loc2_:File = null;
         var _loc3_:CollectionEvent = null;
         var _loc4_:Object = null;
         var _loc5_:PNGEncoder = null;
         var _loc6_:File = null;
         var _loc7_:FileStream = null;
         if(param1.scenario != null)
         {
            ScenarioService.instance.scenarios.addItem(param1.scenario);
            InstallationService.instance.saveCurrentInstallation();
            _loc2_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this._currentScenario.id + ".png");
            if(param1.scenarioBitMap)
            {
               _loc5_ = new PNGEncoder();
               _loc6_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + param1.scenario.id + ".png");
               (_loc7_ = new FileStream()).open(_loc6_,FileMode.WRITE);
               _loc7_.writeBytes(_loc5_.encode(param1.scenarioBitMap));
               _loc7_.close();
            }
            else if(_loc2_.exists)
            {
               _loc2_.copyTo(File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + param1.scenario.id + ".png"));
            }
            this.refresh();
            _loc3_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            _loc3_.kind = CollectionEventKind.UPDATE;
            (_loc4_ = new Object()).source = param1.scenario;
            _loc3_.items = [_loc4_];
            this.scenarioBoxNavigation.dispatchEvent(_loc3_);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioUIDuplicateBtn() : Button
      {
         return this._878621077scenarioUIDuplicateBtn;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenariosUIContent() : CustomCanvas
      {
         return this._816675902scenariosUIContent;
      }
      
      private function onScenarioCreationManuallyClickHandler(param1:ScenarioEvent) : void
      {
         KCPopupManager.singleton.removePopup(this._createScenarioChooseMode);
         var _loc2_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.CREATE_SCENARIO_MANUALLY_CLICK);
         _loc2_.scenario = param1.scenario;
         this.dispatchEvent(_loc2_);
      }
      
      private function getScenarioActuatorsUI() : void
      {
         var _loc1_:* = null;
         if(this._currentScenario != null)
         {
            this._actuators.removeAll();
            for each(_loc1_ in this._currentScenario.situations)
            {
               if(_loc1_ != null)
               {
                  this._actuators.addItem(_loc1_.actuator);
               }
            }
         }
         else
         {
            if(this.mainVBScenariosUI != null)
            {
               this.mainVBScenariosUI.height = 232;
            }
            this._actuators.removeAll();
            this.hideArrow();
         }
      }
      
      private function onScenarioUITestBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:TestScenarioUI = new TestScenarioUI();
         _loc2_.scenario = this._currentScenario;
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Boolean = false;
         super.commitProperties();
         if(this.createNewScenario != null)
         {
            _loc1_ = InstallationService.instance.currentInstallation != null && InstallationService.instance.currentInstallation.actuators != null && InstallationService.instance.currentInstallation.actuators.length > 0;
            this.createNewScenario.enabled = _loc1_;
            this.msgCreateNewScenario.styleName = _loc1_ ? "VRI12YCL0" : "VRI12YCL0DISABLED";
         }
      }
      
      public function __scenarioUITestBtn_click(param1:MouseEvent) : void
      {
         this.onScenarioUITestBtnClickHandler(param1);
      }
      
      private function onScenarioClickHandler(param1:KCBoxNavigationEvent) : void
      {
         KCTimeAnalyzer.Tracer("onScenarioClickHandler",0);
         var _loc2_:Point = (param1.currentTarget as UIComponent).contentToGlobal(param1.itemPosition);
         _loc2_.x += 72 - this.scenarioBoxNavigation.getHorizontalScrollPosition();
         this._arrowPosition = _loc2_;
         this._currentScenario = param1.item as Scenario;
         this.getScenarioActuatorsUI();
         this.scenarioCanvas.refresh();
         this.scenarioCanvas.visible = true;
         this.mainVBScenariosUI.height = 256;
      }
      
      private function set _currentScenario(param1:Scenario) : void
      {
         var _loc2_:Object = this._221798890_currentScenario;
         if(_loc2_ !== param1)
         {
            this._221798890_currentScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_currentScenario",_loc2_,param1));
         }
      }
      
      public function __scenarioUIDeleteBtn_click(param1:MouseEvent) : void
      {
         this.onScenarioUIDeleteBtnClickHandler(param1);
      }
      
      public function refresh() : void
      {
         var _loc1_:CollectionEvent = null;
         var _loc2_:Array = null;
         var _loc3_:* = undefined;
         var _loc4_:Object = null;
         this.refreshUI();
         if(ScenarioService.instance.scenarios != null)
         {
            if(this.scenarioBoxNavigation)
            {
               ScenarioService.instance.scenarios.refresh();
               _loc1_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
               _loc1_.kind = CollectionEventKind.UPDATE;
               _loc2_ = new Array();
               for each(_loc3_ in ScenarioService.instance.scenarios)
               {
                  (_loc4_ = new Object()).source = _loc3_;
                  _loc2_.push(_loc4_);
               }
               _loc1_.items = _loc2_;
               ScenarioService.instance.scenarios.dispatchEvent(_loc1_);
               if(this.scenarioBoxNavigation.dataProvider == null || this.scenarioBoxNavigation.dataProvider != null && ScenarioService.instance.scenarios.length != (this.scenarioBoxNavigation.dataProvider as ArrayCollection).length)
               {
                  this.scenarioBoxNavigation.dataProvider = ScenarioService.instance.scenarios;
               }
            }
         }
      }
      
      private function onScenarioUICreateBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ScenarioEvent = null;
         if(this.createNewScenario.enabled)
         {
            _loc2_ = new ScenarioEvent(ScenarioEvent.CREATE_SCENARIO_MANUALLY_CLICK);
            dispatchEvent(_loc2_);
         }
      }
      
      public function set scenarioUIDeleteBtn(param1:Button) : void
      {
         var _loc2_:Object = this._1833077485scenarioUIDeleteBtn;
         if(_loc2_ !== param1)
         {
            this._1833077485scenarioUIDeleteBtn = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioUIDeleteBtn",_loc2_,param1));
         }
      }
      
      private function hideArrow() : void
      {
         this._arrowPosition = new Point(-500,-500);
         if(this.scenarioCanvas != null)
         {
            this.scenarioCanvas.visible = false;
            this.scenarioCanvas.includeInLayout = false;
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _currentScenario() : Scenario
      {
         return this._221798890_currentScenario;
      }
      
      public function set msgScenariosUI(param1:Text) : void
      {
         var _loc2_:Object = this._483578486msgScenariosUI;
         if(_loc2_ !== param1)
         {
            this._483578486msgScenariosUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgScenariosUI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioUIDeleteBtn() : Button
      {
         return this._1833077485scenarioUIDeleteBtn;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
      }
   }
}
