package mx.validators
{
   import mx.events.ValidationResultEvent;
   
   public interface IValidatorListener
   {
       
      
      function set errorString(param1:String) : void;
      
      function get validationSubField() : String;
      
      function validationResultHandler(param1:ValidationResultEvent) : void;
      
      function set validationSubField(param1:String) : void;
      
      function get errorString() : String;
   }
}
