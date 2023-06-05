package nz.co.codec.flexorm.command
{
   import flash.data.SQLConnection;
   import mx.utils.StringUtil;
   
   public class SQLParameterisedCommand extends SQLCommand
   {
       
      
      public function SQLParameterisedCommand(param1:SQLConnection, param2:String, param3:String, param4:int = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      public function setParam(param1:String, param2:Object) : void
      {
         if(param1 == null)
         {
            throw new Error("Null param set on SQLParameterisedCommand. ");
         }
         _statement.parameters[":" + param1] = param2;
      }
      
      override protected function debug() : void
      {
         super.debug();
         this.traceParameters();
      }
      
      protected function traceParameters() : void
      {
         var _loc1_:* = null;
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         for(_loc1_ in _statement.parameters)
         {
            _loc2_ = _statement.parameters[_loc1_];
            _loc3_ = 20 - _loc1_.length;
            while(_loc3_-- > 0)
            {
               _loc1_ += " ";
            }
            if(_loc2_ is String)
            {
               trace(StringUtil.substitute("_param {0}=\"{1}\"",_loc1_,_loc2_));
            }
            else
            {
               trace(StringUtil.substitute("_param {0}={1}",_loc1_,_loc2_));
            }
         }
         trace();
      }
   }
}
