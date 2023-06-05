package
{
   import com.scenarioLauncher.views.TestScenarioUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_TestScenarioUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_TestScenarioUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TestScenarioUI.watcherSetupUtil = new _com_scenarioLauncher_views_TestScenarioUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[6] = new PropertyWatcher("canvasContainer",{"propertyChange":true},[param3[9]],param2);
         param4[7] = new PropertyWatcher("width",{"widthChanged":true},[param3[9]],null);
         param4[1] = new PropertyWatcher("_scenario",{"propertyChange":true},[param3[2],param3[6],param3[12]],param2);
         param4[2] = new PropertyWatcher("name",{"propertyChange":true},[param3[2],param3[6],param3[12]],null);
         param4[3] = new PropertyWatcher("lbTestInProgress",{"propertyChange":true},[param3[3]],param2);
         param4[5] = new PropertyWatcher("height",{"heightChanged":true},[param3[3]],null);
         param4[4] = new PropertyWatcher("y",{"yChanged":true},[param3[3]],null);
         param4[8] = new PropertyWatcher("lbTestSuccess",{"propertyChange":true},[param3[9]],param2);
         param4[9] = new PropertyWatcher("width",{"widthChanged":true},[param3[9]],null);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[2]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[5]);
         param4[3].addChild(param4[4]);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[9]);
      }
   }
}
