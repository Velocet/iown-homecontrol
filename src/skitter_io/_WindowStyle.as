package
{
   import mx.core.IFlexModuleFactory;
   import mx.skins.halo.ApplicationTitleBarBackgroundSkin;
   import mx.skins.halo.StatusBarBackgroundSkin;
   import mx.skins.halo.WindowBackground;
   import mx.skins.halo.WindowCloseButtonSkin;
   import mx.skins.halo.WindowMaximizeButtonSkin;
   import mx.skins.halo.WindowMinimizeButtonSkin;
   import mx.skins.halo.WindowRestoreButtonSkin;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class _WindowStyle
   {
       
      
      public function _WindowStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("Window");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("Window",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               this.statusTextStyleName = "statusTextStyle";
               this.closeButtonSkin = WindowCloseButtonSkin;
               this.borderStyle = "solid";
               this.borderColor = 10921638;
               this.titleTextStyleName = "titleTextStyle";
               this.backgroundColor = 12632256;
               this.cornerRadius = 8;
               this.titleBarButtonPadding = 5;
               this.roundedBottomCorners = false;
               this.showFlexChrome = true;
               this.statusBarBackgroundColor = 13421772;
               this.buttonPadding = 2;
               this.titleAlignment = "auto";
               this.buttonAlignment = "auto";
               this.restoreButtonSkin = WindowRestoreButtonSkin;
               this.statusBarBackgroundSkin = StatusBarBackgroundSkin;
               this.backgroundImage = WindowBackground;
               this.gripperPadding = 3;
               this.titleBarBackgroundSkin = ApplicationTitleBarBackgroundSkin;
               this.titleBarColors = [16777215,12237498];
               this.minimizeButtonSkin = WindowMinimizeButtonSkin;
               this.maximizeButtonSkin = WindowMaximizeButtonSkin;
               this.borderThickness = 1;
               this.highlightAlphas = [1,1];
               this.gripperStyleName = "gripperSkin";
            };
         }
      }
   }
}
