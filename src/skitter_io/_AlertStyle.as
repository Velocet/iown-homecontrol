package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _AlertStyle
   {
       
      
      public function _AlertStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Alert");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Alert",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.paddingTop = 2;
               this.borderColor = 8821927;
               this.roundedBottomCorners = true;
               this.color = 16777215;
               this.buttonStyleName = "alertButtonStyle";
               this.backgroundColor = 8821927;
               this.borderAlpha = 0.9;
               this.paddingLeft = 10;
               this.paddingBottom = 2;
               this.backgroundAlpha = 0.9;
               this.paddingRight = 10;
            };
         }
      }
   }
}
