package mx.controls.treeClasses
{
   import flash.utils.Dictionary;
   import mx.collections.ArrayCollection;
   import mx.collections.CursorBookmark;
   import mx.collections.ICollectionView;
   import mx.collections.IList;
   import mx.collections.IViewCursor;
   import mx.collections.XMLListCollection;
   import mx.controls.menuClasses.IMenuDataDescriptor;
   import mx.core.mx_internal;
   
   public class DefaultDataDescriptor implements ITreeDataDescriptor2, IMenuDataDescriptor
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var ChildCollectionCache:Dictionary;
      
      public function DefaultDataDescriptor()
      {
         ChildCollectionCache = new Dictionary(true);
         super();
      }
      
      public function setEnabled(param1:Object, param2:Boolean) : void
      {
         var node:Object = param1;
         var value:Boolean = param2;
         if(node is XML)
         {
            node.@enabled = value;
         }
         else if(node is Object)
         {
            try
            {
               node.enabled = value;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function removeChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean
      {
         var cursor:IViewCursor = null;
         var children:ICollectionView = null;
         var parent:Object = param1;
         var child:Object = param2;
         var index:int = param3;
         var model:Object = param4;
         if(!parent)
         {
            try
            {
               if(index > model.length)
               {
                  index = int(model.length);
               }
               if(model is IList)
               {
                  model.removeItemAt(index);
               }
               else
               {
                  cursor = model.createCursor();
                  cursor.seek(CursorBookmark.FIRST,index);
                  cursor.remove();
               }
               return true;
            }
            catch(e:Error)
            {
            }
         }
         else
         {
            children = ICollectionView(getChildren(parent,model));
            try
            {
               if(index > children.length)
               {
                  index = children.length;
               }
               if(children is IList)
               {
                  IList(children).removeItemAt(index);
               }
               else
               {
                  cursor = children.createCursor();
                  cursor.seek(CursorBookmark.FIRST,index);
                  cursor.remove();
               }
               return true;
            }
            catch(e:Error)
            {
            }
         }
         return false;
      }
      
      public function isToggled(param1:Object) : Boolean
      {
         var toggled:* = undefined;
         var node:Object = param1;
         if(node is XML)
         {
            toggled = node.@toggled;
            if(toggled[0] == true)
            {
               return true;
            }
         }
         else if(node is Object)
         {
            try
            {
               return Boolean(node.toggled);
            }
            catch(e:Error)
            {
            }
         }
         return false;
      }
      
      public function getHierarchicalCollectionAdaptor(param1:ICollectionView, param2:Function, param3:Object, param4:Object = null) : ICollectionView
      {
         return new HierarchicalCollectionView(param1,this,param2,param3);
      }
      
      public function addChildAt(param1:Object, param2:Object, param3:int, param4:Object = null) : Boolean
      {
         var cursor:IViewCursor = null;
         var children:ICollectionView = null;
         var temp:XMLList = null;
         var parent:Object = param1;
         var newChild:Object = param2;
         var index:int = param3;
         var model:Object = param4;
         if(!parent)
         {
            try
            {
               if(index > model.length)
               {
                  index = int(model.length);
               }
               if(model is IList)
               {
                  IList(model).addItemAt(newChild,index);
               }
               else
               {
                  cursor = model.createCursor();
                  cursor.seek(CursorBookmark.FIRST,index);
                  cursor.insert(newChild);
               }
               return true;
            }
            catch(e:Error)
            {
            }
         }
         else
         {
            children = ICollectionView(getChildren(parent,model));
            if(!children)
            {
               if(parent is XML)
               {
                  temp = new XMLList();
                  XML(parent).appendChild(temp);
                  children = new XMLListCollection(parent.children());
               }
               else if(parent is Object)
               {
                  parent.children = new ArrayCollection();
                  children = parent.children;
               }
            }
            try
            {
               if(index > children.length)
               {
                  index = children.length;
               }
               if(children is IList)
               {
                  IList(children).addItemAt(newChild,index);
               }
               else
               {
                  cursor = children.createCursor();
                  cursor.seek(CursorBookmark.FIRST,index);
                  cursor.insert(newChild);
               }
               return true;
            }
            catch(e:Error)
            {
            }
         }
         return false;
      }
      
      public function getData(param1:Object, param2:Object = null) : Object
      {
         return Object(param1);
      }
      
      public function setToggled(param1:Object, param2:Boolean) : void
      {
         var node:Object = param1;
         var value:Boolean = param2;
         if(node is XML)
         {
            node.@toggled = value;
         }
         else if(node is Object)
         {
            try
            {
               node.toggled = value;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function getNodeDepth(param1:Object, param2:IViewCursor, param3:Object = null) : int
      {
         if(param1 == param2.current)
         {
            return HierarchicalViewCursor(param2).currentDepth;
         }
         return -1;
      }
      
      public function getType(param1:Object) : String
      {
         var node:Object = param1;
         if(node is XML)
         {
            return String(node.@type);
         }
         if(node is Object)
         {
            try
            {
               return String(node.type);
            }
            catch(e:Error)
            {
            }
         }
         return "";
      }
      
      public function getGroupName(param1:Object) : String
      {
         var node:Object = param1;
         if(node is XML)
         {
            return node.@groupName;
         }
         if(node is Object)
         {
            try
            {
               return node.groupName;
            }
            catch(e:Error)
            {
            }
         }
         return "";
      }
      
      public function getParent(param1:Object, param2:ICollectionView, param3:Object = null) : Object
      {
         return HierarchicalCollectionView(param2).getParentItem(param1);
      }
      
      public function hasChildren(param1:Object, param2:Object = null) : Boolean
      {
         var children:ICollectionView;
         var node:Object = param1;
         var model:Object = param2;
         if(node == null)
         {
            return false;
         }
         children = getChildren(node,model);
         try
         {
            if(children.length > 0)
            {
               return true;
            }
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      public function isBranch(param1:Object, param2:Object = null) : Boolean
      {
         var branch:Boolean;
         var childList:XMLList = null;
         var branchFlag:XMLList = null;
         var node:Object = param1;
         var model:Object = param2;
         if(node == null)
         {
            return false;
         }
         branch = false;
         if(node is XML)
         {
            childList = node.children();
            branchFlag = node.@isBranch;
            if(branchFlag.length() == 1)
            {
               if(branchFlag[0] == "true")
               {
                  branch = true;
               }
            }
            else if(childList.length() != 0)
            {
               branch = true;
            }
         }
         else if(node is Object)
         {
            try
            {
               if(node.children != undefined)
               {
                  branch = true;
               }
            }
            catch(e:Error)
            {
            }
         }
         return branch;
      }
      
      public function getChildren(param1:Object, param2:Object = null) : ICollectionView
      {
         var children:* = undefined;
         var childrenCollection:ICollectionView = null;
         var oldArrayCollection:ArrayCollection = null;
         var oldXMLCollection:XMLListCollection = null;
         var p:* = undefined;
         var childArray:Array = null;
         var node:Object = param1;
         var model:Object = param2;
         if(node == null)
         {
            return null;
         }
         if(node is XML)
         {
            children = node.*;
         }
         else if(node is Object)
         {
            try
            {
               children = node.children;
            }
            catch(e:Error)
            {
            }
         }
         if(children == undefined && !(children is XMLList))
         {
            return null;
         }
         if(children is ICollectionView)
         {
            childrenCollection = ICollectionView(children);
         }
         else if(children is Array)
         {
            oldArrayCollection = ChildCollectionCache[node];
            if(!oldArrayCollection)
            {
               childrenCollection = new ArrayCollection(children);
               ChildCollectionCache[node] = childrenCollection;
            }
            else
            {
               childrenCollection = oldArrayCollection;
               ArrayCollection(childrenCollection).mx_internal::dispatchResetEvent = false;
               ArrayCollection(childrenCollection).source = children;
            }
         }
         else if(children is XMLList)
         {
            oldXMLCollection = ChildCollectionCache[node];
            if(!oldXMLCollection)
            {
               for(p in ChildCollectionCache)
               {
                  if(p === node)
                  {
                     oldXMLCollection = ChildCollectionCache[p];
                     break;
                  }
               }
            }
            if(!oldXMLCollection)
            {
               childrenCollection = new XMLListCollection(children);
               ChildCollectionCache[node] = childrenCollection;
            }
            else
            {
               childrenCollection = oldXMLCollection;
               XMLListCollection(childrenCollection).mx_internal::dispatchResetEvent = false;
               XMLListCollection(childrenCollection).source = children;
            }
         }
         else
         {
            childArray = new Array(children);
            if(childArray != null)
            {
               childrenCollection = new ArrayCollection(childArray);
            }
         }
         return childrenCollection;
      }
      
      public function isEnabled(param1:Object) : Boolean
      {
         var enabled:* = undefined;
         var node:Object = param1;
         if(node is XML)
         {
            enabled = node.@enabled;
            if(enabled[0] == false)
            {
               return false;
            }
         }
         else if(node is Object)
         {
            try
            {
               return "false" != String(node.enabled);
            }
            catch(e:Error)
            {
            }
         }
         return true;
      }
   }
}
