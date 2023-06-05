package
{
   import com.scenarioLauncher.components.SLComboBox;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_components_SLComboBoxWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_components_SLComboBoxWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SLComboBox.watcherSetupUtil = new _com_scenarioLauncher_components_SLComboBoxWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[6] = new PropertyWatcher("_prompt",{"propertyChange":true},[param3[8]],param2);
         param4[2] = new PropertyWatcher("height",{"heightChanged":true},[param3[3],param3[10]],param2);
         param4[4] = new PropertyWatcher("_styleName",{"propertyChange":true},[param3[5],param3[11]],param2);
         param4[0] = new PropertyWatcher("width",{"widthChanged":true},[param3[0],param3[2],param3[9]],param2);
         param4[5] = new PropertyWatcher("_iconSystemVisible",{"propertyChange":true},[param3[6],param3[7]],param2);
         param4[3] = new PropertyWatcher("type",{"propertyChange":true},[param3[4]],param2);
         param4[6].updateParent(param1);
         param4[2].updateParent(param1);
         param4[4].updateParent(param1);
         param4[0].updateParent(param1);
         param4[5].updateParent(param1);
         param4[3].updateParent(param1);
      }
   }
}
