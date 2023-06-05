package nz.co.codec.flexorm.metamodel
{
   import nz.co.codec.flexorm.command.CreateAsynCommand;
   import nz.co.codec.flexorm.command.CreateSynCommand;
   import nz.co.codec.flexorm.command.InsertCommand;
   import nz.co.codec.flexorm.command.SelectCommand;
   import nz.co.codec.flexorm.command.UpdateCommand;
   
   public class ManyToManyAssociation extends ListAssociation
   {
       
      
      public var updateCommand:UpdateCommand;
      
      public var createAsynCommand:CreateAsynCommand;
      
      public var selectManyToManyKeysCommand:SelectCommand;
      
      private var _associationTable:String;
      
      public var selectCommand:SelectCommand;
      
      public var insertCommand:InsertCommand;
      
      public var createSynCommand:CreateSynCommand;
      
      public function ManyToManyAssociation(param1:Object = null)
      {
         super(param1);
      }
      
      public function get associationTable() : String
      {
         return this._associationTable;
      }
      
      public function set associationTable(param1:String) : void
      {
         this._associationTable = param1;
      }
   }
}
