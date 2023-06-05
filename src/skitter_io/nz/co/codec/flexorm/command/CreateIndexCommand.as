package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   
   public class CreateIndexCommand extends SQLCommand
   {
       
      
      private var _name:String;
      
      private var indexColumns:Array;
      
      public function CreateIndexCommand(param1:SQLConnection, param2:String, param3:String, param4:String, param5:int = 0)
      {
         super(param1,param2,param3,param5);
         this._name = param4;
         this.indexColumns = [];
      }
      
      public function addIndex(param1:String) : void
      {
         this.indexColumns.push(param1);
         _changed = true;
      }
      
      override protected function prepareStatement() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         _loc1_ = StringUtil.substitute("create index if not exists {0}.{1}_{2}_idx on {3}(",_schema,!!this._name ? this._name : _table,this.indexColumns[0],_table);
         for each(_loc2_ in this.indexColumns)
         {
            _loc1_ += StringUtil.substitute("{0} asc,",_loc2_);
         }
         _loc1_ = _loc1_.substr(0,_loc1_.length - 1) + ")";
         _statement.text = _loc1_;
         _changed = false;
      }
      
      public function toString() : String
      {
         return "INDEX: undefined";
      }
   }
}
