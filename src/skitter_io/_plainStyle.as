package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _plainStyle
   {
       
      
      public function _plainStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".plain");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".plain",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 0;
               this.backgroundColor = 16777215;
               this.backgroundImage = "";
               this.horizontalAlign = "left";
               this.paddingLeft = 0;
               this.paddingBottom = 0;
               this.paddingRight = 0;
            };
         }
      }
   }
}
