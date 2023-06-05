package
{
   import com.scenarioLauncher.views.RenameSkittyUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_RenameSkittyUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_RenameSkittyUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RenameSkittyUI.watcherSetupUtil = new _com_scenarioLauncher_views_RenameSkittyUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[2] = new PropertyWatcher("renameSkittyUINewName",{"propertyChange":true},[param3[3],param3[4]],param2);
         param4[4] = new PropertyWatcher("height",{"heightChanged":true},[param3[3],param3[4]],null);
         param4[3] = new PropertyWatcher("y",{"yChanged":true},[param3[3],param3[4]],null);
         param4[2].updateParent(param1);
         param4[2].addChild(param4[4]);
         param4[2].addChild(param4[3]);
      }
   }
}
