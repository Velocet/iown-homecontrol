package encrypt
{
   import flash.utils.ByteArray;
   
   public class FrameEncrypt
   {
       
      
      public function FrameEncrypt()
      {
         super();
      }
      
      public static function Debug(param1:ByteArray) : void
      {
         var _loc3_:Number = 0;
         var _loc2_:* = new String();
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_];
            _loc2_ += " ";
            _loc3_++;
         }
         trace(_loc2_);
      }
      
      public static function Decrypt(param1:Object) : void
      {
         var _loc3_:Number = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc2_:ByteArray = new ByteArray();
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:ByteArray = new ByteArray();
         var _loc7_:Rinjdael = new Rinjdael();
         _loc8_ = param1.Frame[0] * 256 + param1.Frame[1] - 5;
         _loc9_ = uint(param1.Frame[5]);
         _loc2_.writeBytes(param1.Frame,0,5);
         _loc3_ = 0;
         while(_loc3_ < Rinjdael.SIZE_OF_VECTOR)
         {
            _loc4_.writeByte(param1.Frame[5 + _loc3_]);
            _loc3_++;
         }
         _loc7_.FillInputVectorRaw(_loc4_,Rinjdael.SIZE_OF_VECTOR);
         _loc3_ = 0;
         while(_loc3_ < uint(_loc8_ / 0) - 1)
         {
            _loc5_.clear();
            _loc5_.writeBytes(param1.Frame,5 + (_loc3_ + 1) * 0,Rinjdael.SIZE_OF_VECTOR);
            _loc6_ = _loc7_.EncryptAndXOR(_loc5_);
            _loc2_.writeBytes(_loc6_,0,Rinjdael.SIZE_OF_VECTOR);
            _loc7_.FillInputVectorRaw(_loc6_,Rinjdael.SIZE_OF_VECTOR);
            _loc3_++;
         }
         _loc2_.position = 0;
         _loc2_.writeShort(_loc2_.length - _loc9_);
         param1.Frame.clear();
         param1.Frame.writeBytes(_loc2_,0,_loc2_.length - _loc9_);
      }
      
      public static function Encrypt(param1:Object) : void
      {
         var _loc3_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc2_:ByteArray = new ByteArray();
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:ByteArray = new ByteArray();
         var _loc7_:Rinjdael = new Rinjdael();
         _loc8_ = param1.Frame[0] * 256 + param1.Frame[1] - 7;
         _loc9_ = 0 - _loc8_ % 0;
         _loc2_.writeBytes(param1.Frame,0,5);
         _loc4_.writeByte(_loc9_);
         _loc3_ = 1;
         while(_loc3_ < Rinjdael.SIZE_OF_VECTOR)
         {
            _loc4_.writeByte(uint(Math.floor(256 * Math.random())) & 255);
            _loc3_++;
         }
         _loc2_.writeBytes(_loc4_,0,Rinjdael.SIZE_OF_VECTOR);
         _loc7_.FillInputVectorRaw(_loc4_,Rinjdael.SIZE_OF_VECTOR);
         _loc3_ = 0;
         while(_loc3_ < uint(_loc8_ / 0))
         {
            _loc5_.clear();
            _loc5_.writeBytes(param1.Frame,5 + _loc3_ * 0,Rinjdael.SIZE_OF_VECTOR);
            _loc6_ = _loc7_.EncryptAndXOR(_loc5_);
            _loc2_.writeBytes(_loc6_,0,Rinjdael.SIZE_OF_VECTOR);
            _loc7_.FillInputVectorRaw(_loc5_,Rinjdael.SIZE_OF_VECTOR);
            _loc3_++;
         }
         if(_loc9_ != 0)
         {
            _loc5_.clear();
            _loc5_.writeBytes(param1.Frame,5 + _loc3_ * 0,0 - _loc9_);
            _loc3_ = 0 - _loc9_;
            while(_loc3_ < Rinjdael.SIZE_OF_VECTOR)
            {
               _loc5_.writeByte(Rinjdael.PADDING_VALUE);
               _loc3_++;
            }
            _loc6_ = _loc7_.EncryptAndXOR(_loc5_);
            _loc2_.writeBytes(_loc6_,0,Rinjdael.SIZE_OF_VECTOR);
         }
         _loc2_.position = 0;
         _loc2_.writeShort(_loc2_.length);
         _loc2_.position = _loc2_.length;
         param1.Frame = _loc2_;
      }
   }
}
