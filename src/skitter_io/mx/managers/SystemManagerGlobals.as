package mx.managers
{
   public class SystemManagerGlobals
   {
      
      public static var topLevelSystemManagers:Array = [];
      
      public static var changingListenersInOtherSystemManagers:Boolean;
      
      public static var bootstrapLoaderInfoURL:String;
      
      public static var showMouseCursor:Boolean;
      
      public static var dispatchingEventToOtherSystemManagers:Boolean;
       
      
      public function SystemManagerGlobals()
      {
         super();
      }
   }
}
