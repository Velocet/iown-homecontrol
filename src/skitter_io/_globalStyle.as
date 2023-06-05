package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.HaloBorder;
   import mx.skins.halo.HaloFocusRect;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _globalStyle
   {
       
      
      public function _globalStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("global",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.fillColor = 16777215;
               this.kerning = false;
               this.iconColor = 1118481;
               this.textRollOverColor = 2831164;
               this.horizontalAlign = "left";
               this.shadowCapColor = 14015965;
               this.backgroundAlpha = 1;
               this.filled = true;
               this.textDecoration = "none";
               this.roundedBottomCorners = true;
               this.fontThickness = 0;
               this.focusBlendMode = "normal";
               this.fillColors = [16777215,13421772,16777215,15658734];
               this.horizontalGap = 8;
               this.borderCapColor = 9542041;
               this.buttonColor = 7305079;
               this.indentation = 17;
               this.selectionDisabledColor = 14540253;
               this.closeDuration = 250;
               this.embedFonts = false;
               this.paddingTop = 0;
               this.letterSpacing = 0;
               this.focusAlpha = 0.4;
               this.bevel = true;
               this.fontSize = 10;
               this.shadowColor = 15658734;
               this.borderAlpha = 1;
               this.paddingLeft = 0;
               this.fontWeight = "normal";
               this.indicatorGap = 14;
               this.focusSkin = HaloFocusRect;
               this.dropShadowEnabled = false;
               this.leading = 2;
               this.borderSkin = HaloBorder;
               this.fontSharpness = 0;
               this.modalTransparencyDuration = 100;
               this.borderThickness = 1;
               this.backgroundSize = "auto";
               this.borderStyle = "inset";
               this.borderColor = 12040892;
               this.fontAntiAliasType = "advanced";
               this.errorColor = 16711680;
               this.shadowDistance = 2;
               this.horizontalGridLineColor = 16250871;
               this.stroked = false;
               this.modalTransparencyColor = 14540253;
               this.cornerRadius = 0;
               this.verticalAlign = "top";
               this.textIndent = 0;
               this.fillAlphas = [0.6,0.4,0.75,0.65];
               this.verticalGridLineColor = 14015965;
               this.themeColor = 40447;
               this.version = "3.0.0";
               this.shadowDirection = "center";
               this.modalTransparency = 0.5;
               this.repeatInterval = 35;
               this.openDuration = 250;
               this.textAlign = "left";
               this.fontFamily = "Verdana";
               this.textSelectedColor = 2831164;
               this.paddingBottom = 0;
               this.strokeWidth = 1;
               this.fontGridFitType = "pixel";
               this.horizontalGridLines = false;
               this.useRollOver = true;
               this.verticalGridLines = true;
               this.repeatDelay = 500;
               this.fontStyle = "normal";
               this.dropShadowColor = 0;
               this.focusThickness = 2;
               this.verticalGap = 6;
               this.disabledColor = 11187123;
               this.paddingRight = 0;
               this.focusRoundedCorners = "tl tr bl br";
               this.borderSides = "left top right bottom";
               this.disabledIconColor = 10066329;
               this.modalTransparencyBlur = 3;
               this.color = 734012;
               this.selectionDuration = 250;
               this.highlightAlphas = [0.3,0];
            };
         }
      }
   }
}
