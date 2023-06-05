package nz.co.codec.flexorm
{
   import mx.rpc.IResponder;
   
   public interface ICommand
   {
       
      
      function set responder(param1:IResponder) : void;
      
      function execute() : void;
   }
}
