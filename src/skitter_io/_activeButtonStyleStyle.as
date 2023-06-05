package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _activeButtonStyleStyle
   {
       
      
      public function _activeButtonStyleStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".activeButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".activeButtonStyle",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
            };
         }
      }
   }
}
