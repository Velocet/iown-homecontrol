package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   
   public class ConstraintInsertTriggerCommand extends SQLCommand
   {
       
      
      public function ConstraintInsertTriggerCommand(param1:SQLConnection, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int = 0)
      {
         super(param1,param2,param3,param7);
         _statement.text = StringUtil.substitute("create trigger fki_{1}_{2} before insert on {0}.{1} for each row begin select raise(rollback, \'insert on table \"{1}\" violates foreign key constraint \"fki_{1}_{2}\"\') where new.{2} is not null and new.{2}<>0 and (select t.{4} from {0}.{3} t where t.{4}=new.{2}) is null; end;",param2,param3,param4,param5,param6);
      }
      
      public function toString() : String
      {
         return "CREATE FK CONSTRAINT INSERT TRIGGER: undefined";
      }
   }
}
