package com.scenarioLauncher.managers
{
   import mx.core.UIComponent;
   
   public class KCPopupManagerItem
   {
       
      
      private var _level:int;
      
      private var _popup:UIComponent;
      
      public function KCPopupManagerItem()
      {
         super();
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set popup(param1:UIComponent) : void
      {
         this._popup = param1;
      }
      
      public function get popup() : UIComponent
      {
         return this._popup;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
      }
   }
}
