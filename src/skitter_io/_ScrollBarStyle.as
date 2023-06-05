package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.ScrollArrowSkin;
   import mx.skins.halo.ScrollThumbSkin;
   import mx.skins.halo.ScrollTrackSkin;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _ScrollBarStyle
   {
       
      
      public function _ScrollBarStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("ScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ScrollBar",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.thumbOffset = 0;
               this.paddingTop = 0;
               this.borderColor = 12040892;
               this.trackColors = [9738651,15198183];
               this.trackSkin = ScrollTrackSkin;
               this.downArrowSkin = ScrollArrowSkin;
               this.cornerRadius = 4;
               this.upArrowSkin = ScrollArrowSkin;
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.thumbSkin = ScrollThumbSkin;
               this.paddingRight = 0;
            };
         }
      }
   }
}
