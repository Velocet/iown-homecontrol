package encrypt
{
   import flash.utils.ByteArray;
   
   public class Rinjdael
   {
      
      public static const PADDING_VALUE:uint = 85;
      
      private static const NB:uint = 4;
      
      private static const NB_OF_ROUNDS:uint = 10;
      
      private static const NK:uint = 4;
      
      public static const SIZE_OF_VECTOR:uint = 16;
       
      
      private var Rinjdael_abtTransferKey:ByteArray;
      
      private var RCON_init:Array;
      
      private var Rinjdael_btRconIndex:uint;
      
      private var STATE:ByteArray;
      
      private var KEY_ROUND:ByteArray;
      
      private var SBOX_init:Array;
      
      private var SBOX:ByteArray;
      
      private var Rinjdael_abtTransferKeyInit:Array;
      
      private var RCON:ByteArray;
      
      public function Rinjdael()
      {
         var _loc1_:Number = 0;
         this.Rinjdael_abtTransferKeyInit = new Array(154,0,114,30,62,226,154,123,241,180,166,8,108,20,82,235);
         this.Rinjdael_abtTransferKey = new ByteArray();
         this.KEY_ROUND = new ByteArray();
         this.STATE = new ByteArray();
         this.SBOX_init = new Array(99,124,119,123,242,107,111,197,48,1,103,43,254,215,171,118,202,130,201,125,250,89,71,240,173,212,162,175,156,164,114,192,183,253,147,38,54,63,247,204,52,165,229,241,113,216,49,21,4,199,35,195,24,150,5,154,7,18,128,226,235,39,178,117,9,131,44,26,27,110,90,160,82,59,214,179,41,227,47,132,83,209,0,237,32,252,177,91,106,203,190,57,74,76,88,207,208,239,170,251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,143,146,157,56,245,188,182,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,167,126,61,100,93,25,115,96,129,79,220,34,42,144,136,70,238,184,20,222,94,11,219,224,50,58,10,73,6,36,92,194,211,172,98,145,149,228,121,231,200,55,109,141,213,78,169,108,86,244,234,101,122,174,8,186,120,37,46,28,166,180,198,232,221,116,31,75,189,139,138,112,62,181,102,72,3,246,14,97,53,87,185,134,193,29,158,225,248,152,17,105,217,142,148,155,30,135,233,206,85,40,223,140,161,137,13,191,230,66,104,65,153,45,15,176,84,187,22);
         this.SBOX = new ByteArray();
         this.RCON_init = new Array(1,2,4,8,16,32,64,128,27,54);
         this.RCON = new ByteArray();
         super();
         _loc1_ = 0;
         while(_loc1_ < this.Rinjdael_abtTransferKeyInit.length)
         {
            this.Rinjdael_abtTransferKey.writeByte(this.Rinjdael_abtTransferKeyInit[_loc1_] & 255);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.SBOX_init.length)
         {
            this.SBOX.writeByte(this.SBOX_init[_loc1_] & 255);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.RCON_init.length)
         {
            this.RCON.writeByte(this.RCON_init[_loc1_] & 255);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < SIZE_OF_VECTOR)
         {
            this.KEY_ROUND.writeByte(0);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < SIZE_OF_VECTOR)
         {
            this.STATE.writeByte(0);
            _loc1_++;
         }
      }
      
      private function xtime(param1:uint) : uint
      {
         if((param1 & 128) != 0)
         {
            return (27 ^ param1 << 1 & 255) & 255;
         }
         return param1 << 1 & 255;
      }
      
      private function Rinjdael_Rijndael() : void
      {
         var _loc1_:Number = 0;
         this.Rinjdael_btRconIndex = 0;
         this.Rinjdael_AddRoundKey();
         _loc1_ = 1;
         while(_loc1_ < NB_OF_ROUNDS)
         {
            this.Rinjdael_HalfRound1();
            this.Rinjdael_MixColumns();
            this.Rinjdael_KeyExpansion();
            this.Rinjdael_AddRoundKey();
            _loc1_++;
         }
         this.Rinjdael_HalfRound1();
         this.Rinjdael_KeyExpansion();
         this.Rinjdael_AddRoundKey();
      }
      
      private function Rinjdael_KeyExpansion() : void
      {
         this.KEY_ROUND[0] ^= this.SBOX[this.KEY_ROUND[13]] ^ this.RCON[this.Rinjdael_btRconIndex++];
         this.KEY_ROUND[1] ^= this.SBOX[this.KEY_ROUND[14]];
         this.KEY_ROUND[2] ^= this.SBOX[this.KEY_ROUND[15]];
         this.KEY_ROUND[3] ^= this.SBOX[this.KEY_ROUND[12]];
         this.KEY_ROUND[4] ^= this.KEY_ROUND[0];
         this.KEY_ROUND[5] ^= this.KEY_ROUND[1];
         this.KEY_ROUND[6] ^= this.KEY_ROUND[2];
         this.KEY_ROUND[7] ^= this.KEY_ROUND[3];
         this.KEY_ROUND[8] ^= this.KEY_ROUND[4];
         this.KEY_ROUND[9] ^= this.KEY_ROUND[5];
         this.KEY_ROUND[10] ^= this.KEY_ROUND[6];
         this.KEY_ROUND[11] ^= this.KEY_ROUND[7];
         this.KEY_ROUND[12] ^= this.KEY_ROUND[8];
         this.KEY_ROUND[13] ^= this.KEY_ROUND[9];
         this.KEY_ROUND[14] ^= this.KEY_ROUND[10];
         this.KEY_ROUND[15] ^= this.KEY_ROUND[11];
      }
      
      private function Rinjdael_AddRoundKey() : void
      {
         this.STATE[0] ^= this.KEY_ROUND[0];
         this.STATE[1] ^= this.KEY_ROUND[1];
         this.STATE[2] ^= this.KEY_ROUND[2];
         this.STATE[3] ^= this.KEY_ROUND[3];
         this.STATE[4] ^= this.KEY_ROUND[4];
         this.STATE[5] ^= this.KEY_ROUND[5];
         this.STATE[6] ^= this.KEY_ROUND[6];
         this.STATE[7] ^= this.KEY_ROUND[7];
         this.STATE[8] ^= this.KEY_ROUND[8];
         this.STATE[9] ^= this.KEY_ROUND[9];
         this.STATE[10] ^= this.KEY_ROUND[10];
         this.STATE[11] ^= this.KEY_ROUND[11];
         this.STATE[12] ^= this.KEY_ROUND[12];
         this.STATE[13] ^= this.KEY_ROUND[13];
         this.STATE[14] ^= this.KEY_ROUND[14];
         this.STATE[15] ^= this.KEY_ROUND[15];
      }
      
      public function FillInputVectorRaw(param1:ByteArray, param2:uint) : void
      {
         var _loc3_:* = 0;
         if(param2 <= SIZE_OF_VECTOR)
         {
            _loc3_ = 0;
            while(_loc3_ < param2)
            {
               this.STATE[_loc3_] = param1[_loc3_];
               _loc3_++;
            }
            _loc3_ = param2;
            while(_loc3_ < SIZE_OF_VECTOR)
            {
               this.STATE[_loc3_] = PADDING_VALUE & 255;
               _loc3_++;
            }
         }
      }
      
      private function Rinjdael_MixColumns() : void
      {
         var _loc1_:* = 0;
         _loc1_ = uint(this.STATE[0] ^ this.STATE[1] ^ this.STATE[2] ^ this.STATE[3]);
         this.STATE[0] ^= this.xtime(this.STATE[0] ^ this.STATE[1]) ^ _loc1_ & 255;
         this.STATE[1] ^= this.xtime(this.STATE[1] ^ this.STATE[2]) ^ _loc1_ & 255;
         this.STATE[2] ^= this.xtime(this.STATE[2] ^ this.STATE[3]) ^ _loc1_ & 255;
         this.STATE[3] = this.STATE[0] ^ this.STATE[1] ^ this.STATE[2] ^ _loc1_ & 255;
         _loc1_ = uint(this.STATE[4] ^ this.STATE[5] ^ this.STATE[6] ^ this.STATE[7]);
         this.STATE[4] ^= this.xtime(this.STATE[4] ^ this.STATE[5]) ^ _loc1_ & 255;
         this.STATE[5] ^= this.xtime(this.STATE[5] ^ this.STATE[6]) ^ _loc1_ & 255;
         this.STATE[6] ^= this.xtime(this.STATE[6] ^ this.STATE[7]) ^ _loc1_ & 255;
         this.STATE[7] = this.STATE[4] ^ this.STATE[5] ^ this.STATE[6] ^ _loc1_ & 255;
         _loc1_ = uint(this.STATE[8] ^ this.STATE[9] ^ this.STATE[10] ^ this.STATE[11]);
         this.STATE[8] ^= this.xtime(this.STATE[8] ^ this.STATE[9]) ^ _loc1_ & 255;
         this.STATE[9] ^= this.xtime(this.STATE[9] ^ this.STATE[10]) ^ _loc1_ & 255;
         this.STATE[10] ^= this.xtime(this.STATE[10] ^ this.STATE[11]) ^ _loc1_ & 255;
         this.STATE[11] = this.STATE[8] ^ this.STATE[9] ^ this.STATE[10] ^ _loc1_ & 255;
         _loc1_ = uint(this.STATE[12] ^ this.STATE[13] ^ this.STATE[14] ^ this.STATE[15]);
         this.STATE[12] ^= this.xtime(this.STATE[12] ^ this.STATE[13]) ^ _loc1_ & 255;
         this.STATE[13] ^= this.xtime(this.STATE[13] ^ this.STATE[14]) ^ _loc1_ & 255;
         this.STATE[14] ^= this.xtime(this.STATE[14] ^ this.STATE[15]) ^ _loc1_ & 255;
         this.STATE[15] = this.STATE[12] ^ this.STATE[13] ^ this.STATE[14] ^ _loc1_ & 255;
      }
      
      private function Rinjdael_HalfRound1() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeByte(0);
         _loc1_.writeByte(0);
         this.STATE[0] = this.SBOX[this.STATE[0]];
         this.STATE[4] = this.SBOX[this.STATE[4]];
         this.STATE[8] = this.SBOX[this.STATE[8]];
         this.STATE[12] = this.SBOX[this.STATE[12]];
         _loc1_[0] = this.SBOX[this.STATE[1]];
         this.STATE[1] = this.SBOX[this.STATE[5]];
         this.STATE[5] = this.SBOX[this.STATE[9]];
         this.STATE[9] = this.SBOX[this.STATE[13]];
         this.STATE[13] = _loc1_[0];
         _loc1_[0] = this.SBOX[this.STATE[2]];
         _loc1_[1] = this.SBOX[this.STATE[6]];
         this.STATE[2] = this.SBOX[this.STATE[10]];
         this.STATE[6] = this.SBOX[this.STATE[14]];
         this.STATE[10] = _loc1_[0];
         this.STATE[14] = _loc1_[1];
         _loc1_[0] = this.SBOX[this.STATE[15]];
         this.STATE[15] = this.SBOX[this.STATE[11]];
         this.STATE[11] = this.SBOX[this.STATE[7]];
         this.STATE[7] = this.SBOX[this.STATE[3]];
         this.STATE[3] = _loc1_[0];
      }
      
      public function EncryptAndXOR(param1:ByteArray) : ByteArray
      {
         var _loc2_:Number = 0;
         var _loc3_:ByteArray = new ByteArray();
         _loc2_ = 0;
         while(_loc2_ < SIZE_OF_VECTOR)
         {
            this.KEY_ROUND[_loc2_] = this.Rinjdael_abtTransferKey[_loc2_];
            _loc2_++;
         }
         this.Rinjdael_Rijndael();
         _loc2_ = 0;
         while(_loc2_ < SIZE_OF_VECTOR)
         {
            this.KEY_ROUND[_loc2_] = param1[_loc2_];
            _loc2_++;
         }
         this.Rinjdael_AddRoundKey();
         _loc2_ = 0;
         while(_loc2_ < SIZE_OF_VECTOR)
         {
            _loc3_.writeByte(this.STATE[_loc2_]);
            _loc2_++;
         }
         return _loc3_;
      }
   }
}
