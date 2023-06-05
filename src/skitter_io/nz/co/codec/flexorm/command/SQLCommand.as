package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import flash.data.SQLStatement;
   import flash.events.SQLErrorEvent;
   import flash.events.SQLEvent;
   import flash.utils.getQualifiedClassName;
   import mx.rpc.IResponder;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.EntityErrorEvent;
   import nz.co.codec.flexorm.EntityEvent;
   import nz.co.codec.flexorm.ICommand;
   import nz.co.codec.flexorm.criteria.EqualsCondition;
   import nz.co.codec.flexorm.criteria.IFilter;
   import nz.co.codec.flexorm.criteria.SQLCondition;
   
   public class SQLCommand implements ICommand
   {
       
      
      protected var _schema:String;
      
      protected var _responder:IResponder;
      
      protected var _sqlConnection:SQLConnection;
      
      protected var _table:String;
      
      protected var _debugLevel:int;
      
      protected var _changed:Boolean;
      
      protected var _columns:Object;
      
      protected var _statement:SQLStatement;
      
      protected var _responded:Boolean;
      
      protected var _filters:Array;
      
      public function SQLCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super();
         this._sqlConnection = param1;
         this._schema = param2;
         this._table = param3;
         this._debugLevel = param4;
         this._statement = new SQLStatement();
         this._statement.sqlConnection = param1;
         this._changed = true;
         this._responded = false;
         this._columns = {};
         this._filters = [];
      }
      
      public function get filters() : Array
      {
         return this._filters;
      }
      
      public function set responder(param1:IResponder) : void
      {
         this._responder = param1;
         this._statement.addEventListener(SQLEvent.RESULT,this.resultHandler);
         this._statement.addEventListener(SQLErrorEvent.ERROR,this.errorHandler);
      }
      
      protected function traceParam(param1:SQLStatement) : void
      {
         var _loc2_:* = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         for(_loc2_ in param1.parameters)
         {
            _loc3_ = param1.parameters[_loc2_];
            _loc4_ = 20 - _loc2_.length;
            while(_loc4_-- > 0)
            {
               _loc2_ += " ";
            }
            if(_loc3_ is String)
            {
               trace(StringUtil.substitute("_param {0}=\"{1}\"",_loc2_,_loc3_));
            }
            else
            {
               trace(StringUtil.substitute("_param {0}={1}",_loc2_,_loc3_));
            }
         }
         trace();
      }
      
      public function execute() : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(this._changed)
         {
            this.prepareStatement();
         }
         if(this._debugLevel > 0)
         {
            this.debug();
         }
         var _loc1_:String = "from main.device t0 inner join main.skitter t1 where";
         var _loc2_:int = int(this._statement.text.indexOf(_loc1_));
         if(_loc2_ >= 0)
         {
            _loc3_ = "from main.device t0 inner join main.skitter t1 on t0.id = t1.id where";
            _loc4_ = this._statement.text.substr(0,_loc2_) + _loc3_ + this._statement.text.substr(_loc2_ + _loc1_.length);
            this._statement.text = _loc4_;
         }
         this.traceParam(this._statement);
         this._statement.execute();
      }
      
      protected function respond(param1:SQLEvent) : void
      {
         this._responder.result(new EntityEvent(param1.type));
      }
      
      public function addFilterObject(param1:IFilter) : void
      {
         this._filters.push(param1);
      }
      
      public function get columns() : Object
      {
         return this._columns;
      }
      
      protected function errorHandler(param1:SQLErrorEvent) : void
      {
         trace(param1.error.details);
         this._responder.fault(new EntityErrorEvent(param1.error.details,param1.error));
      }
      
      public function addColumn(param1:String, param2:String = null, param3:String = null) : void
      {
         if(param2 == null)
         {
            this._columns[param1] = ":" + param1;
         }
         else if(param2.indexOf(":") == 0)
         {
            this._columns[param1] = param2;
         }
         else
         {
            this._columns[param1] = ":" + param2;
         }
         this._changed = true;
      }
      
      protected function prepareStatement() : void
      {
      }
      
      protected function set debugLevel(param1:int) : void
      {
         this._debugLevel = param1;
      }
      
      protected function debug() : void
      {
         trace(this);
      }
      
      protected function resultHandler(param1:SQLEvent) : void
      {
         this.respond(param1);
         this._responded = true;
      }
      
      public function addSQLCondition(param1:String) : void
      {
         if(param1)
         {
            this._filters.push(new SQLCondition(this._table,param1));
            this._changed = true;
            return;
         }
         throw new Error("Null argument supplied to " + getQualifiedClassName(this) + ".addSQLCondition ");
      }
      
      public function get responded() : Boolean
      {
         return this._responded;
      }
      
      public function addFilter(param1:String, param2:String, param3:String = null) : void
      {
         if(param3 == null)
         {
            if(this._table == null)
            {
               throw new Error("Unknown table: " + getQualifiedClassName(this));
            }
            param3 = this._table;
         }
         this.addEqualsCondition(param3,param1,param2);
      }
      
      public function set columns(param1:Object) : void
      {
         this._columns = param1;
         this._changed = true;
      }
      
      public function addEqualsCondition(param1:String, param2:String, param3:String) : void
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            this._filters.push(new EqualsCondition(param1,param2,param3));
            this._changed = true;
            return;
         }
         throw new Error("Null argument supplied to " + getQualifiedClassName(this) + ".addEqualsCondition ");
      }
      
      public function touch() : void
      {
         this._changed = true;
      }
   }
}
