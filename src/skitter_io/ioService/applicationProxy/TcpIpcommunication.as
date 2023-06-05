package ioService.applicationProxy
{
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class TcpIpcommunication implements CommunicationMedium
   {
      
      public static const SERVICE_PORT:int = 19209;
       
      
      private var _channel:int;
      
      private var _Data:ByteArray;
      
      private var _ReceivedDataCB:Function;
      
      private var _AsyncReceptionTimer:Timer;
      
      private var _mySocket:Socket;
      
      public function TcpIpcommunication(param1:int, param2:Function)
      {
         var channel:int = param1;
         var ReceivedDataCB:Function = param2;
         this._mySocket = new Socket();
         this._Data = new ByteArray();
         this._AsyncReceptionTimer = new Timer(1000,1);
         super();
         this._channel = channel;
         this._ReceivedDataCB = ReceivedDataCB;
         this._AsyncReceptionTimer.addEventListener(TimerEvent.TIMER,this.asyncReceptionTimerElapsed);
         try
         {
            this._mySocket.connect("localhost",SERVICE_PORT + channel);
            this._mySocket.addEventListener(ProgressEvent.SOCKET_DATA,this.mySocketDataReceivedHandler);
         }
         catch(e:Error)
         {
         }
      }
      
      private function mySocketDataReceivedHandler(param1:ProgressEvent) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this._mySocket.readBytes(_loc2_,0,this._mySocket.bytesAvailable);
         if(this._Data.length == 0)
         {
            if(this._channel == 0 && (_loc2_[0] != 0 || _loc2_[1] != 192))
            {
               _loc2_.clear();
            }
            else if(this._channel != 0)
            {
               while(_loc2_.bytesAvailable > 0 && _loc2_[_loc2_.position] != 192)
               {
                  _loc2_.readByte();
               }
               this.handleReceivedData(_loc2_);
            }
            else
            {
               this.handleReceivedData(_loc2_);
            }
         }
         else
         {
            this.handleReceivedData(_loc2_);
         }
      }
      
      public function sendData(param1:ByteArray) : void
      {
         var data:ByteArray = param1;
         try
         {
            data.position = 0;
            this._mySocket.writeBytes(data,1,data.length - 1);
            this._mySocket.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      private function handleReceivedData(param1:ByteArray) : void
      {
         var _loc2_:Boolean = false;
         this._AsyncReceptionTimer.stop();
         while(param1.bytesAvailable > 0)
         {
            if(this.addByteToData(param1.readUnsignedByte()) == true)
            {
               this._ReceivedDataCB(this._channel,this._Data);
               this._Data.clear();
               _loc2_ = false;
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(_loc2_ == true)
         {
            this._AsyncReceptionTimer.start();
         }
      }
      
      public function debugSendData(param1:int, param2:int, param3:ByteArray) : void
      {
      }
      
      private function addByteToData(param1:int) : Boolean
      {
         if(!(this._Data.length == 0 && param1 != 192))
         {
            this._Data.writeByte(param1);
         }
         if(this._Data.length > 10)
         {
            if(this._Data.length >= this._Data[1] * 256 + this._Data[2] + 2)
            {
               return true;
            }
         }
         return false;
      }
      
      private function asyncReceptionTimerElapsed(param1:Event) : void
      {
         this._Data.clear();
      }
   }
}
