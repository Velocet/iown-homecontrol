package
{
   import com.scenarioLauncher.views.popup.MaintenanceConnexionPopup;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_popup_MaintenanceConnexionPopupWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_popup_MaintenanceConnexionPopupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MaintenanceConnexionPopup.watcherSetupUtil = new _com_scenarioLauncher_views_popup_MaintenanceConnexionPopupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[3] = new PropertyWatcher("lbPasswordFailed",{"propertyChange":true},[param3[2]],param2);
         param4[4] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[1] = new PropertyWatcher("passwordFailedImage",{"propertyChange":true},[param3[2]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[2]],null);
         param4[3].updateParent(param1);
         param4[3].addChild(param4[4]);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[2]);
      }
   }
}
