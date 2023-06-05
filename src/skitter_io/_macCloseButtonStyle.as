package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _macCloseButtonStyle
   {
      
      private static var _embed_css_mac_close_up_png_192766144:Class = _macCloseButtonStyle__embed_css_mac_close_up_png_192766144;
      
      private static var _embed_css_mac_close_over_png_1842065446:Class = _macCloseButtonStyle__embed_css_mac_close_over_png_1842065446;
      
      private static var _embed_css_mac_close_down_png_1992422518:Class = _macCloseButtonStyle__embed_css_mac_close_down_png_1992422518;
       
      
      public function _macCloseButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".macCloseButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".macCloseButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_mac_close_up_png_192766144;
               this.overSkin = _embed_css_mac_close_over_png_1842065446;
               this.downSkin = _embed_css_mac_close_down_png_1992422518;
            };
         }
      }
   }
}
