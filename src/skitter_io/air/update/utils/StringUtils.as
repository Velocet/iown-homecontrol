package air.update.utils
{
   public class StringUtils
   {
       
      
      public function StringUtils()
      {
         super();
      }
      
      public static function isDigit(param1:String) : Boolean
      {
         return param1 >= "0" && param1 <= "9";
      }
   }
}
