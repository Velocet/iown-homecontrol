package ioService.debug
{
   import flash.net.Socket;
   import flash.system.System;
   import mx.formatters.DateFormatter;
   
   public class DebugTrace
   {
      
      public static const ENABLE_LOG:Boolean = true;
      
      public static var aDateFormatter:DateFormatter = new DateFormatter();
      
      public static const AVAILABLE_LEVEL:int = 100;
      
      public static var mySocket:Socket = null;
       
      
      public function DebugTrace()
      {
         super();
      }
      
      public static function GetCurrentTime(param1:Date = null) : String
      {
         if(param1 == null)
         {
            param1 = new Date();
         }
         aDateFormatter.formatString = "HH:NN:SS";
         var _loc2_:* = "";
         var _loc3_:uint = param1.milliseconds;
         if(_loc3_ < 100)
         {
            _loc2_ += " ";
            if(_loc3_ < 10)
            {
               _loc2_ += " ";
            }
         }
         return aDateFormatter.format(param1) + "." + _loc2_ + _loc3_;
      }
      
      public static function calculateUsedBytes() : String
      {
         return "[" + Number(0).toFixed(2) + " Mo]";
      }
      
      public static function Tracer(param1:String, param2:int = 100, param3:String = "") : void
      {
         var _loc4_:* = null;
         if(ENABLE_LOG && AVAILABLE_LEVEL >= param2)
         {
            _loc4_ = "";
            if(param2 < 100)
            {
               _loc4_ += " ";
               if(param2 < 10)
               {
                  _loc4_ += " ";
               }
            }
            if(param3 != "")
            {
               param1 = "[" + param3 + "] " + param1;
            }
            trace(GetCurrentTime(new Date()) + " " + calculateUsedBytes() + " - L" + _loc4_ + param2 + " - " + param1);
         }
      }
   }
}
