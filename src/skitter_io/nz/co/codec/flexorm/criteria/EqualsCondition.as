package nz.co.codec.flexorm.criteria
{
   public class EqualsCondition extends ParameterisedCondition
   {
       
      
      public function EqualsCondition(param1:String, param2:String, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override public function toString() : String
      {
         return column + "=:" + param;
      }
   }
}
