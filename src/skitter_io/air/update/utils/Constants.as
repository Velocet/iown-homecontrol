package air.update.utils
{
   public class Constants
   {
      
      public static const STATE_FILE:String = "state.xml";
      
      public static const UPDATE_LOCAL_FILE:String = "update.air";
      
      public static const DAY_IN_MILLISECONDS:int = 86400000;
      
      private static const ERROR_INTERNAL:int = 16700;
      
      public static const ERROR_CURRENT_VERSION_INVALID:int = ERROR_INTERNAL + 7;
      
      public static const ERROR_LAUNCHED_INVALID:int = ERROR_INTERNAL + 4;
      
      public static const ERROR_FAILED_INVALID:int = ERROR_INTERNAL + 5;
      
      public static const ERROR_VERSIONS_INVALID:int = ERROR_INTERNAL + 3;
      
      public static const ERROR_PREV_VERSION_INVALID:int = ERROR_INTERNAL + 6;
      
      public static const ERROR_LAST_CHECK_MISSING:int = ERROR_INTERNAL + 1;
      
      public static const DESCRIPTOR_LOCAL_FILE:String = "update.xml";
      
      private static const ERROR_EXTERNAL:int = 16800;
      
      public static const ERROR_UCF_CORRUPT_AIR:int = ERROR_EXTERNAL + 7;
      
      public static const ERROR_SECURITY:int = ERROR_EXTERNAL + 19;
      
      public static const ERROR_UCF_INVALID_AIR_FILE:int = ERROR_EXTERNAL + 3;
      
      public static const ERROR_FILESTREAM:int = ERROR_EXTERNAL + 21;
      
      public static const ERROR_IO_DOWNLOAD:int = ERROR_EXTERNAL + 22;
      
      public static const ERROR_CONFIGURATION_UNKNOWN:int = ERROR_EXTERNAL + 11;
      
      public static const ERROR_VALIDATE:int = ERROR_EXTERNAL + 24;
      
      public static const ERROR_IO_FILE:int = ERROR_EXTERNAL + 18;
      
      public static const ERROR_DESCRIPTION_INVALID:int = ERROR_EXTERNAL + 17;
      
      public static const ERROR_UPDATE_URL_MISSING:int = ERROR_EXTERNAL + 9;
      
      public static const ERROR_NOT_NEW_VERSION:int = ERROR_EXTERNAL + 26;
      
      public static const ERROR_UCF_UNKNOWN_COMPRESSION:int = ERROR_EXTERNAL + 5;
      
      public static const ERROR_CONFIGURATION_FILE_MISSING:int = ERROR_EXTERNAL + 8;
      
      public static const ERROR_UCF_NO_MIMETYPE:int = ERROR_EXTERNAL + 2;
      
      public static const ERROR_APPLICATION_UPDATE:int = ERROR_EXTERNAL + 28;
      
      public static const ERROR_AIR_UNPACKAGING:int = ERROR_EXTERNAL;
      
      public static const ERROR_AIR_MISSING_APPLICATION_XML:int = ERROR_EXTERNAL + 1;
      
      public static const ERROR_EOF_DOWNLOAD:int = ERROR_EXTERNAL + 23;
      
      public static const UPDATER_FOLDER:String = "#ApplicationUpdater";
      
      public static const ERROR_STATE_UNKNOWN:int = ERROR_INTERNAL;
      
      public static const ERROR_INVALID_HTTP_STATUS:int = ERROR_EXTERNAL + 20;
      
      public static const ERROR_UCF_INVALID_FILENAME:int = ERROR_EXTERNAL + 6;
      
      public static const ERROR_LAST_CHECK_INVALID:int = ERROR_INTERNAL + 2;
      
      public static const ERROR_UCF_INVALID_FLAGS:int = ERROR_EXTERNAL + 4;
      
      public static const ERROR_STORAGE_INVALID:int = ERROR_INTERNAL + 8;
      
      public static const ERROR_DELAY_INVALID:int = ERROR_EXTERNAL + 13;
      
      public static const ERROR_DIFFERENT_APPLICATION_ID:int = ERROR_EXTERNAL + 25;
      
      public static const ERROR_VERSION_MISSING:int = ERROR_EXTERNAL + 16;
      
      public static const ERROR_APPLICATION_UPDATE_NO_FILE:int = ERROR_EXTERNAL + 29;
      
      public static const ERROR_UPDATE_UNKNOWN:int = ERROR_EXTERNAL + 15;
      
      public static const ERROR_VERSION_MISMATCH:int = ERROR_EXTERNAL + 27;
      
      public static const ERROR_CONFIGURATION_DESCRIPTOR:int = ERROR_EXTERNAL + 10;
      
      public static const ERROR_DEFAULTUI_INVALID:int = ERROR_EXTERNAL + 14;
      
      public static const ERROR_URL_MISSING:int = ERROR_EXTERNAL + 12;
       
      
      public function Constants()
      {
         super();
      }
   }
}
