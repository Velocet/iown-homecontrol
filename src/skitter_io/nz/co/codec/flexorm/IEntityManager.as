package nz.co.codec.flexorm
{
   import flash.data.SQLConnection;
   import mx.collections.ArrayCollection;
   import nz.co.codec.flexorm.criteria.Criteria;
   
   public interface IEntityManager
   {
       
      
      function fetchCriteria(param1:Criteria) : ArrayCollection;
      
      function set debugLevel(param1:int) : void;
      
      function endTransaction() : void;
      
      function remove(param1:Object) : void;
      
      function saveHierarchicalObject(param1:Object, param2:Object = null) : Object;
      
      function load(param1:Class, param2:*) : Object;
      
      function set prefs(param1:Object) : void;
      
      function findAll(param1:Class) : ArrayCollection;
      
      function markForDeletion(param1:Object) : void;
      
      function makePersistent(param1:Class) : void;
      
      function removeItemByCompositeKey(param1:Class, param2:Array) : void;
      
      function loadItemByCompositeKey(param1:Class, param2:Array) : Object;
      
      function get debugLevel() : int;
      
      function openSyncConnection(param1:String) : void;
      
      function get sqlConnection() : SQLConnection;
      
      function fetchCriteriaFirstResult(param1:Criteria) : Object;
      
      function removeItem(param1:Class, param2:*) : void;
      
      function set sqlConnection(param1:SQLConnection) : void;
      
      function loadItem(param1:Class, param2:*) : Object;
      
      function createCriteria(param1:Class) : Criteria;
      
      function startTransaction() : void;
      
      function save(param1:Object, param2:Object = null, param3:Boolean = false) : *;
      
      function loadDynamicObject(param1:String, param2:int) : Object;
   }
}
