package air.update.events
{
   import flash.events.Event;
   
   public class UpdateEvent extends Event
   {
      
      public static const DOWNLOAD_COMPLETE:String = "downloadComplete";
      
      public static const INITIALIZED:String = "initialized";
      
      public static const CHECK_FOR_UPDATE:String = "checkForUpdate";
      
      public static const DOWNLOAD_START:String = "downloadStart";
      
      public static const BEFORE_INSTALL:String = "beforeInstall";
       
      
      public function UpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function toString() : String
      {
         return "[UpdateEvent (type=" + type + ")]";
      }
      
      override public function clone() : Event
      {
         return new UpdateEvent(type,bubbles,cancelable);
      }
   }
}
