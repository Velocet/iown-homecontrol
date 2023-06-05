package nz.co.codec.flexorm.metamodel
{
   public class Identity
   {
       
      
      public var path:Array;
      
      public var strategy:String;
      
      public var property:String;
      
      public var fkProperty:String;
      
      public var fkColumn:String;
      
      public var column:String;
      
      public function Identity(param1:Object = null)
      {
         var _loc2_:String = null;
         super();
         for(_loc2_ in param1)
         {
            if(hasOwnProperty(_loc2_))
            {
               this[_loc2_] = param1[_loc2_];
            }
         }
      }
      
      public function getValue(param1:Object) : *
      {
         if(param1 == null)
         {
            return 0;
         }
         if(this.path.length == 0)
         {
            return param1[this.property];
         }
         return this.getVal(param1,this.path.concat());
      }
      
      public function getRootEntity() : Entity
      {
         var _loc2_:CompositeKey = null;
         var _loc1_:int = int(this.path.length);
         if(_loc1_ > 1)
         {
            _loc2_ = this.path[_loc1_ - 2] as CompositeKey;
            return _loc2_.associatedEntity;
         }
         return null;
      }
      
      private function getVal(param1:Object, param2:Array) : *
      {
         var _loc4_:Object = null;
         var _loc3_:Key = param2.shift() as Key;
         if(param2.length > 0)
         {
            _loc4_ = param1[_loc3_.property];
            return this.getVal(_loc4_,param2);
         }
         return param1[_loc3_.property];
      }
   }
}
