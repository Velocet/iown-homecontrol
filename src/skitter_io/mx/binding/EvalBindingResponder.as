package mx.binding
{
   import mx.core.mx_internal;
   import mx.rpc.IResponder;
   
   public class EvalBindingResponder implements IResponder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var binding:mx.binding.Binding;
      
      private var object:Object;
      
      public function EvalBindingResponder(param1:mx.binding.Binding, param2:Object)
      {
         super();
         this.binding = param1;
         this.object = param2;
      }
      
      public function fault(param1:Object) : void
      {
      }
      
      public function result(param1:Object) : void
      {
         binding.execute(object);
      }
   }
}
