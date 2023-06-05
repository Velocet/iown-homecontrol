package nz.co.codec.flexorm.criteria
{
   public class LikeCondition extends Condition
   {
       
      
      private var _str:String;
      
      public function LikeCondition(param1:String, param2:String, param3:String)
      {
         super(param1,param2);
         this._str = param3;
      }
      
      override public function toString() : String
      {
         return column + " like \'%" + this._str + "%\'";
      }
   }
}
