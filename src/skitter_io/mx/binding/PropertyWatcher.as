package mx.binding
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.getQualifiedClassName;
   import mx.core.EventPriority;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.utils.DescribeTypeCache;
   
   public class PropertyWatcher extends Watcher
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      protected var propertyGetter:Function;
      
      private var parentObj:Object;
      
      protected var events:Object;
      
      private var useRTTI:Boolean;
      
      private var _propertyName:String;
      
      public function PropertyWatcher(param1:String, param2:Object, param3:Array, param4:Function = null)
      {
         super(param3);
         _propertyName = param1;
         this.events = param2;
         this.propertyGetter = param4;
         useRTTI = !param2;
      }
      
      private function eventNamesToString() : String
      {
         var _loc2_:String = null;
         var _loc1_:String = " ";
         for(_loc2_ in events)
         {
            _loc1_ += _loc2_ + " ";
         }
         return _loc1_;
      }
      
      override public function updateParent(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:BindabilityInfo = null;
         if(Boolean(parentObj) && parentObj is IEventDispatcher)
         {
            for(_loc2_ in events)
            {
               parentObj.removeEventListener(_loc2_,eventHandler);
            }
         }
         if(param1 is Watcher)
         {
            parentObj = param1.value;
         }
         else
         {
            parentObj = param1;
         }
         if(parentObj)
         {
            if(useRTTI)
            {
               events = {};
               if(parentObj is IEventDispatcher)
               {
                  _loc3_ = DescribeTypeCache.describeType(parentObj).bindabilityInfo;
                  events = _loc3_.getChangeEvents(_propertyName);
                  if(objectIsEmpty(events))
                  {
                     trace("warning: unable to bind to property \'" + _propertyName + "\' on class \'" + getQualifiedClassName(parentObj) + "\'");
                  }
                  else
                  {
                     addParentEventListeners();
                  }
               }
               else
               {
                  trace("warning: unable to bind to property \'" + _propertyName + "\' on class \'" + getQualifiedClassName(parentObj) + "\' (class is not an IEventDispatcher)");
               }
            }
            else if(parentObj is IEventDispatcher)
            {
               addParentEventListeners();
            }
         }
         wrapUpdate(updateProperty);
      }
      
      private function objectIsEmpty(param1:Object) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         for(_loc2_ in _loc4_)
         {
            return false;
         }
         return true;
      }
      
      override protected function shallowClone() : Watcher
      {
         return new PropertyWatcher(_propertyName,events,listeners,propertyGetter);
      }
      
      private function traceInfo() : String
      {
         return "Watcher(" + getQualifiedClassName(parentObj) + "." + _propertyName + "): events = [" + eventNamesToString() + (useRTTI ? "] (RTTI)" : "]");
      }
      
      public function get propertyName() : String
      {
         return _propertyName;
      }
      
      private function addParentEventListeners() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in events)
         {
            if(_loc1_ != "__NoChangeEvent__")
            {
               parentObj.addEventListener(_loc1_,eventHandler,false,EventPriority.BINDING,true);
            }
         }
      }
      
      private function updateProperty() : void
      {
         if(parentObj)
         {
            if(_propertyName == "this")
            {
               value = parentObj;
            }
            else if(propertyGetter != null)
            {
               value = propertyGetter.apply(parentObj,[_propertyName]);
            }
            else
            {
               value = parentObj[_propertyName];
            }
         }
         else
         {
            value = null;
         }
         updateChildren();
      }
      
      public function eventHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         if(param1 is PropertyChangeEvent)
         {
            _loc2_ = PropertyChangeEvent(param1).property;
            if(_loc2_ != _propertyName)
            {
               return;
            }
         }
         wrapUpdate(updateProperty);
         notifyListeners(events[param1.type]);
      }
   }
}
