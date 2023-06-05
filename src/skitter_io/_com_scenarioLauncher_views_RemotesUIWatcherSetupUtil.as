package
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.views.RemotesUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_RemotesUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_RemotesUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RemotesUI.watcherSetupUtil = new _com_scenarioLauncher_views_RemotesUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[3] = new PropertyWatcher("_remoteSelected",{"propertyChange":true},[param3[4],param3[5],param3[6],param3[7]],param2);
         param4[4] = new PropertyWatcher("active",{"propertyChange":true},[param3[4],param3[5],param3[6],param3[7]],null);
         param4[0] = new StaticPropertyWatcher("instance",null,[param3[0]],null);
         param4[1] = new PropertyWatcher("devicesList",{"propertyChange":true},[param3[0]],null);
         param4[2] = new PropertyWatcher("_arrowPosition",{"propertyChange":true},[param3[3]],param2);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[4]);
         param4[0].updateParent(ServerCommunicationManager);
         param4[0].addChild(param4[1]);
         param4[2].updateParent(param1);
      }
   }
}
