package com.scenarioLauncher.managers
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.events.ActuatorEvent;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.views.RadioContolUI;
   import com.scenarioLauncher.views.ReinitializeSkittersUI;
   import com.scenarioLauncher.views.Remote1WHelpAdvancedUI;
   import com.scenarioLauncher.views.Remote1WHelpUI;
   import com.scenarioLauncher.views.Remote2WHelpAdvancedUI;
   import com.scenarioLauncher.views.Remote2WHelpUI;
   import com.scenarioLauncher.views.SynchronizeRemoteContolUI;
   import com.scenarioLauncher.views.UpdateUI;
   import com.scenarioLauncher.views.popup.MaintenanceConnexionPopup;
   import com.scenarioLauncher.views.popup.SkitterNotConnectedPopup;
   import com.scenarioLauncher.views.popup.SkitterSynchronisePopup;
   import com.scenarioLauncher.views.popup.TransferFailedPopup;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import ioService.datamodel.Actuator;
   import ioService.datamodel.Skitter;
   import ioService.debug.DebugConstants;
   import mx.core.Application;
   import mx.managers.PopUpManager;
   import mx.rpc.events.FaultEvent;
   
   public class DialogsManager
   {
      
      private static var remote2WHelpPopup:Remote2WHelpUI = new Remote2WHelpUI();
      
      private static var transferFailedPopup:TransferFailedPopup = new TransferFailedPopup();
      
      private static var timerDelay:Timer = new Timer(Globals.MIN_TIMER_SKITTER_PROGRESS);
      
      private static var skitterUpgradePopup:UpdateUI = new UpdateUI();
      
      private static var skitterSynchronisePopup:SkitterSynchronisePopup = new SkitterSynchronisePopup();
      
      private static var actuatorNameEvent:ActuatorEvent;
      
      private static var maintenanceConnexionPopup:MaintenanceConnexionPopup = new MaintenanceConnexionPopup();
      
      private static var radioInProgressPopup:RadioContolUI = new RadioContolUI();
      
      private static var synchronizeInProgressPopup:SynchronizeRemoteContolUI = new SynchronizeRemoteContolUI();
      
      private static var actuatorNameErrorEvent:FaultEvent;
      
      private static var skitterNotConnectedPopup:SkitterNotConnectedPopup;
      
      private static var remote1WHelpAdvancedPopup:Remote1WHelpAdvancedUI = new Remote1WHelpAdvancedUI();
      
      private static var remote2WHelpAdvancedPopup:Remote2WHelpAdvancedUI = new Remote2WHelpAdvancedUI();
      
      private static var remote1WHelpPopup:Remote1WHelpUI = new Remote1WHelpUI();
       
      
      public function DialogsManager()
      {
         super();
      }
      
      public static function hideRadioInProgressPopup(param1:ActuatorEvent = null) : void
      {
         actuatorNameEvent = param1;
         timerDelay.addEventListener(TimerEvent.TIMER,delayHideRadio);
      }
      
      public static function showRemote1WHelpPopup(param1:Function = null) : void
      {
         if(param1 != null)
         {
            remote1WHelpPopup.closureFunction = param1;
         }
         PopUpManager.addPopUp(remote1WHelpPopup,Application.application as DisplayObject,DebugConstants.MODAL_POP_UP);
         PopUpManager.bringToFront(remote1WHelpPopup);
      }
      
      public static function showRemote2WHelpPopup(param1:Function = null) : void
      {
         if(param1 != null)
         {
            remote2WHelpPopup.closureFunction = param1;
         }
         PopUpManager.addPopUp(remote2WHelpPopup,Application.application as DisplayObject,DebugConstants.MODAL_POP_UP);
         PopUpManager.bringToFront(remote2WHelpPopup);
      }
      
      public static function showRadioInProgressPopup(param1:Actuator) : void
      {
         timerDelay.start();
         radioInProgressPopup.actuator = param1;
         KCPopupManager.singleton.displayPopup(radioInProgressPopup);
      }
      
      public static function hideSynchronizeInProgressPopup(param1:TimerEvent = null) : void
      {
         timerDelay.addEventListener(TimerEvent.TIMER,delayHideSynchronize);
      }
      
      public static function showRemote1WHelpAdvancedPopup(param1:Function = null, param2:DisplayObject = null) : void
      {
         if(param1 != null)
         {
            remote1WHelpAdvancedPopup.closureFunction = param1;
         }
         remote1WHelpAdvancedPopup.popupToHide = param2;
         PopUpManager.addPopUp(remote1WHelpAdvancedPopup,Application.application as DisplayObject,DebugConstants.MODAL_POP_UP);
         PopUpManager.bringToFront(remote1WHelpAdvancedPopup);
         remote1WHelpAdvancedPopup.setFocus();
      }
      
      public static function showRemote2WHelpAdvancedPopup(param1:Function = null) : void
      {
         if(param1 != null)
         {
            remote2WHelpAdvancedPopup.closureFunction = param1;
         }
         PopUpManager.addPopUp(remote2WHelpAdvancedPopup,Application.application as DisplayObject,DebugConstants.MODAL_POP_UP);
         PopUpManager.bringToFront(remote2WHelpAdvancedPopup);
      }
      
      public static function showSkitterUpgradePopup(param1:Array) : void
      {
         skitterUpgradePopup.isSkitterUpgrade = true;
         skitterUpgradePopup.skittersToUpgrade = param1;
         KCPopupManager.singleton.displayPopup(skitterUpgradePopup);
      }
      
      public static function showSkitterNotConnectedPopup() : void
      {
         skitterNotConnectedPopup = new SkitterNotConnectedPopup();
         KCPopupManager.singleton.displayPopup(skitterNotConnectedPopup);
      }
      
      public static function showSkitterSynchronise(param1:Skitter, param2:Array = null) : void
      {
         skitterSynchronisePopup.skitterListToSynchronise = param2;
         skitterSynchronisePopup.remote = param1;
         KCPopupManager.singleton.displayPopup(skitterSynchronisePopup);
      }
      
      public static function showMaintenanceConnexionPopup(param1:Function) : void
      {
         maintenanceConnexionPopup.validateFunction = param1;
         maintenanceConnexionPopup.setFocus();
         KCPopupManager.singleton.displayPopup(maintenanceConnexionPopup);
      }
      
      public static function errorRadioInProgressPopup(param1:FaultEvent) : void
      {
         actuatorNameErrorEvent = param1;
         timerDelay.addEventListener(TimerEvent.TIMER,delayHideRadio);
      }
      
      public static function showSkitterReinitialisePopup(param1:Skitter, param2:Array = null, param3:Array = null, param4:Array = null) : void
      {
         var _loc5_:ReinitializeSkittersUI = null;
         Globals.SYNCHRO_LOCKED = true;
         (_loc5_ = new ReinitializeSkittersUI()).currentResettedSkitter = param1;
         _loc5_.skittersIncompatible = param2;
         _loc5_.skitterListToSynchronise = param3;
         _loc5_.skitterListToReinitialise = param4;
         KCPopupManager.singleton.displayPopup(_loc5_);
      }
      
      private static function delayHideRadio(param1:TimerEvent) : void
      {
         if(actuatorNameEvent != null)
         {
            ServerCommunicationManager.instance.dispatchEvent(actuatorNameEvent);
            actuatorNameEvent = null;
         }
         else if(actuatorNameErrorEvent != null)
         {
            ServerCommunicationManager.instance.dispatchEvent(actuatorNameErrorEvent);
            actuatorNameErrorEvent = null;
         }
         timerDelay.stop();
         timerDelay.reset();
      }
      
      public static function showTransferFailedPopup() : void
      {
         KCPopupManager.singleton.displayPopup(transferFailedPopup);
      }
      
      private static function delayHideSynchronize(param1:TimerEvent) : void
      {
         KCPopupManager.singleton.removePopup(synchronizeInProgressPopup);
         timerDelay.stop();
         timerDelay.reset();
      }
      
      public static function get isSkitterUpgradePopupDisplaying() : Boolean
      {
         return KCPopupManager.singleton.isPopupDisplaying(skitterUpgradePopup);
      }
      
      public static function showSynchronizeInProgressPopup() : void
      {
         timerDelay.start();
         KCPopupManager.singleton.displayPopup(synchronizeInProgressPopup);
      }
   }
}
