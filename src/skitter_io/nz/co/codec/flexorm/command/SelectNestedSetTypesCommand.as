package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import flash.events.SQLEvent;
   
   public class SelectNestedSetTypesCommand extends SQLParameterisedCommand
   {
       
      
      private var _result:Array;
      
      public function SelectNestedSetTypesCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         _statement.text = "select distinct entity_type from " + param2 + "." + param3 + " where lft>:lft and rgt<:rgt order by lft";
      }
      
      override public function execute() : void
      {
         super.execute();
         if(_responder == null)
         {
            this._result = _statement.getResult().data;
         }
      }
      
      override protected function respond(param1:SQLEvent) : void
      {
         this._result = _statement.getResult().data;
         _responder.result(this._result);
      }
      
      public function toString() : String
      {
         return "SELECT NESTED SET TYPES: undefined";
      }
      
      public function get result() : Array
      {
         return this._result;
      }
   }
}
