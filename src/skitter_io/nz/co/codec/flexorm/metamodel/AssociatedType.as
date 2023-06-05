package nz.co.codec.flexorm.metamodel
{
   import nz.co.codec.flexorm.command.SelectCommand;
   
   public class AssociatedType
   {
       
      
      public var associatedEntity:nz.co.codec.flexorm.metamodel.Entity;
      
      public var selectCommand:SelectCommand;
      
      public function AssociatedType()
      {
         super();
      }
   }
}
