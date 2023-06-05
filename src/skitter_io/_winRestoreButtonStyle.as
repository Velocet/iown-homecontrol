package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _winRestoreButtonStyle
   {
      
      private static var _embed_css_win_restore_up_png_364938054:Class = _winRestoreButtonStyle__embed_css_win_restore_up_png_364938054;
      
      private static var _embed_css_win_restore_down_png_1229181320:Class = _winRestoreButtonStyle__embed_css_win_restore_down_png_1229181320;
      
      private static var _embed_css_win_restore_over_png_644656292:Class = _winRestoreButtonStyle__embed_css_win_restore_over_png_644656292;
       
      
      public function _winRestoreButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".winRestoreButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".winRestoreButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_win_restore_up_png_364938054;
               this.downSkin = _embed_css_win_restore_down_png_1229181320;
               this.overSkin = _embed_css_win_restore_over_png_644656292;
            };
         }
      }
   }
}
