package com.scenarioLauncher.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class Images16 implements IEventDispatcher
   {
      
      private static var _2080864206CursorNone:Class = Images16_CursorNone;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private static var _1595456181CursorAdd:Class = Images16_CursorAdd;
       
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function Images16()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      [Bindable(event="propertyChange")]
      public static function get CursorAdd() : Class
      {
         return Images16._1595456181CursorAdd;
      }
      
      [Bindable(event="propertyChange")]
      public static function get CursorNone() : Class
      {
         return Images16._2080864206CursorNone;
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public static function set CursorAdd(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = Images16._1595456181CursorAdd;
         if(_loc2_ !== param1)
         {
            Images16._1595456181CursorAdd = param1;
            _loc3_ = Images16.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(Images16,"CursorAdd",_loc2_,param1));
            }
         }
      }
      
      public static function set CursorNone(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = Images16._2080864206CursorNone;
         if(_loc2_ !== param1)
         {
            Images16._2080864206CursorNone = param1;
            _loc3_ = Images16.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(Images16,"CursorNone",_loc2_,param1));
            }
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
   }
}
