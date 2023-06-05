package nz.co.codec.flexorm
{
   import flash.data.SQLConnection;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.command.CreateAsynCommand;
   import nz.co.codec.flexorm.command.CreateIndexCommand;
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
   import nz.co.codec.flexorm.criteria.SQLCondition;
   import nz.co.codec.flexorm.criteria.Sort;
   import nz.co.codec.flexorm.metamodel.AssociatedType;
   import nz.co.codec.flexorm.metamodel.Association;
   import nz.co.codec.flexorm.metamodel.CompositeKey;
   import nz.co.codec.flexorm.metamodel.Entity;
   import nz.co.codec.flexorm.metamodel.Field;
   import nz.co.codec.flexorm.metamodel.IDStrategy;
   import nz.co.codec.flexorm.metamodel.IHierarchicalObject;
   import nz.co.codec.flexorm.metamodel.Identity;
   import nz.co.codec.flexorm.metamodel.Key;
   import nz.co.codec.flexorm.metamodel.ManyToManyAssociation;
   import nz.co.codec.flexorm.metamodel.OneToManyAssociation;
   import nz.co.codec.flexorm.metamodel.PrimaryKey;
   import nz.co.codec.flexorm.util.Inflector;
   import nz.co.codec.flexorm.util.StringUtils;
   
   public class EntityIntrospector
   {
       
      
      private var _debugLevel:int;
      
      private var missingKey:Boolean;
      
      private var _prefs:Object;
      
      private var _schema:String;
      
      private var _sqlConnection:SQLConnection;
      
      private var metaTableCreated:Boolean;
      
      private var deferred:Array;
      
      private var _entityMap:Object;
      
      private var awaitingKeyResolution:Array;
      
      public function EntityIntrospector(param1:String, param2:SQLConnection, param3:Object, param4:int, param5:Object = null)
      {
         super();
         this._schema = param1;
         this._sqlConnection = param2;
         this._entityMap = param3;
         this._debugLevel = param4;
         this._prefs = param5;
         this.deferred = [];
         this.awaitingKeyResolution = [];
         this.metaTableCreated = false;
      }
      
      private function createTables(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = [];
         for each(_loc3_ in param1)
         {
            for each(_loc5_ in _loc3_.manyToManyAssociations)
            {
               _loc2_.push(_loc5_.createSynCommand);
            }
            _loc3_.createSynCommand.execute();
         }
         for each(_loc4_ in _loc2_)
         {
            _loc4_.execute();
         }
         for each(_loc3_ in param1)
         {
            for each(_loc6_ in _loc3_.indexCommands)
            {
               _loc6_.execute();
            }
         }
         if(Boolean(this._prefs.syncSupport) && !this.metaTableCreated)
         {
            this.createMetaTable();
         }
      }
      
      private function extractOneToManyAssociation(param1:Object, param2:Entity, param3:String, param4:String) : void
      {
         var metadata:XMLList = null;
         var typeVal:String = null;
         var fkColumn:String = null;
         var cascadeType:String = null;
         var lazy:Boolean = false;
         var inverse:Boolean = false;
         var constrain:Boolean = false;
         var indexed:Boolean = false;
         var indexColumn:String = null;
         var indexProperty:String = null;
         var fkProperty:String = null;
         var types:Array = null;
         var associatedTypes:Array = null;
         var a:OneToManyAssociation = null;
         var t:String = null;
         var type:Class = null;
         var cn:String = null;
         var associatedEntity:Entity = null;
         var associatedType:AssociatedType = null;
         var v:Object = param1;
         var entity:Entity = param2;
         var property:String = param3;
         var c_n:String = param4;
         metadata = v.metadata.(@name == Tags.ELEM_ONE_TO_MANY);
         typeVal = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_TYPE).@value.toString());
         if(typeVal == null || typeVal.length == 0)
         {
            throw new Error("Attribute \'type\' must be set on the [OneToMany] annotation. ");
         }
         fkColumn = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_FK_COLUMN).@value.toString());
         cascadeType = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_CASCADE).@value.toString());
         lazy = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_LAZY).@value.toString(),false);
         inverse = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_INVERSE).@value.toString(),false);
         constrain = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_CONSTRAIN).@value.toString(),true);
         indexed = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_INDEXED).@value.toString(),false);
         indexColumn = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_INDEX_COLUMN).@value.toString());
         indexProperty = null;
         if(fkColumn == null || fkColumn.length == 0)
         {
            fkColumn = entity.fkColumn;
            fkProperty = entity.fkProperty;
         }
         else
         {
            fkProperty = StringUtils.camelCase(fkColumn);
         }
         if(indexed && (indexColumn == null || indexColumn.length == 0))
         {
            indexColumn = c_n + "_idx";
         }
         else
         {
            indexColumn = null;
         }
         if(indexColumn)
         {
            indexProperty = StringUtils.camelCase(indexColumn);
         }
         types = typeVal.split(/\d*\,\d*/);
         associatedTypes = [];
         a = new OneToManyAssociation({
            "property":property,
            "multiTyped":types.length > 1,
            "associatedTypes":associatedTypes,
            "cascadeType":cascadeType,
            "lazy":lazy,
            "inverse":inverse,
            "constrain":constrain,
            "fkColumn":fkColumn,
            "fkProperty":fkProperty,
            "indexed":indexed,
            "indexColumn":indexColumn,
            "indexProperty":indexProperty
         });
         entity.addOneToManyAssociation(a);
         for each(t in types)
         {
            type = this.getClass(t);
            cn = this.getClassName(type);
            associatedEntity = this._entityMap[cn];
            if(associatedEntity == null)
            {
               associatedEntity = this.getEntity(type,cn);
               this.deferred.push(type);
            }
            if(new associatedEntity.cls() is IHierarchicalObject)
            {
               a.hierarchical = true;
               a.indexed = false;
               a.indexColumn = "lft";
               a.indexProperty = "lft";
            }
            associatedType = new AssociatedType();
            associatedType.associatedEntity = associatedEntity;
            associatedTypes.push(associatedType);
            associatedEntity.addOneToManyInverseAssociation(a);
            associatedEntity.addDependency(entity);
         }
      }
      
      private function loadMetadataForClass(param1:Class) : Entity
      {
         var xml:XML = null;
         var table:String = null;
         var tableSingular:String = null;
         var meta:XMLList = null;
         var q:Object = null;
         var qname:String = null;
         var i:int = 0;
         var pkg:String = null;
         var defaultKey:PrimaryKey = null;
         var variables:XMLList = null;
         var v:Object = null;
         var declaredBy:String = null;
         var type:Class = null;
         var typeQName:String = null;
         var typePkg:String = null;
         var property:String = null;
         var column:String = null;
         var strategy:String = null;
         var cls:Class = param1;
         var cn:String = this.getClassName(cls);
         var c_n:String = StringUtils.underscore(cn).toLowerCase();
         var entity:Entity = this.getEntity(cls,cn,c_n);
         xml = describeType(new cls());
         table = StringUtil.trim(xml.metadata.(@name == Tags.ELEM_TABLE).arg.(@key == Tags.ATTR_NAME).@value);
         if(table == null || table.length == 0)
         {
            if(this.usingCamelCaseNames())
            {
               tableSingular = cn;
               table = cn;
            }
            else
            {
               tableSingular = c_n;
               table = Inflector.pluralize(c_n);
            }
         }
         else
         {
            tableSingular = Inflector.singularize(table);
         }
         entity.table = table;
         entity.tableSingular = tableSingular;
         meta = xml.metadata;
         for each(q in meta)
         {
            if(q.(@name == Tags.ELEM_QUERY).length() > 0)
            {
               this.extractNamedQuery(q,entity);
            }
         }
         if(new cls() is IHierarchicalObject)
         {
            entity.hierarchical = true;
         }
         qname = getQualifiedClassName(cls);
         i = qname.indexOf("::");
         pkg = i > 0 ? qname.substring(0,i) : null;
         this.extractSuperType(pkg,xml,entity);
         this.missingKey = true;
         defaultKey = null;
         variables = xml.accessor;
         for each(v in variables)
         {
            declaredBy = v.@declaredBy.toString();
            if(declaredBy.search(new RegExp(entity.className,"i")) != -1)
            {
               type = this.getClass(v.@type);
               typeQName = getQualifiedClassName(type);
               i = typeQName.lastIndexOf(":");
               typePkg = i > 0 ? typeQName.substring(0,i - 1) : null;
               property = v.@name.toString();
               if(v.metadata.(@name == Tags.ELEM_COLUMN).length() > 0)
               {
                  column = this.extractColumn(v,entity,property);
               }
               else if(v.metadata.(@name == Tags.ELEM_MANY_TO_ONE).length() > 0)
               {
                  this.extractManyToOneAssociation(v,entity,property);
               }
               else if(v.metadata.(@name == Tags.ELEM_ONE_TO_MANY).length() > 0)
               {
                  this.extractOneToManyAssociation(v,entity,property,c_n);
               }
               else if(v.metadata.(@name == Tags.ELEM_MANY_TO_MANY).length() > 0)
               {
                  this.extractManyToManyAssociation(v,entity,property,c_n);
               }
               else if(v.metadata.(@name == Tags.ELEM_TRANSIENT).length() <= 0)
               {
                  if(typePkg == pkg)
                  {
                     this.extractInferredManyToOneAssociation(entity,type,property);
                  }
                  else if(type is IList && this.isEntity(property))
                  {
                     this.extractInferredOneToManyAssociation(entity,type,property);
                  }
                  else
                  {
                     column = this.usingCamelCaseNames() ? property : StringUtils.underscore(property).toLowerCase();
                     entity.addField(new Field({
                        "property":property,
                        "column":column,
                        "type":this.getSQLType(v.@type)
                     }));
                     if(defaultKey == null && StringUtils.endsWith(property.toLowerCase(),"id"))
                     {
                        defaultKey = new PrimaryKey({
                           "column":column,
                           "property":property,
                           "strategy":this.getIDStrategy(v.@type),
                           "type":this.getSQLType(v.@type)
                        });
                     }
                  }
               }
               if(this.missingKey && v.metadata.(@name == Tags.ELEM_ID).length() > 0)
               {
                  strategy = StringUtil.trim(v.metadata.(@name == Tags.ELEM_ID).arg.(@key == Tags.ATTR_ID_STRATEGY).@value.toString());
                  if(strategy == null || strategy.length == 0)
                  {
                     strategy = this.getIDStrategy(v.@type);
                  }
                  else if(strategy != IDStrategy.ASSIGNED && strategy != this.getIDStrategy(v.@type))
                  {
                     throw new Error("The data type \'" + v.@type + "\' of the ID for " + entity.name + " is not compatible with the \'" + strategy + "\' strategy. ");
                  }
                  entity.addKey(new PrimaryKey({
                     "column":column,
                     "property":property,
                     "strategy":strategy,
                     "type":this.getSQLType(v.@type)
                  }));
                  this.missingKey = false;
               }
            }
         }
         if(this.missingKey)
         {
            if(defaultKey == null)
            {
               if(!entity.superEntity)
               {
                  throw new Error("No ID specified for " + entity.name + ". ");
               }
               this.awaitingKeyResolution.push(entity);
            }
            else
            {
               entity.addKey(defaultKey);
            }
         }
         entity.initialisationComplete = true;
         return entity;
      }
      
      private function usingCamelCaseNames() : Boolean
      {
         return NamingStrategy.CAMEL_CASE_NAMES == this._prefs.namingStrategy;
      }
      
      private function extractManyToManyAssociation(param1:Object, param2:Entity, param3:String, param4:String) : void
      {
         var metadata:XMLList = null;
         var type:Class = null;
         var cascadeType:String = null;
         var lazy:Boolean = false;
         var constrain:Boolean = false;
         var indexed:Boolean = false;
         var indexColumn:String = null;
         var indexProperty:String = null;
         var cn:String = null;
         var associationTable:String = null;
         var associatedEntity:Entity = null;
         var a:ManyToManyAssociation = null;
         var v:Object = param1;
         var entity:Entity = param2;
         var property:String = param3;
         var c_n:String = param4;
         metadata = v.metadata.(@name == Tags.ELEM_MANY_TO_MANY);
         type = this.getClass(metadata.arg.(@key == Tags.ATTR_TYPE).@value);
         cascadeType = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_CASCADE).@value.toString());
         lazy = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_LAZY).@value.toString(),false);
         constrain = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_CONSTRAIN).@value.toString(),true);
         indexed = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_INDEXED).@value.toString(),false);
         indexColumn = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_INDEX_COLUMN).@value.toString());
         indexProperty = null;
         cn = this.getClassName(type);
         associationTable = c_n + "_" + Inflector.pluralize(StringUtils.underscore(cn).toLowerCase());
         if(indexed && (indexColumn == null || indexColumn.length == 0))
         {
            indexColumn = c_n + "_idx";
         }
         else
         {
            indexColumn = null;
         }
         if(indexColumn)
         {
            indexProperty = StringUtils.camelCase(indexColumn);
         }
         associatedEntity = this._entityMap[cn];
         if(associatedEntity == null)
         {
            associatedEntity = this.getEntity(type,cn);
            this.deferred.push(type);
         }
         a = new ManyToManyAssociation({
            "property":property,
            "associationTable":associationTable,
            "associatedEntity":associatedEntity,
            "cascadeType":cascadeType,
            "lazy":lazy,
            "constrain":constrain,
            "indexed":indexed,
            "indexColumn":indexColumn,
            "indexProperty":indexProperty
         });
         associatedEntity.addManyToManyInverseAssociation(a);
         entity.addManyToManyAssociation(a);
         associatedEntity.addDependency(entity);
      }
      
      private function getIDStrategy(param1:String) : String
      {
         switch(param1)
         {
            case "String":
               return IDStrategy.UID;
            default:
               return IDStrategy.AUTO_INCREMENT;
         }
      }
      
      private function buildSQL(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            this.buildSQLCommands(_loc2_);
         }
      }
      
      private function createMetaTableAsyn(param1:IExecutor) : void
      {
         var _loc2_:CreateAsynCommand = new CreateAsynCommand(this._sqlConnection,this._schema,"sync_status",this._debugLevel);
         _loc2_.addColumn("entity",SQLType.STRING);
         _loc2_.addColumn("last_sync_at",SQLType.DATE);
         param1.add(_loc2_);
         this.metaTableCreated = true;
      }
      
      private function getEntityForObject(param1:Class, param2:String, param3:String) : Entity
      {
         var _loc5_:String = null;
         var _loc6_:* = null;
         var _loc4_:Entity;
         if((_loc4_ = this._entityMap[param3]) == null)
         {
            (_loc4_ = new Entity()).cls = param1;
            _loc4_.className = this.getClassName(param1);
            _loc4_.root = param2;
            _loc4_.table = param3;
            _loc4_.name = param3;
            this._entityMap[param3] = _loc4_;
            _loc5_ = Inflector.singularize(StringUtils.camelCase(param3));
            _loc6_ = StringUtils.startLowerCase(_loc5_) + "Id";
            _loc4_.fkProperty = _loc6_;
            if(this.usingCamelCaseNames())
            {
               _loc4_.fkColumn = _loc6_;
            }
            else
            {
               _loc5_ = Inflector.singularize(StringUtils.underscore(param3).toLowerCase());
               _loc4_.fkColumn = _loc5_ + "_id";
            }
            _loc4_.tableSingular = _loc5_;
         }
         return _loc4_;
      }
      
      public function set sqlConnection(param1:SQLConnection) : void
      {
         this._sqlConnection = param1;
      }
      
      private function getClassNameLower(param1:Class) : String
      {
         var _loc2_:String = this.getClassName(param1);
         return _loc2_.substr(0,1).toLowerCase() + _loc2_.substr(1);
      }
      
      private function buildSelectHierarchyCommand(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.buildSelectCommands();
         }
      }
      
      private function extractInferredOneToManyAssociation(param1:Entity, param2:Class, param3:String) : void
      {
         var _loc4_:String = this.getClassName(param2);
         var _loc5_:Entity;
         if((_loc5_ = this._entityMap[_loc4_]) == null)
         {
            _loc5_ = this.getEntity(param2,_loc4_);
            this.deferred.push(param2);
         }
         var _loc6_:OneToManyAssociation = new OneToManyAssociation({
            "property":param3,
            "associatedEntity":_loc5_,
            "fkColumn":param1.fkColumn,
            "fkProperty":param1.fkProperty
         });
         _loc5_.addOneToManyInverseAssociation(_loc6_);
         param1.addOneToManyAssociation(_loc6_);
         _loc5_.addDependency(param1);
      }
      
      private function buildSQLCommands(param1:Entity) : void
      {
         var _loc19_:* = null;
         var _loc20_:CreateIndexCommand = null;
         var _loc21_:* = null;
         var _loc23_:String = null;
         var _loc24_:* = null;
         var _loc25_:Entity = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:DeleteCommand = null;
         var _loc29_:UpdateCommand = null;
         var _loc30_:Entity = null;
         var _loc31_:String = null;
         var _loc32_:String = null;
         var _loc33_:CreateIndexCommand = null;
         var _loc34_:CreateIndexCommand = null;
         var _loc2_:String = param1.table;
         var _loc3_:SelectCommand = param1.selectCommand;
         if(_loc3_ == null)
         {
            _loc3_ = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
            param1.selectCommand = _loc3_;
         }
         var _loc4_:SelectCommand = null;
         if(param1.superEntity)
         {
            _loc4_ = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
            for each(_loc21_ in param1.identities)
            {
               _loc4_.addJoin(param1.superEntity.table,_loc21_.column,_loc21_.column);
            }
            param1.selectSubtypeCommand = _loc4_;
         }
         var _loc5_:SelectCommand = null;
         if(param1.hierarchical)
         {
            _loc5_ = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
            if(param1.isSuperEntity())
            {
               param1.selectNestedSetTypesCommand = new SelectNestedSetTypesCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
            }
         }
         var _loc6_:SelectCommand = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
         var _loc7_:InsertCommand = new InsertCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
         var _loc8_:UpdateCommand = new UpdateCommand(this._sqlConnection,this._schema,_loc2_,this._prefs.syncSupport,this._debugLevel);
         var _loc9_:DeleteCommand = new DeleteCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
         var _loc10_:CreateSynCommand = new CreateSynCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
         var _loc11_:CreateAsynCommand = new CreateAsynCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
         var _loc12_:UpdateCommand = new UpdateCommand(this._sqlConnection,this._schema,_loc2_,false,this._debugLevel);
         var _loc13_:SelectCommand = null;
         var _loc14_:UpdateCommand = null;
         var _loc15_:SelectCommand = null;
         var _loc16_:SelectCommand = null;
         var _loc17_:* = [];
         var _loc18_:String = StringUtils.underscore(param1.tableSingular).toLowerCase();
         var _loc22_:PrimaryKey = param1.pk;
         if(param1.hasCompositeKey())
         {
            _loc19_ = _loc18_ + "_key_idx";
            _loc20_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel);
            _loc16_ = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
            for each(_loc21_ in param1.identities)
            {
               _loc16_.addColumn(_loc21_.column);
               _loc20_.addIndex(_loc21_.column);
            }
            _loc16_.addColumn("version");
            _loc17_.push(_loc20_);
         }
         else
         {
            _loc3_.addColumn(_loc22_.column,param1.fkProperty);
            (_loc15_ = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel)).addColumn(_loc22_.column);
            _loc15_.addColumn("server_id");
            _loc15_.addColumn("version");
            _loc23_ = _loc22_.type;
            if(param1.superEntity)
            {
               _loc7_.addColumn(_loc22_.column,param1.fkProperty);
               _loc10_.addColumn(_loc22_.column,_loc23_);
               _loc11_.addColumn(_loc22_.column,_loc23_);
            }
            else
            {
               _loc10_.setPrimaryKey(_loc22_.column,_loc22_.strategy,_loc22_.type);
               _loc11_.setPrimaryKey(_loc22_.column,_loc22_.strategy);
               if(IDStrategy.UID == _loc22_.strategy || IDStrategy.ASSIGNED == _loc22_.strategy)
               {
                  _loc7_.addColumn(_loc22_.column,param1.fkProperty);
               }
            }
            _loc19_ = _loc18_ + "_" + _loc22_.column + "_idx";
            (_loc20_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel)).addIndex(_loc22_.column);
            _loc17_.push(_loc20_);
         }
         if(this._prefs.syncSupport)
         {
            (_loc13_ = new SelectCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel)).addSQLCondition("updated_at>:lastSyncDate");
            _loc14_ = new UpdateCommand(this._sqlConnection,this._schema,_loc2_,this._prefs.syncSupport,this._debugLevel);
            _loc7_.addColumn("version","version");
            _loc14_.addColumn("version","version");
            _loc10_.addColumn("version",SQLType.INTEGER);
            _loc11_.addColumn("version",SQLType.INTEGER);
            if(!param1.hasCompositeKey())
            {
               _loc23_ = this.getSQLTypeForID(_loc22_.strategy);
               _loc7_.addColumn("server_id","serverId");
               _loc10_.addColumn("server_id",_loc23_);
               _loc11_.addColumn("server_id",_loc23_);
            }
         }
         for each(_loc21_ in param1.identities)
         {
            _loc3_.addFilter(_loc21_.column,_loc21_.fkProperty);
            _loc8_.addFilter(_loc21_.column,_loc21_.fkProperty);
            _loc9_.addFilter(_loc21_.column,_loc21_.fkProperty);
            _loc12_.addFilter(_loc21_.column,_loc21_.fkProperty);
            if(this._prefs.syncSupport)
            {
               _loc14_.addFilter(_loc21_.column,_loc21_.fkProperty);
            }
         }
         for each(_loc24_ in param1.fields)
         {
            if(param1.hasCompositeKey() || _loc22_.property != _loc24_.property)
            {
               _loc3_.addColumn(_loc24_.column,_loc24_.property);
               _loc7_.addColumn(_loc24_.column,_loc24_.property);
               _loc8_.addColumn(_loc24_.column,_loc24_.property);
               _loc10_.addColumn(_loc24_.column,_loc24_.type);
               _loc11_.addColumn(_loc24_.column,_loc24_.type);
            }
         }
         if(Boolean(this._prefs.syncSupport) || Boolean(this._prefs.auditable))
         {
            _loc7_.addColumn("created_at","createdAt");
            _loc7_.addColumn("updated_at","updatedAt");
            _loc8_.addColumn("updated_at","updatedAt");
            _loc10_.addColumn("created_at",SQLType.DATE);
            _loc10_.addColumn("updated_at",SQLType.DATE);
            _loc11_.addColumn("created_at",SQLType.DATE);
            _loc11_.addColumn("updated_at",SQLType.DATE);
         }
         if(Boolean(this._prefs.syncSupport) || Boolean(this._prefs.markForDeletion))
         {
            _loc7_.addColumn("marked_for_deletion","markedForDeletion");
            _loc10_.addColumn("marked_for_deletion",SQLType.BOOLEAN);
            _loc11_.addColumn("marked_for_deletion",SQLType.BOOLEAN);
            _loc6_.addSQLCondition("marked_for_deletion<>true");
            _loc12_.addColumn("marked_for_deletion","markedForDeletion");
            _loc12_.setParam("markedForDeletion",true);
         }
         if(param1.isSuperEntity() || param1.className == "Device")
         {
            _loc3_.addColumn("entity_type","entityType");
            _loc7_.addColumn("entity_type","entityType");
            _loc10_.addColumn("entity_type",SQLType.STRING);
            _loc11_.addColumn("entity_type",SQLType.STRING);
         }
         for each(_loc26_ in param1.manyToOneAssociations)
         {
            _loc25_ = _loc26_.associatedEntity;
            _loc19_ = _loc18_ + "_" + _loc25_.tableSingular + "_idx";
            _loc20_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel);
            if(_loc25_.hasCompositeKey())
            {
               for each(_loc21_ in _loc25_.identities)
               {
                  _loc23_ = this.getSQLTypeForID(_loc21_.strategy);
                  _loc3_.addColumn(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc7_.addColumn(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc8_.addColumn(_loc21_.fkColumn,_loc21_.fkProperty);
                  if(_loc26_.constrain)
                  {
                     _loc10_.addForeignKey(_loc21_.fkColumn,_loc23_,_loc25_.table,_loc21_.column);
                     _loc11_.addForeignKey(_loc21_.fkColumn,_loc23_,_loc25_.table,_loc21_.column);
                  }
                  else
                  {
                     _loc10_.addColumn(_loc21_.fkColumn,_loc23_);
                     _loc11_.addColumn(_loc21_.fkColumn,_loc23_);
                  }
                  _loc20_.addIndex(_loc21_.fkColumn);
               }
            }
            else
            {
               _loc23_ = this.getSQLTypeForID(_loc25_.pk.strategy);
               _loc3_.addColumn(_loc26_.fkColumn,_loc26_.fkProperty);
               _loc7_.addColumn(_loc26_.fkColumn,_loc26_.fkProperty);
               _loc8_.addColumn(_loc26_.fkColumn,_loc26_.fkProperty);
               if(_loc26_.constrain)
               {
                  _loc10_.addForeignKey(_loc26_.fkColumn,_loc23_,_loc25_.table,_loc25_.pk.column);
                  _loc11_.addForeignKey(_loc26_.fkColumn,_loc23_,_loc25_.table,_loc25_.pk.column);
               }
               else
               {
                  _loc10_.addColumn(_loc26_.fkColumn,_loc23_);
                  _loc11_.addColumn(_loc26_.fkColumn,_loc23_);
               }
               _loc20_.addIndex(_loc26_.fkColumn);
            }
            _loc17_.push(_loc20_);
         }
         for each(_loc27_ in param1.oneToManyInverseAssociations)
         {
            _loc28_ = new DeleteCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
            _loc29_ = new UpdateCommand(this._sqlConnection,this._schema,_loc2_,this._prefs.syncSupport,this._debugLevel);
            if((_loc30_ = _loc27_.ownerEntity).hasCompositeKey())
            {
               _loc19_ = _loc18_ + "_" + _loc30_.tableSingular + "_idx";
               _loc20_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel);
               for each(_loc21_ in _loc30_.identities)
               {
                  _loc3_.addColumn(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc7_.addColumn(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc8_.addColumn(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc23_ = this.getSQLTypeForID(_loc21_.strategy);
                  if(_loc27_.constrain)
                  {
                     _loc10_.addForeignKey(_loc21_.fkColumn,_loc23_,_loc30_.table,_loc21_.column);
                     _loc11_.addForeignKey(_loc21_.fkColumn,_loc23_,_loc30_.table,_loc21_.column);
                  }
                  else
                  {
                     _loc10_.addColumn(_loc21_.fkColumn,_loc23_);
                     _loc11_.addColumn(_loc21_.fkColumn,_loc23_);
                  }
                  _loc28_.addFilter(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc29_.addFilter(_loc21_.fkColumn,_loc21_.fkProperty);
                  _loc29_.addColumn(_loc21_.fkColumn,"zero");
                  if(IDStrategy.UID == _loc21_.strategy)
                  {
                     _loc29_.setParam("zero",null);
                  }
                  else
                  {
                     _loc29_.setParam("zero",0);
                  }
                  _loc20_.addIndex(_loc21_.fkColumn);
               }
               _loc17_.push(_loc20_);
            }
            else
            {
               _loc3_.addColumn(_loc27_.fkColumn,_loc27_.fkProperty);
               _loc7_.addColumn(_loc27_.fkColumn,_loc27_.fkProperty);
               _loc8_.addColumn(_loc27_.fkColumn,_loc27_.fkProperty);
               _loc31_ = _loc30_.table;
               _loc32_ = _loc30_.pk.column;
               _loc23_ = this.getSQLTypeForID(_loc30_.pk.strategy);
               if(_loc27_.constrain)
               {
                  _loc10_.addForeignKey(_loc27_.fkColumn,_loc23_,_loc31_,_loc32_);
                  _loc11_.addForeignKey(_loc27_.fkColumn,_loc23_,_loc31_,_loc32_);
               }
               else
               {
                  _loc10_.addColumn(_loc27_.fkColumn,_loc23_);
                  _loc11_.addColumn(_loc27_.fkColumn,_loc23_);
               }
               _loc28_.addFilter(_loc27_.fkColumn,_loc27_.fkProperty);
               _loc29_.addFilter(_loc27_.fkColumn,_loc27_.fkProperty);
               _loc29_.addColumn(_loc27_.fkColumn,"zero");
               if(IDStrategy.UID == _loc30_.pk.strategy)
               {
                  _loc29_.setParam("zero",null);
               }
               else
               {
                  _loc29_.setParam("zero",0);
               }
               _loc19_ = _loc18_ + "_" + _loc27_.fkColumn + "_idx";
               (_loc20_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel)).addIndex(_loc27_.fkColumn);
               _loc17_.push(_loc20_);
            }
            _loc27_.deleteCommand = _loc28_;
            _loc27_.updateFKAfterDeleteCommand = _loc29_;
            if(_loc27_.indexed)
            {
               _loc7_.addColumn(_loc27_.indexColumn,_loc27_.indexProperty);
               _loc8_.addColumn(_loc27_.indexColumn,_loc27_.indexProperty);
               _loc10_.addColumn(_loc27_.indexColumn,SQLType.INTEGER);
               _loc11_.addColumn(_loc27_.indexColumn,SQLType.INTEGER);
               _loc19_ = _loc18_ + "_" + _loc27_.indexColumn;
               (_loc33_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel)).addIndex(_loc27_.indexColumn);
               _loc17_.push(_loc33_);
            }
            if(_loc27_.hierarchical)
            {
               _loc3_.addColumn("lft","lft");
               _loc3_.addColumn("rgt","rgt");
               _loc7_.addColumn("lft","lft");
               _loc7_.addColumn("rgt","rgt");
               _loc8_.addColumn("lft","lft");
               _loc8_.addColumn("rgt","rgt");
               _loc10_.addColumn("lft",SQLType.INTEGER);
               _loc10_.addColumn("rgt",SQLType.INTEGER);
               _loc11_.addColumn("lft",SQLType.INTEGER);
               _loc11_.addColumn("rgt",SQLType.INTEGER);
               _loc19_ = _loc18_ + "_lft";
               (_loc34_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc2_,_loc19_,this._debugLevel)).addIndex("lft");
               _loc17_.push(_loc34_);
               param1.updateLeftBoundaryCommand = new UpdateNestedSetsLeftBoundaryCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
               param1.updateRightBoundaryCommand = new UpdateNestedSetsRightBoundaryCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
               param1.updateNestedSetsCommand = new UpdateNestedSetsCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
               param1.selectMaxRgtCommand = new SelectMaxRgtCommand(this._sqlConnection,this._schema,_loc2_,this._debugLevel);
               _loc5_.addFilterObject(new SQLCondition(_loc2_,"lft>:lft"));
               _loc5_.addFilterObject(new SQLCondition(_loc2_,"rgt<:rgt"));
               _loc5_.addSort("lft",Sort.ASC,_loc2_);
            }
         }
         if(param1.hierarchical)
         {
            _loc5_.mergeColumns(_loc3_.columns);
         }
         _loc6_.mergeColumns(_loc3_.columns);
         if(param1.superEntity)
         {
            _loc4_.mergeColumns(_loc3_.columns);
         }
         this.buildOneToManySQLCommands(param1);
         this.buildManyToManySQLCommands(param1,_loc19_,_loc17_,_loc20_);
         param1.selectAllCommand = _loc6_;
         param1.selectNestedSetsCommand = _loc5_;
         param1.insertCommand = _loc7_;
         param1.updateCommand = _loc8_;
         param1.deleteCommand = _loc9_;
         param1.createSynCommand = _loc10_;
         param1.createAsynCommand = _loc11_;
         param1.selectKeysCommand = _loc16_;
         param1.markForDeletionCommand = _loc12_;
         param1.selectServerKeyMapCommand = _loc15_;
         param1.selectUpdatedCommand = _loc13_;
         param1.updateVersionCommand = _loc14_;
         param1.indexCommands = _loc17_;
      }
      
      private function isEntity(param1:String) : Boolean
      {
         var _loc3_:String = null;
         var _loc2_:String = Inflector.singularize(param1);
         for(_loc3_ in this._entityMap)
         {
            if(_loc3_ == _loc2_)
            {
               return true;
            }
         }
         return false;
      }
      
      private function buildManyToManySQLCommands(param1:Entity, param2:String, param3:Array, param4:CreateIndexCommand) : void
      {
         var _loc5_:* = null;
         var _loc6_:String = null;
         var _loc7_:Entity = null;
         var _loc8_:SelectCommand = null;
         var _loc9_:SelectCommand = null;
         var _loc10_:InsertCommand = null;
         var _loc11_:DeleteCommand = null;
         var _loc12_:CreateSynCommand = null;
         var _loc13_:CreateAsynCommand = null;
         var _loc14_:UpdateCommand = null;
         var _loc15_:* = null;
         var _loc16_:String = null;
         var _loc17_:CreateIndexCommand = null;
         for each(_loc5_ in param1.manyToManyAssociations)
         {
            _loc6_ = String(_loc5_.associationTable);
            _loc7_ = _loc5_.associatedEntity;
            _loc8_ = new SelectCommand(this._sqlConnection,this._schema,_loc7_.table,this._debugLevel);
            if(_loc7_.selectCommand)
            {
               _loc8_.columns = _loc7_.selectCommand.columns;
            }
            else
            {
               _loc7_.selectCommand = new SelectCommand(this._sqlConnection,this._schema,_loc7_.table,this._debugLevel);
               _loc7_.selectCommand.columns = _loc8_.columns;
            }
            _loc9_ = new SelectCommand(this._sqlConnection,this._schema,_loc6_,this._debugLevel);
            _loc10_ = new InsertCommand(this._sqlConnection,this._schema,_loc6_,this._debugLevel);
            _loc11_ = new DeleteCommand(this._sqlConnection,this._schema,_loc6_,this._debugLevel);
            _loc12_ = new CreateSynCommand(this._sqlConnection,this._schema,_loc6_,this._debugLevel);
            _loc13_ = new CreateAsynCommand(this._sqlConnection,this._schema,_loc6_,this._debugLevel);
            _loc14_ = null;
            if(_loc5_.indexed)
            {
               _loc8_.addSort(_loc5_.indexColumn,Sort.ASC,_loc6_);
               _loc10_.addColumn(_loc5_.indexColumn,_loc5_.indexProperty);
               _loc12_.addColumn(_loc5_.indexColumn,SQLType.INTEGER);
               _loc13_.addColumn(_loc5_.indexColumn,SQLType.INTEGER);
               (_loc14_ = new UpdateCommand(this._sqlConnection,this._schema,_loc6_,this._prefs.syncSupport,this._debugLevel)).addColumn(_loc5_.indexColumn,_loc5_.indexProperty);
               param2 = Inflector.singularize(_loc6_) + "_" + _loc5_.indexColumn;
               (_loc17_ = new CreateIndexCommand(this._sqlConnection,this._schema,_loc6_,param2,this._debugLevel)).addIndex(_loc5_.indexColumn);
               param3.push(_loc17_);
            }
            param2 = Inflector.singularize(_loc6_) + "_key_idx";
            param4 = new CreateIndexCommand(this._sqlConnection,this._schema,_loc6_,param2,this._debugLevel);
            for each(_loc15_ in _loc7_.identities)
            {
               _loc8_.addJoin(_loc6_,_loc15_.column,_loc15_.fkColumn);
               _loc10_.addColumn(_loc15_.fkColumn,_loc15_.fkProperty);
               _loc11_.addFilter(_loc15_.fkColumn,_loc15_.fkProperty);
               _loc9_.addColumn(_loc15_.fkColumn,_loc15_.fkProperty);
               _loc16_ = this.getSQLTypeForID(_loc15_.strategy);
               if(_loc5_.constrain)
               {
                  _loc12_.addForeignKey(_loc15_.fkColumn,_loc16_,_loc7_.table,_loc15_.column);
                  _loc13_.addForeignKey(_loc15_.fkColumn,_loc16_,_loc7_.table,_loc15_.column);
               }
               else
               {
                  _loc12_.addColumn(_loc15_.fkColumn,_loc16_);
                  _loc13_.addColumn(_loc15_.fkColumn,_loc16_);
               }
               if(_loc5_.indexed)
               {
                  _loc14_.addFilter(_loc15_.fkColumn,_loc15_.fkProperty);
               }
               param4.addIndex(_loc15_.fkColumn);
            }
            for each(_loc15_ in param1.identities)
            {
               _loc8_.addFilter(_loc15_.fkColumn,_loc15_.fkProperty,_loc6_);
               _loc10_.addColumn(_loc15_.fkColumn,_loc15_.fkProperty);
               _loc11_.addFilter(_loc15_.fkColumn,_loc15_.fkProperty);
               _loc9_.addFilter(_loc15_.fkColumn,_loc15_.fkProperty);
               _loc16_ = this.getSQLTypeForID(_loc15_.strategy);
               if(_loc5_.constrain)
               {
                  _loc12_.addForeignKey(_loc15_.fkColumn,_loc16_,param1.table,_loc15_.column);
                  _loc13_.addForeignKey(_loc15_.fkColumn,_loc16_,param1.table,_loc15_.column);
               }
               else
               {
                  _loc12_.addColumn(_loc15_.fkColumn,_loc16_);
                  _loc13_.addColumn(_loc15_.fkColumn,_loc16_);
               }
               if(_loc5_.indexed)
               {
                  _loc14_.addFilter(_loc15_.fkColumn,_loc15_.fkProperty);
               }
               param4.addIndex(_loc15_.fkColumn);
            }
            param3.push(param4);
            _loc5_.selectCommand = _loc8_;
            _loc5_.selectManyToManyKeysCommand = _loc9_;
            _loc5_.insertCommand = _loc10_;
            _loc5_.updateCommand = _loc14_;
            _loc5_.deleteCommand = _loc11_;
            _loc5_.createSynCommand = _loc12_;
            _loc5_.createAsynCommand = _loc13_;
         }
      }
      
      private function createMetaTable() : void
      {
         var _loc1_:CreateSynCommand = new CreateSynCommand(this._sqlConnection,this._schema,"sync_status",this._debugLevel);
         _loc1_.addColumn("entity",SQLType.STRING);
         _loc1_.addColumn("last_sync_at",SQLType.DATE);
         _loc1_.execute();
         this.metaTableCreated = true;
      }
      
      public function loadMetadata(param1:Class, param2:IExecutor = null) : Entity
      {
         var _loc5_:Entity = null;
         this.deferred.length = 0;
         var _loc3_:Entity = this.loadMetadataForClass(param1);
         var _loc4_:*;
         (_loc4_ = []).push(_loc3_);
         while(this.deferred.length > 0)
         {
            _loc4_.push(this.loadMetadataForClass(this.deferred.pop() as Class));
         }
         while(this.awaitingKeyResolution.length > 0)
         {
            _loc5_ = this.awaitingKeyResolution.pop() as Entity;
            _loc5_.keys = _loc5_.superEntity.keys;
         }
         this.populateIdentities(_loc4_);
         this.buildSQL(_loc4_);
         this.buildSelectHierarchyCommand(_loc4_);
         if(param2)
         {
            this.createTablesAsyn(this.sequenceEntitiesForTableCreation(_loc4_),param2);
         }
         else
         {
            this.createTables(this.sequenceEntitiesForTableCreation(_loc4_));
         }
         return _loc3_;
      }
      
      private function extractManyToOneAssociation(param1:Object, param2:Entity, param3:String) : void
      {
         var metadata:XMLList = null;
         var fkColumn:String = null;
         var cascadeType:String = null;
         var inverse:Boolean = false;
         var constrain:Boolean = false;
         var type:Class = null;
         var cn:String = null;
         var associatedEntity:Entity = null;
         var fkProperty:String = null;
         var associationIsHierarchical:Boolean = false;
         var v:Object = param1;
         var entity:Entity = param2;
         var property:String = param3;
         metadata = v.metadata.(@name == Tags.ELEM_MANY_TO_ONE);
         fkColumn = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_NAME).@value.toString());
         cascadeType = StringUtil.trim(metadata.arg.(@key == Tags.ATTR_CASCADE).@value.toString());
         inverse = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_INVERSE).@value.toString(),false);
         constrain = StringUtils.parseBoolean(metadata.arg.(@key == Tags.ATTR_CONSTRAIN).@value.toString(),true);
         type = this.getClass(v.@type);
         cn = this.getClassName(type);
         associatedEntity = this._entityMap[cn];
         if(associatedEntity == null)
         {
            associatedEntity = this.getEntity(type,cn);
            this.deferred.push(type);
         }
         if(fkColumn == null || fkColumn.length == 0)
         {
            fkColumn = associatedEntity.fkColumn;
            fkProperty = associatedEntity.fkProperty;
         }
         else
         {
            fkProperty = StringUtils.camelCase(fkColumn);
         }
         if(v.metadata.(@name == Tags.ELEM_ID).length() > 0)
         {
            entity.addKey(new CompositeKey({
               "property":property,
               "associatedEntity":associatedEntity
            }));
            cascadeType = "null";
            this.missingKey = false;
         }
         associationIsHierarchical = false;
         if(new associatedEntity.cls() is IHierarchicalObject)
         {
            entity.parentProperty = property;
            associationIsHierarchical = true;
         }
         entity.addManyToOneAssociation(new Association({
            "property":property,
            "fkColumn":fkColumn,
            "fkProperty":fkProperty,
            "associatedEntity":associatedEntity,
            "cascadeType":cascadeType,
            "inverse":inverse,
            "constrain":constrain,
            "hierarchical":associationIsHierarchical
         }));
         entity.addDependency(associatedEntity);
      }
      
      private function extractColumn(param1:Object, param2:Entity, param3:String) : String
      {
         var column:String = null;
         var v:Object = param1;
         var entity:Entity = param2;
         var property:String = param3;
         column = StringUtil.trim(v.metadata.(@name == Tags.ELEM_COLUMN).arg.(@key == Tags.ATTR_NAME).@value.toString());
         if(column == null || column.length == 0)
         {
            column = this.usingCamelCaseNames() ? property : StringUtils.underscore(property).toLowerCase();
         }
         entity.addField(new Field({
            "property":property,
            "column":column,
            "type":this.getSQLType(v.@type)
         }));
         return column;
      }
      
      private function loadMetadataForObject(param1:Object, param2:String, param3:String) : Entity
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Entity = null;
         var _loc10_:Object = null;
         var _loc11_:Class = null;
         var _loc12_:String = null;
         var _loc13_:* = null;
         var _loc14_:Class = null;
         var _loc15_:String = null;
         var _loc16_:* = null;
         var _loc17_:AssociatedType = null;
         var _loc18_:OneToManyAssociation = null;
         var _loc19_:Object = null;
         var _loc4_:Class = Class(getDefinitionByName(getQualifiedClassName(param1)));
         var _loc5_:Entity = this.getEntityForObject(_loc4_,param3,param2);
         for(_loc6_ in param1)
         {
            _loc8_ = this.usingCamelCaseNames() ? _loc6_ : StringUtils.underscore(_loc6_);
            if(_loc10_ = param1[_loc6_])
            {
               _loc11_ = Class(getDefinitionByName(getQualifiedClassName(_loc10_)));
               _loc12_ = this.getClassName(_loc11_);
               if("Object" == _loc12_)
               {
                  _loc9_ = this.loadMetadataForObject(_loc10_,_loc6_,param3);
                  _loc5_.addManyToOneAssociation(new Association({
                     "property":_loc6_,
                     "associatedEntity":_loc9_,
                     "fkColumn":_loc9_.fkColumn,
                     "fkProperty":_loc9_.fkProperty
                  }));
               }
               else if((_loc10_ is Array || _loc10_ is ArrayCollection) && _loc10_.length > 0)
               {
                  for each(_loc13_ in _loc10_)
                  {
                     if(_loc13_)
                     {
                        break;
                     }
                  }
                  _loc14_ = Class(getDefinitionByName(getQualifiedClassName(_loc13_)));
                  _loc15_ = this.getClassName(_loc14_);
                  if("Object" == _loc15_)
                  {
                     if((_loc9_ = this._entityMap[_loc6_]) == null)
                     {
                        _loc9_ = this.getEntityForObject(_loc14_,param3,_loc6_);
                        this.deferred.push({
                           "type":_loc13_,
                           "name":_loc6_
                        });
                     }
                  }
                  else if((_loc9_ = this._entityMap[_loc15_]) == null)
                  {
                     _loc9_ = this.getEntity(_loc14_,_loc15_);
                     this.deferred.push({"type":_loc14_});
                  }
                  _loc16_ = [];
                  (_loc17_ = new AssociatedType()).associatedEntity = _loc9_;
                  _loc16_.push(_loc17_);
                  _loc18_ = new OneToManyAssociation({
                     "property":_loc6_,
                     "associatedTypes":_loc16_,
                     "fkColumn":_loc5_.fkColumn,
                     "fkProperty":_loc5_.fkProperty
                  });
                  _loc9_.addOneToManyInverseAssociation(_loc18_);
                  _loc5_.addOneToManyAssociation(_loc18_);
               }
               else
               {
                  _loc5_.addField(new Field({
                     "property":_loc6_,
                     "column":_loc8_,
                     "type":this.getSQLType(_loc12_)
                  }));
               }
            }
         }
         _loc7_ = "__id";
         param1[_loc7_] = 0;
         _loc5_.addKey(new PrimaryKey({
            "property":_loc7_,
            "column":_loc5_.fkColumn,
            "strategy":IDStrategy.AUTO_INCREMENT
         }));
         _loc5_.identities = this.getIdentities(_loc5_);
         this.buildSQLCommands(_loc5_);
         _loc5_.createSynCommand.execute();
         _loc5_.initialisationComplete = true;
         while(this.deferred.length > 0)
         {
            if((_loc19_ = this.deferred.pop()).name)
            {
               this.loadMetadataForObject(_loc19_.type,_loc19_.name,param3);
            }
            else
            {
               this.loadMetadataForClass(_loc19_.type);
            }
         }
         return _loc5_;
      }
      
      private function getClass(param1:String) : Class
      {
         return getDefinitionByName(param1) as Class;
      }
      
      private function sequenceEntitiesForTableCreation(param1:Array) : Array
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc2_:Array = [].concat(param1);
         for each(_loc3_ in param1)
         {
            _loc4_ = _loc2_.indexOf(_loc3_);
            _loc5_ = 0;
            for each(_loc6_ in _loc3_.dependencies)
            {
               _loc5_ = (_loc7_ = _loc2_.indexOf(_loc6_) + 1) > _loc5_ ? _loc7_ : _loc5_;
            }
            if(_loc5_ != _loc4_)
            {
               _loc2_.splice(_loc5_,0,_loc3_);
               if(_loc5_ < _loc4_)
               {
                  _loc2_.splice(_loc4_ + 1,1);
               }
               else
               {
                  _loc2_.splice(_loc4_,1);
               }
            }
         }
         return _loc2_;
      }
      
      private function getIdentities(param1:Entity, param2:Array = null) : Array
      {
         var _loc4_:* = null;
         var _loc5_:PrimaryKey = null;
         if(param2 == null)
         {
            param2 = [];
         }
         var _loc3_:* = [];
         for each(_loc4_ in param1.keys)
         {
            if(_loc4_ is CompositeKey)
            {
               _loc3_ = _loc3_.concat(this.getIdentities(CompositeKey(_loc4_).associatedEntity,param2.concat(_loc4_)));
            }
            else
            {
               _loc5_ = PrimaryKey(_loc4_);
               if(param2.length == 0)
               {
                  _loc3_.push(new Identity({
                     "property":_loc5_.property,
                     "column":_loc5_.column,
                     "fkProperty":param1.fkProperty,
                     "fkColumn":param1.fkColumn,
                     "strategy":_loc5_.strategy,
                     "path":[]
                  }));
               }
               else
               {
                  _loc3_.push(new Identity({
                     "property":param1.fkProperty,
                     "column":param1.fkColumn,
                     "fkProperty":param1.fkProperty,
                     "fkColumn":param1.fkColumn,
                     "strategy":_loc5_.strategy,
                     "path":param2.concat(_loc4_)
                  }));
               }
            }
         }
         return _loc3_;
      }
      
      private function extractSuperType(param1:String, param2:XML, param3:Entity) : void
      {
         var superType:String = null;
         var i:int = 0;
         var superPkg:String = null;
         var inheritsFrom:String = null;
         var cls:Class = null;
         var cn:String = null;
         var superEntity:Entity = null;
         var pkg:String = param1;
         var xml:XML = param2;
         var entity:Entity = param3;
         superType = xml.extendsClass[0].@type.toString();
         i = superType.indexOf("::");
         superPkg = i > 0 ? superType.substring(0,i) : null;
         inheritsFrom = StringUtil.trim(xml.metadata.(@name == Tags.ELEM_TABLE).arg.(@key == Tags.ATTR_INHERITS_FROM).@value.toString());
         if(Boolean(inheritsFrom) && inheritsFrom.length > 0)
         {
            i = inheritsFrom.indexOf("::");
            if(i == -1)
            {
               i = inheritsFrom.lastIndexOf(".");
               if(i > 0)
               {
                  inheritsFrom = inheritsFrom.substring(0,i) + "::" + inheritsFrom.substring(i + 1);
               }
            }
         }
         if(pkg == superPkg && superType != "Object" || superType == inheritsFrom)
         {
            cls = this.getClass(superType);
            cn = this.getClassName(cls);
            superEntity = this._entityMap[cn];
            if(superEntity == null)
            {
               superEntity = this.getEntity(cls,cn);
               this.deferred.push(cls);
            }
            superEntity.addSubEntity(entity);
            entity.addDependency(superEntity);
         }
      }
      
      private function extractInferredManyToOneAssociation(param1:Entity, param2:Class, param3:String) : void
      {
         var _loc4_:String = this.getClassName(param2);
         var _loc5_:Entity;
         if((_loc5_ = this._entityMap[_loc4_]) == null)
         {
            _loc5_ = this.getEntity(param2,_loc4_);
            this.deferred.push(param2);
         }
         var _loc6_:Boolean = false;
         if(new _loc5_.cls() is IHierarchicalObject)
         {
            param1.parentProperty = param3;
            _loc6_ = true;
         }
         param1.addManyToOneAssociation(new Association({
            "property":param3,
            "fkColumn":_loc5_.fkColumn,
            "fkProperty":_loc5_.fkProperty,
            "associatedEntity":_loc5_,
            "hierarchical":_loc6_
         }));
         param1.addDependency(_loc5_);
      }
      
      public function set prefs(param1:Object) : void
      {
         this._prefs = param1;
      }
      
      private function getSQLTypeForID(param1:String) : String
      {
         switch(param1)
         {
            case IDStrategy.UID:
               return SQLType.STRING;
            default:
               return SQLType.INTEGER;
         }
      }
      
      private function buildOneToManySQLCommands(param1:Entity) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Entity = null;
         var _loc5_:SelectCommand = null;
         var _loc6_:* = null;
         for each(_loc2_ in param1.oneToManyAssociations)
         {
            for each(_loc3_ in _loc2_.associatedTypes)
            {
               _loc4_ = _loc3_.associatedEntity;
               _loc5_ = new SelectCommand(this._sqlConnection,this._schema,_loc4_.table,this._debugLevel);
               if(_loc4_.selectCommand)
               {
                  _loc5_.columns = _loc4_.selectCommand.columns;
               }
               else
               {
                  _loc4_.selectCommand = new SelectCommand(this._sqlConnection,this._schema,_loc4_.table,this._debugLevel);
                  _loc4_.selectCommand.columns = _loc5_.columns;
               }
               _loc5_.addSort(_loc2_.indexColumn);
               if(param1.hasCompositeKey())
               {
                  for each(_loc6_ in param1.identities)
                  {
                     _loc5_.addFilter(_loc6_.fkColumn,_loc6_.fkProperty);
                  }
               }
               else
               {
                  _loc5_.addFilter(_loc2_.fkColumn,_loc2_.fkProperty);
               }
               _loc3_.selectCommand = _loc5_;
            }
         }
      }
      
      private function populateIdentities(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            _loc2_.identities = this.getIdentities(_loc2_);
         }
      }
      
      private function createTablesAsyn(param1:Array, param2:IExecutor) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = [];
         for each(_loc4_ in param1)
         {
            for each(_loc6_ in _loc4_.manyToManyAssociations)
            {
               _loc3_.push(_loc6_.createAsynCommand);
            }
            param2.add(_loc4_.createAsynCommand);
         }
         for each(_loc5_ in _loc3_)
         {
            param2.add(_loc5_);
         }
         if(Boolean(this._prefs.syncSupport) && !this.metaTableCreated)
         {
            this.createMetaTableAsyn(param2);
         }
      }
      
      public function set debugLevel(param1:int) : void
      {
         this._debugLevel = param1;
      }
      
      public function loadMetadataForDynamicObject(param1:Object, param2:String) : Entity
      {
         this.deferred.length = 0;
         return this.loadMetadataForObject(param1,param2,param2);
      }
      
      private function getClassName(param1:Class) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_.substring(_loc2_.lastIndexOf(":") + 1);
      }
      
      private function extractNamedQuery(param1:Object, param2:Entity) : void
      {
         var queryName:String = null;
         var queryClause:String = null;
         var namedQuery:NamedQuery = null;
         var v:Object = param1;
         var entity:Entity = param2;
         queryName = StringUtil.trim(v.(@name == Tags.ELEM_QUERY).arg.(@key == Tags.ATTR_QUERY_NAME).@value.toString());
         queryClause = StringUtil.trim(v.(@name == Tags.ELEM_QUERY).arg.(@key == Tags.ATTR_QUERY_CLAUSE).@value.toString());
         namedQuery = new NamedQuery(queryName,queryClause);
         entity.queries.push(namedQuery);
      }
      
      private function getEntity(param1:Class, param2:String = null, param3:String = null) : Entity
      {
         var _loc5_:* = null;
         if(param2 == null)
         {
            param2 = this.getClassName(param1);
         }
         var _loc4_:Entity;
         if(_loc4_ = this._entityMap[param2])
         {
            if(_loc4_.initialisationComplete)
            {
               return _loc4_;
            }
         }
         else
         {
            (_loc4_ = new Entity()).cls = param1;
            _loc4_.className = param2;
            _loc4_.name = param2;
            this._entityMap[param2] = _loc4_;
            _loc5_ = StringUtils.startLowerCase(param2) + "Id";
            if(this.usingCamelCaseNames())
            {
               _loc4_.fkColumn = _loc5_;
            }
            else
            {
               if(param3 == null)
               {
                  param3 = StringUtils.underscore(param2).toLowerCase();
               }
               _loc4_.fkColumn = param3 + "_id";
            }
            _loc4_.fkProperty = _loc5_;
         }
         return _loc4_;
      }
      
      private function getSQLType(param1:String) : String
      {
         switch(param1)
         {
            case true || true:
               return SQLType.INTEGER;
            case "Number":
               return SQLType.REAL;
            case "Date":
               return SQLType.DATE;
            case "Boolean":
               return SQLType.BOOLEAN;
            default:
               return SQLType.TEXT;
         }
      }
      
      public function set entityMap(param1:Object) : void
      {
         this._entityMap = param1;
      }
      
      private function getEntityFromType(param1:String) : Entity
      {
         return this.getEntity(this.getClass(param1));
      }
   }
}
