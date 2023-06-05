package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.ObjectUtil;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.criteria.IFilter;
   
   public class UpdateCommand extends SQLParameterisedCommand
   {
       
      
      private var _syncSupport:Boolean;
      
      public function UpdateCommand(param1:SQLConnection, param2:String, param3:String, param4:Boolean = false, param5:int = 0)
      {
         super(param1,param2,param3,param5);
         this._syncSupport = param4;
      }
      
      override protected function prepareStatement() : void
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         var _loc1_:* = StringUtil.substitute("update {0}.{1} set ",_schema,_table);
         for(_loc2_ in _columns)
         {
            _loc1_ += StringUtil.substitute("{0}={1},",_loc2_,_columns[_loc2_]);
         }
         if(this._syncSupport && !_columns.hasOwnProperty("version"))
         {
            _loc1_ += "version=version+1";
         }
         else
         {
            _loc1_ = _loc1_.substring(0,_loc1_.length - 1);
         }
         if(_filters)
         {
            _loc1_ += " where ";
            for each(_loc3_ in _filters)
            {
               _loc1_ += StringUtil.substitute("{0} and ",_loc3_);
            }
            _loc1_ = _loc1_.substring(0,_loc1_.length - 5);
         }
         _statement.text = _loc1_;
         _changed = false;
         trace("sql = " + _loc1_);
      }
      
      public function clone() : UpdateCommand
      {
         var _loc1_:UpdateCommand = new UpdateCommand(_sqlConnection,_schema,_table,this._syncSupport,_debugLevel);
         _loc1_.columns = ObjectUtil.copy(_columns);
         _loc1_._filters = _filters.concat();
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "UPDATE " + _table + ": " + _statement.text;
      }
   }
}
