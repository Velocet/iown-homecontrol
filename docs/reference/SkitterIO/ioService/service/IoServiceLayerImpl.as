package ioService.service
{
   import flash.utils.setTimeout;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import ioService.applicationProxy.ApplicationProxy;
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Beacon;
   import ioService.datamodel.Key2W;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Skitter;
   import mx.collections.ArrayCollection;
   import mx.rpc.Fault;
   import mx.rpc.events.FaultEvent;
   
   public class IoServiceLayerImpl implements IoServiceLayer
   {
      
      private static var _newPairedBeaconCallback:Function = null;
      
      private static var _instance:ioService.service.IoServiceLayerImpl = null;
      
      private static var _errorCallback:Function = null;
      
      private static var _scenarioCallback:Function = null;
      
      private static var _newPairedActuatorCallback:Function = null;
      
      private static var _newSystemKeyCallback:Function = null;
       
      
      public const NO_SKITTER_CONNECTED:int = 2;
      
      public const SKITTER_NOT_CONNECTED:int = 1;
      
      public const FAILURE_ACTUATOR_NOT_REACHED:int = 1;
      
      private var faultEvent:FaultEvent;
      
      public const FAILURE_DEVICE_NOT_SYNCHRONIZED:int = 3;
      
      private var newKey:Key2W;
      
      public const FAILURE_NO_2W_KEY_FROM_CONTROLLER:int = 0;
      
      private var fault:Fault;
      
      private var _appProxy:ApplicationProxy;
      
      public const FAILURE_SCENARIO_NOT_EXECUTED:int = 2;
      
      private var _SynchronizingSkitter:Skitter;
      
      private var _connectedDevices:ArrayCollection;
      
      private var isStarted:Boolean = false;
      
      public const ACTION_IN_PROGRESS:int = 0;
      
      public function IoServiceLayerImpl()
      {
         this._connectedDevices = new ArrayCollection();
         this._appProxy = new ApplicationProxy();
         super();
      }
      
      public static function get instance() : ioService.service.IoServiceLayerImpl
      {
         if(_instance == null)
         {
            _instance = new ioService.service.IoServiceLayerImpl();
         }
         return _instance;
      }
      
      public function upgradeSkitter(param1:Skitter, param2:String, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         if(this._connectedDevices.length > 0)
         {
            this._appProxy.upgrader.upgradeDevice(param1,param3,param4,param5);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param5,1,this.faultEvent);
         }
      }
      
      public function getWindowsServiceVersion() : String
      {
         return this._appProxy.windowsServiceManager.version;
      }
      
      public function getActuatorName(param1:Actuator, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc4_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.getActuatorName(parseInt(_loc4_.virtualComPort),param1,param2,param3);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param3,1,this.faultEvent);
         }
      }
      
      public function get connectedDevices() : ArrayCollection
      {
         return this._connectedDevices;
      }
      
      public function identifyActuator(param1:Actuator, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc4_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.identifyActuator(parseInt(_loc4_.virtualComPort),param1,param2,param3);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param3,1,this.faultEvent);
         }
      }
      
      public function setActuatorName(param1:Actuator, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc5_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.setActuatorName(parseInt(_loc5_.virtualComPort),param1,param2,param3,param4);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param4,1,this.faultEvent);
         }
      }
      
      private function newDisconnectedDevice(param1:XMLDocument) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._connectedDevices)
         {
            if(_loc2_.virtualComPort == param1.firstChild.attributes.comport)
            {
               if(this._connectedDevices.getItemIndex(_loc2_) == 0)
               {
                  this._appProxy.useCaseHandler.abortUseCaseBecauseDeviceIsDisconnected();
               }
               this._connectedDevices.removeItemAt(this._connectedDevices.getItemIndex(_loc2_));
            }
         }
      }
      
      public function cancelGiveKey(param1:Function = null, param2:Function = null) : void
      {
         var _loc3_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc3_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.cancelGiveKey(parseInt(_loc3_.virtualComPort),param1,param2);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param2,1,this.faultEvent);
         }
      }
      
      public function pairEquipmentInSystem(param1:Function = null, param2:Function = null, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc5_ = this._connectedDevices[0];
            _newPairedActuatorCallback = param1;
            _newPairedBeaconCallback = param2;
            this._appProxy.useCaseHandler.pairEquipmentInSystem(parseInt(_loc5_.virtualComPort),this.pairedActuatorCB,this.pairedBeaconCB,param3,param4);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param4,1,this.faultEvent);
         }
      }
      
      public function getActuatorPosition(param1:Actuator, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc4_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.getActuatorPosition(parseInt(_loc4_.virtualComPort),param1,param2,param3);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param3,1,this.faultEvent);
         }
      }
      
      private function pairedBeaconCB(param1:Beacon) : void
      {
         var _loc3_:* = null;
         var _loc2_:Skitter = this._connectedDevices[0];
         for each(_loc3_ in _loc2_.repeaters)
         {
            if(_loc3_.equals(param1))
            {
               return;
            }
         }
         _newPairedBeaconCallback(param1);
      }
      
      public function pairEquipmentStimulatedBy1WController(param1:Function = null, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc4_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.pairEquipmentStimulatedBy1WController(parseInt(_loc4_.virtualComPort),param1,param2,param3);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param3,1,this.faultEvent);
         }
      }
      
      private function newSystemKeyEnded(param1:Key2W) : void
      {
         var _loc3_:XMLDocument = null;
         var _loc4_:XMLNode = null;
         var _loc2_:Skitter = this._connectedDevices[0];
         this.newKey = param1;
         _loc3_ = new XMLDocument();
         _loc4_ = _loc3_.createElement("system");
         _loc3_.appendChild(_loc4_);
         this._appProxy.synchronizer.ReadDataFromDevice(parseInt(_loc2_.virtualComPort),_loc3_,this.getBackActuatorAfterNewKey,_errorCallback);
      }
      
      private function getBackActuatorAfterNewKey(param1:XMLDocument) : void
      {
         var list:XMLNode = null;
         var a_now:Actuator = null;
         var skitterNode:XMLNode = null;
         var a_before:Actuator = null;
         var XmlSystemDescription:XMLDocument = param1;
         var MyNewSkitter:Skitter = new Skitter();
         var sk:Skitter = this._connectedDevices[0];
         for each(list in XmlSystemDescription.firstChild.childNodes)
         {
            if(list.nodeName == "listof-skitter")
            {
               for each(skitterNode in list.childNodes)
               {
                  try
                  {
                     MyNewSkitter.FillWithThisXmlData(skitterNode);
                  }
                  catch(e:Error)
                  {
                  }
               }
            }
         }
         MyNewSkitter.Display();
         for each(a_now in MyNewSkitter.actuators)
         {
            for each(a_before in sk.actuators)
            {
               if(a_now.equals(a_before))
               {
                  a_before.keyState = a_now.keyState;
               }
            }
         }
         _newSystemKeyCallback(this.newKey);
      }
      
      private function deviceIsSynchronizedForScenarioTest() : void
      {
         var _loc1_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc1_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.testScenario(parseInt(_loc1_.virtualComPort),_scenarioCallback,_errorCallback);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(_errorCallback,1,this.faultEvent);
         }
      }
      
      public function pairNewEquipment(param1:Function = null, param2:Function = null, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc5_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.pairNewEquipment(parseInt(_loc5_.virtualComPort),param1,param2,param3,param4);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param4,1,this.faultEvent);
         }
      }
      
      public function testScenario(param1:Scenario, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc4_ = this._connectedDevices[0];
            _scenarioCallback = param2;
            _errorCallback = param3;
            _loc4_.ScenarioToTest = param1;
            this.synchronizeSkitter(_loc4_,this.deviceIsSynchronizedForScenarioTest,param3);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param3,1,this.faultEvent);
         }
      }
      
      public function synchronizeSkitter(param1:Skitter, param2:Function = null, param3:Function = null) : void
      {
         var _loc4_:XMLDocument;
         var _loc5_:XMLNode = (_loc4_ = new XMLDocument()).createElement("system");
         var _loc6_:XMLNode = _loc4_.createElement("listof-skitter");
         _loc4_.appendChild(_loc5_);
         _loc5_.appendChild(_loc6_);
         _loc6_.appendChild(param1.GiveYourXmlData());
         param1.Display();
         this._appProxy.synchronizeSkitter(param1,_loc4_,param2,param3);
      }
      
      public function getKeyFrom2WController(param1:Function = null, param2:Function = null) : void
      {
         var _loc3_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc3_ = this._connectedDevices[0];
            _newSystemKeyCallback = param1;
            _errorCallback = param2;
            this._appProxy.useCaseHandler.getKeyFrom2WController(parseInt(_loc3_.virtualComPort),this.newSystemKeyEnded,param2);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param2,1,this.faultEvent);
         }
      }
      
      public function start(param1:Function = null) : void
      {
         if(this.isStarted == false)
         {
            this._appProxy.start(param1,this.newConnectedDevice,this.newDisconnectedDevice);
            this.isStarted = true;
         }
      }
      
      public function resetSkitter(param1:Skitter, param2:Function = null, param3:Function = null) : void
      {
         if(this._connectedDevices.length > 0)
         {
            this._appProxy.useCaseHandler.restoreFactorySettings(param1,param2,param3);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param3,1,this.faultEvent);
         }
      }
      
      private function pairedActuatorCB(param1:Actuator) : void
      {
         var _loc3_:* = null;
         var _loc2_:Skitter = this._connectedDevices[0];
         for each(_loc3_ in _loc2_.actuators)
         {
            if(_loc3_.equals(param1))
            {
               return;
            }
         }
         _newPairedActuatorCallback(param1);
      }
      
      public function generateNewKey(param1:Function = null, param2:Function = null) : void
      {
         var _loc3_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc3_ = this._connectedDevices[0];
            _newSystemKeyCallback = param1;
            _errorCallback = param2;
            this._appProxy.useCaseHandler.generateNewKey(parseInt(_loc3_.virtualComPort),this.newSystemKeyEnded,param2);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param2,1,this.faultEvent);
         }
      }
      
      public function giveKeyToAnother2WController(param1:Function = null, param2:Function = null) : void
      {
         var _loc3_:Skitter = null;
         if(this._connectedDevices.length > 0)
         {
            _loc3_ = this._connectedDevices[0];
            this._appProxy.useCaseHandler.giveKeyToAnother2WController(parseInt(_loc3_.virtualComPort),param1,param2);
         }
         else
         {
            this.fault = new Fault(ErrorCodes.ERROR_SKITTER_NOT_CONNECTED,"","");
            this.faultEvent = new FaultEvent(FaultEvent.FAULT,false,true,this.fault);
            setTimeout(param2,1,this.faultEvent);
         }
      }
      
      private function newConnectedDevice(param1:XMLDocument) : void
      {
         var list:XMLNode = null;
         var skitterNode:XMLNode = null;
         var MyNewSkitter:Skitter = null;
         var skitter:Skitter = null;
         var XmlSystemDescription:XMLDocument = param1;
         for each(list in XmlSystemDescription.firstChild.childNodes)
         {
            if(list.nodeName == "listof-skitter")
            {
               for each(skitterNode in list.childNodes)
               {
                  MyNewSkitter = new Skitter();
                  MyNewSkitter.virtualComPort = XmlSystemDescription.firstChild.attributes.comport;
                  try
                  {
                     MyNewSkitter.FillWithThisXmlData(skitterNode);
                  }
                  catch(e:Error)
                  {
                     trace("error during synchronisation");
                     MyNewSkitter.currentKey2W = new Key2W();
                     MyNewSkitter.currentKey2W.currentKey = "00000000000000000000000000000000";
                     MyNewSkitter.currentKey2W.oldKey = "00000000000000000000000000000000";
                  }
                  MyNewSkitter.Display();
                  for each(skitter in this._connectedDevices)
                  {
                     if(skitter.identifier == MyNewSkitter.identifier)
                     {
                        this._connectedDevices.removeItemAt(this._connectedDevices.getItemIndex(skitter));
                     }
                  }
                  this._connectedDevices.addItem(MyNewSkitter);
               }
            }
         }
      }
   }
}
