package
{
   import com.scenarioLauncher.views.ScenarioUpdateUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_ScenarioUpdateUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_ScenarioUpdateUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ScenarioUpdateUI.watcherSetupUtil = new _com_scenarioLauncher_views_ScenarioUpdateUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[8] = new PropertyWatcher("iconPersonnalisation",{"propertyChange":true},[param3[6]],param2);
         param4[9] = new PropertyWatcher("width",{"widthChanged":true},[param3[6]],null);
         param4[3] = new PropertyWatcher("scenarioName",{"propertyChange":true},[param3[5],param3[6]],param2);
         param4[5] = new PropertyWatcher("width",{"widthChanged":true},[param3[5],param3[6]],null);
         param4[4] = new PropertyWatcher("x",{"xChanged":true},[param3[5],param3[6]],null);
         param4[0] = new PropertyWatcher("_tabLabel",{"propertyChange":true},[param3[0]],param2);
         param4[6] = new PropertyWatcher("scenarioIcon",{"propertyChange":true},[param3[5]],param2);
         param4[7] = new PropertyWatcher("width",{"widthChanged":true},[param3[5]],null);
         param4[1] = new PropertyWatcher("_allActuators",{"propertyChange":true},[param3[1]],param2);
         param4[2] = new PropertyWatcher("defaultLogoScenario",{"propertyChange":true},[param3[4]],param2);
         param4[10] = new StaticPropertyWatcher("_saveScenarioSituations",{"propertyChange":true},[param3[7]],null);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[9]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[5]);
         param4[3].addChild(param4[4]);
         param4[0].updateParent(param1);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[1].updateParent(param1);
         param4[2].updateParent(param1);
         param4[10].updateParent(ScenarioUpdateUI);
      }
   }
}
