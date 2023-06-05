package air.update.states
{
   import flash.errors.IllegalOperationError;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HSM extends EventDispatcher
   {
       
      
      private var asyncTimer:Timer;
      
      private var _hsmState:Function;
      
      public function HSM(param1:Function)
      {
         super();
         this._hsmState = param1;
      }
      
      public function init() : void
      {
         try
         {
            this._hsmState(new HSMEvent(HSMEvent.ENTER));
         }
         catch(e:Error)
         {
            _hsmState(new ErrorEvent(ErrorEvent.ERROR,false,false,e.message,e.errorID));
         }
      }
      
      protected function get stateHSM() : Function
      {
         return this._hsmState;
      }
      
      protected function transition(param1:Function) : void
      {
         var state:Function = param1;
         this.asyncTimer = null;
         try
         {
            this._hsmState(new HSMEvent(HSMEvent.EXIT));
            this._hsmState = state;
            this._hsmState(new HSMEvent(HSMEvent.ENTER));
         }
         catch(e:Error)
         {
            _hsmState(new ErrorEvent(ErrorEvent.ERROR,false,false,"Unhandled exception " + e.name + ": " + e.message,e.errorID));
         }
      }
      
      protected function transitionAsync(param1:Function) : void
      {
         var state:Function = param1;
         if(this.asyncTimer)
         {
            throw new IllegalOperationError("async transition already queued");
         }
         this.asyncTimer = new Timer(0,1);
         this.asyncTimer.addEventListener(TimerEvent.TIMER,function(param1:Event):void
         {
            transition(state);
         });
         this.asyncTimer.start();
      }
      
      public function dispatch(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            this._hsmState(event);
         }
         catch(e:Error)
         {
            _hsmState(new ErrorEvent(ErrorEvent.ERROR,false,false,e.message,e.errorID));
         }
      }
   }
}
