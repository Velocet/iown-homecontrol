package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.xml.XMLNode;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="beacon")]
   public class Beacon implements IEventDispatcher
   {
      
      public static const BEACON_FIELD_ID__SLAVE_TIMECLASS:int = 6;
      
      public static const BEACON_FIELD_ID__IO_MANUFACTURER_ID:int = 3;
      
      public static const BEACON_FIELD_ID__POWER_SAVE_MODE:int = 4;
      
      public static const AttributesType:Array = ["IO-ADDRESS","IO-ADDRESS","UINT8","UINT8","UINT8","UINT8","UINT8"];
      
      public static const BEACON_FIELD_ID__IO_ADDRESS:int = 0;
      
      public static const BEACON_FIELD_ID__IO_MEMBERSHIP_FLAG:int = 2;
      
      public static const BEACON_FIELD_ID__RF_SUPPORT_IN_NODE:int = 5;
      
      public static const BEACON_FIELD_ID__IO_BACKBONE_ADDRESS:int = 1;
       
      
      private var _IoBackBoneAddress:String = null;
      
      private var _IoManufacturerId:int = 2;
      
      private var _IoMembershipFlag:Boolean = true;
      
      [Column(name="id")]
      [Id]
      private var _3355id:int;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      private var _RfSupportInNode:Boolean = true;
      
      private var _PowerSaveMode:int = 0;
      
      private var _IoAddress:String = null;
      
      private var _SlaveTimeClass:int = 1;
      
      public function Beacon()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
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
                     case BEACON_FIELD_ID__IO_ADDRESS:
                        this._IoAddress = _loc3_.nodeValue;
                        break;
                     case BEACON_FIELD_ID__IO_BACKBONE_ADDRESS:
                        this._IoBackBoneAddress = _loc3_.nodeValue;
                        break;
                     case BEACON_FIELD_ID__IO_MEMBERSHIP_FLAG:
                        if(_loc3_.nodeValue == "true")
                        {
                           this._IoMembershipFlag = true;
                        }
                        else
                        {
                           this._IoMembershipFlag = false;
                        }
                        break;
                     case BEACON_FIELD_ID__IO_MANUFACTURER_ID:
                        this._IoManufacturerId = parseInt(_loc3_.nodeValue);
                        break;
                     case BEACON_FIELD_ID__POWER_SAVE_MODE:
                        this._PowerSaveMode = parseInt(_loc3_.nodeValue);
                        break;
                     case BEACON_FIELD_ID__RF_SUPPORT_IN_NODE:
                        if(_loc3_.nodeValue == "true")
                        {
                           this._RfSupportInNode = true;
                        }
                        else
                        {
                           this._RfSupportInNode = false;
                        }
                        break;
                     case BEACON_FIELD_ID__SLAVE_TIMECLASS:
                        this._SlaveTimeClass = parseInt(_loc3_.nodeValue);
                        break;
                  }
               }
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="id")]
      [Id]
      public function get id() : int
      {
         return this._3355id;
      }
      
      private function set _436666462rfSupportInNode(param1:Boolean) : void
      {
         this._RfSupportInNode = param1;
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
      
      [Column(name="rf_support_in_node")]
      public function get rfSupportInNode() : Boolean
      {
         return this._RfSupportInNode;
      }
      
      private function set _714506011powerSaveMode(param1:int) : void
      {
         this._PowerSaveMode = param1;
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
      
      public function set id(param1:int) : void
      {
         var _loc2_:Object = this._3355id;
         if(_loc2_ !== param1)
         {
            this._3355id = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
         }
      }
      
      public function GiveYourXmlData() : XMLNode
      {
         var _loc1_:XMLNode = null;
         var _loc2_:XMLNode = null;
         var _loc3_:XMLNode = null;
         _loc1_ = new XMLNode(1,"beacon");
         _loc3_ = new XMLNode(1,"listof-fields");
         _loc1_.appendChild(_loc3_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__IO_ADDRESS;
         _loc2_.attributes.type = "IO-ADDRESS";
         _loc2_.nodeValue = this._IoAddress;
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__IO_BACKBONE_ADDRESS;
         _loc2_.attributes.type = "IO-ADDRESS";
         _loc2_.nodeValue = this._IoBackBoneAddress;
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__IO_MEMBERSHIP_FLAG;
         _loc2_.attributes.type = "BOOL";
         _loc2_.nodeValue = this._IoMembershipFlag.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__IO_MANUFACTURER_ID;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._IoManufacturerId.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__POWER_SAVE_MODE;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._PowerSaveMode.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__RF_SUPPORT_IN_NODE;
         _loc2_.attributes.type = "BOOL";
         _loc2_.nodeValue = this._RfSupportInNode.toString();
         _loc3_.appendChild(_loc2_);
         _loc2_ = new XMLNode(1,"field");
         _loc2_.attributes.id = BEACON_FIELD_ID__SLAVE_TIMECLASS;
         _loc2_.attributes.type = "UINT8";
         _loc2_.nodeValue = this._SlaveTimeClass.toString();
         _loc3_.appendChild(_loc2_);
         return _loc1_;
      }
      
      public function equals(param1:Beacon) : Boolean
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
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
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
      
      private function set _1696441454ioManufacturerId(param1:int) : void
      {
         this._IoManufacturerId = param1;
      }
      
      [Column(name="power_save_mode")]
      public function get powerSaveMode() : int
      {
         return this._PowerSaveMode;
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
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      private function set _321453864ioMembershipFlag(param1:Boolean) : void
      {
         this._IoMembershipFlag = param1;
      }
   }
}
