package ioService.applicationProxy
{
   import flash.utils.ByteArray;
   
   public interface CommunicationMedium
   {
       
      
      function sendData(param1:ByteArray) : void;
      
      function debugSendData(param1:int, param2:int, param3:ByteArray) : void;
   }
}
