package com.scenarioLauncher.views
{
   import com.keepcore.KCBoxNavigation;
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.components.CustomTab;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.events.ScenarioEvent;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.services.InstallationService;
   import com.scenarioLauncher.services.ScenarioService;
   import com.scenarioLauncher.views.common.CustomCanvas;
   import com.scenarioLauncher.views.renderers.ActuatorEmptyRenderer;
   import com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer;
   import com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorUsedTileListRenderer;
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
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Situation;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.Box;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.LinkButton;
   import mx.controls.Text;
   import mx.core.IUIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.DragEvent;
   import mx.events.DynamicEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.codec.PNGEncoder;
   import mx.managers.DragManager;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class ScenarioUpdateUI extends CustomCanvas implements IBindingClient
   {
      
      private static var _storeScenarioSituations:ArrayCollection;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      public static var _currentScenario:Scenario;
      
      private static var _1632118431_saveScenarioSituations:ArrayCollection;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
       
      
      private var _820675625btnDeleteScenario:Button;
      
      private var _1251163335scenariosUpdateUIContent:CustomCanvas;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _actuatorIndexForDeletion:Number = -1;
      
      private var _95084086scenariosUITabLabel:CustomTab;
      
      private var _1008330181scenarioName:Text;
      
      private var _1285138291trashBox:Box;
      
      private var _33312502scenarioAllActuator:KCBoxNavigation;
      
      private var _2000476846mainVBScenariosUI:VBox;
      
      private var _1342433544scenarioCanvas:CustomCanvas;
      
      private var _deletedCustomImage:Boolean = false;
      
      private var _1509377002scenarioActuators:KCBoxNavigation;
      
      private var actuatorVisibilityChanged:Boolean = false;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _565635968iconPersonnalisation:LinkButton;
      
      private var _659094206btnValidateScenario:Button;
      
      private var tokenActuatorPosition:Boolean;
      
      private var _1252954209msgScenariosUpdateUI:Text;
      
      private var _currentScenarioChanged:Boolean = false;
      
      private var _currentScenarioActuatorListItemDeleted:Boolean = false;
      
      private var _692155677sortPerFamily:LinkButton;
      
      private var _currentScenarioName:String = "";
      
      mx_internal var _watchers:Array;
      
      private var _471506761msgClickOnProduct:Text;
      
      private var _480122152_allActuators:ArrayCollection;
      
      private var _1008477143scenarioIcon:Image;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _788960060defaultLogoScenario:Class;
      
      private var _imgFileBitMap:BitmapData;
      
      mx_internal var _bindings:Array;
      
      private var _scenarioCreation:Boolean = false;
      
      private var _834570818_tabLabel:String;
      
      private var _361149967btnCancelScenarioUpdate:Button;
      
      public function ScenarioUpdateUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
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
                        "verticalScrollPolicy":"off",
                        "horizontalScrollPolicy":"off",
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
                           "id":"scenariosUpdateUIContent",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"scenariosUpdateUIContent",
                                 "styleName":"scenariosUpdateUIContent",
                                 "useCustomCanvasSkin":true,
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "y":20,
                                 "verticalScrollPolicy":"off",
                                 "horizontalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"msgScenariosUpdateUI",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"msgScenariosUpdateUI",
                                          "styleName":"labelsR12White",
                                          "x":18,
                                          "y":11,
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":KCBoxNavigation,
                                    "id":"scenarioAllActuator",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "columnCount":8,
                                          "rowCount":1,
                                          "width":895,
                                          "height":145,
                                          "x":0,
                                          "y":49,
                                          "itemWidth":96,
                                          "itemHeight":120,
                                          "itemRenderer":ScenarioUpdateActuatorTileListRenderer,
                                          "itemHorizontalGap":0,
                                          "previousButtonBarThickness":55,
                                          "nextButtonBarThickness":55,
                                          "previousButtonStyleName":"previousButtonStyle",
                                          "nextButtonStyleName":"nextButtonStyle",
                                          "autoScroll":false
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":CustomCanvas,
                  "id":"scenarioCanvas",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"scenarioCanvas",
                        "styleName":"scenarioCanvas",
                        "useCustomCanvasSkin":true,
                        "y":232,
                        "width":963,
                        "height":312,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"msgClickOnProduct",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "name":"msgClickOnProduct",
                                 "styleName":"labelsR12Black",
                                 "x":237,
                                 "y":34,
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Image,
                           "id":"scenarioIcon",
                           "stylesFactory":function():void
                           {
                              this.verticalAlign = "bottom";
                              this.horizontalAlign = "center";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"scenarioIcon",
                                 "y":73,
                                 "width":71,
                                 "height":71
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"scenarioName",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "name":"scenarioName",
                                 "styleName":"labelsR12BlackCenter",
                                 "x":75,
                                 "y":147,
                                 "width":70
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"iconPersonnalisation",
                           "events":{"click":"__iconPersonnalisation_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"iconPersonnalisation",
                                 "styleName":"linkButtonR11YellowBGWhiteUnderline",
                                 "y":190
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":KCBoxNavigation,
                           "id":"scenarioActuators",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "x":168,
                                 "y":72,
                                 "height":145,
                                 "width":795,
                                 "columnCount":7,
                                 "rowCount":1,
                                 "itemWidth":95,
                                 "itemHeight":120,
                                 "itemRenderer":ScenarioUpdateActuatorUsedTileListRenderer,
                                 "nullItemRenderer":ActuatorEmptyRenderer,
                                 "previousButtonStyleName":"previousButtonStyle",
                                 "nextButtonStyleName":"nextButtonStyle",
                                 "previousButtonBarThickness":55,
                                 "nextButtonBarThickness":55,
                                 "autoScroll":false
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"sortPerFamily",
                           "events":{"click":"__sortPerFamily_click"},
                           "stylesFactory":function():void
                           {
                              this.right = "70";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"sortPerFamily",
                                 "styleName":"linkButtonR12YellowBGBlackUnderline",
                                 "y":190
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnValidateScenario",
                           "events":{"click":"__btnValidateScenario_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"btnValidateScenario",
                                 "styleName":"btnValidate",
                                 "buttonMode":true,
                                 "useHandCursor":true,
                                 "x":591,
                                 "y":264,
                                 "width":113
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnCancelScenarioUpdate",
                           "events":{"click":"__btnCancelScenarioUpdate_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"btnCancelScenarioUpdate",
                                 "styleName":"btnCancel",
                                 "buttonMode":true,
                                 "useHandCursor":true,
                                 "x":719,
                                 "y":264,
                                 "width":113
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Box,
                           "id":"trashBox",
                           "events":{
                              "dragEnter":"__trashBox_dragEnter",
                              "dragDrop":"__trashBox_dragDrop",
                              "dragExit":"__trashBox_dragExit",
                              "dragComplete":"__trashBox_dragComplete"
                           },
                           "stylesFactory":function():void
                           {
                              this.paddingBottom = 20;
                              this.paddingLeft = 20;
                              this.paddingRight = 20;
                              this.paddingTop = 20;
                              this.backgroundAlpha = 0;
                              this.backgroundColor = 16777215;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "x":845,
                                 "y":236,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnDeleteScenario",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "cacheAsBitmap":false,
                                          "name":"btnDeleteScenario",
                                          "styleName":"btnDeleteScenario",
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
               })]};
            }
         });
         this._480122152_allActuators = new ArrayCollection();
         this._788960060defaultLogoScenario = ScenarioUpdateUI_defaultLogoScenario;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      [Bindable(event="propertyChange")]
      private static function get _saveScenarioSituations() : ArrayCollection
      {
         return ScenarioUpdateUI._1632118431_saveScenarioSituations;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ScenarioUpdateUI._watcherSetupUtil = param1;
      }
      
      private static function set _saveScenarioSituations(param1:ArrayCollection) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ScenarioUpdateUI._1632118431_saveScenarioSituations;
         if(_loc2_ !== param1)
         {
            ScenarioUpdateUI._1632118431_saveScenarioSituations = param1;
            _loc3_ = ScenarioUpdateUI.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ScenarioUpdateUI,"_saveScenarioSituations",_loc2_,param1));
            }
         }
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public static function getSituationByActuator(param1:Actuator) : Situation
      {
         var _loc3_:* = null;
         var _loc2_:Situation = null;
         for each(_loc3_ in _saveScenarioSituations)
         {
            if(_loc3_.actuator.equals(param1))
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         return _loc2_;
      }
      
      public function set iconPersonnalisation(param1:LinkButton) : void
      {
         var _loc2_:Object = this._565635968iconPersonnalisation;
         if(_loc2_ !== param1)
         {
            this._565635968iconPersonnalisation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconPersonnalisation",_loc2_,param1));
         }
      }
      
      protected function btnValidateScenarioClickHandler(param1:MouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:Situation = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:Situation = null;
         var _loc10_:* = null;
         var _loc11_:Situation = null;
         var _loc12_:* = null;
         var _loc13_:File = null;
         var _loc14_:File = null;
         var _loc2_:Scenario = _currentScenario;
         _currentScenario.name = "";
         _currentScenario.name = this._currentScenarioName;
         var _loc3_:Boolean = false;
         if(_loc2_.id == 0)
         {
            _loc3_ = true;
            ScenarioService.instance.scenarios.addItem(_loc2_);
         }
         this.removeNullSituationsFromCollection(_saveScenarioSituations);
         this.removeNullSituationsFromCollection(_loc2_.situations);
         ScenarioService.instance.deleteScenarioSituations(_loc2_.situations);
         for each(_loc4_ in _saveScenarioSituations)
         {
            _loc9_ = null;
            for each(_loc10_ in _loc2_.situations)
            {
               if(_loc10_.actuator.equals(_loc4_.actuator))
               {
                  _loc9_ = _loc10_;
                  break;
               }
            }
            if(_loc9_ == null)
            {
               (_loc9_ = new Situation()).actuator = _loc4_.actuator;
               _loc2_.situations.addItem(_loc9_);
            }
            _loc9_.ParameterValue = _loc4_.ParameterValue;
            _loc9_.id = 0;
         }
         _loc7_ = (_loc6_ = _loc2_.situations.length) - 1;
         while(_loc7_ >= 0)
         {
            _loc5_ = _loc2_.situations[_loc7_];
            _loc11_ = null;
            if(_loc5_ != null)
            {
               for each(_loc12_ in _saveScenarioSituations)
               {
                  if(_loc12_.actuator.equals(_loc5_.actuator))
                  {
                     _loc11_ = _loc12_;
                     break;
                  }
               }
               if(_loc11_ == null)
               {
                  _loc2_.situations.removeItemAt(_loc2_.situations.getItemIndex(_loc5_));
               }
            }
            _loc7_--;
         }
         InstallationService.instance.saveInstallation(InstallationService.instance.currentInstallation);
         this.saveImagePerso();
         if(_loc3_)
         {
            if((_loc13_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_0.png")).exists)
            {
               _loc13_.moveTo(File.applicationStorageDirectory.resolvePath("scenario_images/scenario_undefined.png"));
            }
         }
         if(this._deletedCustomImage)
         {
            if((_loc14_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_undefined.png")).exists)
            {
               _loc14_.deleteFile();
            }
         }
         var _loc8_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.SCENARIO_UPDATE_VALIDATE);
         this.dispatchEvent(_loc8_);
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioCanvas() : CustomCanvas
      {
         return this._1342433544scenarioCanvas;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelScenarioUpdate() : Button
      {
         return this._361149967btnCancelScenarioUpdate;
      }
      
      public function set scenarioCanvas(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._1342433544scenarioCanvas;
         if(_loc2_ !== param1)
         {
            this._1342433544scenarioCanvas = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioCanvas",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioAllActuator() : KCBoxNavigation
      {
         return this._33312502scenarioAllActuator;
      }
      
      public function manageGetActuatorPosition() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in _saveScenarioSituations)
         {
            if(_loc1_ != null && _loc1_.radioInProgress == 1 && this.tokenActuatorPosition)
            {
               this.tokenActuatorPosition = false;
               _loc1_.radioInProgress = 2;
               ServerCommunicationManager.instance.getActuatorPosition(_loc1_.actuator);
               break;
            }
         }
      }
      
      public function set scenarioAllActuator(param1:KCBoxNavigation) : void
      {
         var _loc2_:Object = this._33312502scenarioAllActuator;
         if(_loc2_ !== param1)
         {
            this._33312502scenarioAllActuator = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioAllActuator",_loc2_,param1));
         }
      }
      
      public function __trashBox_dragEnter(param1:DragEvent) : void
      {
         this.deleteDragEnterHandler(param1);
      }
      
      public function set btnCancelScenarioUpdate(param1:Button) : void
      {
         var _loc2_:Object = this._361149967btnCancelScenarioUpdate;
         if(_loc2_ !== param1)
         {
            this._361149967btnCancelScenarioUpdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelScenarioUpdate",_loc2_,param1));
         }
      }
      
      private function applyActuatorSettingsHandler(param1:ActuatorEvent) : void
      {
         var _loc2_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc2_.kind = CollectionEventKind.UPDATE;
         var _loc3_:PropertyChangeEvent = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
         _loc3_.source = param1.situation;
         _loc2_.items = [_loc3_];
         _saveScenarioSituations.dispatchEvent(_loc2_);
      }
      
      public function get currentScenario() : Scenario
      {
         return _currentScenario;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(ActuatorEvent.POSITION_ACTUATOR,this.OnGetActuatorPositionHandler);
         this.scenarioActuators.addEventListener(ScenarioEvent.ACTUATOR_ADDED_TO_SCENARIO,this.actuatorAddedToScenarioHandler);
         this.scenarioActuators.addEventListener(ActuatorEvent.APPLY_ACTUATOR_SETTINGS,this.applyActuatorSettingsHandler);
         this.scenarioActuators.addEventListener(ActuatorEvent.APPLY_TO_ALL_ACTUATOR_SETTINGS,this.applyToAllActuatorSettingsHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioIcon() : Image
      {
         return this._1008477143scenarioIcon;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenariosUpdateUIContent() : CustomCanvas
      {
         return this._1251163335scenariosUpdateUIContent;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioName() : Text
      {
         return this._1008330181scenarioName;
      }
      
      private function setScenarioActuatorsUI() : void
      {
         var _loc1_:* = null;
         KCTimeAnalyzer.Tracer("setScenarioActuatorsUI",10);
         var _loc2_:int = Math.max(7,1);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _saveScenarioSituations.addItem(null);
            _loc3_++;
         }
      }
      
      private function deleteDragExit(param1:DragEvent) : void
      {
         this.setTrashIconOpened(false);
      }
      
      override protected function initLabels() : void
      {
         if(this._scenarioCreation)
         {
            this._tabLabel = resourceManager.getString("scenarios","SCENARIOS_CREATE_TITLE");
         }
         else
         {
            this._tabLabel = resourceManager.getString("scenarios","SCENARIOS_UPDATE_TITLE");
         }
         this.msgScenariosUpdateUI.htmlText = resourceManager.getString("scenarios","MSG_SCENARIO_UPDATE");
         this.msgClickOnProduct.htmlText = resourceManager.getString("scenarios","MSG_CLICK_PRODUCT");
         this.iconPersonnalisation.label = resourceManager.getString("scenarios","BTN_CUSTOMIZE");
         this.btnValidateScenario.label = resourceManager.getString("common","BTN_VALIDATE");
         this.btnCancelScenarioUpdate.label = resourceManager.getString("common","BTN_CANCEL");
         this.sortPerFamily.label = resourceManager.getString("scenarios","BTN_SORT_PER_FAMILY");
      }
      
      protected function iconPersonnalisationClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:CustomizeScenarioUI = new CustomizeScenarioUI();
         _loc2_.scenario = _currentScenario;
         _loc2_.tempScenarioName = this._currentScenarioName;
         if(this.scenarioIcon.content is Bitmap)
         {
            _loc2_.tempBitmapData = (this.scenarioIcon.content as Bitmap).bitmapData;
         }
         _loc2_.addEventListener(ScenarioEvent.SCENARIO_UPDATE_VALIDATE,this.scenarioUpdateHandler);
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      private function get defaultLogoScenario() : Class
      {
         return this._788960060defaultLogoScenario;
      }
      
      public function set msgScenariosUpdateUI(param1:Text) : void
      {
         var _loc2_:Object = this._1252954209msgScenariosUpdateUI;
         if(_loc2_ !== param1)
         {
            this._1252954209msgScenariosUpdateUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgScenariosUpdateUI",_loc2_,param1));
         }
      }
      
      public function __sortPerFamily_click(param1:MouseEvent) : void
      {
         this.sortActuatorsByFamilyHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get scenariosUITabLabel() : CustomTab
      {
         return this._95084086scenariosUITabLabel;
      }
      
      private function setAllActuatorsUI() : void
      {
         KCTimeAnalyzer.Tracer("setAllActuatorsUI",10);
         this._allActuators.removeAll();
         this._allActuators.addAll(ServerCommunicationManager.instance.actuatorsList);
      }
      
      protected function btnCancelScenarioUpdateClickHandler(param1:MouseEvent) : void
      {
         this._imgFileBitMap = null;
         _currentScenario.situations = _storeScenarioSituations;
         var _loc2_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.SCENARIO_UPDATE_CANCEL);
         this.dispatchEvent(_loc2_);
      }
      
      public function set currentScenario(param1:Scenario) : void
      {
         var _loc2_:* = null;
         _currentScenario = param1;
         _saveScenarioSituations = new ArrayCollection();
         this._deletedCustomImage = false;
         this._imgFileBitMap = null;
         if(_currentScenario != null)
         {
            this._currentScenarioName = param1.name;
            _storeScenarioSituations = _currentScenario.situations;
            for each(_loc2_ in _currentScenario.situations)
            {
               if(_loc2_ != null)
               {
                  _saveScenarioSituations.addItem(_loc2_.duplicate());
               }
            }
         }
         this.tokenActuatorPosition = true;
         this._currentScenarioChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      [Bindable(event="propertyChange")]
      public function get mainVBScenariosUI() : VBox
      {
         return this._2000476846mainVBScenariosUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get msgClickOnProduct() : Text
      {
         return this._471506761msgClickOnProduct;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidateScenario() : Button
      {
         return this._659094206btnValidateScenario;
      }
      
      public function __btnValidateScenario_click(param1:MouseEvent) : void
      {
         this.btnValidateScenarioClickHandler(param1);
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
      
      private function deleteDragEnterHandler(param1:DragEvent) : void
      {
         var _loc2_:IUIComponent = null;
         if(param1.dragInitiator is ScenarioUpdateActuatorUsedTileListRenderer)
         {
            _loc2_ = param1.currentTarget as IUIComponent;
            DragManager.showFeedback(DragManager.MOVE);
            DragManager.acceptDragDrop(_loc2_);
            this.setTrashIconOpened();
         }
      }
      
      public function set scenariosUpdateUIContent(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._1251163335scenariosUpdateUIContent;
         if(_loc2_ !== param1)
         {
            this._1251163335scenariosUpdateUIContent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenariosUpdateUIContent",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trashBox() : Box
      {
         return this._1285138291trashBox;
      }
      
      public function set scenarioIcon(param1:Image) : void
      {
         var _loc2_:Object = this._1008477143scenarioIcon;
         if(_loc2_ !== param1)
         {
            this._1008477143scenarioIcon = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioIcon",_loc2_,param1));
         }
      }
      
      public function set scenarioName(param1:Text) : void
      {
         var _loc2_:Object = this._1008330181scenarioName;
         if(_loc2_ !== param1)
         {
            this._1008330181scenarioName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioName",_loc2_,param1));
         }
      }
      
      public function __btnCancelScenarioUpdate_click(param1:MouseEvent) : void
      {
         this.btnCancelScenarioUpdateClickHandler(param1);
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         this.tokenActuatorPosition = true;
         this.removeGetActuatorPosition();
         this.manageGetActuatorPosition();
         _saveScenarioSituations.refresh();
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_GET_ACTUATOR_POSITION:
               KCTimeAnalyzer.Tracer("--> ERROR_GET_ACTUATOR_POSITION",0);
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      private function set defaultLogoScenario(param1:Class) : void
      {
         var _loc2_:Object = this._788960060defaultLogoScenario;
         if(_loc2_ !== param1)
         {
            this._788960060defaultLogoScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"defaultLogoScenario",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconPersonnalisation() : LinkButton
      {
         return this._565635968iconPersonnalisation;
      }
      
      private function set _tabLabel(param1:String) : void
      {
         var _loc2_:Object = this._834570818_tabLabel;
         if(_loc2_ !== param1)
         {
            this._834570818_tabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tabLabel",_loc2_,param1));
         }
      }
      
      public function set btnValidateScenario(param1:Button) : void
      {
         var _loc2_:Object = this._659094206btnValidateScenario;
         if(_loc2_ !== param1)
         {
            this._659094206btnValidateScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnValidateScenario",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ScenarioUpdateUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ScenarioUpdateUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_ScenarioUpdateUIWatcherSetupUtil");
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
      
      private function scenarioUpdateHandler(param1:ScenarioEvent) : void
      {
         var _loc2_:* = param1.scenario.id == 0;
         this._imgFileBitMap = param1.scenarioBitMap;
         this._deletedCustomImage = this._imgFileBitMap == null;
         if(param1.scenarioName != "")
         {
            this._currentScenarioName = param1.scenarioName;
         }
         this._currentScenarioChanged = true;
         invalidateProperties();
      }
      
      public function removeGetActuatorPosition() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in _saveScenarioSituations)
         {
            if(_loc1_ != null && _loc1_.radioInProgress == 2)
            {
               _loc1_.radioInProgress = 0;
            }
         }
      }
      
      public function set msgClickOnProduct(param1:Text) : void
      {
         var _loc2_:Object = this._471506761msgClickOnProduct;
         if(_loc2_ !== param1)
         {
            this._471506761msgClickOnProduct = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgClickOnProduct",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get msgScenariosUpdateUI() : Text
      {
         return this._1252954209msgScenariosUpdateUI;
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
      
      private function sortScenarioActuatorsByFamily(param1:Object, param2:Object, param3:Array = null) : int
      {
         var _loc4_:Actuator = null;
         var _loc5_:Actuator = null;
         if(param1 == null && param2 == null)
         {
            return 0;
         }
         if(param2 == null)
         {
            return -1;
         }
         if(param1 == null)
         {
            return 1;
         }
         _loc4_ = (param1 as Situation).actuator;
         _loc5_ = (param2 as Situation).actuator;
         if(_loc4_.profile > _loc5_.profile)
         {
            return 1;
         }
         if(_loc4_.profile < _loc5_.profile)
         {
            return -1;
         }
         return 0;
      }
      
      private function _ScenarioUpdateUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._tabLabel;
         _loc1_ = this._allActuators;
         _loc1_ = new Point(22,-72);
         _loc1_ = new Point(-22,-72);
         _loc1_ = this.defaultLogoScenario;
         _loc1_ = this.scenarioName.x + this.scenarioName.width / 2 - this.scenarioIcon.width / 2;
         _loc1_ = this.scenarioName.x + this.scenarioName.width / 2 - this.iconPersonnalisation.width / 2;
         _loc1_ = _saveScenarioSituations;
         _loc1_ = new Point(23,-72);
         _loc1_ = new Point(-18,-72);
      }
      
      public function __trashBox_dragDrop(param1:DragEvent) : void
      {
         this.deleteDropHandler(param1);
      }
      
      public function set btnDeleteScenario(param1:Button) : void
      {
         var _loc2_:Object = this._820675625btnDeleteScenario;
         if(_loc2_ !== param1)
         {
            this._820675625btnDeleteScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDeleteScenario",_loc2_,param1));
         }
      }
      
      private function deleteDropHandler(param1:DragEvent) : void
      {
         var _loc3_:Situation = null;
         var _loc4_:int = 0;
         var _loc5_:ArrayCollection = null;
         var _loc6_:ArrayCollection = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         this.setTrashIconOpened(false);
         var _loc2_:ScenarioUpdateActuatorUsedTileListRenderer = param1.dragInitiator as ScenarioUpdateActuatorUsedTileListRenderer;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.situation;
            if((_loc4_ = _saveScenarioSituations.getItemIndex(_loc3_)) >= 0)
            {
               _loc3_.actuator.useInScenario = false;
               (_loc5_ = new ArrayCollection()).addAll(_saveScenarioSituations);
               _loc5_.setItemAt(null,_loc4_);
               _loc6_ = new ArrayCollection();
               for each(_loc7_ in _loc5_)
               {
                  if(_loc7_ != null)
                  {
                     _loc6_.addItem(_loc7_);
                  }
               }
               _loc8_ = 0 - _loc6_.length;
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc6_.addItem(null);
                  _loc9_++;
               }
               if((_loc10_ = _loc6_.getItemIndex(null)) <= 6 && _loc6_.length > 7)
               {
                  _loc6_.removeItemAt(_loc10_);
               }
               _saveScenarioSituations = _loc6_;
               this.scenarioActuators.dataProvider = _saveScenarioSituations;
               this.actuatorVisibilityChanged = true;
               invalidateProperties();
            }
         }
      }
      
      private function set _allActuators(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._480122152_allActuators;
         if(_loc2_ !== param1)
         {
            this._480122152_allActuators = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_allActuators",_loc2_,param1));
         }
      }
      
      public function updateActuatorsVisibility() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         KCTimeAnalyzer.Tracer("setActuatorsVisibility",10);
         for each(_loc1_ in this._allActuators)
         {
            if(_loc1_ != null)
            {
               _loc1_.useInScenario = false;
            }
         }
         for each(_loc2_ in _saveScenarioSituations)
         {
            if(_loc2_ != null)
            {
               _loc2_.actuator.useInScenario = true;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _tabLabel() : String
      {
         return this._834570818_tabLabel;
      }
      
      public function set sortPerFamily(param1:LinkButton) : void
      {
         var _loc2_:Object = this._692155677sortPerFamily;
         if(_loc2_ !== param1)
         {
            this._692155677sortPerFamily = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sortPerFamily",_loc2_,param1));
         }
      }
      
      private function removeNullSituationsFromCollection(param1:ArrayCollection) : void
      {
         var _loc2_:int = param1.getItemIndex(null);
         while(_loc2_ >= 0)
         {
            param1.removeItemAt(_loc2_);
            _loc2_ = param1.getItemIndex(null);
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:File = null;
         super.commitProperties();
         if(this._currentScenarioChanged)
         {
            this._currentScenarioChanged = false;
            if(_currentScenario == null)
            {
               _currentScenario = new Scenario();
               if(InstallationService.instance.currentInstallation)
               {
                  this._currentScenarioName = InstallationService.instance.currentInstallation.generateScenarioName();
                  _currentScenario.name = this._currentScenarioName;
                  this.scenarioName.htmlText = this._currentScenarioName;
               }
               this.scenarioIcon.source = this.defaultLogoScenario;
               this._tabLabel = resourceManager.getString("scenarios","SCENARIOS_CREATE_TITLE");
               this._scenarioCreation = true;
            }
            else
            {
               this._scenarioCreation = false;
               this.scenarioName.htmlText = this._currentScenarioName;
               this._tabLabel = resourceManager.getString("scenarios","SCENARIOS_UPDATE_TITLE");
               _loc1_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_undefined.png");
               if(this._imgFileBitMap)
               {
                  this.scenarioIcon.source = new Bitmap(this._imgFileBitMap);
               }
               else if(!this._deletedCustomImage && Boolean(_loc1_.exists))
               {
                  this.scenarioIcon.source = null;
                  this.scenarioIcon.source = _loc1_.nativePath;
               }
               else
               {
                  this.scenarioIcon.source = this.defaultLogoScenario;
               }
            }
            this.setAllActuatorsUI();
            this.setScenarioActuatorsUI();
            this.updateActuatorsVisibility();
         }
         if(this.actuatorVisibilityChanged)
         {
            this.actuatorVisibilityChanged = false;
            this.updateActuatorsVisibility();
         }
      }
      
      private function OnGetActuatorPositionHandler(param1:ActuatorEvent) : void
      {
         var _loc2_:Situation = getSituationByActuator(param1.actuator);
         if(_loc2_ == null)
         {
            _saveScenarioSituations.addItem(param1.situation);
         }
         else
         {
            _loc2_.ParameterValue = param1.situation.ParameterValue;
         }
         _loc2_.radioInProgress = 0;
         var _loc3_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc3_.kind = CollectionEventKind.UPDATE;
         var _loc4_:PropertyChangeEvent;
         (_loc4_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).source = _loc2_;
         _loc3_.items = [_loc4_];
         _saveScenarioSituations.dispatchEvent(_loc3_);
         _saveScenarioSituations.refresh();
         this.tokenActuatorPosition = true;
         this.manageGetActuatorPosition();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDeleteScenario() : Button
      {
         return this._820675625btnDeleteScenario;
      }
      
      private function actuatorAddedToScenarioHandler(param1:DynamicEvent) : void
      {
         var _loc2_:Actuator = param1.actuator;
         _loc2_.useInScenario = true;
         var _loc3_:Situation = new Situation();
         _loc3_.actuator = _loc2_;
         _loc3_.setDefaultPosition();
         _loc3_.radioInProgress = 1;
         var _loc4_:int = _saveScenarioSituations.getItemIndex(null);
         _saveScenarioSituations.setItemAt(_loc3_,_loc4_);
         if(_loc4_ >= 6 && _loc4_ < this._allActuators.length)
         {
            _saveScenarioSituations.addItem(null);
            setTimeout(this.scenarioActuators.scrollNext,1000);
         }
         this.manageGetActuatorPosition();
      }
      
      public function set scenarioActuators(param1:KCBoxNavigation) : void
      {
         var _loc2_:Object = this._1509377002scenarioActuators;
         if(_loc2_ !== param1)
         {
            this._1509377002scenarioActuators = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioActuators",_loc2_,param1));
         }
      }
      
      public function __trashBox_dragExit(param1:DragEvent) : void
      {
         this.deleteDragExit(param1);
      }
      
      private function setTrashIconOpened(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.trashBox.setStyle("paddingTop",8);
            this.btnDeleteScenario.styleName = "btnDeleteScenarioOpen";
         }
         else
         {
            this.trashBox.setStyle("paddingTop",20);
            this.btnDeleteScenario.styleName = "btnDeleteScenario";
         }
      }
      
      private function _ScenarioUpdateUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _tabLabel;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            scenariosUITabLabel.tabLabel = param1;
         },"scenariosUITabLabel.tabLabel");
         result[0] = binding;
         binding = new Binding(this,function():ArrayCollection
         {
            return _allActuators;
         },function(param1:ArrayCollection):void
         {
            scenarioAllActuator.dataProvider = param1;
         },"scenarioAllActuator.dataProvider");
         result[1] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(22,-72);
         },function(param1:Point):void
         {
            scenarioAllActuator.previousButtonPosition = param1;
         },"scenarioAllActuator.previousButtonPosition");
         result[2] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(-22,-72);
         },function(param1:Point):void
         {
            scenarioAllActuator.nextButtonPosition = param1;
         },"scenarioAllActuator.nextButtonPosition");
         result[3] = binding;
         binding = new Binding(this,function():Object
         {
            return defaultLogoScenario;
         },function(param1:Object):void
         {
            scenarioIcon.source = param1;
         },"scenarioIcon.source");
         result[4] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            scenarioIcon.x = param1;
         },"scenarioIcon.x");
         result[5] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            iconPersonnalisation.x = param1;
         },"iconPersonnalisation.x");
         result[6] = binding;
         binding = new Binding(this,function():ArrayCollection
         {
            return _saveScenarioSituations;
         },function(param1:ArrayCollection):void
         {
            scenarioActuators.dataProvider = param1;
         },"scenarioActuators.dataProvider");
         result[7] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(23,-72);
         },function(param1:Point):void
         {
            scenarioActuators.previousButtonPosition = param1;
         },"scenarioActuators.previousButtonPosition");
         result[8] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(-18,-72);
         },function(param1:Point):void
         {
            scenarioActuators.nextButtonPosition = param1;
         },"scenarioActuators.nextButtonPosition");
         result[9] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get _allActuators() : ArrayCollection
      {
         return this._480122152_allActuators;
      }
      
      public function __iconPersonnalisation_click(param1:MouseEvent) : void
      {
         this.iconPersonnalisationClickHandler(param1);
      }
      
      private function removeSituationByActuator(param1:Actuator) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in _saveScenarioSituations)
         {
            if(_loc2_.actuator.equals(param1))
            {
               _saveScenarioSituations.removeItemAt(_saveScenarioSituations.getItemIndex(_loc2_));
               break;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioActuators() : KCBoxNavigation
      {
         return this._1509377002scenarioActuators;
      }
      
      [Bindable(event="propertyChange")]
      public function get sortPerFamily() : LinkButton
      {
         return this._692155677sortPerFamily;
      }
      
      private function sortActuatorsByFamilyHandler(param1:MouseEvent) : void
      {
         if(_saveScenarioSituations != null && false)
         {
            this.scenarioActuators.sortCollection(this.sortScenarioActuatorsByFamily);
         }
      }
      
      public function set trashBox(param1:Box) : void
      {
         var _loc2_:Object = this._1285138291trashBox;
         if(_loc2_ !== param1)
         {
            this._1285138291trashBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trashBox",_loc2_,param1));
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
      }
      
      public function __trashBox_dragComplete(param1:DragEvent) : void
      {
         this.deleteDragExit(param1);
      }
      
      protected function saveImagePerso() : void
      {
         var _loc1_:PNGEncoder = null;
         var _loc2_:File = null;
         var _loc3_:FileStream = null;
         if(this._imgFileBitMap)
         {
            _loc1_ = new PNGEncoder();
            _loc2_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_undefined.png");
            if(!_loc2_.parent.exists)
            {
               _loc2_.parent.createDirectory();
            }
            _loc3_ = new FileStream();
            _loc3_.open(_loc2_,FileMode.WRITE);
            _loc3_.writeBytes(_loc1_.encode(this._imgFileBitMap));
            _loc3_.close();
         }
      }
      
      private function applyToAllActuatorSettingsHandler(param1:ActuatorEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc2_.kind = CollectionEventKind.UPDATE;
         var _loc3_:PropertyChangeEvent = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
         _loc3_.source = param1.situation;
         _loc2_.items = [_loc3_];
         for each(_loc4_ in _saveScenarioSituations)
         {
            if(_loc4_ != param1.situation && _loc4_ != null && _loc4_.actuator != null && (_loc4_.actuator.profile == param1.actuator.profile && _loc4_.actuator.subProfile == param1.actuator.subProfile))
            {
               _loc4_.ParameterValue.clear();
               _loc4_.ParameterValue.writeBytes(param1.situation.ParameterValue);
               _loc3_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
               _loc3_.source = _loc4_;
               _loc2_.items.push(_loc3_);
            }
         }
         _saveScenarioSituations.dispatchEvent(_loc2_);
      }
   }
}
