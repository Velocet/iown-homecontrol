package
{
   import com.scenarioLauncher.components.HelpMySpace;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_components_HelpMySpaceWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_components_HelpMySpaceWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         HelpMySpace.watcherSetupUtil = new _com_scenarioLauncher_components_HelpMySpaceWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("goToMySpaceLabel",{"propertyChange":true},[param3[0]],param2);
         param4[0].updateParent(param1);
      }
   }
}
