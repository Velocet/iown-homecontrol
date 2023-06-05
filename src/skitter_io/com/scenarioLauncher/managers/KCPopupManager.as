package com.scenarioLauncher.managers
{
   import flash.display.DisplayObject;
   import mx.collections.ArrayCollection;
   import mx.core.Application;
   import mx.core.UIComponent;
   import mx.managers.PopUpManager;
   
   public class KCPopupManager
   {
      
      private static var _singleton:com.scenarioLauncher.managers.KCPopupManager;
       
      
      private var popupList:ArrayCollection;
      
      public function KCPopupManager(param1:Class)
      {
         this.popupList = new ArrayCollection();
         super();
         if(param1 != SingletonLock)
         {
            throw new Error("Invalid Singleton access.  Use DebugPreferences.instance.");
         }
      }
      
      public static function get singleton() : com.scenarioLauncher.managers.KCPopupManager
      {
         if(_singleton == null)
         {
            _singleton = new com.scenarioLauncher.managers.KCPopupManager(SingletonLock);
         }
         return _singleton;
      }
      
      public function isPopupDisplaying(param1:UIComponent) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:Boolean = false;
         for each(_loc3_ in this.popupList)
         {
            if(_loc3_.popup == param1)
            {
               _loc2_ = true;
               break;
            }
         }
         return _loc2_;
      }
      
      public function removePopup(param1:UIComponent) : void
      {
         var _loc2_:* = null;
         PopUpManager.removePopUp(param1);
         if(this.popupList.length > 0)
         {
            for each(_loc2_ in this.popupList)
            {
               if(_loc2_.popup == param1)
               {
                  this.popupList.removeItemAt(this.popupList.getItemIndex(_loc2_));
               }
            }
         }
      }
      
      public function displayPopup(param1:UIComponent, param2:int = 50, param3:Boolean = true) : void
      {
         var _loc4_:KCPopupManagerItem;
         (_loc4_ = new KCPopupManagerItem()).popup = param1;
         _loc4_.level = param2;
         this.handlePopupPriority(_loc4_);
         if(this.popupList.length == 0)
         {
            PopUpManager.addPopUp(param1,Application.application as DisplayObject,param3);
            PopUpManager.bringToFront(param1);
            param1.setFocus();
            this.popupList.addItem(_loc4_);
         }
      }
      
      private function handlePopupPriority(param1:KCPopupManagerItem) : void
      {
         var _loc3_:* = null;
         var _loc2_:ArrayCollection = new ArrayCollection();
         if(this.popupList.length > 0)
         {
            for each(_loc3_ in this.popupList)
            {
               if(param1.level <= _loc3_.level)
               {
                  this.removePopup(_loc3_.popup);
               }
            }
         }
      }
   }
}

class SingletonLock
{
    
   
   public function SingletonLock()
   {
      super();
   }
}
