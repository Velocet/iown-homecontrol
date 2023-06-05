package mx.formatters
{
   import flash.events.Event;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class DateBase
   {
      
      private static var _resourceManager:IResourceManager;
      
      private static var monthNamesShortOverride:Array;
      
      private static var _dayNamesShort:Array;
      
      private static var initialized:Boolean = false;
      
      private static var _dayNamesLong:Array;
      
      private static var dayNamesLongOverride:Array;
      
      private static var _monthNamesLong:Array;
      
      private static var timeOfDayOverride:Array;
      
      private static var monthNamesLongOverride:Array;
      
      private static var _monthNamesShort:Array;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var _timeOfDay:Array;
      
      private static var dayNamesShortOverride:Array;
       
      
      public function DateBase()
      {
         super();
      }
      
      public static function get monthNamesLong() : Array
      {
         initialize();
         return _monthNamesLong;
      }
      
      public static function set monthNamesLong(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         monthNamesLongOverride = param1;
         _monthNamesLong = param1 != null ? param1 : resourceManager.getStringArray("SharedResources","monthNames");
         if(param1 == null)
         {
            _loc2_ = String(resourceManager.getString("SharedResources","monthSymbol"));
            if(_loc2_ != " ")
            {
               _loc3_ = !!_monthNamesLong ? 0 : 0;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _monthNamesLong[_loc4_] += _loc2_;
                  _loc4_++;
               }
            }
         }
      }
      
      public static function get dayNamesLong() : Array
      {
         initialize();
         return _dayNamesLong;
      }
      
      private static function static_resourceManager_changeHandler(param1:Event) : void
      {
         static_resourcesChanged();
      }
      
      mx_internal static function get defaultStringKey() : Array
      {
         initialize();
         return monthNamesLong.concat(timeOfDay);
      }
      
      public static function set dayNamesLong(param1:Array) : void
      {
         dayNamesLongOverride = param1;
         _dayNamesLong = param1 != null ? param1 : resourceManager.getStringArray("SharedResources","dayNames");
      }
      
      public static function set timeOfDay(param1:Array) : void
      {
         timeOfDayOverride = param1;
         var _loc2_:String = String(resourceManager.getString("formatters","am"));
         var _loc3_:String = String(resourceManager.getString("formatters","pm"));
         _timeOfDay = param1 != null ? param1 : [_loc2_,_loc3_];
      }
      
      public static function set monthNamesShort(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         monthNamesShortOverride = param1;
         _monthNamesShort = param1 != null ? param1 : resourceManager.getStringArray("formatters","monthNamesShort");
         if(param1 == null)
         {
            _loc2_ = String(resourceManager.getString("SharedResources","monthSymbol"));
            if(_loc2_ != " ")
            {
               _loc3_ = !!_monthNamesShort ? 0 : 0;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _monthNamesShort[_loc4_] += _loc2_;
                  _loc4_++;
               }
            }
         }
      }
      
      public static function get dayNamesShort() : Array
      {
         initialize();
         return _dayNamesShort;
      }
      
      private static function static_resourcesChanged() : void
      {
         dayNamesLong = dayNamesLongOverride;
         dayNamesShort = dayNamesShortOverride;
         monthNamesLong = monthNamesLongOverride;
         monthNamesShort = monthNamesShortOverride;
         timeOfDay = timeOfDayOverride;
      }
      
      public static function get timeOfDay() : Array
      {
         initialize();
         return _timeOfDay;
      }
      
      mx_internal static function extractTokenDate(param1:Date, param2:Object) : String
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         initialize();
         var _loc3_:String = "";
         var _loc4_:int = int(param2.end) - int(param2.begin);
         switch(param2.token)
         {
            case "Y":
               _loc7_ = param1.getFullYear().toString();
               if(_loc4_ < 3)
               {
                  return _loc7_.substr(2);
               }
               if(_loc4_ > 4)
               {
                  return setValue(Number(_loc7_),_loc4_);
               }
               return _loc7_;
               break;
            case "M":
               _loc8_ = int(param1.getMonth());
               if(_loc4_ < 3)
               {
                  _loc8_++;
                  return _loc3_ + setValue(_loc8_,_loc4_);
               }
               if(_loc4_ == 3)
               {
                  return monthNamesShort[_loc8_];
               }
               return monthNamesLong[_loc8_];
               break;
            case "D":
               _loc5_ = int(param1.getDate());
               return _loc3_ + setValue(_loc5_,_loc4_);
            case "E":
               _loc5_ = int(param1.getDay());
               if(_loc4_ < 3)
               {
                  return _loc3_ + setValue(_loc5_,_loc4_);
               }
               if(_loc4_ == 3)
               {
                  return dayNamesShort[_loc5_];
               }
               return dayNamesLong[_loc5_];
               break;
            case "A":
               if((_loc6_ = int(param1.getHours())) < 12)
               {
                  return timeOfDay[0];
               }
               return timeOfDay[1];
               break;
            case "H":
               if((_loc6_ = int(param1.getHours())) == 0)
               {
                  _loc6_ = 24;
               }
               return _loc3_ + setValue(_loc6_,_loc4_);
            case "J":
               _loc6_ = int(param1.getHours());
               return _loc3_ + setValue(_loc6_,_loc4_);
            case "K":
               if((_loc6_ = int(param1.getHours())) >= 12)
               {
                  _loc6_ -= 12;
               }
               return _loc3_ + setValue(_loc6_,_loc4_);
            case "L":
               if((_loc6_ = int(param1.getHours())) == 0)
               {
                  _loc6_ = 12;
               }
               else if(_loc6_ > 12)
               {
                  _loc6_ -= 12;
               }
               return _loc3_ + setValue(_loc6_,_loc4_);
            case "N":
               _loc9_ = int(param1.getMinutes());
               return _loc3_ + setValue(_loc9_,_loc4_);
            case "S":
               _loc10_ = int(param1.getSeconds());
               return _loc3_ + setValue(_loc10_,_loc4_);
            case "Q":
               _loc11_ = int(param1.getMilliseconds());
               return _loc3_ + setValue(_loc11_,_loc4_);
            default:
               return _loc3_;
         }
      }
      
      private static function initialize() : void
      {
         if(!initialized)
         {
            resourceManager.addEventListener(Event.CHANGE,static_resourceManager_changeHandler,false,0,true);
            static_resourcesChanged();
            initialized = true;
         }
      }
      
      public static function set dayNamesShort(param1:Array) : void
      {
         dayNamesShortOverride = param1;
         _dayNamesShort = param1 != null ? param1 : resourceManager.getStringArray("formatters","dayNamesShort");
      }
      
      private static function get resourceManager() : IResourceManager
      {
         if(!_resourceManager)
         {
            _resourceManager = ResourceManager.getInstance();
         }
         return _resourceManager;
      }
      
      public static function get monthNamesShort() : Array
      {
         initialize();
         return _monthNamesShort;
      }
      
      private static function setValue(param1:Object, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = "";
         var _loc4_:int;
         if((_loc4_ = int(param1.toString().length)) < param2)
         {
            _loc5_ = param2 - _loc4_;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_ += "0";
               _loc6_++;
            }
         }
         return _loc3_ + param1.toString();
      }
   }
}
