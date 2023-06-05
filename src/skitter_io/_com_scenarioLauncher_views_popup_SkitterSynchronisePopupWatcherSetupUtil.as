package
{
   import com.scenarioLauncher.views.popup.SkitterSynchronisePopup;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_popup_SkitterSynchronisePopupWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_popup_SkitterSynchronisePopupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SkitterSynchronisePopup.watcherSetupUtil = new _com_scenarioLauncher_views_popup_SkitterSynchronisePopupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
      }
   }
}
