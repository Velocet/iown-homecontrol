package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class PropertyChangeEvent extends Event
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const PROPERTY_CHANGE:String = "propertyChange";
       
      
      public var newValue:Object;
      
      public var kind:String;
      
      public var property:Object;
      
      public var oldValue:Object;
      
      public var source:Object;
      
      public function PropertyChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Object = null, param6:Object = null, param7:Object = null, param8:Object = null)
      {
         super(param1,param2,param3);
         this.kind = param4;
         this.property = param5;
         this.oldValue = param6;
         this.newValue = param7;
         this.source = param8;
      }
      
      public static function createUpdateEvent(param1:Object, param2:Object, param3:Object, param4:Object) : PropertyChangeEvent
      {
         var _loc5_:PropertyChangeEvent;
         (_loc5_ = new PropertyChangeEvent(PROPERTY_CHANGE)).kind = PropertyChangeEventKind.UPDATE;
         _loc5_.oldValue = param3;
         _loc5_.newValue = param4;
         _loc5_.source = param1;
         _loc5_.property = param2;
         return _loc5_;
      }
      
      override public function clone() : Event
      {
         return new PropertyChangeEvent(type,bubbles,cancelable,kind,property,oldValue,newValue,source);
      }
   }
}
