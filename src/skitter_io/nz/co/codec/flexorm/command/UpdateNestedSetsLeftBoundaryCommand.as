package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   
   public class UpdateNestedSetsLeftBoundaryCommand extends SQLParameterisedCommand
   {
       
      
      public function UpdateNestedSetsLeftBoundaryCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         _statement.text = StringUtil.substitute("update {0}.{1} set lft=lft+:inc where lft>=:lft",param2,param3);
      }
      
      public function toString() : String
      {
         return "UPDATE NESTED SETS LEFT BOUNDARY " + _table + ": " + _statement.text;
      }
   }
}
