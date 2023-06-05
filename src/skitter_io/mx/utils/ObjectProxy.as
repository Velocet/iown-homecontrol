package mx.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.IExternalizable;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   import flash.utils.getQualifiedClassName;
   import mx.core.IPropertyChangeNotifier;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   
   [Bindable("propertyChange")]
   public dynamic class ObjectProxy extends Proxy implements IExternalizable, IPropertyChangeNotifier
   {
       
      
      private var _id:String;
      
      protected var notifiers:Object;
      
      protected var propertyList:Array;
      
      private var _proxyLevel:int;
      
      private var _type:QName;
      
      protected var dispatcher:EventDispatcher;
      
      protected var proxyClass:Class;
      
      private var _item:Object;
      
      public function ObjectProxy(param1:Object = null, param2:String = null, param3:int = -1)
      {
         proxyClass = ObjectProxy;
         super();
         if(!param1)
         {
            param1 = {};
         }
         _item = param1;
         _proxyLevel = param3;
         notifiers = {};
         dispatcher = new EventDispatcher(this);
         if(param2)
         {
            _id = param2;
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return dispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return dispatcher.hasEventListener(param1);
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         var _loc4_:IPropertyChangeNotifier = null;
         var _loc5_:PropertyChangeEvent = null;
         var _loc3_:* = _item[param1];
         if(_loc3_ !== param2)
         {
            _item[param1] = param2;
            if(_loc4_ = IPropertyChangeNotifier(notifiers[param1]))
            {
               _loc4_.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,propertyChangeHandler);
               delete notifiers[param1];
            }
            if(dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
            {
               if(param1 is QName)
               {
                  param1 = QName(param1).localName;
               }
               _loc5_ = PropertyChangeEvent.createUpdateEvent(this,param1.toString(),_loc3_,param2);
               dispatcher.dispatchEvent(_loc5_);
            }
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return dispatcher.willTrigger(param1);
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         var _loc2_:Object = param1.readObject();
         _item = _loc2_;
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         param1.writeObject(_item);
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         var _loc2_:* = undefined;
         if(false)
         {
            return notifiers[param1];
         }
         _loc2_ = _item[param1];
         if(_loc2_)
         {
            if(_proxyLevel == 0 || ObjectUtil.isSimple(_loc2_))
            {
               return _loc2_;
            }
            _loc2_ = object_proxy::getComplexProperty(param1,_loc2_);
         }
         return _loc2_;
      }
      
      override flash_proxy function hasProperty(param1:*) : Boolean
      {
         return param1 in _item;
      }
      
      public function get uid() : String
      {
         if(_id === null)
         {
            _id = UIDUtil.createUID();
         }
         return _id;
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(param1 == 0)
         {
            setupPropertyList();
         }
         if(param1 < propertyList.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         dispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return propertyList[param1 - 1];
      }
      
      public function set uid(param1:String) : void
      {
         _id = param1;
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         return _item[param1].apply(_item,rest);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         dispatcher.removeEventListener(param1,param2,param3);
      }
      
      protected function setupPropertyList() : void
      {
         var _loc1_:String = null;
         if(getQualifiedClassName(_item) == "Object")
         {
            propertyList = [];
            for(_loc1_ in _item)
            {
               propertyList.push(_loc1_);
            }
         }
         else
         {
            propertyList = ObjectUtil.getClassInfo(_item,null,{
               "includeReadOnly":true,
               "uris":["*"]
            }).properties;
         }
      }
      
      object_proxy function getComplexProperty(param1:*, param2:*) : *
      {
         if(param2 is IPropertyChangeNotifier)
         {
            param2.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,propertyChangeHandler);
            notifiers[param1] = param2;
            return param2;
         }
         if(getQualifiedClassName(param2) == "Object")
         {
            param2 = new proxyClass(_item[param1],null,_proxyLevel > 0 ? _proxyLevel - 1 : _proxyLevel);
            param2.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,propertyChangeHandler);
            notifiers[param1] = param2;
            return param2;
         }
         return param2;
      }
      
      override flash_proxy function deleteProperty(param1:*) : Boolean
      {
         var _loc5_:PropertyChangeEvent = null;
         var _loc2_:IPropertyChangeNotifier = IPropertyChangeNotifier(notifiers[param1]);
         if(_loc2_)
         {
            _loc2_.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,propertyChangeHandler);
            delete notifiers[param1];
         }
         var _loc3_:* = _item[param1];
         var _loc4_:* = delete _item[param1];
         if(dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
         {
            (_loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).kind = PropertyChangeEventKind.DELETE;
            _loc5_.property = param1;
            _loc5_.oldValue = _loc3_;
            _loc5_.source = this;
            dispatcher.dispatchEvent(_loc5_);
         }
         return _loc4_;
      }
      
      object_proxy function get type() : QName
      {
         return _type;
      }
      
      object_proxy function set type(param1:QName) : void
      {
         _type = param1;
      }
      
      public function propertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         dispatcher.dispatchEvent(param1);
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return _item[propertyList[param1 - 1]];
      }
      
      object_proxy function get object() : Object
      {
         return _item;
      }
   }
}
