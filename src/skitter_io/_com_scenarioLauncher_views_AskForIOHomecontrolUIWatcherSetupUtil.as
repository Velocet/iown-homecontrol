package
{
   import com.scenarioLauncher.views.AskForIOHomecontrolUI;
   import flash.display.Sprite;
   import mx.binding.IWatcherSetupUtil;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _com_scenarioLauncher_views_AskForIOHomecontrolUIWatcherSetupUtil extends Sprite implements IWatcherSetupUtil
   {
       
      
      public function _com_scenarioLauncher_views_AskForIOHomecontrolUIWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AskForIOHomecontrolUI.watcherSetupUtil = new _com_scenarioLauncher_views_AskForIOHomecontrolUIWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Array, param4:Array) : void
      {
         param4[31] = new PropertyWatcher("btnNoUserHaveOneWRemotecontrol",{"propertyChange":true},[param3[27]],param2);
         param4[33] = new PropertyWatcher("width",{"widthChanged":true},[param3[27]],null);
         param4[32] = new PropertyWatcher("x",{"xChanged":true},[param3[27]],null);
         param4[16] = new PropertyWatcher("lbDiscoveryInProgress2",{"propertyChange":true},[param3[14]],param2);
         param4[18] = new PropertyWatcher("height",{"heightChanged":true},[param3[14]],null);
         param4[17] = new PropertyWatcher("y",{"yChanged":true},[param3[14]],null);
         param4[49] = new PropertyWatcher("lbDiscoveryOneWayCommunicationEquipmentFailed",{"propertyChange":true},[param3[41]],param2);
         param4[51] = new PropertyWatcher("height",{"heightChanged":true},[param3[41]],null);
         param4[50] = new PropertyWatcher("y",{"yChanged":true},[param3[41]],null);
         param4[67] = new PropertyWatcher("lbNewIOHomecontrolCommunicationEquipmentFailed",{"propertyChange":true},[param3[57]],param2);
         param4[69] = new PropertyWatcher("height",{"heightChanged":true},[param3[57]],null);
         param4[68] = new PropertyWatcher("y",{"yChanged":true},[param3[57]],null);
         param4[19] = new PropertyWatcher("lbCommunicationRemoteFailed",{"propertyChange":true},[param3[17]],param2);
         param4[21] = new PropertyWatcher("height",{"heightChanged":true},[param3[17]],null);
         param4[20] = new PropertyWatcher("y",{"yChanged":true},[param3[17]],null);
         param4[7] = new PropertyWatcher("lbUserManipulationsThenOK",{"propertyChange":true},[param3[7],param3[8],param3[10]],param2);
         param4[9] = new PropertyWatcher("height",{"heightChanged":true},[param3[7],param3[8],param3[10]],null);
         param4[8] = new PropertyWatcher("y",{"yChanged":true},[param3[7],param3[8],param3[10]],null);
         param4[10] = new PropertyWatcher("btnOk",{"propertyChange":true},[param3[9]],param2);
         param4[12] = new PropertyWatcher("width",{"widthChanged":true},[param3[9]],null);
         param4[11] = new PropertyWatcher("x",{"xChanged":true},[param3[9]],null);
         param4[40] = new PropertyWatcher("btnOkOneWRemotecontrol",{"propertyChange":true},[param3[34]],param2);
         param4[42] = new PropertyWatcher("width",{"widthChanged":true},[param3[34]],null);
         param4[41] = new PropertyWatcher("x",{"xChanged":true},[param3[34]],null);
         param4[4] = new PropertyWatcher("btnNoIsUserHaveIOHomecontrolWithFeedback",{"propertyChange":true},[param3[3]],param2);
         param4[6] = new PropertyWatcher("width",{"widthChanged":true},[param3[3]],null);
         param4[5] = new PropertyWatcher("x",{"xChanged":true},[param3[3]],null);
         param4[70] = new PropertyWatcher("lbNewIOHomecontrolCommunicationEquipmentPartialyFailed",{"propertyChange":true},[param3[60]],param2);
         param4[72] = new PropertyWatcher("height",{"heightChanged":true},[param3[60]],null);
         param4[71] = new PropertyWatcher("y",{"yChanged":true},[param3[60]],null);
         param4[34] = new PropertyWatcher("lbOneWRemotecontrolUserManipulationsThenOK",{"propertyChange":true},[param3[31]],param2);
         param4[36] = new PropertyWatcher("height",{"heightChanged":true},[param3[31]],null);
         param4[35] = new PropertyWatcher("y",{"yChanged":true},[param3[31]],null);
         param4[25] = new PropertyWatcher("lbDiscoverySuccess",{"propertyChange":true},[param3[23]],param2);
         param4[27] = new PropertyWatcher("height",{"heightChanged":true},[param3[23]],null);
         param4[26] = new PropertyWatcher("y",{"yChanged":true},[param3[23]],null);
         param4[61] = new PropertyWatcher("lbNewIOHomecontrolDiscoveryInProgress",{"propertyChange":true},[param3[53]],param2);
         param4[63] = new PropertyWatcher("height",{"heightChanged":true},[param3[53]],null);
         param4[62] = new PropertyWatcher("y",{"yChanged":true},[param3[53]],null);
         param4[13] = new PropertyWatcher("lbDiscoveryInProgress",{"propertyChange":true},[param3[13]],param2);
         param4[15] = new PropertyWatcher("height",{"heightChanged":true},[param3[13]],null);
         param4[14] = new PropertyWatcher("y",{"yChanged":true},[param3[13]],null);
         param4[64] = new PropertyWatcher("lbNewIOHomecontrolDiscoveryInProgress2",{"propertyChange":true},[param3[54]],param2);
         param4[66] = new PropertyWatcher("height",{"heightChanged":true},[param3[54]],null);
         param4[65] = new PropertyWatcher("y",{"yChanged":true},[param3[54]],null);
         param4[22] = new PropertyWatcher("lbCommunicationEquipmentFailed",{"propertyChange":true},[param3[20]],param2);
         param4[24] = new PropertyWatcher("height",{"heightChanged":true},[param3[20]],null);
         param4[23] = new PropertyWatcher("y",{"yChanged":true},[param3[20]],null);
         param4[46] = new PropertyWatcher("lbDiscoveryOneWayInProgress2",{"propertyChange":true},[param3[38]],param2);
         param4[48] = new PropertyWatcher("height",{"heightChanged":true},[param3[38]],null);
         param4[47] = new PropertyWatcher("y",{"yChanged":true},[param3[38]],null);
         param4[52] = new PropertyWatcher("lbDiscoveryOneWaySuccess",{"propertyChange":true},[param3[44]],param2);
         param4[54] = new PropertyWatcher("height",{"heightChanged":true},[param3[44]],null);
         param4[53] = new PropertyWatcher("y",{"yChanged":true},[param3[44]],null);
         param4[58] = new PropertyWatcher("lbIsUserHaveNewIOHomecontrolWithFeedback",{"propertyChange":true},[param3[50]],param2);
         param4[60] = new PropertyWatcher("height",{"heightChanged":true},[param3[50]],null);
         param4[59] = new PropertyWatcher("y",{"yChanged":true},[param3[50]],null);
         param4[37] = new PropertyWatcher("lbOneWRemotecontrolUserManipulationsThenOKWarn",{"propertyChange":true},[param3[32],param3[33]],param2);
         param4[39] = new PropertyWatcher("height",{"heightChanged":true},[param3[32],param3[33]],null);
         param4[38] = new PropertyWatcher("y",{"yChanged":true},[param3[32],param3[33]],null);
         param4[1] = new PropertyWatcher("lbIsUserHaveIOHomecontrolWithFeedback",{"propertyChange":true},[param3[2],param3[4]],param2);
         param4[3] = new PropertyWatcher("height",{"heightChanged":true},[param3[2],param3[4]],null);
         param4[2] = new PropertyWatcher("y",{"yChanged":true},[param3[2],param3[4]],null);
         param4[55] = new PropertyWatcher("lbPleaseRestartProcedure",{"propertyChange":true},[param3[47]],param2);
         param4[57] = new PropertyWatcher("height",{"heightChanged":true},[param3[47]],null);
         param4[56] = new PropertyWatcher("y",{"yChanged":true},[param3[47]],null);
         param4[43] = new PropertyWatcher("lbDiscoveryOneWayInProgress",{"propertyChange":true},[param3[37]],param2);
         param4[45] = new PropertyWatcher("height",{"heightChanged":true},[param3[37]],null);
         param4[44] = new PropertyWatcher("y",{"yChanged":true},[param3[37]],null);
         param4[73] = new PropertyWatcher("lbNewIOHomecontrolDiscoverySuccess",{"propertyChange":true},[param3[63]],param2);
         param4[75] = new PropertyWatcher("height",{"heightChanged":true},[param3[63]],null);
         param4[74] = new PropertyWatcher("y",{"yChanged":true},[param3[63]],null);
         param4[28] = new PropertyWatcher("lbIsUserHaveOneWRemotecontrol",{"propertyChange":true},[param3[26],param3[28]],param2);
         param4[30] = new PropertyWatcher("height",{"heightChanged":true},[param3[26],param3[28]],null);
         param4[29] = new PropertyWatcher("y",{"yChanged":true},[param3[26],param3[28]],null);
         param4[31].updateParent(param1);
         param4[31].addChild(param4[33]);
         param4[31].addChild(param4[32]);
         param4[16].updateParent(param1);
         param4[16].addChild(param4[18]);
         param4[16].addChild(param4[17]);
         param4[49].updateParent(param1);
         param4[49].addChild(param4[51]);
         param4[49].addChild(param4[50]);
         param4[67].updateParent(param1);
         param4[67].addChild(param4[69]);
         param4[67].addChild(param4[68]);
         param4[19].updateParent(param1);
         param4[19].addChild(param4[21]);
         param4[19].addChild(param4[20]);
         param4[7].updateParent(param1);
         param4[7].addChild(param4[9]);
         param4[7].addChild(param4[8]);
         param4[10].updateParent(param1);
         param4[10].addChild(param4[12]);
         param4[10].addChild(param4[11]);
         param4[40].updateParent(param1);
         param4[40].addChild(param4[42]);
         param4[40].addChild(param4[41]);
         param4[4].updateParent(param1);
         param4[4].addChild(param4[6]);
         param4[4].addChild(param4[5]);
         param4[70].updateParent(param1);
         param4[70].addChild(param4[72]);
         param4[70].addChild(param4[71]);
         param4[34].updateParent(param1);
         param4[34].addChild(param4[36]);
         param4[34].addChild(param4[35]);
         param4[25].updateParent(param1);
         param4[25].addChild(param4[27]);
         param4[25].addChild(param4[26]);
         param4[61].updateParent(param1);
         param4[61].addChild(param4[63]);
         param4[61].addChild(param4[62]);
         param4[13].updateParent(param1);
         param4[13].addChild(param4[15]);
         param4[13].addChild(param4[14]);
         param4[64].updateParent(param1);
         param4[64].addChild(param4[66]);
         param4[64].addChild(param4[65]);
         param4[22].updateParent(param1);
         param4[22].addChild(param4[24]);
         param4[22].addChild(param4[23]);
         param4[46].updateParent(param1);
         param4[46].addChild(param4[48]);
         param4[46].addChild(param4[47]);
         param4[52].updateParent(param1);
         param4[52].addChild(param4[54]);
         param4[52].addChild(param4[53]);
         param4[58].updateParent(param1);
         param4[58].addChild(param4[60]);
         param4[58].addChild(param4[59]);
         param4[37].updateParent(param1);
         param4[37].addChild(param4[39]);
         param4[37].addChild(param4[38]);
         param4[1].updateParent(param1);
         param4[1].addChild(param4[3]);
         param4[1].addChild(param4[2]);
         param4[55].updateParent(param1);
         param4[55].addChild(param4[57]);
         param4[55].addChild(param4[56]);
         param4[43].updateParent(param1);
         param4[43].addChild(param4[45]);
         param4[43].addChild(param4[44]);
         param4[73].updateParent(param1);
         param4[73].addChild(param4[75]);
         param4[73].addChild(param4[74]);
         param4[28].updateParent(param1);
         param4[28].addChild(param4[30]);
         param4[28].addChild(param4[29]);
      }
   }
}
