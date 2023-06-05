package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   
   public class UpdateNestedSetsCommand extends SQLParameterisedCommand
   {
       
      
      public function UpdateNestedSetsCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         _statement.text = StringUtil.substitute("update {0}.{1} set lft=lft+:inc,rgt=rgt+:inc where lft>:lft and rgt<:rgt",param2,param3);
      }
      
      public function toString() : String
      {
         return "UPDATE NESTED SETS " + _table + ": " + _statement.text;
      }
   }
}
