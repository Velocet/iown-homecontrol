package nz.co.codec.flexorm.criteria
{
   public class NotNullCondition extends Condition
   {
       
      
      public function NotNullCondition(param1:String, param2:String)
      {
         super(param1,param2);
      }
      
      override public function toString() : String
      {
         return column + " is not null";
      }
   }
}
