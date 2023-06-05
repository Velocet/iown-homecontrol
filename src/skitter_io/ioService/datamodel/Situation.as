package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import flash.xml.XMLNode;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="situation")]
   public class Situation implements IEventDispatcher
   {
      
      private static const SITUATION_FIELD_ID__ACTUATOR_IO_ADDRESS:int = 0;
      
      public static const AttributesType:Array = ["IO-ADDRESS","UINT8","UINT8","UINT8"];
      
      private static const SITUATION_FIELD_ID__POSITION_DEG_1:int = 1;
      
      private static const SITUATION_FIELD_ID__POSITION_DEG_2:int = 2;
      
      private static const SITUATION_FIELD_ID__POSITION_DEG_3:int = 3;
       
      
      private var _ParameterValue:ByteArray;
      
      private var _position:ioService.datamodel.Position;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _actuator:ioService.datamodel.Actuator;
      
      [Transient]
      private var _1585729331radioInProgress:int = 0;
      
      [Column(name="id")]
      [Id]
      private var _3355id:int;
      
      public function Situation()
      {
         this._ParameterValue = new ByteArray();
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._ParameterValue = new ByteArray();
         this._ParameterValue[0] = 100;
         this._ParameterValue[1] = 100;
         this._ParameterValue[2] = 100;
      }
      
      private function GiveIoPosition() : ByteArray
      {
         var _loc1_:ByteArray = null;
         switch(this._actuator.profile)
         {
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__WINDOW_OPENER:
               _loc1_ = new ByteArray();
               _loc1_[0] = 100 - this._ParameterValue[0];
               _loc1_[1] = this._ParameterValue[1];
               _loc1_[2] = this._ParameterValue[2];
               break;
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:
               _loc1_ = new ByteArray();
               _loc1_[0] = this._ParameterValue[0];
               _loc1_[1] = 100 - this._ParameterValue[1];
               _loc1_[2] = this._ParameterValue[2];
               break;
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__ROLLING_SHUTTER:
               _loc1_ = new ByteArray();
               if(this._actuator.subProfile == ioService.datamodel.Actuator.ACTUATOR_SUB_PROFILE__ADJUSTABLE_SLATS_ROLLING_SHUTTER)
               {
                  _loc1_[0] = this._ParameterValue[0];
                  _loc1_[1] = 100 - this._ParameterValue[1];
                  _loc1_[2] = this._ParameterValue[2];
               }
               else
               {
                  _loc1_ = this._ParameterValue;
               }
               break;
            default:
               _loc1_ = new ByteArray();
               _loc1_ = this._ParameterValue;
         }
         return _loc1_;
      }
      
      [Transient]
      public function get p1() : Number
      {
         return this.degreeByNum(1);
      }
      
      [Transient]
      public function get p2() : Number
      {
         return this.degreeByNum(2);
      }
      
      public function degreeByNum(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = -1;
         var _loc4_:int = 1;
         if(param1 >= 0)
         {
            _loc3_ = _loc4_ * param1 - 1;
            if(this.ParameterValue.length >= _loc3_ + _loc4_)
            {
               this.ParameterValue.position = _loc3_;
               _loc2_ = this.ParameterValue.readByte();
            }
         }
         return _loc2_;
      }
      
      private function set _1645499911actuator(param1:ioService.datamodel.Actuator) : void
      {
         this._actuator = param1;
      }
      
      [Transient]
      public function get p3() : Number
      {
         return this.degreeByNum(3);
      }
      
      public function duplicate() : Situation
      {
         var _loc1_:Situation = new Situation();
         _loc1_.id = 0;
         _loc1_.actuator = this.actuator;
         _loc1_._ParameterValue.writeBytes(this.ParameterValue,0,this.ParameterValue.length);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      [Transient]
      public function get radioInProgress() : int
      {
         return this._1585729331radioInProgress;
      }
      
      private function set _747804969position(param1:ioService.datamodel.Position) : void
      {
         this._position = param1;
      }
      
      public function SetIoPosition(param1:ByteArray) : void
      {
         switch(this._actuator.profile)
         {
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__WINDOW_OPENER:
               this._ParameterValue[0] = 100 - param1[0];
               this._ParameterValue[1] = param1[1];
               this._ParameterValue[2] = param1[2];
               break;
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:
               this._ParameterValue[0] = param1[0];
               this._ParameterValue[1] = 100 - param1[1];
               this._ParameterValue[2] = param1[2];
               break;
            case ioService.datamodel.Actuator.ACTUATOR_PROFILE__ROLLING_SHUTTER:
               if(this._actuator.subProfile == ioService.datamodel.Actuator.ACTUATOR_SUB_PROFILE__ADJUSTABLE_SLATS_ROLLING_SHUTTER)
               {
                  this._ParameterValue[0] = param1[0];
                  this._ParameterValue[1] = 100 - param1[1];
                  this._ParameterValue[2] = param1[2];
               }
               else
               {
                  this._ParameterValue = param1;
               }
               break;
            default:
               this._ParameterValue = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set position(param1:ioService.datamodel.Position) : void
      {
         var _loc2_:Object = this.position;
         if(_loc2_ !== param1)
         {
            this._747804969position = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"position",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set actuator(param1:ioService.datamodel.Actuator) : void
      {
         var _loc2_:Object = this.actuator;
         if(_loc2_ !== param1)
         {
            this._1645499911actuator = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actuator",_loc2_,param1));
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function setDefaultPosition() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_[0] = 100;
         _loc1_[1] = 100;
         _loc1_[2] = 100;
         this.SetIoPosition(_loc1_);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="id")]
      [Id]
      public function get id() : int
      {
         return this._3355id;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      [Bindable(event="propertyChange")]
      public function set ParameterValue(param1:ByteArray) : void
      {
         var _loc2_:Object = this.ParameterValue;
         if(_loc2_ !== param1)
         {
            this._122461032ParameterValue = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ParameterValue",_loc2_,param1));
         }
      }
      
      public function FillWithThisXmlData(param1:XMLNode, param2:ArrayCollection) : Boolean
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:ioService.datamodel.Actuator = new ioService.datamodel.Actuator();
         var _loc5_:Boolean = false;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         for each(_loc9_ in param1.childNodes)
         {
            if(_loc9_.nodeName == "listof-fields")
            {
               for each(_loc10_ in _loc9_.childNodes)
               {
                  switch(parseInt(_loc10_.attributes.id))
                  {
                     case SITUATION_FIELD_ID__ACTUATOR_IO_ADDRESS:
                        _loc4_.ioAddress = _loc10_.nodeValue;
                        for each(_loc11_ in param2)
                        {
                           if(_loc11_.equals(_loc4_))
                           {
                              this._actuator = _loc11_;
                              _loc5_ = true;
                           }
                        }
                        break;
                     case SITUATION_FIELD_ID__POSITION_DEG_1:
                        _loc6_ = parseInt(_loc10_.nodeValue);
                        break;
                     case SITUATION_FIELD_ID__POSITION_DEG_2:
                        _loc7_ = parseInt(_loc10_.nodeValue);
                        break;
                     case SITUATION_FIELD_ID__POSITION_DEG_3:
                        _loc8_ = parseInt(_loc10_.nodeValue);
                        break;
                  }
               }
            }
         }
         if(_loc5_ == true)
         {
            _loc3_.writeByte(_loc6_);
            _loc3_.writeByte(_loc7_);
            _loc3_.writeByte(_loc8_);
            this.SetIoPosition(_loc3_);
         }
         return _loc5_;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Column(name="parameter_value")]
      public function get ParameterValue() : ByteArray
      {
         return this._ParameterValue;
      }
      
      [ManyToOne(type="ioService.datamodel.Position",constrain="false",cascade="all")]
      public function get position() : ioService.datamodel.Position
      {
         return this._position;
      }
      
      public function set radioInProgress(param1:int) : void
      {
         var _loc2_:Object = this._1585729331radioInProgress;
         if(_loc2_ !== param1)
         {
            this._1585729331radioInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioInProgress",_loc2_,param1));
         }
      }
      
      private function set _122461032ParameterValue(param1:ByteArray) : void
      {
         this._ParameterValue = param1;
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
      
      [ManyToOne(type="ioService.datamodel.Actuator",constrain="false",cascade="save-update")]
      public function get actuator() : ioService.datamodel.Actuator
      {
         return this._actuator;
      }
      
      public function GiveYourXmlData() : XMLNode
      {
         var _loc1_:XMLNode = null;
         var _loc2_:XMLNode = null;
         var _loc3_:XMLNode = null;
         var _loc4_:ByteArray = null;
         _loc1_ = new XMLNode(1,"situation");
         _loc3_ = new XMLNode(1,"listof-fields");
         _loc1_.appendChild(_loc3_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = SITUATION_FIELD_ID__ACTUATOR_IO_ADDRESS;
         _loc2_.attributes.type = "IO-ADDRESS";
         _loc2_.nodeValue = this._actuator.ioAddress;
         _loc3_.appendChild(_loc2_);
         (_loc4_ = this.GiveIoPosition()).position = 0;
         if(_loc4_.length >= 1)
         {
            _loc2_ = new XMLNode(1,"field");
            _loc2_.attributes.id = SITUATION_FIELD_ID__POSITION_DEG_1;
            _loc2_.attributes.type = "UINT8";
            _loc2_.nodeValue = _loc4_.readByte().toString();
            _loc3_.appendChild(_loc2_);
         }
         if(_loc4_.length >= 2)
         {
            _loc2_ = new XMLNode(1,"field");
            _loc2_.attributes.id = SITUATION_FIELD_ID__POSITION_DEG_2;
            _loc2_.attributes.type = "UINT8";
            _loc2_.nodeValue = _loc4_.readByte().toString();
            _loc3_.appendChild(_loc2_);
         }
         if(_loc4_.length >= 3)
         {
            _loc2_ = new XMLNode(1,"field");
            _loc2_.attributes.id = SITUATION_FIELD_ID__POSITION_DEG_3;
            _loc2_.attributes.type = "UINT8";
            _loc2_.nodeValue = _loc4_.readByte().toString();
            _loc3_.appendChild(_loc2_);
         }
         return _loc1_;
      }
   }
}
