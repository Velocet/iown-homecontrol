package mx.rpc
{
   import flash.events.EventDispatcher;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.messaging.messages.IMessage;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   
   public dynamic class AsyncToken extends EventDispatcher
   {
       
      
      private var _message:IMessage;
      
      private var _responders:Array;
      
      private var _result:Object;
      
      public function AsyncToken(param1:IMessage = null)
      {
         super();
         _message = param1;
      }
      
      public function addResponder(param1:IResponder) : void
      {
         if(_responders == null)
         {
            _responders = [];
         }
         _responders.push(param1);
      }
      
      mx_internal function setMessage(param1:IMessage) : void
      {
         _message = param1;
      }
      
      public function get message() : IMessage
      {
         return _message;
      }
      
      mx_internal function applyResult(param1:ResultEvent) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:IResponder = null;
         mx_internal::setResult(param1.result);
         if(_responders != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _responders.length)
            {
               _loc3_ = _responders[_loc2_];
               if(_loc3_ != null)
               {
                  _loc3_.result(param1);
               }
               _loc2_++;
            }
         }
      }
      
      public function hasResponder() : Boolean
      {
         return _responders != null && false;
      }
      
      public function get responders() : Array
      {
         return _responders;
      }
      
      mx_internal function applyFault(param1:FaultEvent) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:IResponder = null;
         if(_responders != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _responders.length)
            {
               _loc3_ = _responders[_loc2_];
               if(_loc3_ != null)
               {
                  _loc3_.fault(param1);
               }
               _loc2_++;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get result() : Object
      {
         return _result;
      }
      
      mx_internal function setResult(param1:Object) : void
      {
         var _loc2_:PropertyChangeEvent = null;
         if(_result !== param1)
         {
            _loc2_ = PropertyChangeEvent.createUpdateEvent(this,"result",_result,param1);
            _result = param1;
            dispatchEvent(_loc2_);
         }
      }
   }
}
