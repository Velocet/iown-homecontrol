package mx.styles
{
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.system.ApplicationDomain;
   import flash.system.SecurityDomain;
   import flash.utils.Timer;
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   import mx.events.ModuleEvent;
   import mx.events.StyleEvent;
   import mx.managers.SystemManagerGlobals;
   import mx.modules.IModuleInfo;
   import mx.modules.ModuleManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class StyleManagerImpl implements mx.styles.IStyleManager2
   {
      
      private static var parentSizeInvalidatingStyles:Object = {
         "bottom":true,
         "horizontalCenter":true,
         "left":true,
         "right":true,
         "top":true,
         "verticalCenter":true,
         "baseline":true
      };
      
      private static var colorNames:Object = {
         "transparent":"transparent",
         "black":0,
         "blue":255,
         "green":32768,
         "gray":8421504,
         "silver":12632256,
         "lime":65280,
         "olive":8421376,
         "white":16777215,
         "yellow":16776960,
         "maroon":8388608,
         "navy":128,
         "red":16711680,
         "purple":8388736,
         "teal":32896,
         "fuchsia":16711935,
         "aqua":65535,
         "magenta":16711935,
         "cyan":65535,
         "halogreen":8453965,
         "haloblue":40447,
         "haloorange":16758272,
         "halosilver":11455193
      };
      
      private static var inheritingTextFormatStyles:Object = {
         "align":true,
         "bold":true,
         "color":true,
         "font":true,
         "indent":true,
         "italic":true,
         "size":true
      };
      
      private static var instance:mx.styles.IStyleManager2;
      
      private static var parentDisplayListInvalidatingStyles:Object = {
         "bottom":true,
         "horizontalCenter":true,
         "left":true,
         "right":true,
         "top":true,
         "verticalCenter":true,
         "baseline":true
      };
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var sizeInvalidatingStyles:Object = {
         "borderStyle":true,
         "borderThickness":true,
         "fontAntiAliasType":true,
         "fontFamily":true,
         "fontGridFitType":true,
         "fontSharpness":true,
         "fontSize":true,
         "fontStyle":true,
         "fontThickness":true,
         "fontWeight":true,
         "headerHeight":true,
         "horizontalAlign":true,
         "horizontalGap":true,
         "kerning":true,
         "leading":true,
         "letterSpacing":true,
         "paddingBottom":true,
         "paddingLeft":true,
         "paddingRight":true,
         "paddingTop":true,
         "strokeWidth":true,
         "tabHeight":true,
         "tabWidth":true,
         "verticalAlign":true,
         "verticalGap":true
      };
       
      
      private var _stylesRoot:Object;
      
      private var _selectors:Object;
      
      private var styleModules:Object;
      
      private var _inheritingStyles:Object;
      
      private var resourceManager:IResourceManager;
      
      private var _typeSelectorCache:Object;
      
      public function StyleManagerImpl()
      {
         _selectors = {};
         styleModules = {};
         resourceManager = ResourceManager.getInstance();
         _inheritingStyles = {};
         _typeSelectorCache = {};
         super();
      }
      
      public static function getInstance() : mx.styles.IStyleManager2
      {
         if(!instance)
         {
            instance = new StyleManagerImpl();
         }
         return instance;
      }
      
      public function setStyleDeclaration(param1:String, param2:CSSStyleDeclaration, param3:Boolean) : void
      {
         ++param2.mx_internal::selectorRefCount;
         _selectors[param1] = param2;
         typeSelectorCache = {};
         if(param3)
         {
            styleDeclarationsChanged();
         }
      }
      
      public function registerParentDisplayListInvalidatingStyle(param1:String) : void
      {
         parentDisplayListInvalidatingStyles[param1] = true;
      }
      
      public function getStyleDeclaration(param1:String) : CSSStyleDeclaration
      {
         var _loc2_:int = 0;
         if(param1.charAt(0) != ".")
         {
            _loc2_ = param1.lastIndexOf(".");
            if(_loc2_ != -1)
            {
               param1 = param1.substr(_loc2_ + 1);
            }
         }
         return _selectors[param1];
      }
      
      public function set typeSelectorCache(param1:Object) : void
      {
         _typeSelectorCache = param1;
      }
      
      public function isColorName(param1:String) : Boolean
      {
         return colorNames[param1.toLowerCase()] !== undefined;
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
         _inheritingStyles = param1;
      }
      
      public function getColorNames(param1:Array) : void
      {
         var _loc4_:* = 0;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1[_loc3_] != null && isNaN(param1[_loc3_]))
            {
               if((_loc4_ = getColorName(param1[_loc3_])) != StyleManager.NOT_A_COLOR)
               {
                  param1[_loc3_] = _loc4_;
               }
            }
            _loc3_++;
         }
      }
      
      public function isInheritingTextFormatStyle(param1:String) : Boolean
      {
         return false;
      }
      
      public function registerParentSizeInvalidatingStyle(param1:String) : void
      {
         parentSizeInvalidatingStyles[param1] = true;
      }
      
      public function registerColorName(param1:String, param2:uint) : void
      {
         colorNames[param1.toLowerCase()] = param2;
      }
      
      public function isParentSizeInvalidatingStyle(param1:String) : Boolean
      {
         return false;
      }
      
      public function registerInheritingStyle(param1:String) : void
      {
         inheritingStyles[param1] = true;
      }
      
      public function set stylesRoot(param1:Object) : void
      {
         _stylesRoot = param1;
      }
      
      public function get typeSelectorCache() : Object
      {
         return _typeSelectorCache;
      }
      
      public function isParentDisplayListInvalidatingStyle(param1:String) : Boolean
      {
         return false;
      }
      
      public function isSizeInvalidatingStyle(param1:String) : Boolean
      {
         return false;
      }
      
      public function styleDeclarationsChanged() : void
      {
         var _loc4_:Object = null;
         var _loc1_:Array = SystemManagerGlobals.topLevelSystemManagers;
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = _loc1_[_loc3_]).regenerateStyleCache(true);
            _loc4_.notifyStyleChangeInChildren(null,true);
            _loc3_++;
         }
      }
      
      public function isValidStyleValue(param1:*) : Boolean
      {
         return param1 !== undefined;
      }
      
      public function loadStyleDeclarations(param1:String, param2:Boolean = true, param3:Boolean = false) : IEventDispatcher
      {
         return loadStyleDeclarations2(param1,param2);
      }
      
      public function get inheritingStyles() : Object
      {
         return _inheritingStyles;
      }
      
      public function unloadStyleDeclarations(param1:String, param2:Boolean = true) : void
      {
         var _loc4_:IModuleInfo = null;
         var _loc3_:StyleModuleInfo = styleModules[param1];
         if(_loc3_)
         {
            _loc3_.styleModule.unload();
            (_loc4_ = _loc3_.module).unload();
            _loc4_.removeEventListener(ModuleEvent.READY,_loc3_.readyHandler);
            _loc4_.removeEventListener(ModuleEvent.ERROR,_loc3_.errorHandler);
            styleModules[param1] = null;
         }
         if(param2)
         {
            styleDeclarationsChanged();
         }
      }
      
      public function getColorName(param1:Object) : uint
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = undefined;
         if(param1 is String)
         {
            if(param1.charAt(0) == "#")
            {
               _loc2_ = Number("0x" + param1.slice(1));
               return isNaN(_loc2_) ? 0 : uint(_loc2_);
            }
            if(param1.charAt(1) == "x" && param1.charAt(0) == "0")
            {
               _loc2_ = Number(param1);
               return isNaN(_loc2_) ? 0 : uint(_loc2_);
            }
            _loc3_ = colorNames[param1.toLowerCase()];
            if(_loc3_ === undefined)
            {
               return StyleManager.NOT_A_COLOR;
            }
            return uint(_loc3_);
         }
         return uint(param1);
      }
      
      public function isInheritingStyle(param1:String) : Boolean
      {
         return false;
      }
      
      public function get stylesRoot() : Object
      {
         return _stylesRoot;
      }
      
      public function initProtoChainRoots() : void
      {
         if(false)
         {
            delete _inheritingStyles["textDecoration"];
            delete _inheritingStyles["leading"];
         }
         if(!stylesRoot)
         {
            stylesRoot = _selectors["global"].addStyleToProtoChain({},null);
         }
      }
      
      public function loadStyleDeclarations2(param1:String, param2:Boolean = true, param3:ApplicationDomain = null, param4:SecurityDomain = null) : IEventDispatcher
      {
         var errorHandler:Function;
         var module:IModuleInfo = null;
         var styleEventDispatcher:StyleEventDispatcher = null;
         var timer:Timer = null;
         var timerHandler:Function = null;
         var url:String = param1;
         var update:Boolean = param2;
         var applicationDomain:ApplicationDomain = param3;
         var securityDomain:SecurityDomain = param4;
         module = ModuleManager.getModule(url);
         var readyHandler:Function = function(param1:ModuleEvent):void
         {
            var _loc2_:IStyleModule = IStyleModule(param1.module.factory.create());
            styleModules[param1.module.url].styleModule = _loc2_;
            if(update)
            {
               styleDeclarationsChanged();
            }
         };
         module.addEventListener(ModuleEvent.READY,readyHandler,false,0,true);
         styleEventDispatcher = new StyleEventDispatcher(module);
         errorHandler = function(param1:ModuleEvent):void
         {
            var _loc3_:StyleEvent = null;
            var _loc2_:String = resourceManager.getString("styles","unableToLoad",[param1.errorText,url]);
            if(styleEventDispatcher.willTrigger(StyleEvent.ERROR))
            {
               _loc3_ = new StyleEvent(StyleEvent.ERROR,param1.bubbles,param1.cancelable);
               _loc3_.bytesLoaded = 0;
               _loc3_.bytesTotal = 0;
               _loc3_.errorText = _loc2_;
               styleEventDispatcher.dispatchEvent(_loc3_);
               return;
            }
            throw new Error(_loc2_);
         };
         module.addEventListener(ModuleEvent.ERROR,errorHandler,false,0,true);
         styleModules[url] = new StyleModuleInfo(module,readyHandler,errorHandler);
         timer = new Timer(0);
         timerHandler = function(param1:TimerEvent):void
         {
            timer.removeEventListener(TimerEvent.TIMER,timerHandler);
            timer.stop();
            module.load(applicationDomain,securityDomain);
         };
         timer.addEventListener(TimerEvent.TIMER,timerHandler,false,0,true);
         timer.start();
         return styleEventDispatcher;
      }
      
      public function registerSizeInvalidatingStyle(param1:String) : void
      {
         sizeInvalidatingStyles[param1] = true;
      }
      
      public function clearStyleDeclaration(param1:String, param2:Boolean) : void
      {
         var _loc3_:CSSStyleDeclaration = getStyleDeclaration(param1);
         if(Boolean(_loc3_) && _loc3_.mx_internal::selectorRefCount > 0)
         {
            --_loc3_.mx_internal::selectorRefCount;
         }
         delete _selectors[param1];
         if(param2)
         {
            styleDeclarationsChanged();
         }
      }
      
      public function get selectors() : Array
      {
         var _loc2_:String = null;
         var _loc1_:* = [];
         for(_loc2_ in _selectors)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
   }
}

import flash.events.EventDispatcher;
import mx.events.ModuleEvent;
import mx.events.StyleEvent;
import mx.modules.IModuleInfo;

class StyleEventDispatcher extends EventDispatcher
{
    
   
   public function StyleEventDispatcher(param1:IModuleInfo)
   {
      super();
      param1.addEventListener(ModuleEvent.ERROR,moduleInfo_errorHandler,false,0,true);
      param1.addEventListener(ModuleEvent.PROGRESS,moduleInfo_progressHandler,false,0,true);
      param1.addEventListener(ModuleEvent.READY,moduleInfo_readyHandler,false,0,true);
   }
   
   private function moduleInfo_progressHandler(param1:ModuleEvent) : void
   {
      var _loc2_:StyleEvent = new StyleEvent(StyleEvent.PROGRESS,param1.bubbles,param1.cancelable);
      _loc2_.bytesLoaded = param1.bytesLoaded;
      _loc2_.bytesTotal = param1.bytesTotal;
      dispatchEvent(_loc2_);
   }
   
   private function moduleInfo_readyHandler(param1:ModuleEvent) : void
   {
      var _loc2_:StyleEvent = new StyleEvent(StyleEvent.COMPLETE);
      _loc2_.bytesLoaded = param1.bytesLoaded;
      _loc2_.bytesTotal = param1.bytesTotal;
      dispatchEvent(_loc2_);
   }
   
   private function moduleInfo_errorHandler(param1:ModuleEvent) : void
   {
      var _loc2_:StyleEvent = new StyleEvent(StyleEvent.ERROR,param1.bubbles,param1.cancelable);
      _loc2_.bytesLoaded = param1.bytesLoaded;
      _loc2_.bytesTotal = param1.bytesTotal;
      _loc2_.errorText = param1.errorText;
      dispatchEvent(_loc2_);
   }
}

import mx.modules.IModuleInfo;
import mx.styles.IStyleModule;

class StyleModuleInfo
{
    
   
   public var errorHandler:Function;
   
   public var readyHandler:Function;
   
   public var module:IModuleInfo;
   
   public var styleModule:IStyleModule;
   
   public function StyleModuleInfo(param1:IModuleInfo, param2:Function, param3:Function)
   {
      super();
      this.module = param1;
      this.readyHandler = param2;
      this.errorHandler = param3;
   }
}
