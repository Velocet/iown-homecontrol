package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _winCloseButtonStyle
   {
      
      private static var _embed_css_win_close_down_png_610283564:Class = _winCloseButtonStyle__embed_css_win_close_down_png_610283564;
      
      private static var _embed_css_win_close_over_png_1665022968:Class = _winCloseButtonStyle__embed_css_win_close_over_png_1665022968;
      
      private static var _embed_css_win_close_up_png_266973734:Class = _winCloseButtonStyle__embed_css_win_close_up_png_266973734;
       
      
      public function _winCloseButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".winCloseButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".winCloseButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_win_close_up_png_266973734;
               this.overSkin = _embed_css_win_close_over_png_1665022968;
               this.downSkin = _embed_css_win_close_down_png_610283564;
            };
         }
      }
   }
}
