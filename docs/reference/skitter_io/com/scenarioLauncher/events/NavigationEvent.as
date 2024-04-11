package com.scenarioLauncher.events
{
   import flash.events.Event;
   
   public class NavigationEvent extends Event
   {
      
      public static const NAVIGATE_TO_MYSPACE:String = "navigate_to_myspace";
      
      public static const NAVIGATE_TO_QUESTIONS:String = "navigate_to_questions";
       
      
      public function NavigationEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
