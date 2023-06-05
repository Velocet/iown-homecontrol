package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _macMinButtonStyle
   {
      
      private static var _embed_css_mac_min_over_png_1948159722:Class = _macMinButtonStyle__embed_css_mac_min_over_png_1948159722;
      
      private static var _embed_css_mac_min_down_png_525317702:Class = _macMinButtonStyle__embed_css_mac_min_down_png_525317702;
      
      private static var _embed_css_mac_min_dis_png_2044609350:Class = _macMinButtonStyle__embed_css_mac_min_dis_png_2044609350;
      
      private static var _embed_css_mac_min_up_png_1925106556:Class = _macMinButtonStyle__embed_css_mac_min_up_png_1925106556;
       
      
      public function _macMinButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".macMinButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".macMinButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_mac_min_up_png_1925106556;
               this.overSkin = _embed_css_mac_min_over_png_1948159722;
               this.downSkin = _embed_css_mac_min_down_png_525317702;
               this.alpha = 0.5;
               this.disabledSkin = _embed_css_mac_min_dis_png_2044609350;
            };
         }
      }
   }
}
