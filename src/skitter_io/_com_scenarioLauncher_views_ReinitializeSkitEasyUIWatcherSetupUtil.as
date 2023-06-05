package
{
   import com.scenarioLauncher.views.ReinitializeSkitEasyUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_ReinitializeSkitEasyUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_ReinitializeSkitEasyUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ReinitializeSkitEasyUI.watcherSetupUtil = new _com_scenarioLauncher_views_ReinitializeSkitEasyUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[6] = new PropertyWatcher("lbDisconnectAllSkitter",{"propertyChange":true},[param3[2]],param2);
         param4[8] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[7] = new PropertyWatcher("y",{"yChanged":true},[param3[2]],null);
         param4[42] = new PropertyWatcher("lbReinitInstallationFailed",{"propertyChange":true},[param3[16]],param2);
         param4[44] = new PropertyWatcher("height",{"heightChanged":true},[param3[16]],null);
         param4[43] = new PropertyWatcher("y",{"yChanged":true},[param3[16]],null);
         param4[24] = new PropertyWatcher("lbReallyReinitInstallationInProgressTitle",{"propertyChange":true},[param3[8]],param2);
         param4[26] = new PropertyWatcher("height",{"heightChanged":true},[param3[8]],null);
         param4[25] = new PropertyWatcher("y",{"yChanged":true},[param3[8]],null);
         param4[0] = new PropertyWatcher("lbDisconnectAllSkitterTitle",{"propertyChange":true},[param3[0]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[0]],null);
         param4[1] = new PropertyWatcher("y",{"yChanged":true},[param3[0]],null);
         param4[45] = new PropertyWatcher("lbReinitInstallationFailedWarn",{"propertyChange":true},[param3[17]],param2);
         param4[47] = new PropertyWatcher("height",{"heightChanged":true},[param3[17]],null);
         param4[46] = new PropertyWatcher("y",{"yChanged":true},[param3[17]],null);
         param4[39] = new PropertyWatcher("lbReinitInstallationFailedTitle",{"propertyChange":true},[param3[14],param3[15]],param2);
         param4[41] = new PropertyWatcher("height",{"heightChanged":true},[param3[14],param3[15]],null);
         param4[40] = new PropertyWatcher("y",{"yChanged":true},[param3[14],param3[15]],null);
         param4[36] = new PropertyWatcher("lbReinitInstallationSuccess",{"propertyChange":true},[param3[13]],param2);
         param4[38] = new PropertyWatcher("height",{"heightChanged":true},[param3[13]],null);
         param4[37] = new PropertyWatcher("y",{"yChanged":true},[param3[13]],null);
         param4[30] = new PropertyWatcher("lbSynchronizationInProgress",{"propertyChange":true},[param3[10]],param2);
         param4[32] = new PropertyWatcher("height",{"heightChanged":true},[param3[10]],null);
         param4[31] = new PropertyWatcher("y",{"yChanged":true},[param3[10]],null);
         param4[18] = new PropertyWatcher("lbReallyReinitInstallationTitle",{"propertyChange":true},[param3[6]],param2);
         param4[20] = new PropertyWatcher("height",{"heightChanged":true},[param3[6]],null);
         param4[19] = new PropertyWatcher("y",{"yChanged":true},[param3[6]],null);
         param4[3] = new PropertyWatcher("lbDisconnectAllSkitterWarn",{"propertyChange":true},[param3[1]],param2);
         param4[5] = new PropertyWatcher("height",{"heightChanged":true},[param3[1]],null);
         param4[4] = new PropertyWatcher("y",{"yChanged":true},[param3[1]],null);
         param4[27] = new PropertyWatcher("lbSynchronizationInProgressTitle",{"propertyChange":true},[param3[9]],param2);
         param4[29] = new PropertyWatcher("height",{"heightChanged":true},[param3[9]],null);
         param4[28] = new PropertyWatcher("y",{"yChanged":true},[param3[9]],null);
         param4[9] = new PropertyWatcher("lbReinitInstallationTitle",{"propertyChange":true},[param3[3]],param2);
         param4[11] = new PropertyWatcher("height",{"heightChanged":true},[param3[3]],null);
         param4[10] = new PropertyWatcher("y",{"yChanged":true},[param3[3]],null);
         param4[12] = new PropertyWatcher("lbReinitInstallationWarn",{"propertyChange":true},[param3[4]],param2);
         param4[14] = new PropertyWatcher("height",{"heightChanged":true},[param3[4]],null);
         param4[13] = new PropertyWatcher("y",{"yChanged":true},[param3[4]],null);
         param4[21] = new PropertyWatcher("lbReallyReinitInstallation",{"propertyChange":true},[param3[7]],param2);
         param4[23] = new PropertyWatcher("height",{"heightChanged":true},[param3[7]],null);
         param4[22] = new PropertyWatcher("y",{"yChanged":true},[param3[7]],null);
         param4[33] = new PropertyWatcher("lbReinitInstallationSuccessTitle",{"propertyChange":true},[param3[11],param3[12]],param2);
         param4[35] = new PropertyWatcher("height",{"heightChanged":true},[param3[11],param3[12]],null);
         param4[34] = new PropertyWatcher("y",{"yChanged":true},[param3[11],param3[12]],null);
         param4[15] = new PropertyWatcher("lbReinitInstallation",{"propertyChange":true},[param3[5]],param2);
         param4[17] = new PropertyWatcher("height",{"heightChanged":true},[param3[5]],null);
         param4[16] = new PropertyWatcher("y",{"yChanged":true},[param3[5]],null);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[8]);
         param4[6].addChild(param4[7]);
         param4[42].updateParent(param1);
         param4[42].addChild(param4[44]);
         param4[42].addChild(param4[43]);
         param4[24].updateParent(param1);
         param4[24].addChild(param4[26]);
         param4[24].addChild(param4[25]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[1]);
         param4[45].updateParent(param1);
         param4[45].addChild(param4[47]);
         param4[45].addChild(param4[46]);
         param4[39].updateParent(param1);
         param4[39].addChild(param4[41]);
         param4[39].addChild(param4[40]);
         param4[36].updateParent(param1);
         param4[36].addChild(param4[38]);
         param4[36].addChild(param4[37]);
         param4[30].updateParent(param1);
         param4[30].addChild(param4[32]);
         param4[30].addChild(param4[31]);
         param4[18].updateParent(param1);
         param4[18].addChild(param4[20]);
         param4[18].addChild(param4[19]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[5]);
         param4[3].addChild(param4[4]);
         param4[27].updateParent(param1);
         param4[27].addChild(param4[29]);
         param4[27].addChild(param4[28]);
         param4[9].updateParent(param1);
         param4[9].addChild(param4[11]);
         param4[9].addChild(param4[10]);
         param4[12].updateParent(param1);
         param4[12].addChild(param4[14]);
         param4[12].addChild(param4[13]);
         param4[21].updateParent(param1);
         param4[21].addChild(param4[23]);
         param4[21].addChild(param4[22]);
         param4[33].updateParent(param1);
         param4[33].addChild(param4[35]);
         param4[33].addChild(param4[34]);
         param4[15].updateParent(param1);
         param4[15].addChild(param4[17]);
         param4[15].addChild(param4[16]);
      }
   }
}
