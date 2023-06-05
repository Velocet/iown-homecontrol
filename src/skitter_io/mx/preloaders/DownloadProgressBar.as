package mx.preloaders
{
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.RSLEvent;
   import mx.graphics.RectangularDropShadow;
   import mx.graphics.RoundedRectangle;
   
   public class DownloadProgressBar extends Sprite implements IPreloaderDisplay
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var _initializingLabel:String = "Initializing";
       
      
      protected var MINIMUM_DISPLAY_TIME:uint = 0;
      
      private var _barFrameRect:RoundedRectangle;
      
      private var _stageHeight:Number = 375;
      
      private var _stageWidth:Number = 500;
      
      private var _percentRect:Rectangle;
      
      private var _percentObj:TextField;
      
      private var _downloadingLabel:String = "Loading";
      
      private var _showProgressBar:Boolean = true;
      
      private var _yOffset:Number = 20;
      
      private var _initProgressCount:uint = 0;
      
      private var _barSprite:Sprite;
      
      private var _visible:Boolean = false;
      
      private var _barRect:RoundedRectangle;
      
      private var _showingDisplay:Boolean = false;
      
      private var _backgroundSize:String = "";
      
      private var _initProgressTotal:uint = 12;
      
      private var _startedInit:Boolean = false;
      
      private var _showLabel:Boolean = true;
      
      private var _value:Number = 0;
      
      private var _labelRect:Rectangle;
      
      private var _backgroundImage:Object;
      
      private var _backgroundAlpha:Number = 1;
      
      private var _backgroundColor:uint;
      
      private var _startedLoading:Boolean = false;
      
      private var _showPercentage:Boolean = false;
      
      private var _barFrameSprite:Sprite;
      
      protected var DOWNLOAD_PERCENTAGE:uint = 60;
      
      private var _displayStartCount:uint = 0;
      
      private var _labelObj:TextField;
      
      private var _borderRect:RoundedRectangle;
      
      private var _maximum:Number = 0;
      
      private var _displayTime:int;
      
      private var _label:String = "";
      
      private var _preloader:Sprite;
      
      private var _xOffset:Number = 20;
      
      private var _startTime:int;
      
      public function DownloadProgressBar()
      {
         _labelRect = labelRect;
         _percentRect = percentRect;
         _borderRect = borderRect;
         _barFrameRect = barFrameRect;
         _barRect = barRect;
         super();
      }
      
      public static function get initializingLabel() : String
      {
         return _initializingLabel;
      }
      
      public static function set initializingLabel(param1:String) : void
      {
         _initializingLabel = param1;
      }
      
      protected function getPercentLoaded(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 == 0 || param2 == 0 || isNaN(param2) || isNaN(param1))
         {
            return 0;
         }
         _loc3_ = 100 * param1 / param2;
         if(isNaN(_loc3_) || _loc3_ <= 0)
         {
            return 0;
         }
         if(_loc3_ > 99)
         {
            return 99;
         }
         return Math.round(_loc3_);
      }
      
      protected function get labelFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.color = 3355443;
         _loc1_.font = "Verdana";
         _loc1_.size = 10;
         return _loc1_;
      }
      
      private function calcScale() : void
      {
         var _loc1_:Number = NaN;
         if(stageWidth < 160 || stageHeight < 120)
         {
            scaleX = 1;
            scaleY = 1;
         }
         else if(stageWidth < 240 || stageHeight < 150)
         {
            createChildren();
            _loc1_ = Math.min(stageWidth / 240,stageHeight / 150);
            scaleX = _loc1_;
            scaleY = _loc1_;
         }
         else
         {
            createChildren();
         }
      }
      
      protected function get percentRect() : Rectangle
      {
         return new Rectangle(108,4,34,16);
      }
      
      protected function set showLabel(param1:Boolean) : void
      {
         _showLabel = param1;
         draw();
      }
      
      private function calcBackgroundSize() : Number
      {
         var _loc2_:int = 0;
         var _loc1_:Number = NaN;
         if(backgroundSize)
         {
            _loc2_ = backgroundSize.indexOf("%");
            if(_loc2_ != -1)
            {
               _loc1_ = Number(backgroundSize.substr(0,_loc2_));
            }
         }
         return _loc1_;
      }
      
      private function show() : void
      {
         _showingDisplay = true;
         calcScale();
         draw();
         _displayTime = getTimer();
      }
      
      private function loadBackgroundImage(param1:Object) : void
      {
         var cls:Class = null;
         var newStyleObj:DisplayObject = null;
         var loader:Loader = null;
         var loaderContext:LoaderContext = null;
         var classOrString:Object = param1;
         if(Boolean(classOrString) && Boolean(classOrString as Class))
         {
            cls = Class(classOrString);
            initBackgroundImage(new cls());
         }
         else if(Boolean(classOrString) && classOrString is String)
         {
            try
            {
               cls = Class(getDefinitionByName(String(classOrString)));
            }
            catch(e:Error)
            {
            }
            if(cls)
            {
               newStyleObj = new cls();
               initBackgroundImage(newStyleObj);
            }
            else
            {
               loader = new Loader();
               loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loader_completeHandler);
               loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loader_ioErrorHandler);
               loaderContext = new LoaderContext();
               loaderContext.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
               loader.load(new URLRequest(String(classOrString)),loaderContext);
            }
         }
      }
      
      protected function set showPercentage(param1:Boolean) : void
      {
         _showPercentage = param1;
         draw();
      }
      
      protected function get barFrameRect() : RoundedRectangle
      {
         return new RoundedRectangle(14,40,154,4);
      }
      
      private function loader_ioErrorHandler(param1:IOErrorEvent) : void
      {
      }
      
      protected function rslErrorHandler(param1:RSLEvent) : void
      {
         _preloader.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
         _preloader.removeEventListener(Event.COMPLETE,completeHandler);
         _preloader.removeEventListener(RSLEvent.RSL_PROGRESS,rslProgressHandler);
         _preloader.removeEventListener(RSLEvent.RSL_COMPLETE,rslCompleteHandler);
         _preloader.removeEventListener(RSLEvent.RSL_ERROR,rslErrorHandler);
         _preloader.removeEventListener(FlexEvent.INIT_PROGRESS,initProgressHandler);
         _preloader.removeEventListener(FlexEvent.INIT_COMPLETE,initCompleteHandler);
         if(!_showingDisplay)
         {
            show();
            _showingDisplay = true;
         }
         label = "RSL Error " + (param1.rslIndex + 1) + " of " + param1.rslTotal;
         var _loc2_:ErrorField = new ErrorField(this);
         _loc2_.show(param1.errorText);
      }
      
      protected function rslCompleteHandler(param1:RSLEvent) : void
      {
         label = "Loaded library " + param1.rslIndex + " of " + param1.rslTotal;
      }
      
      protected function get borderRect() : RoundedRectangle
      {
         return new RoundedRectangle(0,0,182,60,4);
      }
      
      protected function showDisplayForDownloading(param1:int, param2:ProgressEvent) : Boolean
      {
         return param1 > 700 && param2.bytesLoaded < param2.bytesTotal / 2;
      }
      
      protected function createChildren() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Graphics = graphics;
         if(backgroundColor != 4294967295)
         {
            _loc1_.beginFill(backgroundColor,backgroundAlpha);
            _loc1_.drawRect(0,0,stageWidth,stageHeight);
         }
         if(backgroundImage != null)
         {
            loadBackgroundImage(backgroundImage);
         }
         _barFrameSprite = new Sprite();
         _barSprite = new Sprite();
         addChild(_barFrameSprite);
         addChild(_barSprite);
         _loc1_.beginFill(13421772,0.4);
         _loc1_.drawRoundRect(calcX(_borderRect.x),calcY(_borderRect.y),_borderRect.width,_borderRect.height,0,0);
         _loc1_.drawRoundRect(calcX(NaN),calcY(NaN),-2,-2,-2,-2);
         _loc1_.endFill();
         _loc1_.beginFill(13421772,0.4);
         _loc1_.drawRoundRect(calcX(NaN),calcY(NaN),-2,-2,-2,-2);
         _loc1_.endFill();
         var _loc4_:Graphics = _barFrameSprite.graphics;
         var _loc5_:Matrix;
         (_loc5_ = new Matrix()).createGradientBox(_barFrameRect.width,_barFrameRect.height,0,calcX(_barFrameRect.x),calcY(_barFrameRect.y));
         _loc4_.beginGradientFill(GradientType.LINEAR,[6054502,11909306],[1,1],[0,255],_loc5_);
         _loc4_.drawRoundRect(calcX(_barFrameRect.x),calcY(_barFrameRect.y),_barFrameRect.width,_barFrameRect.height,0,0);
         _loc4_.drawRoundRect(calcX(NaN),calcY(NaN),-2,-2,0,0);
         _loc4_.endFill();
         _labelObj = new TextField();
         _labelObj.x = calcX(_labelRect.x);
         _labelObj.y = calcY(_labelRect.y);
         _labelObj.width = _labelRect.width;
         _labelObj.height = _labelRect.height;
         _labelObj.selectable = false;
         _labelObj.defaultTextFormat = labelFormat;
         addChild(_labelObj);
         _percentObj = new TextField();
         _percentObj.x = calcX(_percentRect.x);
         _percentObj.y = calcY(_percentRect.y);
         _percentObj.width = _percentRect.width;
         _percentObj.height = _percentRect.height;
         _percentObj.selectable = false;
         _percentObj.defaultTextFormat = percentFormat;
         addChild(_percentObj);
         var _loc6_:RectangularDropShadow;
         (_loc6_ = new RectangularDropShadow()).color = 0;
         _loc6_.angle = 90;
         _loc6_.alpha = 0.6;
         _loc6_.distance = 2;
         _loc6_.tlRadius = _loc6_.trRadius = _loc6_.blRadius = _loc6_.brRadius = _borderRect.cornerRadius;
         _loc6_.drawShadow(_loc1_,calcX(_borderRect.x),calcY(_borderRect.y),_borderRect.width,_borderRect.height);
         _loc1_.lineStyle(1,16777215,0.3);
         _loc1_.moveTo(calcX(_borderRect.x) + _borderRect.cornerRadius,calcY(_borderRect.y));
         _loc1_.lineTo(calcX(_borderRect.x) - 0 + _borderRect.width,calcY(_borderRect.y));
      }
      
      private function draw() : void
      {
         var _loc1_:Number = NaN;
         if(_startedLoading)
         {
            if(!_startedInit)
            {
               _loc1_ = Math.round(getPercentLoaded(_value,_maximum) * DOWNLOAD_PERCENTAGE / 100);
            }
            else
            {
               _loc1_ = Math.round(getPercentLoaded(_value,_maximum) * (100 - DOWNLOAD_PERCENTAGE) / 100 + DOWNLOAD_PERCENTAGE);
            }
         }
         else
         {
            _loc1_ = getPercentLoaded(_value,_maximum);
         }
         if(_labelObj)
         {
            _labelObj.text = _label;
         }
         if(_percentObj)
         {
            if(!_showPercentage)
            {
               _percentObj.visible = false;
               _percentObj.text = "";
            }
            else
            {
               _percentObj.text = String(_loc1_) + "%";
            }
         }
         if(Boolean(_barSprite) && Boolean(_barFrameSprite))
         {
            if(!_showProgressBar)
            {
               _barSprite.visible = false;
               _barFrameSprite.visible = false;
            }
            else
            {
               drawProgressBar(_loc1_);
            }
         }
      }
      
      private function timerHandler(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function hide() : void
      {
      }
      
      public function get backgroundSize() : String
      {
         return _backgroundSize;
      }
      
      protected function center(param1:Number, param2:Number) : void
      {
         _xOffset = Math.floor((param1 - 0) / 2);
         _yOffset = Math.floor((param2 - 0) / 2);
      }
      
      protected function progressHandler(param1:ProgressEvent) : void
      {
         var _loc2_:uint = param1.bytesLoaded;
         var _loc3_:uint = param1.bytesTotal;
         var _loc4_:int = getTimer() - _startTime;
         if(_showingDisplay || showDisplayForDownloading(_loc4_,param1))
         {
            if(!_startedLoading)
            {
               show();
               label = downloadingLabel;
               _startedLoading = true;
            }
            setProgress(param1.bytesLoaded,param1.bytesTotal);
         }
      }
      
      protected function initProgressHandler(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:int = getTimer() - _startTime;
         ++_initProgressCount;
         if(!_showingDisplay && showDisplayForInit(_loc2_,_initProgressCount))
         {
            _displayStartCount = _initProgressCount;
            show();
         }
         else if(_showingDisplay)
         {
            if(!_startedInit)
            {
               _startedInit = true;
               label = initializingLabel;
            }
            _loc3_ = 100 * _initProgressCount / (_initProgressTotal - _displayStartCount);
            setProgress(_loc3_,100);
         }
      }
      
      protected function set downloadingLabel(param1:String) : void
      {
         _downloadingLabel = param1;
      }
      
      public function get stageWidth() : Number
      {
         return _stageWidth;
      }
      
      protected function get showPercentage() : Boolean
      {
         return _showPercentage;
      }
      
      override public function get visible() : Boolean
      {
         return _visible;
      }
      
      public function set stageHeight(param1:Number) : void
      {
         _stageHeight = param1;
      }
      
      public function initialize() : void
      {
         _startTime = getTimer();
         center(stageWidth,stageHeight);
      }
      
      protected function rslProgressHandler(param1:RSLEvent) : void
      {
      }
      
      protected function get barRect() : RoundedRectangle
      {
         return new RoundedRectangle(14,39,154,6,0);
      }
      
      protected function get percentFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.align = "right";
         _loc1_.color = 0;
         _loc1_.font = "Verdana";
         _loc1_.size = 10;
         return _loc1_;
      }
      
      public function set backgroundImage(param1:Object) : void
      {
         _backgroundImage = param1;
      }
      
      private function calcX(param1:Number) : Number
      {
         return param1 + _xOffset;
      }
      
      private function calcY(param1:Number) : Number
      {
         return param1 + _yOffset;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
         _backgroundAlpha = param1;
      }
      
      private function initCompleteHandler(param1:Event) : void
      {
         var _loc3_:Timer = null;
         var _loc2_:int = getTimer() - _displayTime;
         if(_showingDisplay && _loc2_ < MINIMUM_DISPLAY_TIME)
         {
            _loc3_ = new Timer(MINIMUM_DISPLAY_TIME - _loc2_,1);
            _loc3_.addEventListener(TimerEvent.TIMER,timerHandler);
            _loc3_.start();
         }
         else
         {
            timerHandler();
         }
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         _backgroundColor = param1;
      }
      
      private function initBackgroundImage(param1:DisplayObject) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         addChildAt(param1,0);
         var _loc2_:Number = param1.width;
         var _loc3_:Number = param1.height;
         var _loc4_:Number = calcBackgroundSize();
         if(isNaN(_loc4_))
         {
            _loc7_ = 1;
            _loc8_ = 1;
         }
         else
         {
            _loc7_ = (_loc9_ = _loc4_ * 0.01) * stageWidth / _loc2_;
            _loc8_ = _loc9_ * stageHeight / _loc3_;
         }
         param1.scaleX = _loc7_;
         param1.scaleY = _loc8_;
         var _loc5_:Number = Math.round(0.5 * (stageWidth - _loc2_ * _loc7_));
         var _loc6_:Number = Math.round(0.5 * (stageHeight - _loc3_ * _loc8_));
         param1.x = _loc5_;
         param1.y = _loc6_;
         if(!isNaN(backgroundAlpha))
         {
            param1.alpha = backgroundAlpha;
         }
      }
      
      public function set backgroundSize(param1:String) : void
      {
         _backgroundSize = param1;
      }
      
      protected function showDisplayForInit(param1:int, param2:int) : Boolean
      {
         return param1 > 300 && param2 == 2;
      }
      
      protected function get downloadingLabel() : String
      {
         return _downloadingLabel;
      }
      
      private function loader_completeHandler(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(LoaderInfo(param1.target).loader);
         initBackgroundImage(_loc2_);
      }
      
      protected function setProgress(param1:Number, param2:Number) : void
      {
         if(!isNaN(param1) && !isNaN(param2) && param1 >= 0 && param2 > 0)
         {
            _value = Number(param1);
            _maximum = Number(param2);
            draw();
         }
      }
      
      public function get stageHeight() : Number
      {
         return _stageHeight;
      }
      
      public function get backgroundImage() : Object
      {
         return _backgroundImage;
      }
      
      public function get backgroundAlpha() : Number
      {
         if(!isNaN(_backgroundAlpha))
         {
            return _backgroundAlpha;
         }
         return 1;
      }
      
      private function drawProgressBar(param1:Number) : void
      {
         var _loc11_:Number = NaN;
         var _loc2_:Graphics = _barSprite.graphics;
         _loc2_.clear();
         var _loc3_:* = [16777215,16777215];
         var _loc4_:* = [0,255];
         var _loc5_:Matrix = new Matrix();
         var _loc6_:Number;
         var _loc7_:Number = (_loc6_ = 0 * param1 / 100) / 2;
         var _loc8_:Number = -4;
         var _loc9_:Number = calcX(_barRect.x);
         var _loc10_:Number = calcY(_barRect.y) + 2;
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.39,0.85],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_,_loc10_,_loc7_,_loc8_);
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_ + _loc7_,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.85,1],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_ + _loc7_,_loc10_,_loc7_,_loc8_);
         _loc7_ = _loc6_ / 3;
         _loc8_ = 0;
         _loc11_ = (_loc10_ = calcY(_barRect.y)) + _loc8_ - 1;
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.05,0.15],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_,_loc10_,_loc7_,1);
         _loc2_.drawRect(_loc9_,_loc11_,_loc7_,1);
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_ + _loc7_,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.15,0.25],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_ + _loc7_,_loc10_,_loc7_,1);
         _loc2_.drawRect(_loc9_ + _loc7_,_loc11_,_loc7_,1);
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_ + _loc7_ * 2,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.25,0.1],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_ + _loc7_ * 2,_loc10_,_loc7_,1);
         _loc2_.drawRect(_loc9_ + _loc7_ * 2,_loc11_,_loc7_,1);
         _loc7_ = _loc6_ / 3;
         _loc8_ = 0;
         _loc10_ = calcY(_barRect.y) + 1;
         _loc11_ = calcY(_barRect.y) + _loc8_ - 2;
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.15,0.3],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_,_loc10_,_loc7_,1);
         _loc2_.drawRect(_loc9_,_loc11_,_loc7_,1);
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_ + _loc7_,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.3,0.4],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_ + _loc7_,_loc10_,_loc7_,1);
         _loc2_.drawRect(_loc9_ + _loc7_,_loc11_,_loc7_,1);
         _loc5_.createGradientBox(_loc7_,_loc8_,0,_loc9_ + _loc7_ * 2,_loc10_);
         _loc2_.beginGradientFill(GradientType.LINEAR,_loc3_,[0.4,0.25],_loc4_,_loc5_);
         _loc2_.drawRect(_loc9_ + _loc7_ * 2,_loc10_,_loc7_,1);
         _loc2_.drawRect(_loc9_ + _loc7_ * 2,_loc11_,_loc7_,1);
      }
      
      public function get backgroundColor() : uint
      {
         return _backgroundColor;
      }
      
      public function set stageWidth(param1:Number) : void
      {
         _stageWidth = param1;
      }
      
      protected function completeHandler(param1:Event) : void
      {
      }
      
      protected function set label(param1:String) : void
      {
         if(!(param1 is Function))
         {
            _label = param1;
         }
         draw();
      }
      
      public function set preloader(param1:Sprite) : void
      {
         _preloader = param1;
         param1.addEventListener(ProgressEvent.PROGRESS,progressHandler);
         param1.addEventListener(Event.COMPLETE,completeHandler);
         param1.addEventListener(RSLEvent.RSL_PROGRESS,rslProgressHandler);
         param1.addEventListener(RSLEvent.RSL_COMPLETE,rslCompleteHandler);
         param1.addEventListener(RSLEvent.RSL_ERROR,rslErrorHandler);
         param1.addEventListener(FlexEvent.INIT_PROGRESS,initProgressHandler);
         param1.addEventListener(FlexEvent.INIT_COMPLETE,initCompleteHandler);
      }
      
      protected function get label() : String
      {
         return _label;
      }
      
      protected function get labelRect() : Rectangle
      {
         return new Rectangle(14,17,100,16);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(!_visible && param1)
         {
            show();
         }
         else if(_visible && !param1)
         {
            hide();
         }
         _visible = param1;
      }
      
      protected function get showLabel() : Boolean
      {
         return _showLabel;
      }
   }
}

import flash.display.Sprite;
import flash.system.Capabilities;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import mx.preloaders.DownloadProgressBar;

class ErrorField extends Sprite
{
    
   
   private var downloadProgressBar:DownloadProgressBar;
   
   private const TEXT_MARGIN_PX:int = 10;
   
   private const MAX_WIDTH_INCHES:int = 6;
   
   private const MIN_WIDTH_INCHES:int = 2;
   
   public function ErrorField(param1:DownloadProgressBar)
   {
      super();
      this.downloadProgressBar = param1;
   }
   
   protected function get labelFormat() : TextFormat
   {
      var _loc1_:TextFormat = new TextFormat();
      _loc1_.color = 0;
      _loc1_.font = "Verdana";
      _loc1_.size = 10;
      return _loc1_;
   }
   
   public function show(param1:String) : void
   {
      if(param1 == null || param1.length == 0)
      {
         return;
      }
      var _loc2_:Number = 0;
      var _loc3_:Number = 0;
      var _loc4_:TextField;
      (_loc4_ = new TextField()).autoSize = TextFieldAutoSize.LEFT;
      _loc4_.multiline = true;
      _loc4_.wordWrap = true;
      _loc4_.background = true;
      _loc4_.defaultTextFormat = labelFormat;
      _loc4_.text = param1;
      _loc4_.width = Math.max(MIN_WIDTH_INCHES * 0,_loc2_ - TEXT_MARGIN_PX * 2);
      _loc4_.width = Math.min(MAX_WIDTH_INCHES * 0,_loc4_.width);
      _loc4_.y = Math.max(0,_loc3_ - TEXT_MARGIN_PX - _loc4_.height);
      _loc4_.x = (_loc2_ - _loc4_.width) / 2;
      downloadProgressBar.parent.addChild(this);
      this.addChild(_loc4_);
   }
}
