package com.scenarioLauncher.events
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Situation;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   
   public class ActuatorEvent extends Event implements IEventDispatcher
   {
      
      public static const GET_NAME_ACTUATOR:String = "getNameActuatorActuatorEvent";
      
      public static const APPLY_TO_ALL_ACTUATOR_SETTINGS:String = "applyToAllActuatorSettings";
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      public static const IDENTIFY_ACTUATOR:String = "identifyActuatorActuatorEvent";
      
      public static const DELETE_ACTUATOR:String = "deleteActuatorActuatorEvent";
      
      public static const POSITION_ACTUATOR:String = "positionActuatorActuatorEvent";
      
      private static var _1353764312NEW_ACTUATOR:String = "newActuatorActuatorEvent";
      
      public static const RENAME_ACTUATOR:String = "renameActuatorActuatorEvent";
      
      public static const APPLY_ACTUATOR_SETTINGS:String = "applyActuatorSettings";
       
      
      public var oldID:int;
      
      public var actuatorNewName:String;
      
      public var newID:int;
      
      public var faultEvent:FaultEvent;
      
      public var actuator:Actuator;
      
      public var keyID:int;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public var situation:Situation;
      
      public function ActuatorEvent(param1:String, param2:Boolean = true, param3:Boolean = false)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super(param1,param2,param3);
      }
      
      [Bindable(event="propertyChange")]
      public static function get NEW_ACTUATOR() : String
      {
         return ActuatorEvent._1353764312NEW_ACTUATOR;
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public static function set NEW_ACTUATOR(param1:String) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = ActuatorEvent._1353764312NEW_ACTUATOR;
         if(_loc2_ !== param1)
         {
            ActuatorEvent._1353764312NEW_ACTUATOR = param1;
            _loc3_ = ActuatorEvent.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(ActuatorEvent,"NEW_ACTUATOR",_loc2_,param1));
            }
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:ActuatorEvent = new ActuatorEvent(type,bubbles,cancelable);
         _loc1_.faultEvent = this.faultEvent;
         _loc1_.actuator = this.actuator;
         _loc1_.actuatorNewName = this.actuatorNewName;
         _loc1_.situation = this.situation;
         _loc1_.keyID = this.keyID;
         _loc1_.oldID = this.oldID;
         _loc1_.newID = this.newID;
         return _loc1_;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
   }
}
