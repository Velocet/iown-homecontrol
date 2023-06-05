package mx.preloaders
{
   import flash.display.Sprite;
   import flash.events.IEventDispatcher;
   
   public interface IPreloaderDisplay extends IEventDispatcher
   {
       
      
      function set backgroundAlpha(param1:Number) : void;
      
      function get stageHeight() : Number;
      
      function get stageWidth() : Number;
      
      function set backgroundColor(param1:uint) : void;
      
      function set preloader(param1:Sprite) : void;
      
      function get backgroundImage() : Object;
      
      function get backgroundSize() : String;
      
      function get backgroundAlpha() : Number;
      
      function set stageHeight(param1:Number) : void;
      
      function get backgroundColor() : uint;
      
      function set stageWidth(param1:Number) : void;
      
      function set backgroundImage(param1:Object) : void;
      
      function set backgroundSize(param1:String) : void;
      
      function initialize() : void;
   }
}
