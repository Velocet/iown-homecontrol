package
{
   import com.scenarioLauncher.views.renderers.RemoteTileListRenderer;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_renderers_RemoteTileListRendererWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_renderers_RemoteTileListRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RemoteTileListRenderer.watcherSetupUtil = new _com_scenarioLauncher_views_renderers_RemoteTileListRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[1] = new PropertyWatcher("_visible",{"propertyChange":true},[param3[1],param3[3],param3[7],param3[9],param3[10],param3[11]],param2);
         param4[2] = new PropertyWatcher("enableHandCursor",{"propertyChange":true},[param3[2]],param2);
         param4[5] = new PropertyWatcher("_leftScenarioLabel",{"propertyChange":true},[param3[6]],param2);
         param4[0] = new PropertyWatcher("_label",{"propertyChange":true},[param3[0]],param2);
         param4[3] = new PropertyWatcher("_styleName",{"propertyChange":true},[param3[4]],param2);
         param4[6] = new PropertyWatcher("_rightScenarioLabel",{"propertyChange":true},[param3[8]],param2);
         param4[4] = new PropertyWatcher("_visibleCase",{"propertyChange":true},[param3[5]],param2);
         param4[1].updateParent(param1);
         param4[2].updateParent(param1);
         param4[5].updateParent(param1);
         param4[0].updateParent(param1);
         param4[3].updateParent(param1);
         param4[6].updateParent(param1);
         param4[4].updateParent(param1);
      }
   }
}
