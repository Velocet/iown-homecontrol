package mx.managers
{
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.utils.Dictionary;
   import mx.core.ApplicationGlobals;
   import mx.core.mx_internal;
   import mx.events.BrowserChangeEvent;
   
   public class HistoryManagerImpl implements mx.managers.IHistoryManager
   {
      
      private static const NAME_VALUE_SEPARATOR:String = "=";
      
      private static var instance:mx.managers.IHistoryManager;
      
      private static var appID:String;
      
      private static const HANDSHAKE_INTERVAL:int = 500;
      
      private static var historyURL:String;
      
      private static const ID_NAME_SEPARATOR:String = "-";
      
      private static const MAX_HANDSHAKE_TRIES:int = 100;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const PROPERTY_SEPARATOR:String = "&";
      
      private static var systemManager:mx.managers.ISystemManager;
       
      
      private var registeredObjects:Array;
      
      private var pendingQueryString:String;
      
      private var pendingStates:Object;
      
      private var registrationMap:Dictionary;
      
      public function HistoryManagerImpl()
      {
         var _loc1_:LoaderInfo = null;
         var _loc2_:String = null;
         registeredObjects = [];
         pendingStates = {};
         super();
         if(instance)
         {
            throw new Error("Instance already exists.");
         }
         if(appID)
         {
            return;
         }
         if(!ApplicationGlobals.application.historyManagementEnabled)
         {
            return;
         }
         if(false)
         {
            _loc1_ = HistoryManagerGlobals.loaderInfo;
         }
         else
         {
            _loc1_ = DisplayObject(systemManager).loaderInfo;
         }
         if(false)
         {
            _loc2_ = HistoryManagerGlobals.loaderInfo.url;
         }
         else
         {
            _loc2_ = DisplayObject(systemManager).loaderInfo.url;
         }
         appID = calcCRC(_loc2_);
         BrowserManager.getInstance().addEventListener(BrowserChangeEvent.BROWSER_URL_CHANGE,browserURLChangeHandler);
         BrowserManager.getInstance().initForHistoryManager();
      }
      
      public static function getInstance() : mx.managers.IHistoryManager
      {
         if(!instance)
         {
            systemManager = SystemManagerGlobals.topLevelSystemManagers[0];
            instance = new HistoryManagerImpl();
         }
         return instance;
      }
      
      public function registered() : void
      {
      }
      
      public function unregister(param1:IHistoryManagerClient) : void
      {
         if(!ApplicationGlobals.application.historyManagementEnabled)
         {
            return;
         }
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(registeredObjects[_loc4_] == param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc2_ >= 0)
         {
            registeredObjects.splice(_loc2_,1);
         }
         if(Boolean(param1) && Boolean(registrationMap))
         {
            delete registrationMap[param1];
         }
      }
      
      private function updateCRC(param1:uint, param2:uint) : uint
      {
         var _loc6_:* = false;
         var _loc3_:Number = 4129;
         var _loc4_:* = 128;
         var _loc5_:int = 0;
         while(_loc5_ < 8)
         {
            _loc6_ = (param1 & 32768) != 0;
            param1 <<= 1;
            param1 &= 65535;
            if((param2 & _loc4_) != 0)
            {
               param1++;
            }
            if(_loc6_)
            {
               param1 ^= _loc3_;
            }
            _loc4_ >>= 1;
            _loc5_++;
         }
         return param1;
      }
      
      private function submitQuery() : void
      {
         if(pendingQueryString)
         {
            BrowserManager.getInstance().setFragment(pendingQueryString);
            pendingQueryString = null;
            ApplicationGlobals.application.resetHistory = true;
         }
      }
      
      public function browserURLChangeHandler(param1:BrowserChangeEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:Object = null;
         var _loc13_:IHistoryManagerClient = null;
         if(!ApplicationGlobals.application.historyManagementEnabled)
         {
            return;
         }
         var _loc4_:Array = param1.url.split(PROPERTY_SEPARATOR);
         var _loc5_:* = {};
         var _loc6_:int = int(_loc4_.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc9_ = _loc4_[_loc7_].split(NAME_VALUE_SEPARATOR);
            _loc5_[_loc9_[0]] = parseString(_loc9_[1]);
            _loc7_++;
         }
         var _loc8_:* = {};
         for(_loc2_ in _loc5_)
         {
            if((_loc10_ = _loc2_.indexOf(ID_NAME_SEPARATOR)) > -1)
            {
               _loc3_ = _loc2_.substr(0,_loc10_);
               _loc11_ = _loc2_.substr(_loc10_ + 1,_loc2_.length);
               _loc12_ = _loc5_[_loc2_];
               if(!_loc8_[_loc3_])
               {
                  _loc8_[_loc3_] = {};
               }
               _loc8_[_loc3_][_loc11_] = _loc12_;
            }
         }
         _loc6_ = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc13_ = registeredObjects[_loc7_];
            _loc3_ = getRegistrationInfo(_loc13_).crc;
            _loc13_.loadState(_loc8_[_loc3_]);
            delete _loc8_[_loc3_];
            _loc7_++;
         }
         for(_loc2_ in _loc8_)
         {
            pendingStates[_loc2_] = _loc8_[_loc2_];
         }
      }
      
      public function registerHandshake() : void
      {
      }
      
      private function getRegistrationInfo(param1:IHistoryManagerClient) : RegistrationInfo
      {
         return !!registrationMap ? registrationMap[param1] : null;
      }
      
      private function getPath(param1:IHistoryManagerClient) : String
      {
         return param1.toString();
      }
      
      public function load(param1:Object) : void
      {
      }
      
      private function depthCompare(param1:Object, param2:Object) : int
      {
         var _loc3_:RegistrationInfo = getRegistrationInfo(IHistoryManagerClient(param1));
         var _loc4_:RegistrationInfo = getRegistrationInfo(IHistoryManagerClient(param2));
         if(!_loc3_ || !_loc4_)
         {
            return 0;
         }
         if(_loc3_.depth > _loc4_.depth)
         {
            return 1;
         }
         if(_loc3_.depth < _loc4_.depth)
         {
            return -1;
         }
         return 0;
      }
      
      public function register(param1:IHistoryManagerClient) : void
      {
         if(!ApplicationGlobals.application.historyManagementEnabled)
         {
            return;
         }
         unregister(param1);
         registeredObjects.push(param1);
         var _loc2_:String = getPath(param1);
         var _loc3_:String = calcCRC(_loc2_);
         var _loc4_:int = calcDepth(_loc2_);
         if(!registrationMap)
         {
            registrationMap = new Dictionary(true);
         }
         registrationMap[param1] = new RegistrationInfo(_loc3_,_loc4_);
         registeredObjects.sort(depthCompare);
         if(false)
         {
            param1.loadState(pendingStates[_loc3_]);
            delete pendingStates[_loc3_];
         }
      }
      
      private function parseString(param1:String) : Object
      {
         if(param1 == "true")
         {
            return true;
         }
         if(param1 == "false")
         {
            return false;
         }
         var _loc2_:int = parseInt(param1);
         if(_loc2_.toString() == param1)
         {
            return _loc2_;
         }
         var _loc3_:Number = parseFloat(param1);
         if(_loc3_.toString() == param1)
         {
            return _loc3_;
         }
         return param1;
      }
      
      private function calcDepth(param1:String) : int
      {
         return param1.split(".").length;
      }
      
      public function loadInitialState() : void
      {
      }
      
      public function save() : void
      {
         var _loc5_:IHistoryManagerClient = null;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Object = null;
         if(!ApplicationGlobals.application.historyManagementEnabled)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:String = "app=" + appID;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = (_loc5_ = registeredObjects[_loc4_]).saveState();
            _loc7_ = getRegistrationInfo(_loc5_).crc;
            for(_loc8_ in _loc6_)
            {
               _loc9_ = _loc6_[_loc8_];
               if(_loc2_.length > 0)
               {
                  _loc2_ += PROPERTY_SEPARATOR;
               }
               _loc2_ += _loc7_;
               _loc2_ += ID_NAME_SEPARATOR;
               _loc2_ += escape(_loc8_);
               _loc2_ += NAME_VALUE_SEPARATOR;
               _loc2_ += escape(_loc9_.toString());
               _loc1_ = true;
            }
            _loc4_++;
         }
         if(_loc1_)
         {
            pendingQueryString = _loc2_;
            ApplicationGlobals.application.callLater(this.submitQuery);
         }
      }
      
      private function calcCRC(param1:String) : String
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc2_:* = 65535;
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = uint((_loc5_ = param1.charCodeAt(_loc4_)) & 255);
            if((_loc7_ = uint(_loc5_ >> 8)) != 0)
            {
               _loc2_ = updateCRC(_loc2_,_loc7_);
            }
            _loc2_ = updateCRC(_loc2_,_loc6_);
            _loc4_++;
         }
         _loc2_ = updateCRC(_loc2_,0);
         _loc2_ = updateCRC(_loc2_,0);
         return _loc2_.toString(16);
      }
   }
}

import mx.core.mx_internal;

class RegistrationInfo
{
   
   mx_internal static const VERSION:String = "3.5.0.12683";
    
   
   public var depth:int;
   
   public var crc:String;
   
   public function RegistrationInfo(param1:String, param2:int)
   {
      super();
      this.crc = param1;
      this.depth = param2;
   }
}
