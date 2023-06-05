package nz.co.codec.flexorm.criteria
{
   public class ParameterisedCondition extends Condition
   {
       
      
      private var _param:String;
      
      public function ParameterisedCondition(param1:String, param2:String, param3:String)
      {
         super(param1,param2);
         this._param = param3;
      }
      
      override public function toString() : String
      {
         return null;
      }
      
      public function get param() : String
      {
         return this._param;
      }
   }
}
