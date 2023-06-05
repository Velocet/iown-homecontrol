package mx.core
{
   import flash.display.BitmapData;
   
   public class BitmapAsset extends FlexBitmap implements IFlexAsset, IFlexDisplayObject
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function BitmapAsset(param1:BitmapData = null, param2:String = "auto", param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get measuredWidth() : Number
      {
         if(bitmapData)
         {
            return bitmapData.width;
         }
         return 0;
      }
      
      public function get measuredHeight() : Number
      {
         if(bitmapData)
         {
            return bitmapData.height;
         }
         return 0;
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         width = param1;
         height = param2;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
   }
}
