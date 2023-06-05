package mx.skins.halo
{
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   public class StatusBarBackgroundSkin extends ProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function StatusBarBackgroundSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         graphics.clear();
         drawRoundRect(0,0,param1,param2,null,getStyle("statusBarBackgroundColor"),1);
         graphics.moveTo(0,0);
         graphics.lineStyle(1,0,0.35);
         graphics.lineTo(param1,0);
      }
   }
}
