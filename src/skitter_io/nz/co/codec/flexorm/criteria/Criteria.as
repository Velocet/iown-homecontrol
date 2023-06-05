package nz.co.codec.flexorm.criteria
{
   import nz.co.codec.flexorm.metamodel.Entity;
   
   public class Criteria
   {
       
      
      private var _entity:Entity;
      
      private var _params:Object;
      
      private var _sorts:Array;
      
      private var _filters:Array;
      
      public function Criteria(param1:Entity)
      {
         super();
         this._entity = param1;
         this._filters = [];
         this._sorts = [];
         this._params = {};
      }
      
      public function addLessThanCondition(param1:String, param2:String) : Criteria
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._filters.push(new LessThanCondition(_loc3_.table,_loc3_.column,param2));
         }
         return this;
      }
      
      public function addGreaterThanCondition(param1:String, param2:String) : Criteria
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._filters.push(new GreaterThanCondition(_loc3_.table,_loc3_.column,param2));
         }
         return this;
      }
      
      public function get entity() : Entity
      {
         return this._entity;
      }
      
      public function get params() : Object
      {
         return this._params;
      }
      
      public function addNotNullCondition(param1:String) : Criteria
      {
         var _loc2_:Object = this._entity.getColumn(param1);
         if(_loc2_)
         {
            this._filters.push(new NotNullCondition(_loc2_.table,_loc2_.column));
         }
         return this;
      }
      
      public function addNullCondition(param1:String) : Criteria
      {
         var _loc2_:Object = this._entity.getColumn(param1);
         if(_loc2_)
         {
            this._filters.push(new NullCondition(_loc2_.table,_loc2_.column));
         }
         return this;
      }
      
      public function addJunction(param1:Junction) : Criteria
      {
         this._filters.push(param1);
         return this;
      }
      
      public function createAndJunction() : Junction
      {
         return Junction.and(this._entity);
      }
      
      public function addNotEqualsCondition(param1:String, param2:Object) : Criteria
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._filters.push(new NotEqualsCondition(_loc3_.table,_loc3_.column,param1));
            this._params[param1] = param2;
         }
         return this;
      }
      
      public function addLikeCondition(param1:String, param2:String) : Criteria
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._filters.push(new LikeCondition(_loc3_.table,_loc3_.column,param2));
         }
         return this;
      }
      
      public function get sorts() : Array
      {
         return this._sorts;
      }
      
      public function createOrJunction() : Junction
      {
         return Junction.or(this._entity);
      }
      
      public function get filters() : Array
      {
         return this._filters;
      }
      
      public function addEqualsCondition(param1:String, param2:Object) : Criteria
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._filters.push(new EqualsCondition(_loc3_.table,_loc3_.column,param1));
            this._params[param1] = param2;
         }
         return this;
      }
      
      public function addSort(param1:String, param2:String = null) : Criteria
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._sorts.push(new Sort(_loc3_.table,_loc3_.column,param2));
         }
         return this;
      }
   }
}
