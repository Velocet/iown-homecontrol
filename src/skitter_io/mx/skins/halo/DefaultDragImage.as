package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.IFlexDisplayObject;
   import mx.core.SpriteAsset;
   import mx.core.mx_internal;
   
   public class DefaultDragImage extends SpriteAsset implements IFlexDisplayObject
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function DefaultDragImage()
      {
         draw(10,10);
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 10;
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      override public function get measuredHeight() : Number
      {
         return 10;
      }
      
      override public function setActualSize(param1:Number, param2:Number) : void
      {
         draw(param1,param2);
      }
      
      private function draw(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.beginFill(15658734);
         _loc3_.lineStyle(1,8433818);
         _loc3_.drawRect(0,0,param1,param2);
         _loc3_.endFill();
      }
   }
}
