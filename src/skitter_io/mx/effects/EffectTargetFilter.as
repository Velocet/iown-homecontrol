package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.PropertyChanges;
   
   public class EffectTargetFilter
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var filterFunction:Function;
      
      public var filterStyles:Array;
      
      public var filterProperties:Array;
      
      public var requiredSemantics:Object = null;
      
      public function EffectTargetFilter()
      {
         filterFunction = defaultFilterFunctionEx;
         filterProperties = [];
         filterStyles = [];
         super();
      }
      
      protected function defaultFilterFunctionEx(param1:Array, param2:IEffectTargetHost, param3:Object) : Boolean
      {
         var _loc4_:String = null;
         if(requiredSemantics)
         {
            for(_loc4_ in requiredSemantics)
            {
               if(!param2)
               {
                  return false;
               }
               if(param2.getRendererSemanticValue(param3,_loc4_) != requiredSemantics[_loc4_])
               {
                  return false;
               }
            }
            return true;
         }
         return defaultFilterFunction(param1,param3);
      }
      
      protected function defaultFilterFunction(param1:Array, param2:Object) : Boolean
      {
         var _loc5_:PropertyChanges = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = param1[_loc4_]).target == param2)
            {
               _loc7_ = int((_loc6_ = filterProperties.concat(filterStyles)).length);
               _loc8_ = 0;
               while(_loc8_ < _loc7_)
               {
                  if(_loc5_.start[_loc6_[_loc8_]] !== undefined && _loc5_.end[_loc6_[_loc8_]] != _loc5_.start[_loc6_[_loc8_]])
                  {
                     return true;
                  }
                  _loc8_++;
               }
            }
            _loc4_++;
         }
         return false;
      }
      
      public function filterInstance(param1:Array, param2:IEffectTargetHost, param3:Object) : Boolean
      {
         if(false)
         {
            return filterFunction(param1,param3);
         }
         return filterFunction(param1,param2,param3);
      }
   }
}
