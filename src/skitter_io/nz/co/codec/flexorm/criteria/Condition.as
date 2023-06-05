package nz.co.codec.flexorm.criteria
{
   public class Condition implements ICondition
   {
       
      
      private var _column:String;
      
      private var _table:String;
      
      public function Condition(param1:String, param2:String)
      {
         super();
         this._table = param1;
         this._column = param2;
      }
      
      protected function get column() : String
      {
         return this._column;
      }
      
      public function toString() : String
      {
         return null;
      }
      
      public function get table() : String
      {
         return this._table;
      }
   }
}
