package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _errorTipStyle
   {
       
      
      public function _errorTipStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".errorTip");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".errorTip",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fontWeight = "bold";
               this.borderStyle = "errorTipRight";
               this.paddingTop = 4;
               this.borderColor = 13510953;
               this.color = 16777215;
               this.fontSize = 9;
               this.shadowColor = 0;
               this.paddingLeft = 4;
               this.paddingBottom = 4;
               this.paddingRight = 4;
            };
         }
      }
   }
}
