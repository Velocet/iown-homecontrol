package com.scenarioLauncher.events
{
   import flash.events.Event;
   import flash.geom.Point;
   import ioService.datamodel.Skitter;
   
   public class RemoteEvent extends Event
   {
      
      public static const REMOTE_CONTROL_EDITION_CLICK:String = "remoteEditionClick";
      
      public static const REMOTE_CONTROL_CLICK:String = "remoteClick";
       
      
      public var position:Point;
      
      public var skitterControl:Skitter;
      
      public function RemoteEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new RemoteEvent(type,bubbles,cancelable);
      }
   }
}
