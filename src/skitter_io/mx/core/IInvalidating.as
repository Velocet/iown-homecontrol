package mx.core
{
   public interface IInvalidating
   {
       
      
      function validateNow() : void;
      
      function invalidateSize() : void;
      
      function invalidateDisplayList() : void;
      
      function invalidateProperties() : void;
   }
}
