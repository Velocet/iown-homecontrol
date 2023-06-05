package com.greensock.events
{
   import flash.events.Event;
   
   public class TweenEvent extends Event
   {
      
      public static const COMPLETE:String = "complete";
      
      public static const START:String = "start";
      
      public static const UPDATE:String = "change";
      
      public static const REVERSE_COMPLETE:String = "reverseComplete";
      
      public static const INIT:String = "init";
      
      public static const VERSION:Number = 1.1;
      
      public static const REPEAT:String = "repeat";
       
      
      public function TweenEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new TweenEvent(this.type,this.bubbles,this.cancelable);
      }
   }
}
