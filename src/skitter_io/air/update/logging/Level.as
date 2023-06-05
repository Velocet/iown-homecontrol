package air.update.logging
{
   public class Level
   {
      
      public static const ALL:int = int.MIN_VALUE;
      
      public static const WARNING:int = 900;
      
      public static const SEVERE:int = 1000;
      
      public static const INFO:int = 800;
      
      public static const OFF:int = int.MAX_VALUE;
      
      public static const CONFIG:int = 700;
      
      public static const FINER:int = 400;
      
      public static const FINE:int = 500;
      
      public static const FINEST:int = 300;
       
      
      public function Level()
      {
         super();
      }
      
      public static function getName(param1:int) : String
      {
         switch(param1)
         {
            case Level.ALL:
               return "ALL";
            case Level.FINEST:
               return "FINEST";
            case Level.FINER:
               return "FINER";
            case Level.FINE:
               return "FINE";
            case Level.CONFIG:
               return "CONFIG";
            case Level.INFO:
               return "INFO";
            case Level.WARNING:
               return "WARNING";
            case Level.SEVERE:
               return "SEVERE";
            case Level.OFF:
               return "OFF";
            default:
               return "";
         }
      }
   }
}
