package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import flash.events.SQLEvent;
   import flash.utils.getQualifiedClassName;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.NamedQuery;
   import nz.co.codec.flexorm.criteria.Criteria;
   import nz.co.codec.flexorm.criteria.ICondition;
   import nz.co.codec.flexorm.criteria.IFilter;
   import nz.co.codec.flexorm.criteria.Junction;
   import nz.co.codec.flexorm.criteria.Sort;
   
   public class SelectCommand extends SQLParameterisedCommand
   {
       
      
      private var _joins:Object;
      
      private var _sorts:Array;
      
      private var _result:Array;
      
      public function SelectCommand(param1:SQLConnection, param2:String, param3:String = null, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         this._joins = {};
         this._sorts = [];
      }
      
      public function get result() : Array
      {
         return this._result;
      }
      
      public function setCriteria(param1:Criteria) : void
      {
         var _loc3_:String = null;
         _filters = param1.filters;
         this._sorts = param1.sorts;
         var _loc2_:Object = param1.params;
         for(_loc3_ in _loc2_)
         {
            setParam(_loc3_,_loc2_[_loc3_]);
         }
         _changed = true;
      }
      
      public function mergeFilters(param1:Array) : void
      {
         _filters = _filters.concat(param1);
      }
      
      public function mergeSorts(param1:Array) : void
      {
         this._sorts = this._sorts.concat(param1);
      }
      
      public function mergeColumns(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         for(_loc2_ in param1)
         {
            for(_loc3_ in param1[_loc2_])
            {
               this.addColumn(_loc3_,param1[_loc2_][_loc3_],_loc2_);
            }
         }
      }
      
      override protected function prepareStatement() : void
      {
         var tables:Array = null;
         var table:String = null;
         var tabl:String = null;
         var len:int = 0;
         var column:String = null;
         var fk:String = null;
         var filter:IFilter = null;
         var namedQuery:NamedQuery = null;
         var sort:Sort = null;
         var sql:String = "select ";
         tables = [];
         var i:int = 0;
         var columnsAdded:Boolean = false;
         for(table in _columns)
         {
            tables.push(table);
            for(column in _columns[table])
            {
               sql += StringUtil.substitute("t{0}.{1},",i,column);
            }
            i++;
            columnsAdded = true;
         }
         if(columnsAdded)
         {
            sql = sql.substring(0,sql.length - 1);
         }
         else
         {
            sql += "*";
            tables.push(_table);
         }
         sql += " from ";
         for(tabl in this._joins)
         {
            if(tables.indexOf(tabl) == -1)
            {
               tables.push(tabl);
            }
         }
         len = int(tables.length);
         i = 0;
         while(i < len)
         {
            sql += StringUtil.substitute("{0}.{1} t{2}",_schema,tables[i],i);
            if(i > 0)
            {
               for(fk in this._joins[tables[i]])
               {
                  sql += StringUtil.substitute(" on t{0}.{1}=t{2}.{3} and ",i - 1,this._joins[tables[i]][fk],i,fk);
               }
            }
            if(i < len - 1)
            {
               sql += " inner join ";
            }
            i++;
         }
         if(len > 1 && sql.substr(sql.length - 5) == " and ")
         {
            sql = sql.substring(0,sql.length - 5);
         }
         if(false)
         {
            sql += " where ";
            for each(filter in _filters)
            {
               if(filter is Junction)
               {
                  sql += StringUtil.substitute("{0} and ",Junction(filter).getString(function(param1:String):int
                  {
                     return tables.indexOf(param1);
                  }));
               }
               else if(filter is NamedQuery)
               {
                  namedQuery = filter as NamedQuery;
                  sql += StringUtil.substitute(namedQuery.clause,namedQuery.executionParameters) + " and ";
               }
               else
               {
                  sql += StringUtil.substitute("t{0}.{1} and ",tables.indexOf(ICondition(filter).table),filter);
               }
            }
            sql = sql.substring(0,sql.length - 5);
         }
         if(this._sorts.length > 0)
         {
            sql += " order by ";
            for each(sort in this._sorts)
            {
               sql += StringUtil.substitute("t{0}.{1} and ",tables.indexOf(ICondition(sort).table),sort);
            }
            sql = sql.substring(0,sql.length - 5);
         }
         _statement.text = sql;
         _changed = false;
         trace("sql = " + sql);
      }
      
      public function addJoin(param1:String, param2:String, param3:String) : void
      {
         if(this._joins[param1] == null)
         {
            this._joins[param1] = {};
         }
         this._joins[param1][param3] = param2;
         _changed = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         super.execute();
         if(_responder == null)
         {
            this._result = _statement.getResult().data;
         }
         if(this._result)
         {
            _loc1_ = int(this._result.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = "";
               for(_loc4_ in this._result[_loc2_])
               {
                  _loc3_ += _loc4_ + ": " + this._result[_loc2_][_loc4_] + "; ";
               }
               trace("row[" + _loc2_.toString() + "]\t",_loc3_);
               _loc2_++;
            }
         }
      }
      
      override protected function respond(param1:SQLEvent) : void
      {
         this._result = _statement.getResult().data;
         _responder.result(this._result);
      }
      
      public function mergeJoins(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         for(_loc2_ in param1)
         {
            for(_loc3_ in param1[_loc2_])
            {
               this.addJoin(_loc2_,param1[_loc2_][_loc3_],_loc3_);
            }
         }
      }
      
      public function set joins(param1:Object) : void
      {
         this._joins = param1;
         _changed = true;
      }
      
      public function get sorts() : Array
      {
         return this._sorts;
      }
      
      override public function addColumn(param1:String, param2:String = null, param3:String = null) : void
      {
         if(param3 == null)
         {
            if(_table == null)
            {
               throw new Error("Unknown table: " + getQualifiedClassName(this));
            }
            param3 = _table;
         }
         if(true)
         {
            _columns[param3] = {};
         }
         if(param2 == null)
         {
            _columns[param3][param1] = ":" + param1;
         }
         else if(param2.indexOf(":") == 0)
         {
            _columns[param3][param1] = param2;
         }
         else
         {
            _columns[param3][param1] = ":" + param2;
         }
         _changed = true;
      }
      
      public function toString() : String
      {
         return "SELECT undefined";
      }
      
      public function clone() : SelectCommand
      {
         var _loc1_:SelectCommand = new SelectCommand(_sqlConnection,_schema,_table,_debugLevel);
         _loc1_.mergeColumns(_columns);
         _loc1_.mergeJoins(this._joins);
         _loc1_._filters = _filters.concat();
         _loc1_._sorts = this._sorts.concat();
         return _loc1_;
      }
      
      public function addSort(param1:String, param2:String = null, param3:String = null) : void
      {
         if(param1)
         {
            if(param3 == null)
            {
               if(_table == null)
               {
                  throw new Error("Unknown table: " + getQualifiedClassName(this));
               }
               param3 = _table;
            }
            this._sorts.push(new Sort(param3,param1,!!param2 ? param2 : Sort.ASC));
            _changed = true;
         }
      }
   }
}
