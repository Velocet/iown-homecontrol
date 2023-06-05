package mx.controls.treeClasses
{
   import mx.collections.ICollectionView;
   
   public interface ITreeDataDescriptor
   {
       
      
      function getData(param1:Object, param2:Object = null) : Object;
      
      function getChildren(param1:Object, param2:Object = null) : ICollectionView;
      
      function hasChildren(param1:Object, param2:Object = null) : Boolean;
      
      function removeChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean;
      
      function isBranch(param1:Object, param2:Object = null) : Boolean;
      
      function addChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean;
   }
}
