package ioService.applicationProxy
{
   import flash.utils.ByteArray;
   import ioService.debug.DebugTrace;
   
   public class CommunicationGateway
   {
      
      public static const CHANNEL__WINDOWS_SERVICE:int = 0;
      
      public static const CHANNEL__FIRST_PRODUCT_SIMULATION:int = 250;
      
      public static const CHANNEL__FIRST_PRODUCT:int = 1;
       
      
      private var _ServiceCommunication:ioService.applicationProxy.TcpIpcommunication;
      
      private var _receivedProxyFrameCB:Function;
      
      private var _errorCB:Function;
      
      private var _Device1:ioService.applicationProxy.TcpIpcommunication;
      
      private var _Device3:ioService.applicationProxy.TcpIpcommunication;
      
      private var _acknowledgeCB:Function;
      
      private var _Device2:ioService.applicationProxy.TcpIpcommunication;
      
      private var _Device4:ioService.applicationProxy.TcpIpcommunication;
      
      public function CommunicationGateway()
      {
         super();
         this._ServiceCommunication = new ioService.applicationProxy.TcpIpcommunication(0,this.dataReceived);
         this._Device1 = new ioService.applicationProxy.TcpIpcommunication(CHANNEL__FIRST_PRODUCT,this.dataReceived);
         this._Device2 = new ioService.applicationProxy.TcpIpcommunication(CHANNEL__FIRST_PRODUCT + 1,this.dataReceived);
         this._Device3 = new ioService.applicationProxy.TcpIpcommunication(CHANNEL__FIRST_PRODUCT + 2,this.dataReceived);
         this._Device4 = new ioService.applicationProxy.TcpIpcommunication(CHANNEL__FIRST_PRODUCT + 3,this.dataReceived);
      }
      
      public function SendProxyFrame(param1:int, param2:ProxyFrame) : void
      {
         var _loc4_:ByteArray = null;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         (_loc4_ = param2.SerializedData()).position = 0;
         _loc3_.writeBytes(_loc4_,0,_loc4_.length);
         switch(param1)
         {
            case 0:
               this._ServiceCommunication.sendData(_loc3_);
               break;
            case 1:
               this._Device1.sendData(_loc3_);
               break;
            case 2:
               this._Device2.sendData(_loc3_);
               break;
            case 3:
               this._Device3.sendData(_loc3_);
               break;
            case 4:
               this._Device4.sendData(_loc3_);
         }
      }
      
      public function SetupCallBacks(param1:Function = null, param2:Function = null) : void
      {
         this._receivedProxyFrameCB = param1;
         this._errorCB = param2;
      }
      
      private function dataReceived(param1:int, param2:ByteArray) : void
      {
         var _loc3_:ProxyFrame = new ProxyFrame();
         param2.position = 0;
         if(_loc3_.Fill(param2))
         {
            this._receivedProxyFrameCB(param1,_loc3_);
         }
         else
         {
            DebugTrace.Tracer("Trame Incomplete",100);
         }
      }
   }
}
