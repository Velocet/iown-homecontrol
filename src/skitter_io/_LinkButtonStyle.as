package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.LinkButtonSkin;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _LinkButtonStyle
   {
       
      
      public function _LinkButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("LinkButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("LinkButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = null;
               this.selectedDownSkin = null;
               this.overSkin = null;
               this.downSkin = null;
               this.selectedDisabledSkin = null;
               this.selectedUpSkin = null;
               this.disabledSkin = null;
               this.skin = LinkButtonSkin;
               this.paddingLeft = 7;
               this.selectedOverSkin = null;
               this.paddingRight = 7;
            };
         }
      }
   }
}
