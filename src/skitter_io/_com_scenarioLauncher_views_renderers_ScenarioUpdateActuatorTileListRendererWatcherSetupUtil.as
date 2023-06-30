package
{
   import com.scenarioLauncher.views.renderers.ScenarioUpdateActuatorTileListRenderer;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorTileListRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorTileListRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ScenarioUpdateActuatorTileListRenderer.watcherSetupUtil = new _com_scenarioLauncher_views_renderers_ScenarioUpdateActuatorTileListRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("_visible",{"propertyChange":true},[param3[2],param3[4]],param2);
         param4[1] = new PropertyWatcher("enableHandCursor",{"propertyChange":true},[param3[1]],param2);
         param4[3] = new PropertyWatcher("_label",{"propertyChange":true},[param3[3]],param2);
         param4[0] = new PropertyWatcher("_stylename",{"propertyChange":true},[param3[0]],param2);
         param4[2].updateParent(param1);
         param4[1].updateParent(param1);
         param4[3].updateParent(param1);
         param4[0].updateParent(param1);
      }
   }
}