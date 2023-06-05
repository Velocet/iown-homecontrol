package mx.managers
{
   import mx.core.Singleton;
   import mx.core.mx_internal;
   
   public class HistoryManager
   {
      
      private static var implClassDependency:mx.managers.HistoryManagerImpl;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var _impl:mx.managers.IHistoryManager;
       
      
      public function HistoryManager()
      {
         super();
      }
      
      public static function save() : void
      {
         impl.save();
      }
      
      private static function get impl() : mx.managers.IHistoryManager
      {
         if(!_impl)
         {
            _impl = IHistoryManager(Singleton.getInstance("mx.managers::IHistoryManager"));
         }
         return _impl;
      }
      
      public static function register(param1:IHistoryManagerClient) : void
      {
         impl.register(param1);
      }
      
      public static function unregister(param1:IHistoryManagerClient) : void
      {
         impl.unregister(param1);
      }
      
      public static function initialize(param1:ISystemManager) : void
      {
      }
   }
}
