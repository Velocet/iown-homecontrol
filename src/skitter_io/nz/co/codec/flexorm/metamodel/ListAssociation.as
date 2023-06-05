package nz.co.codec.flexorm.metamodel
{
   import nz.co.codec.flexorm.command.DeleteCommand;
   import nz.co.codec.flexorm.command.UpdateCommand;
   
   public class ListAssociation extends Association implements IListAssociation
   {
       
      
      public var deleteCommand:DeleteCommand;
      
      public var indexProperty:String;
      
      public var indexColumn:String;
      
      public var indexed:Boolean = false;
      
      public var updateFKAfterDeleteCommand:UpdateCommand;
      
      public var lazy:Boolean = false;
      
      public var multiTyped:Boolean;
      
      private var _associatedTypes:Array;
      
      public function ListAssociation(param1:Object = null)
      {
         this._associatedTypes = [];
         super(param1);
      }
      
      public function set associatedTypes(param1:Array) : void
      {
         this._associatedTypes = param1;
      }
      
      public function get associatedTypes() : Array
      {
         return this._associatedTypes;
      }
      
      public function getAssociatedEntity(param1:Entity) : Entity
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return null;
         }
         for each(_loc2_ in this._associatedTypes)
         {
            if(_loc2_.associatedEntity.equals(param1))
            {
               return param1;
            }
         }
         return this.getAssociatedEntity(param1.superEntity);
      }
   }
}
