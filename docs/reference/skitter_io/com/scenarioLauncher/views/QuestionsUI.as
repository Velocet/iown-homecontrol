package com.scenarioLauncher.views
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.components.CustomTab;
   import com.scenarioLauncher.components.HelpMySpace;
   import com.scenarioLauncher.components.HelpReaderUI;
   import com.scenarioLauncher.views.common.CustomCanvas;
   import com.scenarioLauncher.views.help.HelpCategoryButton;
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
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   
   public class QuestionsUI extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1569615846mainVBHelpUI:VBox;
      
      private var _730982446systemReader:HelpReaderUI;
      
      private var _1313629660xmlInputEN:XML;
      
      private var _1313629695xmlInputFR:XML;
      
      private var _arrow:Sprite;
      
      private var _1313630007xmlInputPT:XML;
      
      public var deDEHelp:Class;
      
      public var fiFIHelp:Class;
      
      private var _873698520myInstallationButton:HelpCategoryButton;
      
      private var _743446349readersViewStack:ViewStack;
      
      private var _1313629790xmlInputIT:XML;
      
      private var _120012428mySpaceButton:HelpCategoryButton;
      
      public var esESHelp:Class;
      
      private var _562720797mySpaceReader:HelpMySpace;
      
      private var _201643437_arrowPosition:Point;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var plPLHelp:Class;
      
      public var nlNLHelp:Class;
      
      public var ptPTHelp:Class;
      
      private var _1313629620xmlInputDE:XML;
      
      private var _1313629686xmlInputFI:XML;
      
      public var grGRHelp:Class;
      
      private var _1869107476helpUITabLabel:CustomTab;
      
      private var _569915561myScenariosButton:HelpCategoryButton;
      
      public var seSEHelp:Class;
      
      mx_internal var _watchers:Array;
      
      private var _1107694713questionContentUI:CustomCanvas;
      
      private var _694253980mySkittersReader:HelpReaderUI;
      
      public var noNOHelp:Class;
      
      public var dkDKHelp:Class;
      
      private var _1802814346msgHelpUI:Text;
      
      private var _1383507816questionsUIContent:CustomCanvas;
      
      private var selectedCategory:int = 0;
      
      private var _1750748514systemHelpButton:HelpCategoryButton;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1316406889myInstallationReader:HelpReaderUI;
      
      private var _1313629937xmlInputNL:XML;
      
      private var _1313629999xmlInputPL:XML;
      
      private var _1136962349mySkittersButton:HelpCategoryButton;
      
      private var _1012623930myScenariosReader:HelpReaderUI;
      
      private var _1313629726xmlInputGR:XML;
      
      private var _1313630085xmlInputSE:XML;
      
      public var enUSHelp:Class;
      
      private var _1313629665xmlInputES:XML;
      
      mx_internal var _bindings:Array;
      
      private var _1313629940xmlInputNO:XML;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var itITHelp:Class;
      
      public var frFRHelp:Class;
      
      private var _1313629626xmlInputDK:XML;
      
      public function QuestionsUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "id":"mainVBHelpUI",
                  "stylesFactory":function():void
                  {
                     this.verticalGap = 0;
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "name":"mainVBHelpUI",
                        "width":963,
                        "minHeight":280,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":CustomTab,
                           "id":"helpUITabLabel",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"helpUITabLabel",
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":CustomCanvas,
                           "id":"questionsUIContent",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"questionsUIContent",
                                 "styleName":"questionsUIContent",
                                 "useCustomCanvasSkin":true,
                                 "percentWidth":100,
                                 "height":170,
                                 "maxHeight":387,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"msgHelpUI",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "selectable":false,
                                          "name":"msgHelpUI",
                                          "x":18,
                                          "y":11,
                                          "percentWidth":100,
                                          "visible":false
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HelpCategoryButton,
                                    "id":"myInstallationButton",
                                    "events":{"click":"__myInstallationButton_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "imageSkin":"myInstallationButton",
                                          "imageSkinOver":"myInstallationButtonOver",
                                          "width":120,
                                          "height":120,
                                          "x":68,
                                          "y":22
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HelpCategoryButton,
                                    "id":"myScenariosButton",
                                    "events":{"click":"__myScenariosButton_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "imageSkin":"myScenariosButton",
                                          "imageSkinOver":"myScenariosButtonOver",
                                          "width":120,
                                          "height":120,
                                          "x":253,
                                          "y":22
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HelpCategoryButton,
                                    "id":"mySkittersButton",
                                    "events":{"click":"__mySkittersButton_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "imageSkin":"mySkittersButton",
                                          "imageSkinOver":"mySkittersButtonOver",
                                          "width":120,
                                          "height":120,
                                          "x":423,
                                          "y":22
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HelpCategoryButton,
                                    "id":"systemHelpButton",
                                    "events":{"click":"__systemHelpButton_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "imageSkin":"systemHelpButton",
                                          "imageSkinOver":"systemHelpButtonOver",
                                          "width":120,
                                          "height":120,
                                          "x":594,
                                          "y":21
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HelpCategoryButton,
                                    "id":"mySpaceButton",
                                    "events":{"click":"__mySpaceButton_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "imageSkin":"mySpaceButton",
                                          "imageSkinOver":"mySpaceButtonOver",
                                          "width":140,
                                          "height":120,
                                          "x":758,
                                          "y":21
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":CustomCanvas,
                           "id":"questionContentUI",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"questionContentUI",
                                 "styleName":"questionContentUI",
                                 "useCustomCanvasSkin":true,
                                 "percentWidth":100,
                                 "height":335,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"readersViewStack",
                                    "stylesFactory":function():void
                                    {
                                       this.paddingBottom = 5;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "x":5,
                                          "y":5,
                                          "percentWidth":100,
                                          "percentHeight":100,
                                          "creationPolicy":"all",
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":HelpReaderUI,
                                             "id":"myInstallationReader",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HelpReaderUI,
                                             "id":"myScenariosReader",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HelpReaderUI,
                                             "id":"mySkittersReader",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HelpReaderUI,
                                             "id":"systemReader",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100
                                                };
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":HelpMySpace,
                                             "id":"mySpaceReader",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "percentHeight":100
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
         this.frFRHelp = QuestionsUI_frFRHelp;
         this._1313629695xmlInputFR = XML(new this.frFRHelp());
         this.enUSHelp = QuestionsUI_enUSHelp;
         this._1313629660xmlInputEN = XML(new this.enUSHelp());
         this.deDEHelp = QuestionsUI_deDEHelp;
         this._1313629620xmlInputDE = XML(new this.deDEHelp());
         this.dkDKHelp = QuestionsUI_dkDKHelp;
         this._1313629626xmlInputDK = XML(new this.dkDKHelp());
         this.esESHelp = QuestionsUI_esESHelp;
         this._1313629665xmlInputES = XML(new this.esESHelp());
         this.nlNLHelp = QuestionsUI_nlNLHelp;
         this._1313629937xmlInputNL = XML(new this.nlNLHelp());
         this.fiFIHelp = QuestionsUI_fiFIHelp;
         this._1313629686xmlInputFI = XML(new this.fiFIHelp());
         this.itITHelp = QuestionsUI_itITHelp;
         this._1313629790xmlInputIT = XML(new this.itITHelp());
         this.ptPTHelp = QuestionsUI_ptPTHelp;
         this._1313630007xmlInputPT = XML(new this.ptPTHelp());
         this.noNOHelp = QuestionsUI_noNOHelp;
         this._1313629940xmlInputNO = XML(new this.noNOHelp());
         this.grGRHelp = QuestionsUI_grGRHelp;
         this._1313629726xmlInputGR = XML(new this.grGRHelp());
         this.seSEHelp = QuestionsUI_seSEHelp;
         this._1313630085xmlInputSE = XML(new this.seSEHelp());
         this.plPLHelp = QuestionsUI_plPLHelp;
         this._1313629999xmlInputPL = XML(new this.plPLHelp());
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         QuestionsUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputES() : XML
      {
         return this._1313629665xmlInputES;
      }
      
      public function set xmlInputFI(param1:XML) : void
      {
         var _loc2_:Object = this._1313629686xmlInputFI;
         if(_loc2_ !== param1)
         {
            this._1313629686xmlInputFI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputFI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputFI() : XML
      {
         return this._1313629686xmlInputFI;
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputEN() : XML
      {
         return this._1313629660xmlInputEN;
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputNO() : XML
      {
         return this._1313629940xmlInputNO;
      }
      
      public function set questionContentUI(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._1107694713questionContentUI;
         if(_loc2_ !== param1)
         {
            this._1107694713questionContentUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questionContentUI",_loc2_,param1));
         }
      }
      
      public function set xmlInputNO(param1:XML) : void
      {
         var _loc2_:Object = this._1313629940xmlInputNO;
         if(_loc2_ !== param1)
         {
            this._1313629940xmlInputNO = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputNO",_loc2_,param1));
         }
      }
      
      public function set mySpaceButton(param1:HelpCategoryButton) : void
      {
         var _loc2_:Object = this._120012428mySpaceButton;
         if(_loc2_ !== param1)
         {
            this._120012428mySpaceButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mySpaceButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainVBHelpUI() : VBox
      {
         return this._1569615846mainVBHelpUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get mySpaceReader() : HelpMySpace
      {
         return this._562720797mySpaceReader;
      }
      
      public function set xmlInputSE(param1:XML) : void
      {
         var _loc2_:Object = this._1313630085xmlInputSE;
         if(_loc2_ !== param1)
         {
            this._1313630085xmlInputSE = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputSE",_loc2_,param1));
         }
      }
      
      private function drawArrow() : void
      {
         var _loc1_:Number = 26;
         if(this._arrow == null)
         {
            this._arrow = new Sprite();
            this._arrow.graphics.clear();
            this._arrow.graphics.beginFill(16777215,1);
            this._arrow.graphics.lineTo(0,_loc1_);
            this._arrow.graphics.lineTo(16,_loc1_);
            this._arrow.graphics.lineTo(0,0);
            this._arrow.graphics.endFill();
            this._arrow.y = -_loc1_;
         }
         this.rawChildren.addChild(this._arrow);
      }
      
      public function set helpUITabLabel(param1:CustomTab) : void
      {
         var _loc2_:Object = this._1869107476helpUITabLabel;
         if(_loc2_ !== param1)
         {
            this._1869107476helpUITabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpUITabLabel",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputGR() : XML
      {
         return this._1313629726xmlInputGR;
      }
      
      override protected function initLabels() : void
      {
         var _loc1_:XMLList = null;
         var _loc2_:String = null;
         this._arrowPosition = new Point(100,300);
         super.initLabels();
         if(this.helpUITabLabel != null)
         {
            this.helpUITabLabel.tabLabel = resourceManager.getString("help","HELP_TITLE");
            this.mySpaceButton.text = resourceManager.getString("help","HELP_SOMFY");
         }
         KCTimeAnalyzer.Tracer("ResourceManager.getInstance().localeChain : " + ResourceManager.getInstance().localeChain,0);
         _loc2_ = ResourceManager.getInstance().localeChain[0] as String;
         switch(_loc2_)
         {
            case "en_US":
               _loc1_ = this.xmlInputEN.children();
               break;
            case "de_DE":
               _loc1_ = this.xmlInputDE.children();
               break;
            case "fr_FR":
               _loc1_ = this.xmlInputFR.children();
               break;
            case "es_ES":
               _loc1_ = this.xmlInputES.children();
               break;
            case "dk_DK":
               _loc1_ = this.xmlInputDK.children();
               break;
            case "nl_NL":
               _loc1_ = this.xmlInputNL.children();
               break;
            case "fi_FI":
               _loc1_ = this.xmlInputFI.children();
               break;
            case "it_IT":
               _loc1_ = this.xmlInputIT.children();
               break;
            case "pt_PT":
               _loc1_ = this.xmlInputPT.children();
               break;
            case "no_NO":
               _loc1_ = this.xmlInputNO.children();
               break;
            case "gr_GR":
               _loc1_ = this.xmlInputGR.children();
               break;
            case "se_SE":
               _loc1_ = this.xmlInputSE.children();
               break;
            case "pl_PL":
               _loc1_ = this.xmlInputPL.children();
               break;
            default:
               _loc1_ = this.xmlInputEN.children();
         }
         this.myInstallationReader.removeAll();
         this.myInstallationReader.dataProvider = _loc1_[0];
         this.myScenariosReader.removeAll();
         this.myScenariosReader.dataProvider = _loc1_[1];
         this.mySkittersReader.removeAll();
         this.mySkittersReader.dataProvider = _loc1_[2];
         this.systemReader.removeAll();
         this.systemReader.dataProvider = _loc1_[3];
      }
      
      public function set questionsUIContent(param1:CustomCanvas) : void
      {
         var _loc2_:Object = this._1383507816questionsUIContent;
         if(_loc2_ !== param1)
         {
            this._1383507816questionsUIContent = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questionsUIContent",_loc2_,param1));
         }
      }
      
      public function set mainVBHelpUI(param1:VBox) : void
      {
         var _loc2_:Object = this._1569615846mainVBHelpUI;
         if(_loc2_ !== param1)
         {
            this._1569615846mainVBHelpUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainVBHelpUI",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get helpUITabLabel() : CustomTab
      {
         return this._1869107476helpUITabLabel;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.drawArrow();
         this.arrowPosition = new Point(132,184);
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputPT() : XML
      {
         return this._1313630007xmlInputPT;
      }
      
      public function __myInstallationButton_click(param1:MouseEvent) : void
      {
         this.buttonClickHandler(param1);
      }
      
      public function __mySpaceButton_click(param1:MouseEvent) : void
      {
         this.buttonClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputPL() : XML
      {
         return this._1313629999xmlInputPL;
      }
      
      [Bindable(event="propertyChange")]
      public function get myScenariosReader() : HelpReaderUI
      {
         return this._1012623930myScenariosReader;
      }
      
      public function __systemHelpButton_click(param1:MouseEvent) : void
      {
         this.buttonClickHandler(param1);
      }
      
      public function set myScenariosButton(param1:HelpCategoryButton) : void
      {
         var _loc2_:Object = this._569915561myScenariosButton;
         if(_loc2_ !== param1)
         {
            this._569915561myScenariosButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myScenariosButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _arrowPosition() : Point
      {
         return this._201643437_arrowPosition;
      }
      
      public function set xmlInputGR(param1:XML) : void
      {
         var _loc2_:Object = this._1313629726xmlInputGR;
         if(_loc2_ !== param1)
         {
            this._1313629726xmlInputGR = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputGR",_loc2_,param1));
         }
      }
      
      public function set mySpaceReader(param1:HelpMySpace) : void
      {
         var _loc2_:Object = this._562720797mySpaceReader;
         if(_loc2_ !== param1)
         {
            this._562720797mySpaceReader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mySpaceReader",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get systemHelpButton() : HelpCategoryButton
      {
         return this._1750748514systemHelpButton;
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputIT() : XML
      {
         return this._1313629790xmlInputIT;
      }
      
      public function set readersViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._743446349readersViewStack;
         if(_loc2_ !== param1)
         {
            this._743446349readersViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"readersViewStack",_loc2_,param1));
         }
      }
      
      public function set xmlInputDE(param1:XML) : void
      {
         var _loc2_:Object = this._1313629620xmlInputDE;
         if(_loc2_ !== param1)
         {
            this._1313629620xmlInputDE = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputDE",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mySkittersReader() : HelpReaderUI
      {
         return this._694253980mySkittersReader;
      }
      
      public function set myScenariosReader(param1:HelpReaderUI) : void
      {
         var _loc2_:Object = this._1012623930myScenariosReader;
         if(_loc2_ !== param1)
         {
            this._1012623930myScenariosReader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myScenariosReader",_loc2_,param1));
         }
      }
      
      public function set xmlInputPT(param1:XML) : void
      {
         var _loc2_:Object = this._1313630007xmlInputPT;
         if(_loc2_ !== param1)
         {
            this._1313630007xmlInputPT = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputPT",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get msgHelpUI() : Text
      {
         return this._1802814346msgHelpUI;
      }
      
      public function set xmlInputDK(param1:XML) : void
      {
         var _loc2_:Object = this._1313629626xmlInputDK;
         if(_loc2_ !== param1)
         {
            this._1313629626xmlInputDK = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputDK",_loc2_,param1));
         }
      }
      
      public function set xmlInputPL(param1:XML) : void
      {
         var _loc2_:Object = this._1313629999xmlInputPL;
         if(_loc2_ !== param1)
         {
            this._1313629999xmlInputPL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputPL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myInstallationReader() : HelpReaderUI
      {
         return this._1316406889myInstallationReader;
      }
      
      [Bindable(event="propertyChange")]
      public function get questionContentUI() : CustomCanvas
      {
         return this._1107694713questionContentUI;
      }
      
      [Bindable(event="propertyChange")]
      public function get mySpaceButton() : HelpCategoryButton
      {
         return this._120012428mySpaceButton;
      }
      
      public function __myScenariosButton_click(param1:MouseEvent) : void
      {
         this.buttonClickHandler(param1);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:QuestionsUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._QuestionsUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_QuestionsUIWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      public function get xmlInputSE() : XML
      {
         return this._1313630085xmlInputSE;
      }
      
      [Bindable(event="propertyChange")]
      public function get questionsUIContent() : CustomCanvas
      {
         return this._1383507816questionsUIContent;
      }
      
      private function set arrowPosition(param1:Point) : void
      {
         this._arrow.x = param1.x;
         this._arrow.y = param1.y;
      }
      
      public function set mySkittersButton(param1:HelpCategoryButton) : void
      {
         var _loc2_:Object = this._1136962349mySkittersButton;
         if(_loc2_ !== param1)
         {
            this._1136962349mySkittersButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mySkittersButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myScenariosButton() : HelpCategoryButton
      {
         return this._569915561myScenariosButton;
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
      
      [Bindable(event="propertyChange")]
      public function get readersViewStack() : ViewStack
      {
         return this._743446349readersViewStack;
      }
      
      public function set myInstallationButton(param1:HelpCategoryButton) : void
      {
         var _loc2_:Object = this._873698520myInstallationButton;
         if(_loc2_ !== param1)
         {
            this._873698520myInstallationButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myInstallationButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputDE() : XML
      {
         return this._1313629620xmlInputDE;
      }
      
      public function set systemReader(param1:HelpReaderUI) : void
      {
         var _loc2_:Object = this._730982446systemReader;
         if(_loc2_ !== param1)
         {
            this._730982446systemReader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"systemReader",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputDK() : XML
      {
         return this._1313629626xmlInputDK;
      }
      
      public function set xmlInputES(param1:XML) : void
      {
         var _loc2_:Object = this._1313629665xmlInputES;
         if(_loc2_ !== param1)
         {
            this._1313629665xmlInputES = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputES",_loc2_,param1));
         }
      }
      
      public function set xmlInputIT(param1:XML) : void
      {
         var _loc2_:Object = this._1313629790xmlInputIT;
         if(_loc2_ !== param1)
         {
            this._1313629790xmlInputIT = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputIT",_loc2_,param1));
         }
      }
      
      public function set mySkittersReader(param1:HelpReaderUI) : void
      {
         var _loc2_:Object = this._694253980mySkittersReader;
         if(_loc2_ !== param1)
         {
            this._694253980mySkittersReader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mySkittersReader",_loc2_,param1));
         }
      }
      
      public function set systemHelpButton(param1:HelpCategoryButton) : void
      {
         var _loc2_:Object = this._1750748514systemHelpButton;
         if(_loc2_ !== param1)
         {
            this._1750748514systemHelpButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"systemHelpButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mySkittersButton() : HelpCategoryButton
      {
         return this._1136962349mySkittersButton;
      }
      
      private function _QuestionsUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = myInstallationReader.title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            myInstallationButton.text = param1;
         },"myInstallationButton.text");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = myScenariosReader.title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            myScenariosButton.text = param1;
         },"myScenariosButton.text");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = mySkittersReader.title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            mySkittersButton.text = param1;
         },"mySkittersButton.text");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = systemReader.title;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            systemHelpButton.text = param1;
         },"systemHelpButton.text");
         result[3] = binding;
         return result;
      }
      
      public function set myInstallationReader(param1:HelpReaderUI) : void
      {
         var _loc2_:Object = this._1316406889myInstallationReader;
         if(_loc2_ !== param1)
         {
            this._1316406889myInstallationReader = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"myInstallationReader",_loc2_,param1));
         }
      }
      
      public function set xmlInputEN(param1:XML) : void
      {
         var _loc2_:Object = this._1313629660xmlInputEN;
         if(_loc2_ !== param1)
         {
            this._1313629660xmlInputEN = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputEN",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get myInstallationButton() : HelpCategoryButton
      {
         return this._873698520myInstallationButton;
      }
      
      public function set xmlInputNL(param1:XML) : void
      {
         var _loc2_:Object = this._1313629937xmlInputNL;
         if(_loc2_ !== param1)
         {
            this._1313629937xmlInputNL = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputNL",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get systemReader() : HelpReaderUI
      {
         return this._730982446systemReader;
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputNL() : XML
      {
         return this._1313629937xmlInputNL;
      }
      
      public function set msgHelpUI(param1:Text) : void
      {
         var _loc2_:Object = this._1802814346msgHelpUI;
         if(_loc2_ !== param1)
         {
            this._1802814346msgHelpUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgHelpUI",_loc2_,param1));
         }
      }
      
      private function buttonClickHandler(param1:MouseEvent) : void
      {
         if(param1.currentTarget == this.myInstallationButton)
         {
            if(this.selectedCategory != 0)
            {
               this.readersViewStack.selectedIndex = 0;
               this.selectedCategory = 0;
               this.arrowPosition = new Point(132,184);
            }
         }
         else if(param1.currentTarget == this.myScenariosButton)
         {
            if(this.selectedCategory != 1)
            {
               this.selectedCategory = 1;
               this.readersViewStack.selectedIndex = 1;
               this.arrowPosition = new Point(315,184);
            }
         }
         else if(param1.currentTarget == this.mySkittersButton)
         {
            if(this.selectedCategory != 2)
            {
               this.selectedCategory = 2;
               this.readersViewStack.selectedIndex = 2;
               this.arrowPosition = new Point(485,184);
            }
         }
         else if(param1.currentTarget == this.systemHelpButton)
         {
            if(this.selectedCategory != 3)
            {
               this.selectedCategory = 3;
               this.readersViewStack.selectedIndex = 3;
               this.arrowPosition = new Point(656,184);
            }
         }
         else if(param1.currentTarget == this.mySpaceButton)
         {
            if(this.selectedCategory != 4)
            {
               this.selectedCategory = 4;
               this.readersViewStack.selectedIndex = 4;
               this.arrowPosition = new Point(830,184);
            }
         }
      }
      
      public function __mySkittersButton_click(param1:MouseEvent) : void
      {
         this.buttonClickHandler(param1);
      }
      
      private function _QuestionsUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.myInstallationReader.title;
         _loc1_ = this.myScenariosReader.title;
         _loc1_ = this.mySkittersReader.title;
         _loc1_ = this.systemReader.title;
      }
      
      public function set xmlInputFR(param1:XML) : void
      {
         var _loc2_:Object = this._1313629695xmlInputFR;
         if(_loc2_ !== param1)
         {
            this._1313629695xmlInputFR = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlInputFR",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlInputFR() : XML
      {
         return this._1313629695xmlInputFR;
      }
   }
}
