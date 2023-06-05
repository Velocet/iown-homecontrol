package
{
   import com.scenarioLauncher.views.Remote2WHelpUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_Remote2WHelpUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_Remote2WHelpUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Remote2WHelpUI.watcherSetupUtil = new _com_scenarioLauncher_views_Remote2WHelpUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
      }
   }
}
