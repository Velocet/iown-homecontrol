package mx.core
{
   public interface IRepeaterClient
   {
       
      
      function get instanceIndices() : Array;
      
      function set instanceIndices(param1:Array) : void;
      
      function get isDocument() : Boolean;
      
      function set repeaters(param1:Array) : void;
      
      function initializeRepeaterArrays(param1:IRepeaterClient) : void;
      
      function get repeaters() : Array;
      
      function set repeaterIndices(param1:Array) : void;
      
      function get repeaterIndices() : Array;
   }
}
