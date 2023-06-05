package
{
   import com.scenarioLauncher.views.MainUIHeader;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_MainUIHeaderWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_MainUIHeaderWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MainUIHeader.watcherSetupUtil = new _com_scenarioLauncher_views_MainUIHeaderWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("_buttonWidth",{"propertyChange":true},[param3[0],param3[1],param3[2]],param2);
         param4[0].updateParent(param1);
      }
   }
}
