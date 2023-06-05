package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   
   public class ConstraintDeleteTriggerCommand extends SQLCommand
   {
       
      
      public function ConstraintDeleteTriggerCommand(param1:SQLConnection, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int = 0)
      {
         super(param1,param2,param3,param7);
         _statement.text = StringUtil.substitute("create trigger fkd_{1}_{2} before delete on {0}.{3} for each row begin select raise(rollback, \'delete on table \"{3}\" violates foreign key constraint \"fkd_{1}_{2}\"\') where (select t.{2} from {0}.{1} t where t.{2}=old.{4}) is not null; end;",param2,param3,param4,param5,param6);
      }
      
      public function toString() : String
      {
         return "CREATE FK CONSTRAINT DELETE TRIGGER: undefined";
      }
   }
}
