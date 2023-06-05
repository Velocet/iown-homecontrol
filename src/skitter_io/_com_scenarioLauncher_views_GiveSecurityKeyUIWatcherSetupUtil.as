package
{
   import com.scenarioLauncher.views.GiveSecurityKeyUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_GiveSecurityKeyUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_GiveSecurityKeyUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GiveSecurityKeyUI.watcherSetupUtil = new _com_scenarioLauncher_views_GiveSecurityKeyUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[21] = new PropertyWatcher("lbGiveKeyToIOHomeControlFailed",{"propertyChange":true},[param3[9]],param2);
         param4[23] = new PropertyWatcher("height",{"heightChanged":true},[param3[9]],null);
         param4[22] = new PropertyWatcher("y",{"yChanged":true},[param3[9]],null);
         param4[12] = new PropertyWatcher("lbGiveKeyToIOHomeControlSuccessTitle",{"propertyChange":true},[param3[4],param3[5]],param2);
         param4[14] = new PropertyWatcher("height",{"heightChanged":true},[param3[4],param3[5]],null);
         param4[13] = new PropertyWatcher("y",{"yChanged":true},[param3[4],param3[5]],null);
         param4[3] = new PropertyWatcher("lbGiveKeyToIOHomeControl",{"propertyChange":true},[param3[1]],param2);
         param4[5] = new PropertyWatcher("height",{"heightChanged":true},[param3[1]],null);
         param4[4] = new PropertyWatcher("y",{"yChanged":true},[param3[1]],null);
         param4[15] = new PropertyWatcher("lbGiveKeyToIOHomeControlSuccess",{"propertyChange":true},[param3[6]],param2);
         param4[17] = new PropertyWatcher("height",{"heightChanged":true},[param3[6]],null);
         param4[16] = new PropertyWatcher("y",{"yChanged":true},[param3[6]],null);
         param4[9] = new PropertyWatcher("lbGiveKeyToIOHomeControlPressKey",{"propertyChange":true},[param3[3]],param2);
         param4[11] = new PropertyWatcher("height",{"heightChanged":true},[param3[3]],null);
         param4[10] = new PropertyWatcher("y",{"yChanged":true},[param3[3]],null);
         param4[0] = new PropertyWatcher("lbGiveKeyToIOHomeControlTitle",{"propertyChange":true},[param3[0]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[0]],null);
         param4[1] = new PropertyWatcher("y",{"yChanged":true},[param3[0]],null);
         param4[6] = new PropertyWatcher("lbGiveKeyToIOHomeControlPressKeyTitle",{"propertyChange":true},[param3[2]],param2);
         param4[8] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[7] = new PropertyWatcher("y",{"yChanged":true},[param3[2]],null);
         param4[18] = new PropertyWatcher("lbgiveKeyToIOHomeControlFailedTitle",{"propertyChange":true},[param3[7],param3[8]],param2);
         param4[20] = new PropertyWatcher("height",{"heightChanged":true},[param3[7],param3[8]],null);
         param4[19] = new PropertyWatcher("y",{"yChanged":true},[param3[7],param3[8]],null);
         param4[21].updateParent(param1);
         param4[21].addChild(param4[23]);
         param4[21].addChild(param4[22]);
         param4[12].updateParent(param1);
         param4[12].addChild(param4[14]);
         param4[12].addChild(param4[13]);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[5]);
         param4[3].addChild(param4[4]);
         param4[15].updateParent(param1);
         param4[15].addChild(param4[17]);
         param4[15].addChild(param4[16]);
         param4[9].updateParent(param1);
         param4[9].addChild(param4[11]);
         param4[9].addChild(param4[10]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[2]);
         param4[0].addChild(param4[1]);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[8]);
         param4[6].addChild(param4[7]);
         param4[18].updateParent(param1);
         param4[18].addChild(param4[20]);
         param4[18].addChild(param4[19]);
      }
   }
}
