package nz.co.codec.flexorm.criteria
{
   public class NullCondition extends Condition
   {
       
      
      public function NullCondition(param1:String, param2:String)
      {
         super(param1,param2);
      }
      
      override public function toString() : String
      {
         return column + " is null";
      }
   }
}
