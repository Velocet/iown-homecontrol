package mx.controls.menuClasses
{
   import mx.collections.ICollectionView;
   
   public interface IMenuDataDescriptor
   {
       
      
      function getData(param1:Object, param2:Object = null) : Object;
      
      function isToggled(param1:Object) : Boolean;
      
      function removeChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean;
      
      function isBranch(param1:Object, param2:Object = null) : Boolean;
      
      function setToggled(param1:Object, param2:Boolean) : void;
      
      function getType(param1:Object) : String;
      
      function getGroupName(param1:Object) : String;
      
      function getChildren(param1:Object, param2:Object = null) : ICollectionView;
      
      function isEnabled(param1:Object) : Boolean;
      
      function hasChildren(param1:Object, param2:Object = null) : Boolean;
      
      function addChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean;
      
      function setEnabled(param1:Object, param2:Boolean) : void;
   }
}
