package air.update.utils
{
   public class NetUtils
   {
      
      public static const ACCEPTABLE_STATUSES:Array = [0,200];
       
      
      public function NetUtils()
      {
         super();
      }
      
      public static function isHTTPStatusAcceptable(param1:int) : Boolean
      {
         if(ACCEPTABLE_STATUSES.indexOf(param1) == -1)
         {
            return false;
         }
         return true;
      }
   }
}
