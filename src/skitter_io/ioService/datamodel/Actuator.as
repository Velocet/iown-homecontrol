package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.xml.XMLNode;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="actuator")]
   public class Actuator implements IEventDispatcher
   {
      
      public static const ACTUATOR_PROFILE__ON_OFF_SWITCH:int = 15;
      
      public static const ACTUATOR_FIELD_ID__POWER_SAVE_MODE:int = 6;
      
      public static const MANUFACTURER_ID_HORMANN:int = 4;
      
      public static const ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL:int = 255;
      
      public static const ACTUATOR_PROFILE__DOOR_LOCK:int = 9;
      
      public static const ACTUATOR_PROFILE__NONE:int = 0;
      
      public static const ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND:int = 17;
      
      public static const SLAVE_TIME_CLASS_0:int = 0;
      
      public static const SLAVE_TIME_CLASS_1:int = 1;
      
      public static const SLAVE_TIME_CLASS_2:int = 2;
      
      public static const SLAVE_TIME_CLASS_3:int = 3;
      
      public static const ACTUATOR_PROFILE__WINDOW_OPENER:int = 4;
      
      public static const ACTUATOR_FIELD_ID__SUB_PROFILE:int = 3;
      
      public static const ACTUATOR_PROFILE__VERTICAL_EXTERIOR_AWNING:int = 3;
      
      public static const MANUFACTURER_ID_ALL_IO_MEMBER:int = 0;
      
      public static const ACTUATOR_PROFILE__GATE_OPENER:int = 7;
      
      public static const ACTUATOR_SUB_PROFILE__LIGHT_WITH_COLOUR_HANDLING:int = 1;
      
      public static const ACTUATOR_FIELD_ID__IO_MEMBERSHIP_FLAG:int = 4;
      
      public static const ACTUATOR_FIELD_ID__IO_MANUFACTURER_ID:int = 5;
      
      public static const ACTUATOR_PROFILE__REMOTE_CONTROLLER:int = 1023;
      
      public static const MANUFACTURER_ID_ASSA_ABLOY:int = 5;
      
      public static const ACTUATOR_SUB_PROFILE__NONE:int = 0;
      
      public static const ACTUATOR_FIELD_ID__PROFILE:int = 2;
      
      public static const ACTUATOR_FIELD_ID__RF_SUPPORT_IN_NODE:int = 7;
      
      public static const ACTUATOR_SUB_PROFILE__WINDOW_OPENER_WITH_RAIN_SENSOR:int = 1;
      
      public static const AttributesType:Array = ["IO-ADDRESS","IO-ADDRESS","UINT16","UINT8","BOOL","UINT8","UINT8","BOOL","UINT8","UINT8"];
      
      public static const ACTUATOR_SUB_PROFILE__LIGHT_ON_OFF:int = 58;
      
      public static const KEY_STATE__CURRENT_KEY_IS_NOT_OLD:int = 2;
      
      public static const ACTUATOR_PROFILE__BEACON:int = 12;
      
      public static const ACTUATOR_PROFILE__HORIZONTAL_AWNING:int = 16;
      
      public static const MANUFACTURER_ID_VELUX:int = 1;
      
      public static const ACTUATOR_SUB_PROFILE__AIR_TRANSFER:int = 2;
      
      public static const KEY_STATE__CURRENT_KEY_NONE:int = 0;
      
      public static const ACTUATOR_PROFILE__LOUVRE_BLIND:int = 18;
      
      public static const ACTUATOR_FIELD_ID__IO_BACKBONE_ADDRESS:int = 1;
      
      public static const ACTUATOR_PROFILE__LIGHT:int = 6;
      
      public static const MANUFACTURER_ID_SOMFY:int = 2;
      
      public static const ACTUATOR_SUB_PROFILE__DOOR_LOCK:int = 0;
      
      public static const ACTUATOR_PROFILE__CURTAIN_TRACK:int = 19;
      
      public static const ACTUATOR_SUB_PROFILE__WINDOW_LOCK:int = 1;
      
      public static const MANUFACTURER_ID_NIKO:int = 6;
      
      public static const ACTUATOR_SUB_PROFILE__ADJUSTABLE_SLATS_ROLLING_SHUTTER:int = 1;
      
      public static const ACTUATOR_FIELD_ID__KEY_STATE:int = 9;
      
      public static const ACTUATOR_PROFILE__SCD:int = 11;
      
      public static const ACTUATOR_PROFILE__GARAGE_DOOR_OPENER:int = 5;
      
      public static const ACTUATOR_PROFILE__EXTERIOR_HEATING:int = 21;
      
      public static const ACTUATOR_FIELD_ID__IO_ADDRESS:int = 0;
      
      public static const ACTUATOR_SUB_PROFILE__AIR_OUTLET:int = 3;
      
      public static const ACTUATOR_PROFILE__ROLLING_DOOR_OPENER:int = 8;
      
      public static const ACTUATOR_PROFILE__DUAL_ROLLING_SHUTTER:int = 13;
      
      public static const ACTUATOR_PROFILE__TEST_AND_EVALUATION:int = 1008;
      
      public static const ACTUATOR_PROFILE__INTERIOR_VERTICAL_BLIND:int = 10;
      
      public static const ACTUATOR_SUB_PROFILE__AIR_INLET:int = 1;
      
      public static const ACTUATOR_FIELD_ID__SLAVE_TIMECLASS:int = 8;
      
      public static const ACTUATOR_PROFILE__TEMPERATURE_CONTROL_INTERFACE:int = 14;
      
      public static const ACTUATOR_PROFILE__INTERIOR_VENETIAN_BLIND:int = 1;
      
      public static const ACTUATOR_PROFILE__VENTILATION_POINT:int = 20;
      
      public static const ACTUATOR_PROFILE__ROLLING_SHUTTER:int = 2;
      
      public static const MANUFACTURER_ID_HONEYWELL:int = 3;
      
      public static const KEY_STATE__CURRENT_KEY_IS_OLD:int = 1;
       
      
      private var _IoBackBoneAddress:String = null;
      
      [Column(name="name")]
      private var _3373707name:String = null;
      
      private var _SubProfile:int = 0;
      
      private var _IoManufacturerId:int = 2;
      
      [Transient]
      private var _1759679676useInScenario:Boolean = false;
      
      private var _IoMembershipFlag:Boolean = true;
      
      [Column(name="id")]
      [Id]
      private var _3355id:int = 0;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _RfSupportInNode:Boolean = true;
      
      private var _PowerSaveMode:int = 0;
      
      private var _Profile:int = 2;
      
      private var _IoAddress:String = null;
      
      private var _SlaveTimeClass:int = 1;
      
      private var _KeyState:int = 0;
      
      public function Actuator()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="name")]
      public function get name() : String
      {
         return this._3373707name;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      [Column(name="io_manufacturer_id")]
      public function get ioManufacturerId() : int
      {
         return this._IoManufacturerId;
      }
      
      [Column(name="slave_time_class")]
      public function get slaveTimeClass() : int
      {
         return this._SlaveTimeClass;
      }
      
      [Bindable(event="propertyChange")]
      public function set subProfile(param1:int) : void
      {
         var _loc2_:Object = this.subProfile;
         if(_loc2_ !== param1)
         {
            this._1791042743subProfile = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subProfile",_loc2_,param1));
         }
      }
      
      public function FillWithThisXmlData(param1:XMLNode) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1.childNodes)
         {
            if(_loc2_.nodeName == "listof-fields")
            {
               for each(_loc3_ in _loc2_.childNodes)
               {
                  switch(parseInt(_loc3_.attributes.id))
                  {
                     case ACTUATOR_FIELD_ID__IO_ADDRESS:
                        this._IoAddress = _loc3_.nodeValue;
                        break;
                     case ACTUATOR_FIELD_ID__IO_BACKBONE_ADDRESS:
                        this._IoBackBoneAddress = _loc3_.nodeValue;
                        break;
                     case ACTUATOR_FIELD_ID__PROFILE:
                        this._Profile = parseInt(_loc3_.nodeValue);
                        break;
                     case ACTUATOR_FIELD_ID__SUB_PROFILE:
                        this._SubProfile = parseInt(_loc3_.nodeValue);
                        break;
                     case ACTUATOR_FIELD_ID__IO_MEMBERSHIP_FLAG:
                        if(_loc3_.nodeValue == "true")
                        {
                           this._IoMembershipFlag = true;
                        }
                        else
                        {
                           this._IoMembershipFlag = false;
                        }
                        break;
                     case ACTUATOR_FIELD_ID__IO_MANUFACTURER_ID:
                        this._IoManufacturerId = parseInt(_loc3_.nodeValue);
                        break;
                     case ACTUATOR_FIELD_ID__POWER_SAVE_MODE:
                        this._PowerSaveMode = parseInt(_loc3_.nodeValue);
                        break;
                     case ACTUATOR_FIELD_ID__RF_SUPPORT_IN_NODE:
                        if(_loc3_.nodeValue == "true")
                        {
                           this._RfSupportInNode = true;
                        }
                        else
                        {
                           this._RfSupportInNode = false;
                        }
                        break;
                     case ACTUATOR_FIELD_ID__SLAVE_TIMECLASS:
                        this._SlaveTimeClass = parseInt(_loc3_.nodeValue);
                        break;
                     case ACTUATOR_FIELD_ID__KEY_STATE:
                        this._KeyState = parseInt(_loc3_.nodeValue);
                        break;
                  }
               }
            }
         }
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:Object = this._3373707name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
         }
      }
      
      private function set _309425751profile(param1:int) : void
      {
         this._Profile = param1;
      }
      
      [Column(name="io_backbone_address")]
      public function get ioBackBoneAddress() : String
      {
         return this._IoBackBoneAddress;
      }
      
      [Bindable(event="propertyChange")]
      public function set ioManufacturerId(param1:int) : void
      {
         var _loc2_:Object = this.ioManufacturerId;
         if(_loc2_ !== param1)
         {
            this._1696441454ioManufacturerId = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ioManufacturerId",_loc2_,param1));
         }
      }
      
      [Column(name="io_membership_flag")]
      public function get ioMembershipFlag() : Boolean
      {
         return this._IoMembershipFlag;
      }
      
      [Column(name="profile")]
      public function get profile() : int
      {
         return this._Profile;
      }
      
      private function set _714506011powerSaveMode(param1:int) : void
      {
         this._PowerSaveMode = param1;
      }
      
      private function set _436666462rfSupportInNode(param1:Boolean) : void
      {
         this._RfSupportInNode = param1;
      }
      
      [Column(name="rf_support_in_node")]
      public function get rfSupportInNode() : Boolean
      {
         return this._RfSupportInNode;
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
      
      [Bindable(event="propertyChange")]
      public function set slaveTimeClass(param1:int) : void
      {
         var _loc2_:Object = this.slaveTimeClass;
         if(_loc2_ !== param1)
         {
            this._2058305172slaveTimeClass = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slaveTimeClass",_loc2_,param1));
         }
      }
      
      [Transient]
      public function get hasTwoPositions() : Boolean
      {
         return this.profile == ACTUATOR_PROFILE__ROLLING_SHUTTER || this.profile == ACTUATOR_PROFILE__EXTERIOR_VENETIAN_BLIND || this.profile == ACTUATOR_PROFILE__CENTRAL_HOUSE_CONTROL;
      }
      
      [Bindable(event="propertyChange")]
      [Transient]
      public function get useInScenario() : Boolean
      {
         return this._1759679676useInScenario;
      }
      
      public function GiveYourXmlData() : XMLNode
      {
         var _loc1_:XMLNode = null;
         var _loc2_:XMLNode = null;
         var _loc3_:XMLNode = null;
         _loc1_ = new XMLNode(1,"actuator");
         _loc3_ = new XMLNode(1,"listof-fields");
         _loc1_.appendChild(_loc3_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__IO_ADDRESS;
         _loc2_.attributes.type = "IO-ADDRESS";
         _loc2_.nodeValue = this._IoAddress;
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__IO_BACKBONE_ADDRESS;
         _loc2_.attributes.type = "IO-ADDRESS";
         _loc2_.nodeValue = this._IoBackBoneAddress.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__PROFILE;
         _loc2_.attributes.type = "UINT16";
         _loc2_.nodeValue = this._Profile.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__SUB_PROFILE;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._SubProfile.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__IO_MEMBERSHIP_FLAG;
         _loc2_.attributes.type = "BOOL";
         _loc2_.nodeValue = this._IoMembershipFlag.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__IO_MANUFACTURER_ID;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._IoManufacturerId.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__POWER_SAVE_MODE;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._PowerSaveMode.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__RF_SUPPORT_IN_NODE;
         _loc2_.attributes.type = "BOOL";
         _loc2_.nodeValue = this._RfSupportInNode.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__SLAVE_TIMECLASS;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._SlaveTimeClass.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = ACTUATOR_FIELD_ID__KEY_STATE;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._KeyState.toString();
         _loc3_.appendChild(_loc2_);
         return _loc1_;
      }
      
      public function equals(param1:Actuator) : Boolean
      {
         return param1 != null && param1.ioAddress == this._IoAddress;
      }
      
      private function set _108777490ioAddress(param1:String) : void
      {
         this._IoAddress = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set rfSupportInNode(param1:Boolean) : void
      {
         var _loc2_:Object = this.rfSupportInNode;
         if(_loc2_ !== param1)
         {
            this._436666462rfSupportInNode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rfSupportInNode",_loc2_,param1));
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="id")]
      [Id]
      public function get id() : int
      {
         return this._3355id;
      }
      
      [Column(name="sub_profile")]
      public function get subProfile() : int
      {
         return this._SubProfile;
      }
      
      [Bindable(event="propertyChange")]
      public function set ioBackBoneAddress(param1:String) : void
      {
         var _loc2_:Object = this.ioBackBoneAddress;
         if(_loc2_ !== param1)
         {
            this._911108899ioBackBoneAddress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ioBackBoneAddress",_loc2_,param1));
         }
      }
      
      private function set _2058305172slaveTimeClass(param1:int) : void
      {
         this._SlaveTimeClass = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set powerSaveMode(param1:int) : void
      {
         var _loc2_:Object = this.powerSaveMode;
         if(_loc2_ !== param1)
         {
            this._714506011powerSaveMode = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"powerSaveMode",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set profile(param1:int) : void
      {
         var _loc2_:Object = this.profile;
         if(_loc2_ !== param1)
         {
            this._309425751profile = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"profile",_loc2_,param1));
         }
      }
      
      private function set _911108899ioBackBoneAddress(param1:String) : void
      {
         this._IoBackBoneAddress = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set ioMembershipFlag(param1:Boolean) : void
      {
         var _loc2_:Object = this.ioMembershipFlag;
         if(_loc2_ !== param1)
         {
            this._321453864ioMembershipFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ioMembershipFlag",_loc2_,param1));
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      private function set _1791042743subProfile(param1:int) : void
      {
         this._SubProfile = param1;
      }
      
      public function clone() : Actuator
      {
         var _loc1_:Actuator = new Actuator();
         _loc1_.id = 0;
         _loc1_._IoAddress = this._IoAddress;
         _loc1_._IoBackBoneAddress = this._IoBackBoneAddress;
         _loc1_._Profile = this._Profile;
         _loc1_._SubProfile = this._SubProfile;
         _loc1_._IoMembershipFlag = this._IoMembershipFlag;
         _loc1_._IoManufacturerId = this._IoManufacturerId;
         _loc1_._PowerSaveMode = this._PowerSaveMode;
         _loc1_._RfSupportInNode = this._RfSupportInNode;
         _loc1_._SlaveTimeClass = this._SlaveTimeClass;
         _loc1_.name = this.name;
         return _loc1_;
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
      
      [Bindable(event="propertyChange")]
      public function set keyState(param1:int) : void
      {
         var _loc2_:Object = this.keyState;
         if(_loc2_ !== param1)
         {
            this._490035570keyState = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"keyState",_loc2_,param1));
         }
      }
      
      [Column(name="power_save_mode")]
      public function get powerSaveMode() : int
      {
         return this._PowerSaveMode;
      }
      
      private function set _1696441454ioManufacturerId(param1:int) : void
      {
         this._IoManufacturerId = param1;
      }
      
      [Column(name="io_address")]
      public function get ioAddress() : String
      {
         return this._IoAddress;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      [Column(name="key_state")]
      public function get keyState() : int
      {
         return this._KeyState;
      }
      
      public function set useInScenario(param1:Boolean) : void
      {
         var _loc2_:Object = this._1759679676useInScenario;
         if(_loc2_ !== param1)
         {
            this._1759679676useInScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"useInScenario",_loc2_,param1));
         }
      }
      
      private function set _490035570keyState(param1:int) : void
      {
         this._KeyState = param1;
      }
      
      private function set _321453864ioMembershipFlag(param1:Boolean) : void
      {
         this._IoMembershipFlag = param1;
      }
   }
}
