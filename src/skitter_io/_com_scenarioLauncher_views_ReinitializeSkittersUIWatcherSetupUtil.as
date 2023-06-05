package
{
   import com.scenarioLauncher.views.ReinitializeSkittersUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_ReinitializeSkittersUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_ReinitializeSkittersUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ReinitializeSkittersUI.watcherSetupUtil = new _com_scenarioLauncher_views_ReinitializeSkittersUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[37] = new PropertyWatcher("lbreinitSkitterSuccessTitle",{"propertyChange":true},[param3[14],param3[15]],param2);
         param4[39] = new PropertyWatcher("height",{"heightChanged":true},[param3[14],param3[15]],null);
         param4[38] = new PropertyWatcher("y",{"yChanged":true},[param3[14],param3[15]],null);
         param4[16] = new PropertyWatcher("lbReallyreinitSkitterTitle",{"propertyChange":true},[param3[7]],param2);
         param4[18] = new PropertyWatcher("height",{"heightChanged":true},[param3[7]],null);
         param4[17] = new PropertyWatcher("y",{"yChanged":true},[param3[7]],null);
         param4[19] = new PropertyWatcher("lbReallyReinitSkitterWarnTitle",{"propertyChange":true},[param3[8]],param2);
         param4[21] = new PropertyWatcher("height",{"heightChanged":true},[param3[8]],null);
         param4[20] = new PropertyWatcher("y",{"yChanged":true},[param3[8]],null);
         param4[40] = new PropertyWatcher("lbreinitSkitterSuccess",{"propertyChange":true},[param3[16]],param2);
         param4[42] = new PropertyWatcher("height",{"heightChanged":true},[param3[16]],null);
         param4[41] = new PropertyWatcher("y",{"yChanged":true},[param3[16]],null);
         param4[13] = new PropertyWatcher("lbreinitSkitter",{"propertyChange":true},[param3[6]],param2);
         param4[15] = new PropertyWatcher("height",{"heightChanged":true},[param3[6]],null);
         param4[14] = new PropertyWatcher("y",{"yChanged":true},[param3[6]],null);
         param4[31] = new PropertyWatcher("lbSynchronizationInProgress",{"propertyChange":true},[param3[12]],param2);
         param4[33] = new PropertyWatcher("height",{"heightChanged":true},[param3[12]],null);
         param4[32] = new PropertyWatcher("y",{"yChanged":true},[param3[12]],null);
         param4[22] = new PropertyWatcher("lbReallyReinitSkitterWarn",{"propertyChange":true},[param3[9]],param2);
         param4[24] = new PropertyWatcher("height",{"heightChanged":true},[param3[9]],null);
         param4[23] = new PropertyWatcher("y",{"yChanged":true},[param3[9]],null);
         param4[28] = new PropertyWatcher("lbSynchronizationInProgressTitle",{"propertyChange":true},[param3[11]],param2);
         param4[30] = new PropertyWatcher("height",{"heightChanged":true},[param3[11]],null);
         param4[29] = new PropertyWatcher("y",{"yChanged":true},[param3[11]],null);
         param4[7] = new PropertyWatcher("lbreinitSkitterQuestion",{"propertyChange":true},[param3[4]],param2);
         param4[9] = new PropertyWatcher("height",{"heightChanged":true},[param3[4]],null);
         param4[8] = new PropertyWatcher("y",{"yChanged":true},[param3[4]],null);
         param4[10] = new PropertyWatcher("lbreinitSkitterWarn",{"propertyChange":true},[param3[5]],param2);
         param4[12] = new PropertyWatcher("height",{"heightChanged":true},[param3[5]],null);
         param4[11] = new PropertyWatcher("y",{"yChanged":true},[param3[5]],null);
         param4[43] = new PropertyWatcher("lbreinitSkitterFailedTitle",{"propertyChange":true},[param3[17],param3[18]],param2);
         param4[45] = new PropertyWatcher("height",{"heightChanged":true},[param3[17],param3[18]],null);
         param4[44] = new PropertyWatcher("y",{"yChanged":true},[param3[17],param3[18]],null);
         param4[4] = new PropertyWatcher("lbreinitSkitterTitle",{"propertyChange":true},[param3[3]],param2);
         param4[6] = new PropertyWatcher("height",{"heightChanged":true},[param3[3]],null);
         param4[5] = new PropertyWatcher("y",{"yChanged":true},[param3[3]],null);
         param4[46] = new PropertyWatcher("lbreinitSkitterFailed",{"propertyChange":true},[param3[19]],param2);
         param4[48] = new PropertyWatcher("height",{"heightChanged":true},[param3[19]],null);
         param4[47] = new PropertyWatcher("y",{"yChanged":true},[param3[19]],null);
         param4[25] = new PropertyWatcher("lbReallyreinitSkitter",{"propertyChange":true},[param3[10]],param2);
         param4[27] = new PropertyWatcher("height",{"heightChanged":true},[param3[10]],null);
         param4[26] = new PropertyWatcher("y",{"yChanged":true},[param3[10]],null);
         param4[1] = new PropertyWatcher("lbSkitterVersionPb",{"propertyChange":true},[param3[2]],param2);
         param4[3] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[2] = new PropertyWatcher("y",{"yChanged":true},[param3[2]],null);
         param4[34] = new PropertyWatcher("lbSynchronizationInProgressWarn",{"propertyChange":true},[param3[13]],param2);
         param4[36] = new PropertyWatcher("height",{"heightChanged":true},[param3[13]],null);
         param4[35] = new PropertyWatcher("y",{"yChanged":true},[param3[13]],null);
         param4[37].updateParent(param1);
         param4[37].addChild(param4[39]);
         param4[37].addChild(param4[38]);
         param4[16].updateParent(param1);
         param4[16].addChild(param4[18]);
         param4[16].addChild(param4[17]);
         param4[19].updateParent(param1);
         param4[19].addChild(param4[21]);
         param4[19].addChild(param4[20]);
         param4[40].updateParent(param1);
         param4[40].addChild(param4[42]);
         param4[40].addChild(param4[41]);
         param4[13].updateParent(param1);
         param4[13].addChild(param4[15]);
         param4[13].addChild(param4[14]);
         param4[31].updateParent(param1);
         param4[31].addChild(param4[33]);
         param4[31].addChild(param4[32]);
         param4[22].updateParent(param1);
         param4[22].addChild(param4[24]);
         param4[22].addChild(param4[23]);
         param4[28].updateParent(param1);
         param4[28].addChild(param4[30]);
         param4[28].addChild(param4[29]);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[9]);
         param4[7].addChild(param4[8]);
         param4[10].updateParent(param1);
         param4[10].addChild(param4[12]);
         param4[10].addChild(param4[11]);
         param4[43].updateParent(param1);
         param4[43].addChild(param4[45]);
         param4[43].addChild(param4[44]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[6]);
         param4[4].addChild(param4[5]);
         param4[46].updateParent(param1);
         param4[46].addChild(param4[48]);
         param4[46].addChild(param4[47]);
         param4[25].updateParent(param1);
         param4[25].addChild(param4[27]);
         param4[25].addChild(param4[26]);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[3]);
         param4[1].addChild(param4[2]);
         param4[34].updateParent(param1);
         param4[34].addChild(param4[36]);
         param4[34].addChild(param4[35]);
      }
   }
}
