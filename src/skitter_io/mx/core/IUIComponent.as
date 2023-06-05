package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import mx.managers.ISystemManager;
   
   public interface IUIComponent extends IFlexDisplayObject
   {
       
      
      function set focusPane(param1:Sprite) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function set isPopUp(param1:Boolean) : void;
      
      function get explicitMinHeight() : Number;
      
      function get percentWidth() : Number;
      
      function get isPopUp() : Boolean;
      
      function get owner() : DisplayObjectContainer;
      
      function get percentHeight() : Number;
      
      function get baselinePosition() : Number;
      
      function owns(param1:DisplayObject) : Boolean;
      
      function initialize() : void;
      
      function get maxWidth() : Number;
      
      function get minWidth() : Number;
      
      function getExplicitOrMeasuredWidth() : Number;
      
      function get explicitMaxWidth() : Number;
      
      function get explicitMaxHeight() : Number;
      
      function set percentHeight(param1:Number) : void;
      
      function get minHeight() : Number;
      
      function set percentWidth(param1:Number) : void;
      
      function get document() : Object;
      
      function get focusPane() : Sprite;
      
      function getExplicitOrMeasuredHeight() : Number;
      
      function set tweeningProperties(param1:Array) : void;
      
      function set explicitWidth(param1:Number) : void;
      
      function set measuredMinHeight(param1:Number) : void;
      
      function get explicitMinWidth() : Number;
      
      function get tweeningProperties() : Array;
      
      function get maxHeight() : Number;
      
      function set owner(param1:DisplayObjectContainer) : void;
      
      function set includeInLayout(param1:Boolean) : void;
      
      function setVisible(param1:Boolean, param2:Boolean = false) : void;
      
      function parentChanged(param1:DisplayObjectContainer) : void;
      
      function get explicitWidth() : Number;
      
      function get measuredMinHeight() : Number;
      
      function set measuredMinWidth(param1:Number) : void;
      
      function set explicitHeight(param1:Number) : void;
      
      function get includeInLayout() : Boolean;
      
      function get measuredMinWidth() : Number;
      
      function get explicitHeight() : Number;
      
      function set systemManager(param1:ISystemManager) : void;
      
      function set document(param1:Object) : void;
      
      function get systemManager() : ISystemManager;
   }
}
