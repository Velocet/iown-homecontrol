package mx.resources
{
   import mx.core.Singleton;
   import mx.core.mx_internal;
   
   public class ResourceManager
   {
      
      private static var implClassDependency:mx.resources.ResourceManagerImpl;
      
      private static var instance:mx.resources.IResourceManager;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ResourceManager()
      {
         super();
      }
      
      public static function getInstance() : mx.resources.IResourceManager
      {
         if(!instance)
         {
            try
            {
               instance = IResourceManager(Singleton.getInstance("mx.resources::IResourceManager"));
            }
            catch(e:Error)
            {
               instance = new mx.resources.ResourceManagerImpl();
            }
         }
         return instance;
      }
   }
}
