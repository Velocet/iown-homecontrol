package nz.co.codec.flexorm.metamodel
{
   import nz.co.codec.flexorm.CascadeType;
   
   public class Association
   {
       
      
      private var _cascadeType:String;
      
      public var hierarchical:Boolean;
      
      public var property:String;
      
      private var _associatedEntity:nz.co.codec.flexorm.metamodel.Entity;
      
      public var inverse:Boolean = false;
      
      public var constrain:Boolean;
      
      public var fkProperty:String;
      
      public var fkColumn:String;
      
      private var _ownerEntity:nz.co.codec.flexorm.metamodel.Entity;
      
      public function Association(param1:Object = null)
      {
         var _loc2_:String = null;
         super();
         this._cascadeType = CascadeType.SAVE_UPDATE;
         for(_loc2_ in param1)
         {
            if(hasOwnProperty(_loc2_))
            {
               this[_loc2_] = param1[_loc2_];
            }
         }
      }
      
      public function get associatedEntity() : nz.co.codec.flexorm.metamodel.Entity
      {
         return this._associatedEntity;
      }
      
      public function get cascadeType() : String
      {
         return this._cascadeType;
      }
      
      public function set associatedEntity(param1:nz.co.codec.flexorm.metamodel.Entity) : void
      {
         this._associatedEntity = param1;
      }
      
      public function set cascadeType(param1:String) : void
      {
         if(Boolean(param1) && param1.length > 0)
         {
            this._cascadeType = param1;
         }
      }
      
      public function set ownerEntity(param1:nz.co.codec.flexorm.metamodel.Entity) : void
      {
         this._ownerEntity = param1;
      }
      
      public function get ownerEntity() : nz.co.codec.flexorm.metamodel.Entity
      {
         return this._ownerEntity;
      }
   }
}
