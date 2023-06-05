package mx.core
{
   public interface IEmbeddedFontRegistry
   {
       
      
      function getAssociatedModuleFactory(param1:EmbeddedFont, param2:IFlexModuleFactory) : IFlexModuleFactory;
      
      function registerFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void;
      
      function deregisterFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void;
      
      function getFonts() : Array;
   }
}
