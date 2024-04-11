package com.scenarioLauncher.persistence
{
   import mx.collections.ArrayCollection;
   import nz.co.codec.flexorm.EntityManager;
   
   public class GenericDAO
   {
       
      
      private var _em:EntityManager;
      
      private var _classObject:Class;
      
      public function GenericDAO(param1:Class, param2:EntityManager)
      {
         super();
         this._classObject = param1;
         this._em = param2;
         this._em.sqlConnection = LocalSQLiteConnection.sqlConnection;
      }
      
      public function execNamedQuery(param1:Class, param2:String, param3:Array) : ArrayCollection
      {
         return this._em.execNamedQuery(param1,param2,param3);
      }
      
      public function remove(param1:Object, param2:Boolean = false) : void
      {
         if(param2)
         {
            this._em.startTransaction();
            this._em.remove(param1);
            this._em.endTransaction();
         }
         else
         {
            this._em.remove(param1);
         }
      }
      
      public function removeById(param1:Object, param2:Boolean = false) : void
      {
         if(param2)
         {
            this._em.startTransaction();
            this._em.removeItem(this._classObject,param1);
            this._em.endTransaction();
         }
         else
         {
            this._em.removeItem(this._classObject,param1);
         }
      }
      
      public function findById(param1:*) : Object
      {
         return this._em.loadItem(this._classObject,param1);
      }
      
      public function removeAll() : int
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc2_:ArrayCollection = this.findAll();
         for each(_loc3_ in _loc2_)
         {
            this._em.remove(_loc3_);
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function save(param1:Object, param2:Boolean = false) : Object
      {
         var _loc3_:Object = null;
         if(param2)
         {
            this._em.startTransaction();
            _loc3_ = this._em.save(param1);
            this._em.endTransaction();
         }
         else
         {
            _loc3_ = this._em.save(param1);
         }
         return _loc3_;
      }
      
      public function findAll() : ArrayCollection
      {
         return this._em.findAll(this._classObject);
      }
   }
}
