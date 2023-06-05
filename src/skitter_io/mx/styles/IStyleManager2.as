package mx.styles
{
   import flash.events.IEventDispatcher;
   import flash.system.ApplicationDomain;
   import flash.system.SecurityDomain;
   
   public interface IStyleManager2 extends IStyleManager
   {
       
      
      function get selectors() : Array;
      
      function loadStyleDeclarations2(param1:String, param2:Boolean = true, param3:ApplicationDomain = null, param4:SecurityDomain = null) : IEventDispatcher;
   }
}
