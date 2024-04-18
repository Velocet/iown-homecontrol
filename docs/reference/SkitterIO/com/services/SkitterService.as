package com.scenarioLauncher.services
{
   import com.scenarioLauncher.persistence.GenericDAO;
   import flash.data.SQLStatement;
   import ioService.datamodel.Device;
   import ioService.datamodel.Skitter;
   import nz.co.codec.flexorm.EntityManager;
   
   public class SkitterService
   {
      
      private static var _instance:com.scenarioLauncher.services.SkitterService = new com.scenarioLauncher.services.SkitterService();
       
      
      private var _em:EntityManager;
      
      public function SkitterService()
      {
         super();
      }
      
      public static function get instance() : com.scenarioLauncher.services.SkitterService
      {
         return _instance;
      }
      
      public function saveSkitter(param1:Skitter) : void
      {
         var _loc2_:GenericDAO = new GenericDAO(Skitter,EntityManager.getInstance());
         _loc2_.save(param1);
      }
      
      public function deleteSkitter(param1:Skitter) : void
      {
         var _loc2_:GenericDAO = null;
         this._em = EntityManager.getInstance();
         _loc2_ = new GenericDAO(Device,this._em);
         this._em.startTransaction();
         _loc2_.remove(param1,false);
         var _loc3_:SQLStatement = new SQLStatement();
         _loc3_.text = "DELETE FROM installation_devices WHERE device_id = \'" + param1.id + "\'";
         _loc3_.sqlConnection = this._em.sqlConnection;
         _loc3_.execute();
         var _loc4_:SQLStatement;
         (_loc4_ = new SQLStatement()).text = "DELETE FROM device_actuators WHERE device_id = \'" + param1.id + "\'";
         _loc4_.sqlConnection = this._em.sqlConnection;
         _loc4_.execute();
         var _loc5_:SQLStatement;
         (_loc5_ = new SQLStatement()).text = "DELETE FROM device_beacons WHERE device_id = \'" + param1.id + "\'";
         _loc5_.sqlConnection = this._em.sqlConnection;
         _loc5_.execute();
         this._em.endTransaction();
      }
      
      public function deleteSkitterById(param1:Skitter) : void
      {
         var _loc2_:GenericDAO = new GenericDAO(Skitter,EntityManager.getInstance());
         _loc2_.removeById(param1);
      }
   }
}
