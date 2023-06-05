package mx.core
{
   import flash.accessibility.AccessibilityProperties;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.IBitmapDrawable;
   import flash.display.LoaderInfo;
   import flash.display.Stage;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Transform;
   
   public interface IFlexDisplayObject extends IBitmapDrawable, IEventDispatcher
   {
       
      
      function get visible() : Boolean;
      
      function get rotation() : Number;
      
      function localToGlobal(param1:Point) : Point;
      
      function get name() : String;
      
      function set width(param1:Number) : void;
      
      function get measuredHeight() : Number;
      
      function get blendMode() : String;
      
      function get scale9Grid() : Rectangle;
      
      function set name(param1:String) : void;
      
      function set scaleX(param1:Number) : void;
      
      function set scaleY(param1:Number) : void;
      
      function get measuredWidth() : Number;
      
      function get accessibilityProperties() : AccessibilityProperties;
      
      function set scrollRect(param1:Rectangle) : void;
      
      function get cacheAsBitmap() : Boolean;
      
      function globalToLocal(param1:Point) : Point;
      
      function get height() : Number;
      
      function set blendMode(param1:String) : void;
      
      function get parent() : DisplayObjectContainer;
      
      function getBounds(param1:DisplayObject) : Rectangle;
      
      function get opaqueBackground() : Object;
      
      function set scale9Grid(param1:Rectangle) : void;
      
      function setActualSize(param1:Number, param2:Number) : void;
      
      function set alpha(param1:Number) : void;
      
      function set accessibilityProperties(param1:AccessibilityProperties) : void;
      
      function get width() : Number;
      
      function hitTestPoint(param1:Number, param2:Number, param3:Boolean = false) : Boolean;
      
      function set cacheAsBitmap(param1:Boolean) : void;
      
      function get scaleX() : Number;
      
      function get scaleY() : Number;
      
      function get scrollRect() : Rectangle;
      
      function get mouseX() : Number;
      
      function get mouseY() : Number;
      
      function set height(param1:Number) : void;
      
      function set mask(param1:DisplayObject) : void;
      
      function getRect(param1:DisplayObject) : Rectangle;
      
      function get alpha() : Number;
      
      function set transform(param1:Transform) : void;
      
      function move(param1:Number, param2:Number) : void;
      
      function get loaderInfo() : LoaderInfo;
      
      function get root() : DisplayObject;
      
      function hitTestObject(param1:DisplayObject) : Boolean;
      
      function set opaqueBackground(param1:Object) : void;
      
      function set visible(param1:Boolean) : void;
      
      function get mask() : DisplayObject;
      
      function set x(param1:Number) : void;
      
      function set y(param1:Number) : void;
      
      function get transform() : Transform;
      
      function set filters(param1:Array) : void;
      
      function get x() : Number;
      
      function get y() : Number;
      
      function get filters() : Array;
      
      function set rotation(param1:Number) : void;
      
      function get stage() : Stage;
   }
}
