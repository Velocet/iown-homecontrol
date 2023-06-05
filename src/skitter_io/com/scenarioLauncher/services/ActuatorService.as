package com.scenarioLauncher.services
{
   import com.scenarioLauncher.persistence.GenericDAO;
   import ioService.datamodel.Actuator;
   import nz.co.codec.flexorm.EntityManager;
   
   public class ActuatorService
   {
      
      private static var _instance:com.scenarioLauncher.services.ActuatorService = null;
       
      
      public function ActuatorService()
      {
         super();
      }
      
      public static function get instance() : com.scenarioLauncher.services.ActuatorService
      {
         if(_instance == null)
         {
            _instance = new com.scenarioLauncher.services.ActuatorService();
         }
         return _instance;
      }
      
      public function saveActuator(param1:Actuator) : void
      {
         var _loc2_:GenericDAO = new GenericDAO(Actuator,EntityManager.getInstance());
         _loc2_.save(param1);
      }
   }
}
