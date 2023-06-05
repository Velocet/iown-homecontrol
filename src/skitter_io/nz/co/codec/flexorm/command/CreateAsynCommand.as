package nz.co.codec.flexorm.command
{
   import flash.data.SQLColumnSchema;
   import flash.data.SQLConnection;
   import flash.data.SQLSchemaResult;
   import flash.data.SQLTableSchema;
   import flash.events.SQLErrorEvent;
   import flash.events.SQLEvent;
   import mx.collections.ArrayCollection;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.BlockingExecutor;
   import nz.co.codec.flexorm.EntityEvent;
   import nz.co.codec.flexorm.metamodel.IDStrategy;
   
   public class CreateAsynCommand extends SQLCommand
   {
       
      
      private var _created:Boolean;
      
      private var _pk:String;
      
      public function CreateAsynCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this._created = false;
      }
      
      private function getExistingColumns(param1:SQLSchemaResult) : ArrayCollection
      {
         var _loc3_:* = null;
         var _loc2_:ArrayCollection = new ArrayCollection();
         for each(_loc3_ in param1.tables[0].columns)
         {
            if(!_loc3_.primaryKey)
            {
               _loc2_.addItem(_loc3_.name);
            }
         }
         return _loc2_;
      }
      
      override protected function respond(param1:SQLEvent) : void
      {
         var _loc2_:BlockingExecutor = null;
         var _loc3_:String = null;
         var _loc4_:Object = null;
         if(!this._created)
         {
            _loc2_ = new BlockingExecutor();
            _loc2_.responder = _responder;
            _loc2_.data = param1.type;
            for(_loc3_ in _columns)
            {
               if(_loc4_ = _columns[_loc3_].constraint)
               {
                  _loc2_.add(new ConstraintInsertTriggerCommand(_sqlConnection,_schema,_table,_loc3_,_loc4_.table,_loc4_.column,_debugLevel));
                  _loc2_.add(new ConstraintUpdateTriggerCommand(_sqlConnection,_schema,_table,_loc3_,_loc4_.table,_loc4_.column,_debugLevel));
                  _loc2_.add(new ConstraintDeleteTriggerCommand(_sqlConnection,_schema,_table,_loc3_,_loc4_.table,_loc4_.column,_debugLevel));
               }
            }
            _loc2_.execute();
         }
         else
         {
            _responder.result(new EntityEvent(param1.type));
         }
      }
      
      private function loadSchemaResultHandler(param1:SQLEvent) : void
      {
         var _loc3_:String = null;
         _sqlConnection.removeEventListener(SQLEvent.SCHEMA,this.loadSchemaResultHandler);
         _sqlConnection.removeEventListener(SQLErrorEvent.ERROR,this.loadSchemaErrorHandler);
         _changed = false;
         var _loc2_:ArrayCollection = this.getExistingColumns(_sqlConnection.getSchemaResult());
         if(_loc2_.length > 0)
         {
            this._created = true;
            _loc3_ = this.buildAlterSQL(_loc2_);
            if(_loc3_)
            {
               _statement.text = _loc3_;
               if(_debugLevel > 0)
               {
                  debug();
               }
               _statement.execute();
            }
            else
            {
               this.respondUnaltered();
            }
         }
         else
         {
            this.respondUnaltered();
         }
      }
      
      private function respondUnaltered() : void
      {
         _statement.removeEventListener(SQLEvent.RESULT,resultHandler);
         _statement.removeEventListener(SQLErrorEvent.ERROR,errorHandler);
         _responder.result(new EntityEvent("unaltered"));
         _responded = true;
      }
      
      private function buildCreateSQL() : String
      {
         var _loc2_:String = null;
         var _loc1_:String = StringUtil.substitute("create table if not exists {0}.{1}(",_schema,_table);
         if(this._pk)
         {
            _loc1_ += this._pk + ",";
         }
         for(_loc2_ in _columns)
         {
            _loc1_ += StringUtil.substitute("{0} {1},",_loc2_,_columns[_loc2_].type);
         }
         return _loc1_.substring(0,_loc1_.length - 1) + ")";
      }
      
      public function addForeignKey(param1:String, param2:String, param3:String, param4:String) : void
      {
         _columns[param1] = {
            "type":param2,
            "constraint":{
               "table":param3,
               "column":param4
            }
         };
         _changed = true;
      }
      
      private function buildAlterSQL(param1:ArrayCollection) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = "";
         for(_loc3_ in _columns)
         {
            if(!param1.contains(_loc3_))
            {
               _loc2_ += StringUtil.substitute("alter table {0} add {1} {2};",_table,_loc3_,_columns[_loc3_].type);
            }
         }
         return _loc2_.length > 0 ? _loc2_ : null;
      }
      
      private function loadSchemaErrorHandler(param1:SQLErrorEvent) : void
      {
         _sqlConnection.removeEventListener(SQLEvent.SCHEMA,this.loadSchemaResultHandler);
         _sqlConnection.removeEventListener(SQLErrorEvent.ERROR,this.loadSchemaErrorHandler);
         _statement.text = this.buildCreateSQL();
         _changed = false;
         if(_debugLevel > 0)
         {
            debug();
         }
         _statement.execute();
      }
      
      override public function execute() : void
      {
         if(_changed)
         {
            _sqlConnection.addEventListener(SQLEvent.SCHEMA,this.loadSchemaResultHandler);
            _sqlConnection.addEventListener(SQLErrorEvent.ERROR,this.loadSchemaErrorHandler);
            _sqlConnection.loadSchema(SQLTableSchema,_table);
         }
         else
         {
            if(_debugLevel > 0)
            {
               debug();
            }
            _statement.execute();
         }
      }
      
      override public function addColumn(param1:String, param2:String = null, param3:String = null) : void
      {
         _columns[param1] = {"type":param2};
         _changed = true;
      }
      
      public function toString() : String
      {
         return "CREATE " + _table + ": " + _statement.text;
      }
      
      public function setPrimaryKey(param1:String, param2:String) : void
      {
         if(IDStrategy.UID == param2)
         {
            this._pk = StringUtil.substitute("{0} string primary key",param1);
         }
         else
         {
            this._pk = StringUtil.substitute("{0} integer primary key autoincrement",param1);
         }
         _changed = true;
      }
   }
}
