package air.update.core
{
   import air.update.utils.Constants;
   import flash.utils.ByteArray;
   
   public class AIRUnpackager extends UCFUnpackager
   {
       
      
      private var _descriptorXML:XML;
      
      public function AIRUnpackager()
      {
         super();
      }
      
      public function get descriptorXML() : XML
      {
         return this._descriptorXML;
      }
      
      override protected function onFile(param1:uint, param2:String, param3:ByteArray) : Boolean
      {
         if(param1 == 0)
         {
            return true;
         }
         if(param1 == 1 && param2 != "META-INF/AIR/application.xml")
         {
            throw new Error("META-INF/AIR/application.xml must be the second file in an AIR file",Constants.ERROR_AIR_MISSING_APPLICATION_XML);
         }
         this._descriptorXML = {param3.toString()};
         return false;
      }
      
      override protected function onDone() : void
      {
         if(this._descriptorXML == null)
         {
            throw new Error("META-INF/AIR/application.xml must exists in the AIR file",Constants.ERROR_AIR_MISSING_APPLICATION_XML);
         }
      }
   }
}
