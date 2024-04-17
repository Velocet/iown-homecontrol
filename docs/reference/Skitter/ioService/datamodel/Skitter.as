package ioService.datamodel
{
   import flash.xml.XMLNode;
   import ioService.debug.DebugTrace;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="skitter",inheritsFrom="ioService.datamodel.Device")]
   public class Skitter extends Device
   {
      
      public static const GREEN_HEX_VALUE:int = 5276275;
      
      private static const SKITTER_FIELD_ID__TEST_SCENARIO:int = 7;
      
      private static const SKITTER_FIELD_ID__HW_VERSION:int = 4;
      
      public static const PURPLE_HEX_VALUE:int = 5390145;
      
      private static const SKITTER_FIELD_ID__NAME:int = 1;
      
      private static const SKITTER_FIELD_ID__BUTTON_2_SCENARIO:int = 6;
      
      public static const AttributesType:Array = ["IO-ADDRESS","STRING","UINT8","STRING","STRING","UINT32","UINT32","UINT32","UINT32"];
      
      private static const SKITTER_FIELD_ID__IO_ADDRESS:int = 0;
      
      public static const PURPLE:String = "PURPLE";
      
      public static const DEFAULT:String = "DEFAULT";
      
      public static const GREEN:String = "GREEN";
      
      private static const SKITTER_FIELD_ID__SW_VERSION:int = 3;
      
      public static const GREY:String = "GREY";
      
      private static const SKITTER_FIELD_ID__BUTTON_1_SCENARIO:int = 5;
      
      public static const GREY_HEX_VALUE:int = 14277854;
      
      private static const SKITTER_FIELD_ID__RUBBER_COLOR:int = 2;
      
      private static const SKITTER_FIELD_ID__IDENTIFIER:int = 8;
      
      private static const SKITTER_MAX_NAME_LENGTH:int = 25;
       
      
      protected var _desactivate:Boolean = false;
      
      private var _ScenarioOnButton2:ioService.datamodel.Scenario = null;
      
      private var _ScenarioOnButton1:ioService.datamodel.Scenario = null;
      
      private var _RubberColour:String = null;
      
      private var _ScenarioToTest:ioService.datamodel.Scenario = null;
      
      protected var _active:Boolean = false;
      
      private var _upgradeSuccess:int = 0;
      
      public function Skitter()
      {
         super();
         _type = Skitter.DEFAULT;
         _ioAddress = "FF.FF.FF";
         _name = "SKITTER io";
         this._RubberColour = "DEFAULT";
         _hw_version = "5063670X04";
         _sw_version = "5068556X0000";
      }
      
      private function set _2093306223ScenarioOnButton2(param1:ioService.datamodel.Scenario) : void
      {
         this._ScenarioOnButton2 = param1;
      }
      
      private function set _2093306224ScenarioOnButton1(param1:ioService.datamodel.Scenario) : void
      {
         this._ScenarioOnButton1 = param1;
      }
      
      public function GiveYourXmlData() : XMLNode
      {
         var _loc1_:XMLNode = null;
         var _loc2_:XMLNode = null;
         var _loc3_:XMLNode = null;
         var _loc4_:XMLNode = null;
         var _loc5_:XMLNode = null;
         var _loc6_:* = null;
         var _loc7_:XMLNode = null;
         var _loc8_:* = null;
         var _loc9_:XMLNode = null;
         _loc1_ = new XMLNode(1,"skitter");
         _loc2_ = new XMLNode(1,"listof-fields");
         _loc1_.appendChild(_loc2_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = SKITTER_FIELD_ID__NAME;
         _loc3_.attributes.type = "STRING";
         _loc3_.attributes.size = SKITTER_MAX_NAME_LENGTH;
         _loc3_.nodeValue = _name;
         _loc2_.appendChild(_loc3_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = SKITTER_FIELD_ID__RUBBER_COLOR;
         _loc3_.attributes.type = "UINT8";
         switch(this._RubberColour)
         {
            case DEFAULT:
            default:
               _loc3_.nodeValue = "0";
               break;
            case GREEN:
               _loc3_.nodeValue = "1";
               break;
            case PURPLE:
               _loc3_.nodeValue = "2";
               break;
            case GREY:
               _loc3_.nodeValue = "3";
         }
         _loc2_.appendChild(_loc3_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = SKITTER_FIELD_ID__BUTTON_1_SCENARIO;
         _loc3_.attributes.type = "UINT32";
         if(this._ScenarioOnButton1 != null)
         {
            _loc3_.nodeValue = this._ScenarioOnButton1.identifier.toString();
         }
         else
         {
            _loc3_.nodeValue = "0";
         }
         _loc2_.appendChild(_loc3_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = SKITTER_FIELD_ID__BUTTON_2_SCENARIO;
         _loc3_.attributes.type = "UINT32";
         if(this._ScenarioOnButton2 != null)
         {
            _loc3_.nodeValue = this._ScenarioOnButton2.identifier.toString();
         }
         else
         {
            _loc3_.nodeValue = "0";
         }
         _loc2_.appendChild(_loc3_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = SKITTER_FIELD_ID__TEST_SCENARIO;
         _loc3_.attributes.type = "UINT32";
         if(this._ScenarioToTest != null)
         {
            _loc3_.nodeValue = this._ScenarioToTest.identifier.toString();
         }
         else
         {
            _loc3_.nodeValue = "0";
         }
         _loc2_.appendChild(_loc3_);
         if(_currentKey2W != null)
         {
            (_loc4_ = new XMLNode(1,"listof-key2W")).appendChild(_currentKey2W.GiveYourXmlData());
            _loc1_.appendChild(_loc4_);
         }
         if(false)
         {
            _loc5_ = new XMLNode(1,"listof-actuator");
            for each(_loc6_ in _actuators)
            {
               _loc5_.appendChild(_loc6_.GiveYourXmlData());
            }
            _loc1_.appendChild(_loc5_);
         }
         if(false)
         {
            _loc7_ = new XMLNode(1,"listof-beacon");
            for each(_loc8_ in _repeaters)
            {
               _loc7_.appendChild(_loc8_.GiveYourXmlData());
            }
            _loc1_.appendChild(_loc7_);
         }
         if(this._ScenarioOnButton1 != null || this._ScenarioOnButton2 != null || this._ScenarioToTest != null)
         {
            _loc9_ = new XMLNode(1,"listof-scenario");
            if(this._ScenarioOnButton1 != null)
            {
               _loc9_.appendChild(this._ScenarioOnButton1.GiveYourXmlData());
            }
            if(this._ScenarioOnButton2 != null)
            {
               _loc9_.appendChild(this._ScenarioOnButton2.GiveYourXmlData());
            }
            if(this._ScenarioToTest != null)
            {
               _loc9_.appendChild(this._ScenarioToTest.GiveYourXmlData());
            }
            _loc1_.appendChild(_loc9_);
         }
         return _loc1_;
      }
      
      [Transient]
      public function get desactivate() : Boolean
      {
         return this._desactivate;
      }
      
      [Transient]
      public function get upgradeSuccess() : int
      {
         return this._upgradeSuccess;
      }
      
      private function set _1034344699desactivate(param1:Boolean) : void
      {
         this._desactivate = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set upgradeSuccess(param1:int) : void
      {
         var _loc2_:Object = this.upgradeSuccess;
         if(_loc2_ !== param1)
         {
            this._1683285575upgradeSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeSuccess",_loc2_,param1));
         }
      }
      
      [ManyToOne(name="scenario1_id",cascade="save-update",constrain="false",indexed="false")]
      public function get ScenarioOnButton1() : ioService.datamodel.Scenario
      {
         return this._ScenarioOnButton1;
      }
      
      [ManyToOne(name="scenario2_id",cascade="save-update",constrain="false",indexed="false")]
      public function get ScenarioOnButton2() : ioService.datamodel.Scenario
      {
         return this._ScenarioOnButton2;
      }
      
      private function set _1683285575upgradeSuccess(param1:int) : void
      {
         this._upgradeSuccess = param1;
      }
      
      [Transient]
      public function get active() : Boolean
      {
         return this._active;
      }
      
      private function set _839274877ScenarioToTest(param1:ioService.datamodel.Scenario) : void
      {
         this._ScenarioToTest = param1;
      }
      
      public function updateData(param1:Skitter) : void
      {
         this.active = param1.active;
         actuators = param1.actuators;
         currentKey2W = param1.currentKey2W;
         hw_version = param1.hw_version;
         ioAddress = param1.ioAddress;
         name = param1.name;
         repeaters = param1.repeaters;
         this.RubberColour = param1.RubberColour;
         this.ScenarioOnButton1 = param1.ScenarioOnButton1;
         this.ScenarioOnButton2 = param1.ScenarioOnButton2;
         this.ScenarioToTest = param1.ScenarioToTest;
         type = param1.type;
         virtualComPort = param1.virtualComPort;
      }
      
      public function clone() : Skitter
      {
         var _loc1_:Skitter = new Skitter();
         _loc1_.active = this.active;
         _loc1_.actuators = actuators;
         _loc1_.currentKey2W = currentKey2W;
         _loc1_.hw_version = hw_version;
         _loc1_.ioAddress = ioAddress;
         _loc1_.name = name;
         _loc1_.repeaters = repeaters;
         _loc1_.RubberColour = this.RubberColour;
         _loc1_.ScenarioOnButton1 = this.ScenarioOnButton1;
         _loc1_.ScenarioOnButton2 = this.ScenarioOnButton2;
         _loc1_.ScenarioToTest = this.ScenarioToTest;
         _loc1_.sw_version = sw_version;
         _loc1_.type = type;
         _loc1_.virtualComPort = virtualComPort;
         _loc1_.active = this.active;
         return _loc1_;
      }
      
      private function set _860014660RubberColour(param1:String) : void
      {
         this._RubberColour = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set ScenarioOnButton1(param1:ioService.datamodel.Scenario) : void
      {
         var _loc2_:Object = this.ScenarioOnButton1;
         if(_loc2_ !== param1)
         {
            this._2093306224ScenarioOnButton1 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ScenarioOnButton1",_loc2_,param1));
         }
      }
      
      public function FillWithThisXmlData(param1:XMLNode) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Actuator = null;
         var _loc8_:* = null;
         var _loc9_:Beacon = null;
         var _loc10_:* = null;
         var _loc11_:ioService.datamodel.Scenario = null;
         this._ScenarioOnButton1 = null;
         this._ScenarioOnButton2 = null;
         this._ScenarioToTest = null;
         for each(_loc4_ in param1.childNodes)
         {
            if(_loc4_.nodeName == "listof-fields")
            {
               for each(_loc5_ in _loc4_.childNodes)
               {
                  switch(parseInt(_loc5_.attributes.id))
                  {
                     case SKITTER_FIELD_ID__IDENTIFIER:
                        _identifier = _loc5_.nodeValue;
                        break;
                     case SKITTER_FIELD_ID__IO_ADDRESS:
                        _ioAddress = _loc5_.nodeValue;
                        break;
                     case SKITTER_FIELD_ID__NAME:
                        _name = _loc5_.nodeValue;
                        break;
                     case SKITTER_FIELD_ID__RUBBER_COLOR:
                        switch(_loc5_.nodeValue)
                        {
                           case "0":
                           default:
                              this._RubberColour = DEFAULT;
                              break;
                           case "1":
                              this._RubberColour = GREEN;
                              break;
                           case "2":
                              this._RubberColour = PURPLE;
                              break;
                           case "3":
                              this._RubberColour = GREY;
                        }
                        break;
                     case SKITTER_FIELD_ID__SW_VERSION:
                        _sw_version = _loc5_.nodeValue;
                        break;
                     case SKITTER_FIELD_ID__HW_VERSION:
                        _hw_version = _loc5_.nodeValue;
                        break;
                     case SKITTER_FIELD_ID__BUTTON_1_SCENARIO:
                        _loc2_ = parseInt(_loc5_.nodeValue);
                        break;
                     case SKITTER_FIELD_ID__BUTTON_2_SCENARIO:
                        _loc3_ = parseInt(_loc5_.nodeValue);
                        break;
                  }
               }
            }
         }
         for each(_loc4_ in param1.childNodes)
         {
            if(_loc4_.nodeName == "listof-key2W")
            {
               _currentKey2W.FillWithThisXmlData(_loc4_.firstChild);
            }
            else if(_loc4_.nodeName == "listof-actuator")
            {
               for each(_loc6_ in _loc4_.childNodes)
               {
                  (_loc7_ = new Actuator()).FillWithThisXmlData(_loc6_);
                  _actuators.addItem(_loc7_);
               }
            }
            else if(_loc4_.nodeName == "listof-beacon")
            {
               for each(_loc8_ in _loc4_.childNodes)
               {
                  (_loc9_ = new Beacon()).FillWithThisXmlData(_loc8_);
                  _repeaters.addItem(_loc9_);
               }
            }
            else if(_loc4_.nodeName == "listof-scenario")
            {
               for each(_loc10_ in _loc4_.childNodes)
               {
                  if((_loc11_ = new ioService.datamodel.Scenario()).FillWithThisXmlData(_loc10_,_actuators) == true)
                  {
                     if(_loc2_ == _loc11_.identifier)
                     {
                        this._ScenarioOnButton1 = _loc11_;
                     }
                     else if(_loc3_ == _loc11_.identifier)
                     {
                        this._ScenarioOnButton2 = _loc11_;
                     }
                  }
               }
            }
         }
      }
      
      private function createEmptyScenario() : XMLNode
      {
         var _loc1_:XMLNode = new XMLNode(1,"scenario");
         _loc1_.attributes.tag = 0;
         _loc1_.attributes.name = "Empty";
         return _loc1_;
      }
      
      public function Display() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         DebugTrace.Tracer("*****************************************");
         DebugTrace.Tracer("********** Skitter Description **********");
         DebugTrace.Tracer("*****************************************");
         DebugTrace.Tracer("   - identifier  : " + _identifier);
         DebugTrace.Tracer("   - io address  : " + _ioAddress);
         DebugTrace.Tracer("   - name        : " + _name);
         DebugTrace.Tracer("   - rubberColor : " + this._RubberColour);
         DebugTrace.Tracer("   - swVersion   : " + _sw_version);
         DebugTrace.Tracer("   - hwVersion   : " + _hw_version);
         DebugTrace.Tracer("");
         DebugTrace.Tracer(" ############# Key 2W ###################");
         if(_currentKey2W != null)
         {
            DebugTrace.Tracer("     - old     : undefined");
            DebugTrace.Tracer("     - current : undefined");
         }
         else
         {
            DebugTrace.Tracer("     - old     : NULL");
            DebugTrace.Tracer("     - current : NULL");
         }
         DebugTrace.Tracer("");
         DebugTrace.Tracer(" ############# Actuators ###############");
         DebugTrace.Tracer("     - Number : undefined");
         for each(_loc1_ in _actuators)
         {
            DebugTrace.Tracer("     - " + _actuators.getItemIndex(_loc1_) + " : " + _loc1_.ioAddress + ", k : " + _loc1_.keyState);
         }
         DebugTrace.Tracer("");
         DebugTrace.Tracer(" ############# Scenario  ###############");
         if(this._ScenarioOnButton1 != null)
         {
            DebugTrace.Tracer("  -> Scenario 1");
            DebugTrace.Tracer("    - tag  : " + this._ScenarioOnButton1.identifier);
            DebugTrace.Tracer("    - name : " + this._ScenarioOnButton1.name);
            for each(_loc2_ in this._ScenarioOnButton1.situations)
            {
               if(_loc2_ != null)
               {
                  DebugTrace.Tracer("    -> sit " + this._ScenarioOnButton1.situations.getItemIndex(_loc2_) + " : " + _loc2_.actuator.ioAddress + " - " + _loc2_.p1 + "% : " + _loc2_.p2 + "% : " + _loc2_.p3 + "%");
               }
               else
               {
                  DebugTrace.Tracer("  -> sit is null : ERROR");
               }
            }
         }
         else
         {
            DebugTrace.Tracer("  -> Scenario 1 : Empty");
         }
         if(this._ScenarioOnButton2 != null)
         {
            DebugTrace.Tracer("  -> Scenario 2");
            DebugTrace.Tracer("    - tag  : " + this._ScenarioOnButton2.identifier);
            DebugTrace.Tracer("    - name : " + this._ScenarioOnButton2.name);
            for each(_loc3_ in this._ScenarioOnButton2.situations)
            {
               if(_loc3_ != null)
               {
                  DebugTrace.Tracer("    -> sit " + this._ScenarioOnButton2.situations.getItemIndex(_loc3_) + " : " + _loc3_.actuator.ioAddress + " - " + _loc3_.p1 + "% : " + _loc3_.p2 + "% : " + _loc3_.p3 + "%");
               }
               else
               {
                  DebugTrace.Tracer("  -> sit is null : ERROR");
               }
            }
         }
         else
         {
            DebugTrace.Tracer("  -> Scenario 2 : Empty");
         }
         if(this._ScenarioToTest != null)
         {
            DebugTrace.Tracer("  -> Scenario to test");
            DebugTrace.Tracer("    - tag  : " + this._ScenarioToTest.identifier);
            DebugTrace.Tracer("    - name : " + this._ScenarioToTest.name);
            for each(_loc4_ in this._ScenarioToTest.situations)
            {
               if(_loc4_ != null)
               {
                  DebugTrace.Tracer("    -> sit " + this._ScenarioToTest.situations.getItemIndex(_loc4_) + " : " + _loc4_.actuator.ioAddress + " - " + _loc4_.p1 + "% : " + _loc4_.p2 + "% : " + _loc4_.p3 + "%");
               }
               else
               {
                  DebugTrace.Tracer("  -> sit is null : ERROR");
               }
            }
         }
         else
         {
            DebugTrace.Tracer("  -> Scenario to test : Empty");
         }
      }
      
      private function set _1422950650active(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set active(param1:Boolean) : void
      {
         var _loc2_:Object = this.active;
         if(_loc2_ !== param1)
         {
            this._1422950650active = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"active",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set ScenarioOnButton2(param1:ioService.datamodel.Scenario) : void
      {
         var _loc2_:Object = this.ScenarioOnButton2;
         if(_loc2_ !== param1)
         {
            this._2093306223ScenarioOnButton2 = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ScenarioOnButton2",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set desactivate(param1:Boolean) : void
      {
         var _loc2_:Object = this.desactivate;
         if(_loc2_ !== param1)
         {
            this._1034344699desactivate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"desactivate",_loc2_,param1));
         }
      }
      
      [Transient]
      public function get hasCorrectIdentifier() : Boolean
      {
         var _loc1_:Boolean = true;
         if(_identifier.indexOf("-") > -1)
         {
         }
         return false;
      }
      
      [Bindable(event="propertyChange")]
      public function set ScenarioToTest(param1:ioService.datamodel.Scenario) : void
      {
         var _loc2_:Object = this.ScenarioToTest;
         if(_loc2_ !== param1)
         {
            this._839274877ScenarioToTest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ScenarioToTest",_loc2_,param1));
         }
      }
      
      [Column(name="rubber_colour")]
      public function get RubberColour() : String
      {
         return this._RubberColour;
      }
      
      [Transient]
      public function get ScenarioToTest() : ioService.datamodel.Scenario
      {
         return this._ScenarioToTest;
      }
      
      [Bindable(event="propertyChange")]
      public function set RubberColour(param1:String) : void
      {
         var _loc2_:Object = this.RubberColour;
         if(_loc2_ !== param1)
         {
            this._860014660RubberColour = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"RubberColour",_loc2_,param1));
         }
      }
   }
}
