package nz.co.codec.flexorm.metamodel
{
   public class CompositeKey implements Key
   {
       
      
      private var _property:String;
      
      public var associatedEntity:nz.co.codec.flexorm.metamodel.Entity;
      
      public function CompositeKey(param1:Object = null)
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
      
      public function get property() : String
      {
         return this._property;
      }
      
      public function set property(param1:String) : void
      {
         this._property = param1;
      }
   }
}
