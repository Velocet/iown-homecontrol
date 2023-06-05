package mx.core
{
   import mx.resources.ResourceManager;
   
   public class FlexVersion
   {
      
      private static var compatibilityVersionChanged:Boolean = false;
      
      public static const VERSION_2_0_1:uint = 33554433;
      
      private static var _compatibilityErrorFunction:Function;
      
      public static const CURRENT_VERSION:uint = 50331648;
      
      public static const VERSION_3_0:uint = 50331648;
      
      public static const VERSION_2_0:uint = 33554432;
      
      private static var _compatibilityVersion:uint = CURRENT_VERSION;
      
      public static const VERSION_ALREADY_READ:String = "versionAlreadyRead";
      
      public static const VERSION_ALREADY_SET:String = "versionAlreadySet";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var compatibilityVersionRead:Boolean = false;
       
      
      public function FlexVersion()
      {
         super();
      }
      
      mx_internal static function changeCompatibilityVersionString(param1:String) : void
      {
         var _loc2_:Array = param1.split(".");
         var _loc3_:uint = parseInt(_loc2_[0]);
         var _loc4_:uint = parseInt(_loc2_[1]);
         var _loc5_:uint = parseInt(_loc2_[2]);
         _compatibilityVersion = (_loc3_ << 24) + (_loc4_ << 16) + _loc5_;
      }
      
      public static function set compatibilityVersion(param1:uint) : void
      {
         var _loc2_:String = null;
         if(param1 == _compatibilityVersion)
         {
            return;
         }
         if(compatibilityVersionChanged)
         {
            if(compatibilityErrorFunction == null)
            {
               _loc2_ = ResourceManager.getInstance().getString("core",VERSION_ALREADY_SET);
               throw new Error(_loc2_);
            }
            compatibilityErrorFunction(param1,VERSION_ALREADY_SET);
         }
         if(compatibilityVersionRead)
         {
            if(compatibilityErrorFunction == null)
            {
               _loc2_ = ResourceManager.getInstance().getString("core",VERSION_ALREADY_READ);
               throw new Error(_loc2_);
            }
            compatibilityErrorFunction(param1,VERSION_ALREADY_READ);
         }
         _compatibilityVersion = param1;
         compatibilityVersionChanged = true;
      }
      
      public static function get compatibilityVersion() : uint
      {
         compatibilityVersionRead = true;
         return _compatibilityVersion;
      }
      
      public static function set compatibilityErrorFunction(param1:Function) : void
      {
         _compatibilityErrorFunction = param1;
      }
      
      public static function set compatibilityVersionString(param1:String) : void
      {
         var _loc2_:Array = param1.split(".");
         var _loc3_:uint = parseInt(_loc2_[0]);
         var _loc4_:uint = parseInt(_loc2_[1]);
         var _loc5_:uint = parseInt(_loc2_[2]);
         compatibilityVersion = (_loc3_ << 24) + (_loc4_ << 16) + _loc5_;
      }
      
      public static function get compatibilityErrorFunction() : Function
      {
         return _compatibilityErrorFunction;
      }
      
      public static function get compatibilityVersionString() : String
      {
         var _loc1_:uint = uint(compatibilityVersion >> 24 & 255);
         var _loc2_:uint = uint(compatibilityVersion >> 16 & 255);
         var _loc3_:uint = uint(compatibilityVersion & 65535);
         return _loc1_.toString() + "." + _loc2_.toString() + "." + _loc3_.toString();
      }
   }
}
