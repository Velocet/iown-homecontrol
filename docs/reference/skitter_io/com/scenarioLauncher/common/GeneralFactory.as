package com.scenarioLauncher.common
{
   import com.scenarioLauncher.configuration.AirBundleLoader;
   
   public class GeneralFactory
   {
      
      private static var _bundleLoader:AirBundleLoader;
       
      
      public function GeneralFactory()
      {
         super();
      }
      
      public static function get bundleLoader() : AirBundleLoader
      {
         if(_bundleLoader == null)
         {
            _bundleLoader = new AirBundleLoader();
         }
         return _bundleLoader;
      }
   }
}
