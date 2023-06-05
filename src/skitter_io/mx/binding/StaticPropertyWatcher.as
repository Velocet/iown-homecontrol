package mx.binding
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import mx.core.EventPriority;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   
   public class StaticPropertyWatcher extends Watcher
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var propertyGetter:Function;
      
      private var parentObj:Class;
      
      protected var events:Object;
      
      private var _propertyName:String;
      
      public function StaticPropertyWatcher(param1:String, param2:Object, param3:Array, param4:Function = null)
      {
         super(param3);
         _propertyName = param1;
         this.events = param2;
         this.propertyGetter = param4;
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
         var _loc3_:IEventDispatcher = null;
         parentObj = Class(param1);
         if(false)
         {
            for(_loc2_ in events)
            {
               if(_loc2_ != "__NoChangeEvent__")
               {
                  _loc3_ = parentObj["staticEventDispatcher"];
                  _loc3_.addEventListener(_loc2_,eventHandler,false,EventPriority.BINDING,true);
               }
            }
         }
         wrapUpdate(updateProperty);
      }
      
      private function updateProperty() : void
      {
         if(parentObj)
         {
            if(propertyGetter != null)
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
      
      override protected function shallowClone() : Watcher
      {
         return new StaticPropertyWatcher(_propertyName,events,listeners,propertyGetter);
      }
      
      private function traceInfo() : String
      {
         return "StaticPropertyWatcher(" + parentObj + "." + _propertyName + "): events = [" + eventNamesToString() + "]";
      }
      
      public function get propertyName() : String
      {
         return _propertyName;
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
