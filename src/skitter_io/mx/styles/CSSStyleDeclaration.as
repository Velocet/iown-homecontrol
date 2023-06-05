package mx.styles
{
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import mx.core.Singleton;
   import mx.core.mx_internal;
   import mx.managers.SystemManagerGlobals;
   
   public class CSSStyleDeclaration extends EventDispatcher
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const NOT_A_COLOR:uint = 4294967295;
      
      private static const FILTERMAP_PROP:String = "__reserved__filterMap";
       
      
      mx_internal var effects:Array;
      
      protected var overrides:Object;
      
      public var defaultFactory:Function;
      
      public var factory:Function;
      
      mx_internal var selectorRefCount:int = 0;
      
      private var styleManager:mx.styles.IStyleManager2;
      
      private var clones:Dictionary;
      
      public function CSSStyleDeclaration(param1:String = null)
      {
         clones = new Dictionary(true);
         super();
         if(param1)
         {
            styleManager = Singleton.getInstance("mx.styles::IStyleManager2") as mx.styles.IStyleManager2;
            styleManager.setStyleDeclaration(param1,this,false);
         }
      }
      
      mx_internal function addStyleToProtoChain(param1:Object, param2:DisplayObject, param3:Object = null) : Object
      {
         var p:String = null;
         var emptyObjectFactory:Function = null;
         var filteredChain:Object = null;
         var filterObjectFactory:Function = null;
         var i:String = null;
         var chain:Object = param1;
         var target:DisplayObject = param2;
         var filterMap:Object = param3;
         var nodeAddedToChain:Boolean = false;
         var originalChain:Object = chain;
         if(filterMap)
         {
            chain = {};
         }
         if(defaultFactory != null)
         {
            defaultFactory.prototype = chain;
            chain = new defaultFactory();
            nodeAddedToChain = true;
         }
         if(factory != null)
         {
            factory.prototype = chain;
            chain = new factory();
            nodeAddedToChain = true;
         }
         if(overrides)
         {
            if(defaultFactory == null && factory == null)
            {
               emptyObjectFactory = function():void
               {
               };
               emptyObjectFactory.prototype = chain;
               chain = new emptyObjectFactory();
               nodeAddedToChain = true;
            }
            for(p in overrides)
            {
               if(overrides[p] === undefined)
               {
                  delete chain[p];
               }
               else
               {
                  chain[p] = overrides[p];
               }
            }
         }
         if(filterMap)
         {
            if(nodeAddedToChain)
            {
               filteredChain = {};
               filterObjectFactory = function():void
               {
               };
               filterObjectFactory.prototype = originalChain;
               filteredChain = new filterObjectFactory();
               for(i in chain)
               {
                  if(filterMap[i] != null)
                  {
                     filteredChain[filterMap[i]] = chain[i];
                  }
               }
               chain = filteredChain;
               chain[FILTERMAP_PROP] = filterMap;
            }
            else
            {
               chain = originalChain;
            }
         }
         if(nodeAddedToChain)
         {
            clones[chain] = 1;
         }
         return chain;
      }
      
      public function getStyle(param1:String) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(overrides)
         {
            if(param1 in overrides && overrides[param1] === undefined)
            {
               return undefined;
            }
            _loc3_ = overrides[param1];
            if(_loc3_ !== undefined)
            {
               return _loc3_;
            }
         }
         if(factory != null)
         {
            factory.prototype = {};
            _loc2_ = new factory();
            _loc3_ = _loc2_[param1];
            if(_loc3_ !== undefined)
            {
               return _loc3_;
            }
         }
         if(defaultFactory != null)
         {
            defaultFactory.prototype = {};
            _loc2_ = new defaultFactory();
            _loc3_ = _loc2_[param1];
            if(_loc3_ !== undefined)
            {
               return _loc3_;
            }
         }
         return undefined;
      }
      
      public function clearStyle(param1:String) : void
      {
         setStyle(param1,undefined);
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc3_:Object = getStyle(param1);
         var _loc4_:Boolean = false;
         if(mx_internal::selectorRefCount > 0 && factory == null && defaultFactory == null && !overrides && _loc3_ !== param2)
         {
            _loc4_ = true;
         }
         if(param2 !== undefined)
         {
            mx_internal::setStyle(param1,param2);
         }
         else
         {
            if(param2 == _loc3_)
            {
               return;
            }
            mx_internal::setStyle(param1,param2);
         }
         var _loc5_:Array;
         var _loc6_:int = int((_loc5_ = SystemManagerGlobals.topLevelSystemManagers).length);
         if(_loc4_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               (_loc8_ = _loc5_[_loc7_]).regenerateStyleCache(true);
               _loc7_++;
            }
         }
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            (_loc8_ = _loc5_[_loc7_]).notifyStyleChangeInChildren(param1,true);
            _loc7_++;
         }
      }
      
      private function clearStyleAttr(param1:String) : void
      {
         var _loc2_:* = undefined;
         if(!overrides)
         {
            overrides = {};
         }
         overrides[param1] = undefined;
         for(_loc2_ in clones)
         {
            delete _loc2_[param1];
         }
      }
      
      mx_internal function createProtoChainRoot() : Object
      {
         var _loc1_:* = {};
         if(defaultFactory != null)
         {
            defaultFactory.prototype = _loc1_;
            _loc1_ = new defaultFactory();
         }
         if(factory != null)
         {
            factory.prototype = _loc1_;
            _loc1_ = new factory();
         }
         clones[_loc1_] = 1;
         return _loc1_;
      }
      
      mx_internal function clearOverride(param1:String) : void
      {
         if(Boolean(overrides) && false)
         {
            delete overrides[param1];
         }
      }
      
      mx_internal function setStyle(param1:String, param2:*) : void
      {
         var _loc3_:Object = null;
         var _loc4_:* = undefined;
         var _loc5_:Number = NaN;
         var _loc6_:Object = null;
         if(param2 === undefined)
         {
            clearStyleAttr(param1);
            return;
         }
         if(param2 is String)
         {
            if(!styleManager)
            {
               styleManager = Singleton.getInstance("mx.styles::IStyleManager2") as mx.styles.IStyleManager2;
            }
            if((_loc5_ = Number(styleManager.getColorName(param2))) != NOT_A_COLOR)
            {
               param2 = _loc5_;
            }
         }
         if(defaultFactory != null)
         {
            _loc3_ = new defaultFactory();
            if(_loc3_[param1] !== param2)
            {
               if(!overrides)
               {
                  overrides = {};
               }
               overrides[param1] = param2;
            }
            else if(overrides)
            {
               delete overrides[param1];
            }
         }
         if(factory != null)
         {
            _loc3_ = new factory();
            if(_loc3_[param1] !== param2)
            {
               if(!overrides)
               {
                  overrides = {};
               }
               overrides[param1] = param2;
            }
            else if(overrides)
            {
               delete overrides[param1];
            }
         }
         if(defaultFactory == null && factory == null)
         {
            if(!overrides)
            {
               overrides = {};
            }
            overrides[param1] = param2;
         }
         for(_loc4_ in clones)
         {
            if(_loc6_ = _loc4_[FILTERMAP_PROP])
            {
               if(_loc6_[param1] != null)
               {
                  _loc4_[_loc6_[param1]] = param2;
               }
            }
            else
            {
               _loc4_[param1] = param2;
            }
         }
      }
   }
}
