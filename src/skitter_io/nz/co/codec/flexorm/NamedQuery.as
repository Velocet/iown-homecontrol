package nz.co.codec.flexorm
{
   import nz.co.codec.flexorm.criteria.IFilter;
   
   public class NamedQuery implements IFilter
   {
       
      
      public var executionParameters:Array;
      
      public var name:String;
      
      public var clause:String;
      
      public function NamedQuery(param1:String, param2:String)
      {
         super();
         this.name = param1;
         this.clause = param2;
      }
   }
}
