package mx.core
{
   public class ClassFactory implements IFactory
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var properties:Object = null;
      
      public var generator:Class;
      
      public function ClassFactory(param1:Class = null)
      {
         super();
         this.generator = param1;
      }
      
      public function newInstance() : *
      {
         var _loc2_:String = null;
         var _loc1_:Object = new generator();
         if(properties != null)
         {
            for(_loc2_ in properties)
            {
               _loc1_[_loc2_] = properties[_loc2_];
            }
         }
         return _loc1_;
      }
   }
}
