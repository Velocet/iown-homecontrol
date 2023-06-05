package mx.rpc
{
   public class Fault extends Error
   {
       
      
      public var rootCause:Object;
      
      protected var _faultCode:String;
      
      protected var _faultString:String;
      
      public var content:Object;
      
      protected var _faultDetail:String;
      
      public function Fault(param1:String, param2:String, param3:String = null)
      {
         super("faultCode:" + param1 + " faultString:\'" + param2 + "\' faultDetail:\'" + param3 + "\'");
         this._faultCode = param1;
         this._faultString = !!param2 ? param2 : "";
         this._faultDetail = param3;
      }
      
      public function get faultString() : String
      {
         return _faultString;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "[RPC Fault";
         _loc1_ += " faultString=\"" + faultString + "\"";
         _loc1_ += " faultCode=\"" + faultCode + "\"";
         return _loc1_ + (" faultDetail=\"" + faultDetail + "\"]");
      }
      
      public function get faultCode() : String
      {
         return _faultCode;
      }
      
      public function get faultDetail() : String
      {
         return _faultDetail;
      }
   }
}
