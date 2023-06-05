package mx.controls.treeClasses
{
   import mx.collections.ICollectionView;
   import mx.collections.IViewCursor;
   
   public interface ITreeDataDescriptor2 extends ITreeDataDescriptor
   {
       
      
      function getHierarchicalCollectionAdaptor(param1:ICollectionView, param2:Function, param3:Object, param4:Object = null) : ICollectionView;
      
      function getNodeDepth(param1:Object, param2:IViewCursor, param3:Object = null) : int;
      
      function getParent(param1:Object, param2:ICollectionView, param3:Object = null) : Object;
   }
}
