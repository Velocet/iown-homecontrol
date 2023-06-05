package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.criteria.IFilter;
   
   public class DeleteCommand extends SQLParameterisedCommand
   {
       
      
      public function DeleteCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      override protected function prepareStatement() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = StringUtil.substitute("delete from {0}.{1}",_schema,_table);
         if(_filters)
         {
            _loc1_ += " where ";
            for each(_loc2_ in _filters)
            {
               _loc1_ += StringUtil.substitute("{0} and ",_loc2_);
            }
            _loc1_ = _loc1_.substring(0,_loc1_.length - 5);
         }
         _statement.text = _loc1_;
         _changed = false;
      }
      
      public function toString() : String
      {
         return "DELETE " + _table + ": " + _statement.text;
      }
   }
}
