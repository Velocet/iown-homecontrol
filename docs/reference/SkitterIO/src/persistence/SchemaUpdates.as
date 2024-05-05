package com.scenarioLauncher.persistence
{
   import flash.data.SQLColumnSchema;
   import flash.data.SQLConnection;
   import flash.data.SQLSchemaResult;
   import flash.data.SQLStatement;
   import flash.data.SQLTableSchema;
   
   public class SchemaUpdates
   {
       
      
      public function SchemaUpdates()
      {
         super();
      }
      
      private static function addFieldIfMissing(param1:SQLTableSchema, param2:String, param3:String) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:String = null;
         var _loc8_:SQLStatement = null;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         for each(_loc6_ in param1.columns)
         {
            if(_loc6_.name == param2)
            {
               _loc5_ = true;
               break;
            }
         }
         if(!_loc5_)
         {
            _loc7_ = "ALTER TABLE " + param1.name + " ADD COLUMN " + param2 + " " + param3;
            (_loc8_ = new SQLStatement()).sqlConnection = LocalSQLiteConnection.sqlConnection;
            _loc8_.text = _loc7_;
            _loc8_.execute();
            _loc4_ = true;
         }
         return _loc4_;
      }
      
      private static function update_2_2_0_0(param1:SQLSchemaResult) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:String = null;
         var _loc6_:SQLStatement = null;
         var _loc2_:Boolean = false;
         for each(_loc3_ in param1.tables)
         {
            if(_loc3_.name.toLowerCase() == "device")
            {
               for each(_loc4_ in _loc3_.columns)
               {
                  if(_loc4_.name == "identifier" && _loc4_.dataType == "integer")
                  {
                     _loc5_ = "CREATE TABLE deviceCopy(id integer primary key autoincrement,identifier text,marked_for_deletion boolean,entity_type string,virtual_com_port text,io_address text,key_2_w_id integer,created_at date,hw_version text,updated_at date,sw_version text,name text,type text)";
                     (_loc6_ = new SQLStatement()).sqlConnection = LocalSQLiteConnection.sqlConnection;
                     _loc6_.text = _loc5_;
                     _loc6_.execute();
                     _loc5_ = "insert into deviceCopy(id,identifier,marked_for_deletion,entity_type,virtual_com_port,io_address,key_2_w_id,created_at,hw_version,updated_at,sw_version,name,type) select id,identifier,marked_for_deletion,entity_type,virtual_com_port,io_address,key_2_w_id,created_at,hw_version,updated_at,sw_version,name,type from device";
                     (_loc6_ = new SQLStatement()).sqlConnection = LocalSQLiteConnection.sqlConnection;
                     _loc6_.text = _loc5_;
                     _loc6_.execute();
                     _loc5_ = "drop table device";
                     (_loc6_ = new SQLStatement()).sqlConnection = LocalSQLiteConnection.sqlConnection;
                     _loc6_.text = _loc5_;
                     _loc6_.execute();
                     _loc5_ = "ALTER TABLE deviceCopy RENAME TO device";
                     (_loc6_ = new SQLStatement()).sqlConnection = LocalSQLiteConnection.sqlConnection;
                     _loc6_.text = _loc5_;
                     _loc6_.execute();
                     _loc2_ = true;
                     break;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public static function update_schema() : Boolean
      {
         var sr:SQLSchemaResult = null;
         var curChange:Boolean = false;
         var schemaChanged:Boolean = false;
         var updateStats:Boolean = false;
         var sqlConnection:SQLConnection = LocalSQLiteConnection.sqlConnection;
         try
         {
            sqlConnection.loadSchema();
            sr = sqlConnection.getSchemaResult();
            curChange = update_2_2_0_0(sr);
            if(curChange)
            {
               trace("SchemaUpdates : applied update_2_2_0_0 (schema changed)");
               schemaChanged = true;
               updateStats = true;
            }
            else
            {
               trace("SchemaUpdates : applied update_2_2_0_0 (no change needed)");
            }
         }
         catch(error:Error)
         {
         }
         return updateStats;
      }
   }
}
