package air.update.states
{
   public class UpdateState
   {
      
      public static const CHECKING:int = 4;
      
      private static const STATES:Array = ["UNINITIALIZED","INITIALIZING","READY","BEFORE_CHECKING","CHECKING","AVAILABLE","DOWNLOADING","DOWNLOADED","INSTALLING","PENDING_INSTALLING"];
      
      public static const READY:int = 2;
      
      public static const DOWNLOADED:int = 7;
      
      public static const INITIALIZING:int = 1;
      
      public static const PENDING_INSTALLING:int = 9;
      
      public static const AVAILABLE:int = 5;
      
      public static const BEFORE_CHECKING:int = 3;
      
      public static const UNINITIALIZED:int = 0;
      
      public static const DOWNLOADING:int = 6;
      
      public static const INSTALLING:int = 8;
       
      
      public function UpdateState()
      {
         super();
      }
      
      public static function getStateName(param1:int) : String
      {
         if(param1 >= 0 && param1 < STATES.length)
         {
            return STATES[param1];
         }
         return "INVALID_STATE: " + param1;
      }
   }
}
