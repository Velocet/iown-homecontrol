package mx.core
{
   import flash.geom.Rectangle;
   
   public interface IRectangularBorder extends IBorder
   {
       
      
      function get backgroundImageBounds() : Rectangle;
      
      function get hasBackgroundImage() : Boolean;
      
      function set backgroundImageBounds(param1:Rectangle) : void;
      
      function layoutBackgroundImage() : void;
   }
}
