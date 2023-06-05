package nz.co.codec.flexorm.metamodel
{
   public class PrimaryKey implements Key
   {
       
      
      public var type:String;
      
      private var _property:String;
      
      public var column:String;
      
      public var strategy:String;
      
      public function PrimaryKey(param1:Object = null)
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
      
      public function set property(param1:String) : void
      {
         this._property = param1;
      }
      
      public function get property() : String
      {
         return this._property;
      }
   }
}
