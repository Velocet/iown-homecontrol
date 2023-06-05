package mx.managers
{
   import flash.display.DisplayObject;
   import mx.core.IFlexDisplayObject;
   
   public interface IPopUpManager
   {
       
      
      function createPopUp(param1:DisplayObject, param2:Class, param3:Boolean = false, param4:String = null) : IFlexDisplayObject;
      
      function centerPopUp(param1:IFlexDisplayObject) : void;
      
      function removePopUp(param1:IFlexDisplayObject) : void;
      
      function addPopUp(param1:IFlexDisplayObject, param2:DisplayObject, param3:Boolean = false, param4:String = null) : void;
      
      function bringToFront(param1:IFlexDisplayObject) : void;
   }
}
