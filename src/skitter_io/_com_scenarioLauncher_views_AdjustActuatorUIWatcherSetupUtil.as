package
{
   import com.scenarioLauncher.views.AdjustActuatorUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_AdjustActuatorUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_AdjustActuatorUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AdjustActuatorUI.watcherSetupUtil = new _com_scenarioLauncher_views_AdjustActuatorUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("btnBox",{"propertyChange":true},[param3[0]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[0]],null);
         param4[1] = new PropertyWatcher("y",{"yChanged":true},[param3[0]],null);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[1]);
      }
   }
}
