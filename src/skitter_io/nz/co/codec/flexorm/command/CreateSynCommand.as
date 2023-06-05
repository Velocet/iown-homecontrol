package nz.co.codec.flexorm.command
{
   import flash.data.SQLColumnSchema;
   import flash.data.SQLConnection;
   import flash.data.SQLSchemaResult;
   import flash.data.SQLTableSchema;
   import flash.errors.SQLError;
   import mx.collections.ArrayCollection;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.metamodel.IDStrategy;
   
   public class CreateSynCommand extends SQLCommand
   {
       
      
      private var _created:Boolean;
      
      private var _idColumn:String;
      
      private var _pk:String;
      
      public function CreateSynCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this._created = false;
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
      
      private function buildAlterSQL(param1:ArrayCollection) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = "";
         for(_loc3_ in _columns)
         {
            if(!param1.contains(_loc3_) && _loc3_ != this._idColumn)
            {
               _loc2_ += StringUtil.substitute("alter table {0}.{1} add {2} {3};",_schema,_table,_loc3_,_columns[_loc3_].type);
            }
         }
         return _loc2_.length > 0 ? _loc2_ : null;
      }
      
      override protected function prepareStatement() : void
      {
         var _loc1_:String = null;
         var _loc2_:ArrayCollection = this.getExistingColumns();
         if(_loc2_)
         {
            _loc1_ = this.buildAlterSQL(_loc2_);
            this._created = true;
         }
         else
         {
            _loc1_ = this.buildCreateSQL();
         }
         if(_loc1_)
         {
            _statement.text = _loc1_;
         }
         _changed = false;
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
      
      override public function execute() : void
      {
         var _loc1_:String = null;
         var _loc2_:Object = null;
         if(_changed)
         {
            this.prepareStatement();
         }
         if(true)
         {
            return;
         }
         if(_debugLevel > 0)
         {
            debug();
         }
         trace("EXECUTE ASYNC SQL : undefined");
         _statement.execute();
         if(!this._created)
         {
            for(_loc1_ in _columns)
            {
               _loc2_ = _columns[_loc1_].constraint;
               if(_loc2_)
               {
                  new ConstraintInsertTriggerCommand(_sqlConnection,_schema,_table,_loc1_,_loc2_.table,_loc2_.column,_debugLevel).execute();
                  new ConstraintUpdateTriggerCommand(_sqlConnection,_schema,_table,_loc1_,_loc2_.table,_loc2_.column,_debugLevel).execute();
                  new ConstraintDeleteTriggerCommand(_sqlConnection,_schema,_table,_loc1_,_loc2_.table,_loc2_.column,_debugLevel).execute();
               }
            }
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
      
      private function getExistingColumns() : ArrayCollection
      {
         var schemaResult:SQLSchemaResult = null;
         var existingColumns:ArrayCollection = null;
         var column:SQLColumnSchema = null;
         try
         {
            _sqlConnection.loadSchema(SQLTableSchema,_table);
            schemaResult = _sqlConnection.getSchemaResult();
            if(schemaResult.tables.length > 0)
            {
               existingColumns = new ArrayCollection();
               for each(column in schemaResult.tables[0].columns)
               {
                  if(!column.primaryKey)
                  {
                     existingColumns.addItem(column.name);
                  }
               }
               return existingColumns;
            }
         }
         catch(e:SQLError)
         {
         }
         return null;
      }
      
      public function setPrimaryKey(param1:String, param2:String, param3:String) : void
      {
         if(IDStrategy.UID == param2 || IDStrategy.ASSIGNED == param2)
         {
            this._pk = StringUtil.substitute("{0} {1} primary key",param1,param3);
         }
         else
         {
            this._pk = StringUtil.substitute("{0} integer primary key autoincrement",param1);
         }
         this._idColumn = param1;
         _changed = true;
      }
   }
}
