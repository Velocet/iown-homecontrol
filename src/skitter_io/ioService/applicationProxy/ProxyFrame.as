package ioService.applicationProxy
{
   import encrypt.FrameEncrypt;
   import flash.utils.ByteArray;
   import ioService.utils.Converter;
   
   public class ProxyFrame
   {
      
      public static const COMMAND_UPGRADE__WRITE_PAGE_ACK:int = 88;
      
      public static const COMMAND_UC_ID__PAIR_NEW_EQUIPMENT:int = 5;
      
      public static const COMMAND_TYPE__START_UC_ACK:int = 1;
      
      public static const COMMAND_SERVICE_STATUS_ID__DEVICES_DETECTION_FINISHED:int = 2;
      
      public static const COMMAND_SYNC_ID__END_OF_READ_OBJECTS:int = 4;
      
      public static const DATA_FORMAT__BINARY:int = 0;
      
      public static const FRAME__HEADER_POSITION:int = 0;
      
      public static const COMMAND_UPGRADE__STATUS_KO:int = 0;
      
      public static const COMMAND_TYPE__BOOT_LOADER:int = 224;
      
      public static const COMMAND_UPGRADE__START_APPLICATION_ACK:int = 84;
      
      public static const UC_STATUS__INTERMEDIATE_DATA_BEACON:int = Synchronizer.SYNC_OBJ__BEACON;
      
      public static const COMMAND_SYNC_ID__ERASE_ALL_OBJECTS:int = 3;
      
      public static const ENCRYPTION__ALREADY_ENCRYPTED:int = 2;
      
      public static const COMMAND_ABORT_UC_ID__TIMEOUT_ABORT:int = 1;
      
      public static const COMMAND_UPGRADE__ERASE_PAGE_ACK:int = 70;
      
      public static const COMMAND_SERVICE_ID__GIVE_CONNECTED_DEVICES:int = 2;
      
      public static const COMMAND_TYPE__SERVICE_STATUS_ACK:int = 243;
      
      public static const FRAME__COMMAND_DATA_POSITION:int = 8;
      
      public static const START_UC_STATUS__ERROR:int = 1;
      
      public static const FRAME__DATA_FORMAT_POSITION:int = 4;
      
      public static const COMMAND_SERVICE_ID__GIVE_VERSION:int = 0;
      
      public static const COMMAND_TYPE__ABORT_UC:int = 4;
      
      public static const COMMAND_TYPE__SYNCHRONIZATION:int = 6;
      
      public static const COMMAND_TYPE__UC_STATUS:int = 2;
      
      public static const FRAME__ENCRYPTION_POSITION:int = 3;
      
      public static const COMMAND_UC_ID__PAIR_EQUIPMENT_STIMULATED_BY_1W:int = 6;
      
      public static const UC_STATUS__INTERMEDIATE_DATA_SCD:int = Synchronizer.SYNC_OBJ__SCD;
      
      public static const COMMAND_UC_ID__PAIR_EQUIPMENT_IN_SYSTEM:int = 4;
      
      public static const COMMAND_ABORT_UC_ID__USER_ABORT:int = 0;
      
      public static const COMMAND_SYNC_ID__READ_SYSTEM_DESCRIPTION:int = 0;
      
      public static const DATA_FORMAT__XML:int = 2;
      
      public static const UC_STATUS__INTERMEDIATE_DATA_ACTUATOR:int = Synchronizer.SYNC_OBJ__ACTUATOR;
      
      public static const COMMAND_UC_ID__GENERATE_NEW_KEY:int = 2;
      
      public static const UC_STATUS__STATUS_ENDED:int = 0;
      
      public static const UC_STATUS__STATUS_INTERMEDIATE:int = 1;
      
      public static const COMMAND_TYPE__ABORT_UC_ACK:int = 5;
      
      public static const COMMAND_UPGRADE__START_FIRMWARE_UPGRADER:int = 0;
      
      public static const UC_STATUS__INTERMEDIATE_DATA_POSITION:int = 2;
      
      public static const UC_STATUS__INTERMEDIATE_DATA_TYPE_POSITION:int = 1;
      
      public static const COMMAND_TYPE__UC_STATUS_ACK:int = 3;
      
      public static const COMMAND_UPGRADE__STATUS_OK:int = 255;
      
      public static const COMMAND_UPGRADE__IDENTIFY_ACK:int = 74;
      
      public static const UC_STATUS__STATUS_USER_ABORT:int = 4;
      
      public static const COMMAND_UPGRADE__ERASE_PAGE:int = 69;
      
      public static const COMMAND_UC_ID__GET_ACTUATOR_NAME:int = 7;
      
      public static const COMMAND_TYPE__SERVICE_STATUS:int = 242;
      
      public static const COMMAND_UC_ID__IDENTIFY_ACTUATOR:int = 10;
      
      public static const UC_STATUS__STATUS_TIMEOUT:int = 3;
      
      public static const COMMAND_SYNC_ID__WRITE_OBJECT:int = 2;
      
      public static const UC_STATUS__STATUS_POSITION:int = 0;
      
      public static const COMMAND_UC_ID__SET_ACTUATOR_NAME:int = 8;
      
      public static const COMMAND_SERVICE_ID__SUBSCRIBE_PRODUCT:int = 1;
      
      public static const COMMAND_UC_ID__START_THIS_SCENARIO:int = 11;
      
      public static const COMMAND_TYPE__SERVICE:int = 240;
      
      public static const COMMAND_SERVICE_STATUS_ID__DEVICE_DISCONNECTED:int = 1;
      
      public static const ENCRYPTION__NO:int = 0;
      
      public static const FRAME__COMMAND_ID_POSITION:int = 7;
      
      public static const FRAME__COMMAND_TYPE_POSITION:int = 6;
      
      public static const COMMAND_UC_ID__GET_ACTUATOR_POSITION:int = 9;
      
      public static const FRAME__ERROR_STATUS_POSITION:int = 5;
      
      public static const ERROR_STATUS__NO_ERROR:int = 0;
      
      public static const COMMAND_TYPE__BOOT_LOADER_ACK:int = 225;
      
      public static const UC_STATUS__STATUS_ERROR:int = 2;
      
      public static const ERROR_STATUS__ERROR:int = 0;
      
      public static const COMMAND_UC_ID__RESTORE_FACTORY_SETTINGS:int = 13;
      
      public static const ENCRYPTION__RIJNDAEL:int = 1;
      
      public static const DATA_FORMAT__BINARY_XML:int = 1;
      
      public static const START_UC_STATUS__OK:int = 0;
      
      public static const COMMAND_UC_ID__GIVE_KEY_TO_ANOTHER_2W_CONTROLLER:int = 3;
      
      public static const COMMAND_TYPE__SERVICE_ACK:int = 241;
      
      public static const COMMAND_UPGRADE__WRITE_PAGE:int = 87;
      
      public static const COMMAND_UC_ID__GET_2W_KEY_FROM_CONTROLLER:int = 1;
      
      public static const COMMAND_TYPE__START_UC:int = 0;
      
      public static const FRAME__SIZE_POSITION:int = 1;
      
      public static const COMMAND_SYNC_ID__END_OF_WRITE_OBJECTS:int = 5;
      
      public static const COMMAND_SYNC_ID__READ_OBJECT:int = 1;
      
      public static const COMMAND_UC_ID__START_BOOTLOADER:int = 0;
      
      public static const COMMAND_UPGRADE__IDENTIFY:int = 73;
      
      public static const COMMAND_UPGRADE__START_APPLICATION:int = 81;
      
      public static const COMMAND_SERVICE_STATUS_ID__DEVICE_CONNECTED:int = 0;
      
      public static const COMMAND_UC_ID__STOP_ALL_ACTUATORS_MOVEMENT:int = 12;
      
      public static const COMMAND_TYPE__SYNCHRONIZATION_ACK:int = 7;
       
      
      private var _DataFormat:int = 0;
      
      private var _Encryption:int = 0;
      
      private var _CommandType:int = 0;
      
      private var _CommandId:int = 0;
      
      private var _ErrorStatus:int = 0;
      
      private var _CommandData:ByteArray;
      
      public function ProxyFrame()
      {
         this._CommandData = new ByteArray();
         super();
      }
      
      public function getDataSize() : int
      {
         return this._CommandData.length;
      }
      
      public function get CommandType() : int
      {
         return this._CommandType;
      }
      
      public function set DataFormat(param1:int) : void
      {
         this._DataFormat = param1;
      }
      
      public function set CommandType(param1:int) : void
      {
         this._CommandType = param1;
      }
      
      public function addIntToData(param1:uint) : void
      {
         this._CommandData.writeUnsignedInt(param1);
      }
      
      public function set Encryption(param1:int) : void
      {
         this._Encryption = param1;
      }
      
      public function addShortToData(param1:int) : void
      {
         this._CommandData.writeShort(param1);
      }
      
      public function addByteToData(param1:int) : void
      {
         this._CommandData.writeByte(param1);
      }
      
      public function getDataCurrentPosition() : int
      {
         return this._CommandData.position;
      }
      
      public function getByteFromData() : int
      {
         return this._CommandData.readUnsignedByte();
      }
      
      public function set CommandId(param1:int) : void
      {
         this._CommandId = param1;
      }
      
      public function getIntFromData() : uint
      {
         return this._CommandData.readUnsignedInt();
      }
      
      public function addHexaStringToData(param1:String, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc3_:String = new String();
         var _loc4_:Converter = new Converter();
         if(param1 != null)
         {
            if(param1.length % 2 == 0)
            {
               _loc5_ = 0;
               while(_loc5_ < param2)
               {
                  _loc3_ = param1.substr(_loc5_ * 2,2);
                  this._CommandData.writeByte(_loc4_.hexaStringToByte(_loc3_));
                  _loc5_++;
               }
            }
         }
      }
      
      public function setDataCurrentPosition(param1:int) : void
      {
         this._CommandData.position = param1;
      }
      
      public function addBooleanToData(param1:Boolean) : void
      {
         this._CommandData.writeBoolean(param1);
      }
      
      public function getShortFromData() : int
      {
         return this._CommandData.readUnsignedShort();
      }
      
      public function getIoAddressFromData() : String
      {
         var _loc1_:Converter = new Converter();
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(this._CommandData.readUnsignedByte());
         _loc2_.writeByte(this._CommandData.readUnsignedByte());
         _loc2_.writeByte(this._CommandData.readUnsignedByte());
         return _loc1_.ioAddressToString(_loc2_);
      }
      
      public function getBooleanFromData() : Boolean
      {
         return this._CommandData.readBoolean();
      }
      
      public function getHexaStringToData(param1:int) : String
      {
         var _loc2_:String = new String();
         var _loc3_:Converter = new Converter();
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc2_ += _loc3_.byteToHexaString(this._CommandData.readUnsignedByte());
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function get DataFormat() : int
      {
         return this._DataFormat;
      }
      
      public function getStringFromData(param1:int) : String
      {
         return this._CommandData.readUTFBytes(param1);
      }
      
      public function get Encryption() : int
      {
         return this._Encryption;
      }
      
      public function get CommandId() : int
      {
         return this._CommandId;
      }
      
      public function set CommandData(param1:ByteArray) : void
      {
         this._CommandData = param1;
      }
      
      public function getByteFromDataAtIndex(param1:int) : int
      {
         return this._CommandData[param1];
      }
      
      public function SerializedData() : ByteArray
      {
         var _loc4_:Object = null;
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:ByteArray = new ByteArray();
         _loc1_.writeShort(0);
         if(this._Encryption == ENCRYPTION__ALREADY_ENCRYPTED)
         {
            _loc1_.writeByte(ENCRYPTION__RIJNDAEL);
            _loc1_.writeByte(DATA_FORMAT__BINARY);
            _loc1_.writeByte(ERROR_STATUS__NO_ERROR);
            this._CommandData.position = 0;
            _loc1_.writeBytes(this._CommandData,0,this._CommandData.length);
         }
         else
         {
            _loc1_.writeByte(this._Encryption);
            _loc1_.writeByte(this._DataFormat);
            _loc1_.writeByte(this._ErrorStatus);
            _loc1_.writeByte(this._CommandType);
            _loc1_.writeByte(this._CommandId);
            this._CommandData.position = 0;
            _loc1_.writeBytes(this._CommandData,0,this._CommandData.length);
         }
         _loc1_.position = 0;
         _loc1_.writeShort(_loc1_.length + 2);
         _loc1_.position = _loc1_.length;
         if(this._Encryption == ENCRYPTION__RIJNDAEL)
         {
            _loc4_ = {"Frame":_loc1_};
            FrameEncrypt.Encrypt(_loc4_);
            _loc1_ = _loc4_.Frame;
         }
         var _loc3_:CRC16 = new CRC16();
         _loc3_.reset();
         _loc3_.update(_loc1_);
         _loc1_.writeShort(_loc3_.getValue());
         _loc1_.position = 0;
         _loc1_.writeShort(_loc1_.length);
         _loc1_.position = _loc1_.length;
         _loc2_.writeByte(192);
         _loc2_.writeBytes(_loc1_,0,_loc1_.length);
         _loc2_.writeByte(192);
         return _loc2_;
      }
      
      public function addStringToIsoLatin1Data(param1:String, param2:int) : uint
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         if(param1.length > param2)
         {
            param1[param2] = 0;
         }
         _loc3_ = int(this._CommandData.length);
         this._CommandData.writeMultiByte(param1,"iso-8859-1");
         _loc4_ = uint(this._CommandData.length - _loc3_);
         var _loc5_:int = param1.length;
         while(_loc5_ < param2)
         {
            this._CommandData.writeByte(0);
            _loc4_++;
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function Fill(param1:ByteArray = null) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:CRC16 = null;
         var _loc6_:ByteArray = null;
         var _loc7_:ByteArray = null;
         var _loc8_:Object = null;
         _loc2_ = int(param1[FRAME__HEADER_POSITION]);
         if(_loc2_ == 192 && param1.length > 10)
         {
            _loc3_ = param1[FRAME__SIZE_POSITION] * 256 + param1[FRAME__SIZE_POSITION + 1];
            if(_loc3_ <= param1.length - 2)
            {
               if((_loc4_ = int(param1[_loc3_ + 1])) == 192)
               {
                  _loc5_ = new CRC16();
                  (_loc6_ = new ByteArray()).writeBytes(param1,1,param1.length - 4);
                  _loc5_.reset();
                  _loc5_.update(_loc6_);
                  param1.position = param1.length - 3;
                  if(_loc5_.getValue() == param1.readUnsignedShort())
                  {
                     if(param1[FRAME__ENCRYPTION_POSITION] == ENCRYPTION__RIJNDAEL)
                     {
                        (_loc7_ = new ByteArray()).writeBytes(param1,FRAME__SIZE_POSITION,param1.length - 4);
                        _loc7_.position = 0;
                        _loc7_.writeShort(_loc3_ - 2);
                        _loc8_ = {"Frame":_loc7_};
                        FrameEncrypt.Decrypt(_loc8_);
                        param1.position = FRAME__SIZE_POSITION;
                        param1.writeBytes(_loc8_.Frame,0,_loc8_.Frame.length);
                        _loc3_ = param1[FRAME__SIZE_POSITION] * 256 + param1[FRAME__SIZE_POSITION + 1];
                     }
                     this._DataFormat = param1[FRAME__DATA_FORMAT_POSITION];
                     this._Encryption = param1[FRAME__ENCRYPTION_POSITION];
                     this._ErrorStatus = param1[FRAME__ERROR_STATUS_POSITION];
                     this._CommandType = param1[FRAME__COMMAND_TYPE_POSITION];
                     this._CommandId = param1[FRAME__COMMAND_ID_POSITION];
                     this._CommandData.writeBytes(param1,FRAME__COMMAND_DATA_POSITION,_loc3_ - 7);
                     return true;
                  }
                  return false;
               }
               return false;
            }
            return false;
         }
         return false;
      }
      
      public function set ErrorStatus(param1:int) : void
      {
         this._ErrorStatus = param1;
      }
      
      public function get CommandData() : ByteArray
      {
         return this._CommandData;
      }
      
      public function addStringToData(param1:String, param2:int) : uint
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         if(param1.length > param2)
         {
            param1[param2] = 0;
         }
         _loc3_ = int(this._CommandData.length);
         this._CommandData.writeUTFBytes(param1);
         _loc4_ = uint(this._CommandData.length - _loc3_);
         var _loc5_:int = param1.length;
         while(_loc5_ < param2)
         {
            this._CommandData.writeByte(0);
            _loc4_++;
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function addIoAddressToData(param1:String) : void
      {
         var _loc3_:ByteArray = null;
         var _loc2_:Converter = new Converter();
         _loc3_ = _loc2_.stringToIoAddress(param1);
         this._CommandData.writeByte(_loc3_[0]);
         this._CommandData.writeByte(_loc3_[1]);
         this._CommandData.writeByte(_loc3_[2]);
      }
      
      public function get ErrorStatus() : int
      {
         return this._ErrorStatus;
      }
   }
}
