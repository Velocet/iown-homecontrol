package nz.co.codec.flexorm
{
   import flash.data.SQLConnection;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import mx.collections.ArrayCollection;
   import nz.co.codec.flexorm.command.InsertCommand;
   import nz.co.codec.flexorm.command.SQLParameterisedCommand;
   import nz.co.codec.flexorm.command.UpdateCommand;
   import nz.co.codec.flexorm.metamodel.Association;
   import nz.co.codec.flexorm.metamodel.Entity;
   import nz.co.codec.flexorm.metamodel.Field;
   import nz.co.codec.flexorm.metamodel.Identity;
   import nz.co.codec.flexorm.metamodel.PersistentEntity;
   import nz.co.codec.flexorm.util.Mixin;
   
   public class EntityManagerBase
   {
      
      internal static const OBJECT_TYPE:String = "Object";
      
      internal static const DEFAULT_SCHEMA:String = "main";
       
      
      private var _schema:String;
      
      private var cacheMap:Object;
      
      private var _sqlConnection:SQLConnection;
      
      private var _debugLevel:int;
      
      private var cachedChildrenMap:Object;
      
      private var _introspector:nz.co.codec.flexorm.EntityIntrospector;
      
      private var _prefs:Object;
      
      private var _entityMap:Object;
      
      public function EntityManagerBase()
      {
         super();
         this._schema = DEFAULT_SCHEMA;
         this._prefs = {};
         this._prefs.namingStrategy = NamingStrategy.UNDERSCORE_NAMES;
         this._prefs.syncSupport = false;
         this._prefs.auditable = true;
         this._prefs.markForDeletion = true;
         this._debugLevel = 0;
         this._entityMap = {};
         this.clearCache();
      }
      
      public function set introspector(param1:nz.co.codec.flexorm.EntityIntrospector) : void
      {
         this._introspector = param1;
      }
      
      protected function setIdentMapParams(param1:SQLParameterisedCommand, param2:Object) : void
      {
         var _loc3_:String = null;
         for(_loc3_ in param2)
         {
            param1.setParam(_loc3_,param2[_loc3_]);
         }
      }
      
      protected function setManyToOneAssociationParams(param1:SQLParameterisedCommand, param2:Object, param3:Entity) : void
      {
         var _loc4_:* = null;
         var _loc5_:Entity = null;
         var _loc6_:Object = null;
         for each(_loc4_ in param3.manyToOneAssociations)
         {
            _loc5_ = _loc4_.associatedEntity;
            _loc6_ = param2[_loc4_.property];
            if(_loc5_.hasCompositeKey())
            {
               this.setIdentityParams(param1,_loc6_,_loc5_);
            }
            else if(_loc6_ == null)
            {
               param1.setParam(_loc4_.fkProperty,0);
            }
            else
            {
               param1.setParam(_loc4_.fkProperty,_loc6_[_loc5_.pk.property]);
            }
         }
      }
      
      protected function setCachedValue(param1:Object, param2:Entity) : void
      {
         this.getCache(param2.name)[this.getIdentityMapFromInstance(param1,param2)] = param1;
      }
      
      protected function getIdentityMap(param1:String, param2:*) : Object
      {
         var _loc3_:* = {};
         _loc3_[param1] = param2;
         return _loc3_;
      }
      
      protected function getClass(param1:Object) : Class
      {
         return param1 is PersistentEntity ? param1.__class : Class(getDefinitionByName(getQualifiedClassName(param1)));
      }
      
      public function get sqlConnection() : SQLConnection
      {
         return this._sqlConnection;
      }
      
      protected function getIdentityMapFromInstance(param1:Object, param2:Entity) : Object
      {
         var _loc4_:* = null;
         var _loc3_:* = {};
         for each(_loc4_ in param2.identities)
         {
            _loc3_[_loc4_.fkProperty] = _loc4_.getValue(param1);
         }
         return _loc3_;
      }
      
      protected function getIdentityMapFromAssociation(param1:Object, param2:Entity) : Object
      {
         var _loc4_:* = null;
         var _loc5_:* = undefined;
         var _loc3_:* = {};
         for each(_loc4_ in param2.identities)
         {
            if((_loc5_ = param1[_loc4_.fkColumn]) == 0 || _loc5_ == null)
            {
               return null;
            }
            _loc3_[_loc4_.fkProperty] = _loc5_;
         }
         return _loc3_;
      }
      
      protected function getCachedValue(param1:Entity, param2:Object) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:Boolean = false;
         var _loc6_:String = null;
         if(param2 == null)
         {
            return null;
         }
         var _loc3_:Dictionary = this.getCache(param1.name);
         var _loc7_:int = 0;
         var _loc8_:* = _loc3_;
         do
         {
            for(_loc4_ in _loc8_)
            {
               _loc5_ = true;
               for(_loc6_ in param2)
               {
                  if(param2[_loc6_] != _loc4_[_loc6_])
                  {
                     _loc5_ = false;
                     break;
                  }
               }
            }
            return null;
         }
         while(!_loc5_);
         
         return _loc3_[_loc4_];
      }
      
      protected function setUpdateTimestampParams(param1:UpdateCommand) : void
      {
         if(Boolean(this._prefs.syncSupport) || Boolean(this._prefs.auditable))
         {
            param1.setParam("updatedAt",new Date());
         }
      }
      
      protected function isDynamicObject(param1:Object) : Boolean
      {
         return OBJECT_TYPE == this.getClassName(this.getClass(param1));
      }
      
      protected function isCascadeSave(param1:Association) : Boolean
      {
         return param1.cascadeType == CascadeType.SAVE_UPDATE || param1.cascadeType == CascadeType.ALL;
      }
      
      public function get introspector() : nz.co.codec.flexorm.EntityIntrospector
      {
         return this._introspector;
      }
      
      public function set sqlConnection(param1:SQLConnection) : void
      {
         this._sqlConnection = param1;
         this._introspector = new nz.co.codec.flexorm.EntityIntrospector(this._schema,param1,this._entityMap,this._debugLevel,this._prefs);
      }
      
      protected function setInsertTimestampParams(param1:InsertCommand) : void
      {
         if(Boolean(this._prefs.syncSupport) || Boolean(this._prefs.auditable))
         {
            param1.setParam("createdAt",new Date());
            param1.setParam("updatedAt",new Date());
         }
      }
      
      public function set prefs(param1:Object) : void
      {
         var _loc2_:String = null;
         if(param1)
         {
            if(param1.hasOwnProperty("schema"))
            {
               this._schema = param1.schema;
            }
            for(_loc2_ in param1)
            {
               if(this._prefs.hasOwnProperty(_loc2_))
               {
                  this._prefs[_loc2_] = param1[_loc2_];
               }
            }
         }
      }
      
      public function get schema() : String
      {
         return this._schema;
      }
      
      private function getCache(param1:String) : Dictionary
      {
         var _loc2_:Dictionary = this.cacheMap[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new Dictionary();
            this.cacheMap[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function makePersistent(param1:Class) : void
      {
         Mixin.extendClass(param1,PersistentEntity);
         param1.__class = param1;
      }
      
      protected function setIdentityParams(param1:SQLParameterisedCommand, param2:Object, param3:Entity) : void
      {
         var _loc4_:* = null;
         for each(_loc4_ in param3.identities)
         {
            param1.setParam(_loc4_.fkProperty,_loc4_.getValue(param2));
         }
      }
      
      protected function getIdentityMapFromRow(param1:Object, param2:Entity) : Object
      {
         var _loc4_:* = null;
         var _loc5_:* = undefined;
         var _loc3_:* = {};
         for each(_loc4_ in param2.identities)
         {
            if((_loc5_ = param1[_loc4_.column]) == 0 || _loc5_ == null)
            {
               return null;
            }
            _loc3_[_loc4_.fkProperty] = _loc5_;
         }
         return _loc3_;
      }
      
      public function set debugLevel(param1:int) : void
      {
         this._debugLevel = param1;
         if(this._introspector)
         {
            this._introspector.debugLevel = param1;
         }
      }
      
      protected function idAssigned(param1:*) : Boolean
      {
         return param1 is int && param1 > 0 || param1 is String && param1 != null;
      }
      
      protected function setFieldParams(param1:SQLParameterisedCommand, param2:Object, param3:Entity) : void
      {
         var _loc4_:* = null;
         for each(_loc4_ in param3.fields)
         {
            if(param3.hasCompositeKey() || _loc4_.property != param3.pk.property)
            {
               param1.setParam(_loc4_.property,param2[_loc4_.property]);
            }
         }
      }
      
      protected function clearCache() : void
      {
         this.cacheMap = {};
         this.cachedChildrenMap = {};
      }
      
      public function get prefs() : Object
      {
         return this._prefs;
      }
      
      public function get debugLevel() : int
      {
         return this._debugLevel;
      }
      
      protected function isCascadeDelete(param1:Association) : Boolean
      {
         return param1.cascadeType == CascadeType.DELETE || param1.cascadeType == CascadeType.ALL;
      }
      
      protected function getCachedAssociationValue(param1:Association, param2:Object) : Object
      {
         var _loc3_:Entity = param1.associatedEntity;
         if(_loc3_.hasCompositeKey())
         {
            return this.getCachedValue(_loc3_,this.getIdentityMapFromAssociation(param2,_loc3_));
         }
         return this.getCachedValue(_loc3_,this.getIdentityMap(_loc3_.fkProperty,param2[param1.fkColumn]));
      }
      
      public function get entityMap() : Object
      {
         return this._entityMap;
      }
      
      protected function getClassName(param1:Class) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         return _loc2_.substring(_loc2_.lastIndexOf(":") + 1);
      }
      
      protected function combineMaps(param1:Array) : Object
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc2_:* = {};
         for each(_loc3_ in param1)
         {
            for(_loc4_ in _loc3_)
            {
               _loc2_[_loc4_] = _loc3_[_loc4_];
            }
         }
         return _loc2_;
      }
      
      protected function getCachedChildren(param1:int) : ArrayCollection
      {
         var _loc2_:ArrayCollection = this.cachedChildrenMap[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new ArrayCollection();
            this.cachedChildrenMap[param1] = _loc2_;
         }
         return _loc2_;
      }
   }
}
