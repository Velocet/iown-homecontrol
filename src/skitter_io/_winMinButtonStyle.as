package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _winMinButtonStyle
   {
      
      private static var _embed_css_win_min_down_png_244736192:Class = _winMinButtonStyle__embed_css_win_min_down_png_244736192;
      
      private static var _embed_css_win_min_over_png_460479108:Class = _winMinButtonStyle__embed_css_win_min_over_png_460479108;
      
      private static var _embed_css_win_min_up_png_296606810:Class = _winMinButtonStyle__embed_css_win_min_up_png_296606810;
      
      private static var _embed_css_win_min_dis_png_1140240612:Class = _winMinButtonStyle__embed_css_win_min_dis_png_1140240612;
       
      
      public function _winMinButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".winMinButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".winMinButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_win_min_up_png_296606810;
               this.downSkin = _embed_css_win_min_down_png_244736192;
               this.overSkin = _embed_css_win_min_over_png_460479108;
               this.disabledSkin = _embed_css_win_min_dis_png_1140240612;
            };
         }
      }
   }
}
