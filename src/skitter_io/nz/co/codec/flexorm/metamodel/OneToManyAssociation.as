package nz.co.codec.flexorm.metamodel
{
   import nz.co.codec.flexorm.command.SelectCommand;
   
   public class OneToManyAssociation extends ListAssociation
   {
       
      
      public var selectCommand:SelectCommand;
      
      public function OneToManyAssociation(param1:Object = null)
      {
         super(param1);
      }
   }
}
