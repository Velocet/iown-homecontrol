package mx.managers
{
   public interface IHistoryManager
   {
       
      
      function registered() : void;
      
      function register(param1:IHistoryManagerClient) : void;
      
      function registerHandshake() : void;
      
      function load(param1:Object) : void;
      
      function loadInitialState() : void;
      
      function unregister(param1:IHistoryManagerClient) : void;
      
      function save() : void;
   }
}
