package mx.controls.treeClasses
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import mx.collections.ICollectionView;
   import mx.collections.IViewCursor;
   import mx.collections.Sort;
   import mx.collections.XMLListAdapter;
   import mx.collections.XMLListCollection;
   import mx.collections.errors.ItemPendingError;
   import mx.core.EventPriority;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import mx.utils.IXMLNotifiable;
   import mx.utils.XMLNotifier;
   
   public class HierarchicalCollectionView extends EventDispatcher implements ICollectionView, IXMLNotifiable
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var itemToUID:Function;
      
      public var openNodes:Object;
      
      private var dataDescriptor:mx.controls.treeClasses.ITreeDataDescriptor;
      
      private var currentLength:int;
      
      private var parentNode:XML;
      
      public var parentMap:Object;
      
      private var cursor:mx.controls.treeClasses.HierarchicalViewCursor;
      
      private var childrenMap:Dictionary;
      
      private var treeData:ICollectionView;
      
      public function HierarchicalCollectionView(param1:ICollectionView, param2:mx.controls.treeClasses.ITreeDataDescriptor, param3:Function, param4:Object = null)
      {
         super();
         parentMap = {};
         childrenMap = new Dictionary(true);
         treeData = param1;
         treeData.addEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler,false,EventPriority.DEFAULT_HANDLER,true);
         addEventListener(CollectionEvent.COLLECTION_CHANGE,expandEventHandler,false,0,true);
         dataDescriptor = param2;
         this.itemToUID = param3;
         openNodes = param4;
         currentLength = calculateLength();
      }
      
      public function nestedCollectionChangeHandler(param1:CollectionEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:* = null;
         var _loc9_:CollectionEvent = null;
         var _loc10_:CollectionEvent = null;
         var _loc11_:int = 0;
         if(param1 is CollectionEvent)
         {
            if((_loc10_ = CollectionEvent(param1)).kind == CollectionEventKind.mx_internal::EXPAND)
            {
               param1.stopImmediatePropagation();
            }
            else if(_loc10_.kind == CollectionEventKind.ADD)
            {
               updateLength();
               _loc3_ = int(_loc10_.items.length);
               _loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,_loc10_.kind);
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  if((_loc7_ = _loc10_.items[_loc2_]) is XML)
                  {
                     startTrackUpdates(_loc7_);
                  }
                  if((_loc6_ = getParentItem(_loc7_)) != null)
                  {
                     getVisibleNodes(_loc7_,_loc6_,_loc9_.items);
                  }
                  _loc2_++;
               }
               _loc9_.location = getVisibleLocationInSubCollection(_loc6_,_loc10_.location);
               dispatchEvent(_loc9_);
            }
            else if(_loc10_.kind == CollectionEventKind.REMOVE)
            {
               _loc3_ = int(_loc10_.items.length);
               _loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,_loc10_.kind);
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  if((_loc7_ = _loc10_.items[_loc2_]) is XML)
                  {
                     stopTrackUpdates(_loc7_);
                  }
                  if((_loc6_ = getParentItem(_loc7_)) != null)
                  {
                     getVisibleNodes(_loc7_,_loc6_,_loc9_.items);
                  }
                  _loc2_++;
               }
               _loc9_.location = getVisibleLocationInSubCollection(_loc6_,_loc10_.location);
               currentLength -= _loc9_.items.length;
               dispatchEvent(_loc9_);
            }
            else if(_loc10_.kind == CollectionEventKind.UPDATE)
            {
               dispatchEvent(param1);
            }
            else if(_loc10_.kind == CollectionEventKind.REPLACE)
            {
               _loc3_ = int(_loc10_.items.length);
               _loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,CollectionEventKind.REMOVE);
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  _loc7_ = _loc10_.items[_loc2_].oldValue;
                  if((_loc6_ = getParentItem(_loc7_)) != null)
                  {
                     getVisibleNodes(_loc7_,_loc6_,_loc9_.items);
                  }
                  _loc2_++;
               }
               _loc11_ = 0;
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  if((_loc7_ = _loc10_.items[_loc2_].oldValue) is XML)
                  {
                     stopTrackUpdates(_loc7_);
                  }
                  while(_loc9_.items[_loc11_] != _loc7_)
                  {
                     _loc11_++;
                  }
                  _loc9_.items.splice(_loc11_,1);
                  _loc2_++;
               }
               if(_loc9_.items.length)
               {
                  currentLength -= _loc9_.items.length;
                  dispatchEvent(_loc9_);
               }
               dispatchEvent(param1);
            }
            else if(_loc10_.kind == CollectionEventKind.RESET)
            {
               updateLength();
               _loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,CollectionEventKind.REFRESH);
               dispatchEvent(_loc9_);
            }
         }
      }
      
      private function getVisibleLocationInSubCollection(param1:Object, param2:int) : int
      {
         var _loc5_:ICollectionView = null;
         var _loc6_:IViewCursor = null;
         var _loc3_:int = param2;
         var _loc4_:Object = param1;
         param1 = getParentItem(param1);
         while(param1 != null)
         {
            _loc6_ = (_loc5_ = childrenMap[param1]).createCursor();
            while(!_loc6_.afterLast)
            {
               if(_loc6_.current == _loc4_)
               {
                  _loc3_++;
                  break;
               }
               _loc3_ += calculateLength(_loc6_.current,param1) + 1;
               _loc6_.moveNext();
            }
            _loc4_ = param1;
            param1 = getParentItem(param1);
         }
         _loc6_ = treeData.createCursor();
         while(!_loc6_.afterLast)
         {
            if(_loc6_.current == _loc4_)
            {
               _loc3_++;
               break;
            }
            _loc3_ += calculateLength(_loc6_.current,param1) + 1;
            _loc6_.moveNext();
         }
         return _loc3_;
      }
      
      public function expandEventHandler(param1:CollectionEvent) : void
      {
         var _loc2_:CollectionEvent = null;
         if(param1 is CollectionEvent)
         {
            _loc2_ = CollectionEvent(param1);
            if(_loc2_.kind == CollectionEventKind.mx_internal::EXPAND)
            {
               param1.stopImmediatePropagation();
               updateLength();
            }
         }
      }
      
      private function updateLength(param1:Object = null, param2:Object = null) : void
      {
         currentLength = calculateLength();
      }
      
      private function startTrackUpdates(param1:Object) : void
      {
         XMLNotifier.getInstance().watchXML(param1,this);
      }
      
      private function getVisibleLocation(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:IViewCursor = treeData.createCursor();
         var _loc4_:int = 0;
         while(_loc4_ < param1 && !_loc3_.afterLast)
         {
            _loc2_ += calculateLength(_loc3_.current,null) + 1;
            _loc3_.moveNext();
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function describeData() : Object
      {
         return null;
      }
      
      public function get sort() : Sort
      {
         return null;
      }
      
      public function contains(param1:Object) : Boolean
      {
         var _loc2_:IViewCursor = createCursor();
         var _loc3_:Boolean = false;
         while(!_loc3_)
         {
            if(_loc2_.current == param1)
            {
               return true;
            }
            _loc3_ = _loc2_.moveNext();
         }
         return false;
      }
      
      private function stopTrackUpdates(param1:Object) : void
      {
         XMLNotifier.getInstance().unwatchXML(param1,this);
      }
      
      public function xmlNotification(param1:Object, param2:String, param3:Object, param4:Object, param5:Object) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:XMLListCollection = null;
         var _loc10_:int = 0;
         var _loc11_:CollectionEvent = null;
         var _loc12_:XMLListAdapter = null;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:XMLList = null;
         var _loc16_:XMLListCollection = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         if(param1 === param3)
         {
            switch(param2)
            {
               case "nodeAdded":
                  for(_loc13_ in childrenMap)
                  {
                     if(_loc13_ === param1)
                     {
                        _loc12_ = childrenMap[_loc13_].list as XMLListAdapter;
                        break;
                     }
                  }
                  if(!_loc12_ && param3 is XML && XML(param3).children().length() == 1)
                  {
                     _loc12_ = (getChildren(param3) as XMLListCollection).list as XMLListAdapter;
                  }
                  if(Boolean(_loc12_) && !_loc12_.busy())
                  {
                     if(childrenMap[_loc13_] === treeData)
                     {
                        _loc9_ = treeData as XMLListCollection;
                        if(parentNode)
                        {
                           _loc9_.mx_internal::dispatchResetEvent = false;
                           _loc9_.source = parentNode.*;
                        }
                     }
                     else
                     {
                        _loc9_ = getChildren(_loc13_) as XMLListCollection;
                     }
                     if(_loc9_)
                     {
                        _loc10_ = int(param4.childIndex());
                        (_loc11_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.ADD;
                        _loc11_.location = _loc10_;
                        _loc11_.items = [param4];
                        _loc9_.dispatchEvent(_loc11_);
                     }
                  }
                  break;
               case "nodeRemoved":
                  for(_loc14_ in childrenMap)
                  {
                     if(_loc14_ === param1)
                     {
                        if((Boolean(_loc12_ = (_loc9_ = childrenMap[_loc14_]).list as XMLListAdapter)) && !_loc12_.busy())
                        {
                           _loc15_ = _loc9_.source as XMLList;
                           if(childrenMap[_loc14_] === treeData)
                           {
                              _loc9_ = treeData as XMLListCollection;
                              if(parentNode)
                              {
                                 _loc9_.mx_internal::dispatchResetEvent = false;
                                 _loc9_.source = parentNode.*;
                              }
                           }
                           else
                           {
                              _loc16_ = _loc9_;
                              if(!(_loc9_ = getChildren(_loc14_) as XMLListCollection))
                              {
                                 _loc16_.addEventListener(CollectionEvent.COLLECTION_CHANGE,nestedCollectionChangeHandler,false,0,true);
                                 (_loc11_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.REMOVE;
                                 _loc11_.location = 0;
                                 _loc11_.items = [param4];
                                 _loc16_.dispatchEvent(_loc11_);
                                 _loc16_.removeEventListener(CollectionEvent.COLLECTION_CHANGE,nestedCollectionChangeHandler);
                              }
                           }
                           if(_loc9_)
                           {
                              _loc17_ = _loc15_.length();
                              _loc18_ = 0;
                              while(_loc18_ < _loc17_)
                              {
                                 if(_loc15_[_loc18_] === param4)
                                 {
                                    (_loc11_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.REMOVE;
                                    _loc11_.location = _loc10_;
                                    _loc11_.items = [param4];
                                    _loc9_.dispatchEvent(_loc11_);
                                    break;
                                 }
                                 _loc18_++;
                              }
                           }
                        }
                        break;
                     }
                  }
            }
         }
      }
      
      public function itemUpdated(param1:Object, param2:Object = null, param3:Object = null, param4:Object = null) : void
      {
         var _loc5_:CollectionEvent;
         (_loc5_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.UPDATE;
         var _loc6_:PropertyChangeEvent;
         (_loc6_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).property = param2;
         _loc6_.oldValue = param3;
         _loc6_.newValue = param4;
         _loc5_.items.push(_loc6_);
         dispatchEvent(_loc5_);
      }
      
      public function enableAutoUpdate() : void
      {
      }
      
      public function set sort(param1:Sort) : void
      {
      }
      
      public function getParentItem(param1:Object) : *
      {
         var _loc2_:String = itemToUID(param1);
         if(parentMap.hasOwnProperty(_loc2_))
         {
            return parentMap[_loc2_];
         }
         return undefined;
      }
      
      private function getVisibleNodes(param1:Object, param2:Object, param3:Array) : void
      {
         var _loc4_:ICollectionView = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         param3.push(param1);
         var _loc5_:String = itemToUID(param1);
         parentMap[_loc5_] = param2;
         if(false && dataDescriptor.isBranch(param1,treeData) && dataDescriptor.hasChildren(param1,treeData))
         {
            if((_loc4_ = getChildren(param1)) != null)
            {
               _loc6_ = _loc4_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  getVisibleNodes(_loc4_[_loc7_],param1,param3);
                  _loc7_++;
               }
            }
         }
      }
      
      public function refresh() : Boolean
      {
         var _loc1_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc1_.kind = CollectionEventKind.REFRESH;
         dispatchEvent(_loc1_);
         return true;
      }
      
      public function get length() : int
      {
         return currentLength;
      }
      
      public function set filterFunction(param1:Function) : void
      {
      }
      
      public function calculateLength(param1:Object = null, param2:Object = null) : int
      {
         var length:int = 0;
         var childNodes:ICollectionView = null;
         var modelOffset:int = 0;
         var modelCursor:IViewCursor = null;
         var parNode:* = undefined;
         var uid:String = null;
         var numChildren:int = 0;
         var i:int = 0;
         var node:Object = param1;
         var parent:Object = param2;
         length = 0;
         var firstNode:Boolean = true;
         if(node == null)
         {
            modelOffset = 0;
            modelCursor = treeData.createCursor();
            if(modelCursor.beforeFirst)
            {
               return treeData.length;
            }
            while(!modelCursor.afterLast)
            {
               node = modelCursor.current;
               if(node is XML)
               {
                  if(firstNode)
                  {
                     firstNode = false;
                     parNode = node.parent();
                     if(parNode)
                     {
                        startTrackUpdates(parNode);
                        childrenMap[parNode] = treeData;
                        parentNode = parNode;
                     }
                  }
                  startTrackUpdates(node);
               }
               if(node === null)
               {
                  length += 1;
               }
               else
               {
                  length += calculateLength(node,null) + 1;
               }
               modelOffset++;
               try
               {
                  modelCursor.moveNext();
               }
               catch(e:ItemPendingError)
               {
                  length += 0 - modelOffset;
                  return length;
               }
            }
         }
         else
         {
            uid = itemToUID(node);
            parentMap[uid] = parent;
            if(node != null && false && dataDescriptor.isBranch(node,treeData) && dataDescriptor.hasChildren(node,treeData))
            {
               childNodes = getChildren(node);
               if(childNodes != null)
               {
                  numChildren = childNodes.length;
                  i = 0;
                  while(i < numChildren)
                  {
                     if(node is XML)
                     {
                        startTrackUpdates(childNodes[i]);
                     }
                     length += calculateLength(childNodes[i],node) + 1;
                     i++;
                  }
               }
            }
         }
         return length;
      }
      
      public function disableAutoUpdate() : void
      {
      }
      
      public function createCursor() : IViewCursor
      {
         return new mx.controls.treeClasses.HierarchicalViewCursor(this,treeData,dataDescriptor,itemToUID,openNodes);
      }
      
      private function getChildren(param1:Object) : ICollectionView
      {
         var _loc2_:ICollectionView = dataDescriptor.getChildren(param1,treeData);
         var _loc3_:ICollectionView = childrenMap[param1];
         if(_loc3_ != _loc2_)
         {
            if(_loc3_ != null)
            {
               _loc3_.removeEventListener(CollectionEvent.COLLECTION_CHANGE,nestedCollectionChangeHandler);
            }
            if(_loc2_)
            {
               _loc2_.addEventListener(CollectionEvent.COLLECTION_CHANGE,nestedCollectionChangeHandler,false,0,true);
               childrenMap[param1] = _loc2_;
            }
            else
            {
               delete childrenMap[param1];
            }
         }
         return _loc2_;
      }
      
      public function get filterFunction() : Function
      {
         return null;
      }
      
      public function collectionChangeHandler(param1:CollectionEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Object = null;
         var _loc8_:* = null;
         var _loc9_:CollectionEvent = null;
         var _loc10_:CollectionEvent = null;
         var _loc11_:int = 0;
         if(param1 is CollectionEvent)
         {
            if((_loc10_ = CollectionEvent(param1)).kind == CollectionEventKind.RESET)
            {
               updateLength();
               dispatchEvent(param1);
            }
            else if(_loc10_.kind == CollectionEventKind.ADD)
            {
               _loc3_ = int(_loc10_.items.length);
               (_loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,_loc10_.kind)).location = getVisibleLocation(_loc10_.location);
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  if((_loc7_ = _loc10_.items[_loc2_]) is XML)
                  {
                     startTrackUpdates(_loc7_);
                  }
                  getVisibleNodes(_loc7_,null,_loc9_.items);
                  _loc2_++;
               }
               currentLength += _loc9_.items.length;
               dispatchEvent(_loc9_);
            }
            else if(_loc10_.kind == CollectionEventKind.REMOVE)
            {
               _loc3_ = int(_loc10_.items.length);
               (_loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,_loc10_.kind)).location = getVisibleLocation(_loc10_.location);
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  if((_loc7_ = _loc10_.items[_loc2_]) is XML)
                  {
                     stopTrackUpdates(_loc7_);
                  }
                  getVisibleNodes(_loc7_,null,_loc9_.items);
                  _loc2_++;
               }
               currentLength -= _loc9_.items.length;
               dispatchEvent(_loc9_);
            }
            else if(_loc10_.kind == CollectionEventKind.UPDATE)
            {
               dispatchEvent(param1);
            }
            else if(_loc10_.kind == CollectionEventKind.REPLACE)
            {
               _loc3_ = int(_loc10_.items.length);
               _loc9_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,true,CollectionEventKind.REMOVE);
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  if((_loc7_ = _loc10_.items[_loc2_].oldValue) is XML)
                  {
                     stopTrackUpdates(_loc7_);
                  }
                  getVisibleNodes(_loc7_,null,_loc9_.items);
                  _loc2_++;
               }
               _loc11_ = 0;
               _loc2_ = 0;
               while(_loc2_ < _loc3_)
               {
                  _loc7_ = _loc10_.items[_loc2_].oldValue;
                  while(_loc9_.items[_loc11_] != _loc7_)
                  {
                     _loc11_++;
                  }
                  _loc9_.items.splice(_loc11_,1);
                  _loc2_++;
               }
               if(_loc9_.items.length)
               {
                  currentLength -= _loc9_.items.length;
                  dispatchEvent(_loc9_);
               }
               dispatchEvent(param1);
            }
         }
      }
   }
}
