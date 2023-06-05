package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   public class ProgressMaskSkin extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ProgressMaskSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.beginFill(16776960);
         _loc3_.drawRect(1,1,param1 - 2,param2 - 2);
         _loc3_.endFill();
      }
   }
}
