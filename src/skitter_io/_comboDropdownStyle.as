package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _comboDropdownStyle
   {
       
      
      public function _comboDropdownStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".comboDropdown");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".comboDropdown",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.shadowDirection = "center";
               this.fontWeight = "normal";
               this.dropShadowEnabled = true;
               this.leading = 0;
               this.backgroundColor = 16777215;
               this.shadowDistance = 1;
               this.cornerRadius = 0;
               this.borderThickness = 0;
               this.paddingLeft = 5;
               this.paddingRight = 5;
            };
         }
      }
   }
}
