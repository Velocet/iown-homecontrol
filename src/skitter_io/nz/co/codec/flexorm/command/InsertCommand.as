package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import flash.events.SQLEvent;
   import mx.utils.ObjectUtil;
   import mx.utils.StringUtil;
   
   public class InsertCommand extends SQLParameterisedCommand
   {
       
      
      private var _lastInsertRowID:int;
      
      public function InsertCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      override protected function respond(param1:SQLEvent) : void
      {
         this._lastInsertRowID = _statement.getResult().lastInsertRowID;
         _responder.result(this._lastInsertRowID);
      }
      
      public function get lastInsertRowID() : int
      {
         return this._lastInsertRowID;
      }
      
      override protected function prepareStatement() : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc1_:* = StringUtil.substitute("insert into {0}.{1}(",_schema,_table);
         _loc2_ = ") values (";
         for(_loc3_ in _columns)
         {
            _loc1_ += StringUtil.substitute("{0},",_loc3_);
            _loc2_ += StringUtil.substitute("{0},",_columns[_loc3_]);
         }
         _loc1_ = _loc1_.substring(0,_loc1_.length - 1) + _loc2_.substring(0,_loc2_.length - 1) + ")";
         _statement.text = _loc1_;
         _changed = false;
         trace("SQL Insert command : " + _loc1_);
      }
      
      public function toString() : String
      {
         return "INSERT " + _table + ": " + _statement.text;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(_responder == null)
         {
            this._lastInsertRowID = _sqlConnection.lastInsertRowID;
         }
      }
      
      public function clone() : InsertCommand
      {
         var _loc1_:InsertCommand = new InsertCommand(_sqlConnection,_schema,_table,_debugLevel);
         _loc1_.columns = ObjectUtil.copy(_columns);
         return _loc1_;
      }
   }
}
