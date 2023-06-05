package com.scenarioLauncher.services
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.managers.DialogsManager;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.persistence.GenericDAO;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.filesystem.File;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Beacon;
   import ioService.datamodel.Installation;
   import ioService.datamodel.Key2W;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Situation;
   import ioService.datamodel.Skitter;
   import mx.collections.ArrayCollection;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import nz.co.codec.flexorm.EntityManager;
   
   public class InstallationService implements IEventDispatcher
   {
      
      private static var _instance:com.scenarioLauncher.services.InstallationService = new com.scenarioLauncher.services.InstallationService();
       
      
      private var _installations:ArrayCollection;
      
      private var _actuatorNameTotalCount:int;
      
      private var _currentInstallation:Installation;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _actuatorNameCount:int;
      
      private var needSynchroniseSkitter:Boolean;
      
      public function InstallationService()
      {
         this._installations = new ArrayCollection();
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public static function get instance() : com.scenarioLauncher.services.InstallationService
      {
         return _instance;
      }
      
      public function get installations() : ArrayCollection
      {
         return this._installations;
      }
      
      public function deleteCustomScenariosImageFiles() : void
      {
         var _loc1_:File = new File(File.applicationStorageDirectory.nativePath + "/scenario_images");
         if(Boolean(_loc1_.isDirectory) && Boolean(_loc1_.exists))
         {
            _loc1_.deleteDirectory(true);
         }
      }
      
      public function deleteInstallation(param1:Installation) : void
      {
         var _loc2_:GenericDAO = new GenericDAO(Installation,EntityManager.getInstance());
         _loc2_.remove(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function updateActuatorName() : void
      {
         var _loc1_:* = null;
         KCTimeAnalyzer.Tracer("-- > BEGIN process update all ActuatorName",0);
         KCTimeAnalyzer.Tracer("-- > number of new actuator to be named = " + ServerCommunicationManager.instance.getActuatorNameList.length,100);
         this._actuatorNameCount = 0;
         if(ServerCommunicationManager.instance.getActuatorNameList.length > 0)
         {
            ServerCommunicationManager.instance.getActuatorName(ServerCommunicationManager.instance.getActuatorNameList.pop());
         }
      }
      
      public function checkSkitterKeyAndAddToInstallIfNoPresent(param1:Skitter) : void
      {
         var _loc2_:int = 0;
         if(param1.currentKey2W.Compare(this.currentInstallation.key2W))
         {
            if(!this.findSkitterInInstallationByIdentifier(param1))
            {
               this.currentInstallation.devices.addItem(param1);
            }
            else if(ServerCommunicationManager.instance.currentSkitterInUpgradeProgress == null)
            {
               _loc2_ = ServerCommunicationManager.instance.getDeviceIndex(param1);
               if(_loc2_ > -1)
               {
                  ServerCommunicationManager.instance.devicesList.setItemAt(param1,_loc2_);
               }
            }
         }
      }
      
      public function applyInstallKeyToSkitter(param1:Skitter) : void
      {
         if(param1.currentKey2W != null)
         {
            if(this._currentInstallation.key2W != null && !param1.currentKey2W.Compare(this._currentInstallation.key2W))
            {
               param1.currentKey2W.oldKey = this._currentInstallation.key2W.oldKey;
               param1.currentKey2W.currentKey = this._currentInstallation.key2W.currentKey;
            }
         }
         else
         {
            param1.currentKey2W = new Key2W();
            if(this._currentInstallation.key2W != null)
            {
               param1.currentKey2W.oldKey = this._currentInstallation.key2W.oldKey;
               param1.currentKey2W.currentKey = this._currentInstallation.key2W.currentKey;
            }
         }
      }
      
      public function addBeaconToCurrentInstallation(param1:Beacon) : void
      {
         if(!this.findBeaconInInstallationById(param1))
         {
            this.currentInstallation.repeaters.addItem(param1);
         }
      }
      
      public function saveCurrentInstallation() : void
      {
         KCTimeAnalyzer.Tracer("\tsaveCurrentInstallation",0);
         if(this._currentInstallation.key2W == null)
         {
            trace("saveCurrentInstallation : key2W is NULL");
         }
         else if(this._currentInstallation.key2W.currentKey == null)
         {
            trace("saveCurrentInstallation : currentKey is NULL");
         }
         else if(this._currentInstallation.key2W.currentKey == "")
         {
            trace("saveCurrentInstallation : currentKey is \'\' ");
         }
         this.saveInstallation(this._currentInstallation);
      }
      
      public function connectedAndActivatedDevice() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         for each(_loc2_ in ServerCommunicationManager.instance.devicesList)
         {
            if(_loc2_.active)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function desactivateSkitters() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in ServerCommunicationManager.instance.connectedDevice)
         {
            _loc1_.desactivate = true;
         }
      }
      
      public function getInstallationByKey2W(param1:Key2W) : Installation
      {
         if(this.currentInstallation == null)
         {
            this.currentInstallation = new Installation();
            if(param1 != null)
            {
               this.currentInstallation.key2W = param1.clone();
            }
            else if(this.isSkitEasyEmpty)
            {
               if(param1 != null)
               {
                  this.currentInstallation.key2W = param1.clone();
               }
            }
            if(param1 == null)
            {
               trace("############## E R R O R ################ no Installation : getInstallationByKey2W : key2W is NULL");
            }
            else if(param1.currentKey == null)
            {
               trace("############## E R R O R ################ no Installation : getInstallationByKey2W : key2W.currentKey is NULL");
            }
         }
         else
         {
            if(this.currentInstallation.key2W == null)
            {
               if(param1 != null)
               {
                  this.currentInstallation.key2W = param1.clone();
               }
            }
            else if(this.isSkitEasyEmpty)
            {
               if(param1 != null)
               {
                  this.currentInstallation.key2W = param1.clone();
               }
            }
            if(param1 == null)
            {
               trace("############## E R R O R ################ getInstallationByKey2W : key2W is NULL");
            }
            else if(param1.currentKey == null)
            {
               trace("############## E R R O R ################ getInstallationByKey2W : key2W.currentKey is NULL");
            }
         }
         this._currentInstallation = this.currentInstallation;
         return this.currentInstallation;
      }
      
      public function get isSkitEasyEmpty() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.currentInstallation == null)
         {
            _loc1_ = true;
         }
         else if(this.currentInstallation.key2W == null)
         {
            _loc1_ = true;
         }
         else if(this.currentInstallation.key2W.currentKey == null || this.currentInstallation.key2W.currentKey == "")
         {
            _loc1_ = true;
         }
         else if(this.currentInstallation != null && this.currentInstallation.actuators != null && this.currentInstallation.scenarios != null)
         {
            if(this.currentInstallation.actuators.length == 0 && this.currentInstallation.scenarios.length == 0)
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      public function refreshActuatorName(param1:Actuator, param2:String) : void
      {
         var _loc3_:* = null;
         if(ServerCommunicationManager.instance.currentDevice)
         {
            for each(_loc3_ in ServerCommunicationManager.instance.currentDevice.actuators)
            {
               if(_loc3_.equals(param1))
               {
                  ++this._actuatorNameCount;
                  _loc3_.name = param2;
                  KCTimeAnalyzer.Tracer("\trefreshActuatorName : " + _loc3_.name + " ioAdress = " + _loc3_.ioAddress + " nb = " + this._actuatorNameCount,100);
                  break;
               }
            }
         }
      }
      
      private function findActuatorInSkitterById(param1:Actuator, param2:Skitter) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         _loc3_ = false;
         for each(_loc4_ in param2.actuators)
         {
            if(_loc4_.ioAddress == param1.ioAddress)
            {
               _loc3_ = true;
               break;
            }
         }
         return _loc3_;
      }
      
      private function updateSkittersKey() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._currentInstallation.devices)
         {
            this.applyInstallKeyToSkitter(_loc1_);
         }
      }
      
      public function deleteAllInstallations() : void
      {
         var _loc1_:GenericDAO = new GenericDAO(Installation,EntityManager.getInstance());
      }
      
      public function findSkitterInInstallationByIdentifier(param1:Skitter) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         _loc2_ = false;
         for each(_loc3_ in this._currentInstallation.devices)
         {
            if(_loc3_.identifier == param1.identifier)
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      public function is2WKeyExits() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         _loc1_ = false;
         for each(_loc2_ in ServerCommunicationManager.instance.connectedDevice)
         {
            if(_loc2_.currentKey2W != null)
            {
               _loc1_ = true;
               break;
            }
         }
         return _loc1_;
      }
      
      public function hasConnectedAndActivatedDevice() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:Boolean = false;
         for each(_loc2_ in ServerCommunicationManager.instance.devicesList)
         {
            if(_loc2_.active)
            {
               _loc1_ = true;
               break;
            }
         }
         return _loc1_;
      }
      
      public function adjustSkitterId(param1:Skitter) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for each(_loc2_ in this._currentInstallation.devices)
         {
            if(_loc2_.identifier == param1.identifier)
            {
               KCTimeAnalyzer.Tracer("[adjustSkitterId] : change skitter id : " + param1.id + " to " + _loc2_.id,0);
               param1.id = _loc2_.id;
               break;
            }
         }
         for each(_loc3_ in param1.actuators)
         {
            if(_loc3_.id == 0)
            {
               this.adjustActuatorId(_loc3_);
            }
         }
         for each(_loc4_ in param1.repeaters)
         {
            if(_loc4_.id == 0)
            {
               this.adjustBeaconId(_loc4_);
            }
         }
         if(param1.ScenarioOnButton1 != null && param1.ScenarioOnButton1.id == 0)
         {
            this.adjustScenarioId(param1.ScenarioOnButton1);
         }
         if(param1.ScenarioOnButton2 != null && param1.ScenarioOnButton2.id == 0)
         {
            this.adjustScenarioId(param1.ScenarioOnButton2);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set currentInstallation(param1:Installation) : void
      {
         var _loc2_:Object = this.currentInstallation;
         if(_loc2_ !== param1)
         {
            this._710999469currentInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentInstallation",_loc2_,param1));
         }
      }
      
      private function findBeaconInInstallationById(param1:Beacon) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         _loc2_ = false;
         for each(_loc3_ in this._currentInstallation.repeaters)
         {
            if(_loc3_.ioAddress == param1.ioAddress)
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      private function synchronizeActuators(param1:Skitter) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1.actuators)
         {
            if(this.findActuatorInInstallationById(_loc2_) == null)
            {
               this._currentInstallation.actuators.addItem(_loc2_);
               ServerCommunicationManager.instance.getActuatorNameList.push(_loc2_);
            }
         }
         for each(_loc2_ in this._currentInstallation.actuators)
         {
            for each(_loc3_ in ServerCommunicationManager.instance.connectedDevice)
            {
               if(!this.findActuatorInSkitterById(_loc2_,_loc3_))
               {
                  this.needSynchroniseSkitter = true;
                  _loc3_.actuators.addItem(_loc2_);
               }
            }
         }
      }
      
      public function cleanInstallation(param1:Skitter) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         for each(_loc3_ in this._currentInstallation.devices)
         {
            if(!_loc3_.hasCorrectIdentifier)
            {
               _loc2_ = parseInt(param1.identifier);
               if(_loc2_.toString() == _loc3_.identifier)
               {
                  _loc3_.identifier = param1.identifier;
                  param1.id = _loc3_.id;
               }
            }
         }
      }
      
      public function cleanSkitter(param1:Skitter) : void
      {
         KCTimeAnalyzer.Tracer("-- > cleanSkitter",100);
         if(param1 != null)
         {
            param1.actuators = new ArrayCollection();
            param1.RubberColour = Skitter.DEFAULT;
            param1.ScenarioOnButton1 = null;
            param1.ScenarioOnButton2 = null;
            param1.repeaters = new ArrayCollection();
            param1.ScenarioToTest = null;
            param1.name = Globals.SOMFY_SKITTER_NAME_DEFAULT;
            param1.RubberColour = "DEFAULT";
            this.updateDataModel(param1);
         }
      }
      
      public function traceInstallation() : void
      {
         var _loc1_:Installation = null;
         var _loc2_:* = null;
         KCTimeAnalyzer.Tracer("--------------------- [traceInstallation] ----------------------",0);
         if(Boolean(com.scenarioLauncher.services.InstallationService.instance.installations) && com.scenarioLauncher.services.InstallationService.instance.installations.length > 0)
         {
            _loc1_ = com.scenarioLauncher.services.InstallationService.instance.installations[0];
            for each(_loc2_ in _loc1_.devices)
            {
               KCTimeAnalyzer.Tracer("[id = " + _loc2_.id + "\tidentifier = " + _loc2_.identifier + "\tname = " + _loc2_.name + "\tRubberColour = " + _loc2_.RubberColour,10);
            }
         }
         KCTimeAnalyzer.Tracer("---------------------------------------------",0);
      }
      
      public function findScenarioInInstallationById(param1:Scenario) : Scenario
      {
         var _loc2_:Scenario = null;
         var _loc3_:* = null;
         _loc2_ = null;
         if(param1 != null)
         {
            for each(_loc3_ in this._currentInstallation.scenarios)
            {
               if(_loc3_.identifier == param1.identifier)
               {
                  _loc2_ = _loc3_;
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      private function refreshActutorNameInScenario(param1:Scenario) : void
      {
         var _loc2_:Actuator = null;
         var _loc3_:* = null;
         for each(_loc3_ in param1.situations)
         {
            if(_loc3_.actuator != null && _loc3_.actuator.name == null)
            {
               _loc2_ = this.findActuatorInInstallationById(_loc3_.actuator);
               if(_loc2_ != null)
               {
                  _loc3_.actuator.name = _loc2_.name;
               }
            }
         }
      }
      
      private function set _710999469currentInstallation(param1:Installation) : void
      {
         this._currentInstallation = param1;
         if(this._currentInstallation)
         {
            ServerCommunicationManager.instance.actuatorsList = this._currentInstallation.actuators as ArrayCollection;
            ServerCommunicationManager.instance.scenariosList = this._currentInstallation.scenarios as ArrayCollection;
            ServerCommunicationManager.instance.devicesList = this._currentInstallation.devices as ArrayCollection;
         }
         this.refreshActivateDevice();
      }
      
      private function adjustBeaconId(param1:Beacon) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._currentInstallation.repeaters)
         {
            if(_loc2_.ioAddress == param1.ioAddress)
            {
               param1.id = _loc2_.id;
               break;
            }
         }
      }
      
      public function addActuatorToCurrentInstallation(param1:Actuator) : void
      {
         if(this.findActuatorInInstallationById(param1) == null)
         {
            this.currentInstallation.actuators.addItem(param1);
         }
      }
      
      private function synchronizeBeacons(param1:Skitter) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1.repeaters)
         {
            if(!this.findBeaconInInstallationById(_loc2_))
            {
               this._currentInstallation.repeaters.addItem(_loc2_);
            }
         }
         for each(_loc2_ in this._currentInstallation.repeaters)
         {
            for each(_loc3_ in ServerCommunicationManager.instance.connectedDevice)
            {
               if(!this.findBeaconInSkitterById(_loc2_,_loc3_))
               {
                  this.needSynchroniseSkitter = true;
                  _loc3_.repeaters.addItem(_loc2_);
               }
            }
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      private function adjustScenarioId(param1:Scenario) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._currentInstallation.scenarios)
         {
            if(_loc2_.identifier == param1.identifier)
            {
               param1.id = _loc2_.id;
               break;
            }
         }
      }
      
      public function synchroniseAllSkitterConnected(param1:Boolean = false) : void
      {
         var _loc2_:* = null;
         if(Boolean(this._currentInstallation) && true)
         {
            KCTimeAnalyzer.Tracer("-- > synchroniseAllSkitterConnected",100);
            this.updateSkittersKey();
            this.saveInstallation(this._currentInstallation);
            ServerCommunicationManager.instance.skitterSynchroniseList = new Array();
            for each(_loc2_ in ServerCommunicationManager.instance.connectedDevice)
            {
               ServerCommunicationManager.instance.skitterSynchroniseList.push(_loc2_);
            }
            if(ServerCommunicationManager.instance.skitterSynchroniseList.length > 0)
            {
               if(param1)
               {
                  DialogsManager.showSynchronizeInProgressPopup();
               }
               ServerCommunicationManager.instance.synchronizeSkitter(ServerCommunicationManager.instance.skitterSynchroniseList.pop());
            }
         }
         this.refreshActivateDevice();
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function updateSkitter(param1:Skitter) : void
      {
         this.synchronizeActuators(param1);
         this.synchronizeBeacons(param1);
         this.synchronizeScenarios(param1);
      }
      
      public function returnAll() : ArrayCollection
      {
         var _loc1_:GenericDAO = new GenericDAO(Installation,EntityManager.getInstance());
         return _loc1_.findAll();
      }
      
      public function get currentInstallation() : Installation
      {
         return this._currentInstallation;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function updateDataModel(param1:Skitter, param2:Boolean = false) : Boolean
      {
         KCTimeAnalyzer.Tracer("-- > updateDataModel",100);
         var _loc3_:Boolean = false;
         if(this._currentInstallation && this._currentInstallation.key2W && param1 && param1.currentKey2W.Compare(this._currentInstallation.key2W))
         {
            this.updateSkitter(param1);
            this.refreshActivateDevice();
            if(this._currentInstallation)
            {
               KCTimeAnalyzer.Tracer("_currentInstallation.actuators.length nb = " + this._currentInstallation.actuators.length,0);
            }
            if(ServerCommunicationManager.instance.getActuatorNameList.length > 0)
            {
               com.scenarioLauncher.services.InstallationService.instance.updateActuatorName();
            }
            else
            {
               this.synchroniseAllSkitterConnected(param2);
            }
         }
         return _loc3_;
      }
      
      public function saveInstallation(param1:Installation) : void
      {
         this.traceInstallation();
         var _loc2_:GenericDAO = new GenericDAO(Installation,EntityManager.getInstance());
         _loc2_.save(param1);
      }
      
      private function findInstallationByKey2W(param1:Key2W) : Installation
      {
         var _loc2_:Installation = null;
         var _loc3_:* = null;
         _loc2_ = null;
         for each(_loc3_ in this._installations)
         {
            if(_loc3_.key2W.Compare(param1))
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         return _loc2_;
      }
      
      private function activateDeviceConnected() : void
      {
         var _loc4_:Skitter = null;
         var _loc5_:CollectionEvent = null;
         var _loc6_:Array = null;
         var _loc7_:* = undefined;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         for each(_loc4_ in ServerCommunicationManager.instance.devicesList)
         {
            if(!(_loc4_ is Skitter))
            {
               throw new Error("[KC-Somfy : activateDeviceConnected] ==> This is not a Skitter !!!!");
            }
            if((_loc8_ = ServerCommunicationManager.instance.ifDeviceConnected(_loc4_)).skit != null)
            {
               _loc4_ = _loc8_.skit;
            }
            _loc1_ = Boolean(_loc8_.plugged);
            if(Boolean(this.currentInstallation) && Boolean(this.currentInstallation.key2W))
            {
               if(_loc4_.currentKey2W)
               {
                  _loc2_ = _loc4_.currentKey2W.Compare(this.currentInstallation.key2W);
               }
            }
            else
            {
               _loc2_ = false;
            }
            _loc4_.active = _loc1_ && _loc2_ && !_loc4_.desactivate;
            _loc3_++;
         }
         (ServerCommunicationManager.instance.devicesList as ArrayCollection).refresh();
         (_loc5_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.UPDATE;
         _loc6_ = new Array();
         for each(_loc7_ in ServerCommunicationManager.instance.devicesList)
         {
            (_loc9_ = new Object()).source = _loc7_;
            _loc6_.push(_loc9_);
         }
         _loc5_.items = _loc6_;
         ServerCommunicationManager.instance.devicesList.dispatchEvent(_loc5_);
      }
      
      public function getSkitterConnectedByIdentifier(param1:Skitter) : Skitter
      {
         var _loc2_:Skitter = null;
         var _loc3_:* = null;
         _loc2_ = null;
         for each(_loc3_ in ServerCommunicationManager.instance.connectedDevice)
         {
            if(_loc3_.identifier == param1.identifier)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         return _loc2_;
      }
      
      private function findActuatorInInstallationById(param1:Actuator) : Actuator
      {
         var _loc2_:Actuator = null;
         var _loc3_:* = null;
         _loc2_ = null;
         for each(_loc3_ in this._currentInstallation.actuators)
         {
            if(_loc3_.ioAddress == param1.ioAddress)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         return _loc2_;
      }
      
      public function refreshActivateDevice() : void
      {
         this.activateDeviceConnected();
      }
      
      public function refreshSkitter(param1:Skitter) : void
      {
         this.checkSkitterKeyAndAddToInstallIfNoPresent(param1);
      }
      
      private function findBeaconInSkitterById(param1:Beacon, param2:Skitter) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         _loc3_ = false;
         for each(_loc4_ in param2.repeaters)
         {
            if(_loc4_.ioAddress == param1.ioAddress)
            {
               _loc3_ = true;
               break;
            }
         }
         return _loc3_;
      }
      
      public function set installations(param1:ArrayCollection) : void
      {
         this._installations = param1;
      }
      
      private function synchronizeScenarios(param1:Skitter) : void
      {
         var _loc2_:Scenario = null;
         var _loc3_:Scenario = null;
         if(param1.ScenarioOnButton1 != null)
         {
            _loc2_ = this.findScenarioInInstallationById(param1.ScenarioOnButton1);
            _loc3_ = param1.ScenarioOnButton1.duplicate();
            if(_loc2_ != null)
            {
               _loc3_.id = _loc2_.id;
               _loc3_.identifier = _loc2_.identifier;
               this._currentInstallation.scenarios.setItemAt(_loc3_,this._currentInstallation.scenarios.getItemIndex(_loc2_));
            }
            else
            {
               _loc3_.identifier = param1.ScenarioOnButton1.identifier;
               this._currentInstallation.scenarios.addItem(_loc3_);
            }
            this.refreshActutorNameInScenario(_loc3_);
         }
         if(param1.ScenarioOnButton2 != null)
         {
            _loc2_ = this.findScenarioInInstallationById(param1.ScenarioOnButton2);
            _loc3_ = param1.ScenarioOnButton2.duplicate();
            if(_loc2_ != null)
            {
               _loc3_.id = _loc2_.id;
               _loc3_.identifier = _loc2_.identifier;
               this._currentInstallation.scenarios.setItemAt(_loc3_,this._currentInstallation.scenarios.getItemIndex(_loc2_));
            }
            else
            {
               _loc3_.identifier = param1.ScenarioOnButton2.identifier;
               this._currentInstallation.scenarios.addItem(_loc3_);
            }
            this.refreshActutorNameInScenario(_loc3_);
         }
      }
      
      public function isSkitterEmpty(param1:Skitter) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1 != null && param1.actuators != null)
         {
            if(param1.actuators.length == 0)
            {
               if(param1.ScenarioOnButton1 == null && param1.ScenarioOnButton2 == null)
               {
                  _loc2_ = true;
               }
            }
         }
         else
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      private function adjustActuatorId(param1:Actuator) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._currentInstallation.actuators)
         {
            if(_loc2_.ioAddress == param1.ioAddress)
            {
               param1.id = _loc2_.id;
               break;
            }
         }
      }
   }
}
