package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class BrowserChangeEvent extends Event
   {
      
      public static const BROWSER_URL_CHANGE:String = "browserURLChange";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const URL_CHANGE:String = "urlChange";
      
      public static const APPLICATION_URL_CHANGE:String = "applicationURLChange";
       
      
      public var lastURL:String;
      
      public var url:String;
      
      public function BrowserChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:String = null)
      {
         super(param1,param2,param3);
         this.url = param4;
         this.lastURL = param5;
      }
      
      override public function clone() : Event
      {
         return new BrowserChangeEvent(type,bubbles,cancelable,url,lastURL);
      }
   }
}
