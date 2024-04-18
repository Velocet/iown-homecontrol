package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.xml.XMLNode;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="scenario")]
   public class Scenario implements IEventDispatcher
   {
      
      public static const AttributesType:Array = ["UINT32","STRING"];
      
      private static const SCENARIO_MAX_NAME_LENGTH:int = 25;
      
      private static const SCENARIO_FIELD_ID__IDENTIFIER:int = 0;
      
      private static const SCENARIO_FIELD_ID__NAME:int = 1;
       
      
      [Column(name="id")]
      [Id]
      private var _3355id:int = 0;
      
      private var _identifier:uint = 0;
      
      private var _situations:ArrayCollection;
      
      private var _name:String = null;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function Scenario()
      {
         this._situations = new ArrayCollection();
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this._identifier = uint(new Date().time);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      [Column(name="name")]
      public function get name() : String
      {
         return this._name;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function duplicate() : Scenario
      {
         var _loc2_:* = null;
         var _loc1_:Scenario = new Scenario();
         _loc1_.id = 0;
         _loc1_.name = this.name;
         _loc1_.situations = new ArrayCollection();
         for each(_loc2_ in this.situations)
         {
            if(_loc2_ != null)
            {
               _loc1_.situations.addItem(_loc2_.duplicate());
            }
         }
         return _loc1_;
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
      
      public function getSituationByActuator(param1:Actuator) : Situation
      {
         var _loc3_:* = null;
         var _loc2_:Situation = null;
         for each(_loc3_ in this._situations)
         {
            if(_loc3_.actuator.equals(param1))
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         return _loc2_;
      }
      
      [Bindable(event="propertyChange")]
      public function set identifier(param1:uint) : void
      {
         var _loc2_:Object = this.identifier;
         if(_loc2_ !== param1)
         {
            this._1618432855identifier = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"identifier",_loc2_,param1));
         }
      }
      
      public function FillWithThisXmlData(param1:XMLNode, param2:ArrayCollection) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Situation = null;
         for each(_loc3_ in param1.childNodes)
         {
            if(_loc3_.nodeName == "listof-fields")
            {
               for each(_loc4_ in _loc3_.childNodes)
               {
                  switch(parseInt(_loc4_.attributes.id))
                  {
                     case SCENARIO_FIELD_ID__IDENTIFIER:
                        this._identifier = parseInt(_loc4_.nodeValue);
                        break;
                     case SCENARIO_FIELD_ID__NAME:
                        this._name = _loc4_.nodeValue;
                        break;
                  }
               }
            }
            else if(_loc3_.nodeName == "listof-situation")
            {
               for each(_loc5_ in _loc3_.childNodes)
               {
                  if((_loc6_ = new Situation()).FillWithThisXmlData(_loc5_,param2) == true)
                  {
                     this._situations.addItem(_loc6_);
                  }
               }
            }
         }
         if(this._situations.length == 0)
         {
            return false;
         }
         return true;
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
      
      [Column(name="identifier")]
      public function get identifier() : uint
      {
         return this._identifier;
      }
      
      [Bindable(event="propertyChange")]
      public function set situations(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.situations;
         if(_loc2_ !== param1)
         {
            this._2020271669situations = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"situations",_loc2_,param1));
         }
      }
      
      private function set _1618432855identifier(param1:uint) : void
      {
         this._identifier = param1;
      }
      
      [ManyToMany(type="ioService.datamodel.Situation",cascade="all",constrain="false",indexed="false",lazy="false")]
      public function get situations() : ArrayCollection
      {
         return this._situations;
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
      
      private function set _2020271669situations(param1:ArrayCollection) : void
      {
         this._situations = param1;
      }
      
      public function GiveYourXmlData() : XMLNode
      {
         var xmlNode:XMLNode = null;
         var xmlSubNode:XMLNode = null;
         var xmlfieldsNode:XMLNode = null;
         var list:XMLNode = null;
         var s:Situation = null;
         var sxn:XMLNode = null;
         xmlNode = new XMLNode(1,"scenario");
         xmlfieldsNode = new XMLNode(1,"listof-fields");
         xmlNode.appendChild(xmlfieldsNode);
         xmlSubNode = new XMLNode(1,"field");
         xmlSubNode.attributes.id = SCENARIO_FIELD_ID__IDENTIFIER;
         xmlSubNode.attributes.type = "UINT32";
         xmlSubNode.nodeValue = this._identifier.toString();
         xmlfieldsNode.appendChild(xmlSubNode);
         xmlSubNode = new XMLNode(1,"field");
         xmlSubNode.attributes.id = SCENARIO_FIELD_ID__NAME;
         xmlSubNode.attributes.type = "STRING";
         xmlSubNode.attributes.size = SCENARIO_MAX_NAME_LENGTH;
         xmlSubNode.nodeValue = this._name;
         xmlfieldsNode.appendChild(xmlSubNode);
         if(this._situations.length > 0)
         {
            list = new XMLNode(1,"listof-situation");
            for each(s in this._situations)
            {
               if(s != null)
               {
                  sxn = s.GiveYourXmlData();
                  list.appendChild(sxn);
               }
               else
               {
                  try
                  {
                     this._situations.removeItemAt(this._situations.getItemIndex(s));
                  }
                  catch(e:Error)
                  {
                  }
               }
            }
            xmlNode.appendChild(list);
         }
         return xmlNode;
      }
   }
}
