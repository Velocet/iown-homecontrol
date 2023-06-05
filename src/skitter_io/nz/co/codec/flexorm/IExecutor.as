package nz.co.codec.flexorm
{
   import mx.rpc.IResponder;
   
   public interface IExecutor extends ICommand, IResponder
   {
       
      
      function branchNonBlocking() : NonBlockingExecutor;
      
      function add(param1:ICommand, param2:Function = null) : void;
      
      function get id() : *;
      
      function set data(param1:Object) : void;
      
      function set id(param1:*) : void;
      
      function setProperty(param1:String, param2:*) : void;
      
      function get parent() : IExecutor;
      
      function get data() : Object;
      
      function getProperty(param1:String) : *;
      
      function branchBlocking() : BlockingExecutor;
   }
}
