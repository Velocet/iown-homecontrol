package mx.core
{
   import flash.display.NativeWindow;
   
   public interface IWindow
   {
       
      
      function get minimizable() : Boolean;
      
      function set titleIcon(param1:Class) : void;
      
      function set status(param1:String) : void;
      
      function get nativeWindow() : NativeWindow;
      
      function get systemChrome() : String;
      
      function get visible() : Boolean;
      
      function get resizable() : Boolean;
      
      function maximize() : void;
      
      function restore() : void;
      
      function set title(param1:String) : void;
      
      function get titleIcon() : Class;
      
      function get status() : String;
      
      function get maximizable() : Boolean;
      
      function get title() : String;
      
      function get transparent() : Boolean;
      
      function get type() : String;
      
      function minimize() : void;
      
      function close() : void;
   }
}
