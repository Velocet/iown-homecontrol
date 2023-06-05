package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class FlexEvent extends Event
   {
      
      public static const ADD:String = "add";
      
      public static const TRANSFORM_CHANGE:String = "transformChange";
      
      public static const ENTER_FRAME:String = "flexEventEnterFrame";
      
      public static const INIT_COMPLETE:String = "initComplete";
      
      public static const REMOVE:String = "remove";
      
      public static const BUTTON_DOWN:String = "buttonDown";
      
      public static const EXIT_STATE:String = "exitState";
      
      public static const CREATION_COMPLETE:String = "creationComplete";
      
      public static const REPEAT:String = "repeat";
      
      public static const LOADING:String = "loading";
      
      public static const RENDER:String = "flexEventRender";
      
      public static const REPEAT_START:String = "repeatStart";
      
      public static const INITIALIZE:String = "initialize";
      
      public static const ENTER_STATE:String = "enterState";
      
      public static const URL_CHANGED:String = "urlChanged";
      
      public static const REPEAT_END:String = "repeatEnd";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const HIDE:String = "hide";
      
      public static const ENTER:String = "enter";
      
      public static const PRELOADER_DONE:String = "preloaderDone";
      
      public static const CURSOR_UPDATE:String = "cursorUpdate";
      
      public static const PREINITIALIZE:String = "preinitialize";
      
      public static const INVALID:String = "invalid";
      
      public static const IDLE:String = "idle";
      
      public static const VALID:String = "valid";
      
      public static const DATA_CHANGE:String = "dataChange";
      
      public static const APPLICATION_COMPLETE:String = "applicationComplete";
      
      public static const VALUE_COMMIT:String = "valueCommit";
      
      public static const UPDATE_COMPLETE:String = "updateComplete";
      
      public static const INIT_PROGRESS:String = "initProgress";
      
      public static const SHOW:String = "show";
       
      
      public function FlexEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new FlexEvent(type,bubbles,cancelable);
      }
   }
}
