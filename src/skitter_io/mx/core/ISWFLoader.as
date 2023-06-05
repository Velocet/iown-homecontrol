package mx.core
{
   import flash.geom.Rectangle;
   
   public interface ISWFLoader extends ISWFBridgeProvider
   {
       
      
      function getVisibleApplicationRect(param1:Boolean = false) : Rectangle;
      
      function set loadForCompatibility(param1:Boolean) : void;
      
      function get loadForCompatibility() : Boolean;
   }
}
