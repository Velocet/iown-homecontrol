package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _opaquePanelStyle
   {
       
      
      public function _opaquePanelStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".opaquePanel");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".opaquePanel",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.borderColor = 16777215;
               this.backgroundColor = 16777215;
               this.headerColors = [15198183,14277081];
               this.footerColors = [15198183,13092807];
               this.borderAlpha = 1;
            };
         }
      }
   }
}
