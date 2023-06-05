package air.update.logging
{
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.Dictionary;
   
   public class Logger
   {
      
      private static var loggers:Dictionary = new Dictionary();
      
      private static var _level:int = Level.OFF;
       
      
      private var name:String = "";
      
      public function Logger(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public static function get level() : int
      {
         return _level;
      }
      
      public static function getLogger(param1:String) : Logger
      {
         if(true)
         {
            return new Logger(param1);
         }
         return loggers[param1];
      }
      
      public static function set level(param1:int) : void
      {
         _level = param1;
      }
      
      public function config(... rest) : void
      {
         this.log(Level.CONFIG,rest);
      }
      
      public function log(param1:int, ... rest) : void
      {
         var s:String;
         var file:File = null;
         var fs:FileStream = null;
         var logLevel:int = param1;
         var arguments:Array = rest;
         if(!this.isLoggable(logLevel))
         {
            return;
         }
         s = this.format(logLevel,arguments);
         trace(s);
         try
         {
            file = new File(File.documentsDirectory.nativePath + "/../.airappupdater.log");
            if(file.exists)
            {
               fs = new FileStream();
               fs.open(file,FileMode.APPEND);
               fs.writeUTFBytes(s + "\n");
               fs.close();
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function isLoggable(param1:int) : Boolean
      {
         return param1 >= level;
      }
      
      public function info(... rest) : void
      {
         this.log(Level.INFO,rest);
      }
      
      public function severe(... rest) : void
      {
         this.log(Level.SEVERE,rest);
      }
      
      private function format(param1:int, ... rest) : String
      {
         var _loc3_:Date = new Date();
         var _loc4_:String = _loc3_.fullYear + "/" + _loc3_.month + "/" + _loc3_.day + " " + _loc3_.hours + ":" + _loc3_.minutes + ":" + _loc3_.seconds + "." + _loc3_.milliseconds;
         var _loc5_:* = _loc3_ + " | " + this.name + " | [" + Level.getName(param1) + "] ";
         if(rest == null)
         {
            return _loc5_;
         }
         var _loc6_:int = 0;
         while(_loc6_ < rest.length)
         {
            _loc5_ += (_loc6_ > 0 ? "," : "") + (rest[_loc6_] != null ? rest[_loc6_].toString() : "null");
            _loc6_++;
         }
         return _loc5_;
      }
      
      public function finer(... rest) : void
      {
         this.log(Level.FINER,rest);
      }
      
      public function fine(... rest) : void
      {
         this.log(Level.FINE,rest);
      }
      
      public function finest(... rest) : void
      {
         this.log(Level.FINEST,rest);
      }
      
      public function warning(... rest) : void
      {
         this.log(Level.WARNING,rest);
      }
   }
}
