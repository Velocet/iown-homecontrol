package com.keepcore
{
   import flash.events.Event;
   
   public class KCAirUpdaterEvent extends Event
   {
      
      public static const DOWNLOAD_COMPLETE:String = "downloadComplete";
      
      public static const NO_UPDATE_AVAILABLE:String = "noUpdateAvailable";
      
      public static const ERROR_OCCURED:String = "errorOccured";
      
      public static const READY_TO_DOWNLOAD_UPDATE:String = "readyToDownloadUpdate";
       
      
      private var _currentVersion:String;
      
      private var _error:String;
      
      private var _newVersion:String;
      
      private var _releaseNotes:String;
      
      private var _applicationName:String;
      
      public function KCAirUpdaterEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         super.clone();
         var _loc1_:KCAirUpdaterEvent = new KCAirUpdaterEvent(type,bubbles,cancelable);
         _loc1_.currentVersion = this._currentVersion;
         _loc1_.newVersion = this._newVersion;
         _loc1_.applicationName = this._applicationName;
         _loc1_.error = this._error;
         return _loc1_;
      }
      
      public function get currentVersion() : String
      {
         return this._currentVersion;
      }
      
      public function get error() : String
      {
         return this._error;
      }
      
      public function set newVersion(param1:String) : void
      {
         this._newVersion = param1;
      }
      
      public function set releaseNotes(param1:String) : void
      {
         this._releaseNotes = param1;
      }
      
      public function set applicationName(param1:String) : void
      {
         this._applicationName = param1;
      }
      
      public function get newVersion() : String
      {
         return this._newVersion;
      }
      
      public function get releaseNotes() : String
      {
         return this._releaseNotes;
      }
      
      public function get applicationName() : String
      {
         return this._applicationName;
      }
      
      public function set error(param1:String) : void
      {
         this._error = param1;
      }
      
      public function set currentVersion(param1:String) : void
      {
         this._currentVersion = param1;
      }
   }
}
