package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.SoundTransform;
   import flash.text.TextSnapshot;
   import mx.managers.IFocusManager;
   
   public interface IContainer extends IUIComponent
   {
       
      
      function set hitArea(param1:Sprite) : void;
      
      function swapChildrenAt(param1:int, param2:int) : void;
      
      function getChildByName(param1:String) : DisplayObject;
      
      function get doubleClickEnabled() : Boolean;
      
      function get graphics() : Graphics;
      
      function get useHandCursor() : Boolean;
      
      function addChildAt(param1:DisplayObject, param2:int) : DisplayObject;
      
      function set mouseChildren(param1:Boolean) : void;
      
      function set creatingContentPane(param1:Boolean) : void;
      
      function get textSnapshot() : TextSnapshot;
      
      function getChildIndex(param1:DisplayObject) : int;
      
      function set doubleClickEnabled(param1:Boolean) : void;
      
      function getObjectsUnderPoint(param1:Point) : Array;
      
      function get creatingContentPane() : Boolean;
      
      function setChildIndex(param1:DisplayObject, param2:int) : void;
      
      function get soundTransform() : SoundTransform;
      
      function set useHandCursor(param1:Boolean) : void;
      
      function get numChildren() : int;
      
      function contains(param1:DisplayObject) : Boolean;
      
      function get verticalScrollPosition() : Number;
      
      function set defaultButton(param1:IFlexDisplayObject) : void;
      
      function swapChildren(param1:DisplayObject, param2:DisplayObject) : void;
      
      function set horizontalScrollPosition(param1:Number) : void;
      
      function get focusManager() : IFocusManager;
      
      function startDrag(param1:Boolean = false, param2:Rectangle = null) : void;
      
      function set mouseEnabled(param1:Boolean) : void;
      
      function getChildAt(param1:int) : DisplayObject;
      
      function set soundTransform(param1:SoundTransform) : void;
      
      function get tabChildren() : Boolean;
      
      function get tabIndex() : int;
      
      function set focusRect(param1:Object) : void;
      
      function get hitArea() : Sprite;
      
      function get mouseChildren() : Boolean;
      
      function removeChildAt(param1:int) : DisplayObject;
      
      function get defaultButton() : IFlexDisplayObject;
      
      function stopDrag() : void;
      
      function set tabEnabled(param1:Boolean) : void;
      
      function get horizontalScrollPosition() : Number;
      
      function get focusRect() : Object;
      
      function get viewMetrics() : EdgeMetrics;
      
      function set verticalScrollPosition(param1:Number) : void;
      
      function get dropTarget() : DisplayObject;
      
      function get mouseEnabled() : Boolean;
      
      function set tabChildren(param1:Boolean) : void;
      
      function set buttonMode(param1:Boolean) : void;
      
      function get tabEnabled() : Boolean;
      
      function get buttonMode() : Boolean;
      
      function removeChild(param1:DisplayObject) : DisplayObject;
      
      function set tabIndex(param1:int) : void;
      
      function addChild(param1:DisplayObject) : DisplayObject;
      
      function areInaccessibleObjectsUnderPoint(param1:Point) : Boolean;
   }
}
