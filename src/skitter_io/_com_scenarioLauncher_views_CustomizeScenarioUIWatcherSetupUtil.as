package
{
   import com.scenarioLauncher.views.CustomizeScenarioUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_CustomizeScenarioUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_CustomizeScenarioUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CustomizeScenarioUI.watcherSetupUtil = new _com_scenarioLauncher_views_CustomizeScenarioUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("btnChoseImage",{"propertyChange":true},[param3[3]],param2);
         param4[3] = new PropertyWatcher("width",{"widthChanged":true},[param3[3]],null);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
      }
   }
}
