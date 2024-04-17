package ioService.utils
{
   import flash.utils.ByteArray;
   
   public class Converter
   {
       
      
      public function Converter()
      {
         super();
      }
      
      public function hexaStringToByte(param1:String) : int
      {
         var _loc2_:int = 0;
         return int(parseInt(param1,16));
      }
      
      public function byteToHexaString(param1:int) : String
      {
         var _loc2_:String = new String();
         _loc2_ += (param1 / 16).toString(16);
         return _loc2_ + (param1 % 16).toString(16);
      }
      
      public function ioAddressToString(param1:ByteArray) : String
      {
         var _loc2_:String = new String();
         return this.byteToHexaString(param1[0]) + "." + this.byteToHexaString(param1[1]) + "." + this.byteToHexaString(param1[2]);
      }
      
      public function stringToIoAddress(param1:String) : ByteArray
      {
         var _loc2_:Array = null;
         var _loc3_:ByteArray = new ByteArray();
         _loc2_ = param1.split(".");
         _loc3_.writeByte(this.hexaStringToByte(_loc2_[0]));
         _loc3_.writeByte(this.hexaStringToByte(_loc2_[1]));
         _loc3_.writeByte(this.hexaStringToByte(_loc2_[2]));
         return _loc3_;
      }
   }
}
