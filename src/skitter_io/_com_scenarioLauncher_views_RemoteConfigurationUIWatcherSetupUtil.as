package
{
   import com.scenarioLauncher.views.RemoteConfigurationUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_RemoteConfigurationUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_RemoteConfigurationUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RemoteConfigurationUI.watcherSetupUtil = new _com_scenarioLauncher_views_RemoteConfigurationUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("btnSynchronize",{"propertyChange":true},[param3[4]],param2);
         param4[4] = new PropertyWatcher("width",{"widthChanged":true},[param3[4]],null);
         param4[3] = new PropertyWatcher("x",{"xChanged":true},[param3[4]],null);
         param4[0] = new PropertyWatcher("_allScenarios",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("labelSkitterName",{"propertyChange":true},[param3[3]],param2);
         param4[5] = new PropertyWatcher("btnCancel",{"propertyChange":true},[param3[5]],param2);
         param4[7] = new PropertyWatcher("width",{"widthChanged":true},[param3[5]],null);
         param4[6] = new PropertyWatcher("x",{"xChanged":true},[param3[5]],null);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[4]);
         param4[2].addChild(param4[3]);
         param4[0].updateParent(param1);
         param4[1].updateParent(param1);
         param4[5].updateParent(param1);
         param4[5].addChild(param4[7]);
         param4[5].addChild(param4[6]);
      }
   }
}
