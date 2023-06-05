package mx.graphics.codec
{
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   
   public interface IImageEncoder
   {
       
      
      function encodeByteArray(param1:ByteArray, param2:int, param3:int, param4:Boolean = true) : ByteArray;
      
      function get contentType() : String;
      
      function encode(param1:BitmapData) : ByteArray;
   }
}
