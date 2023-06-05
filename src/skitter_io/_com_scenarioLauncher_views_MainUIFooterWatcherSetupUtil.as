package
{
   import com.scenarioLauncher.views.MainUIFooter;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_MainUIFooterWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_MainUIFooterWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MainUIFooter.watcherSetupUtil = new _com_scenarioLauncher_views_MainUIFooterWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("StartUpdateUp",{"propertyChange":true},[param3[0]],param2);
         param4[0].updateParent(param1);
      }
   }
}
