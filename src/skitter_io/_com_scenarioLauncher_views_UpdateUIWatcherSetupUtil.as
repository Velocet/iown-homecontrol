package
{
   import com.scenarioLauncher.views.UpdateUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_UpdateUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_UpdateUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         UpdateUI.watcherSetupUtil = new _com_scenarioLauncher_views_UpdateUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[1] = new PropertyWatcher("skitEasyUpdateMessageText",{"propertyChange":true},[param3[2]],param2);
         param4[3] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[2] = new PropertyWatcher("y",{"yChanged":true},[param3[2]],null);
         param4[28] = new PropertyWatcher("lbSkitterUpdateFailed",{"propertyChange":true},[param3[27]],param2);
         param4[30] = new PropertyWatcher("height",{"heightChanged":true},[param3[27]],null);
         param4[29] = new PropertyWatcher("y",{"yChanged":true},[param3[27]],null);
         param4[22] = new PropertyWatcher("skitterUpdateInProgressMessageTextWarm",{"propertyChange":true},[param3[21]],param2);
         param4[24] = new PropertyWatcher("height",{"heightChanged":true},[param3[21]],null);
         param4[23] = new PropertyWatcher("y",{"yChanged":true},[param3[21]],null);
         param4[16] = new PropertyWatcher("skitterUpdateMessageText",{"propertyChange":true},[param3[17]],param2);
         param4[18] = new PropertyWatcher("height",{"heightChanged":true},[param3[17]],null);
         param4[17] = new PropertyWatcher("y",{"yChanged":true},[param3[17]],null);
         param4[10] = new PropertyWatcher("lbSkitEasyUpdateFailed",{"propertyChange":true},[param3[11]],param2);
         param4[12] = new PropertyWatcher("height",{"heightChanged":true},[param3[11]],null);
         param4[11] = new PropertyWatcher("y",{"yChanged":true},[param3[11]],null);
         param4[7] = new PropertyWatcher("lbSkitEasyUpdateSuccess",{"propertyChange":true},[param3[8]],param2);
         param4[9] = new PropertyWatcher("height",{"heightChanged":true},[param3[8]],null);
         param4[8] = new PropertyWatcher("y",{"yChanged":true},[param3[8]],null);
         param4[4] = new PropertyWatcher("skitEasyUpdateInProgressMessageText",{"propertyChange":true},[param3[5]],param2);
         param4[6] = new PropertyWatcher("height",{"heightChanged":true},[param3[5]],null);
         param4[5] = new PropertyWatcher("y",{"yChanged":true},[param3[5]],null);
         param4[25] = new PropertyWatcher("lbSkitterUpdateSuccess",{"propertyChange":true},[param3[24]],param2);
         param4[27] = new PropertyWatcher("height",{"heightChanged":true},[param3[24]],null);
         param4[26] = new PropertyWatcher("y",{"yChanged":true},[param3[24]],null);
         param4[19] = new PropertyWatcher("skitterUpdateInProgressMessageText",{"propertyChange":true},[param3[20]],param2);
         param4[21] = new PropertyWatcher("height",{"heightChanged":true},[param3[20]],null);
         param4[20] = new PropertyWatcher("y",{"yChanged":true},[param3[20]],null);
         param4[13] = new PropertyWatcher("skitEasyUpdateRequiredMessageText",{"propertyChange":true},[param3[14]],param2);
         param4[15] = new PropertyWatcher("height",{"heightChanged":true},[param3[14]],null);
         param4[14] = new PropertyWatcher("y",{"yChanged":true},[param3[14]],null);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[3]);
         param4[1].addChild(param4[2]);
         param4[28].updateParent(param1);
         param4[28].addChild(param4[30]);
         param4[28].addChild(param4[29]);
         param4[22].updateParent(param1);
         param4[22].addChild(param4[24]);
         param4[22].addChild(param4[23]);
         param4[16].updateParent(param1);
         param4[16].addChild(param4[18]);
         param4[16].addChild(param4[17]);
         param4[10].updateParent(param1);
         param4[10].addChild(param4[12]);
         param4[10].addChild(param4[11]);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[9]);
         param4[7].addChild(param4[8]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[6]);
         param4[4].addChild(param4[5]);
         param4[25].updateParent(param1);
         param4[25].addChild(param4[27]);
         param4[25].addChild(param4[26]);
         param4[19].updateParent(param1);
         param4[19].addChild(param4[21]);
         param4[19].addChild(param4[20]);
         param4[13].updateParent(param1);
         param4[13].addChild(param4[15]);
         param4[13].addChild(param4[14]);
      }
   }
}
