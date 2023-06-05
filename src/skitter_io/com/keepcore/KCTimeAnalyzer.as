package com.keepcore
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.System;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import mx.controls.LinkButton;
   import mx.formatters.DateFormatter;
   
   public class KCTimeAnalyzer extends LinkButton
   {
      
      private static const ENABLE_LOG:Boolean = true;
      
      private static const AVAILABLE_LEVEL:int = 100;
      
      private static const MIN_TIME_TO_WAIT_FOR_UI_UPDATE:int = 1;
      
      public static var GlobalKCTimeAnalyzer:com.keepcore.KCTimeAnalyzer = new com.keepcore.KCTimeAnalyzer();
      
      private static var aDateFormatter:DateFormatter = new DateFormatter();
       
      
      private var FFPS:int;
      
      private var FStopTime:int;
      
      private var FIsStartTimeStoredWithoutStop:Boolean = false;
      
      private var FStartTime:int;
      
      private var FTimerCallLater:Timer;
      
      private var FAverageFPS:Number;
      
      private var FFunctionToCallLater:Function;
      
      public function KCTimeAnalyzer(param1:Boolean = false)
      {
         super();
         this.FTimerCallLater = new Timer(MIN_TIME_TO_WAIT_FOR_UI_UPDATE,1);
         this.FTimerCallLater.addEventListener(TimerEvent.TIMER,this.reallyCallFunctionLater);
         this.label = "KC";
         this.setStyle("paddingLeft",1);
         this.setStyle("paddingRight",1);
         this.setStyle("fontFamily","Verdana");
         this.setStyle("fontWeight","bold");
         this.setStyle("fontSize","12");
         this.setStyle("color","#8E0003");
         this.height = 16;
         this.addEventListener(MouseEvent.CLICK,this.OnClick);
         if(param1)
         {
            this.Start();
         }
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
      
      private static function calculateUsedBytes() : String
      {
         return "[" + Number(0).toFixed(2) + " Mo]";
      }
      
      public static function GetCallStack(param1:int = 0) : String
      {
         var aCallStackArray:Array;
         var aMethodCountToRemove:int = param1;
         var aTmpResult:String = "";
         try
         {
            throw new Error("CallStack");
         }
         catch(e:Error)
         {
            aTmpResult = String(e.getStackTrace());
            aCallStackArray = aTmpResult.split("\n");
            aCallStackArray.splice(1,1 + aMethodCountToRemove);
            return aCallStackArray.join("\n");
         }
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
      
      public function GetTimeDifference() : int
      {
         if(this.FIsStartTimeStoredWithoutStop)
         {
            return int(getTimer() - this.FStartTime);
         }
         return int(this.FStopTime - this.FStartTime);
      }
      
      public function Start() : void
      {
         if(this.FIsStartTimeStoredWithoutStop)
         {
            Tracer("KCTimeAnalyzer.Start() called twice without calling Stop()...");
         }
         if(!hasEventListener(Event.ENTER_FRAME))
         {
            this.addEventListener(Event.ENTER_FRAME,this.OnFrameEnter);
         }
         this.FFPS = 0;
         this.FAverageFPS = 0;
         this.FStartTime = getTimer();
         this.FIsStartTimeStoredWithoutStop = true;
      }
      
      public function OnClick(param1:Event) : void
      {
         navigateToURL(new URLRequest("http://www.keepcore.com"),"_blank");
      }
      
      private function OnFrameEnter(param1:Event) : void
      {
         ++this.FFPS;
      }
      
      public function StopAndGetTimeDifference() : int
      {
         this.Stop();
         return int(this.FStopTime - this.FStartTime);
      }
      
      public function callFunctionLater(param1:Function, param2:int = -1) : void
      {
         this.FFunctionToCallLater = param1;
         if(param2 == -1)
         {
            param2 = MIN_TIME_TO_WAIT_FOR_UI_UPDATE;
         }
         else
         {
            param2 = Math.max(param2,MIN_TIME_TO_WAIT_FOR_UI_UPDATE);
         }
         this.FTimerCallLater.delay = 1;
         this.FTimerCallLater.repeatCount = 1;
         this.FTimerCallLater.reset();
         this.FTimerCallLater.start();
      }
      
      public function IsStarted() : Boolean
      {
         return this.FIsStartTimeStoredWithoutStop;
      }
      
      public function Stop(param1:Boolean = false) : void
      {
         this.FStopTime = getTimer();
         this.removeEventListener(Event.ENTER_FRAME,this.OnFrameEnter);
         this.FAverageFPS = this.FFPS * 1000 / (this.FStopTime - this.FStartTime);
         if(param1)
         {
            Tracer("FFPS = " + this.FFPS + " - AverageFPS = " + this.AverageFPS);
         }
         this.FIsStartTimeStoredWithoutStop = false;
      }
      
      private function reallyCallFunctionLater(param1:TimerEvent) : void
      {
         this.FFunctionToCallLater();
      }
      
      public function get AverageFPS() : Number
      {
         return this.FAverageFPS;
      }
   }
}
