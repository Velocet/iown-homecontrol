package com.scenarioLauncher.services
{
   import com.scenarioLauncher.persistence.GenericDAO;
   import flash.data.SQLStatement;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import ioService.datamodel.Scenario;
   import ioService.datamodel.Situation;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   import nz.co.codec.flexorm.EntityManager;
   
   public class ScenarioService implements IEventDispatcher
   {
      
      private static var _instance:com.scenarioLauncher.services.ScenarioService = new com.scenarioLauncher.services.ScenarioService();
       
      
      private var _em:EntityManager;
      
      private var scenario:Scenario;
      
      private var scenariosList:ArrayCollection;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function ScenarioService()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public static function get instance() : com.scenarioLauncher.services.ScenarioService
      {
         return _instance;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set scenarios(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.scenarios;
         if(_loc2_ !== param1)
         {
            this._1726545635scenarios = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarios",_loc2_,param1));
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function deleteScenarioById(param1:Scenario) : void
      {
         var _loc2_:GenericDAO = new GenericDAO(Scenario,EntityManager.getInstance());
         _loc2_.removeById(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function deleteScenario(param1:Scenario) : void
      {
         var _loc2_:GenericDAO = null;
         var _loc3_:* = null;
         var _loc4_:SQLStatement = null;
         var _loc5_:SQLStatement = null;
         this._em = EntityManager.getInstance();
         _loc2_ = new GenericDAO(Scenario,this._em);
         this._em.startTransaction();
         for each(_loc3_ in param1.situations)
         {
            _loc2_.remove(_loc3_,false);
         }
         _loc2_.remove(param1,false);
         (_loc4_ = new SQLStatement()).text = "DELETE FROM scenario_situations WHERE scenario_id = \'" + param1.id + "\'";
         _loc4_.sqlConnection = this._em.sqlConnection;
         _loc4_.execute();
         (_loc5_ = new SQLStatement()).text = "DELETE FROM installation_scenarios WHERE scenario_id = \'" + param1.id + "\'";
         _loc5_.sqlConnection = this._em.sqlConnection;
         _loc5_.execute();
         this._em.endTransaction();
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function get scenarios() : ArrayCollection
      {
         if(InstallationService.instance.currentInstallation != null)
         {
            return InstallationService.instance.currentInstallation.scenarios as ArrayCollection;
         }
         return null;
      }
      
      public function saveScenario(param1:Scenario) : void
      {
         var _loc2_:GenericDAO = new GenericDAO(Scenario,EntityManager.getInstance());
         _loc2_.save(param1);
      }
      
      private function set _1726545635scenarios(param1:ArrayCollection) : void
      {
         if(InstallationService.instance.currentInstallation != null)
         {
            InstallationService.instance.currentInstallation.scenarios = param1;
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function deleteScenarioSituations(param1:ArrayCollection) : void
      {
         var _loc2_:* = null;
         var _loc3_:SQLStatement = null;
         var _loc4_:SQLStatement = null;
         this._em = EntityManager.getInstance();
         this._em.startTransaction();
         for each(_loc2_ in param1)
         {
            if(_loc2_.id != 0)
            {
               _loc3_ = new SQLStatement();
               _loc3_.text = "DELETE FROM scenario_situations WHERE situation_id = \'" + _loc2_.id + "\'";
               _loc3_.sqlConnection = this._em.sqlConnection;
               _loc3_.execute();
               (_loc4_ = new SQLStatement()).text = "DELETE FROM situation WHERE id=\'" + _loc2_.id + "\'";
               _loc4_.sqlConnection = this._em.sqlConnection;
               _loc4_.execute();
            }
         }
         this._em.endTransaction();
      }
   }
}
