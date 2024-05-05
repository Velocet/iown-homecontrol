package ioService.debug
{
   public class DebugConstants
   {
      
      public static var AUTO_IO_READY:Boolean = false;
      
      public static var AUTO_STANDARDIZE_KEY:Boolean = false;
      
      public static var AUTO_LAYOUT:Boolean = false;
      
      public static var AUTO_DEBUG:Boolean = false;
      
      public static var AUTO_NEW_CUSTOMER:Boolean = false;
      
      public static var AUTO_INSTALLATION_COMPLETE:Boolean = false;
      
      public static var MODAL_POP_UP:Boolean = true;
      
      public static const AUTO_LOGIN:Boolean = false;
      
      public static var AUTO_NEW_CUSTOMER_DEFAULT_NAME:String = "Test";
      
      public static var AUTO_ASSOCIATION_ELEMENT:Boolean = false;
      
      public static const SKITTER_REFRESH_CONNECTION_EVENT:String = "skitterRefreshConnectionEvent";
       
      
      public function DebugConstants()
      {
         super();
      }
      
      public static function setModalPopUp(param1:Boolean) : void
      {
         MODAL_POP_UP = param1;
      }
   }
}
