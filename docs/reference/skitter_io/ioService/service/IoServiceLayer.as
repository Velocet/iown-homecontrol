package ioService.service
{
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Skitter;
   import mx.collections.ArrayCollection;
   
   public interface IoServiceLayer
   {
       
      
      function upgradeSkitter(param1:Skitter, param2:String, param3:Function = null, param4:Function = null, param5:Function = null) : void;
      
      function getKeyFrom2WController(param1:Function = null, param2:Function = null) : void;
      
      function identifyActuator(param1:Actuator, param2:Function = null, param3:Function = null) : void;
      
      function setActuatorName(param1:Actuator, param2:String, param3:Function = null, param4:Function = null) : void;
      
      function pairEquipmentInSystem(param1:Function = null, param2:Function = null, param3:Function = null, param4:Function = null) : void;
      
      function start(param1:Function = null) : void;
      
      function giveKeyToAnother2WController(param1:Function = null, param2:Function = null) : void;
      
      function get connectedDevices() : ArrayCollection;
      
      function synchronizeSkitter(param1:Skitter, param2:Function = null, param3:Function = null) : void;
      
      function pairNewEquipment(param1:Function = null, param2:Function = null, param3:Function = null, param4:Function = null) : void;
      
      function getWindowsServiceVersion() : String;
      
      function testScenario(param1:Scenario, param2:Function = null, param3:Function = null) : void;
      
      function pairEquipmentStimulatedBy1WController(param1:Function = null, param2:Function = null, param3:Function = null) : void;
      
      function cancelGiveKey(param1:Function = null, param2:Function = null) : void;
      
      function resetSkitter(param1:Skitter, param2:Function = null, param3:Function = null) : void;
      
      function getActuatorPosition(param1:Actuator, param2:Function = null, param3:Function = null) : void;
      
      function getActuatorName(param1:Actuator, param2:Function = null, param3:Function = null) : void;
      
      function generateNewKey(param1:Function = null, param2:Function = null) : void;
   }
}
