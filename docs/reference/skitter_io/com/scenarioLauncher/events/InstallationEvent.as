package com.scenarioLauncher.events
{
   import flash.events.Event;
   import ioService.datamodel.Installation;
   import mx.collections.ArrayCollection;
   import mx.rpc.events.FaultEvent;
   
   public class InstallationEvent extends Event
   {
      
      public static const GET_ACTUATOR_POSITION:String = "actuatorPosition_ScenarioInstallationEvent";
      
      public static const DISCOVERY_END:String = "discoveryEndInstallationEvent";
      
      public static const SKITTER_SYNCHRONISED:String = "skitter_synchronisedInstallationEvent";
      
      public static const CREATE_SCENARIO:String = "create_ScenarioInstallationEvent";
      
      public static const UPDATE_KEY_SUCCESS:String = "updateKeySuccessInstallationEvent";
      
      public static const GIVE_KEY_SUCCESS:String = "giveKeySuccessInstallationEvent";
      
      public static const SKITTER_REINITIALISED:String = "skitterReinitialisedInstallationEvent";
      
      public static const DISCOVERY_FAILURE:String = "discoveryErrorInstallationEvent";
      
      public static const TEST_SCENARIO:String = "test_ScenarioInstallationEvent";
      
      public static const NEW_SYSTEM_KEY_SUCCESS:String = "newSystemKeySuccessInstallationEvent";
       
      
      public var installation:Installation;
      
      public var clearActuatorList:Boolean;
      
      public var actuatorListSelection:ArrayCollection;
      
      public var faultEvent:FaultEvent;
      
      public var keyID:int;
      
      public function InstallationEvent(param1:String, param2:Boolean = true, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new InstallationEvent(type,bubbles,cancelable);
      }
   }
}
