package nz.co.codec.flexorm
{
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import nz.co.codec.flexorm.metamodel.IListAssociation;
   import nz.co.codec.flexorm.metamodel.ManyToManyAssociation;
   import nz.co.codec.flexorm.metamodel.OneToManyAssociation;
   
   public class LazyList extends ArrayList
   {
       
      
      private var _idMap:Object;
      
      private var _loaded:Boolean = true;
      
      private var _em:nz.co.codec.flexorm.EntityManager;
      
      private var _a:IListAssociation;
      
      public function LazyList(param1:nz.co.codec.flexorm.EntityManager, param2:IListAssociation, param3:Object)
      {
         super();
         this._em = param1;
         this._a = param2;
         this._idMap = param3;
      }
      
      public function get loaded() : Boolean
      {
         return this._loaded;
      }
      
      public function initialise() : void
      {
         this._loaded = false;
      }
      
      override public function get source() : Array
      {
         var _loc1_:ArrayCollection = null;
         var _loc2_:ArrayCollection = null;
         if(!this._loaded)
         {
            this._loaded = true;
            if(this._a is OneToManyAssociation)
            {
               _loc1_ = this._em.loadOneToManyAssociation(OneToManyAssociation(this._a),this._idMap);
               if(_loc1_)
               {
                  super.source = _loc1_.toArray();
               }
            }
            else if(this._a is ManyToManyAssociation)
            {
               _loc2_ = this._em.loadManyToManyAssociation(ManyToManyAssociation(this._a),this._idMap);
               if(_loc2_)
               {
                  super.source = _loc2_.toArray();
               }
            }
         }
         return super.source;
      }
   }
}
