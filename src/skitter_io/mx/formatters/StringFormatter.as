package mx.formatters
{
   import mx.core.mx_internal;
   
   public class StringFormatter
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var reqFormat:String;
      
      private var extractToken:Function;
      
      private var patternInfo:Array;
      
      public function StringFormatter(param1:String, param2:String, param3:Function)
      {
         super();
         formatPattern(param1,param2);
         extractToken = param3;
      }
      
      public function formatValue(param1:Object) : String
      {
         var _loc2_:Object = patternInfo[0];
         var _loc3_:String = reqFormat.substring(0,_loc2_.begin) + extractToken(param1,_loc2_);
         var _loc4_:Object = _loc2_;
         var _loc5_:int = 0;
         var _loc6_:int = 1;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = patternInfo[_loc6_];
            _loc3_ += reqFormat.substring(_loc4_.end,_loc2_.begin) + extractToken(param1,_loc2_);
            _loc4_ = _loc2_;
            _loc6_++;
         }
         if(_loc4_.end > 0 && _loc4_.end != reqFormat.length)
         {
            _loc3_ += reqFormat.substring(_loc4_.end);
         }
         return _loc3_;
      }
      
      private function compareValues(param1:Object, param2:Object) : int
      {
         if(param1.begin > param2.begin)
         {
            return 1;
         }
         if(param1.begin < param2.begin)
         {
            return -1;
         }
         return 0;
      }
      
      private function formatPattern(param1:String, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = param2.split(",");
         reqFormat = param1;
         patternInfo = [];
         var _loc7_:int = int(_loc6_.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = reqFormat.indexOf(_loc6_[_loc8_]);
            if(_loc3_ >= 0 && _loc3_ < reqFormat.length)
            {
               _loc4_ = (_loc4_ = reqFormat.lastIndexOf(_loc6_[_loc8_])) >= 0 ? _loc4_ + 1 : _loc3_ + 1;
               patternInfo.splice(_loc5_,0,{
                  "token":_loc6_[_loc8_],
                  "begin":_loc3_,
                  "end":_loc4_
               });
               _loc5_++;
            }
            _loc8_++;
         }
         patternInfo.sort(compareValues);
      }
   }
}
