package mx.managers
{
   public interface IFocusManagerComplexComponent extends IFocusManagerComponent
   {
       
      
      function assignFocus(param1:String) : void;
      
      function get hasFocusableContent() : Boolean;
   }
}
