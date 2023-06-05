package nz.co.codec.flexorm
{
   import nz.co.codec.flexorm.command.InsertCommand;
   import nz.co.codec.flexorm.metamodel.Entity;
   import nz.co.codec.flexorm.metamodel.ListAssociation;
   
   internal class SaveRecursiveArgs
   {
       
      
      internal var idMap:Object;
      
      internal var ownerClass:Class;
      
      internal var associatedEntity:Entity;
      
      internal var name:String;
      
      internal var mtmInsertCommand:InsertCommand;
      
      internal var hasCompositeKey:Boolean;
      
      internal var rootEval:Boolean = false;
      
      internal var a:ListAssociation;
      
      internal var fkProperty:String;
      
      internal var subInsertCommand:InsertCommand;
      
      internal var rootSpread:int;
      
      internal var rootLft:int;
      
      internal var lft:int = -1;
      
      internal var entityType:String;
      
      internal var indexValue:int;
      
      public function SaveRecursiveArgs()
      {
         super();
      }
   }
}
