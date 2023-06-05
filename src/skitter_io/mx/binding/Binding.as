package mx.binding
{
   import flash.utils.Dictionary;
   import mx.collections.errors.ItemPendingError;
   import mx.core.mx_internal;
   
   public class Binding
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      mx_internal var destFunc:Function;
      
      mx_internal var srcFunc:Function;
      
      mx_internal var destString:String;
      
      mx_internal var document:Object;
      
      private var hasHadValue:Boolean;
      
      mx_internal var disabledRequests:Dictionary;
      
      mx_internal var isExecuting:Boolean;
      
      mx_internal var isHandlingEvent:Boolean;
      
      public var twoWayCounterpart:mx.binding.Binding;
      
      private var wrappedFunctionSuccessful:Boolean;
      
      mx_internal var _isEnabled:Boolean;
      
      public var uiComponentWatcher:int;
      
      private var lastValue:Object;
      
      public function Binding(param1:Object, param2:Function, param3:Function, param4:String)
      {
         super();
         this.mx_internal::document = param1;
         this.mx_internal::srcFunc = param2;
         this.mx_internal::destFunc = param3;
         this.mx_internal::destString = param4;
         mx_internal::_isEnabled = true;
         mx_internal::isExecuting = false;
         mx_internal::isHandlingEvent = false;
         hasHadValue = false;
         uiComponentWatcher = -1;
         BindingManager.addBinding(param1,param4,this);
      }
      
      private function registerDisabledExecute(param1:Object) : void
      {
         if(param1 != null)
         {
            mx_internal::disabledRequests = mx_internal::disabledRequests != null ? mx_internal::disabledRequests : new Dictionary(true);
            mx_internal::disabledRequests[param1] = true;
         }
      }
      
      protected function wrapFunctionCall(param1:Object, param2:Function, param3:Object = null, ... rest) : Object
      {
         var result:Object = null;
         var thisArg:Object = param1;
         var wrappedFunction:Function = param2;
         var object:Object = param3;
         var args:Array = rest;
         wrappedFunctionSuccessful = false;
         try
         {
            result = wrappedFunction.apply(thisArg,args);
            wrappedFunctionSuccessful = true;
            return result;
         }
         catch(itemPendingError:ItemPendingError)
         {
            itemPendingError.addResponder(new EvalBindingResponder(this,object));
            if(BindingManager.debugDestinationStrings[mx_internal::destString])
            {
               trace("Binding: destString = " + mx_internal::destString + ", error = " + itemPendingError);
            }
         }
         catch(rangeError:RangeError)
         {
            if(BindingManager.debugDestinationStrings[mx_internal::destString])
            {
               trace("Binding: destString = " + mx_internal::destString + ", error = " + rangeError);
            }
         }
         catch(error:Error)
         {
            if(error.errorID != 1006 && error.errorID != 1009 && error.errorID != 1010 && error.errorID != 1055 && error.errorID != 1069)
            {
               throw error;
            }
            if(BindingManager.debugDestinationStrings[mx_internal::destString])
            {
               trace("Binding: destString = " + mx_internal::destString + ", error = " + error);
            }
         }
         return null;
      }
      
      public function watcherFired(param1:Boolean, param2:int) : void
      {
         var commitEvent:Boolean = param1;
         var cloneIndex:int = param2;
         if(mx_internal::isHandlingEvent)
         {
            return;
         }
         try
         {
            mx_internal::isHandlingEvent = true;
            execute(cloneIndex);
         }
         finally
         {
            mx_internal::isHandlingEvent = false;
         }
      }
      
      private function nodeSeqEqual(param1:XMLList, param2:XMLList) : Boolean
      {
         var _loc4_:Number = 0;
         var _loc3_:uint = uint(param1.length());
         if(_loc3_ == param2.length())
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_ && param1[_loc4_] === param2[_loc4_])
            {
               _loc4_++;
            }
            return _loc4_ == _loc3_;
         }
         return false;
      }
      
      mx_internal function set isEnabled(param1:Boolean) : void
      {
         mx_internal::_isEnabled = param1;
         if(param1)
         {
            processDisabledRequests();
         }
      }
      
      private function processDisabledRequests() : void
      {
         var _loc1_:Object = null;
         if(mx_internal::disabledRequests != null)
         {
            for(_loc1_ in mx_internal::disabledRequests)
            {
               execute(_loc1_);
            }
            mx_internal::disabledRequests = null;
         }
      }
      
      public function execute(param1:Object = null) : void
      {
         var o:Object = param1;
         if(!mx_internal::isEnabled)
         {
            if(o != null)
            {
               registerDisabledExecute(o);
            }
            return;
         }
         if(mx_internal::isExecuting || twoWayCounterpart && false)
         {
            hasHadValue = true;
            return;
         }
         try
         {
            mx_internal::isExecuting = true;
            wrapFunctionCall(this,innerExecute,o);
         }
         finally
         {
            mx_internal::isExecuting = false;
         }
      }
      
      mx_internal function get isEnabled() : Boolean
      {
         return mx_internal::_isEnabled;
      }
      
      private function innerExecute() : void
      {
         var _loc1_:Object = wrapFunctionCall(mx_internal::document,mx_internal::srcFunc);
         if(BindingManager.debugDestinationStrings[mx_internal::destString])
         {
            trace("Binding: destString = " + mx_internal::destString + ", srcFunc result = " + _loc1_);
         }
         if(hasHadValue || wrappedFunctionSuccessful)
         {
            if(!(lastValue is XML && Boolean(lastValue.hasComplexContent()) && lastValue === _loc1_) && !(lastValue is XMLList && lastValue.hasComplexContent() && _loc1_ is XMLList && nodeSeqEqual(lastValue as XMLList,_loc1_ as XMLList)))
            {
               mx_internal::destFunc.call(mx_internal::document,_loc1_);
               lastValue = _loc1_;
               hasHadValue = true;
            }
         }
      }
   }
}
