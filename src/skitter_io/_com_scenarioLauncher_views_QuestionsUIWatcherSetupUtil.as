package
{
   import com.scenarioLauncher.views.QuestionsUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_QuestionsUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_QuestionsUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         QuestionsUI.watcherSetupUtil = new _com_scenarioLauncher_views_QuestionsUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("myScenariosReader",{"propertyChange":true},[param3[1]],param2);
         param4[3] = new PropertyWatcher("title",{"propertyChange":true},[param3[1]],null);
         param4[0] = new PropertyWatcher("myInstallationReader",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("title",{"propertyChange":true},[param3[0]],null);
         param4[6] = new PropertyWatcher("systemReader",{"propertyChange":true},[param3[3]],param2);
         param4[7] = new PropertyWatcher("title",{"propertyChange":true},[param3[3]],null);
         param4[4] = new PropertyWatcher("mySkittersReader",{"propertyChange":true},[param3[2]],param2);
         param4[5] = new PropertyWatcher("title",{"propertyChange":true},[param3[2]],null);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[3]);
         param4[0].updateParent(param1);
         param4[0].addChild(param4[1]);
         param4[6].updateParent(param1);
         param4[6].addChild(param4[7]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[5]);
      }
   }
}
