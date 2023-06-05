package mx.core
{
   public interface IButton extends IUIComponent
   {
       
      
      function get emphasized() : Boolean;
      
      function set emphasized(param1:Boolean) : void;
      
      function callLater(param1:Function, param2:Array = null) : void;
   }
}
