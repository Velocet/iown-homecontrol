package com.scenarioLauncher.business
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.model.Globals;
   import flash.events.EventDispatcher;
   import ioService.datamodel.Skitter;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class SkitterManager extends EventDispatcher
   {
      
      private static var _instance:com.scenarioLauncher.business.SkitterManager = null;
       
      
      private var _1969267332skitterList:ArrayCollection;
      
      private var _skitterConnectionAllowed:Boolean = true;
      
      public function SkitterManager()
      {
         this._1969267332skitterList = new ArrayCollection();
         super();
      }
      
      public static function get instance() : com.scenarioLauncher.business.SkitterManager
      {
         if(_instance == null)
         {
            _instance = new com.scenarioLauncher.business.SkitterManager();
         }
         return _instance;
      }
      
      public function connectionProcessing() : void
      {
         var _loc1_:Skitter = null;
         if(this.skitterList.length > 0 && this.skitterConnectionAllowed)
         {
            _loc1_ = this.skitterList.getItemAt(this.skitterList.length - 1) as Skitter;
            this.skitterList.removeItemAt(this.skitterList.length - 1);
            ServerCommunicationManager.instance.plugSkitter(_loc1_);
         }
         else if(true)
         {
            this.skitterConnectionAllowed = true;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skitterList() : ArrayCollection
      {
         return this._1969267332skitterList;
      }
      
      public function addSkitterToPlug(param1:Skitter) : void
      {
         this.skitterList.addItem(param1);
         KCTimeAnalyzer.Tracer("addSkitterToPlug : " + param1.name,0);
      }
      
      public function set skitterConnectionAllowed(param1:Boolean) : void
      {
         this._skitterConnectionAllowed = param1;
      }
      
      public function get skitterConnectionAllowed() : Boolean
      {
         return this._skitterConnectionAllowed;
      }
      
      public function set skitterList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1969267332skitterList;
         if(_loc2_ !== param1)
         {
            this._1969267332skitterList = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skitterList",_loc2_,param1));
         }
      }
   }
}
