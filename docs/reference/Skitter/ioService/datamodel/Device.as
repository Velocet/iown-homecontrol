package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="device")]
   public class Device implements IEventDispatcher
   {
       
      
      protected var _type:String = null;
      
      protected var _actuators:ArrayCollection;
      
      protected var _sw_version:String = null;
      
      [Column(name="id")]
      [Id]
      private var _3355id:int;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      protected var _virtualComPort:String = null;
      
      protected var _hw_version:String = null;
      
      protected var _identifier:String;
      
      protected var _name:String = null;
      
      protected var _repeaters:ArrayCollection;
      
      protected var _ioAddress:String = null;
      
      protected var _currentKey2W:ioService.datamodel.Key2W;
      
      public function Device()
      {
         this._currentKey2W = new ioService.datamodel.Key2W();
         this._actuators = new ArrayCollection();
         this._repeaters = new ArrayCollection();
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._type = "Unkonwn";
      }
      
      private function set _1450008331currentKey2W(param1:ioService.datamodel.Key2W) : void
      {
         this._currentKey2W = param1;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      [Column(name="name")]
      public function get name() : String
      {
         return this._name;
      }
      
      [ManyToOne(cascade="save-update",constrain="false")]
      public function get currentKey2W() : ioService.datamodel.Key2W
      {
         return this._currentKey2W;
      }
      
      private function set _386165783virtualComPort(param1:String) : void
      {
         this._virtualComPort = param1;
      }
      
      [Column(name="virtual_com_port")]
      public function get virtualComPort() : String
      {
         return this._virtualComPort;
      }
      
      [ManyToMany(type="ioService.datamodel.Actuator",cascade="save-update",constrain="false",lazy="false",indexed="false")]
      public function get actuators() : ArrayCollection
      {
         return this._actuators;
      }
      
      [Bindable(event="propertyChange")]
      public function set name(param1:String) : void
      {
         var _loc2_:Object = this.name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
         }
      }
      
      private function set _3575610type(param1:String) : void
      {
         this._type = param1;
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="id")]
      [Id]
      public function get id() : int
      {
         return this._3355id;
      }
      
      private function set _3373707name(param1:String) : void
      {
         this._name = param1;
      }
      
      private function set _886419032hw_version(param1:String) : void
      {
         this._hw_version = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set currentKey2W(param1:ioService.datamodel.Key2W) : void
      {
         var _loc2_:Object = this.currentKey2W;
         if(_loc2_ !== param1)
         {
            this._1450008331currentKey2W = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentKey2W",_loc2_,param1));
         }
      }
      
      [Column(name="hw_version")]
      public function get hw_version() : String
      {
         return this._hw_version;
      }
      
      [Column(name="identifier")]
      public function get identifier() : String
      {
         return this._identifier;
      }
      
      private function set _529110426actuators(param1:ArrayCollection) : void
      {
         this._actuators = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set virtualComPort(param1:String) : void
      {
         var _loc2_:Object = this.virtualComPort;
         if(_loc2_ !== param1)
         {
            this._386165783virtualComPort = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"virtualComPort",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set actuators(param1:ArrayCollection) : void
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
      
      private function set _108777490ioAddress(param1:String) : void
      {
         this._ioAddress = param1;
      }
      
      [Column(name="type")]
      public function get type() : String
      {
         return this._type;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      private function set _1246899709sw_version(param1:String) : void
      {
         this._sw_version = param1;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set hw_version(param1:String) : void
      {
         var _loc2_:Object = this.hw_version;
         if(_loc2_ !== param1)
         {
            this._886419032hw_version = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hw_version",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set identifier(param1:String) : void
      {
         var _loc2_:Object = this.identifier;
         if(_loc2_ !== param1)
         {
            this._1618432855identifier = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"identifier",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set repeaters(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.repeaters;
         if(_loc2_ !== param1)
         {
            this._655314453repeaters = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"repeaters",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set ioAddress(param1:String) : void
      {
         var _loc2_:Object = this.ioAddress;
         if(_loc2_ !== param1)
         {
            this._108777490ioAddress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ioAddress",_loc2_,param1));
         }
      }
      
      [ManyToMany(type="ioService.datamodel.Beacon",cascade="save-update",constrain="false",lazy="false",indexed="false")]
      public function get repeaters() : ArrayCollection
      {
         return this._repeaters;
      }
      
      [Column(name="io_address")]
      public function get ioAddress() : String
      {
         return this._ioAddress;
      }
      
      private function set _655314453repeaters(param1:ArrayCollection) : void
      {
         this._repeaters = param1;
      }
      
      private function set _1618432855identifier(param1:String) : void
      {
         this._identifier = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set type(param1:String) : void
      {
         var _loc2_:Object = this.type;
         if(_loc2_ !== param1)
         {
            this._3575610type = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set sw_version(param1:String) : void
      {
         var _loc2_:Object = this.sw_version;
         if(_loc2_ !== param1)
         {
            this._1246899709sw_version = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sw_version",_loc2_,param1));
         }
      }
      
      [Column(name="sw_version")]
      public function get sw_version() : String
      {
         return this._sw_version;
      }
   }
}
