package
{
   import com.scenarioLauncher.views.Remote1WHelpUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_Remote1WHelpUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_Remote1WHelpUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Remote1WHelpUI.watcherSetupUtil = new _com_scenarioLauncher_views_Remote1WHelpUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
      }
   }
}
