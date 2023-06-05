package com.scenarioLauncher.business
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.events.UpgradeEvent;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.managers.UpdaterManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.services.InstallationService;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.utils.Timer;
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Beacon;
   import ioService.datamodel.Installation;
   import ioService.datamodel.Key2W;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Situation;
   import ioService.datamodel.Skitter;
   import ioService.service.IoServiceLayer;
   import ioService.service.IoServiceLayerImpl;
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.core.Application;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.Fault;
   import mx.rpc.events.FaultEvent;
   
   public class ServerCommunicationManager extends EventDispatcher
   {
      
      private static var _instance:com.scenarioLauncher.business.ServerCommunicationManager = null;
       
      
      private var discoveryNewPairedActuator:Boolean = false;
      
      public var connectedDeviceToUpdate:ArrayCollection;
      
      private var actionEvent:InstallationEvent;
      
      private var _installation:Installation;
      
      private var myDevice:Skitter;
      
      public var skitterListEmpty:Array;
      
      private var _1867865432actuatorsList:ArrayCollection;
      
      private var _skitterSynchroniseList:Array;
      
      private var ioServiceLayerInitialised:Boolean;
      
      private var telecoWayType:String;
      
      private var _1159923167scenariosList:ArrayCollection;
      
      private var FFunctionToCallLater:Function;
      
      private var _1525605605devicesList:ArrayCollection;
      
      private var _getActuatorNameList:Array;
      
      private var _currentSkitterInSynchroniseProgress:Skitter = null;
      
      private var _skitterUpgradeSuccess:Boolean = false;
      
      private var _currentSkitterInUpgradeProgress:Skitter = null;
      
      public var repeatIdentifyActuator:Actuator;
      
      private var ioServiceLayer:IoServiceLayer;
      
      private var FTimerCallLater:Timer;
      
      public function ServerCommunicationManager()
      {
         this._1867865432actuatorsList = new ArrayCollection();
         this._1159923167scenariosList = new ArrayCollection();
         this._1525605605devicesList = new ArrayCollection();
         super();
         this.ioServiceLayer = IoServiceLayerImpl.instance;
         this.ioServiceLayerInitialised = false;
      }
      
      public static function get instance() : com.scenarioLauncher.business.ServerCommunicationManager
      {
         if(_instance == null)
         {
            _instance = new com.scenarioLauncher.business.ServerCommunicationManager();
         }
         return _instance;
      }
      
      private function pairEquipmentStimulatedBy1WControllerCallback(param1:Actuator) : void
      {
         KCTimeAnalyzer.Tracer("pairEquipmentStimulatedBy1WControllerCallback actuator.profile = " + param1.profile,50);
         this.discoveryNewPairedActuator = true;
         InstallationService.instance.addActuatorToCurrentInstallation(param1);
         this.getActuatorNameList.push(param1);
      }
      
      private function pairNewEquipmentErrorHandler(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("pairNewEquipmentErrorHandler",0);
         _instance.dispatchEvent(param1);
      }
      
      public function synchronizeSkitterAfterUpgrade(param1:Skitter, param2:Function, param3:Function) : void
      {
         KCTimeAnalyzer.Tracer("BEGIN synchronizeSkitterAfterUpgrade",50);
         this.ioServiceLayer.synchronizeSkitter(param1,param2,param3);
      }
      
      private function setActuatorNameCallback(param1:Actuator) : void
      {
         var _loc2_:ActuatorEvent = null;
         KCTimeAnalyzer.Tracer("setActuatorNameCallback",50);
         if(param1 != null)
         {
            _loc2_ = new ActuatorEvent(ActuatorEvent.RENAME_ACTUATOR);
            _loc2_.actuatorNewName = param1.name;
            DialogsManager.hideRadioInProgressPopup(_loc2_);
         }
      }
      
      private function upgradeDeviceErrorCallback(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("Error during Skitter Upgrade : " + param1.fault.faultCode);
         this._skitterUpgradeSuccess = false;
         var _loc2_:UpgradeEvent = new UpgradeEvent(UpgradeEvent.SKITTER_UPGRADE_FAILDED);
         dispatchEvent(_loc2_);
      }
      
      public function get skitterSynchroniseList() : Array
      {
         if(this._skitterSynchroniseList == null)
         {
            this._skitterSynchroniseList = new Array();
         }
         return this._skitterSynchroniseList;
      }
      
      [Bindable(event="propertyChange")]
      public function get devicesList() : ArrayCollection
      {
         return this._1525605605devicesList;
      }
      
      private function pairEquipmentSystemEndCallback() : void
      {
         KCTimeAnalyzer.Tracer("pairEquipmentSystemEndCallback",50);
         this.ioServiceLayer.pairNewEquipment(this.pairNewEquipmentCallback,this.newPairedBeaconCallback,this.pairNewEquipmentEndCallback,this.pairNewEquipmentErrorHandler);
      }
      
      private function cancelGiveKeyCallback() : void
      {
         KCTimeAnalyzer.Tracer("cancelGiveKeyCallback",50);
      }
      
      public function get currentSkitterInUpgradeProgress() : Skitter
      {
         return this._currentSkitterInUpgradeProgress;
      }
      
      public function getKeyFrom2WControllerSystem() : void
      {
         KCTimeAnalyzer.Tracer("START getKeyFrom2WControllerSystem",50);
         this.discoveryNewPairedActuator = false;
         this.ioServiceLayer.getKeyFrom2WController(this.newSystemKeyCallback,this.newSystemKeyErrorHandler);
         this.telecoWayType = "getKey2wSystem";
      }
      
      private function getActuatorPositionCallback(param1:Situation) : void
      {
         var _loc2_:ActuatorEvent = null;
         KCTimeAnalyzer.Tracer("getActuatorPositionCallback",50);
         _loc2_ = new ActuatorEvent(ActuatorEvent.POSITION_ACTUATOR);
         _loc2_.situation = param1;
         _loc2_.actuator = param1.actuator;
         _instance.dispatchEvent(_loc2_);
      }
      
      public function identifyActuator(param1:Actuator) : void
      {
         if(this.ioServiceLayerInitialised)
         {
            KCTimeAnalyzer.Tracer("BEGIN identifyActuator",50);
            this.ioServiceLayer.identifyActuator(param1,this.identifyActuatorCallback,this.identifyActuatorErrorHandler);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenariosList() : ArrayCollection
      {
         return this._1159923167scenariosList;
      }
      
      public function stopRepeatIndentifyActuator() : void
      {
         if(Boolean(this.FTimerCallLater) && this.FTimerCallLater.hasEventListener(TimerEvent.TIMER))
         {
            this.FTimerCallLater.removeEventListener(TimerEvent.TIMER,this.reallyCallFunctionLater);
         }
      }
      
      private function pairNewEquipmentCallback(param1:Actuator) : void
      {
         KCTimeAnalyzer.Tracer("pairNewEquipmentCallback actuator.profile = " + param1.profile,50);
         InstallationService.instance.addActuatorToCurrentInstallation(param1);
         this.discoveryNewPairedActuator = true;
         this.getActuatorNameList.push(param1);
      }
      
      public function set skitterSynchroniseList(param1:Array) : void
      {
         this._skitterSynchroniseList = param1;
      }
      
      public function get currentDevice() : Skitter
      {
         var _loc1_:Skitter = null;
         if(this.ioServiceLayer && this.ioServiceLayer.connectedDevices && this.ioServiceLayer.connectedDevices.length > 0)
         {
            _loc1_ = this.ioServiceLayer.connectedDevices[this.ioServiceLayer.connectedDevices.length - 1] as Skitter;
         }
         return _loc1_;
      }
      
      private function updateKeyCallback() : void
      {
         KCTimeAnalyzer.Tracer("updateKeyCallback",50);
         InstallationService.instance.synchroniseAllSkitterConnected();
         this.actionEvent = new InstallationEvent(InstallationEvent.UPDATE_KEY_SUCCESS);
      }
      
      private function resteSkitterErrorHandler(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("resteSkitterErrorHandler",50);
         _instance.dispatchEvent(param1);
      }
      
      private function newSystemKeyErrorHandler(param1:FaultEvent) : void
      {
         this.actionEvent = null;
         _instance.dispatchEvent(param1);
         this.telecoWayType = null;
         KCTimeAnalyzer.Tracer("newSystemKeyErrorHandler",0);
      }
      
      public function testScenario(param1:Scenario) : void
      {
         KCTimeAnalyzer.Tracer("BEGIN testScenario",50);
         this.ioServiceLayer.testScenario(param1,this.testScenarioCallback,this.testScenarioErrorHandler);
      }
      
      public function set devicesList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1525605605devicesList;
         if(_loc2_ !== param1)
         {
            this._1525605605devicesList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"devicesList",_loc2_,param1));
         }
      }
      
      public function set scenariosList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1159923167scenariosList;
         if(_loc2_ !== param1)
         {
            this._1159923167scenariosList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenariosList",_loc2_,param1));
         }
      }
      
      private function onConnectedDeviceHandler(param1:CollectionEvent) : void
      {
         var _loc2_:Skitter = null;
         var _loc3_:Fault = null;
         var _loc4_:FaultEvent = null;
         var _loc5_:UpgradeEvent = null;
         if(param1.items != null && param1.items.length > 0)
         {
            _loc2_ = param1.items[0] as Skitter;
         }
         if(param1.kind == CollectionEventKind.ADD)
         {
            if(_loc2_ != null)
            {
               InstallationService.instance.cleanInstallation(_loc2_);
               if(SkitterManager.instance.skitterConnectionAllowed || this.currentSkitterInUpgradeProgress && this.currentSkitterInUpgradeProgress.identifier == _loc2_.identifier)
               {
                  this.plugSkitter(_loc2_);
               }
               else
               {
                  SkitterManager.instance.addSkitterToPlug(_loc2_);
               }
            }
         }
         else if(param1.kind == CollectionEventKind.REMOVE)
         {
            if(this.currentSkitterInSynchroniseProgress != null)
            {
               _loc3_ = new Fault(ErrorCodes.ERROR_SYNCHRONISE_SKITTER,"","");
               _loc4_ = new FaultEvent(FaultEvent.FAULT,false,true,_loc3_);
               _instance.dispatchEvent(_loc4_);
            }
         }
         if(this.currentSkitterInUpgradeProgress && this._skitterUpgradeSuccess && _loc2_ && _loc2_.upgradeSuccess == 0)
         {
            _loc2_.upgradeSuccess = 1;
            _loc5_ = new UpgradeEvent(UpgradeEvent.SKITTER_SYNCHRONISE_AFTER_UPGRADE);
            _instance.dispatchEvent(_loc5_);
         }
         InstallationService.instance.refreshActivateDevice();
         if(true)
         {
            Application.application.mainUI.refreshScenario();
         }
         Application.application.mainUI.refreshInstallation();
      }
      
      public function isSkitterToUpgrade() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for each(_loc2_ in SkitterManager.instance.skitterList)
         {
            if(UpdaterManager.instance.isDeviceUpdateAvailable(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function synchronizeSkitter(param1:Skitter) : void
      {
         var _loc2_:Object = this.ifDeviceConnected(param1);
         if(this.ioServiceLayer.connectedDevices && param1 != null && Boolean(_loc2_.plugged))
         {
            KCTimeAnalyzer.Tracer("BEGIN synchronizeSkitter",50);
            this.ioServiceLayer.synchronizeSkitter(param1,this.synchronizeSkitterCallback,this.synchronizeSkitterErrorHandler);
         }
      }
      
      public function addSkitterListToInstallation(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            this.addSkitterToInstallation(_loc2_);
         }
      }
      
      private function newSystemKeyCallback(param1:Key2W) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         KCTimeAnalyzer.Tracer("newSystemKeyCallback + key :" + param1,50);
         if(param1 == null)
         {
            throw new Error("newSystemKeyCallback : KEY is NULL");
         }
         if(param1.currentKey == null)
         {
            throw new Error("newSystemKeyCallback : KEY.currentKey is NULL");
         }
         this._installation = InstallationService.instance.currentInstallation;
         if(this._installation)
         {
            InstallationService.instance.currentInstallation.key2W = param1;
            for each(_loc2_ in (this.connectedDevice[0] as Skitter).actuators)
            {
               for each(_loc3_ in this._installation.actuators)
               {
                  if(_loc2_.equals(_loc3_))
                  {
                     _loc3_.keyState = _loc2_.keyState;
                  }
               }
            }
            this.updateKeyCallback();
         }
      }
      
      public function plugSkitter(param1:Skitter) : void
      {
         var _loc2_:Boolean = true;
         if(param1 != null)
         {
            if(InstallationService.instance.isSkitEasyEmpty && !InstallationService.instance.isSkitterEmpty(param1))
            {
               DialogsManager.showSkitterSynchronise(param1);
            }
            else
            {
               if(param1.currentKey2W)
               {
                  InstallationService.instance.getInstallationByKey2W(param1.currentKey2W);
               }
               if(InstallationService.instance.currentInstallation)
               {
                  InstallationService.instance.adjustSkitterId(param1);
                  if(param1.currentKey2W)
                  {
                     if(!param1.currentKey2W.Compare(InstallationService.instance.currentInstallation.key2W))
                     {
                        if(param1.actuators.length == 0)
                        {
                           InstallationService.instance.applyInstallKeyToSkitter(param1);
                        }
                        else
                        {
                           _loc2_ = false;
                           DialogsManager.showSkitterReinitialisePopup(this.currentDevice,[]);
                        }
                     }
                     InstallationService.instance.checkSkitterKeyAndAddToInstallIfNoPresent(param1);
                     if(param1.currentKey2W.Compare(InstallationService.instance.currentInstallation.key2W) && InstallationService.instance.currentInstallation.actuators && InstallationService.instance.currentInstallation.actuators.length == 0)
                     {
                        Application.application.mainUI.mainUIHeader.selectBtnInstallation();
                     }
                  }
                  else
                  {
                     InstallationService.instance.currentInstallation.devices.addItem(param1);
                     if(Boolean(InstallationService.instance.currentInstallation.actuators) && InstallationService.instance.currentInstallation.actuators.length == 0)
                     {
                        Application.application.mainUI.mainUIHeader.selectBtnInstallation();
                     }
                  }
               }
               KCTimeAnalyzer.Tracer("Globals.SYNCHRO_LOCKED = undefined",0);
               if(_loc2_ && true && this.currentSkitterInSynchroniseProgress == null)
               {
                  InstallationService.instance.updateDataModel(param1,true);
               }
               this.checkUpdate(new ArrayCollection([param1]));
            }
         }
         if(true)
         {
            InstallationService.instance.refreshActivateDevice();
            Application.application.mainUI.refreshScenario();
         }
         Application.application.mainUI.refreshInstallation();
      }
      
      public function get getActuatorNameList() : Array
      {
         if(this._getActuatorNameList == null)
         {
            this._getActuatorNameList = new Array();
         }
         return this._getActuatorNameList;
      }
      
      public function get currentSkitterInSynchroniseProgress() : Skitter
      {
         return this._currentSkitterInSynchroniseProgress;
      }
      
      private function pairEquipmentStimulatedBy1WControllerErrorHandler(param1:FaultEvent) : void
      {
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("END DISCOVER pairEquipmentStimulatedBy1WControllerErrorHandler",0);
      }
      
      private function pairNewEquipmentEndCallback() : void
      {
         KCTimeAnalyzer.Tracer("END DISCOVER pairNewEquipmentEndCallback",50);
         if(this.discoveryNewPairedActuator)
         {
            this.actionEvent = new InstallationEvent(InstallationEvent.DISCOVERY_END);
         }
         else
         {
            this.actionEvent = new InstallationEvent(InstallationEvent.DISCOVERY_FAILURE);
         }
         InstallationService.instance.updateDataModel(this.currentDevice);
      }
      
      private function giveKeyToAnother2WControllerCallback() : void
      {
         var _loc1_:InstallationEvent = null;
         KCTimeAnalyzer.Tracer("giveKeyToAnother2WControllerCallback",50);
         _loc1_ = new InstallationEvent(InstallationEvent.GIVE_KEY_SUCCESS);
         _instance.dispatchEvent(_loc1_);
      }
      
      private function setActuatorNameErrorCallback(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("setActuatorName Error Callback",0);
         DialogsManager.errorRadioInProgressPopup(param1);
      }
      
      private function reallyCallFunctionLater(param1:TimerEvent) : void
      {
         this.FTimerCallLater.stop();
         this.FFunctionToCallLater(this.repeatIdentifyActuator);
      }
      
      public function resetSkitter(param1:Skitter) : void
      {
         KCTimeAnalyzer.Tracer("BEGIN resetSkitter",50);
         this.ioServiceLayer.resetSkitter(param1,this.resetSkitterCallback,this.resteSkitterErrorHandler);
      }
      
      private function upgradeDeviceEndCallback(param1:* = null) : void
      {
         KCTimeAnalyzer.Tracer("Skitter Upgraded successfuly");
         this._skitterUpgradeSuccess = true;
         var _loc2_:UpgradeEvent = new UpgradeEvent(UpgradeEvent.SKITTER_UPGRADE_SUCCESSFULL);
         dispatchEvent(_loc2_);
      }
      
      public function generateNewKey(param1:String) : void
      {
         KCTimeAnalyzer.Tracer("generateNewKey",50);
         this.telecoWayType = param1;
         this.ioServiceLayer.generateNewKey(this.generateNewKeyCallback,this.generateNewKeyErrorHandler);
      }
      
      public function ifDeviceConnected(param1:Skitter) : Object
      {
         var _loc3_:* = null;
         var _loc2_:* = {
            "skit":null,
            "plugged":false
         };
         if(this.ioServiceLayer.connectedDevices != null && param1 != null)
         {
            for each(_loc3_ in this.ioServiceLayer.connectedDevices)
            {
               if(_loc3_.identifier == param1.identifier)
               {
                  _loc2_.plugged = true;
                  _loc2_.skit = param1;
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public function get actuatorsList() : ArrayCollection
      {
         return this._1867865432actuatorsList;
      }
      
      public function startConnectedDevicesListen() : void
      {
         if(!this.ioServiceLayer.connectedDevices.hasEventListener(CollectionEvent.COLLECTION_CHANGE))
         {
            this.ioServiceLayer.connectedDevices.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onConnectedDeviceHandler);
         }
         this.connectedDeviceToUpdate = new ArrayCollection(this.connectedDevice.toArray());
         if(this.connectedDeviceToUpdate.length > 0)
         {
            this.checkUpdate(this.connectedDeviceToUpdate);
         }
         else
         {
            InstallationService.instance.saveCurrentInstallation();
         }
      }
      
      private function testScenarioErrorHandler(param1:FaultEvent) : void
      {
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("testScenarioErrorHandler",0);
      }
      
      private function pairEquipmentSystemCallback(param1:Actuator) : void
      {
         KCTimeAnalyzer.Tracer("pairEquipmentSystemCallback actuator.profile = " + param1.profile,50);
         InstallationService.instance.addActuatorToCurrentInstallation(param1);
         this.discoveryNewPairedActuator = true;
         this.getActuatorNameList.push(param1);
      }
      
      private function identifyActuatorCallback(param1:Actuator) : void
      {
         var _loc2_:ActuatorEvent = null;
         KCTimeAnalyzer.Tracer("identifyActuatorCallback",50);
         _loc2_ = new ActuatorEvent(ActuatorEvent.IDENTIFY_ACTUATOR);
         _loc2_.actuator = param1;
         _instance.dispatchEvent(_loc2_);
         if(this.repeatIdentifyActuator != null)
         {
            this.callFunctionLater(this.identifyActuator);
         }
      }
      
      private function synchronizeSkitterErrorHandler(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("synchronizeSkitterErrorHandler",50);
         if(this.skitterSynchroniseList.length > 0)
         {
            this.synchronizeSkitter(this.skitterSynchroniseList.pop());
         }
         else
         {
            _instance.dispatchEvent(param1);
         }
      }
      
      private function sortCompareSkitterMasterFunction(param1:Object, param2:Object, param3:Array = null) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null && param2 == null)
         {
            return 0;
         }
         if(param2 == null)
         {
            return -1;
         }
         if(param1 == null)
         {
            return 1;
         }
         _loc4_ = (param1 as Skitter).actuators.length;
         _loc5_ = (param2 as Skitter).actuators.length;
         if(_loc4_ > _loc5_)
         {
            return 1;
         }
         if(_loc4_ < _loc5_)
         {
            return -1;
         }
         return 0;
      }
      
      private function addSkitterToInstallation(param1:Skitter) : Boolean
      {
         var _loc2_:Boolean = false;
         _loc2_ = false;
         if(param1.currentKey2W)
         {
            if(!InstallationService.instance.findSkitterInInstallationByIdentifier(param1))
            {
               if(InstallationService.instance.isSkitterEmpty(param1) || param1.currentKey2W.Compare(InstallationService.instance.currentInstallation.key2W))
               {
                  if(InstallationService.instance.currentInstallation != null && InstallationService.instance.currentInstallation.key2W != null)
                  {
                     InstallationService.instance.applyInstallKeyToSkitter(param1);
                  }
                  else
                  {
                     InstallationService.instance.getInstallationByKey2W(param1.currentKey2W);
                  }
                  InstallationService.instance.currentInstallation.devices.addItem(param1);
                  _loc2_ = true;
               }
            }
            else
            {
               InstallationService.instance.adjustSkitterId(param1);
               if(param1.currentKey2W.Compare(InstallationService.instance.currentInstallation.key2W))
               {
                  _loc2_ = true;
               }
               else
               {
                  _loc2_ = false;
               }
            }
         }
         else
         {
            InstallationService.instance.currentInstallation.devices.addItem(param1);
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function getActuatorName(param1:Actuator) : void
      {
         KCTimeAnalyzer.Tracer("call getActuatorName : old name = " + param1.name,50);
         this.ioServiceLayer.getActuatorName(param1,this.getActuatorNameCallback,this.getActuatorNameErrorHandler);
      }
      
      public function upgradeDevice(param1:Skitter) : void
      {
         this._skitterUpgradeSuccess = false;
         param1.upgradeSuccess = 0;
         var _loc2_:File = UpdaterManager.instance.getFirmwareFile(param1);
         this.ioServiceLayer.upgradeSkitter(param1,_loc2_.nativePath,this.upgradeDeviceEndCallback,this.upgradeDeviceProgression,this.upgradeDeviceErrorCallback);
      }
      
      public function pairEquipmentStimulatedBy1WController() : void
      {
         KCTimeAnalyzer.Tracer("pairEquipmentStimulatedBy1WController",50);
         this.discoveryNewPairedActuator = false;
         this.ioServiceLayer.pairEquipmentStimulatedBy1WController(this.pairEquipmentStimulatedBy1WControllerCallback,this.pairEquipmentStimulatedBy1WControllerEndCallback,this.pairEquipmentStimulatedBy1WControllerErrorHandler);
      }
      
      public function synchronizeSkitterInConfiguration(param1:Skitter) : void
      {
         var _loc2_:Object = this.ifDeviceConnected(param1);
         if(this.ioServiceLayer.connectedDevices && param1 != null && Boolean(_loc2_.plugged))
         {
            KCTimeAnalyzer.Tracer("BEGIN synchronizeSkitterInConfiguration",50);
            this.synchronizeSkitter(param1);
         }
      }
      
      private function pairEquipmentStimulatedBy1WControllerEndCallback() : void
      {
         var _loc1_:InstallationEvent = null;
         KCTimeAnalyzer.Tracer("pairEquipmentStimulatedBy1WControllerEndCallback",50);
         if(this.discoveryNewPairedActuator)
         {
            _loc1_ = new InstallationEvent(InstallationEvent.DISCOVERY_END);
         }
         else
         {
            _loc1_ = new InstallationEvent(InstallationEvent.DISCOVERY_FAILURE);
         }
         _instance.dispatchEvent(_loc1_);
         InstallationService.instance.updateDataModel(this.currentDevice);
      }
      
      private function testScenarioCallback() : void
      {
         var _loc1_:InstallationEvent = null;
         KCTimeAnalyzer.Tracer("testScenarioCallback",50);
         _loc1_ = new InstallationEvent(InstallationEvent.TEST_SCENARIO);
         _instance.dispatchEvent(_loc1_);
      }
      
      public function pairEquipmentInSystem() : void
      {
         KCTimeAnalyzer.Tracer("pairEquipmentInSystem",50);
         this.ioServiceLayer.pairEquipmentInSystem(this.pairEquipmentSystemCallback,this.newPairedBeaconCallback,this.pairEquipmentSystemEndCallback,this.pairEquipmentSystemErrorHandler);
      }
      
      public function set getActuatorNameList(param1:Array) : void
      {
         this._getActuatorNameList = param1;
      }
      
      private function synchronizeSkitterCallback() : void
      {
         var _loc1_:InstallationEvent = null;
         DialogsManager.hideSynchronizeInProgressPopup();
         KCTimeAnalyzer.Tracer("synchronizeSkitterCallback",50);
         _loc1_ = new InstallationEvent(InstallationEvent.SKITTER_SYNCHRONISED);
         _instance.dispatchEvent(_loc1_);
         if(this.skitterSynchroniseList.length > 0)
         {
            this.synchronizeSkitter(this.skitterSynchroniseList.pop());
         }
         else
         {
            if(this.getActuatorNameList.length > 0)
            {
               InstallationService.instance.updateActuatorName();
            }
            if(this.telecoWayType == "1w")
            {
               this.pairEquipmentStimulatedBy1WController();
            }
            else if(this.telecoWayType == "2w")
            {
               this.pairNewEquipment();
            }
            else if(this.telecoWayType == "getKey2w")
            {
               this.pairEquipmentInSystem();
            }
            this.telecoWayType = null;
            if(this.actionEvent != null)
            {
               _instance.dispatchEvent(this.actionEvent);
               this.actionEvent = null;
            }
            SkitterManager.instance.connectionProcessing();
         }
      }
      
      public function cancelGiveKey() : void
      {
         KCTimeAnalyzer.Tracer("cancelGiveKey",50);
         this.ioServiceLayer.cancelGiveKey(this.cancelGiveKeyCallback,this.cancelGiveKeyErrorHandler);
      }
      
      public function setActuatorName(param1:Actuator, param2:String) : void
      {
         KCTimeAnalyzer.Tracer("setActuatorName...",50);
         this.ioServiceLayer.setActuatorName(param1,param2,this.setActuatorNameCallback,this.setActuatorNameErrorCallback);
      }
      
      private function generateNewKeyErrorHandler(param1:FaultEvent) : void
      {
         this.actionEvent = null;
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("generateNewKeyErrorHandler",50);
      }
      
      public function set actuatorsList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1867865432actuatorsList;
         if(_loc2_ !== param1)
         {
            this._1867865432actuatorsList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuatorsList",_loc2_,param1));
         }
      }
      
      public function getActuatorPosition(param1:Actuator) : void
      {
         KCTimeAnalyzer.Tracer("BEGIN getActuatorPosition",50);
         this.ioServiceLayer.getActuatorPosition(param1,this.getActuatorPositionCallback,this.getActuatorPositionErrorHandler);
      }
      
      public function set currentSkitterInSynchroniseProgress(param1:Skitter) : void
      {
         this._currentSkitterInSynchroniseProgress = param1;
      }
      
      private function parseSkitterConnected(param1:Skitter) : void
      {
         var _loc2_:* = null;
         KCTimeAnalyzer.Tracer("--------------- SKITTER CONNECTED PARSING DATA ---------------",0);
         KCTimeAnalyzer.Tracer("\tname = " + param1.name,10);
         KCTimeAnalyzer.Tracer("\tvirtualComPort = " + param1.virtualComPort,10);
         KCTimeAnalyzer.Tracer("\tioAddress = " + param1.ioAddress,10);
         KCTimeAnalyzer.Tracer("\tidentifier = " + param1.identifier,10);
         KCTimeAnalyzer.Tracer("\tnb actuator = " + param1.actuators.length,10);
         trace("");
         if(param1.ScenarioOnButton1)
         {
            KCTimeAnalyzer.Tracer("\tscenario 1",10);
            KCTimeAnalyzer.Tracer("\tnb situation = " + param1.ScenarioOnButton1.situations.length + "\n",10);
            for each(_loc2_ in param1.ScenarioOnButton1.situations)
            {
               KCTimeAnalyzer.Tracer("---------- SITUATION ----------",10);
               KCTimeAnalyzer.Tracer("situation.actuator.name = " + _loc2_.actuator.name,10);
               KCTimeAnalyzer.Tracer("situation.position = (" + _loc2_.degreeByNum(1) + "," + _loc2_.degreeByNum(2) + "," + _loc2_.degreeByNum(3) + ")",10);
               KCTimeAnalyzer.Tracer("--------------------\n",10);
            }
         }
         else
         {
            KCTimeAnalyzer.Tracer("----> pas de scenario 1 detecté",10);
         }
         if(param1.ScenarioOnButton2)
         {
            KCTimeAnalyzer.Tracer("\tscenario 2",10);
            KCTimeAnalyzer.Tracer("\tnb situation = " + param1.ScenarioOnButton2.situations.length + "\n",10);
            for each(_loc2_ in param1.ScenarioOnButton2.situations)
            {
               KCTimeAnalyzer.Tracer("---------- SITUATION ----------",10);
               KCTimeAnalyzer.Tracer("situation.actuator.name = " + _loc2_.actuator.name,10);
               KCTimeAnalyzer.Tracer("situation.position = (" + _loc2_.degreeByNum(1) + "," + _loc2_.degreeByNum(2) + "," + _loc2_.degreeByNum(3) + ")",10);
               KCTimeAnalyzer.Tracer("--------------------\n",10);
            }
         }
         else
         {
            KCTimeAnalyzer.Tracer("----> pas de scenario 2 detecté",10);
         }
         KCTimeAnalyzer.Tracer("--------------- END PARSING DATA---------------",0);
      }
      
      public function get connectedDevice() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         if(Boolean(this.ioServiceLayer) && Boolean(this.ioServiceLayer.connectedDevices))
         {
            _loc1_ = this.ioServiceLayer.connectedDevices;
         }
         return _loc1_;
      }
      
      private function newPairedBeaconCallback(param1:Beacon) : void
      {
         KCTimeAnalyzer.Tracer("newPairedBeaconCallback : beacon = " + param1,0);
         InstallationService.instance.addBeaconToCurrentInstallation(param1);
      }
      
      public function pairNewEquipment() : void
      {
         KCTimeAnalyzer.Tracer("pairNewEquipment",50);
         this.ioServiceLayer.pairNewEquipment(this.pairNewEquipmentCallback,this.newPairedBeaconCallback,this.pairNewEquipmentEndCallback,this.pairNewEquipmentErrorHandler);
      }
      
      private function upgradeDeviceProgression(param1:int = -1) : void
      {
         var _loc2_:UpgradeEvent = new UpgradeEvent(UpgradeEvent.SKITTER_UPGRADE_PROGRESS);
         _loc2_.progression = param1;
         dispatchEvent(_loc2_);
         KCTimeAnalyzer.Tracer("Skitter upgrade : " + param1 + "%");
      }
      
      public function startRepeatIndentifyActuator() : void
      {
         if(Boolean(this.FTimerCallLater) && !this.FTimerCallLater.hasEventListener(TimerEvent.TIMER))
         {
            this.FTimerCallLater.addEventListener(TimerEvent.TIMER,this.reallyCallFunctionLater);
         }
      }
      
      private function giveKeyErrorHandler(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("giveKeyErrorHandler",50);
         _instance.dispatchEvent(param1);
      }
      
      public function getKeyFrom2WController() : void
      {
         KCTimeAnalyzer.Tracer("START getKeyFrom2WController",50);
         this.discoveryNewPairedActuator = false;
         this.ioServiceLayer.getKeyFrom2WController(this.newSystemKeyCallback,this.newSystemKeyErrorHandler);
         this.telecoWayType = "getKey2w";
      }
      
      public function callFunctionLater(param1:Function) : void
      {
         if(this.FTimerCallLater)
         {
            this.FFunctionToCallLater = param1;
            this.FTimerCallLater.reset();
            this.FTimerCallLater.start();
         }
      }
      
      private function generateNewKeyCallback(param1:Key2W) : void
      {
         KCTimeAnalyzer.Tracer("generateNewKeyCallback : key = " + param1,50);
         this.newSystemKeyCallback(param1);
      }
      
      private function resetSkitterCallback(param1:Skitter) : void
      {
         var _loc2_:InstallationEvent = null;
         KCTimeAnalyzer.Tracer("resetSkitterCallback",50);
         InstallationService.instance.adjustSkitterId(param1);
         InstallationService.instance.cleanSkitter(param1);
         _loc2_ = new InstallationEvent(InstallationEvent.SKITTER_REINITIALISED);
         _instance.dispatchEvent(_loc2_);
         if(!InstallationService.instance.findSkitterInInstallationByIdentifier(param1))
         {
            param1.currentKey2W = new Key2W();
            InstallationService.instance.applyInstallKeyToSkitter(param1);
            InstallationService.instance.currentInstallation.devices.addItem(param1);
            InstallationService.instance.refreshActivateDevice();
         }
         InstallationService.instance.saveCurrentInstallation();
      }
      
      private function getActuatorNameErrorHandler(param1:FaultEvent) : void
      {
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("getActuatorNameErrorHandler",0);
         if(this._getActuatorNameList.length > 0)
         {
            this.getActuatorName(this._getActuatorNameList.pop());
         }
         else
         {
            KCTimeAnalyzer.Tracer("getActuatorNameErrorHandler : process getActuatorName finished",0);
            InstallationService.instance.synchroniseAllSkitterConnected();
         }
      }
      
      public function updateKey() : void
      {
         KCTimeAnalyzer.Tracer("updateKey",50);
         this.updateKeyCallback();
      }
      
      public function startIoServiceLayer() : void
      {
         UpdaterManager.instance.ioServiceStarted = true;
         this.ioServiceLayer.start(this.initialisationCallBack);
      }
      
      private function pairEquipmentSystemErrorHandler(param1:FaultEvent) : void
      {
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("pairEquipmentSystemErrorHandler",0);
      }
      
      public function getDeviceIndex(param1:Skitter) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         for each(_loc3_ in this.devicesList)
         {
            if(_loc3_.identifier == param1.identifier)
            {
               _loc2_ = this.devicesList.getItemIndex(_loc3_);
               break;
            }
         }
         return _loc2_;
      }
      
      private function identifyActuatorErrorHandler(param1:FaultEvent) : void
      {
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("identifyActuatorErrorHandler",0);
         if(this.repeatIdentifyActuator != null)
         {
            this.callFunctionLater(this.identifyActuator);
         }
      }
      
      public function updateSkitEasyWithSkitterList(param1:Skitter, param2:Array = null) : void
      {
         var _loc3_:Boolean = true;
         if(param1.currentKey2W)
         {
            if(!InstallationService.instance.findSkitterInInstallationByIdentifier(param1) && param1.currentKey2W.Compare(InstallationService.instance.currentInstallation.key2W))
            {
               InstallationService.instance.currentInstallation.devices.addItem(param1);
               if(Boolean(InstallationService.instance.currentInstallation.actuators) && InstallationService.instance.currentInstallation.actuators.length == 0)
               {
                  Application.application.mainUI.mainUIHeader.selectBtnInstallation();
               }
            }
            if(!param1.currentKey2W.Compare(InstallationService.instance.currentInstallation.key2W))
            {
               _loc3_ = false;
               DialogsManager.showSkitterReinitialisePopup(param1,null,null,param2);
            }
         }
         else
         {
            InstallationService.instance.currentInstallation.devices.addItem(param1);
            if(Boolean(InstallationService.instance.currentInstallation.actuators) && InstallationService.instance.currentInstallation.actuators.length == 0)
            {
               Application.application.mainUI.mainUIHeader.selectBtnInstallation();
            }
         }
         if(_loc3_ && true)
         {
            InstallationService.instance.updateDataModel(param1);
            if(param2 != null)
            {
               if(param2.length == 1)
               {
                  DialogsManager.showSkitterReinitialisePopup(param2.pop());
               }
               else if(param2.length > 1)
               {
                  DialogsManager.showSkitterReinitialisePopup(param2.pop(),null,null,param2);
               }
            }
         }
      }
      
      private function initialisationCallBack() : void
      {
         var _loc1_:Skitter = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Sort = null;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:Array = null;
         KCTimeAnalyzer.Tracer("initialisationCallBack",0);
         InstallationService.instance.traceInstallation();
         this.ioServiceLayerInitialised = true;
         if(InstallationService.instance.currentInstallation == null)
         {
            InstallationService.instance.currentInstallation = new Installation();
         }
         if(InstallationService.instance.isSkitEasyEmpty)
         {
            (_loc4_ = new Sort()).compareFunction = this.sortCompareSkitterMasterFunction;
            this.ioServiceLayer.connectedDevices.sort = _loc4_;
            this.ioServiceLayer.connectedDevices.refresh();
            _loc2_ = this.ioServiceLayer.connectedDevices.toArray();
            this.skitterListEmpty = new Array();
            _loc3_ = int(_loc2_.length);
            _loc5_ = _loc3_;
            while(_loc5_ > 0)
            {
               _loc1_ = _loc2_[_loc5_ - 1];
               if(InstallationService.instance.isSkitterEmpty(_loc1_))
               {
                  this.skitterListEmpty.push(_loc1_);
                  _loc2_.splice(_loc5_ - 1,1);
               }
               _loc5_--;
            }
            if(_loc2_.length == 1)
            {
               DialogsManager.showSkitterSynchronise(_loc2_.pop());
            }
            else if(_loc2_.length > 1)
            {
               DialogsManager.showSkitterSynchronise(_loc2_.pop(),_loc2_);
            }
            else
            {
               if(this.skitterListEmpty != null && this.skitterListEmpty.length > 0)
               {
                  this.addSkitterListToInstallation(this.skitterListEmpty);
               }
               this.startConnectedDevicesListen();
            }
         }
         else
         {
            _loc7_ = new Array();
            for each(_loc1_ in this.ioServiceLayer.connectedDevices)
            {
               InstallationService.instance.cleanInstallation(_loc1_);
               if(!(_loc6_ = this.addSkitterToInstallation(_loc1_)))
               {
                  if(_loc1_.actuators.length == 0)
                  {
                     InstallationService.instance.applyInstallKeyToSkitter(_loc1_);
                     InstallationService.instance.checkSkitterKeyAndAddToInstallIfNoPresent(_loc1_);
                  }
                  else
                  {
                     _loc7_.push(_loc1_);
                  }
               }
            }
            if(_loc7_.length == 1)
            {
               DialogsManager.showSkitterReinitialisePopup(_loc7_.pop(),[]);
            }
            else if(_loc7_.length > 1)
            {
               DialogsManager.showSkitterReinitialisePopup(_loc7_.pop(),_loc7_);
            }
            else
            {
               for each(_loc1_ in this.ioServiceLayer.connectedDevices)
               {
                  InstallationService.instance.updateSkitter(_loc1_);
               }
               InstallationService.instance.synchroniseAllSkitterConnected(true);
               this.startConnectedDevicesListen();
            }
         }
         InstallationService.instance.refreshActivateDevice();
         Application.application.mainUI.refreshInstallation();
         this.FTimerCallLater = new Timer(Globals.DELAY_ACTUATOR_IDENTIFY);
      }
      
      private function cancelGiveKeyErrorHandler(param1:FaultEvent) : void
      {
         KCTimeAnalyzer.Tracer("cancelGiveKeyErrorHandler",50);
         _instance.dispatchEvent(param1);
      }
      
      public function checkUpdate(param1:ArrayCollection) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            if(UpdaterManager.instance.isDeviceUpdateAvailable(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
         }
         if(_loc2_.length > 0)
         {
            DialogsManager.showSkitterUpgradePopup(_loc2_);
         }
      }
      
      private function getActuatorPositionErrorHandler(param1:FaultEvent) : void
      {
         _instance.dispatchEvent(param1);
         KCTimeAnalyzer.Tracer("getActuatorPositionErrorHandler",0);
      }
      
      public function giveKeyToAnother2WController() : void
      {
         KCTimeAnalyzer.Tracer("giveKeyToAnother2WController",50);
         this.ioServiceLayer.giveKeyToAnother2WController(this.giveKeyToAnother2WControllerCallback,this.giveKeyErrorHandler);
      }
      
      public function get masterSkitter() : Skitter
      {
         var _loc2_:* = null;
         var _loc1_:Skitter = null;
         for each(_loc2_ in this.ioServiceLayer.connectedDevices)
         {
            if(Boolean(_loc2_.currentKey2W) && _loc2_.actuators.length > 0)
            {
               _loc1_ = _loc2_;
               break;
            }
         }
         return _loc1_;
      }
      
      public function set currentSkitterInUpgradeProgress(param1:Skitter) : void
      {
         this._currentSkitterInUpgradeProgress = param1;
      }
      
      private function getActuatorNameCallback(param1:Actuator, param2:String) : void
      {
         KCTimeAnalyzer.Tracer("\tgetActuatorNameCallback new name = " + param2,50);
         InstallationService.instance.refreshActuatorName(param1,param2);
         if(this._getActuatorNameList.length > 0)
         {
            this.getActuatorName(this._getActuatorNameList.pop());
         }
         else
         {
            KCTimeAnalyzer.Tracer("process getActuatorName finished",0);
            InstallationService.instance.synchroniseAllSkitterConnected();
         }
      }
   }
}
