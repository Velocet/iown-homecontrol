package mx.collections
{
   import mx.core.mx_internal;
   import mx.rpc.IResponder;
   
   public class ItemResponder implements IResponder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _faultHandler:Function;
      
      private var _token:Object;
      
      private var _resultHandler:Function;
      
      public function ItemResponder(param1:Function, param2:Function, param3:Object = null)
      {
         super();
         _resultHandler = param1;
         _faultHandler = param2;
         _token = param3;
      }
      
      public function result(param1:Object) : void
      {
         _resultHandler(param1,_token);
      }
      
      public function fault(param1:Object) : void
      {
         _faultHandler(param1,_token);
      }
   }
}
