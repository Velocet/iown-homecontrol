package nz.co.codec.flexorm.util
{
   import flash.utils.describeType;
   
   public class Mixin
   {
       
      
      public function Mixin()
      {
         super();
      }
      
      private static function getTypeDesc(param1:Class) : Object
      {
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc2_:XML = describeType(param1);
         var _loc3_:* = [];
         var _loc4_:* = [];
         var _loc5_:* = [];
         var _loc6_:* = [];
         for(_loc7_ in _loc2_.method)
         {
            _loc3_.push(_loc2_.method.@name[_loc7_]);
         }
         for(_loc8_ in _loc2_.variable)
         {
            _loc4_.push(_loc2_.variable.@name[_loc8_]);
         }
         for(_loc9_ in _loc2_.factory.method)
         {
            _loc5_.push(_loc2_.factory.method.@name[_loc9_]);
         }
         for(_loc10_ in _loc2_.factory.variable)
         {
            _loc6_.push(_loc2_.factory.variable.@name[_loc10_]);
         }
         return {
            "statics":{
               "methods":_loc3_,
               "properties":_loc4_
            },
            "members":{
               "methods":_loc5_,
               "properties":_loc6_
            }
         };
      }
      
      public static function mixinStatics(param1:Class, param2:Class) : void
      {
         copyMethodsAndProps(param1,param2,getTypeDesc(param2)["statics"]);
      }
      
      private static function copyMethodsAndProps(param1:Object, param2:Object, param3:Object) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         for each(_loc4_ in param3["methods"])
         {
            param1[_loc4_] = param2[_loc4_];
         }
         for each(_loc5_ in param3["properties"])
         {
            param1[_loc5_] = param2[_loc5_];
         }
      }
      
      public static function mixinMembers(param1:Class, param2:Class) : void
      {
         copyMethodsAndProps(param1.prototype,new param2(),getTypeDesc(param2)["members"]);
         copyPrototype(param1,param2);
      }
      
      private static function copyPrototype(param1:Class, param2:Class) : void
      {
         var _loc3_:String = null;
         for(_loc3_ in param2.prototype)
         {
            param1.prototype[_loc3_] = param2.prototype[_loc3_];
         }
      }
      
      public static function extendClass(param1:Class, param2:Class) : void
      {
         var _loc3_:Object = getTypeDesc(param2);
         copyMethodsAndProps(param1,param2,_loc3_["statics"]);
         copyMethodsAndProps(param1.prototype,new param2(),_loc3_["members"]);
         copyPrototype(param1,param2);
      }
   }
}
