package nz.co.codec.flexorm.metamodel
{
   import mx.core.IUID;
   import nz.co.codec.flexorm.command.CreateAsynCommand;
   import nz.co.codec.flexorm.command.CreateSynCommand;
   import nz.co.codec.flexorm.command.DeleteCommand;
   import nz.co.codec.flexorm.command.InsertCommand;
   import nz.co.codec.flexorm.command.SelectCommand;
   import nz.co.codec.flexorm.command.SelectMaxRgtCommand;
   import nz.co.codec.flexorm.command.SelectNestedSetTypesCommand;
   import nz.co.codec.flexorm.command.UpdateCommand;
   import nz.co.codec.flexorm.command.UpdateNestedSetsCommand;
   import nz.co.codec.flexorm.command.UpdateNestedSetsLeftBoundaryCommand;
   import nz.co.codec.flexorm.command.UpdateNestedSetsRightBoundaryCommand;
   
   public class Entity implements IUID
   {
       
      
      private var _tableSingular:String;
      
      private var _dependencies:Array;
      
      private var _updateRightBoundaryCommand:UpdateNestedSetsRightBoundaryCommand;
      
      public var selectKeysCommand:SelectCommand;
      
      public var deleteCommand:DeleteCommand;
      
      private var _queries:Array;
      
      public var selectUpdatedCommand:SelectCommand;
      
      private var _updateNestedSetsCommand:UpdateNestedSetsCommand;
      
      public var superEntity:nz.co.codec.flexorm.metamodel.Entity;
      
      public var markForDeletionCommand:UpdateCommand;
      
      public var updateCommand:UpdateCommand;
      
      public var insertCommand:InsertCommand;
      
      private var _fkProperty:String;
      
      private var _subEntities:Array;
      
      private var _cls:Class;
      
      private var _name:String;
      
      public var updateVersionCommand:UpdateCommand;
      
      public var createSynCommand:CreateSynCommand;
      
      public var selectNestedSetTypesCommand:SelectNestedSetTypesCommand;
      
      public var selectAllCommand:SelectCommand;
      
      public var hierarchical:Boolean;
      
      private var _manyToManyAssociations:Array;
      
      public var selectSubtypeCommand:SelectCommand;
      
      public var indexCommands:Array;
      
      private var _selectMaxRgtCommand:SelectMaxRgtCommand;
      
      private var _oneToManyInverseAssociations:Array;
      
      public var selectNestedSetsCommand:SelectCommand;
      
      private var _className:String;
      
      public var selectCommand:SelectCommand;
      
      private var _updateLeftBoundaryCommand:UpdateNestedSetsLeftBoundaryCommand;
      
      private var _oneToManyAssociations:Array;
      
      private var _isSuperEntity:Boolean;
      
      private var selectCommandBuildIncomplete:Boolean;
      
      private var _parentProperty:String;
      
      private var _initialisationComplete:Boolean;
      
      private var _root:String;
      
      private var _table:String;
      
      private var _keys:Array;
      
      private var _fields:Array;
      
      private var _fkColumn:String;
      
      public var identities:Array;
      
      public var createAsynCommand:CreateAsynCommand;
      
      private var _manyToManyInverseAssociations:Array;
      
      public var selectServerKeyMapCommand:SelectCommand;
      
      private var _manyToOneAssociations:Array;
      
      public function Entity()
      {
         super();
         this._isSuperEntity = false;
         this._keys = [];
         this._subEntities = [];
         this._fields = [];
         this._manyToOneAssociations = [];
         this._oneToManyAssociations = [];
         this._oneToManyInverseAssociations = [];
         this._manyToManyAssociations = [];
         this._manyToManyInverseAssociations = [];
         this._dependencies = [];
         this._initialisationComplete = false;
         this._queries = [];
         this.selectCommandBuildIncomplete = true;
      }
      
      public function get keys() : Array
      {
         return this._keys;
      }
      
      public function set tableSingular(param1:String) : void
      {
         this._tableSingular = param1;
      }
      
      public function addManyToManyInverseAssociation(param1:ManyToManyAssociation) : void
      {
         param1.ownerEntity = this;
         this._manyToManyInverseAssociations.push(param1);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function hasCompositeKey() : Boolean
      {
         return Boolean(this._keys) && this._keys.length > 1 ? true : false;
      }
      
      public function get tableSingular() : String
      {
         return this._tableSingular;
      }
      
      public function addOneToManyAssociation(param1:OneToManyAssociation) : void
      {
         param1.ownerEntity = this;
         this._oneToManyAssociations.push(param1);
      }
      
      public function get className() : String
      {
         return this._className;
      }
      
      public function get pk() : PrimaryKey
      {
         if(Boolean(this._keys) && this._keys.length == 1)
         {
            return PrimaryKey(this._keys[0]);
         }
         return null;
      }
      
      public function get dependencies() : Array
      {
         return this._dependencies;
      }
      
      public function addKey(param1:Key) : void
      {
         this._keys.push(param1);
      }
      
      public function get subEntities() : Array
      {
         return this._subEntities;
      }
      
      public function get updateLeftBoundaryCommand() : UpdateNestedSetsLeftBoundaryCommand
      {
         if(!this._updateLeftBoundaryCommand && Boolean(this.superEntity))
         {
            return this.superEntity.updateLeftBoundaryCommand;
         }
         return this._updateLeftBoundaryCommand;
      }
      
      public function get manyToOneAssociations() : Array
      {
         return this._manyToOneAssociations;
      }
      
      public function get cls() : Class
      {
         return this._cls;
      }
      
      public function set parentProperty(param1:String) : void
      {
         this._parentProperty = param1;
      }
      
      public function set className(param1:String) : void
      {
         this._className = param1;
      }
      
      public function set initialisationComplete(param1:Boolean) : void
      {
         if(this._className == null || this._name == null || this._table == null)
         {
            throw new Error("Entity not initialised. ");
         }
         this._initialisationComplete = param1;
      }
      
      public function getColumn(param1:String) : Object
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.fields)
         {
            if(_loc2_.property == param1)
            {
               return {
                  "table":this.table,
                  "column":_loc2_.column
               };
            }
         }
         if(this.superEntity)
         {
            return this.superEntity.getColumn(param1);
         }
         return null;
      }
      
      public function get uid() : String
      {
         return this._name;
      }
      
      public function set subEntities(param1:Array) : void
      {
         this._subEntities = param1;
      }
      
      public function get selectMaxRgtCommand() : SelectMaxRgtCommand
      {
         if(!this._selectMaxRgtCommand && Boolean(this.superEntity))
         {
            return this.superEntity.selectMaxRgtCommand;
         }
         return this._selectMaxRgtCommand;
      }
      
      public function addManyToOneAssociation(param1:Association) : void
      {
         param1.ownerEntity = this;
         this._manyToOneAssociations.push(param1);
      }
      
      public function set cls(param1:Class) : void
      {
         this._cls = param1;
      }
      
      public function set dependencies(param1:Array) : void
      {
         this._dependencies = param1;
      }
      
      public function isDynamicObject() : Boolean
      {
         return "Object" == this._className;
      }
      
      public function set updateLeftBoundaryCommand(param1:UpdateNestedSetsLeftBoundaryCommand) : void
      {
         this._updateLeftBoundaryCommand = param1;
      }
      
      public function get queries() : Array
      {
         return this._queries;
      }
      
      public function get updateRightBoundaryCommand() : UpdateNestedSetsRightBoundaryCommand
      {
         if(!this._updateRightBoundaryCommand && Boolean(this.superEntity))
         {
            return this.superEntity.updateRightBoundaryCommand;
         }
         return this._updateRightBoundaryCommand;
      }
      
      public function addOneToManyInverseAssociation(param1:OneToManyAssociation) : void
      {
         this._oneToManyInverseAssociations.push(param1);
      }
      
      public function set fields(param1:Array) : void
      {
         this._fields = param1;
      }
      
      public function set oneToManyAssociations(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.ownerEntity = this;
         }
         this._oneToManyAssociations = param1;
      }
      
      public function set fkProperty(param1:String) : void
      {
         this._fkProperty = param1;
      }
      
      public function get fkColumn() : String
      {
         return this._fkColumn;
      }
      
      public function set oneToManyInverseAssociations(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.ownerEntity = this;
         }
         this._oneToManyInverseAssociations = param1;
      }
      
      public function get manyToManyAssociations() : Array
      {
         return this._manyToManyAssociations;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get updateNestedSetsCommand() : UpdateNestedSetsCommand
      {
         if(!this._updateNestedSetsCommand && Boolean(this.superEntity))
         {
            return this.superEntity.updateNestedSetsCommand;
         }
         return this._updateNestedSetsCommand;
      }
      
      public function get parentProperty() : String
      {
         if(!this._parentProperty && Boolean(this.superEntity))
         {
            return this.superEntity.parentProperty;
         }
         return this._parentProperty;
      }
      
      public function get initialisationComplete() : Boolean
      {
         return this._initialisationComplete;
      }
      
      public function addSubEntity(param1:nz.co.codec.flexorm.metamodel.Entity) : void
      {
         this._subEntities.push(param1);
         param1.superEntity = this;
         this._isSuperEntity = true;
      }
      
      public function set table(param1:String) : void
      {
         this._table = param1;
      }
      
      public function set selectMaxRgtCommand(param1:SelectMaxRgtCommand) : void
      {
         this._selectMaxRgtCommand = param1;
      }
      
      public function get fkProperty() : String
      {
         return this._fkProperty;
      }
      
      public function isSuperEntity() : Boolean
      {
         return this._isSuperEntity;
      }
      
      public function get fields() : Array
      {
         return this._fields;
      }
      
      public function set uid(param1:String) : void
      {
      }
      
      public function equals(param1:*) : Boolean
      {
         if(param1 && param1 is nz.co.codec.flexorm.metamodel.Entity && Boolean(param1.name))
         {
            if(param1.name == this._name)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get oneToManyInverseAssociations() : Array
      {
         return this._oneToManyInverseAssociations;
      }
      
      public function get oneToManyAssociations() : Array
      {
         return this._oneToManyAssociations;
      }
      
      public function set root(param1:String) : void
      {
         this._root = param1;
      }
      
      public function addDependency(param1:nz.co.codec.flexorm.metamodel.Entity) : void
      {
         this._dependencies.push(param1);
      }
      
      public function get table() : String
      {
         return this._table;
      }
      
      public function set manyToManyInverseAssociations(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.ownerEntity = this;
         }
         this._manyToManyInverseAssociations = param1;
      }
      
      public function addField(param1:Field) : void
      {
         this._fields.push(param1);
      }
      
      public function set updateRightBoundaryCommand(param1:UpdateNestedSetsRightBoundaryCommand) : void
      {
         this._updateRightBoundaryCommand = param1;
      }
      
      public function set manyToManyAssociations(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.ownerEntity = this;
         }
         this._manyToManyAssociations = param1;
      }
      
      public function buildSelectCommands() : void
      {
         var _loc1_:* = null;
         if(Boolean(this.superEntity) && this.selectCommandBuildIncomplete)
         {
            this.superEntity.buildSelectCommands();
            this.selectCommand.mergeColumns(this.superEntity.selectCommand.columns);
            this.selectSubtypeCommand.mergeColumns(this.superEntity.selectCommand.columns);
            this.selectAllCommand.mergeColumns(this.superEntity.selectAllCommand.columns);
            if(this.selectNestedSetsCommand)
            {
               this.selectNestedSetsCommand.mergeColumns(this.superEntity.selectNestedSetsCommand.columns);
               this.selectNestedSetsCommand.mergeFilters(this.superEntity.selectNestedSetsCommand.filters);
               this.selectNestedSetsCommand.mergeSorts(this.superEntity.selectNestedSetsCommand.sorts);
            }
            if(this.hasCompositeKey())
            {
               for each(_loc1_ in this.identities)
               {
                  this.selectCommand.addJoin(this.superEntity.table,_loc1_.column,_loc1_.column);
                  this.selectSubtypeCommand.addJoin(this.superEntity.table,_loc1_.column,_loc1_.column);
                  this.selectAllCommand.addJoin(this.superEntity.table,_loc1_.column,_loc1_.column);
                  if(this.selectNestedSetsCommand)
                  {
                     this.selectNestedSetsCommand.addJoin(this.superEntity.table,_loc1_.column,_loc1_.column);
                  }
               }
            }
            else
            {
               this.selectCommand.addJoin(this.superEntity.table,this.pk.column,this.superEntity.pk.column);
               this.selectSubtypeCommand.addJoin(this.superEntity.table,this.pk.column,this.superEntity.pk.column);
               this.selectAllCommand.addJoin(this.superEntity.table,this.pk.column,this.superEntity.pk.column);
               if(this.selectNestedSetsCommand)
               {
                  this.selectNestedSetsCommand.addJoin(this.superEntity.table,this.pk.column,this.superEntity.pk.column);
               }
            }
            this.selectCommandBuildIncomplete = false;
         }
      }
      
      public function get root() : String
      {
         return this._root;
      }
      
      public function set queries(param1:Array) : void
      {
         this._queries = param1;
      }
      
      public function addManyToManyAssociation(param1:ManyToManyAssociation) : void
      {
         param1.ownerEntity = this;
         this._manyToManyAssociations.push(param1);
      }
      
      public function get manyToManyInverseAssociations() : Array
      {
         return this._manyToManyInverseAssociations;
      }
      
      public function set fkColumn(param1:String) : void
      {
         this._fkColumn = param1;
      }
      
      public function set keys(param1:Array) : void
      {
         this._keys = param1;
      }
      
      public function set updateNestedSetsCommand(param1:UpdateNestedSetsCommand) : void
      {
         this._updateNestedSetsCommand = param1;
      }
      
      public function set manyToOneAssociations(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.ownerEntity = this;
         }
         this._manyToOneAssociations = param1;
      }
   }
}
