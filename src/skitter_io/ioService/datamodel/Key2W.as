package ioService.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.xml.XMLNode;
   import mx.events.PropertyChangeEvent;
   
   [Table(name="key2w")]
   public class Key2W implements IEventDispatcher
   {
      
      public static const AttributesType:Array = ["HEXA-STRING","HEXA-STRING"];
      
      private static const KEY_2W_FIELD_ID__OLD:int = 0;
      
      private static const KEY_2W_FIELD_ID__CURRENT:int = 1;
       
      
      [Column(name="current_key")]
      private var _1088992730currentKey:String;
      
      [Column(name="old_key")]
      private var _1014336840oldKey:String;
      
      [Column(name="id")]
      [Id]
      private var _3355id:int;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function Key2W()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function Compare(param1:Key2W) : Boolean
      {
         var _loc2_:Boolean = true;
         if(param1 != null && this.currentKey == param1.currentKey)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
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
      
      public function set currentKey(param1:String) : void
      {
         var _loc2_:Object = this._1088992730currentKey;
         if(_loc2_ !== param1)
         {
            this._1088992730currentKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentKey",_loc2_,param1));
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
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
                     case KEY_2W_FIELD_ID__OLD:
                        this.oldKey = _loc3_.nodeValue;
                        break;
                     case KEY_2W_FIELD_ID__CURRENT:
                        this.currentKey = _loc3_.nodeValue;
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
      
      public function clone() : Key2W
      {
         var _loc1_:Key2W = null;
         _loc1_ = new Key2W();
         _loc1_.id = 0;
         _loc1_.currentKey = this.currentKey;
         _loc1_.oldKey = this.oldKey;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="current_key")]
      public function get currentKey() : String
      {
         return this._1088992730currentKey;
      }
      
      public function set oldKey(param1:String) : void
      {
         var _loc2_:Object = this._1014336840oldKey;
         if(_loc2_ !== param1)
         {
            this._1014336840oldKey = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"oldKey",_loc2_,param1));
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      [Bindable(event="propertyChange")]
      [Column(name="old_key")]
      public function get oldKey() : String
      {
         return this._1014336840oldKey;
      }
      
      public function GiveYourXmlData() : XMLNode
      {
         var _loc1_:XMLNode = null;
         var _loc2_:XMLNode = null;
         var _loc3_:XMLNode = null;
         _loc1_ = new XMLNode(1,"key2W");
         _loc2_ = new XMLNode(1,"listof-fields");
         _loc1_.appendChild(_loc2_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = KEY_2W_FIELD_ID__OLD;
         _loc3_.attributes.type = "HEXA-STRING";
         _loc3_.attributes.size = 16;
         _loc3_.nodeValue = this.oldKey;
         _loc2_.appendChild(_loc3_);
         _loc3_ = new XMLNode(1,"field");
         _loc3_.attributes.id = KEY_2W_FIELD_ID__CURRENT;
         _loc3_.attributes.type = "HEXA-STRING";
         _loc3_.attributes.size = 16;
         _loc3_.nodeValue = this.currentKey;
         _loc2_.appendChild(_loc3_);
         return _loc1_;
      }
   }
}
