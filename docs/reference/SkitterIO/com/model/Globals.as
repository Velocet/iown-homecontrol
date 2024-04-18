package com.scenarioLauncher.model
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class Globals implements IEventDispatcher
   {
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private static var _singleton:com.scenarioLauncher.model.Globals;
      
      public static var SOMFY_WEBSITE__DEFAULT_URL:String = "http://www.somfy.com";
      
      public static var GIVE_KEY_TIMEOUT:int = 1200000;
      
      public static var PASSWORD:String = "INSTAL";
      
      private static var _995413337NET_CONNECTED:Boolean = false;
      
      public static var ADMIN_IDENTIFIED:Boolean = false;
      
      public static const MIN_TIMER_SKITTER_PROGRESS:int = 3000;
      
      public static const DELAY_ACTUATOR_IDENTIFY:int = 5000;
      
      public static var STEP3_DISCOVER_ACTUATOR:String = "STEP3_DISCOVER_ACTUATOR";
      
      public static var URL_UPDATE_SKIT_EASY:String = "http://www.somfy.com/skitter/download/xml/updateDescriptor.xml";
      
      public static var STEP1_DISCOVER_ACTUATOR:String = "STEP1_DISCOVER_ACTUATOR";
      
      public static const SKITTER_NAME_MAX_CHAR:int = 25;
      
      public static var SKITTER_EDITION_IN_PROGRESS:Boolean = false;
      
      public static var SOMFY_SKITTER_NAME_DEFAULT:String = "SKITTER io";
      
      public static const SCENARIO_NAME_MAX_CHAR:int = 20;
      
      public static var STEP_GENERATE_NEW_KEY:String = "STEP_GENERATE_NEW_KEY";
      
      public static var locale:String = "en_US";
      
      public static var SYNCHRO_LOCKED:Boolean = false;
      
      public static var ACTUATOR_SCALE:Number = 1.1;
      
      public static const ACTUATOR_NAME_MAX_CHAR:int = 16;
      
      public static var STEP2_DISCOVER_ACTUATOR:String = "STEP2_DISCOVER_ACTUATOR";
      
      public static var answerNoFor1W:Boolean = false;
      
      public static var STEP4_DISCOVER_ACTUATOR:String = "STEP4_DISCOVER_ACTUATOR";
      
      public static var SKITTER_SYNCHRONISE_IN_PROGRESS:Boolean = false;
       
      
      private var _529110426actuators:ArrayCollection;
      
      private var _installationState:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _1726545635scenarios:ArrayCollection;
      
      public function Globals(param1:Class)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         if(param1 != SingletonLock)
         {
            throw new Error("Invalid Singleton access.  Use Globals.instance.");
         }
      }
      
      public static function get instance() : com.scenarioLauncher.model.Globals
      {
         if(_singleton == null)
         {
            _singleton = new com.scenarioLauncher.model.Globals(SingletonLock);
            _singleton.actuators = new ArrayCollection();
            _singleton.scenarios = new ArrayCollection();
         }
         return _singleton;
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      [Bindable(event="propertyChange")]
      public static function get NET_CONNECTED() : Boolean
      {
         return com.scenarioLauncher.model.Globals._995413337NET_CONNECTED;
      }
      
      public static function set NET_CONNECTED(param1:Boolean) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = com.scenarioLauncher.model.Globals._995413337NET_CONNECTED;
         if(_loc2_ !== param1)
         {
            com.scenarioLauncher.model.Globals._995413337NET_CONNECTED = param1;
            _loc3_ = com.scenarioLauncher.model.Globals.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(com.scenarioLauncher.model.Globals,"NET_CONNECTED",_loc2_,param1));
            }
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarios() : ArrayCollection
      {
         return this._1726545635scenarios;
      }
      
      public function set scenarios(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1726545635scenarios;
         if(_loc2_ !== param1)
         {
            this._1726545635scenarios = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarios",_loc2_,param1));
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function set installationState(param1:String) : void
      {
         this._installationState = param1;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function set actuators(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._529110426actuators;
         if(_loc2_ !== param1)
         {
            this._529110426actuators = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuators",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actuators() : ArrayCollection
      {
         return this._529110426actuators;
      }
      
      public function get installationState() : String
      {
         return this._installationState;
      }
   }
}

class SingletonLock
{
    
   
   public function SingletonLock()
   {
      super();
   }
}
