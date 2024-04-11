package com.scenarioLauncher.events
{
   import com.scenarioLauncher.datamodel.HelpQuestion;
   import com.scenarioLauncher.datamodel.HelpTopic;
   import flash.events.Event;
   
   public class HelpReaderEvent extends Event
   {
      
      public static const HELP_ITEM_OPEN:String = "help_item_open";
      
      public static const HELP_ITEM_SELECTED:String = "help_item_selected";
      
      public static const HELP_ITEM_CLOSED:String = "help_item_closed";
      
      public static const HELP_ITEMS_REFRESH:String = "help_items_refresh";
       
      
      public var helpTopic:HelpTopic = null;
      
      public var helpQuestion:HelpQuestion = null;
      
      public function HelpReaderEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:HelpReaderEvent = new HelpReaderEvent(type,bubbles,cancelable);
         _loc1_.helpQuestion = this.helpQuestion;
         _loc1_.helpTopic = this.helpTopic;
         return _loc1_;
      }
   }
}
