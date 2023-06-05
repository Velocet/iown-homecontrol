package air.update.utils
{
   import flash.desktop.NativeApplication;
   
   public class VersionUtils
   {
      
      private static const SPECIALS:Array = ["alpha","beta","rc"];
       
      
      public function VersionUtils()
      {
         super();
      }
      
      public static function isNewerVersion(param1:String, param2:String) : Boolean
      {
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc3_:String = param1.replace(/[+\-_ ]/g,".").replace(/\.(\.)+/g,".").replace(/([^\d\.])([^\D\.])/g,"$1.$2").replace(/([^\D\.])([^\d\.])/g,"$1.$2");
         var _loc4_:String = param2.replace(/[+\-_ ]/g,".").replace(/\.(\.)+/g,".").replace(/([^\d\.])([^\D\.])/g,"$1.$2").replace(/([^\D\.])([^\d\.])/g,"$1.$2");
         var _loc5_:Array = _loc3_.split(".");
         var _loc6_:Array = _loc4_.split(".");
         var _loc7_:int = Math.min(_loc5_.length,_loc6_.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = String(_loc5_[_loc8_]);
            _loc10_ = String(_loc6_[_loc8_]);
            _loc11_ = StringUtils.isDigit(_loc9_.charAt(0));
            _loc12_ = StringUtils.isDigit(_loc10_.charAt(0));
            if(_loc11_ && _loc12_)
            {
               _loc13_ = uint(_loc9_);
               if((_loc14_ = uint(_loc10_)) != _loc13_)
               {
                  return _loc14_ > _loc13_;
               }
            }
            else
            {
               if(!(!_loc11_ && !_loc12_))
               {
                  if(_loc11_)
                  {
                     return false;
                  }
                  return true;
               }
               _loc15_ = SPECIALS.indexOf(_loc9_.toLowerCase());
               _loc16_ = SPECIALS.indexOf(_loc10_.toLowerCase());
               if(_loc15_ != -1 && _loc16_ != -1)
               {
                  if(_loc15_ != _loc16_)
                  {
                     return _loc16_ > _loc15_;
                  }
               }
               else
               {
                  _loc17_ = _loc9_.toLowerCase();
                  if((_loc18_ = _loc10_.toLowerCase()) != _loc17_)
                  {
                     return _loc18_ > _loc17_;
                  }
               }
            }
            _loc8_++;
         }
         if(_loc5_.length == _loc6_.length)
         {
            return false;
         }
         if(_loc5_.length > _loc6_.length)
         {
            if(StringUtils.isDigit(_loc5_[_loc7_].charAt(0)))
            {
               return false;
            }
            return true;
         }
         if(StringUtils.isDigit(_loc6_[_loc7_].charAt(0)))
         {
            return true;
         }
         return false;
      }
      
      public static function getApplicationVersion() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::version;
      }
      
      public static function getApplicationID() : String
      {
         return NativeApplication.nativeApplication.applicationID;
      }
   }
}
