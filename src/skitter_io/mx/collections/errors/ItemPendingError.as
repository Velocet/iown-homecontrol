package mx.collections.errors
{
   import mx.core.mx_internal;
   import mx.rpc.IResponder;
   
   public class ItemPendingError extends Error
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _responders:Array;
      
      public function ItemPendingError(param1:String)
      {
         super(param1);
      }
      
      public function get responders() : Array
      {
         return _responders;
      }
      
      public function addResponder(param1:IResponder) : void
      {
         if(!_responders)
         {
            _responders = [];
         }
         _responders.push(param1);
      }
   }
}
