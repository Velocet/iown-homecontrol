package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import flash.events.SQLEvent;
   
   public class SelectMaxRgtCommand extends SQLCommand
   {
       
      
      private var _result:Array;
      
      public function SelectMaxRgtCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         _statement.text = "select max(rgt) as max_rgt from " + param2 + "." + param3;
      }
      
      public function getMaxRgt() : int
      {
         return Boolean(this._result) && this._result.length > 0 ? int(this._result[0].max_rgt) : 0;
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
         return "SELECT MAX RGT: undefined";
      }
      
      public function get result() : Array
      {
         return this._result;
      }
   }
}
