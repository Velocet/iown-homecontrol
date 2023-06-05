package mx.messaging.messages
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.getQualifiedClassName;
   import mx.core.mx_internal;
   import mx.utils.RPCObjectUtil;
   import mx.utils.RPCStringUtil;
   import mx.utils.RPCUIDUtil;
   
   public class AbstractMessage implements IMessage
   {
      
      public static const FLEX_CLIENT_ID_HEADER:String = "DSId";
      
      private static const MESSAGE_ID_FLAG:uint = 16;
      
      public static const PRIORITY_HEADER:String = "DSPriority";
      
      private static const TIME_TO_LIVE_FLAG:uint = 64;
      
      private static const TIMESTAMP_FLAG:uint = 32;
      
      private static const CLIENT_ID_BYTES_FLAG:uint = 1;
      
      public static const REQUEST_TIMEOUT_HEADER:String = "DSRequestTimeout";
      
      private static const DESTINATION_FLAG:uint = 4;
      
      public static const STATUS_CODE_HEADER:String = "DSStatusCode";
      
      private static const CLIENT_ID_FLAG:uint = 2;
      
      private static const HEADERS_FLAG:uint = 8;
      
      private static const BODY_FLAG:uint = 1;
      
      public static const REMOTE_CREDENTIALS_CHARSET_HEADER:String = "DSRemoteCredentialsCharset";
      
      private static const MESSAGE_ID_BYTES_FLAG:uint = 2;
      
      public static const DESTINATION_CLIENT_ID_HEADER:String = "DSDstClientId";
      
      public static const REMOTE_CREDENTIALS_HEADER:String = "DSRemoteCredentials";
      
      private static const HAS_NEXT_FLAG:uint = 128;
      
      public static const ENDPOINT_HEADER:String = "DSEndpoint";
       
      
      private var _body:Object;
      
      private var _messageId:String;
      
      private var messageIdBytes:ByteArray;
      
      private var _timestamp:Number = 0;
      
      private var _clientId:String;
      
      private var clientIdBytes:ByteArray;
      
      private var _headers:Object;
      
      private var _destination:String = "";
      
      private var _timeToLive:Number = 0;
      
      public function AbstractMessage()
      {
         _body = {};
         super();
      }
      
      public function set messageId(param1:String) : void
      {
         _messageId = param1;
         messageIdBytes = null;
      }
      
      public function get headers() : Object
      {
         if(_headers == null)
         {
            _headers = {};
         }
         return _headers;
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         var _loc5_:Number = 0;
         var _loc6_:* = 0;
         var _loc2_:Array = readFlags(param1);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_] as uint;
            _loc5_ = 0;
            if(_loc3_ == 0)
            {
               if((_loc4_ & BODY_FLAG) != 0)
               {
                  body = param1.readObject();
               }
               else
               {
                  body = null;
               }
               if((_loc4_ & CLIENT_ID_FLAG) != 0)
               {
                  clientId = param1.readObject();
               }
               if((_loc4_ & DESTINATION_FLAG) != 0)
               {
                  destination = param1.readObject() as String;
               }
               if((_loc4_ & HEADERS_FLAG) != 0)
               {
                  headers = param1.readObject();
               }
               if((_loc4_ & MESSAGE_ID_FLAG) != 0)
               {
                  messageId = param1.readObject() as String;
               }
               if((_loc4_ & TIMESTAMP_FLAG) != 0)
               {
                  timestamp = param1.readObject() as Number;
               }
               if((_loc4_ & TIME_TO_LIVE_FLAG) != 0)
               {
                  timeToLive = param1.readObject() as Number;
               }
               _loc5_ = 7;
            }
            else if(_loc3_ == 1)
            {
               if((_loc4_ & CLIENT_ID_BYTES_FLAG) != 0)
               {
                  clientIdBytes = param1.readObject() as ByteArray;
                  clientId = RPCUIDUtil.fromByteArray(clientIdBytes);
               }
               if((_loc4_ & MESSAGE_ID_BYTES_FLAG) != 0)
               {
                  messageIdBytes = param1.readObject() as ByteArray;
                  messageId = RPCUIDUtil.fromByteArray(messageIdBytes);
               }
               _loc5_ = 2;
            }
            if(_loc4_ >> _loc5_ != 0)
            {
               _loc6_ = _loc5_;
               while(_loc6_ < 6)
               {
                  if((_loc4_ >> _loc6_ & 1) != 0)
                  {
                     param1.readObject();
                  }
                  _loc6_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function get messageId() : String
      {
         if(_messageId == null)
         {
            _messageId = RPCUIDUtil.createUID();
         }
         return _messageId;
      }
      
      public function set clientId(param1:String) : void
      {
         _clientId = param1;
         clientIdBytes = null;
      }
      
      public function get destination() : String
      {
         return _destination;
      }
      
      public function get timestamp() : Number
      {
         return _timestamp;
      }
      
      protected function readFlags(param1:IDataInput) : Array
      {
         var _loc4_:* = 0;
         var _loc2_:Boolean = true;
         var _loc3_:* = [];
         while(_loc2_ && param1.bytesAvailable > 0)
         {
            _loc4_ = uint(param1.readUnsignedByte());
            _loc3_.push(_loc4_);
            if((_loc4_ & HAS_NEXT_FLAG) != 0)
            {
               _loc2_ = true;
            }
            else
            {
               _loc2_ = false;
            }
         }
         return _loc3_;
      }
      
      public function set headers(param1:Object) : void
      {
         _headers = param1;
      }
      
      public function get body() : Object
      {
         return _body;
      }
      
      public function set destination(param1:String) : void
      {
         _destination = param1;
      }
      
      public function set timestamp(param1:Number) : void
      {
         _timestamp = param1;
      }
      
      protected function addDebugAttributes(param1:Object) : void
      {
         param1["body"] = body;
         param1["clientId"] = clientId;
         param1["destination"] = destination;
         param1["headers"] = headers;
         param1["messageId"] = messageId;
         param1["timestamp"] = timestamp;
         param1["timeToLive"] = timeToLive;
      }
      
      public function get timeToLive() : Number
      {
         return _timeToLive;
      }
      
      public function set body(param1:Object) : void
      {
         _body = param1;
      }
      
      public function get clientId() : String
      {
         return _clientId;
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         var _loc2_:* = 0;
         var _loc3_:String = messageId;
         if(clientIdBytes == null)
         {
            clientIdBytes = RPCUIDUtil.toByteArray(_clientId);
         }
         if(messageIdBytes == null)
         {
            messageIdBytes = RPCUIDUtil.toByteArray(_messageId);
         }
         if(body != null)
         {
            _loc2_ |= BODY_FLAG;
         }
         if(clientId != null && clientIdBytes == null)
         {
            _loc2_ |= CLIENT_ID_FLAG;
         }
         if(destination != null)
         {
            _loc2_ |= DESTINATION_FLAG;
         }
         if(headers != null)
         {
            _loc2_ |= HEADERS_FLAG;
         }
         if(messageId != null && messageIdBytes == null)
         {
            _loc2_ |= MESSAGE_ID_FLAG;
         }
         if(timestamp != 0)
         {
            _loc2_ |= TIMESTAMP_FLAG;
         }
         if(timeToLive != 0)
         {
            _loc2_ |= TIME_TO_LIVE_FLAG;
         }
         if(clientIdBytes != null || messageIdBytes != null)
         {
            _loc2_ |= HAS_NEXT_FLAG;
         }
         param1.writeByte(_loc2_);
         _loc2_ = 0;
         if(clientIdBytes != null)
         {
            _loc2_ |= CLIENT_ID_BYTES_FLAG;
         }
         if(messageIdBytes != null)
         {
            _loc2_ |= MESSAGE_ID_BYTES_FLAG;
         }
         if(_loc2_ != 0)
         {
            param1.writeByte(_loc2_);
         }
         if(body != null)
         {
            param1.writeObject(body);
         }
         if(clientId != null && clientIdBytes == null)
         {
            param1.writeObject(clientId);
         }
         if(destination != null)
         {
            param1.writeObject(destination);
         }
         if(headers != null)
         {
            param1.writeObject(headers);
         }
         if(messageId != null && messageIdBytes == null)
         {
            param1.writeObject(messageId);
         }
         if(timestamp != 0)
         {
            param1.writeObject(timestamp);
         }
         if(timeToLive != 0)
         {
            param1.writeObject(timeToLive);
         }
         if(clientIdBytes != null)
         {
            param1.writeObject(clientIdBytes);
         }
         if(messageIdBytes != null)
         {
            param1.writeObject(messageIdBytes);
         }
      }
      
      final protected function getDebugString() : String
      {
         var _loc4_:String = null;
         var _loc5_:Number = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc1_:* = "(" + getQualifiedClassName(this) + ")";
         var _loc2_:* = {};
         addDebugAttributes(_loc2_);
         var _loc3_:* = [];
         for(_loc4_ in _loc2_)
         {
            _loc3_.push(_loc4_);
         }
         _loc3_.sort();
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = String(_loc3_[_loc5_]);
            _loc7_ = RPCObjectUtil.toString(_loc2_[_loc6_]);
            _loc1_ += RPCStringUtil.substitute("\n  {0}={1}",_loc6_,_loc7_);
            _loc5_++;
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         return RPCObjectUtil.toString(this);
      }
      
      public function set timeToLive(param1:Number) : void
      {
         _timeToLive = param1;
      }
   }
}
