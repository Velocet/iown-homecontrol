package mx.core
{
   import flash.utils.Dictionary;
   
   public interface IFlexModuleFactory
   {
       
      
      function get preloadedRSLs() : Dictionary;
      
      function allowInsecureDomain(... rest) : void;
      
      function create(... rest) : Object;
      
      function allowDomain(... rest) : void;
      
      function info() : Object;
   }
}
