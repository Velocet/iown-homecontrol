package mx.states
{
   import flash.events.EventDispatcher;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class State extends EventDispatcher
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var basedOn:String;
      
      private var initialized:Boolean = false;
      
      public var overrides:Array;
      
      public var name:String;
      
      public function State()
      {
         overrides = [];
         super();
      }
      
      mx_internal function initialize() : void
      {
         var _loc1_:int = 0;
         if(!initialized)
         {
            initialized = true;
            _loc1_ = 0;
            while(_loc1_ < overrides.length)
            {
               IOverride(overrides[_loc1_]).initialize();
               _loc1_++;
            }
         }
      }
      
      mx_internal function dispatchExitState() : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.EXIT_STATE));
      }
      
      mx_internal function dispatchEnterState() : void
      {
         dispatchEvent(new FlexEvent(FlexEvent.ENTER_STATE));
      }
   }
}
