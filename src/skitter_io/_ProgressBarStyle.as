package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.ProgressBarSkin;
   import mx.skins.halo.ProgressIndeterminateSkin;
   import mx.skins.halo.ProgressMaskSkin;
   import mx.skins.halo.ProgressTrackSkin;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _ProgressBarStyle
   {
       
      
      public function _ProgressBarStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("ProgressBar");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ProgressBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.trackColors = [15198183,16777215];
               this.leading = 0;
               this.barSkin = ProgressBarSkin;
               this.trackSkin = ProgressTrackSkin;
               this.indeterminateMoveInterval = 28;
               this.maskSkin = ProgressMaskSkin;
               this.indeterminateSkin = ProgressIndeterminateSkin;
            };
         }
      }
   }
}
