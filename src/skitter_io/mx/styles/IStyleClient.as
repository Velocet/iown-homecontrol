package mx.styles
{
   public interface IStyleClient extends ISimpleStyleClient
   {
       
      
      function regenerateStyleCache(param1:Boolean) : void;
      
      function get className() : String;
      
      function clearStyle(param1:String) : void;
      
      function getClassStyleDeclarations() : Array;
      
      function get inheritingStyles() : Object;
      
      function set nonInheritingStyles(param1:Object) : void;
      
      function setStyle(param1:String, param2:*) : void;
      
      function get styleDeclaration() : CSSStyleDeclaration;
      
      function set styleDeclaration(param1:CSSStyleDeclaration) : void;
      
      function get nonInheritingStyles() : Object;
      
      function set inheritingStyles(param1:Object) : void;
      
      function getStyle(param1:String) : *;
      
      function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void;
      
      function registerEffects(param1:Array) : void;
   }
}
