package mx.preloaders
{
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.core.RSLItem;
   import mx.core.RSLListLoader;
   import mx.core.ResourceModuleRSLItem;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.RSLEvent;
   
   public class Preloader extends Sprite
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var app:IEventDispatcher = null;
      
      private var showDisplay:Boolean;
      
      private var timer:Timer;
      
      private var rslDone:Boolean = false;
      
      private var displayClass:mx.preloaders.IPreloaderDisplay = null;
      
      private var rslListLoader:RSLListLoader;
      
      public function Preloader()
      {
         super();
      }
      
      private function getByteValues() : Object
      {
         var _loc1_:LoaderInfo = root.loaderInfo;
         var _loc2_:int = int(_loc1_.bytesLoaded);
         var _loc3_:int = int(_loc1_.bytesTotal);
         var _loc4_:int = !!rslListLoader ? rslListLoader.getItemCount() : 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ += rslListLoader.getItem(_loc5_).loaded;
            _loc3_ += rslListLoader.getItem(_loc5_).total;
            _loc5_++;
         }
         return {
            "loaded":_loc2_,
            "total":_loc3_
         };
      }
      
      private function appProgressHandler(param1:Event) : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
      }
      
      private function dispatchAppEndEvent(param1:Object = null) : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.INIT_COMPLETE));
         if(!showDisplay)
         {
            displayClassCompleteHandler(null);
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
      }
      
      private function appCreationCompleteHandler(param1:FlexEvent) : void
      {
         dispatchAppEndEvent();
      }
      
      mx_internal function rslErrorHandler(param1:ErrorEvent) : void
      {
         var _loc2_:int = rslListLoader.getIndex();
         var _loc3_:RSLItem = rslListLoader.getItem(_loc2_);
         var _loc4_:RSLEvent;
         (_loc4_ = new RSLEvent(RSLEvent.RSL_ERROR)).bytesLoaded = 0;
         _loc4_.bytesTotal = 0;
         _loc4_.rslIndex = _loc2_;
         _loc4_.rslTotal = rslListLoader.getItemCount();
         _loc4_.url = _loc3_.urlRequest;
         _loc4_.errorText = decodeURI(param1.text);
         dispatchEvent(_loc4_);
      }
      
      public function initialize(param1:Boolean, param2:Class, param3:uint, param4:Number, param5:Object, param6:String, param7:Number, param8:Number, param9:Array = null, param10:Array = null, param11:Array = null, param12:Array = null) : void
      {
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:RSLItem = null;
         var _loc16_:ResourceModuleRSLItem = null;
         if((param9 != null || param10 != null) && param11 != null)
         {
            throw new Error("RSLs may only be specified by using libs and sizes or rslList, not both.");
         }
         root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         if(Boolean(param9) && param9.length > 0)
         {
            if(param11 == null)
            {
               param11 = [];
            }
            _loc13_ = int(param9.length);
            _loc14_ = 0;
            while(_loc14_ < _loc13_)
            {
               _loc15_ = new RSLItem(param9[_loc14_]);
               param11.push(_loc15_);
               _loc14_++;
            }
         }
         if(Boolean(param12) && param12.length > 0)
         {
            _loc13_ = int(param12.length);
            _loc14_ = 0;
            while(_loc14_ < _loc13_)
            {
               _loc16_ = new ResourceModuleRSLItem(param12[_loc14_]);
               param11.push(_loc16_);
               _loc14_++;
            }
         }
         rslListLoader = new RSLListLoader(param11);
         this.showDisplay = param1;
         timer = new Timer(10);
         timer.addEventListener(TimerEvent.TIMER,timerHandler);
         timer.start();
         if(param1)
         {
            displayClass = new param2();
            displayClass.addEventListener(Event.COMPLETE,displayClassCompleteHandler);
            addChild(DisplayObject(displayClass));
            displayClass.backgroundColor = param3;
            displayClass.backgroundAlpha = param4;
            displayClass.backgroundImage = param5;
            displayClass.backgroundSize = param6;
            displayClass.stageWidth = param7;
            displayClass.stageHeight = param8;
            displayClass.initialize();
            displayClass.preloader = this;
         }
         if(rslListLoader.getItemCount() > 0)
         {
            rslListLoader.load(mx_internal::rslProgressHandler,mx_internal::rslCompleteHandler,mx_internal::rslErrorHandler,mx_internal::rslErrorHandler,mx_internal::rslErrorHandler);
         }
         else
         {
            rslDone = true;
         }
      }
      
      mx_internal function rslProgressHandler(param1:ProgressEvent) : void
      {
         var _loc2_:int = rslListLoader.getIndex();
         var _loc3_:RSLItem = rslListLoader.getItem(_loc2_);
         var _loc4_:RSLEvent;
         (_loc4_ = new RSLEvent(RSLEvent.RSL_PROGRESS)).bytesLoaded = param1.bytesLoaded;
         _loc4_.bytesTotal = param1.bytesTotal;
         _loc4_.rslIndex = _loc2_;
         _loc4_.rslTotal = rslListLoader.getItemCount();
         _loc4_.url = _loc3_.urlRequest;
         dispatchEvent(_loc4_);
      }
      
      public function registerApplication(param1:IEventDispatcher) : void
      {
         param1.addEventListener("validatePropertiesComplete",appProgressHandler);
         param1.addEventListener("validateSizeComplete",appProgressHandler);
         param1.addEventListener("validateDisplayListComplete",appProgressHandler);
         param1.addEventListener(FlexEvent.CREATION_COMPLETE,appCreationCompleteHandler);
         this.app = param1;
      }
      
      mx_internal function rslCompleteHandler(param1:Event) : void
      {
         var _loc2_:int = rslListLoader.getIndex();
         var _loc3_:RSLItem = rslListLoader.getItem(_loc2_);
         var _loc4_:RSLEvent;
         (_loc4_ = new RSLEvent(RSLEvent.RSL_COMPLETE)).bytesLoaded = _loc3_.total;
         _loc4_.bytesTotal = _loc3_.total;
         _loc4_.loaderInfo = param1.target as LoaderInfo;
         _loc4_.rslIndex = _loc2_;
         _loc4_.rslTotal = rslListLoader.getItemCount();
         _loc4_.url = _loc3_.urlRequest;
         dispatchEvent(_loc4_);
         rslDone = _loc2_ + 1 == _loc4_.rslTotal;
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         if(!root)
         {
            return;
         }
         var _loc2_:Object = getByteValues();
         var _loc3_:int = int(_loc2_.loaded);
         var _loc4_:int = int(_loc2_.total);
         dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false,false,_loc3_,_loc4_));
         if(rslDone && (_loc3_ >= _loc4_ && _loc4_ > 0 || _loc4_ == 0 && _loc3_ > 0 || root is MovieClip && MovieClip(root).totalFrames > 2 && MovieClip(root).framesLoaded >= 2))
         {
            timer.removeEventListener(TimerEvent.TIMER,timerHandler);
            timer.reset();
            dispatchEvent(new Event(Event.COMPLETE));
            dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
         }
      }
      
      private function displayClassCompleteHandler(param1:Event) : void
      {
         if(displayClass)
         {
            displayClass.removeEventListener(Event.COMPLETE,displayClassCompleteHandler);
         }
         if(root)
         {
            root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         }
         if(app)
         {
            app.removeEventListener("validatePropertiesComplete",appProgressHandler);
            app.removeEventListener("validateSizeComplete",appProgressHandler);
            app.removeEventListener("validateDisplayListComplete",appProgressHandler);
            app.removeEventListener(FlexEvent.CREATION_COMPLETE,appCreationCompleteHandler);
            app = null;
         }
         dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DONE));
      }
   }
}
