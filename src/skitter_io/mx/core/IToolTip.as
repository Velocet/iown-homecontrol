package mx.core
{
   import flash.geom.Rectangle;
   
   public interface IToolTip extends IUIComponent
   {
       
      
      function set text(param1:String) : void;
      
      function get screen() : Rectangle;
      
      function get text() : String;
   }
}
