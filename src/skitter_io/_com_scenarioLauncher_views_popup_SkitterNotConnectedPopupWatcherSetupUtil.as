package
{
   import com.scenarioLauncher.views.popup.SkitterNotConnectedPopup;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_popup_SkitterNotConnectedPopupWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_popup_SkitterNotConnectedPopupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SkitterNotConnectedPopup.watcherSetupUtil = new _com_scenarioLauncher_views_popup_SkitterNotConnectedPopupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
      }
   }
}
