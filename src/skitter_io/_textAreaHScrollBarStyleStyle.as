package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _textAreaHScrollBarStyleStyle
   {
       
      
      public function _textAreaHScrollBarStyleStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".textAreaHScrollBarStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".textAreaHScrollBarStyle",style,false);
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
