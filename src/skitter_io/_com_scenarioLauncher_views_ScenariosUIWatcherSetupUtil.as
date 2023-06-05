package
{
   import com.scenarioLauncher.services.ScenarioService;
   import com.scenarioLauncher.views.ScenariosUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_ScenariosUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_ScenariosUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ScenariosUI.watcherSetupUtil = new _com_scenarioLauncher_views_ScenariosUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[8] = new PropertyWatcher("_currentScenario",{"propertyChange":true},[param3[3]],param2);
         param4[9] = new PropertyWatcher("situations",{"propertyChange":true},[param3[3]],null);
         param4[5] = new PropertyWatcher("msgCreateNewScenario",{"propertyChange":true},[param3[1]],param2);
         param4[6] = new PropertyWatcher("width",{"widthChanged":true},[param3[1]],null);
         param4[7] = new PropertyWatcher("_arrowPosition",{"propertyChange":true},[param3[2]],param2);
         param4[2] = new PropertyWatcher("createNewScenario",{"propertyChange":true},[param3[1]],param2);
         param4[4] = new PropertyWatcher("width",{"widthChanged":true},[param3[1]],null);
         param4[3] = new PropertyWatcher("x",{"xChanged":true},[param3[1]],null);
         param4[0] = new StaticPropertyWatcher("instance",null,[param3[0]],null);
         param4[1] = new PropertyWatcher("scenarios",{"propertyChange":true},[param3[0]],null);
         param4[8].updateParent(param1);
         param4[8].addChild(param4[9]);
         param4[5].updateParent(param1);
         param4[5].addChild(param4[6]);
         param4[7].updateParent(param1);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[4]);
         param4[2].addChild(param4[3]);
         param4[0].updateParent(ScenarioService);
         param4[0].addChild(param4[1]);
      }
   }
}
