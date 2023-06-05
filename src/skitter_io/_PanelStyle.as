package
{
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.skins.halo.PanelSkin;
   import mx.skins.halo.TitleBackground;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _PanelStyle
   {
       
      
      public function _PanelStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var effects:Array = null;
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Panel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Panel",style,false);
            effects = style.mx_internal::effects;
            if(!effects)
            {
               effects = style.mx_internal::effects = new Array();
            }
            effects.push("resizeEndEffect");
            effects.push("resizeStartEffect");
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.statusStyleName = "windowStatus";
               this.borderStyle = "default";
               this.paddingTop = 0;
               this.borderColor = 14869218;
               this.backgroundColor = 16777215;
               this.cornerRadius = 4;
               this.titleBackgroundSkin = TitleBackground;
               this.borderAlpha = 0.4;
               this.borderThicknessTop = 2;
               this.paddingLeft = 0;
               this.resizeEndEffect = "Dissolve";
               this.paddingRight = 0;
               this.titleStyleName = "windowStyles";
               this.roundedBottomCorners = false;
               this.borderThicknessRight = 10;
               this.dropShadowEnabled = true;
               this.resizeStartEffect = "Dissolve";
               this.borderSkin = PanelSkin;
               this.borderThickness = 0;
               this.borderThicknessLeft = 10;
               this.paddingBottom = 0;
            };
         }
      }
   }
}
