package air.update.events
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   
   public class DownloadErrorEvent extends ErrorEvent
   {
      
      public static const DOWNLOAD_ERROR:String = "downloadError";
       
      
      public var subErrorID:int = 0;
      
      public function DownloadErrorEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = "", param5:int = 0, param6:int = 0)
      {
         super(param1,param2,param3,param4,param5);
         this.subErrorID = param6;
      }
      
      override public function toString() : String
      {
         return "[DownloadErrorEvent (type=" + type + " text=" + text + " id=" + errorID + " subErrorID=" + this.subErrorID + ")]";
      }
      
      override public function clone() : Event
      {
         return new DownloadErrorEvent(type,bubbles,cancelable,text,errorID,this.subErrorID);
      }
   }
}
