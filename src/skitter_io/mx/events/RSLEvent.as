package mx.events
{
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import mx.core.mx_internal;
   
   public class RSLEvent extends ProgressEvent
   {
      
      public static const RSL_PROGRESS:String = "rslProgress";
      
      public static const RSL_ERROR:String = "rslError";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const RSL_COMPLETE:String = "rslComplete";
       
      
      public var loaderInfo:LoaderInfo;
      
      public var errorText:String;
      
      public var rslIndex:int;
      
      public var rslTotal:int;
      
      public var url:URLRequest;
      
      public function RSLEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:int = -1, param7:int = -1, param8:URLRequest = null, param9:String = null)
      {
         super(param1,param2,param3,param4,param5);
         this.rslIndex = param6;
         this.rslTotal = param7;
         this.url = param8;
         this.errorText = param9;
      }
      
      override public function clone() : Event
      {
         return new RSLEvent(type,bubbles,cancelable,bytesLoaded,bytesTotal,rslIndex,rslTotal,url,errorText);
      }
   }
}
