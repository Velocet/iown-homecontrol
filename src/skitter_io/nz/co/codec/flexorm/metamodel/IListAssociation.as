package nz.co.codec.flexorm.metamodel
{
   public interface IListAssociation
   {
       
      
      function get associatedTypes() : Array;
      
      function get ownerEntity() : Entity;
   }
}
