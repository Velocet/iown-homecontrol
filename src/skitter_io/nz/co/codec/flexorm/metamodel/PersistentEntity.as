package nz.co.codec.flexorm.metamodel
{
   import nz.co.codec.flexorm.EntityManager;
   
   public dynamic class PersistentEntity
   {
      
      private static var em:EntityManager = EntityManager.instance;
      
      {
         prototype.save = function():void
         {
            em.save(this);
         };
         prototype.remove = function():void
         {
            em.remove(this);
         };
      }
      
      public function PersistentEntity()
      {
         super();
      }
   }
}
