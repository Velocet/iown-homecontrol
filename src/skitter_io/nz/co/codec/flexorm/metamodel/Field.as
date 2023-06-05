package nz.co.codec.flexorm.metamodel
{
   public class Field
   {
       
      
      public var property:String;
      
      public var column:String;
      
      public var type:String;
      
      public function Field(param1:Object = null)
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
   }
}
