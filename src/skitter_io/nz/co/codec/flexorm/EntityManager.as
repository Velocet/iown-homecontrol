package nz.co.codec.flexorm
{
   import flash.data.SQLConnection;
   import flash.errors.SQLError;
   import flash.filesystem.File;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.utils.UIDUtil;
   import nz.co.codec.flexorm.command.DeleteCommand;
   import nz.co.codec.flexorm.command.InsertCommand;
   import nz.co.codec.flexorm.command.SelectCommand;
   import nz.co.codec.flexorm.command.SelectMaxRgtCommand;
   import nz.co.codec.flexorm.command.SelectNestedSetTypesCommand;
   import nz.co.codec.flexorm.command.UpdateCommand;
   import nz.co.codec.flexorm.command.UpdateNestedSetsCommand;
   import nz.co.codec.flexorm.command.UpdateNestedSetsLeftBoundaryCommand;
   import nz.co.codec.flexorm.command.UpdateNestedSetsRightBoundaryCommand;
   import nz.co.codec.flexorm.criteria.Criteria;
   import nz.co.codec.flexorm.criteria.Sort;
   import nz.co.codec.flexorm.metamodel.AssociatedType;
   import nz.co.codec.flexorm.metamodel.Association;
   import nz.co.codec.flexorm.metamodel.CompositeKey;
   import nz.co.codec.flexorm.metamodel.Entity;
   import nz.co.codec.flexorm.metamodel.Field;
   import nz.co.codec.flexorm.metamodel.IDStrategy;
   import nz.co.codec.flexorm.metamodel.IHierarchicalObject;
   import nz.co.codec.flexorm.metamodel.Identity;
   import nz.co.codec.flexorm.metamodel.ManyToManyAssociation;
   import nz.co.codec.flexorm.metamodel.OneToManyAssociation;
   import nz.co.codec.flexorm.metamodel.PersistentEntity;
   import nz.co.codec.flexorm.util.Stack;
   
   public class EntityManager extends EntityManagerBase implements IEntityManager
   {
      
      private static var localInstantiation:Boolean;
      
      private static var _instance:nz.co.codec.flexorm.EntityManager;
       
      
      private var nestedSetsLoaded:Boolean;
      
      private var inTransaction:Boolean;
      
      public function EntityManager()
      {
         super();
         if(!localInstantiation)
         {
            throw new Error("EntityManager is a singleton. Use EntityManager.instance ");
         }
      }
      
      public static function get instance() : nz.co.codec.flexorm.EntityManager
      {
         if(_instance == null)
         {
            localInstantiation = true;
            _instance = new nz.co.codec.flexorm.EntityManager();
            localInstantiation = false;
         }
         return _instance;
      }
      
      public static function getInstance() : nz.co.codec.flexorm.EntityManager
      {
         if(_instance == null)
         {
            localInstantiation = true;
            _instance = new nz.co.codec.flexorm.EntityManager();
            localInstantiation = false;
         }
         return _instance;
      }
      
      public function execNamedQuery(param1:Class, param2:String, param3:Array) : ArrayCollection
      {
         var _loc7_:* = null;
         var _loc4_:Entity;
         var _loc5_:SelectCommand = (_loc4_ = this.getEntity(param1)).selectAllCommand;
         var _loc6_:NamedQuery = null;
         for each(_loc7_ in _loc4_.queries)
         {
            if(_loc7_.name == param2)
            {
               _loc6_ = _loc7_;
               break;
            }
         }
         if(_loc6_ != null)
         {
            _loc6_.executionParameters = param3;
            _loc5_.filters.push(_loc6_);
            _loc5_.touch();
         }
         _loc5_.execute();
         var _loc8_:ArrayCollection = this.typeArray(_loc5_.result,_loc4_);
         if(_loc6_ != null)
         {
            _loc5_.filters.pop();
            _loc5_.touch();
         }
         clearCache();
         return _loc8_;
      }
      
      private function saveManyToOneAssociations(param1:Object, param2:Entity) : void
      {
         var _loc3_:* = null;
         var _loc4_:Object = null;
         var _loc5_:SaveRecursiveArgs = null;
         for each(_loc3_ in param2.manyToOneAssociations)
         {
            if((_loc4_ = param1[_loc3_.property]) && !_loc3_.inverse && isCascadeSave(_loc3_))
            {
               _loc5_ = new SaveRecursiveArgs();
               if(isDynamicObject(_loc4_))
               {
                  _loc5_.name = _loc3_.property;
               }
               this.saveItem(_loc4_,_loc5_);
            }
         }
      }
      
      public function createCriteria(param1:Class) : Criteria
      {
         return new Criteria(this.getEntity(param1));
      }
      
      public function save(param1:Object, param2:Object = null, param3:Boolean = false) : *
      {
         var args:SaveRecursiveArgs;
         var key:String = null;
         var id:* = undefined;
         var obj:Object = param1;
         var opt:Object = param2;
         var bypassTransaction:Boolean = param3;
         if(obj == null)
         {
            return 0;
         }
         args = new SaveRecursiveArgs();
         for(key in opt)
         {
            args[key] = opt[key];
         }
         this.resetMapForDynamicObjects(args.name);
         try
         {
            if(!this.inTransaction && !bypassTransaction)
            {
               this.sqlConnection.begin();
               id = this.saveItem(obj,args);
               this.sqlConnection.commit();
            }
            else
            {
               id = this.saveItem(obj,args);
            }
         }
         catch(e:SQLError)
         {
            handleSQLError(e);
         }
         return id;
      }
      
      public function saveHierarchicalObject(param1:Object, param2:Object = null) : Object
      {
         if(param1 is IHierarchicalObject)
         {
            this.save(param1,param2);
            return this.reloadObject(param1);
         }
         throw new Error("Calling saveHierarchicalObject on a non-hierarchical object. ");
      }
      
      private function removeEntity(param1:Entity, param2:Object) : void
      {
         var _loc3_:IHierarchicalObject = null;
         if(param1 == null || !this.recordExists(param1,param2))
         {
            return;
         }
         this.removeEntityRecursive(param1,param2);
         if(param2 is IHierarchicalObject)
         {
            _loc3_ = IHierarchicalObject(param2);
            this.closeGap(_loc3_.lft,_loc3_.rgt - _loc3_.lft + 1,param1);
         }
      }
      
      public function endTransaction() : void
      {
         if(this.inTransaction)
         {
            try
            {
               this.sqlConnection.commit();
               this.inTransaction = false;
            }
            catch(e:SQLError)
            {
               handleSQLError(e);
            }
         }
      }
      
      private function loadOneToManyAssociationRecursive(param1:OneToManyAssociation, param2:Object) : ArrayCollection
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:Entity = null;
         var _loc8_:SelectCommand = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:String = null;
         var _loc12_:Class = null;
         var _loc13_:Entity = null;
         var _loc14_:SelectCommand = null;
         var _loc15_:Entity = null;
         var _loc16_:* = null;
         var _loc3_:* = [];
         for each(_loc4_ in param1.associatedTypes)
         {
            _loc7_ = _loc4_.associatedEntity;
            _loc8_ = _loc4_.selectCommand;
            setIdentMapParams(_loc8_,param2);
            _loc8_.execute();
            if(_loc7_.isSuperEntity())
            {
               _loc10_ = {};
               for each(_loc9_ in _loc8_.result)
               {
                  _loc10_[_loc9_.entity_type] = null;
               }
               for(_loc11_ in _loc10_)
               {
                  _loc12_ = getDefinitionByName(_loc11_) as Class;
                  _loc14_ = (_loc13_ = this.getEntity(_loc12_)).selectSubtypeCommand.clone();
                  if((_loc15_ = param1.ownerEntity).hasCompositeKey())
                  {
                     for each(_loc16_ in _loc15_.identities)
                     {
                        _loc14_.addFilter(_loc16_.fkColumn,_loc16_.fkProperty,_loc7_.table);
                        _loc14_.setParam(_loc16_.fkProperty,param2[_loc16_.fkProperty]);
                     }
                  }
                  else
                  {
                     _loc14_.addFilter(param1.fkColumn,param1.fkProperty,_loc7_.table);
                     _loc14_.setParam(param1.fkProperty,param2[param1.fkProperty]);
                  }
                  if(param1.indexed)
                  {
                     _loc14_.addSort(param1.indexColumn,Sort.ASC,_loc7_.table);
                  }
                  _loc14_.execute();
                  for each(_loc9_ in _loc14_.result)
                  {
                     _loc3_.push({
                        "associatedEntity":_loc13_,
                        "index":_loc9_[param1.indexColumn],
                        "row":_loc9_
                     });
                  }
               }
            }
            else
            {
               for each(_loc9_ in _loc8_.result)
               {
                  _loc3_.push({
                     "associatedEntity":_loc7_,
                     "index":_loc9_[param1.indexColumn],
                     "row":_loc9_
                  });
               }
            }
         }
         if(param1.indexed)
         {
            _loc3_.sortOn("index");
         }
         var _loc5_:ArrayCollection = new ArrayCollection();
         for each(_loc6_ in _loc3_)
         {
            _loc5_.addItem(this.typeObject(_loc6_.row,_loc6_.associatedEntity));
         }
         return _loc5_;
      }
      
      private function removeOneToManyAssociations(param1:Entity, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:DeleteCommand = null;
         var _loc6_:UpdateCommand = null;
         for each(_loc3_ in param1.oneToManyAssociations)
         {
            if(isCascadeDelete(_loc3_))
            {
               if(_loc3_.multiTyped)
               {
                  for each(_loc4_ in _loc3_.associatedTypes)
                  {
                     this.removeEntityRecursive(_loc4_.associatedEntity,param2);
                  }
               }
               else
               {
                  _loc5_ = _loc3_.deleteCommand;
                  if(param1.hasCompositeKey())
                  {
                     setIdentityParams(_loc5_,param2,param1);
                  }
                  else
                  {
                     _loc5_.setParam(_loc3_.fkProperty,param2[param1.pk.property]);
                  }
                  _loc5_.execute();
               }
            }
            else
            {
               _loc6_ = _loc3_.updateFKAfterDeleteCommand;
               if(param1.hasCompositeKey())
               {
                  setIdentityParams(_loc6_,param2,param1);
               }
               else
               {
                  _loc6_.setParam(_loc3_.fkProperty,param2[param1.pk.property]);
               }
               _loc6_.execute();
               if(_loc3_.hierarchical)
               {
                  if(param2 is IHierarchicalObject)
                  {
                     this.moveBranch(IHierarchicalObject(param2));
                  }
               }
            }
         }
      }
      
      private function setNestedSetParams(param1:UpdateCommand, param2:IHierarchicalObject, param3:SaveRecursiveArgs, param4:Entity) : void
      {
         var _loc5_:int = 0;
         if(param2.lft < param3.rootLft)
         {
            _loc5_ = param2.rgt - param2.lft + 1;
            this.closeGap(param2.lft,_loc5_,param4);
            param3.lft -= _loc5_;
         }
         if(param2.lft >= param3.rootLft + param3.rootSpread)
         {
            this.closeGap(param2.lft - param3.rootSpread,param2.rgt - param2.lft + 1,param4);
         }
         this.openGap(param3.lft,2,param4);
         param1.setParam("lft",param3.lft);
         param1.setParam("rgt",param3.lft + 1);
      }
      
      public function remove(param1:Object) : void
      {
         var obj:Object = param1;
         if(obj == null)
         {
            return;
         }
         try
         {
            if(!this.inTransaction)
            {
               this.sqlConnection.begin();
               this.removeObject(obj);
               this.sqlConnection.commit();
            }
            else
            {
               this.removeObject(obj);
            }
         }
         catch(e:SQLError)
         {
            handleSQLError(e);
         }
      }
      
      private function recordExists(param1:Entity, param2:Object) : Boolean
      {
         var _loc3_:SelectCommand = param1.selectCommand;
         setIdentityParams(_loc3_,param2,param1);
         _loc3_.execute();
         var _loc4_:Array;
         if((Boolean(_loc4_ = _loc3_.result)) && _loc4_.length > 0)
         {
            return true;
         }
         trace("Attempt to remove object with no record, or that has already been removed. ");
         return false;
      }
      
      private function getEntityForDynamicObject(param1:Object, param2:String) : Entity
      {
         if(param2 == null)
         {
            throw new Error("Name must be specified for a dynamic object. ");
         }
         var _loc3_:Entity = entityMap[param2];
         if(_loc3_ == null || !_loc3_.initialisationComplete)
         {
            _loc3_ = introspector.loadMetadataForDynamicObject(param1,param2);
         }
         return _loc3_;
      }
      
      public function fetchCriteriaFirstResult(param1:Criteria) : Object
      {
         var _loc2_:ArrayCollection = this.fetchCriteria(param1);
         return _loc2_.length > 0 ? _loc2_[0] : null;
      }
      
      public function loadItem(param1:Class, param2:*) : Object
      {
         var _loc3_:Entity = this.getEntity(param1);
         if(_loc3_.hasCompositeKey())
         {
            throw new Error("Entity \'" + _loc3_.name + "\' has a composite key. " + "Use EntityManager.loadItemByCompositeKey instead. ");
         }
         var _loc4_:Object = this.loadEntityWithInheritance(_loc3_,getIdentityMap(_loc3_.fkProperty,param2));
         clearCache();
         return _loc4_;
      }
      
      private function getEntityForObject(param1:Object, param2:String = null) : Entity
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:Class = getClass(param1);
         var _loc4_:String = getClassName(_loc3_);
         if(OBJECT_TYPE == _loc4_)
         {
            return this.getEntityForDynamicObject(param1,param2);
         }
         return this.getEntity(_loc3_);
      }
      
      public function loadDynamicObject(param1:String, param2:int) : Object
      {
         var _loc3_:Entity = entityMap[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:Object = this.loadEntity(_loc3_,getIdentityMap(_loc3_.fkProperty,param2));
         clearCache();
         return _loc4_;
      }
      
      private function handleSQLError(param1:SQLError) : void
      {
         trace(param1);
         if(this.sqlConnection.inTransaction)
         {
            this.sqlConnection.rollback();
         }
         this.inTransaction = false;
      }
      
      public function startTransaction() : void
      {
         this.sqlConnection.begin();
         this.inTransaction = true;
      }
      
      public function findAll(param1:Class) : ArrayCollection
      {
         var _loc2_:Entity = this.getEntity(param1);
         var _loc3_:SelectCommand = _loc2_.selectAllCommand;
         _loc3_.execute();
         var _loc4_:ArrayCollection = this.typeArray(_loc3_.result,_loc2_);
         clearCache();
         return _loc4_;
      }
      
      public function markForDeletion(param1:Object) : void
      {
         var _loc2_:Entity = null;
         var _loc3_:UpdateCommand = null;
         if(false)
         {
            _loc2_ = this.getEntityForObject(param1);
            _loc3_ = _loc2_.markForDeletionCommand;
            setIdentityParams(_loc3_,param1,_loc2_);
            _loc3_.execute();
            return;
         }
         throw new Error("Mark for Deletion is not enabled. ");
      }
      
      private function openGap(param1:int, param2:int, param3:Entity) : void
      {
         var _loc4_:UpdateNestedSetsRightBoundaryCommand;
         (_loc4_ = param3.updateRightBoundaryCommand).setParam("rgt",param1);
         _loc4_.setParam("inc",param2);
         _loc4_.execute();
         var _loc5_:UpdateNestedSetsLeftBoundaryCommand;
         (_loc5_ = param3.updateLeftBoundaryCommand).setParam("lft",param1);
         _loc5_.setParam("inc",param2);
         _loc5_.execute();
      }
      
      private function saveItem(param1:Object, param2:SaveRecursiveArgs) : *
      {
         var _loc3_:* = undefined;
         var _loc5_:SelectCommand = null;
         var _loc6_:* = null;
         var _loc7_:Array = null;
         var _loc8_:Object = null;
         var _loc9_:SelectCommand = null;
         var _loc10_:Array = null;
         if(param1 == null)
         {
            return 0;
         }
         var _loc4_:Entity;
         if((_loc4_ = this.getEntityForObject(param1,param2.name)).hasCompositeKey())
         {
            _loc5_ = _loc4_.selectCommand;
            for each(_loc6_ in _loc4_.keys)
            {
               if((_loc8_ = param1[_loc6_.property]) == null)
               {
                  throw new Error("Object of type \'" + _loc4_.name + "\' has a null key. ");
               }
            }
            setIdentityParams(_loc5_,param1,_loc4_);
            _loc5_.execute();
            if((Boolean(_loc7_ = _loc5_.result)) && Boolean(_loc7_[0]))
            {
               this.updateItem(param1,_loc4_,param2);
            }
            else
            {
               this.createItem(param1,_loc4_,param2);
            }
         }
         else
         {
            _loc3_ = param1[_loc4_.pk.property];
            if(idAssigned(_loc3_))
            {
               if(IDStrategy.ASSIGNED == _loc4_.pk.strategy)
               {
                  _loc9_ = _loc4_.selectCommand;
                  setIdentityParams(_loc9_,param1,_loc4_);
                  _loc9_.execute();
                  if((Boolean(_loc10_ = _loc9_.result)) && Boolean(_loc10_[0]))
                  {
                     this.updateItem(param1,_loc4_,param2);
                  }
                  else
                  {
                     this.createItem(param1,_loc4_,param2);
                  }
               }
               else
               {
                  this.updateItem(param1,_loc4_,param2);
               }
            }
            else
            {
               this.createItem(param1,_loc4_,param2);
            }
         }
         if(!_loc4_.hasCompositeKey() && !idAssigned(_loc3_))
         {
            _loc3_ = param1[_loc4_.pk.property];
         }
         return _loc3_;
      }
      
      private function saveOneToManyAssociations(param1:Object, param2:Entity, param3:SaveRecursiveArgs) : void
      {
         var _loc5_:* = null;
         var _loc6_:IList = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:Class = null;
         var _loc10_:String = null;
         var _loc11_:Entity = null;
         var _loc12_:Entity = null;
         var _loc4_:Object = null;
         if(param2.hasCompositeKey())
         {
            _loc4_ = getIdentityMapFromInstance(param1,param2);
         }
         for each(_loc5_ in param2.oneToManyAssociations)
         {
            if((_loc6_ = param1[_loc5_.property]) && !_loc5_.inverse && (!_loc5_.lazy || !(_loc6_ is LazyList) || LazyList(_loc6_).loaded) && isCascadeSave(_loc5_))
            {
               if(!param2.hasCompositeKey())
               {
                  _loc4_ = getIdentityMap(_loc5_.fkProperty,param1[param2.pk.property]);
               }
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc8_ = _loc6_.getItemAt(_loc7_);
                  _loc9_ = getClass(_loc8_);
                  _loc10_ = getClassName(_loc9_);
                  _loc11_ = OBJECT_TYPE == _loc10_ ? this.getEntityForDynamicObject(_loc8_,_loc5_.property) : this.getEntity(_loc9_);
                  if(!(_loc12_ = _loc5_.getAssociatedEntity(_loc11_)))
                  {
                     throw new Error("Attempting to save a collection item of a type not specified in the one-to-many association. ");
                  }
                  param3.a = _loc5_;
                  param3.idMap = _loc4_;
                  param3.associatedEntity = _loc12_;
                  if(_loc5_.indexed && !_loc5_.hierarchical)
                  {
                     param3.indexValue = _loc7_;
                  }
                  if(_loc12_.isDynamicObject())
                  {
                     param3.name = _loc5_.property;
                  }
                  this.saveItem(_loc8_,param3);
                  if(_loc5_.hierarchical)
                  {
                     ++param3.lft;
                  }
                  _loc7_++;
               }
               param3.a = null;
               param3.idMap = null;
               param3.associatedEntity = null;
            }
         }
      }
      
      private function createItem(param1:Object, param2:Entity, param3:SaveRecursiveArgs) : void
      {
         var _loc5_:* = undefined;
         var _loc6_:* = null;
         var _loc7_:InsertCommand = null;
         var _loc8_:InsertCommand = null;
         this.saveManyToOneAssociations(param1,param2);
         var _loc4_:InsertCommand = param2.insertCommand;
         if(param2.superEntity)
         {
            if(!param2.hasCompositeKey())
            {
               param3.subInsertCommand = _loc4_;
               param3.entityType = getQualifiedClassName(param2.cls);
               param3.fkProperty = param2.fkProperty;
            }
            this.createItem(param1,param2.superEntity,param3);
         }
         setFieldParams(_loc4_,param1,param2);
         setManyToOneAssociationParams(_loc4_,param1,param2);
         setInsertTimestampParams(_loc4_);
         if(param2.isSuperEntity())
         {
            _loc4_.setParam("entityType",param3.entityType);
         }
         if(false && !param2.hasCompositeKey())
         {
            _loc4_.setParam("version",0);
            _loc4_.setParam("serverId",0);
         }
         if(false)
         {
            _loc4_.setParam("markedForDeletion",false);
         }
         if(param3.a is OneToManyAssociation && param2.equals(param3.associatedEntity))
         {
            setIdentMapParams(_loc4_,param3.idMap);
            if(param3.a.hierarchical)
            {
               this.openGap(param3.lft,2,param2);
               _loc4_.setParam("lft",param3.lft);
               _loc4_.setParam("rgt",param3.lft + 1);
               ++param3.lft;
            }
            else if(param3.a.indexed)
            {
               _loc4_.setParam(param3.a.indexProperty,param3.indexValue);
            }
         }
         if(param3.a == null)
         {
            for each(_loc6_ in param2.oneToManyInverseAssociations)
            {
               if(_loc6_.hierarchical)
               {
                  if(param3.lft == -1)
                  {
                     trace("WARNING new left boundary/position not set on a nested set object. ");
                     param3.lft = 0;
                  }
                  this.openGap(param3.lft,2,param2);
                  _loc4_.setParam("lft",param3.lft);
                  _loc4_.setParam("rgt",param3.lft + 1);
                  ++param3.lft;
               }
               else if(_loc6_.indexed)
               {
                  if(_loc6_.ownerEntity.cls == param3.ownerClass && Boolean(param3.indexValue))
                  {
                     _loc4_.setParam(_loc6_.indexProperty,param3.indexValue);
                  }
                  else
                  {
                     _loc4_.setParam(_loc6_.indexProperty,0);
                  }
               }
            }
         }
         if(!param2.hasCompositeKey())
         {
            if(IDStrategy.UID == param2.pk.strategy)
            {
               _loc5_ = UIDUtil.createUID();
               param1[param2.pk.property] = _loc5_;
               _loc4_.setParam(param2.fkProperty,_loc5_);
            }
            else if(IDStrategy.ASSIGNED == param2.pk.strategy)
            {
               _loc5_ = param1[param2.pk.property];
               _loc4_.setParam(param2.fkProperty,_loc5_);
            }
         }
         _loc4_.execute();
         if(!param2.hasCompositeKey() && param2.superEntity == null)
         {
            if(IDStrategy.AUTO_INCREMENT == param2.pk.strategy)
            {
               _loc5_ = _loc4_.lastInsertRowID;
               param1[param2.pk.property] = _loc5_;
            }
            if(_loc7_ = param3.subInsertCommand)
            {
               _loc7_.setParam(param3.fkProperty,_loc5_);
            }
         }
         if(param3.a is ManyToManyAssociation && param2.equals(param3.associatedEntity))
         {
            _loc8_ = param3.mtmInsertCommand;
            setIdentityParams(_loc8_,param1,param2);
            setIdentMapParams(_loc8_,param3.idMap);
            if(param3.a.indexed)
            {
               _loc8_.setParam(param3.a.indexProperty,param3.indexValue);
            }
            _loc8_.execute();
         }
         this.saveOneToManyAssociations(param1,param2,param3);
         this.saveManyToManyAssociations(param1,param2);
      }
      
      public function removeItem(param1:Class, param2:*) : void
      {
         this.remove(this.loadItem(param1,param2));
      }
      
      public function reloadObject(param1:Object) : Object
      {
         var _loc2_:Entity = this.getEntityForObject(param1);
         var _loc3_:Object = this.loadEntityWithInheritance(_loc2_,getIdentityMapFromInstance(param1,_loc2_));
         clearCache();
         return _loc3_;
      }
      
      public function fetchCriteria(param1:Criteria) : ArrayCollection
      {
         var _loc2_:SelectCommand = param1.entity.selectCommand.clone();
         _loc2_.setCriteria(param1);
         _loc2_.execute();
         var _loc3_:ArrayCollection = this.typeArray(_loc2_.result,param1.entity);
         clearCache();
         return _loc3_;
      }
      
      private function typeObject(param1:Object, param2:Entity, param3:Entity = null, param4:Entity = null) : Object
      {
         var _loc7_:* = null;
         var _loc8_:Class = null;
         var _loc9_:SelectCommand = null;
         var _loc10_:String = null;
         var _loc11_:IHierarchicalObject = null;
         var _loc12_:Object = null;
         if(param1 == null)
         {
            return null;
         }
         if(param3 == null)
         {
            param3 = param2;
         }
         var _loc5_:Object;
         if(_loc5_ = getCachedValue(param2,getIdentityMapFromRow(param1,param2)))
         {
            return _loc5_;
         }
         var _loc6_:Object = new param2.cls();
         if(param1.hasOwnProperty("entity_type") && param4 == null)
         {
            _loc8_ = getDefinitionByName(param1["entity_type"]) as Class;
            if(param2.cls != _loc8_)
            {
               _loc6_ = new _loc8_();
               param4 = param2;
               param2 = this.getEntity(_loc8_);
               _loc9_ = param2.selectCommand;
               _loc10_ = String(param1[param4.pk.column]);
               setIdentityParams(_loc9_,getIdentityMap(param2.pk.column,_loc10_),param2);
               _loc9_.execute();
               param1 = _loc9_.result[0];
            }
         }
         if(param2.hierarchical)
         {
            (_loc11_ = IHierarchicalObject(_loc6_)).lft = param1.lft;
            _loc11_.rgt = param1.rgt;
         }
         for each(_loc7_ in param2.fields)
         {
            _loc6_[_loc7_.property] = param1[_loc7_.column];
         }
         this.setSuperProperties(_loc6_,param1,param2,param3,param4);
         this.setManyToOneAssociations(_loc6_,param1,param2,param3,param4);
         setCachedValue(_loc6_,param2);
         this.setOneToManyAssociations(_loc6_,param1,param2);
         this.setManyToManyAssociations(_loc6_,param1,param2);
         if(param2.hierarchical && param2.equals(param3))
         {
            if(_loc12_ = _loc6_[param2.parentProperty])
            {
               getCachedChildren(_loc12_[param2.pk.property]).addItem(_loc6_);
            }
         }
         return _loc6_;
      }
      
      private function setManyToOneAssociations(param1:Object, param2:Object, param3:Entity, param4:Entity, param5:Entity) : void
      {
         var _loc6_:* = null;
         var _loc7_:Entity = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:* = undefined;
         for each(_loc6_ in param3.manyToOneAssociations)
         {
            _loc7_ = _loc6_.associatedEntity;
            _loc8_ = null;
            if(_loc6_.hierarchical && Boolean(param5))
            {
               _loc8_ = getCachedValue(param5,getIdentityMap(param5.fkProperty,param2[_loc6_.fkColumn]));
            }
            else if(param3.equals(param4))
            {
               _loc8_ = getCachedAssociationValue(_loc6_,param2);
            }
            if(_loc8_)
            {
               param1[_loc6_.property] = _loc8_;
            }
            else
            {
               _loc9_ = null;
               if(_loc7_.hasCompositeKey())
               {
                  _loc9_ = getIdentityMapFromAssociation(param2,_loc7_);
               }
               else
               {
                  _loc10_ = param2[_loc6_.fkColumn];
                  if(idAssigned(_loc10_))
                  {
                     _loc9_ = getIdentityMap(_loc7_.fkProperty,_loc10_);
                  }
               }
               if(_loc9_)
               {
                  param1[_loc6_.property] = this.loadEntityWithInheritance(_loc7_,_loc9_);
               }
            }
         }
      }
      
      private function closeGap(param1:int, param2:int, param3:Entity) : void
      {
         var _loc4_:UpdateNestedSetsRightBoundaryCommand;
         (_loc4_ = param3.updateRightBoundaryCommand).setParam("rgt",param1);
         _loc4_.setParam("inc",-param2);
         _loc4_.execute();
         var _loc5_:UpdateNestedSetsLeftBoundaryCommand;
         (_loc5_ = param3.updateLeftBoundaryCommand).setParam("lft",param1);
         _loc5_.setParam("inc",-param2);
         _loc5_.execute();
      }
      
      private function typeArray(param1:Array, param2:Entity) : ArrayCollection
      {
         var _loc4_:* = null;
         var _loc3_:ArrayCollection = new ArrayCollection();
         for each(_loc4_ in param1)
         {
            _loc3_.addItem(this.typeObject(_loc4_,param2));
         }
         return _loc3_;
      }
      
      public function loadManyToManyAssociation(param1:ManyToManyAssociation, param2:Object) : ArrayCollection
      {
         var _loc3_:SelectCommand = param1.selectCommand;
         setIdentMapParams(_loc3_,param2);
         _loc3_.execute();
         return this.typeArray(_loc3_.result,param1.associatedEntity);
      }
      
      public function openSyncConnection(param1:String) : void
      {
         var _loc2_:File = File.applicationStorageDirectory.resolvePath(param1);
         sqlConnection = new SQLConnection();
         this.sqlConnection.open(_loc2_);
      }
      
      public function loadItemByCompositeKey(param1:Class, param2:Array) : Object
      {
         var _loc5_:* = null;
         var _loc6_:Object = null;
         var _loc7_:Entity = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:Entity = this.getEntity(param1);
         if(!_loc3_.hasCompositeKey())
         {
            throw new Error("Entity \'" + _loc3_.name + "\' does not have a composite key. Use EntityManager.loadItem instead. ");
         }
         var _loc4_:* = {};
         var _loc11_:int = 0;
         var _loc12_:* = param2;
         while(true)
         {
            for each(_loc5_ in _loc12_)
            {
               _loc7_ = this.getEntityForObject(_loc5_);
               _loc8_ = false;
               for each(_loc9_ in _loc3_.keys)
               {
                  if(_loc7_.equals(_loc9_.associatedEntity))
                  {
                     _loc8_ = true;
                     break;
                  }
               }
               if(!_loc8_)
               {
                  trace("Key of type \'" + _loc7_.name + "\' not specified as an identifier for \'" + _loc3_.name + "\'. ");
                  for each(_loc10_ in _loc3_.manyToOneAssociations)
                  {
                     if(_loc7_.equals(_loc10_.associatedEntity))
                     {
                        trace("Key type \'" + _loc7_.name + "\' is used in a many-to-one association, so will allow. ");
                        _loc8_ = true;
                        break;
                     }
                  }
               }
               if(!_loc8_)
               {
                  break;
               }
               _loc4_ = combineMaps([_loc4_,getIdentityMapFromInstance(_loc5_,_loc7_)]);
            }
            _loc6_ = this.loadEntityWithInheritance(_loc3_,_loc4_);
            clearCache();
            return _loc6_;
         }
         throw new Error("Invalid key of type \'" + _loc7_.name + "\' specified. ");
      }
      
      override public function get sqlConnection() : SQLConnection
      {
         if(super.sqlConnection == null)
         {
            this.openSyncConnection("default.db");
         }
         return super.sqlConnection;
      }
      
      private function saveManyToManyAssociations(param1:Object, param2:Entity) : void
      {
         var _loc3_:* = null;
         var _loc4_:IList = null;
         var _loc5_:Object = null;
         var _loc6_:SelectCommand = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:UpdateCommand = null;
         var _loc17_:InsertCommand = null;
         var _loc18_:SaveRecursiveArgs = null;
         var _loc19_:DeleteCommand = null;
         for each(_loc3_ in param2.manyToManyAssociations)
         {
            if((Boolean(_loc4_ = param1[_loc3_.property])) && (!_loc3_.lazy || LazyList(_loc4_).loaded))
            {
               _loc5_ = getIdentityMapFromInstance(param1,param2);
               _loc6_ = _loc3_.selectManyToManyKeysCommand;
               setIdentityParams(_loc6_,param1,param2);
               _loc6_.execute();
               _loc7_ = [];
               for each(_loc8_ in _loc6_.result)
               {
                  _loc7_.push(getIdentityMapFromAssociation(_loc8_,_loc3_.associatedEntity));
               }
               _loc10_ = 0;
               while(_loc10_ < _loc4_.length)
               {
                  _loc11_ = _loc4_.getItemAt(_loc10_);
                  _loc12_ = getIdentityMapFromInstance(_loc11_,_loc3_.associatedEntity);
                  _loc13_ = false;
                  _loc14_ = 0;
                  for each(_loc9_ in _loc7_)
                  {
                     _loc13_ = true;
                     for each(_loc15_ in _loc3_.associatedEntity.identities)
                     {
                        if(_loc12_[_loc15_.fkProperty] != _loc9_[_loc15_.fkProperty])
                        {
                           _loc13_ = false;
                           break;
                        }
                     }
                     if(_loc13_)
                     {
                        break;
                     }
                     _loc14_++;
                  }
                  if(_loc13_)
                  {
                     if(isCascadeSave(_loc3_))
                     {
                        if(_loc3_.indexed)
                        {
                           _loc16_ = _loc3_.updateCommand;
                           setIdentMapParams(_loc16_,_loc5_);
                           setIdentMapParams(_loc16_,_loc12_);
                           _loc16_.setParam(_loc3_.indexProperty,_loc10_);
                           _loc16_.execute();
                        }
                        this.saveItem(_loc11_,new SaveRecursiveArgs());
                     }
                     _loc7_.splice(_loc14_,1);
                  }
                  else
                  {
                     _loc17_ = _loc3_.insertCommand;
                     if(isCascadeSave(_loc3_))
                     {
                        (_loc18_ = new SaveRecursiveArgs()).a = _loc3_;
                        _loc18_.associatedEntity = _loc3_.associatedEntity;
                        _loc18_.idMap = _loc5_;
                        _loc18_.mtmInsertCommand = _loc17_;
                        if(_loc3_.indexed)
                        {
                           _loc18_.indexValue = _loc10_;
                        }
                        this.saveItem(_loc11_,_loc18_);
                     }
                     else
                     {
                        setIdentMapParams(_loc17_,_loc5_);
                        setIdentMapParams(_loc17_,_loc12_);
                        if(_loc3_.indexed)
                        {
                           _loc17_.setParam(_loc3_.indexProperty,_loc10_);
                        }
                        _loc17_.execute();
                     }
                  }
                  _loc10_++;
               }
               for each(_loc9_ in _loc7_)
               {
                  _loc19_ = _loc3_.deleteCommand;
                  setIdentMapParams(_loc19_,_loc5_);
                  setIdentMapParams(_loc19_,_loc9_);
                  _loc19_.execute();
               }
            }
         }
      }
      
      private function getEntity(param1:Class) : Entity
      {
         var _loc2_:Class = param1 is PersistentEntity ? param1.__class : param1;
         var _loc3_:String = getClassName(_loc2_);
         var _loc4_:Entity;
         if((_loc4_ = entityMap[_loc3_]) == null || !_loc4_.initialisationComplete)
         {
            _loc4_ = introspector.loadMetadata(_loc2_);
         }
         return _loc4_;
      }
      
      private function moveBranch(param1:IHierarchicalObject, param2:int = -1) : void
      {
         var _loc3_:Entity = this.getEntityForObject(param1);
         var _loc4_:SelectMaxRgtCommand;
         (_loc4_ = _loc3_.selectMaxRgtCommand).execute();
         var _loc5_:int = _loc4_.getMaxRgt();
         if(param2 < 0)
         {
            param2 = _loc5_ + 1;
         }
         else if(param2 >= param1.lft && param2 <= param1.rgt)
         {
            throw new Error("Cannot move a branch to within itself. ");
         }
         var _loc6_:int = param1.rgt - param1.lft + 1;
         if(param2 < _loc5_)
         {
            this.openGap(param2,_loc6_,_loc3_);
         }
         var _loc7_:UpdateNestedSetsCommand;
         (_loc7_ = _loc3_.updateNestedSetsCommand).setParam("lft",param1.lft);
         _loc7_.setParam("rgt",param1.rgt);
         _loc7_.setParam("inc",param2 - param1.lft - 1);
         _loc7_.execute();
      }
      
      private function setSuperProperties(param1:Object, param2:Object, param3:Entity, param4:Entity, param5:Entity) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc6_:Entity;
         if((_loc6_ = param3.superEntity) == null)
         {
            return;
         }
         var _loc7_:Object = param3.hasCompositeKey() ? getIdentityMapFromRow(param2,_loc6_) : getIdentityMap(_loc6_.fkProperty,param2[param3.pk.column]);
         var _loc8_:Object;
         if((_loc8_ = getCachedValue(_loc6_,_loc7_)) == null)
         {
            _loc8_ = this.typeObject(param2,_loc6_,param4,param5);
         }
         for each(_loc9_ in _loc6_.fields)
         {
            param1[_loc9_.property] = _loc8_[_loc9_.property];
         }
         for each(_loc10_ in _loc6_.manyToOneAssociations)
         {
            param1[_loc10_.property] = _loc8_[_loc10_.property];
         }
         for each(_loc11_ in _loc6_.oneToManyAssociations)
         {
            param1[_loc11_.property] = _loc8_[_loc11_.property];
         }
         for each(_loc12_ in _loc6_.manyToManyAssociations)
         {
            param1[_loc12_.property] = _loc8_[_loc12_.property];
         }
      }
      
      private function removeManyToOneAssociations(param1:Entity, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:Object = null;
         for each(_loc3_ in param1.manyToOneAssociations)
         {
            if((Boolean(_loc4_ = param2[_loc3_.property])) && isCascadeDelete(_loc3_))
            {
               this.removeObject(_loc4_);
            }
         }
      }
      
      private function removeObject(param1:Object) : void
      {
         this.removeEntity(this.getEntityForObject(param1),param1);
      }
      
      public function load(param1:Class, param2:*) : Object
      {
         return this.loadItem(param1,param2);
      }
      
      public function loadOneToManyAssociation(param1:OneToManyAssociation, param2:Object) : ArrayCollection
      {
         var _loc3_:ArrayCollection = this.loadOneToManyAssociationRecursive(param1,param2);
         clearCache();
         return _loc3_;
      }
      
      private function loadEntity(param1:Entity, param2:Object) : Object
      {
         var _loc3_:SelectCommand = param1.selectCommand;
         setIdentMapParams(_loc3_,param2);
         _loc3_.execute();
         var _loc4_:Array;
         return (Boolean(_loc4_ = _loc3_.result)) && _loc4_.length > 0 ? this.typeObject(_loc4_[0],param1) : null;
      }
      
      private function removeEntityRecursive(param1:Entity, param2:Object) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.removeOneToManyAssociations(param1,param2);
         var _loc3_:DeleteCommand = param1.deleteCommand;
         setIdentityParams(_loc3_,param2,param1);
         _loc3_.execute();
         this.removeEntityRecursive(param1.superEntity,param2);
         this.removeManyToOneAssociations(param1,param2);
      }
      
      private function selectManyToManyAssociation(param1:ManyToManyAssociation, param2:Object) : ArrayCollection
      {
         var _loc3_:SelectCommand = param1.selectCommand;
         setIdentMapParams(_loc3_,getIdentityMapFromRow(param2,param1.ownerEntity));
         _loc3_.execute();
         return this.typeArray(_loc3_.result,param1.associatedEntity);
      }
      
      private function loadNestedSets(param1:Entity, param2:Entity, param3:*, param4:int, param5:int) : void
      {
         var _loc6_:Object = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:SelectCommand = null;
         var _loc12_:Array = null;
         var _loc13_:SelectNestedSetTypesCommand = null;
         var _loc14_:Entity = null;
         var _loc15_:SelectCommand = null;
         var _loc16_:Stack = null;
         var _loc17_:Object = null;
         var _loc18_:Object = null;
         var _loc19_:Entity = null;
         if(param4 < 0 || param5 < 1)
         {
            (_loc11_ = param1.selectCommand).setParam(param1.fkProperty,param3);
            _loc11_.execute();
            if(!((Boolean(_loc12_ = _loc11_.result)) && _loc12_.length > 0))
            {
               return;
            }
            param4 = int((_loc6_ = _loc12_[0]).lft);
            param5 = int(_loc6_.rgt);
         }
         var _loc7_:* = [];
         if(param1.isSuperEntity())
         {
            (_loc13_ = param1.selectNestedSetTypesCommand).setParam("lft",param4);
            _loc13_.setParam("rgt",param5);
            _loc13_.execute();
            for each(_loc6_ in _loc13_.result)
            {
               _loc7_.push(_loc6_.entity_type);
            }
         }
         else
         {
            _loc7_.push(getQualifiedClassName(param1.cls));
         }
         var _loc8_:* = [];
         for each(_loc9_ in _loc7_)
         {
            (_loc15_ = (_loc14_ = this.getEntity(getDefinitionByName(_loc9_) as Class)).selectNestedSetsCommand).setParam("lft",param4);
            _loc15_.setParam("rgt",param5);
            _loc15_.execute();
            for each(_loc6_ in _loc15_.result)
            {
               _loc8_.push({
                  "entity":_loc14_,
                  "lft":int(_loc6_.lft),
                  "rgt":int(_loc6_.rgt),
                  "row":_loc6_
               });
            }
         }
         _loc8_.sortOn("lft",Array.NUMERIC);
         this.nestedSetsLoaded = true;
         if(_loc8_.length > 0)
         {
            (_loc16_ = new Stack()).push({
               "entity":param2,
               "lft":param4,
               "rgt":param5
            });
            _loc17_ = null;
         }
         for each(_loc10_ in _loc8_)
         {
            if(Boolean(_loc17_) && _loc10_.lft < _loc17_.rgt)
            {
               _loc16_.push(_loc17_);
            }
            _loc18_ = _loc16_.getLastItem();
            if(_loc10_.lft > _loc18_.rgt)
            {
               _loc16_.pop();
               _loc18_ = _loc16_.getLastItem();
            }
            _loc19_ = !!_loc18_ ? _loc18_.entity : null;
            this.typeObject(_loc10_.row,_loc10_.entity,null,_loc19_);
            _loc17_ = _loc10_;
         }
         this.nestedSetsLoaded = false;
      }
      
      private function setOneToManyAssociations(param1:Object, param2:Object, param3:Entity) : void
      {
         var _loc4_:* = null;
         var _loc5_:Object = null;
         var _loc6_:LazyList = null;
         var _loc7_:ArrayCollection = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:Entity = null;
         for each(_loc4_ in param3.oneToManyAssociations)
         {
            _loc5_ = param3.hasCompositeKey() ? getIdentityMapFromRow(param2,param3) : getIdentityMap(_loc4_.fkProperty,param2[param3.pk.column]);
            if(_loc4_.lazy)
            {
               _loc6_ = new LazyList(this,_loc4_,_loc5_);
               (_loc7_ = new ArrayCollection()).list = _loc6_;
               param1[_loc4_.property] = _loc7_;
               _loc6_.initialise();
            }
            else if(_loc4_.hierarchical)
            {
               _loc8_ = int(param2[param3.pk.column]);
               if(!this.nestedSetsLoaded)
               {
                  for each(_loc9_ in _loc4_.associatedTypes)
                  {
                     _loc10_ = param3.isSuperEntity() ? this.getEntity(getDefinitionByName(param2.entity_type) as Class) : param3;
                     this.loadNestedSets(_loc9_.associatedEntity,_loc10_,_loc8_,param2.lft,param2.rgt);
                  }
               }
               param1[_loc4_.property] = getCachedChildren(_loc8_);
            }
            else
            {
               param1[_loc4_.property] = this.loadOneToManyAssociationRecursive(_loc4_,_loc5_);
            }
         }
      }
      
      private function setManyToManyAssociations(param1:Object, param2:Object, param3:Entity) : void
      {
         var _loc4_:* = null;
         var _loc5_:LazyList = null;
         var _loc6_:ArrayCollection = null;
         for each(_loc4_ in param3.manyToManyAssociations)
         {
            if(_loc4_.lazy)
            {
               _loc5_ = new LazyList(this,_loc4_,getIdentityMapFromRow(param2,param3));
               (_loc6_ = new ArrayCollection()).list = _loc5_;
               param1[_loc4_.property] = _loc6_;
               _loc5_.initialise();
            }
            else
            {
               param1[_loc4_.property] = this.selectManyToManyAssociation(_loc4_,param2);
            }
         }
      }
      
      public function removeItemByCompositeKey(param1:Class, param2:Array) : void
      {
         this.remove(this.loadItemByCompositeKey(param1,param2));
      }
      
      private function resetMapForDynamicObjects(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:Entity = null;
         if(param1)
         {
            for(_loc2_ in entityMap)
            {
               _loc3_ = entityMap[_loc2_];
               if(param1 == _loc3_.root)
               {
                  entityMap[_loc2_] = null;
               }
            }
         }
      }
      
      private function loadEntityWithInheritance(param1:Entity, param2:Object) : Object
      {
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:Class = null;
         var _loc9_:Entity = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc3_:SelectCommand = param1.selectCommand;
         setIdentMapParams(_loc3_,param2);
         _loc3_.execute();
         var _loc4_:Object = null;
         var _loc5_:Array;
         if((Boolean(_loc5_ = _loc3_.result)) && _loc5_.length > 0)
         {
            _loc6_ = _loc5_[0];
            _loc4_ = this.typeObject(_loc6_,param1);
            if(param1.isSuperEntity())
            {
               if(_loc7_ = String(_loc6_.entity_type))
               {
                  _loc8_ = getDefinitionByName(_loc7_) as Class;
                  if((_loc9_ = this.getEntity(_loc8_)) == null)
                  {
                     throw new Error("Cannot find entity of type " + _loc7_);
                  }
                  _loc10_ = param1.hasCompositeKey() ? getIdentityMapFromRow(_loc6_,_loc9_) : getIdentityMap(_loc9_.fkProperty,param2[param1.fkProperty]);
                  if((_loc11_ = getCachedValue(_loc9_,_loc10_)) == null)
                  {
                     _loc11_ = this.loadEntityWithInheritance(_loc9_,_loc10_);
                  }
                  _loc4_ = _loc11_;
               }
            }
         }
         return _loc4_;
      }
      
      private function updateItem(param1:Object, param2:Entity, param3:SaveRecursiveArgs) : void
      {
         var _loc5_:* = null;
         var _loc6_:IHierarchicalObject = null;
         var _loc7_:int = 0;
         var _loc8_:InsertCommand = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         this.saveManyToOneAssociations(param1,param2);
         this.updateItem(param1,param2.superEntity,param3);
         var _loc4_:UpdateCommand = param2.updateCommand;
         setIdentityParams(_loc4_,param1,param2);
         setFieldParams(_loc4_,param1,param2);
         setManyToOneAssociationParams(_loc4_,param1,param2);
         setUpdateTimestampParams(_loc4_);
         if(param3.a is OneToManyAssociation && param2.equals(param3.associatedEntity))
         {
            setIdentMapParams(_loc4_,param3.idMap);
            if(param3.a.hierarchical)
            {
               this.setNestedSetParams(_loc4_,IHierarchicalObject(param1),param3,param2);
               ++param3.lft;
            }
            else if(param3.a.indexed)
            {
               _loc4_.setParam(param3.a.indexProperty,param3.indexValue);
            }
         }
         if(param3.a == null)
         {
            for each(_loc5_ in param2.oneToManyInverseAssociations)
            {
               if(_loc5_.hierarchical)
               {
                  _loc6_ = IHierarchicalObject(param1);
                  if(!param3.rootEval)
                  {
                     _loc7_ = _loc6_.rgt - _loc6_.lft + 1;
                     this.closeGap(_loc6_.lft,_loc7_,param2);
                     param3.rootLft = _loc6_.lft;
                     param3.rootSpread = _loc7_;
                     param3.rootEval = true;
                  }
                  if(param3.lft == -1)
                  {
                     trace("WARNING new left boundary/position not set on a nested set object. ");
                     param3.lft = 0;
                  }
                  this.setNestedSetParams(_loc4_,_loc6_,param3,param2);
                  ++param3.lft;
               }
               else if(_loc5_.indexed)
               {
                  if(_loc5_.ownerEntity.cls == param3.ownerClass && Boolean(param3.indexValue))
                  {
                     _loc4_.setParam(_loc5_.indexProperty,param3.indexValue);
                  }
                  else
                  {
                     _loc4_.setParam(_loc5_.indexProperty,0);
                  }
               }
            }
         }
         _loc4_.execute();
         if(param3.a is ManyToManyAssociation && param2.equals(param3.associatedEntity))
         {
            _loc8_ = param3.mtmInsertCommand;
            setIdentityParams(_loc8_,param1,param2);
            setIdentMapParams(_loc8_,param3.idMap);
            if(param3.a.indexed)
            {
               _loc8_.setParam(param3.a.indexProperty,param3.indexValue);
            }
            _loc8_.execute();
         }
         this.saveOneToManyAssociations(param1,param2,param3);
         this.saveManyToManyAssociations(param1,param2);
      }
   }
}
