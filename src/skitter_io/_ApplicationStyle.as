package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.ApplicationBackground;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _ApplicationStyle
   {
       
      
      public function _ApplicationStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Application");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Application",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.backgroundSize = "100%";
               this.paddingTop = 24;
               this.backgroundColor = 8821927;
               this.backgroundImage = ApplicationBackground;
               this.horizontalAlign = "center";
               this.backgroundGradientAlphas = [1,1];
               this.paddingLeft = 24;
               this.paddingBottom = 24;
               this.paddingRight = 24;
            };
         }
      }
   }
}
