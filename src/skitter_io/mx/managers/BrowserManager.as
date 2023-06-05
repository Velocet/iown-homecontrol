package mx.managers
{
   import mx.core.Singleton;
   import mx.core.mx_internal;
   
   public class BrowserManager
   {
      
      private static var implClassDependency:mx.managers.BrowserManagerImpl;
      
      private static var instance:mx.managers.IBrowserManager;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function BrowserManager()
      {
         super();
      }
      
      public static function getInstance() : mx.managers.IBrowserManager
      {
         if(!instance)
         {
            instance = IBrowserManager(Singleton.getInstance("mx.managers::IBrowserManager"));
         }
         return instance;
      }
   }
}
