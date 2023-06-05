package mx.core
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public interface IChildList
   {
       
      
      function get numChildren() : int;
      
      function removeChild(param1:DisplayObject) : DisplayObject;
      
      function getChildByName(param1:String) : DisplayObject;
      
      function removeChildAt(param1:int) : DisplayObject;
      
      function getChildIndex(param1:DisplayObject) : int;
      
      function addChildAt(param1:DisplayObject, param2:int) : DisplayObject;
      
      function getObjectsUnderPoint(param1:Point) : Array;
      
      function setChildIndex(param1:DisplayObject, param2:int) : void;
      
      function getChildAt(param1:int) : DisplayObject;
      
      function addChild(param1:DisplayObject) : DisplayObject;
      
      function contains(param1:DisplayObject) : Boolean;
   }
}
