package nz.co.codec.flexorm.criteria
{
   public class SQLCondition implements ICondition
   {
       
      
      private var _table:String;
      
      private var _sql:String;
      
      public function SQLCondition(param1:String, param2:String)
      {
         super();
         this._table = param1;
         this._sql = param2;
      }
      
      public function toString() : String
      {
         return this._sql;
      }
      
      public function get table() : String
      {
         return this._table;
      }
   }
}
