package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   public class BrokenImageBorderSkin extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function BrokenImageBorderSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.lineStyle(1,getStyle("borderColor"));
         _loc3_.drawRect(0,0,param1,param2);
      }
   }
}
