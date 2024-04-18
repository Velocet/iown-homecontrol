package com.scenarioLauncher.utils
{
   import flash.net.LocalConnection;
   
   public class GB
   {
       
      
      public function GB()
      {
         super();
      }
      
      public static function triggerGC() : void
      {
         var lc1:LocalConnection = null;
         var lc2:LocalConnection = null;
         try
         {
            lc1 = new LocalConnection();
            lc2 = new LocalConnection();
            lc1.connect("gcConnection");
            lc2.connect("gcConnection");
         }
         catch(e:Error)
         {
         }
      }
   }
}
