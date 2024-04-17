package com.scenarioLauncher.persistence
{
   import com.keepcore.KCTimeAnalyzer;
   import flash.data.SQLConnection;
   import flash.data.SQLMode;
   import flash.data.SQLSchemaResult;
   import flash.data.SQLStatement;
   import flash.data.SQLTableSchema;
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.filesystem.File;
   
   public class LocalSQLiteConnection extends EventDispatcher
   {
      
      private static var _instance:com.scenarioLauncher.persistence.LocalSQLiteConnection = new com.scenarioLauncher.persistence.LocalSQLiteConnection();
      
      private static const DB_FILE_NAME:String = "somfy.sqlite";
       
      
      private var _sqlConnection:SQLConnection = null;
      
      public function LocalSQLiteConnection()
      {
         super();
         if(_instance)
         {
            throw new IllegalOperationError("Singleton class cannot be instantiated");
         }
         this.initConnection();
      }
      
      public static function get instance() : com.scenarioLauncher.persistence.LocalSQLiteConnection
      {
         return _instance;
      }
      
      public static function get sqlConnection() : SQLConnection
      {
         if(false)
         {
            return instance._sqlConnection;
         }
         throw new IllegalOperationError("Not connected to local database");
      }
      
      private function createSqlConnection() : void
      {
         var _loc1_:File = File.applicationStorageDirectory.resolvePath(DB_FILE_NAME);
         KCTimeAnalyzer.Tracer("file = " + _loc1_.nativePath,0);
         if(this._sqlConnection == null)
         {
            this._sqlConnection = new SQLConnection();
         }
         if(_loc1_.exists)
         {
            this._sqlConnection.open(_loc1_,SQLMode.UPDATE);
         }
         else
         {
            this._sqlConnection.open(_loc1_,SQLMode.CREATE);
         }
      }
      
      public function closeSqlConnection() : void
      {
         this._sqlConnection.close();
      }
      
      public function resetDatabase() : void
      {
         var _loc2_:* = null;
         var _loc3_:String = null;
         var _loc4_:SQLStatement = null;
         this._sqlConnection.loadSchema();
         var _loc1_:SQLSchemaResult = this._sqlConnection.getSchemaResult();
         for each(_loc2_ in _loc1_.tables)
         {
            _loc3_ = "DELETE FROM " + _loc2_.name;
            (_loc4_ = new SQLStatement()).sqlConnection = this._sqlConnection;
            _loc4_.text = _loc3_;
            _loc4_.execute();
         }
         this._sqlConnection.close();
         this.createSqlConnection();
      }
      
      public function initConnection() : void
      {
         this.createSqlConnection();
      }
   }
}
