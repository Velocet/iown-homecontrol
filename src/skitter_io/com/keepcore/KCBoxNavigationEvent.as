package com.keepcore
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class KCBoxNavigationEvent extends Event
   {
      
      public static const SCROLL_END:String = "kcBoxNavigationScrollEnd";
      
      public static const SCROLL_NEXT:String = "kcBoxNavigationScrollNext";
      
      public static const SCROLL_BEGIN:String = "kcBoxNavigationScrollBegin";
      
      public static const SCROLL_PREVIOUS:String = "kcBoxNavigationScrollPrevious";
      
      public static const ITEM_CLICK:String = "itemClick";
       
      
      public var scrollOffset:Number;
      
      public var item:Object;
      
      public var uiTarget:Object;
      
      public var itemPosition:Point;
      
      public function KCBoxNavigationEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new KCBoxNavigationEvent(type,bubbles,cancelable);
      }
   }
}
