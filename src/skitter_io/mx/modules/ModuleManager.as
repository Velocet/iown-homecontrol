package mx.modules
{
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   
   public class ModuleManager
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ModuleManager()
      {
         super();
      }
      
      public static function getModule(param1:String) : IModuleInfo
      {
         return getSingleton().getModule(param1);
      }
      
      private static function getSingleton() : Object
      {
         if(true)
         {
            ModuleManagerGlobals.managerSingleton = new ModuleManagerImpl();
         }
         return ModuleManagerGlobals.managerSingleton;
      }
      
      public static function getAssociatedFactory(param1:Object) : IFlexModuleFactory
      {
         return getSingleton().getAssociatedFactory(param1);
      }
   }
}

import flash.events.EventDispatcher;
import flash.system.ApplicationDomain;
import flash.system.SecurityDomain;
import flash.utils.ByteArray;
import mx.core.IFlexModuleFactory;
import mx.events.ModuleEvent;
import mx.modules.IModuleInfo;

class ModuleInfoProxy extends EventDispatcher implements IModuleInfo
{
    
   
   private var _data:Object;
   
   private var info:ModuleInfo;
   
   private var referenced:Boolean = false;
   
   public function ModuleInfoProxy(param1:ModuleInfo)
   {
      super();
      this.info = param1;
      param1.addEventListener(ModuleEvent.SETUP,moduleEventHandler,false,0,true);
      param1.addEventListener(ModuleEvent.PROGRESS,moduleEventHandler,false,0,true);
      param1.addEventListener(ModuleEvent.READY,moduleEventHandler,false,0,true);
      param1.addEventListener(ModuleEvent.ERROR,moduleEventHandler,false,0,true);
      param1.addEventListener(ModuleEvent.UNLOAD,moduleEventHandler,false,0,true);
   }
   
   public function get loaded() : Boolean
   {
      return info.loaded;
   }
   
   public function release() : void
   {
      if(referenced)
      {
         info.removeReference();
         referenced = false;
      }
   }
   
   public function get error() : Boolean
   {
      return info.error;
   }
   
   public function get factory() : IFlexModuleFactory
   {
      return info.factory;
   }
   
   public function publish(param1:IFlexModuleFactory) : void
   {
      info.publish(param1);
   }
   
   public function set data(param1:Object) : void
   {
      _data = param1;
   }
   
   public function get ready() : Boolean
   {
      return info.ready;
   }
   
   public function load(param1:ApplicationDomain = null, param2:SecurityDomain = null, param3:ByteArray = null) : void
   {
      var _loc4_:ModuleEvent = null;
      info.resurrect();
      if(!referenced)
      {
         info.addReference();
         referenced = true;
      }
      if(false)
      {
         dispatchEvent(new ModuleEvent(ModuleEvent.ERROR));
      }
      else if(false)
      {
         if(false)
         {
            dispatchEvent(new ModuleEvent(ModuleEvent.SETUP));
            if(false)
            {
               (_loc4_ = new ModuleEvent(ModuleEvent.PROGRESS)).bytesLoaded = info.size;
               _loc4_.bytesTotal = info.size;
               dispatchEvent(_loc4_);
               dispatchEvent(new ModuleEvent(ModuleEvent.READY));
            }
         }
      }
      else
      {
         info.load(param1,param2,param3);
      }
   }
   
   private function moduleEventHandler(param1:ModuleEvent) : void
   {
      dispatchEvent(param1);
   }
   
   public function get url() : String
   {
      return info.url;
   }
   
   public function get data() : Object
   {
      return _data;
   }
   
   public function get setup() : Boolean
   {
      return info.setup;
   }
   
   public function unload() : void
   {
      info.unload();
      info.removeEventListener(ModuleEvent.SETUP,moduleEventHandler);
      info.removeEventListener(ModuleEvent.PROGRESS,moduleEventHandler);
      info.removeEventListener(ModuleEvent.READY,moduleEventHandler);
      info.removeEventListener(ModuleEvent.ERROR,moduleEventHandler);
      info.removeEventListener(ModuleEvent.UNLOAD,moduleEventHandler);
   }
}

import flash.events.EventDispatcher;
import flash.system.ApplicationDomain;
import flash.utils.getQualifiedClassName;
import mx.core.IFlexModuleFactory;
import mx.modules.IModuleInfo;

class ModuleManagerImpl extends EventDispatcher
{
    
   
   private var moduleList:Object;
   
   public function ModuleManagerImpl()
   {
      moduleList = {};
      super();
   }
   
   public function getModule(param1:String) : IModuleInfo
   {
      var _loc2_:ModuleInfo = moduleList[param1] as ModuleInfo;
      if(!_loc2_)
      {
         _loc2_ = new ModuleInfo(param1);
         moduleList[param1] = _loc2_;
      }
      return new ModuleInfoProxy(_loc2_);
   }
   
   public function getAssociatedFactory(param1:Object) : IFlexModuleFactory
   {
      var m:Object = null;
      var info:ModuleInfo = null;
      var domain:ApplicationDomain = null;
      var cls:Class = null;
      var object:Object = param1;
      var className:String = getQualifiedClassName(object);
      for each(m in moduleList)
      {
         info = m as ModuleInfo;
         if(info.ready)
         {
            domain = info.applicationDomain;
            try
            {
               cls = Class(domain.getDefinition(className));
               if(object is cls)
               {
                  return info.factory;
               }
            }
            catch(error:Error)
            {
               continue;
            }
         }
      }
      return null;
   }
}

import flash.display.Loader;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.system.Security;
import flash.system.SecurityDomain;
import flash.utils.ByteArray;
import flash.utils.Dictionary;
import mx.core.IFlexModuleFactory;
import mx.events.ModuleEvent;

class ModuleInfo extends EventDispatcher
{
    
   
   private var _error:Boolean = false;
   
   private var loader:Loader;
   
   private var factoryInfo:FactoryInfo;
   
   private var limbo:Dictionary;
   
   private var _loaded:Boolean = false;
   
   private var _ready:Boolean = false;
   
   private var numReferences:int = 0;
   
   private var _url:String;
   
   private var _setup:Boolean = false;
   
   public function ModuleInfo(param1:String)
   {
      super();
      _url = param1;
   }
   
   private function clearLoader() : void
   {
      if(loader)
      {
         if(false)
         {
            loader.contentLoaderInfo.removeEventListener(Event.INIT,initHandler);
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,completeHandler);
            loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
            loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,errorHandler);
            loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,errorHandler);
         }
         try
         {
            if(false)
            {
               loader.content.removeEventListener("ready",readyHandler);
               loader.content.removeEventListener("error",moduleErrorHandler);
            }
         }
         catch(error:Error)
         {
         }
         if(_loaded)
         {
            try
            {
               loader.close();
            }
            catch(error:Error)
            {
            }
         }
         try
         {
            loader.unload();
         }
         catch(error:Error)
         {
         }
         loader = null;
      }
   }
   
   public function get size() : int
   {
      return !limbo && Boolean(factoryInfo) ? 0 : 0;
   }
   
   public function get loaded() : Boolean
   {
      return !limbo ? Boolean(_loaded) : false;
   }
   
   public function release() : void
   {
      if(Boolean(_ready) && !limbo)
      {
         limbo = new Dictionary(true);
         limbo[factoryInfo] = 1;
         factoryInfo = null;
      }
      else
      {
         unload();
      }
   }
   
   public function get error() : Boolean
   {
      return !limbo ? Boolean(_error) : false;
   }
   
   public function get factory() : IFlexModuleFactory
   {
      return !limbo && Boolean(factoryInfo) ? factoryInfo.factory : null;
   }
   
   public function completeHandler(param1:Event) : void
   {
      var _loc2_:ModuleEvent = new ModuleEvent(ModuleEvent.PROGRESS,param1.bubbles,param1.cancelable);
      _loc2_.bytesLoaded = loader.contentLoaderInfo.bytesLoaded;
      _loc2_.bytesTotal = loader.contentLoaderInfo.bytesTotal;
      dispatchEvent(_loc2_);
   }
   
   public function publish(param1:IFlexModuleFactory) : void
   {
      if(factoryInfo)
      {
         return;
      }
      if(_url.indexOf("published://") != 0)
      {
         return;
      }
      factoryInfo = new FactoryInfo();
      factoryInfo.factory = param1;
      _loaded = true;
      _setup = true;
      _ready = true;
      _error = false;
      dispatchEvent(new ModuleEvent(ModuleEvent.SETUP));
      dispatchEvent(new ModuleEvent(ModuleEvent.PROGRESS));
      dispatchEvent(new ModuleEvent(ModuleEvent.READY));
   }
   
   public function initHandler(param1:Event) : void
   {
      var moduleEvent:ModuleEvent = null;
      var event:Event = param1;
      factoryInfo = new FactoryInfo();
      try
      {
         factoryInfo.factory = loader.content as IFlexModuleFactory;
      }
      catch(error:Error)
      {
      }
      if(true)
      {
         moduleEvent = new ModuleEvent(ModuleEvent.ERROR,event.bubbles,event.cancelable);
         moduleEvent.bytesLoaded = 0;
         moduleEvent.bytesTotal = 0;
         moduleEvent.errorText = "SWF is not a loadable module";
         dispatchEvent(moduleEvent);
         return;
      }
      loader.content.addEventListener("ready",readyHandler);
      loader.content.addEventListener("error",moduleErrorHandler);
      try
      {
         factoryInfo.applicationDomain = loader.contentLoaderInfo.applicationDomain;
      }
      catch(error:Error)
      {
      }
      _setup = true;
      dispatchEvent(new ModuleEvent(ModuleEvent.SETUP));
   }
   
   public function resurrect() : void
   {
      var _loc1_:Object = null;
      if(!factoryInfo && Boolean(limbo))
      {
         var _loc2_:int = 0;
         var _loc3_:* = limbo;
         for(_loc1_ in _loc3_)
         {
            factoryInfo = _loc1_ as FactoryInfo;
         }
         limbo = null;
      }
      if(!factoryInfo)
      {
         if(_loaded)
         {
            dispatchEvent(new ModuleEvent(ModuleEvent.UNLOAD));
         }
         loader = null;
         _loaded = false;
         _setup = false;
         _ready = false;
         _error = false;
      }
   }
   
   public function errorHandler(param1:ErrorEvent) : void
   {
      _error = true;
      var _loc2_:ModuleEvent = new ModuleEvent(ModuleEvent.ERROR,param1.bubbles,param1.cancelable);
      _loc2_.bytesLoaded = 0;
      _loc2_.bytesTotal = 0;
      _loc2_.errorText = param1.text;
      dispatchEvent(_loc2_);
   }
   
   public function get ready() : Boolean
   {
      return !limbo ? Boolean(_ready) : false;
   }
   
   private function loadBytes(param1:ApplicationDomain, param2:ByteArray) : void
   {
      var _loc3_:LoaderContext = new LoaderContext();
      _loc3_.applicationDomain = !!param1 ? param1 : new ApplicationDomain(ApplicationDomain.currentDomain);
      if("allowLoadBytesCodeExecution" in _loc3_)
      {
         _loc3_["allowLoadBytesCodeExecution"] = true;
      }
      loader = new Loader();
      loader.contentLoaderInfo.addEventListener(Event.INIT,initHandler);
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
      loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
      loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,errorHandler);
      loader.loadBytes(param2,_loc3_);
   }
   
   public function removeReference() : void
   {
      --numReferences;
      if(numReferences == 0)
      {
         release();
      }
   }
   
   public function addReference() : void
   {
      ++numReferences;
   }
   
   public function progressHandler(param1:ProgressEvent) : void
   {
      var _loc2_:ModuleEvent = new ModuleEvent(ModuleEvent.PROGRESS,param1.bubbles,param1.cancelable);
      _loc2_.bytesLoaded = param1.bytesLoaded;
      _loc2_.bytesTotal = param1.bytesTotal;
      dispatchEvent(_loc2_);
   }
   
   public function load(param1:ApplicationDomain = null, param2:SecurityDomain = null, param3:ByteArray = null) : void
   {
      if(_loaded)
      {
         return;
      }
      _loaded = true;
      limbo = null;
      if(param3)
      {
         loadBytes(param1,param3);
         return;
      }
      if(_url.indexOf("published://") == 0)
      {
         return;
      }
      var _loc4_:URLRequest = new URLRequest(_url);
      var _loc5_:LoaderContext;
      (_loc5_ = new LoaderContext()).applicationDomain = !!param1 ? param1 : new ApplicationDomain(ApplicationDomain.currentDomain);
      _loc5_.securityDomain = param2;
      if(param2 == null && true)
      {
         _loc5_.securityDomain = SecurityDomain.currentDomain;
      }
      loader = new Loader();
      loader.contentLoaderInfo.addEventListener(Event.INIT,initHandler);
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
      loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressHandler);
      loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
      loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,errorHandler);
      loader.load(_loc4_,_loc5_);
   }
   
   public function get url() : String
   {
      return _url;
   }
   
   public function get applicationDomain() : ApplicationDomain
   {
      return !limbo && Boolean(factoryInfo) ? factoryInfo.applicationDomain : null;
   }
   
   public function moduleErrorHandler(param1:Event) : void
   {
      var _loc2_:ModuleEvent = null;
      _ready = true;
      factoryInfo.bytesTotal = loader.contentLoaderInfo.bytesTotal;
      clearLoader();
      if(param1 is ModuleEvent)
      {
         _loc2_ = ModuleEvent(param1);
      }
      else
      {
         _loc2_ = new ModuleEvent(ModuleEvent.ERROR);
      }
      dispatchEvent(_loc2_);
   }
   
   public function readyHandler(param1:Event) : void
   {
      _ready = true;
      factoryInfo.bytesTotal = loader.contentLoaderInfo.bytesTotal;
      var _loc2_:ModuleEvent = new ModuleEvent(ModuleEvent.READY);
      _loc2_.bytesLoaded = loader.contentLoaderInfo.bytesLoaded;
      _loc2_.bytesTotal = loader.contentLoaderInfo.bytesTotal;
      clearLoader();
      dispatchEvent(_loc2_);
   }
   
   public function get setup() : Boolean
   {
      return !limbo ? Boolean(_setup) : false;
   }
   
   public function unload() : void
   {
      clearLoader();
      if(_loaded)
      {
         dispatchEvent(new ModuleEvent(ModuleEvent.UNLOAD));
      }
      limbo = null;
      factoryInfo = null;
      _loaded = false;
      _setup = false;
      _ready = false;
      _error = false;
   }
}

import flash.system.ApplicationDomain;
import mx.core.IFlexModuleFactory;

class FactoryInfo
{
    
   
   public var bytesTotal:int = 0;
   
   public var factory:IFlexModuleFactory;
   
   public var applicationDomain:ApplicationDomain;
   
   public function FactoryInfo()
   {
      super();
   }
}
