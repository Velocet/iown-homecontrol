package mx.managers
{
   public interface IFocusManagerComponent
   {
       
      
      function set focusEnabled(param1:Boolean) : void;
      
      function drawFocus(param1:Boolean) : void;
      
      function setFocus() : void;
      
      function get focusEnabled() : Boolean;
      
      function get tabEnabled() : Boolean;
      
      function get tabIndex() : int;
      
      function get mouseFocusEnabled() : Boolean;
   }
}
