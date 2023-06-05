package mx.binding
{
   import mx.collections.errors.ItemPendingError;
   import mx.core.mx_internal;
   
   public class Watcher
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      protected var children:Array;
      
      public var value:Object;
      
      protected var cloneIndex:int;
      
      protected var listeners:Array;
      
      public function Watcher(param1:Array = null)
      {
         super();
         this.listeners = param1;
      }
      
      public function removeChildren(param1:int) : void
      {
         children.splice(param1);
      }
      
      public function updateChildren() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(children)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               children[_loc2_].updateParent(this);
               _loc2_++;
            }
         }
      }
      
      protected function shallowClone() : Watcher
      {
         return new Watcher();
      }
      
      protected function wrapUpdate(param1:Function) : void
      {
         var wrappedFunction:Function = param1;
         try
         {
            wrappedFunction.apply(this);
         }
         catch(itemPendingError:ItemPendingError)
         {
            value = null;
         }
         catch(rangeError:RangeError)
         {
            value = null;
         }
         catch(error:Error)
         {
            if(error.errorID != 1006 && error.errorID != 1009 && error.errorID != 1010 && error.errorID != 1055 && error.errorID != 1069)
            {
               throw error;
            }
         }
      }
      
      private function valueChanged(param1:Object) : Boolean
      {
         if(param1 == null && value == null)
         {
            return false;
         }
         var _loc2_:* = typeof value;
         if(_loc2_ == "string")
         {
            if(param1 == null && value == "")
            {
               return false;
            }
            return param1 != value;
         }
         if(_loc2_ == "number")
         {
            if(param1 == null && value == 0)
            {
               return false;
            }
            return param1 != value;
         }
         if(_loc2_ == "boolean")
         {
            if(param1 == null && value == false)
            {
               return false;
            }
            return param1 != value;
         }
         return true;
      }
      
      public function notifyListeners(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(listeners)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               listeners[_loc3_].watcherFired(param1,cloneIndex);
               _loc3_++;
            }
         }
      }
      
      protected function deepClone(param1:int) : Watcher
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Watcher = null;
         var _loc2_:Watcher = shallowClone();
         _loc2_.cloneIndex = param1;
         if(listeners)
         {
            _loc2_.listeners = listeners.concat();
         }
         if(children)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = children[_loc4_].deepClone(param1);
               _loc2_.addChild(_loc5_);
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function updateParent(param1:Object) : void
      {
      }
      
      public function addChild(param1:Watcher) : void
      {
         if(!children)
         {
            children = [param1];
         }
         else
         {
            children.push(param1);
         }
         param1.updateParent(this);
      }
   }
}
