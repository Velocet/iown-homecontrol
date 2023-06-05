package nz.co.codec.flexorm.criteria
{
   import mx.utils.StringUtil;
   
   public class Sort extends Condition
   {
      
      public static const DESC:String = "desc";
      
      public static const ASC:String = "asc";
       
      
      private var _order:String;
      
      public function Sort(param1:String, param2:String, param3:String = null)
      {
         super(param1,param2);
         switch(param3)
         {
            case DESC:
               this._order = DESC;
               break;
            default:
               this._order = ASC;
         }
      }
      
      override public function toString() : String
      {
         return StringUtil.substitute("{0} {1}",column,this._order);
      }
   }
}
