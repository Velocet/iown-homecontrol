package com.scenarioLauncher.events
{
   import flash.events.Event;
   import ioService.datamodel.Device;
   
   public class UpgradeEvent extends Event
   {
      
      public static const SKITTER_SYNCHRONISE_AFTER_UPGRADE:String = "SkitterSynchroniseAfterUpgrade";
      
      public static const SKITTER_UPGRADE_FAILDED:String = "SkitterUpgradeFailed";
      
      public static const SKITTER_UPGRADE_PROGRESS:String = "SkitterUpgradeProgress";
      
      public static const SKITTER_UPGRADE_SUCCESSFULL:String = "SkitterUpgradeSuccessfull";
       
      
      public var progression:int = -1;
      
      public var device:Device = null;
      
      public function UpgradeEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
