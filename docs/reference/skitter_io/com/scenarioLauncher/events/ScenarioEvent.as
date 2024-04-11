package com.scenarioLauncher.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Scenario;
   
   public class ScenarioEvent extends Event
   {
      
      public static const SCENARIO_UPDATE_CANCEL:String = "scenarioUpdateCancel";
      
      public static const CREATE_SCENARIO_MANUALLY_CLICK:String = "createScenarioManuallyClick";
      
      public static const ACTUATOR_ADDED_TO_SCENARIO:String = "actuatorAddedToScenario";
      
      public static const SCENARIO_CLICK:String = "scenarioClick";
      
      public static const SCENARIO_DELETE:String = "scenarioDelete";
      
      public static const SCENARIO_UPDATE_VALIDATE:String = "scenarioUpdateValidate";
       
      
      public var scenario:Scenario = null;
      
      public var actuator:Actuator = null;
      
      public var position:Point = null;
      
      public var scenarioName:String = "";
      
      public var scenarioBitMap:BitmapData = null;
      
      public function ScenarioEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ScenarioEvent(type,bubbles,cancelable);
      }
   }
}
