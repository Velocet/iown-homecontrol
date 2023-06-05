package
{
   import com.scenarioLauncher.views.SynchronizeRemoteContolUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_SynchronizeRemoteContolUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_SynchronizeRemoteContolUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SynchronizeRemoteContolUI.watcherSetupUtil = new _com_scenarioLauncher_views_SynchronizeRemoteContolUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[12] = new PropertyWatcher("lbCancelConfiguration",{"propertyChange":true},[param3[4]],param2);
         param4[14] = new PropertyWatcher("height",{"heightChanged":true},[param3[4]],null);
         param4[13] = new PropertyWatcher("y",{"yChanged":true},[param3[4]],null);
         param4[9] = new PropertyWatcher("lbSynchronizationFailed",{"propertyChange":true},[param3[3]],param2);
         param4[11] = new PropertyWatcher("height",{"heightChanged":true},[param3[3]],null);
         param4[10] = new PropertyWatcher("y",{"yChanged":true},[param3[3]],null);
         param4[6] = new PropertyWatcher("lbSynchronizationSuccess",{"propertyChange":true},[param3[2]],param2);
         param4[8] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[7] = new PropertyWatcher("y",{"yChanged":true},[param3[2]],null);
         param4[3] = new PropertyWatcher("lbSynchronizationInProgress2",{"propertyChange":true},[param3[1]],param2);
         param4[5] = new PropertyWatcher("height",{"heightChanged":true},[param3[1]],null);
         param4[4] = new PropertyWatcher("y",{"yChanged":true},[param3[1]],null);
         param4[0] = new PropertyWatcher("lbSynchronizationInProgress",{"propertyChange":true},[param3[0]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[0]],null);
         param4[1] = new PropertyWatcher("y",{"yChanged":true},[param3[0]],null);
         param4[12].updateParent(param1);
         param4[12].addChild(param4[14]);
         param4[12].addChild(param4[13]);
         param4[9].updateParent(param1);
         param4[9].addChild(param4[11]);
         param4[9].addChild(param4[10]);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[8]);
         param4[6].addChild(param4[7]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[5]);
         param4[3].addChild(param4[4]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[1]);
      }
   }
}
