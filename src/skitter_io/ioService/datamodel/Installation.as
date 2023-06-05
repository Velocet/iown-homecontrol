package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.events.PropertyChangeEvent;
   import mx.resources.ResourceManager;
   
   [Table(name="installation")]
   public class Installation implements IEventDispatcher
   {
       
      
      private var _key2W:ioService.datamodel.Key2W;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _devices:IList;
      
      private var _actuators:IList;
      
      private var _scenarios:IList;
      
      private var _repeaters:IList;
      
      [Column(name="id")]
      [Id]
      private var _3355id:int;
      
      public function Installation()
      {
         this._devices = new ArrayCollection();
         this._actuators = new ArrayCollection();
         this._repeaters = new ArrayCollection();
         this._scenarios = new ArrayCollection();
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set devices(param1:IList) : void
      {
         var _loc2_:Object = this.devices;
         if(_loc2_ !== param1)
         {
            this._1559801053devices = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"devices",_loc2_,param1));
         }
      }
      
      private function set _1559801053devices(param1:IList) : void
      {
         this._devices = param1;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      [ManyToOne(type="ioService.datamodel.Key2W",constrain="false")]
      public function get key2W() : ioService.datamodel.Key2W
      {
         return this._key2W;
      }
      
      [Bindable(event="propertyChange")]
      public function set scenarios(param1:IList) : void
      {
         var _loc2_:Object = this.scenarios;
         if(_loc2_ !== param1)
         {
            this._1726545635scenarios = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarios",_loc2_,param1));
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      [Bindable(event="propertyChange")]
      public function set key2W(param1:ioService.datamodel.Key2W) : void
      {
         var _loc2_:Object = this.key2W;
         if(_loc2_ !== param1)
         {
            this._101943556key2W = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"key2W",_loc2_,param1));
         }
      }
      
      public function generateScenarioName() : String
      {
         var _loc3_:String = null;
         var _loc4_:* = null;
         var _loc1_:int = 1;
         var _loc2_:Boolean = true;
         while(_loc2_)
         {
            _loc3_ = String(ResourceManager.getInstance().getString("scenarios","SCENARIO",[_loc1_++]));
            _loc2_ = false;
            for each(_loc4_ in this.scenarios)
            {
               if(_loc4_.name == _loc3_)
               {
                  _loc2_ = true;
                  break;
               }
            }
         }
         return _loc3_;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set repeaters(param1:IList) : void
      {
         var _loc2_:Object = this.repeaters;
         if(_loc2_ !== param1)
         {
            this._655314453repeaters = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"repeaters",_loc2_,param1));
         }
      }
      
      [ManyToMany(type="ioService.datamodel.Actuator",cascade="all",constrain="false",lazy="false")]
      public function get actuators() : IList
      {
         return this._actuators;
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="id")]
      [Id]
      public function get id() : int
      {
         return this._3355id;
      }
      
      [ManyToMany(type="ioService.datamodel.Device",cascade="all",constrain="false",lazy="false")]
      public function get devices() : IList
      {
         return this._devices;
      }
      
      [ManyToMany(type="ioService.datamodel.Scenario",cascade="all",constrain="false",lazy="false")]
      public function get scenarios() : IList
      {
         return this._scenarios;
      }
      
      private function set _101943556key2W(param1:ioService.datamodel.Key2W) : void
      {
         this._key2W = param1;
      }
      
      private function set _529110426actuators(param1:IList) : void
      {
         this._actuators = param1;
      }
      
      [ManyToMany(type="ioService.datamodel.Beacon",cascade="all",constrain="false",lazy="false")]
      public function get repeaters() : IList
      {
         return this._repeaters;
      }
      
      private function set _655314453repeaters(param1:IList) : void
      {
         this._repeaters = param1;
      }
      
      private function set _1726545635scenarios(param1:IList) : void
      {
         this._scenarios = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set actuators(param1:IList) : void
      {
         var _loc2_:Object = this.actuators;
         if(_loc2_ !== param1)
         {
            this._529110426actuators = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuators",_loc2_,param1));
         }
      }
      
      public function set id(param1:int) : void
      {
         var _loc2_:Object = this._3355id;
         if(_loc2_ !== param1)
         {
            this._3355id = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
         }
      }
   }
}
