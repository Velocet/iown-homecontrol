package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.ButtonSkin;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _ButtonStyle
   {
       
      
      public function _ButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Button");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Button",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.paddingTop = 2;
               this.cornerRadius = 4;
               this.textAlign = "center";
               this.verticalGap = 2;
               this.horizontalGap = 2;
               this.skin = ButtonSkin;
               this.paddingLeft = 10;
               this.paddingBottom = 2;
               this.paddingRight = 10;
            };
         }
      }
   }
}
