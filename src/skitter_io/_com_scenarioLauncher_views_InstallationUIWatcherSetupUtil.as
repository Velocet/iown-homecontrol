package
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.views.InstallationUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_InstallationUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_InstallationUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InstallationUI.watcherSetupUtil = new _com_scenarioLauncher_views_InstallationUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new StaticPropertyWatcher("instance",null,[param3[0]],null);
         param4[1] = new PropertyWatcher("actuatorsList",{"propertyChange":true},[param3[0]],null);
         param4[7] = new PropertyWatcher("systemComboBox",{"propertyChange":true},[param3[8]],param2);
         param4[4] = new PropertyWatcher("languagesComboBox",{"propertyChange":true},[param3[5]],param2);
         param4[6] = new PropertyWatcher("_languages",{"propertyChange":true},[param3[7]],param2);
         param4[3] = new PropertyWatcher("_systemLabels",{"propertyChange":true},[param3[4]],param2);
         param4[0].updateParent(ServerCommunicationManager);
         param4[0].addChild(param4[1]);
         param4[7].updateParent(param1);
         param4[4].updateParent(param1);
         param4[6].updateParent(param1);
         param4[3].updateParent(param1);
      }
   }
}
