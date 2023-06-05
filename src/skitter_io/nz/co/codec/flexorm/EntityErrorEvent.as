package nz.co.codec.flexorm
{
   import flash.events.Event;
   
   public class EntityErrorEvent extends Event
   {
       
      
      private var _message:String;
      
      private var _error:Error;
      
      public function EntityErrorEvent(param1:String, param2:Error = null, param3:Boolean = false, param4:Boolean = false)
      {
         super("entityError",param3,param4);
         this._message = param1;
         this._error = param2;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function getStackTrace() : String
      {
         return !!this._error ? this._error.getStackTrace() : null;
      }
      
      override public function toString() : String
      {
         return !!this._message ? this._message : "unknown";
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function get error() : Error
      {
         return this._error;
      }
   }
}
