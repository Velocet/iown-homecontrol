package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   public class ListDropIndicator extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var direction:String = "horizontal";
      
      public function ListDropIndicator()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.lineStyle(2,2831164);
         if(direction == "horizontal")
         {
            _loc3_.moveTo(0,0);
            _loc3_.lineTo(param1,0);
         }
         else
         {
            _loc3_.moveTo(0,0);
            _loc3_.lineTo(0,param2);
         }
      }
   }
}
