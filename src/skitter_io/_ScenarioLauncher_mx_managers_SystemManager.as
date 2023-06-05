package
{
   import flash.system.ApplicationDomain;
   import flash.system.Security;
   import flash.utils.Dictionary;
   import mx.core.EmbeddedFontRegistry;
   import mx.core.FlexVersion;
   import mx.core.IFlexModule;
   import mx.core.IFlexModuleFactory;
   import mx.managers.SystemManager;
   
   public class _ScenarioLauncher_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory
   {
       
      
      private var _preloadedRSLs:Dictionary;
      
      public function _ScenarioLauncher_mx_managers_SystemManager()
      {
         FlexVersion.compatibilityVersionString = "3.0.0";
         super();
      }
      
      override public function create(... rest) : Object
      {
         if(rest.length > 0 && !(rest[0] is String))
         {
            return super.create.apply(this,rest);
         }
         var _loc2_:String = rest.length == 0 ? "ScenarioLauncher" : String(rest[0]);
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:Object;
         if((_loc4_ = new _loc3_()) is IFlexModule)
         {
            IFlexModule(_loc4_).moduleFactory = this;
         }
         if(rest.length == 0)
         {
            EmbeddedFontRegistry.registerFonts(this.info()["fonts"],this);
         }
         return _loc4_;
      }
      
      override public function allowInsecureDomain(... rest) : void
      {
         var _loc2_:Object = null;
         Security.allowInsecureDomain(rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(Boolean(_loc2_.content) && "allowInsecureDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowInsecureDomainInRSL"](rest);
            }
         }
      }
      
      override public function info() : Object
      {
         return {
            "cacheAsBitmap":"false",
            "close":"closeHandler(event);",
            "compiledLocales":["fr_FR"],
            "compiledResourceBundleNames":["SharedResources","collections","containers","controls","core","effects","formatters","skins","styles"],
            "creationComplete":"creationCompleteHandler(event)",
            "currentDomain":ApplicationDomain.currentDomain,
            "fonts":{
               "VerdanaB":{
                  "regular":false,
                  "bold":true,
                  "italic":false,
                  "boldItalic":false
               },
               "VerdanaBI":{
                  "regular":false,
                  "bold":true,
                  "italic":true,
                  "boldItalic":true
               },
               "VerdanaI":{
                  "regular":false,
                  "bold":false,
                  "italic":true,
                  "boldItalic":false
               },
               "VerdanaR":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               },
               "WEBDINGS":{
                  "regular":true,
                  "bold":false,
                  "italic":false,
                  "boldItalic":false
               }
            },
            "height":"768",
            "initialize":"initializeHandler(event)",
            "keyDown":"OnKeyDown(event)",
            "layout":"absolute",
            "mainClassName":"ScenarioLauncher",
            "maxHeight":"768",
            "maxWidth":"1024",
            "mixins":["_ScenarioLauncher_FlexInit","_LinkButtonStyle","_alertButtonStyleStyle","_SWFLoaderStyle","_headerDateTextStyle","_macMinButtonStyle","_winCloseButtonStyle","_WindowStyle","_todayStyleStyle","_windowStylesStyle","_TextInputStyle","_dateFieldPopupStyle","_winMinButtonStyle","_dataGridStylesStyle","_headerDragProxyStyleStyle","_popUpMenuStyle","_ProgressBarStyle","_DragManagerStyle","_windowStatusStyle","_ContainerStyle","_swatchPanelTextFieldStyle","_textAreaHScrollBarStyleStyle","_macCloseButtonStyle","_comboDropdownStyle","_winMaxButtonStyle","_ButtonStyle","_linkButtonStyleStyle","_richTextEditorTextAreaStyleStyle","_ControlBarStyle","_textAreaVScrollBarStyleStyle","_globalStyle","_HTMLStyle","_ListBaseStyle","_AlertStyle","_ApplicationStyle","_ToolTipStyle","_WindowedApplicationStyle","_winRestoreButtonStyle","_CursorManagerStyle","_opaquePanelStyle","_errorTipStyle","_HRuleStyle","_activeTabStyleStyle","_PanelStyle","_statusTextStyleStyle","_ScrollBarStyle","_macMaxButtonStyle","_plainStyle","_activeButtonStyleStyle","_advancedDataGridStylesStyle","_titleTextStyleStyle","_gripperSkinStyle","_weekDayStyleStyle","_com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorTileListRendererWatcherSetupUtil","_com_scenarioLauncher_views_renderers_ScenarioTileListRendererWatcherSetupUtil","_com_scenarioLauncher_components_HelpMySpaceWatcherSetupUtil","_com_scenarioLauncher_views_renderers_RemoteTileListRendererWatcherSetupUtil","_com_scenarioLauncher_views_renderers_ScenarioRemoteConfigurationTileListRendererWatcherSetupUtil","_com_scenarioLauncher_components_RemoteCircleUIWatcherSetupUtil","_com_scenarioLauncher_components_SLComboBoxWatcherSetupUtil","_com_scenarioLauncher_components_renderers_ListComboRendererWatcherSetupUtil","_com_scenarioLauncher_views_MainUIHeaderWatcherSetupUtil","_com_scenarioLauncher_views_QuestionsUIWatcherSetupUtil","_com_scenarioLauncher_views_WelcomeUIWatcherSetupUtil","_com_scenarioLauncher_views_UpdateUIWatcherSetupUtil","_com_scenarioLauncher_views_RemotesUIWatcherSetupUtil","_com_scenarioLauncher_views_MainUIFooterWatcherSetupUtil","_com_scenarioLauncher_views_ScenarioUpdateUIWatcherSetupUtil","_com_scenarioLauncher_views_RemoteConfigurationUIWatcherSetupUtil","_com_scenarioLauncher_views_InstallationUIWatcherSetupUtil","_com_scenarioLauncher_views_ScenariosUIWatcherSetupUtil","_com_scenarioLauncher_views_CreateScenarioChooseModeUIWatcherSetupUtil","_com_scenarioLauncher_views_DuplicateScenarioUIWatcherSetupUtil","_com_scenarioLauncher_views_TestScenarioUIWatcherSetupUtil","_com_scenarioLauncher_views_RenameSkittyUIWatcherSetupUtil","_com_scenarioLauncher_views_SynchronizeRemoteContolUIWatcherSetupUtil","_com_scenarioLauncher_views_AskForIOHomecontrolUIWatcherSetupUtil","_com_scenarioLauncher_views_GiveSecurityKeyUIWatcherSetupUtil","_com_scenarioLauncher_views_ReinitializeSkitEasyUIWatcherSetupUtil","_com_scenarioLauncher_views_ReceiveSecurityKeyUIWatcherSetupUtil","_com_scenarioLauncher_views_ReinitializeSkittersUIWatcherSetupUtil","_com_scenarioLauncher_views_Remote1WHelpAdvancedUIWatcherSetupUtil","_com_scenarioLauncher_views_GenerateSecurityKeyUIWatcherSetupUtil","_com_scenarioLauncher_views_popup_SkitterSynchronisePopupWatcherSetupUtil","_com_scenarioLauncher_views_popup_SkitterNotConnectedPopupWatcherSetupUtil","_com_scenarioLauncher_views_popup_MaintenanceConnexionPopupWatcherSetupUtil","_com_scenarioLauncher_views_Remote1WHelpUIWatcherSetupUtil","_com_scenarioLauncher_views_RadioContolUIWatcherSetupUtil","_com_scenarioLauncher_views_Remote2WHelpUIWatcherSetupUtil","_com_scenarioLauncher_views_popup_TransferFailedPopupWatcherSetupUtil","_com_scenarioLauncher_views_Remote2WHelpAdvancedUIWatcherSetupUtil","_com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorUsedTileListRendererWatcherSetupUtil","_com_scenarioLauncher_views_CustomizeScenarioUIWatcherSetupUtil","_com_scenarioLauncher_views_SnapshotScenarioUIWatcherSetupUtil","_com_scenarioLauncher_views_AdjustActuatorUIWatcherSetupUtil","_com_scenarioLauncher_views_DeleteRemoteUIWatcherSetupUtil","_com_scenarioLauncher_views_renderers_ActuatorsTileListRendererWatcherSetupUtil","_com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorStateTileListRendererWatcherSetupUtil","_com_scenarioLauncher_views_RenameActuatorUIWatcherSetupUtil"],
            "showFlexChrome":"false",
            "width":"1024"
         };
      }
      
      override public function get preloadedRSLs() : Dictionary
      {
         if(this._preloadedRSLs == null)
         {
            this._preloadedRSLs = new Dictionary(true);
         }
         return this._preloadedRSLs;
      }
      
      override public function allowDomain(... rest) : void
      {
         var _loc2_:Object = null;
         Security.allowDomain(rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(Boolean(_loc2_.content) && "allowDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowDomainInRSL"](rest);
            }
         }
      }
   }
}
