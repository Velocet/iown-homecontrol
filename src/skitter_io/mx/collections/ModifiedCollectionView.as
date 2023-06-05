package mx.collections
{
   import flash.events.Event;
   import flash.utils.Dictionary;
   import mx.collections.errors.CollectionViewError;
   import mx.core.mx_internal;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.PropertyChangeEvent;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class ModifiedCollectionView implements mx.collections.ICollectionView
   {
      
      public static const REPLACEMENT:String = "replacement";
      
      public static const REPLACED:String = "replaced";
      
      public static const REMOVED:String = "removed";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const ADDED:String = "added";
       
      
      private var addedItems:Dictionary;
      
      private var _showPreserved:Boolean = false;
      
      private var list:mx.collections.ICollectionView;
      
      private var deltaLength:int = 0;
      
      private var resourceManager:IResourceManager;
      
      private var removedItems:Dictionary;
      
      private var itemWrappersByIndex:Array;
      
      private var replacementItems:Dictionary;
      
      private var deltas:Array;
      
      private var replacedItems:Dictionary;
      
      private var itemWrappersByCollectionMod:Dictionary;
      
      public function ModifiedCollectionView(param1:mx.collections.ICollectionView)
      {
         resourceManager = ResourceManager.getInstance();
         deltas = [];
         removedItems = new Dictionary(true);
         addedItems = new Dictionary(true);
         replacedItems = new Dictionary(true);
         replacementItems = new Dictionary(true);
         itemWrappersByIndex = [];
         itemWrappersByCollectionMod = new Dictionary(true);
         super();
         this.list = param1;
      }
      
      mx_internal function getBookmarkIndex(param1:CursorBookmark) : int
      {
         var _loc3_:String = null;
         if(!(param1 is ModifiedCollectionViewBookmark) || ModifiedCollectionViewBookmark(param1).mx_internal::view != this)
         {
            _loc3_ = String(resourceManager.getString("collections","bookmarkNotFound"));
            throw new CollectionViewError(_loc3_);
         }
         var _loc2_:ModifiedCollectionViewBookmark = ModifiedCollectionViewBookmark(param1);
         return _loc2_.mx_internal::index;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return false;
      }
      
      private function removeModification(param1:CollectionModification) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < deltas.length)
         {
            if(deltas[_loc2_] == param1)
            {
               deltas.splice(_loc2_,1);
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      mx_internal function getWrappedItemUsingCursor(param1:ModifiedCollectionViewCursor, param2:int) : Object
      {
         var _loc6_:CollectionModification = null;
         var _loc9_:Object = null;
         var _loc3_:int = param2;
         var _loc4_:Object = null;
         var _loc5_:CollectionModification = null;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         while(_loc8_ < deltas.length)
         {
            _loc6_ = deltas[_loc8_];
            if(_loc3_ < _loc6_.index)
            {
               break;
            }
            if(_loc6_.modificationType == CollectionModification.REPLACE)
            {
               if(_loc3_ == _loc6_.index && _loc6_.showOldReplace && _showPreserved)
               {
                  _loc5_ = _loc6_;
                  break;
               }
               if(_loc3_ == _loc6_.index + 1 && _loc6_.showOldReplace && _loc6_.showNewReplace && _showPreserved)
               {
                  _loc3_--;
                  _loc7_ = true;
                  break;
               }
               if(_loc3_ == _loc6_.index && (!_loc6_.showOldReplace && _loc6_.showNewReplace || !_showPreserved))
               {
                  _loc7_ = true;
                  break;
               }
               _loc3_ -= _loc6_.modCount;
            }
            else if(isActive(_loc6_))
            {
               if(_loc3_ == _loc6_.index && _loc6_.isRemove)
               {
                  _loc5_ = _loc6_;
                  break;
               }
               if(_loc3_ >= _loc6_.index)
               {
                  _loc3_ -= _loc6_.modCount;
               }
            }
            _loc8_++;
         }
         if(_loc5_)
         {
            _loc4_ = _loc5_.item;
         }
         else
         {
            param1.internalCursor.seek(CursorBookmark.CURRENT,_loc3_ - param1.internalIndex);
            _loc4_ = param1.internalCursor.current;
            param1.internalIndex = _loc3_;
         }
         if(_loc6_ && _loc3_ == _loc6_.index && _loc6_.modificationType == CollectionModification.ADD)
         {
            _loc9_ = getUniqueItemWrapper(_loc4_,_loc6_,_loc3_);
         }
         else
         {
            _loc9_ = getUniqueItemWrapper(_loc4_,_loc5_,_loc3_);
         }
         return _loc9_;
      }
      
      public function contains(param1:Object) : Boolean
      {
         return false;
      }
      
      private function integrateReplacedElements(param1:CollectionEvent, param2:int, param3:int) : void
      {
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:CollectionModification = null;
         var _loc12_:CollectionModification = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = int(param1.items.length);
         var _loc8_:int = 0;
         while(_loc4_ < deltas.length && _loc5_ < _loc7_)
         {
            _loc9_ = PropertyChangeEvent(param1.items[_loc5_]).oldValue;
            _loc10_ = PropertyChangeEvent(param1.items[_loc5_]).newValue;
            _loc11_ = CollectionModification(deltas[_loc4_]);
            _loc12_ = new CollectionModification(param1.location + _loc5_,_loc9_,CollectionModification.REPLACE);
            if(_loc11_.isRemove && _loc11_.index <= _loc12_.index || !_loc11_.isRemove && _loc11_.index < _loc12_.index)
            {
               _loc4_++;
            }
            else if((_loc11_.modificationType == CollectionModification.ADD || _loc11_.modificationType == CollectionModification.REPLACE) && _loc11_.index == _loc12_.index)
            {
               _loc4_++;
               _loc5_++;
            }
            else
            {
               deltas.splice(_loc4_ + _loc5_,0,_loc12_);
               replacedItems[getUniqueItemWrapper(_loc9_,_loc12_,param1.location + _loc5_)] = _loc12_;
               replacementItems[getUniqueItemWrapper(_loc10_,_loc12_,param1.location + _loc5_,true)] = _loc12_;
               _loc5_++;
               _loc4_++;
            }
         }
         while(_loc5_ < _loc7_)
         {
            _loc9_ = PropertyChangeEvent(param1.items[_loc5_]).oldValue;
            _loc10_ = PropertyChangeEvent(param1.items[_loc5_]).newValue;
            deltas.push(_loc12_ = new CollectionModification(param1.location + _loc5_,_loc9_,CollectionModification.REPLACE));
            replacedItems[getUniqueItemWrapper(_loc9_,_loc12_,param1.location + _loc5_)] = _loc12_;
            replacementItems[getUniqueItemWrapper(_loc10_,_loc12_,param1.location + _loc5_,true)] = _loc12_;
            _loc5_++;
         }
      }
      
      mx_internal function getBookmark(param1:ModifiedCollectionViewCursor) : ModifiedCollectionViewBookmark
      {
         var _loc4_:String = null;
         var _loc2_:int = param1.mx_internal::currentIndex;
         if(_loc2_ < 0 || _loc2_ > length)
         {
            _loc4_ = String(resourceManager.getString("collections","invalidIndex",[_loc2_]));
            throw new CollectionViewError(_loc4_);
         }
         var _loc3_:Object = param1.current;
         return new ModifiedCollectionViewBookmark(_loc3_,this,0,_loc2_,param1.internalCursor.bookmark,param1.internalIndex);
      }
      
      public function get sort() : Sort
      {
         return null;
      }
      
      public function itemUpdated(param1:Object, param2:Object = null, param3:Object = null, param4:Object = null) : void
      {
      }
      
      public function processCollectionEvent(param1:CollectionEvent, param2:int, param3:int) : void
      {
         switch(param1.kind)
         {
            case CollectionEventKind.ADD:
               integrateAddedElements(param1,param2,param3);
               break;
            case CollectionEventKind.REMOVE:
               integrateRemovedElements(param1,param2,param3);
               break;
            case CollectionEventKind.REPLACE:
               integrateReplacedElements(param1,param2,param3);
         }
      }
      
      public function get showPreservedState() : Boolean
      {
         return _showPreserved;
      }
      
      public function getSemantics(param1:ItemWrapper) : String
      {
         if(false)
         {
            return ModifiedCollectionView.REMOVED;
         }
         if(false)
         {
            return ModifiedCollectionView.ADDED;
         }
         if(false)
         {
            return ModifiedCollectionView.REPLACED;
         }
         if(false)
         {
            return ModifiedCollectionView.REPLACEMENT;
         }
         return null;
      }
      
      private function getUniqueItemWrapper(param1:Object, param2:CollectionModification, param3:int, param4:Boolean = false) : Object
      {
         if(Boolean(param2) && (param2.isRemove || param2.modificationType == CollectionModification.REPLACE && !param4))
         {
            if(true)
            {
               itemWrappersByCollectionMod[param2] = new ItemWrapper(param1);
            }
            return itemWrappersByCollectionMod[param2];
         }
         if(Boolean(param2) && param2.modificationType == CollectionModification.ADD)
         {
            param3 = param2.index;
         }
         if(true)
         {
            itemWrappersByIndex[param3] = new ItemWrapper(param1);
         }
         return itemWrappersByIndex[param3];
      }
      
      public function enableAutoUpdate() : void
      {
      }
      
      public function set sort(param1:Sort) : void
      {
      }
      
      public function removeItem(param1:ItemWrapper) : void
      {
         var _loc2_:CollectionModification = removedItems[param1] as CollectionModification;
         if(!_loc2_)
         {
            _loc2_ = replacedItems[param1] as CollectionModification;
            if(_loc2_)
            {
               delete replacedItems[param1];
               _loc2_.stopShowingReplacedValue();
               --deltaLength;
               if(_loc2_.modCount == 0)
               {
                  removeModification(_loc2_);
               }
            }
         }
         else if(removeModification(_loc2_))
         {
            delete removedItems[param1];
            --deltaLength;
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
      }
      
      private function integrateRemovedElements(param1:CollectionEvent, param2:int, param3:int) : void
      {
         var _loc9_:CollectionModification = null;
         var _loc10_:CollectionModification = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.items.length);
         var _loc8_:int = 0;
         while(_loc4_ < deltas.length && _loc5_ < _loc7_)
         {
            _loc9_ = CollectionModification(deltas[_loc4_]);
            _loc10_ = new CollectionModification(param1.location,param1.items[_loc5_],CollectionModification.REMOVE);
            removedItems[getUniqueItemWrapper(param1.items[_loc5_],_loc10_,0)] = _loc10_;
            if(_loc8_ != 0)
            {
               _loc9_.index += _loc8_;
            }
            if(_loc9_.isRemove && _loc9_.index <= _loc10_.index || !_loc9_.isRemove && _loc9_.index < _loc10_.index)
            {
               _loc4_++;
            }
            else
            {
               if(!_loc9_.isRemove && _loc9_.index == _loc10_.index)
               {
                  deltas.splice(_loc4_ + _loc5_,1);
               }
               else
               {
                  deltas.splice(_loc4_ + _loc5_,0,_loc10_);
                  _loc4_++;
               }
               _loc8_--;
               _loc5_++;
            }
         }
         while(_loc4_ < deltas.length)
         {
            _loc9_ = CollectionModification(deltas[_loc4_++]);
            _loc9_.index += _loc8_;
         }
         while(_loc5_ < _loc7_)
         {
            deltas.push(_loc10_ = new CollectionModification(param1.location,param1.items[_loc5_],CollectionModification.REMOVE));
            removedItems[getUniqueItemWrapper(param1.items[_loc5_],_loc10_,0)] = _loc10_;
            _loc5_++;
         }
         deltaLength += param1.items.length - _loc6_;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return false;
      }
      
      private function isActive(param1:CollectionModification) : Boolean
      {
         return _showPreserved;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
      }
      
      public function refresh() : Boolean
      {
         return false;
      }
      
      public function addItem(param1:ItemWrapper) : void
      {
         var _loc2_:CollectionModification = addedItems[param1] as CollectionModification;
         if(!_loc2_)
         {
            _loc2_ = replacementItems[param1] as CollectionModification;
            if(_loc2_)
            {
               _loc2_.startShowingReplacementValue();
               ++deltaLength;
               if(_loc2_.modCount == 0)
               {
                  removeModification(_loc2_);
               }
            }
         }
         else if(removeModification(_loc2_))
         {
            ++deltaLength;
         }
      }
      
      public function get length() : int
      {
         return list.length + (_showPreserved ? deltaLength : 0);
      }
      
      public function set filterFunction(param1:Function) : void
      {
      }
      
      public function set showPreservedState(param1:Boolean) : void
      {
         _showPreserved = param1;
      }
      
      public function createCursor() : IViewCursor
      {
         var _loc1_:IViewCursor = list.createCursor();
         var _loc2_:Object = _loc1_.current;
         return new ModifiedCollectionViewCursor(this,_loc1_,_loc2_);
      }
      
      private function integrateAddedElements(param1:CollectionEvent, param2:int, param3:int) : void
      {
         var _loc9_:CollectionModification = null;
         var _loc10_:CollectionModification = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = int(param1.items.length);
         var _loc8_:int = 0;
         while(_loc4_ < deltas.length && _loc5_ < _loc7_)
         {
            _loc9_ = CollectionModification(deltas[_loc4_]);
            _loc10_ = new CollectionModification(param1.location + _loc5_,null,CollectionModification.ADD);
            addedItems[getUniqueItemWrapper(param1.items[_loc5_],_loc10_,0)] = _loc10_;
            if(_loc9_.isRemove && _loc9_.index <= _loc10_.index || !_loc9_.isRemove && _loc9_.index < _loc10_.index)
            {
               _loc4_++;
            }
            else
            {
               deltas.splice(_loc4_ + _loc5_,0,_loc10_);
               _loc8_++;
               _loc5_++;
               _loc4_++;
            }
         }
         while(_loc4_ < deltas.length)
         {
            _loc9_ = CollectionModification(deltas[_loc4_++]);
            _loc9_.index += _loc8_;
         }
         while(_loc5_ < _loc7_)
         {
            deltas.push(_loc10_ = new CollectionModification(param1.location + _loc5_,null,CollectionModification.ADD));
            addedItems[getUniqueItemWrapper(param1.items[_loc5_],_loc10_,0)] = _loc10_;
            _loc5_++;
         }
         deltaLength -= param1.items.length;
      }
      
      public function disableAutoUpdate() : void
      {
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return false;
      }
      
      public function get filterFunction() : Function
      {
         return null;
      }
   }
}

import mx.collections.CursorBookmark;
import mx.collections.ModifiedCollectionView;
import mx.core.mx_internal;

class ModifiedCollectionViewBookmark extends CursorBookmark
{
    
   
   mx_internal var viewRevision:int;
   
   mx_internal var index:int;
   
   mx_internal var internalBookmark:CursorBookmark;
   
   mx_internal var view:ModifiedCollectionView;
   
   mx_internal var internalIndex:int;
   
   public function ModifiedCollectionViewBookmark(param1:Object, param2:ModifiedCollectionView, param3:int, param4:int, param5:CursorBookmark, param6:int)
   {
      super(param1);
      this.mx_internal::view = param2;
      this.mx_internal::viewRevision = param3;
      this.mx_internal::index = param4;
      this.mx_internal::internalBookmark = param5;
      this.mx_internal::internalIndex = param6;
   }
   
   override public function getViewIndex() : int
   {
      return mx_internal::view.mx_internal::getBookmarkIndex(this);
   }
}

import flash.events.EventDispatcher;
import mx.collections.CursorBookmark;
import mx.collections.ICollectionView;
import mx.collections.IViewCursor;
import mx.collections.ModifiedCollectionView;
import mx.collections.errors.CollectionViewError;
import mx.collections.errors.CursorError;
import mx.collections.errors.ItemPendingError;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

class ModifiedCollectionViewCursor extends EventDispatcher implements IViewCursor
{
   
   private static const BEFORE_FIRST_INDEX:int = -1;
   
   private static const AFTER_LAST_INDEX:int = -2;
    
   
   private var _view:ModifiedCollectionView;
   
   private var resourceManager:IResourceManager;
   
   public var internalIndex:int;
   
   mx_internal var currentIndex:int;
   
   public var internalCursor:IViewCursor;
   
   private var invalid:Boolean;
   
   private var currentValue:Object;
   
   public function ModifiedCollectionViewCursor(param1:ModifiedCollectionView, param2:IViewCursor, param3:Object)
   {
      var view:ModifiedCollectionView = param1;
      var cursor:IViewCursor = param2;
      var current:Object = param3;
      resourceManager = ResourceManager.getInstance();
      super();
      _view = view;
      internalCursor = cursor;
      if(cursor.beforeFirst && !current)
      {
         internalIndex = BEFORE_FIRST_INDEX;
      }
      else if(cursor.afterLast && !current)
      {
         internalIndex = AFTER_LAST_INDEX;
      }
      else
      {
         internalIndex = 0;
      }
      mx_internal::currentIndex = view.length > 0 ? 0 : int(AFTER_LAST_INDEX);
      if(mx_internal::currentIndex == 0)
      {
         try
         {
            setCurrent(current,false);
         }
         catch(e:ItemPendingError)
         {
            mx_internal::currentIndex = BEFORE_FIRST_INDEX;
            setCurrent(null,false);
         }
      }
   }
   
   public function findAny(param1:Object) : Boolean
   {
      return false;
   }
   
   public function findFirst(param1:Object) : Boolean
   {
      return false;
   }
   
   public function seek(param1:CursorBookmark, param2:int = 0, param3:int = 0) : void
   {
      var newCurrent:Object;
      var newIndex:int;
      var message:String = null;
      var mcvBookmark:ModifiedCollectionViewBookmark = null;
      var bookmark:CursorBookmark = param1;
      var offset:int = param2;
      var prefetch:int = param3;
      checkValid();
      if(false)
      {
         mx_internal::currentIndex = AFTER_LAST_INDEX;
         setCurrent(null,false);
         return;
      }
      newIndex = int(mx_internal::currentIndex);
      if(bookmark == CursorBookmark.FIRST)
      {
         newIndex = 0;
         internalIndex = 0;
         internalCursor.seek(CursorBookmark.FIRST);
      }
      else if(bookmark == CursorBookmark.LAST)
      {
         newIndex = -1;
         internalCursor.seek(CursorBookmark.LAST);
      }
      else if(bookmark != CursorBookmark.CURRENT)
      {
         try
         {
            mcvBookmark = bookmark as ModifiedCollectionViewBookmark;
            newIndex = ModifiedCollectionView(view).mx_internal::getBookmarkIndex(bookmark);
            if(!mcvBookmark || newIndex < 0)
            {
               setCurrent(null);
               message = String(resourceManager.getString("collections","bookmarkInvalid"));
               throw new CursorError(message);
            }
            internalIndex = mcvBookmark.mx_internal::internalIndex;
            internalCursor.seek(mcvBookmark.mx_internal::internalBookmark);
         }
         catch(bmError:CollectionViewError)
         {
            message = String(resourceManager.getString("collections","bookmarkInvalid"));
            throw new CursorError(message);
         }
      }
      newIndex += offset;
      newCurrent = null;
      if(newIndex >= view.length)
      {
         mx_internal::currentIndex = AFTER_LAST_INDEX;
      }
      else if(newIndex < 0)
      {
         mx_internal::currentIndex = BEFORE_FIRST_INDEX;
      }
      else
      {
         newCurrent = ModifiedCollectionView(view).mx_internal::getWrappedItemUsingCursor(this,newIndex);
         mx_internal::currentIndex = newIndex;
      }
      setCurrent(newCurrent);
   }
   
   public function insert(param1:Object) : void
   {
   }
   
   [Bindable("cursorUpdate")]
   public function get afterLast() : Boolean
   {
      checkValid();
      return mx_internal::currentIndex == AFTER_LAST_INDEX || false;
   }
   
   public function remove() : Object
   {
      return null;
   }
   
   private function checkValid() : void
   {
      var _loc1_:String = null;
      if(invalid)
      {
         _loc1_ = String(resourceManager.getString("collections","invalidCursor"));
         throw new CursorError(_loc1_);
      }
   }
   
   public function get view() : ICollectionView
   {
      checkValid();
      return _view;
   }
   
   public function movePrevious() : Boolean
   {
      if(beforeFirst)
      {
         return false;
      }
      var _loc1_:int = !!afterLast ? -1 : int(mx_internal::currentIndex - 1);
      if(_loc1_ == -1)
      {
         _loc1_ = int(BEFORE_FIRST_INDEX);
         setCurrent(null);
      }
      else
      {
         setCurrent(ModifiedCollectionView(view).mx_internal::getWrappedItemUsingCursor(this,_loc1_));
      }
      mx_internal::currentIndex = _loc1_;
      return !beforeFirst;
   }
   
   public function moveNext() : Boolean
   {
      if(afterLast)
      {
         return false;
      }
      var _loc1_:int = !!beforeFirst ? 0 : int(mx_internal::currentIndex + 1);
      if(_loc1_ >= view.length)
      {
         _loc1_ = int(AFTER_LAST_INDEX);
         setCurrent(null);
      }
      else
      {
         setCurrent(ModifiedCollectionView(view).mx_internal::getWrappedItemUsingCursor(this,_loc1_));
      }
      mx_internal::currentIndex = _loc1_;
      return !afterLast;
   }
   
   public function findLast(param1:Object) : Boolean
   {
      return false;
   }
   
   [Bindable("cursorUpdate")]
   public function get beforeFirst() : Boolean
   {
      checkValid();
      return mx_internal::currentIndex == BEFORE_FIRST_INDEX || false;
   }
   
   [Bindable("cursorUpdate")]
   public function get bookmark() : CursorBookmark
   {
      checkValid();
      if(Boolean(beforeFirst))
      {
         return CursorBookmark.FIRST;
      }
      if(afterLast)
      {
         return CursorBookmark.LAST;
      }
      return ModifiedCollectionView(view).mx_internal::getBookmark(this);
   }
   
   [Bindable("cursorUpdate")]
   public function get current() : Object
   {
      checkValid();
      return currentValue;
   }
   
   private function setCurrent(param1:Object, param2:Boolean = true) : void
   {
      currentValue = param1;
      if(param2)
      {
         dispatchEvent(new FlexEvent(FlexEvent.CURSOR_UPDATE));
      }
   }
}

class CollectionModification
{
   
   public static const ADD:String = "add";
   
   public static const REPLACE:String = "replace";
   
   public static const REMOVE:String = "remove";
    
   
   public var showOldReplace:Boolean = true;
   
   private var _modCount:int = 0;
   
   public var showNewReplace:Boolean = false;
   
   public var index:int;
   
   public var modificationType:String = null;
   
   public var item:Object = null;
   
   public function CollectionModification(param1:int, param2:Object, param3:String)
   {
      super();
      this.index = param1;
      this.modificationType = param3;
      if(param3 != CollectionModification.ADD)
      {
         this.item = param2;
      }
      if(param3 == CollectionModification.REMOVE)
      {
         _modCount = 1;
      }
      else if(param3 == CollectionModification.ADD)
      {
         _modCount = -1;
      }
   }
   
   public function startShowingReplacementValue() : void
   {
      showNewReplace = true;
      ++_modCount;
   }
   
   public function get modCount() : int
   {
      return _modCount;
   }
   
   public function get isRemove() : Boolean
   {
      return modificationType == CollectionModification.REMOVE;
   }
   
   public function stopShowingReplacedValue() : void
   {
      showOldReplace = false;
      --_modCount;
   }
}
