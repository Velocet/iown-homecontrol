package
{
   import com.scenarioLauncher.components.renderers.ListComboRenderer;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_components_renderers_ListComboRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_components_renderers_ListComboRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ListComboRenderer.watcherSetupUtil = new _com_scenarioLauncher_components_renderers_ListComboRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[0] = new PropertyWatcher("_label",{"propertyChange":true},[param3[0]],param2);
         param4[1] = new PropertyWatcher("_labelColor",{"propertyChange":true},[param3[1]],param2);
         param4[0].updateParent(param1);
         param4[1].updateParent(param1);
      }
   }
}
