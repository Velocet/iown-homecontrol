package mx.styles
{
   import flash.events.IEventDispatcher;
   
   public interface IStyleManager
   {
       
      
      function isColorName(param1:String) : Boolean;
      
      function registerParentDisplayListInvalidatingStyle(param1:String) : void;
      
      function registerInheritingStyle(param1:String) : void;
      
      function set stylesRoot(param1:Object) : void;
      
      function get typeSelectorCache() : Object;
      
      function styleDeclarationsChanged() : void;
      
      function setStyleDeclaration(param1:String, param2:CSSStyleDeclaration, param3:Boolean) : void;
      
      function isParentDisplayListInvalidatingStyle(param1:String) : Boolean;
      
      function isSizeInvalidatingStyle(param1:String) : Boolean;
      
      function get inheritingStyles() : Object;
      
      function isValidStyleValue(param1:*) : Boolean;
      
      function isParentSizeInvalidatingStyle(param1:String) : Boolean;
      
      function getColorName(param1:Object) : uint;
      
      function set typeSelectorCache(param1:Object) : void;
      
      function unloadStyleDeclarations(param1:String, param2:Boolean = true) : void;
      
      function getColorNames(param1:Array) : void;
      
      function loadStyleDeclarations(param1:String, param2:Boolean = true, param3:Boolean = false) : IEventDispatcher;
      
      function isInheritingStyle(param1:String) : Boolean;
      
      function set inheritingStyles(param1:Object) : void;
      
      function get stylesRoot() : Object;
      
      function initProtoChainRoots() : void;
      
      function registerColorName(param1:String, param2:uint) : void;
      
      function registerParentSizeInvalidatingStyle(param1:String) : void;
      
      function registerSizeInvalidatingStyle(param1:String) : void;
      
      function clearStyleDeclaration(param1:String, param2:Boolean) : void;
      
      function isInheritingTextFormatStyle(param1:String) : Boolean;
      
      function getStyleDeclaration(param1:String) : CSSStyleDeclaration;
   }
}
