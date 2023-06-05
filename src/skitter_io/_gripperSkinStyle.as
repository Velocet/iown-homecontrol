package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _gripperSkinStyle
   {
      
      private static var _embed_css_gripper_up_png_1666663046:Class = _gripperSkinStyle__embed_css_gripper_up_png_1666663046;
       
      
      public function _gripperSkinStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".gripperSkin");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".gripperSkin",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.upSkin = _embed_css_gripper_up_png_1666663046;
               this.overSkin = _embed_css_gripper_up_png_1666663046;
               this.downSkin = _embed_css_gripper_up_png_1666663046;
            };
         }
      }
   }
}
