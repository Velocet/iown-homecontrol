package
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.common.GeneralFactory;
   import com.scenarioLauncher.components.skins.ButtonComboSkin;
   import com.scenarioLauncher.configuration.BundleManager;
   import com.scenarioLauncher.configuration.Languages;
   import com.scenarioLauncher.managers.CookieManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.persistence.LocalSQLiteConnection;
   import com.scenarioLauncher.persistence.SchemaUpdates;
   import com.scenarioLauncher.views.MainUI;
   import com.scenarioLauncher.views.WelcomeUI;
   import com.scenarioLauncher.views.skins.ButtonFocus;
   import com.scenarioLauncher.views.skins.ButtonTabSkin;
   import com.scenarioLauncher.views.skins.ButtonWhiteSkin;
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
   import mx.core.UIComponentDescriptor;
   import mx.core.WindowedApplication;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.resources.ResourceManager;
   import mx.styles.*;
   
   public class ScenarioLauncher extends WindowedApplication
   {
      
      mx_internal static var _ScenarioLauncher_StylesInit_done:Boolean = false;
       
      
      private var _embed_css__1507538325:Class;
      
      private var _embed_css__1518890445:Class;
      
      private var _embed_css__180618837:Class;
      
      private var _1233099618welcome:WelcomeUI;
      
      private var _embed_css__981683049:Class;
      
      private var _3773vs:ViewStack;
      
      private var _embed_css__50098068:Class;
      
      private var _embed_css__1730201628:Class;
      
      private var _embed_css__1030552498:Class;
      
      private var _embed_css__1946623140:Class;
      
      private var _embed_css__2117973416:Class;
      
      private var _embed_css__1514065036:Class;
      
      private var _embed_css__100843225:Class;
      
      private var _embed_css__113697673:Class;
      
      private var _embed_css__1132908206:Class;
      
      private var _embed_css__759066880:Class;
      
      private var _embed_css__674089953:Class;
      
      private var _embed_css__1688580934:Class;
      
      private var _embed_css__367017111:Class;
      
      private var _embed_css__1168905617:Class;
      
      private var _embed_css__1483100648:Class;
      
      private var _embed_css__1903577795:Class;
      
      private var _embed_css__1899085558:Class;
      
      private var _embed_css__117426742:Class;
      
      private var _embed_css__1464035474:Class;
      
      private var _embed_css__740168807:Class;
      
      private var _embed_css__449454519:Class;
      
      private var _embed_css__860132372:Class;
      
      private var _embed_css__1455380921:Class;
      
      private var _embed_css__973782544:Class;
      
      private var _embed_css__923818668:Class;
      
      private var _embed_css__1673420301:Class;
      
      private var _embed_css__1907406376:Class;
      
      private var _embed_css__123404198:Class;
      
      private var _embed_css__1947189436:Class;
      
      private var _embed_css__1032849783:Class;
      
      private var _embed__font_VerdanaB_bold_normal_163438215:Class;
      
      private var _embed_css__852217778:Class;
      
      private var _embed__font_VerdanaBI_bold_italic_1824725416:Class;
      
      private var _embed_css__1142336531:Class;
      
      private var _embed_css__1043139407:Class;
      
      private var _embed_css__1413386487:Class;
      
      private var _embed_css__547746448:Class;
      
      private var _embed_css__599586122:Class;
      
      private var _embed_css__1912710175:Class;
      
      private var _embed_css__1124217900:Class;
      
      private var welcomeTimer:Timer;
      
      private var _embed_css__1406180068:Class;
      
      private var _embed_css__1729918190:Class;
      
      private var _embed_css__1703949786:Class;
      
      private var _embed_css__1565861255:Class;
      
      private var _embed_css__1431623306:Class;
      
      private var _embed_css__1019202079:Class;
      
      private var _embed_css__853491777:Class;
      
      private var _embed__font_VerdanaR_medium_normal_573203099:Class;
      
      private var _embed_css__438654036:Class;
      
      private var _embed_css__90776346:Class;
      
      private var _embed_css__629670285:Class;
      
      private var _embed_css__541388782:Class;
      
      private var _embed__font_VerdanaI_medium_italic_1012771143:Class;
      
      private var _embed_css__1439205143:Class;
      
      private var _embed_css__1122270020:Class;
      
      private var _embed_css__102801098:Class;
      
      private var _embed_css__237328985:Class;
      
      private var _embed_css__1623536245:Class;
      
      private var _embed_css__1605162060:Class;
      
      private var _embed_css__726471953:Class;
      
      private var _embed_css__28288643:Class;
      
      private var _embed_css__1912013955:Class;
      
      private var _embed_css__88066507:Class;
      
      private var _1081571827mainUI:MainUI;
      
      private var _embed_css__787028676:Class;
      
      private var _embed_css__1023632642:Class;
      
      private var _embed_css__473449839:Class;
      
      private var _embed_css__2114217240:Class;
      
      private var _embed_css__1144317259:Class;
      
      private var _embed_css__399578443:Class;
      
      private var _embed_css__298674617:Class;
      
      private var _embed_css__1429403880:Class;
      
      private var _embed_css__1903532963:Class;
      
      private var _embed_css__2060749215:Class;
      
      private var _embed_css__906833417:Class;
      
      private var _embed_css__236342691:Class;
      
      private var _embed_css__751504411:Class;
      
      private var _embed_css__958519888:Class;
      
      private var _embed_css__626407922:Class;
      
      private var _embed_css__534553122:Class;
      
      private var _embed_css__1800898385:Class;
      
      private var _embed_css__1189040287:Class;
      
      private var _embed_css__1048155704:Class;
      
      private var _embed_css__228769364:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_css__224273198:Class;
      
      private var _embed_css__756691243:Class;
      
      private var _embed_css__1923607522:Class;
      
      public function ScenarioLauncher()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":WindowedApplication,
            "propertiesFactory":function():Object
            {
               return {
                  "width":1024,
                  "height":768,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"vs",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":WelcomeUI,
                              "id":"welcome",
                              "events":{"click":"__welcome_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":MainUI,
                              "id":"mainUI",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"mainUI",
                                    "styleName":"mainUI",
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
         });
         this._embed__font_VerdanaBI_bold_italic_1824725416 = ScenarioLauncher__embed__font_VerdanaBI_bold_italic_1824725416;
         this._embed__font_VerdanaB_bold_normal_163438215 = ScenarioLauncher__embed__font_VerdanaB_bold_normal_163438215;
         this._embed__font_VerdanaI_medium_italic_1012771143 = ScenarioLauncher__embed__font_VerdanaI_medium_italic_1012771143;
         this._embed__font_VerdanaR_medium_normal_573203099 = ScenarioLauncher__embed__font_VerdanaR_medium_normal_573203099;
         this._embed_css__100843225 = ScenarioLauncher__embed_css__100843225;
         this._embed_css__1019202079 = ScenarioLauncher__embed_css__1019202079;
         this._embed_css__1023632642 = ScenarioLauncher__embed_css__1023632642;
         this._embed_css__102801098 = ScenarioLauncher__embed_css__102801098;
         this._embed_css__1030552498 = ScenarioLauncher__embed_css__1030552498;
         this._embed_css__1032849783 = ScenarioLauncher__embed_css__1032849783;
         this._embed_css__1043139407 = ScenarioLauncher__embed_css__1043139407;
         this._embed_css__1048155704 = ScenarioLauncher__embed_css__1048155704;
         this._embed_css__1122270020 = ScenarioLauncher__embed_css__1122270020;
         this._embed_css__1124217900 = ScenarioLauncher__embed_css__1124217900;
         this._embed_css__1132908206 = ScenarioLauncher__embed_css__1132908206;
         this._embed_css__113697673 = ScenarioLauncher__embed_css__113697673;
         this._embed_css__1142336531 = ScenarioLauncher__embed_css__1142336531;
         this._embed_css__1144317259 = ScenarioLauncher__embed_css__1144317259;
         this._embed_css__1168905617 = ScenarioLauncher__embed_css__1168905617;
         this._embed_css__117426742 = ScenarioLauncher__embed_css__117426742;
         this._embed_css__1189040287 = ScenarioLauncher__embed_css__1189040287;
         this._embed_css__123404198 = ScenarioLauncher__embed_css__123404198;
         this._embed_css__1406180068 = ScenarioLauncher__embed_css__1406180068;
         this._embed_css__1413386487 = ScenarioLauncher__embed_css__1413386487;
         this._embed_css__1429403880 = ScenarioLauncher__embed_css__1429403880;
         this._embed_css__1431623306 = ScenarioLauncher__embed_css__1431623306;
         this._embed_css__1439205143 = ScenarioLauncher__embed_css__1439205143;
         this._embed_css__1455380921 = ScenarioLauncher__embed_css__1455380921;
         this._embed_css__1464035474 = ScenarioLauncher__embed_css__1464035474;
         this._embed_css__1483100648 = ScenarioLauncher__embed_css__1483100648;
         this._embed_css__1507538325 = ScenarioLauncher__embed_css__1507538325;
         this._embed_css__1514065036 = ScenarioLauncher__embed_css__1514065036;
         this._embed_css__1518890445 = ScenarioLauncher__embed_css__1518890445;
         this._embed_css__1565861255 = ScenarioLauncher__embed_css__1565861255;
         this._embed_css__1605162060 = ScenarioLauncher__embed_css__1605162060;
         this._embed_css__1623536245 = ScenarioLauncher__embed_css__1623536245;
         this._embed_css__1673420301 = ScenarioLauncher__embed_css__1673420301;
         this._embed_css__1688580934 = ScenarioLauncher__embed_css__1688580934;
         this._embed_css__1703949786 = ScenarioLauncher__embed_css__1703949786;
         this._embed_css__1729918190 = ScenarioLauncher__embed_css__1729918190;
         this._embed_css__1730201628 = ScenarioLauncher__embed_css__1730201628;
         this._embed_css__1800898385 = ScenarioLauncher__embed_css__1800898385;
         this._embed_css__180618837 = ScenarioLauncher__embed_css__180618837;
         this._embed_css__1899085558 = ScenarioLauncher__embed_css__1899085558;
         this._embed_css__1903532963 = ScenarioLauncher__embed_css__1903532963;
         this._embed_css__1903577795 = ScenarioLauncher__embed_css__1903577795;
         this._embed_css__1907406376 = ScenarioLauncher__embed_css__1907406376;
         this._embed_css__1912013955 = ScenarioLauncher__embed_css__1912013955;
         this._embed_css__1912710175 = ScenarioLauncher__embed_css__1912710175;
         this._embed_css__1923607522 = ScenarioLauncher__embed_css__1923607522;
         this._embed_css__1946623140 = ScenarioLauncher__embed_css__1946623140;
         this._embed_css__1947189436 = ScenarioLauncher__embed_css__1947189436;
         this._embed_css__2060749215 = ScenarioLauncher__embed_css__2060749215;
         this._embed_css__2114217240 = ScenarioLauncher__embed_css__2114217240;
         this._embed_css__2117973416 = ScenarioLauncher__embed_css__2117973416;
         this._embed_css__224273198 = ScenarioLauncher__embed_css__224273198;
         this._embed_css__228769364 = ScenarioLauncher__embed_css__228769364;
         this._embed_css__236342691 = ScenarioLauncher__embed_css__236342691;
         this._embed_css__237328985 = ScenarioLauncher__embed_css__237328985;
         this._embed_css__28288643 = ScenarioLauncher__embed_css__28288643;
         this._embed_css__298674617 = ScenarioLauncher__embed_css__298674617;
         this._embed_css__367017111 = ScenarioLauncher__embed_css__367017111;
         this._embed_css__399578443 = ScenarioLauncher__embed_css__399578443;
         this._embed_css__438654036 = ScenarioLauncher__embed_css__438654036;
         this._embed_css__449454519 = ScenarioLauncher__embed_css__449454519;
         this._embed_css__473449839 = ScenarioLauncher__embed_css__473449839;
         this._embed_css__50098068 = ScenarioLauncher__embed_css__50098068;
         this._embed_css__534553122 = ScenarioLauncher__embed_css__534553122;
         this._embed_css__541388782 = ScenarioLauncher__embed_css__541388782;
         this._embed_css__547746448 = ScenarioLauncher__embed_css__547746448;
         this._embed_css__599586122 = ScenarioLauncher__embed_css__599586122;
         this._embed_css__626407922 = ScenarioLauncher__embed_css__626407922;
         this._embed_css__629670285 = ScenarioLauncher__embed_css__629670285;
         this._embed_css__674089953 = ScenarioLauncher__embed_css__674089953;
         this._embed_css__726471953 = ScenarioLauncher__embed_css__726471953;
         this._embed_css__740168807 = ScenarioLauncher__embed_css__740168807;
         this._embed_css__751504411 = ScenarioLauncher__embed_css__751504411;
         this._embed_css__756691243 = ScenarioLauncher__embed_css__756691243;
         this._embed_css__759066880 = ScenarioLauncher__embed_css__759066880;
         this._embed_css__787028676 = ScenarioLauncher__embed_css__787028676;
         this._embed_css__852217778 = ScenarioLauncher__embed_css__852217778;
         this._embed_css__853491777 = ScenarioLauncher__embed_css__853491777;
         this._embed_css__860132372 = ScenarioLauncher__embed_css__860132372;
         this._embed_css__88066507 = ScenarioLauncher__embed_css__88066507;
         this._embed_css__906833417 = ScenarioLauncher__embed_css__906833417;
         this._embed_css__90776346 = ScenarioLauncher__embed_css__90776346;
         this._embed_css__923818668 = ScenarioLauncher__embed_css__923818668;
         this._embed_css__958519888 = ScenarioLauncher__embed_css__958519888;
         this._embed_css__973782544 = ScenarioLauncher__embed_css__973782544;
         this._embed_css__981683049 = ScenarioLauncher__embed_css__981683049;
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.showFlexChrome = false;
         };
         mx_internal::_ScenarioLauncher_StylesInit();
         this.layout = "absolute";
         this.maxWidth = 1024;
         this.maxHeight = 768;
         this.width = 1024;
         this.height = 768;
         this.cacheAsBitmap = false;
         this.addEventListener("creationComplete",this.___ScenarioLauncher_WindowedApplication1_creationComplete);
         this.addEventListener("close",this.___ScenarioLauncher_WindowedApplication1_close);
         this.addEventListener("initialize",this.___ScenarioLauncher_WindowedApplication1_initialize);
         this.addEventListener("keyDown",this.___ScenarioLauncher_WindowedApplication1_keyDown);
      }
      
      [Bindable(event="propertyChange")]
      public function get mainUI() : MainUI
      {
         return this._1081571827mainUI;
      }
      
      public function ___ScenarioLauncher_WindowedApplication1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      public function set mainUI(param1:MainUI) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1081571827mainUI;
         if(_loc2_ !== param1)
         {
            this._1081571827mainUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainUI",_loc2_,param1));
         }
      }
      
      private function closeHandler(param1:Event) : void
      {
         LocalSQLiteConnection.sqlConnection.close();
      }
      
      private function launchWelcomeTimer() : void
      {
         this.welcomeTimer = new Timer(40000,1);
         this.welcomeTimer.addEventListener(TimerEvent.TIMER,this.welcomeTimerHandler);
         this.welcomeTimer.start();
      }
      
      public function ___ScenarioLauncher_WindowedApplication1_close(param1:Event) : void
      {
         this.closeHandler(param1);
      }
      
      public function __welcome_click(param1:MouseEvent) : void
      {
         this.welcomeClickHandler();
      }
      
      private function OnKeyDown(param1:KeyboardEvent) : void
      {
         KCTimeAnalyzer.Tracer("PRESS KEYBOARD",0,this.className);
      }
      
      [Bindable(event="propertyChange")]
      public function get vs() : ViewStack
      {
         return this._3773vs;
      }
      
      public function set welcome(param1:WelcomeUI) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1233099618welcome;
         if(_loc2_ !== param1)
         {
            this._1233099618welcome = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"welcome",_loc2_,param1));
         }
      }
      
      public function welcomeTimerHandler(param1:TimerEvent) : void
      {
         this.welcome.scrollingText.stop();
         this.vs.selectedChild = this.mainUI;
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         this.launchWelcomeTimer();
         nativeWindow.x = (0 - 0) / 2;
         nativeWindow.y = (0 - 0) / 2;
         nativeWindow.stage.quality = StageQuality.BEST;
         SchemaUpdates.update_schema();
      }
      
      private function welcomeClickHandler() : void
      {
         this.welcomeTimer.stop();
         this.welcomeTimerHandler(null);
      }
      
      [Bindable(event="propertyChange")]
      public function get welcome() : WelcomeUI
      {
         return this._1233099618welcome;
      }
      
      public function set vs(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._3773vs;
         if(_loc2_ !== param1)
         {
            this._3773vs = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vs",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function initializeHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         CookieManager.instance.load();
         Globals.locale = Languages.instance.getDefaultLanguage();
         if(false)
         {
            GeneralFactory.bundleLoader.loadLanguageBundle(BundleManager.LANGUAGES_BUNDLE);
            for each(_loc2_ in BundleManager.LOCALES_FILES)
            {
               GeneralFactory.bundleLoader.loadBundle(Globals.locale,_loc2_);
            }
         }
         ResourceManager.getInstance().update();
         KCTimeAnalyzer.Tracer("Locales loaded",10,this.className);
      }
      
      mx_internal function _ScenarioLauncher_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         if(mx_internal::_ScenarioLauncher_StylesInit_done)
         {
            return;
         }
         mx_internal::_ScenarioLauncher_StylesInit_done = true;
         style = StyleManager.getStyleDeclaration(".createScenarioChooseModeUILabels");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".createScenarioChooseModeUILabels",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 0;
               this.fontStyle = "normal";
               this.textAlign = "center";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainUIHeaderButtons");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainUIHeaderButtons",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.downSkin = ButtonTabSkin;
               this.overSkin = ButtonTabSkin;
               this.paddingTop = 4;
               this.backgroundColor = 12761782;
               this.letterSpacing = -0.1;
               this.selectedUpSkin = ButtonTabSkin;
               this.textRollOverColor = 16777215;
               this.fontSize = 11;
               this.paddingLeft = 4;
               this.paddingRight = 4;
               this.upSkin = ButtonTabSkin;
               this.fontWeight = "bold";
               this.selectedDownSkin = ButtonTabSkin;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontThickness = 50;
               this.fontFamily = "VerdanaB";
               this.paddingBottom = 0;
               this.textSelectedColor = 16777215;
               this.selectedOverSkin = ButtonTabSkin;
            };
         }
         style = StyleManager.getStyleDeclaration(".installationUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".installationUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR24B");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR24B",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 24;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileExteriorHeating");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileExteriorHeating",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileTestAndEvaluation");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileTestAndEvaluation",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".mySkittersButtonOver");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mySkittersButtonOver",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__726471953;
               this.downSkin = _embed_css__726471953;
               this.overSkin = _embed_css__726471953;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR12WCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR12WCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".empty");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".empty",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1464035474;
               this.overSkin = _embed_css__1464035474;
               this.downSkin = _embed_css__1464035474;
               this.disabledSkin = _embed_css__1464035474;
            };
         }
         style = StyleManager.getStyleDeclaration(".btnDeleteScenario");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnDeleteScenario",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1903577795;
               this.downSkin = _embed_css__1903577795;
               this.overSkin = _embed_css__1903577795;
               this.paddingTop = 4;
               this.paddingBottom = 0;
               this.paddingLeft = 0;
               this.paddingRight = 2;
            };
         }
         style = StyleManager.getStyleDeclaration(".nextButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".nextButtonStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__599586122;
               this.downSkin = _embed_css__860132372;
               this.overSkin = _embed_css__860132372;
               this.disabledSkin = _embed_css__1605162060;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB18BC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB18BC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 0;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".myScenariosButtonOver");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".myScenariosButtonOver",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__629670285;
               this.downSkin = _embed_css__629670285;
               this.overSkin = _embed_css__629670285;
            };
         }
         style = StyleManager.getStyleDeclaration(".installationUIActuatorsNavigationPrevious");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".installationUIActuatorsNavigationPrevious",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__298674617;
               this.selectedDownSkin = _embed_css__1912710175;
               this.downSkin = _embed_css__1912710175;
               this.overSkin = _embed_css__1912710175;
               this.selectedUpSkin = _embed_css__298674617;
               this.selectedOverSkin = _embed_css__1912710175;
            };
         }
         style = StyleManager.getStyleDeclaration(".scrollDownButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scrollDownButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1455380921;
               this.downSkin = _embed_css__1455380921;
               this.overSkin = _embed_css__852217778;
               this.disabledSkin = _embed_css__1455380921;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BCCP");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BCCP",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.paddingTop = 6;
               this.borderColor = 16758037;
               this.color = 0;
               this.focusAlpha = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
               this.paddingBottom = 6;
            };
         }
         style = StyleManager.getStyleDeclaration(".VRI12YCL0DISABLED");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VRI12YCL0DISABLED",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 7303023;
               this.textAlign = "center";
               this.fontStyle = "italic";
               this.fontFamily = "VerdanaI";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".comboBoxIconSystem");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".comboBoxIconSystem",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderSkin = _embed_css__1124217900;
            };
         }
         style = StyleManager.getStyleDeclaration(".myScenariosButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".myScenariosButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1688580934;
               this.downSkin = _embed_css__1688580934;
               this.overSkin = _embed_css__1688580934;
            };
         }
         style = StyleManager.getStyleDeclaration(".btnMinimize");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnMinimize",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__2114217240;
               this.selectedDownSkin = _embed_css__541388782;
               this.downSkin = _embed_css__541388782;
               this.overSkin = _embed_css__541388782;
               this.selectedUpSkin = _embed_css__2114217240;
               this.selectedOverSkin = _embed_css__541388782;
            };
         }
         style = StyleManager.getStyleDeclaration(".scenarioCanvas");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scenarioCanvas",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.borderThickness = 0;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".create");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".create",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1043139407;
               this.overSkin = _embed_css__1043139407;
               this.downSkin = _embed_css__1043139407;
               this.color = 16777215;
               this.disabledSkin = _embed_css__1565861255;
            };
         }
         style = StyleManager.getStyleDeclaration(".VRI18BC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VRI18BC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "italic";
               this.fontFamily = "VerdanaI";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BCL3");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BCL3",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 3;
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".previousButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".previousButtonStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__298674617;
               this.downSkin = _embed_css__1912710175;
               this.overSkin = _embed_css__1912710175;
               this.disabledSkin = _embed_css__1439205143;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB12WCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB12WCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.leading = 0;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BCL1");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BCL1",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 1;
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpButtonVBox");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpButtonVBox",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 0;
               this.horizontalAlign = "center";
               this.verticalAlign = "middle";
               this.backgroundAlpha = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB10WC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB10WC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 10;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB11WC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB11WC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 11;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileHorizontalAwning");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileHorizontalAwning",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__534553122;
               this.overSkin = _embed_css__981683049;
               this.downSkin = _embed_css__981683049;
               this.disabledSkin = _embed_css__1168905617;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileLouvreBlind");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileLouvreBlind",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR12BCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR12BCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileLight");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileLight",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__90776346;
               this.overSkin = _embed_css__2060749215;
               this.downSkin = _embed_css__2060749215;
               this.disabledSkin = _embed_css__740168807;
            };
         }
         style = StyleManager.getStyleDeclaration(".systemHelpButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".systemHelpButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__958519888;
               this.downSkin = _embed_css__958519888;
               this.overSkin = _embed_css__958519888;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileTemperatureControlInterface");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileTemperatureControlInterface",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderThickness = 1;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileCentralHouseControl");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileCentralHouseControl",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".questionContentUI");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".questionContentUI",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 16777215;
               this.backgroundColor = 16777215;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 0;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration("WindowedApplication");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("WindowedApplication",style,false);
         }
         style = StyleManager.getStyleDeclaration(".VB12WC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB12WC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB15WC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB15WC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 15;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileVerticalExteriorAwning");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileVerticalExteriorAwning",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__50098068;
               this.overSkin = _embed_css__756691243;
               this.downSkin = _embed_css__756691243;
               this.disabledSkin = _embed_css__367017111;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BCP");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BCP",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.paddingTop = 7;
               this.borderColor = 16758037;
               this.color = 0;
               this.focusAlpha = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
               this.paddingLeft = 10;
               this.paddingBottom = 7;
               this.paddingRight = 10;
            };
         }
         style = StyleManager.getStyleDeclaration(".remotesUIremotes");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remotesUIremotes",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundAlpha = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB13WC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB13WC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".scenariosUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scenariosUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".remotesNavigationNext");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remotesNavigationNext",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__599586122;
               this.selectedDownSkin = _embed_css__599586122;
               this.downSkin = _embed_css__599586122;
               this.overSkin = _embed_css__599586122;
               this.selectedUpSkin = _embed_css__599586122;
               this.selectedOverSkin = _embed_css__599586122;
            };
         }
         style = StyleManager.getStyleDeclaration(".btnDeleteScenarioOpen");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnDeleteScenarioOpen",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__906833417;
               this.downSkin = _embed_css__906833417;
               this.overSkin = _embed_css__906833417;
               this.paddingTop = 4;
               this.paddingBottom = 0;
               this.paddingLeft = 0;
               this.paddingRight = 2;
            };
         }
         style = StyleManager.getStyleDeclaration(".startUpdate");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".startUpdate",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__236342691;
               this.selectedDownSkin = _embed_css__1406180068;
               this.downSkin = _embed_css__1406180068;
               this.overSkin = _embed_css__1406180068;
               this.selectedUpSkin = _embed_css__236342691;
               this.selectedOverSkin = _embed_css__1406180068;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileNone");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileNone",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".comboBox");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".comboBox",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__1032849783;
               this.overSkin = ButtonComboSkin;
               this.downSkin = ButtonComboSkin;
               this.paddingTop = 3;
               this.fontStyle = "normal";
               this.selectedUpSkin = ButtonComboSkin;
               this.fontSize = 13;
               this.paddingLeft = 3;
               this.paddingRight = 3;
               this.upSkin = ButtonComboSkin;
               this.selectedDownSkin = ButtonComboSkin;
               this.color = 16777215;
               this.fontFamily = "VerdanaR";
               this.paddingBottom = 3;
               this.selectedOverSkin = ButtonComboSkin;
            };
         }
         style = StyleManager.getStyleDeclaration(".scenariosUITab");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scenariosUITab",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 0;
               this.borderSkin = _embed_css__1903532963;
               this.fontFamily = "VerdanaB";
               this.fontSize = 24;
            };
         }
         style = StyleManager.getStyleDeclaration(".smallNextButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".smallNextButtonStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__853491777;
               this.downSkin = _embed_css__237328985;
               this.overSkin = _embed_css__237328985;
               this.disabledSkin = _embed_css__237328985;
            };
         }
         style = StyleManager.getStyleDeclaration(".labelsR11White");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".labelsR11White",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 16777215;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 11;
            };
         }
         style = StyleManager.getStyleDeclaration(".mySkittersButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mySkittersButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__117426742;
               this.downSkin = _embed_css__117426742;
               this.overSkin = _embed_css__117426742;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpAnswer");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpAnswer",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BCLm1");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BCLm1",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = -1;
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".remotesUITab");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remotesUITab",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 0;
               this.borderSkin = _embed_css__1903532963;
               this.fontFamily = "VerdanaB";
               this.fontSize = 24;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileInteriorVerticalBlind");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileInteriorVerticalBlind",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__50098068;
               this.overSkin = _embed_css__756691243;
               this.downSkin = _embed_css__756691243;
               this.disabledSkin = _embed_css__367017111;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileRemoteController");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileRemoteController",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".remoteConfigurationUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remoteConfigurationUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.backgroundColor = 0;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 0;
               this.borderThickness = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.cornerRadiusTR = 0;
               this.fontSize = 12;
               this.cornerRadiusBL = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".smallPreviousButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".smallPreviousButtonStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1923607522;
               this.downSkin = _embed_css__438654036;
               this.overSkin = _embed_css__438654036;
               this.disabledSkin = _embed_css__438654036;
            };
         }
         style = StyleManager.getStyleDeclaration(".VW10W");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VW10W",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "normal";
               this.color = 16777215;
               this.fontFamily = "VerdanaR";
               this.fontSize = 10;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainUIHeaderButtonsSelected");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainUIHeaderButtonsSelected",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.downSkin = ButtonTabSkin;
               this.overSkin = ButtonTabSkin;
               this.paddingTop = 3;
               this.backgroundColor = 16777215;
               this.letterSpacing = -0.1;
               this.selectedUpSkin = ButtonTabSkin;
               this.textRollOverColor = 0;
               this.fontSize = 11;
               this.paddingLeft = 3;
               this.paddingRight = 4;
               this.upSkin = ButtonTabSkin;
               this.fontWeight = "bold";
               this.selectedDownSkin = ButtonTabSkin;
               this.color = 0;
               this.textAlign = "center";
               this.fontThickness = 50;
               this.fontFamily = "VerdanaB";
               this.paddingBottom = 0;
               this.textSelectedColor = 0;
               this.selectedOverSkin = ButtonTabSkin;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpRemoteDescription");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpRemoteDescription",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 10;
            };
         }
         style = StyleManager.getStyleDeclaration(".myInstallationButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".myInstallationButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1518890445;
               this.downSkin = _embed_css__1518890445;
               this.overSkin = _embed_css__1518890445;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpButtonText");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpButtonText",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontStyle = "bold";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
               this.fontWeigth = "bold";
            };
         }
         style = StyleManager.getStyleDeclaration(".lbRemoteConfigurationUIPersonnalisation");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".lbRemoteConfigurationUIPersonnalisation",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB13BCLSm04");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB13BCLSm04",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.letterSpacing = -0.4;
               this.color = 0;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpQuestionsButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpQuestionsButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1946623140;
               this.downSkin = _embed_css__1946623140;
               this.overSkin = _embed_css__1946623140;
            };
         }
         style = StyleManager.getStyleDeclaration(".questionsUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".questionsUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 0;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainUIHeader");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainUIHeader",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderThickness = 1;
            };
         }
         style = StyleManager.getStyleDeclaration(".installationUIActuators");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".installationUIActuators",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundAlpha = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB12WCL0LSm01");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB12WCL0LSm01",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.leading = 0;
               this.letterSpacing = -0.1;
               this.color = 16777215;
               this.fontThickness = 50;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".scenariosUpdateUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scenariosUpdateUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 0;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".manualProgressBar");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".manualProgressBar",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 16777215;
               this.trackColors = [5084079,5084079];
               this.barSkin = _embed_css__28288643;
               this.indeterminateMoveInterval = 36;
            };
         }
         style = StyleManager.getStyleDeclaration(".remoteConfigurationUICase");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remoteConfigurationUICase",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = ButtonWhiteSkin;
               this.selectedDownSkin = ButtonWhiteSkin;
               this.downSkin = ButtonWhiteSkin;
               this.overSkin = ButtonWhiteSkin;
               this.selectedUpSkin = ButtonWhiteSkin;
               this.selectedOverSkin = ButtonWhiteSkin;
            };
         }
         style = StyleManager.getStyleDeclaration(".remoteCanvas");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remoteCanvas",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.borderThickness = 0;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".systemHelpButtonOver");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".systemHelpButtonOver",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__674089953;
               this.downSkin = _embed_css__674089953;
               this.overSkin = _embed_css__674089953;
            };
         }
         style = StyleManager.getStyleDeclaration(".mySpaceButtonOver");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mySpaceButtonOver",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1431623306;
               this.downSkin = _embed_css__1431623306;
               this.overSkin = _embed_css__1431623306;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileGarageDoorOpener");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileGarageDoorOpener",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1514065036;
               this.overSkin = _embed_css__1144317259;
               this.downSkin = _embed_css__1144317259;
               this.disabledSkin = _embed_css__113697673;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileOnOffSwitch");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileOnOffSwitch",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__923818668;
               this.overSkin = _embed_css__1142336531;
               this.downSkin = _embed_css__1142336531;
               this.disabledSkin = _embed_css__1800898385;
            };
         }
         style = StyleManager.getStyleDeclaration(".linkButtonR12YellowBGBlackUnderline");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".linkButtonR12YellowBGBlackUnderline",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "normal";
               this.textDecoration = "underline";
               this.color = 16758037;
               this.leading = 0;
               this.rollOverColor = 16777215;
               this.textRollOverColor = 15118406;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
               this.selectionColor = 16777215;
               this.textSelectedColor = 16758037;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileGateOpener");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileGateOpener",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__102801098;
               this.overSkin = _embed_css__1912013955;
               this.downSkin = _embed_css__1912013955;
               this.disabledSkin = _embed_css__1673420301;
            };
         }
         style = StyleManager.getStyleDeclaration(".myInstallationButtonOver");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".myInstallationButtonOver",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__228769364;
               this.downSkin = _embed_css__228769364;
               this.overSkin = _embed_css__228769364;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileExteriorVenetianBlind");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileExteriorVenetianBlind",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1189040287;
               this.overSkin = _embed_css__1429403880;
               this.downSkin = _embed_css__1429403880;
               this.disabledSkin = _embed_css__1030552498;
            };
         }
         style = StyleManager.getStyleDeclaration(".scenariosListUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scenariosListUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 0;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileInteriorVenetianBlind");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileInteriorVenetianBlind",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1189040287;
               this.overSkin = _embed_css__1429403880;
               this.downSkin = _embed_css__1429403880;
               this.disabledSkin = _embed_css__1030552498;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18RC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18RC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11421017;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileRollingShutter");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileRollingShutter",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1483100648;
               this.overSkin = _embed_css__449454519;
               this.downSkin = _embed_css__449454519;
               this.disabledSkin = _embed_css__1623536245;
            };
         }
         style = StyleManager.getStyleDeclaration(".scrollUpButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".scrollUpButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__626407922;
               this.downSkin = _embed_css__626407922;
               this.overSkin = _embed_css__180618837;
               this.disabledSkin = _embed_css__626407922;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB22RCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB22RCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.leading = 0;
               this.color = 11421017;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 22;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpTopic");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpTopic",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".help2WTitleLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".help2WTitleLabel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
               this.fontWeigth = "bold";
            };
         }
         style = StyleManager.getStyleDeclaration(".btnValidate");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnValidate",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1023632642;
               this.selectedDownSkin = _embed_css__1048155704;
               this.downSkin = _embed_css__1048155704;
               this.overSkin = _embed_css__1048155704;
               this.paddingTop = 2;
               this.selectedUpSkin = _embed_css__1023632642;
               this.paddingBottom = 0;
               this.paddingLeft = 0;
               this.selectedOverSkin = _embed_css__1048155704;
               this.paddingRight = 2;
            };
         }
         style = StyleManager.getStyleDeclaration(".createScenarioChooseModeUIBtns");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".createScenarioChooseModeUIBtns",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1730201628;
               this.selectedDownSkin = _embed_css__123404198;
               this.downSkin = _embed_css__123404198;
               this.overSkin = _embed_css__123404198;
               this.paddingTop = 4;
               this.selectedUpSkin = _embed_css__1730201628;
               this.paddingBottom = 0;
               this.paddingLeft = 0;
               this.selectedOverSkin = _embed_css__123404198;
               this.paddingRight = 2;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR10BCL0LSm01");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR10BCL0LSm01",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.letterSpacing = -0.1;
               this.color = 0;
               this.fontThickness = 50;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 10;
            };
         }
         style = StyleManager.getStyleDeclaration("Button");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Button",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textRollOverColor = 16777215;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 12;
               this.textSelectedColor = 16777215;
            };
         }
         style = StyleManager.getStyleDeclaration(".slComboList");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".slComboList",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.paddingTop = 0;
               this.backgroundColor = 15197410;
               this.rollOverColor = 15197410;
               this.fontStyle = "normal";
               this.textRollOverColor = 15197410;
               this.fontSize = 12;
               this.selectionColor = 15197410;
               this.textIndent = 2;
               this.paddingLeft = 0;
               this.paddingRight = 0;
               this.color = 0;
               this.borderThickness = 0;
               this.fontFamily = "VerdanaR";
               this.textSelectedColor = 16758037;
               this.paddingBottom = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileWindowOpener");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileWindowOpener",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1413386487;
               this.overSkin = _embed_css__547746448;
               this.downSkin = _embed_css__547746448;
               this.disabledSkin = _embed_css__1899085558;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18RCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18RCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 11486810;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".welcomeUI");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".welcomeUI",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderSkin = _embed_css__399578443;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18BC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18BC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileRollingDoorOpener");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileRollingDoorOpener",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1514065036;
               this.overSkin = _embed_css__1144317259;
               this.downSkin = _embed_css__1144317259;
               this.disabledSkin = _embed_css__113697673;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpMenuButtonText");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpMenuButtonText",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "arial";
               this.fontSize = 21;
            };
         }
         style = StyleManager.getStyleDeclaration(".remoteConfigurationUICanvas");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remoteConfigurationUICanvas",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 16777215;
               this.backgroundColor = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.borderThicknessTop = 1;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("global",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparency = 0.25;
               this.modalTransparencyBlur = 0;
               this.modalTransparencyDuration = 1.5;
               this.modalTransparencyColor = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".installationUIActuatorsNavigationNext");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".installationUIActuatorsNavigationNext",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__599586122;
               this.selectedDownSkin = _embed_css__860132372;
               this.downSkin = _embed_css__860132372;
               this.overSkin = _embed_css__860132372;
               this.selectedUpSkin = _embed_css__599586122;
               this.selectedOverSkin = _embed_css__860132372;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainUIFooter");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainUIFooter",style,false);
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileDualRollingShutter");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileDualRollingShutter",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".btnClose");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnClose",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1729918190;
               this.selectedDownSkin = _embed_css__1907406376;
               this.downSkin = _embed_css__1907406376;
               this.overSkin = _embed_css__1907406376;
               this.selectedUpSkin = _embed_css__1729918190;
               this.selectedOverSkin = _embed_css__1907406376;
            };
         }
         style = StyleManager.getStyleDeclaration(".remoteControl");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remoteControl",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__759066880;
               this.overSkin = _embed_css__759066880;
               this.downSkin = _embed_css__759066880;
               this.color = 16777215;
               this.disabledSkin = _embed_css__759066880;
            };
         }
         style = StyleManager.getStyleDeclaration(".createScenarioChooseModeUILabelsBold");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".createScenarioChooseModeUILabelsBold",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.leading = 0;
               this.color = 0;
               this.fontFamily = "VerdanaB";
               this.fontSize = 24;
            };
         }
         style = StyleManager.getStyleDeclaration(".default");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".default",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1507538325;
               this.overSkin = _embed_css__1507538325;
               this.downSkin = _embed_css__1507538325;
               this.color = 16777215;
               this.disabledSkin = _embed_css__1507538325;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileVentilationPoint");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileVentilationPoint",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".btnHelp");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnHelp",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__88066507;
               this.selectedDownSkin = _embed_css__1122270020;
               this.downSkin = _embed_css__1122270020;
               this.overSkin = _embed_css__1122270020;
               this.paddingTop = 0;
               this.selectedUpSkin = _embed_css__88066507;
               this.paddingBottom = 0;
               this.paddingLeft = 0;
               this.selectedOverSkin = _embed_css__1122270020;
               this.paddingRight = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".labelsR12BlackCenter");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".labelsR12BlackCenter",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 0;
               this.fontStyle = "normal";
               this.textAlign = "center";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR12WC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR12WC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileCurtainTrack");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileCurtainTrack",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".VRI12YCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VRI12YCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 16758037;
               this.textAlign = "center";
               this.fontStyle = "italic";
               this.fontFamily = "VerdanaI";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileBeacon");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileBeacon",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         style = StyleManager.getStyleDeclaration(".tabStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".tabStyle",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderSkin = _embed_css__973782544;
            };
         }
         style = StyleManager.getStyleDeclaration(".deleteActuatorUIUILabels");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".deleteActuatorUIUILabels",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontStyle = "normal";
               this.textAlign = "center";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainUI");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainUI",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.backgroundColor = 11840165;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR12BCLm1");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR12BCLm1",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = -1;
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".commonPopupBtnClose");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".commonPopupBtnClose",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1729918190;
               this.selectedDownSkin = _embed_css__1907406376;
               this.downSkin = _embed_css__1907406376;
               this.overSkin = _embed_css__1907406376;
               this.selectedUpSkin = _embed_css__1729918190;
               this.selectedOverSkin = _embed_css__1907406376;
            };
         }
         style = StyleManager.getStyleDeclaration(".createScenarioCanvas");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".createScenarioCanvas",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 0;
               this.borderThickness = 1;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR24BC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR24BC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 24;
            };
         }
         style = StyleManager.getStyleDeclaration(".remotesNavigationPrevious");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remotesNavigationPrevious",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__298674617;
               this.selectedDownSkin = _embed_css__298674617;
               this.downSkin = _embed_css__298674617;
               this.overSkin = _embed_css__298674617;
               this.selectedUpSkin = _embed_css__298674617;
               this.selectedOverSkin = _embed_css__298674617;
            };
         }
         style = StyleManager.getStyleDeclaration(".fakeButtons");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".fakeButtons",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textRollOverColor = 0;
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
               this.textSelectedColor = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".remotesUITabLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remotesUITabLabel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.horizontalCenter = -3;
               this.paddingLeft = 25;
               this.verticalCenter = 4;
               this.paddingRight = 25;
            };
         }
         style = StyleManager.getStyleDeclaration(".mySpaceButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mySpaceButton",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__473449839;
               this.downSkin = _embed_css__473449839;
               this.overSkin = _embed_css__473449839;
            };
         }
         style = StyleManager.getStyleDeclaration(".msgRemotesUI");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".msgRemotesUI",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.letterSpacing = 0.1;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".labelsR12Black");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".labelsR12Black",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".identifyActuatorUIUILabels");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".identifyActuatorUIUILabels",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontStyle = "normal";
               this.textAlign = "center";
               this.fontFamily = "VerdanaR";
               this.fontSize = 24;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainVBRemoteConfigurationUI");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainVBRemoteConfigurationUI",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.verticalGap = 0;
            };
         }
         style = StyleManager.getStyleDeclaration(".linkButtonR11YellowBGWhiteUnderline");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".linkButtonR11YellowBGWhiteUnderline",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "normal";
               this.textDecoration = "underline";
               this.color = 16758037;
               this.leading = 0;
               this.rollOverColor = 16777215;
               this.textRollOverColor = 15118406;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 11;
               this.selectionColor = 16777215;
               this.textSelectedColor = 16758037;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR18B");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR18B",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".btnCancel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".btnCancel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__2117973416;
               this.focusSkin = ButtonFocus;
               this.selectedDownSkin = _embed_css__1132908206;
               this.downSkin = _embed_css__1132908206;
               this.overSkin = _embed_css__1132908206;
               this.paddingTop = 2;
               this.focusColor = "0xff0000";
               this.selectedUpSkin = _embed_css__2117973416;
               this.paddingBottom = 0;
               this.paddingLeft = 0;
               this.selectedOverSkin = _embed_css__1132908206;
               this.paddingRight = 2;
            };
         }
         style = StyleManager.getStyleDeclaration(".VB12GC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VB12GC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 5066061;
               this.textAlign = "center";
               this.fontFamily = "VerdanaB";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".VR12BC");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".VR12BC",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".remotesUIContent");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".remotesUIContent",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 4604481;
               this.backgroundColor = 0;
               this.fontStyle = "normal";
               this.fontSize = 12;
               this.borderThicknessTop = 1;
               this.color = 16777215;
               this.cornerRadiusTL = 0;
               this.cornerRadiusBR = 13;
               this.fontFamily = "VerdanaR";
               this.borderThicknessLeft = 1;
               this.cornerRadiusTR = 0;
               this.cornerRadiusBL = 13;
            };
         }
         style = StyleManager.getStyleDeclaration(".labelsR12White");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".labelsR12White",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 16777215;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".mainUIHeaderButtonsHelp");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".mainUIHeaderButtonsHelp",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.downSkin = ButtonTabSkin;
               this.overSkin = ButtonTabSkin;
               this.paddingTop = 0;
               this.backgroundColor = 12761782;
               this.letterSpacing = -0.1;
               this.selectedUpSkin = ButtonTabSkin;
               this.textRollOverColor = 16777215;
               this.fontSize = 24;
               this.paddingLeft = 4;
               this.paddingRight = 4;
               this.upSkin = ButtonTabSkin;
               this.fontWeight = "bold";
               this.selectedDownSkin = ButtonTabSkin;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontThickness = 50;
               this.fontFamily = "VerdanaB";
               this.paddingBottom = 0;
               this.textSelectedColor = 16777215;
               this.selectedOverSkin = ButtonTabSkin;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpQuestion");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpQuestion",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontStyle = "italic";
               this.fontFamily = "VerdanaI";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".V18RCL0");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".V18RCL0",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.leading = 0;
               this.color = 11421017;
               this.textAlign = "center";
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 18;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpButtonLabel",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontStyle = "normal";
               this.fontFamily = "VerdanaR";
               this.fontSize = 12;
            };
         }
         style = StyleManager.getStyleDeclaration(".helpQuestionsButtonOver");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".helpQuestionsButtonOver",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__751504411;
               this.downSkin = _embed_css__751504411;
               this.overSkin = _embed_css__751504411;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileDoorLock");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileDoorLock",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__1019202079;
               this.overSkin = _embed_css__1703949786;
               this.downSkin = _embed_css__1703949786;
               this.disabledSkin = _embed_css__787028676;
            };
         }
         style = StyleManager.getStyleDeclaration(".actuatorProfileScd");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".actuatorProfileScd",style,false);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.upSkin = _embed_css__100843225;
               this.overSkin = _embed_css__224273198;
               this.downSkin = _embed_css__224273198;
               this.disabledSkin = _embed_css__1947189436;
            };
         }
         StyleManager.mx_internal::initProtoChainRoots();
      }
      
      public function ___ScenarioLauncher_WindowedApplication1_initialize(param1:FlexEvent) : void
      {
         this.initializeHandler(param1);
      }
      
      public function ___ScenarioLauncher_WindowedApplication1_keyDown(param1:KeyboardEvent) : void
      {
         this.OnKeyDown(param1);
      }
   }
}
