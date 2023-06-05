package
{
   import com.scenarioLauncher.managers.CookieManager;
   import com.scenarioLauncher.views.WelcomeUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_WelcomeUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_WelcomeUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WelcomeUI.watcherSetupUtil = new _com_scenarioLauncher_views_WelcomeUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new StaticPropertyWatcher("welcome",{"propertyChange":true},[param3[0]],null);
         param4[1] = new StaticPropertyWatcher("instance",null,[param3[1]],null);
         param4[0].updateParent(WelcomeUI);
         param4[1].updateParent(CookieManager);
      }
   }
}
