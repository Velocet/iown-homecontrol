package mx.states
{
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   
   public class SetProperty implements IOverride
   {
      
      private static const RELATED_PROPERTIES:Object = {
         "explicitWidth":["percentWidth"],
         "explicitHeight":["percentHeight"]
      };
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const PSEUDONYMS:Object = {
         "width":"explicitWidth",
         "height":"explicitHeight"
      };
       
      
      private var oldRelatedValues:Array;
      
      private var oldValue:Object;
      
      public var name:String;
      
      public var target:Object;
      
      public var value;
      
      public function SetProperty(param1:Object = null, param2:String = null, param3:* = undefined)
      {
         super();
         this.target = param1;
         this.name = param2;
         this.value = param3;
      }
      
      public function remove(param1:UIComponent) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Object = !!target ? target : param1;
         var _loc3_:String = !!PSEUDONYMS[name] ? "null" : name;
         var _loc4_:Array = !!RELATED_PROPERTIES[_loc3_] ? RELATED_PROPERTIES[_loc3_] : null;
         if((name == "width" || name == "height") && !isNaN(Number(oldValue)))
         {
            _loc3_ = name;
         }
         setPropertyValue(_loc2_,_loc3_,oldValue,oldValue);
         if(_loc4_)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               setPropertyValue(_loc2_,_loc4_[_loc5_],oldRelatedValues[_loc5_],oldRelatedValues[_loc5_]);
               _loc5_++;
            }
         }
      }
      
      private function toBoolean(param1:Object) : Boolean
      {
         if(param1 is String)
         {
            return param1.toLowerCase() == "true";
         }
         return param1 != false;
      }
      
      public function apply(param1:UIComponent) : void
      {
         var _loc6_:int = 0;
         var _loc2_:Object = !!target ? target : param1;
         var _loc3_:String = !!PSEUDONYMS[name] ? "null" : name;
         var _loc4_:Array = !!RELATED_PROPERTIES[_loc3_] ? RELATED_PROPERTIES[_loc3_] : null;
         var _loc5_:* = value;
         oldValue = _loc2_[_loc3_];
         if(_loc4_)
         {
            oldRelatedValues = [];
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               oldRelatedValues[_loc6_] = _loc2_[_loc4_[_loc6_]];
               _loc6_++;
            }
         }
         if(name == "width" || name == "height")
         {
            if(_loc5_ is String && _loc5_.indexOf("%") >= 0)
            {
               _loc3_ = name == "width" ? "percentWidth" : "percentHeight";
               _loc5_ = _loc5_.slice(0,_loc5_.indexOf("%"));
            }
            else
            {
               _loc3_ = name;
            }
         }
         setPropertyValue(_loc2_,_loc3_,_loc5_,oldValue);
      }
      
      public function initialize() : void
      {
      }
      
      private function setPropertyValue(param1:Object, param2:String, param3:*, param4:Object) : void
      {
         if(param4 is Number)
         {
            param1[param2] = Number(param3);
         }
         else if(param4 is Boolean)
         {
            param1[param2] = toBoolean(param3);
         }
         else
         {
            param1[param2] = param3;
         }
      }
   }
}
