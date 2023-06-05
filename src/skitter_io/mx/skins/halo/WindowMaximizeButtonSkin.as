package mx.skins.halo
{
   import flash.system.Capabilities;
   import mx.controls.Image;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.states.SetProperty;
   import mx.states.State;
   
   public class WindowMaximizeButtonSkin extends UIComponent
   {
      
      private static var winMaxUpSkin:Class = WindowMaximizeButtonSkin_winMaxUpSkin;
      
      private static var winMaxDisabledSkin:Class = WindowMaximizeButtonSkin_winMaxDisabledSkin;
      
      private static var winRestoreOverSkin:Class = WindowMaximizeButtonSkin_winRestoreOverSkin;
      
      private static var macMaxOverSkin:Class = WindowMaximizeButtonSkin_macMaxOverSkin;
      
      private static var winRestoreUpSkin:Class = WindowMaximizeButtonSkin_winRestoreUpSkin;
      
      private static var macMaxUpSkin:Class = WindowMaximizeButtonSkin_macMaxUpSkin;
      
      private static var winMaxDownSkin:Class = WindowMaximizeButtonSkin_winMaxDownSkin;
      
      private static var winRestoreDownSkin:Class = WindowMaximizeButtonSkin_winRestoreDownSkin;
      
      private static var macMaxDownSkin:Class = WindowMaximizeButtonSkin_macMaxDownSkin;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var winMaxOverSkin:Class = WindowMaximizeButtonSkin_winMaxOverSkin;
      
      private static var macMaxDisabledSkin:Class = WindowMaximizeButtonSkin_macMaxDisabledSkin;
       
      
      private var isMac:Boolean;
      
      private var skinImage:Image;
      
      public function WindowMaximizeButtonSkin()
      {
         super();
         isMac = Capabilities.os.substring(0,3) == "Mac";
      }
      
      override public function get measuredWidth() : Number
      {
         if(false)
         {
            return skinImage.measuredWidth;
         }
         return 12;
      }
      
      private function initializeStates() : void
      {
         var _loc1_:State = new State();
         _loc1_.name = "up";
         var _loc2_:SetProperty = new SetProperty();
         _loc2_.name = "source";
         _loc2_.target = skinImage;
         _loc2_.value = isMac ? macMaxUpSkin : winMaxUpSkin;
         _loc1_.overrides.push(_loc2_);
         states.push(_loc1_);
         var _loc3_:State = new State();
         _loc3_.name = "down";
         var _loc4_:SetProperty;
         (_loc4_ = new SetProperty()).name = "source";
         _loc4_.target = skinImage;
         _loc4_.value = isMac ? macMaxDownSkin : winMaxDownSkin;
         _loc3_.overrides.push(_loc4_);
         states.push(_loc3_);
         var _loc5_:State;
         (_loc5_ = new State()).name = "over";
         var _loc6_:SetProperty;
         (_loc6_ = new SetProperty()).name = "source";
         _loc6_.target = skinImage;
         _loc6_.value = isMac ? macMaxOverSkin : winMaxOverSkin;
         _loc5_.overrides.push(_loc6_);
         states.push(_loc5_);
         var _loc7_:State;
         (_loc7_ = new State()).name = "disabled";
         var _loc8_:SetProperty;
         (_loc8_ = new SetProperty()).name = "source";
         _loc8_.target = skinImage;
         _loc8_.value = isMac ? macMaxDisabledSkin : winMaxDisabledSkin;
         _loc7_.overrides.push(_loc8_);
         states.push(_loc7_);
      }
      
      override protected function createChildren() : void
      {
         skinImage = new Image();
         addChild(skinImage);
         initializeStates();
         skinImage.setActualSize(12,13);
         skinImage.move(0,0);
      }
      
      override public function get measuredHeight() : Number
      {
         if(false)
         {
            return skinImage.measuredHeight;
         }
         return 13;
      }
   }
}
