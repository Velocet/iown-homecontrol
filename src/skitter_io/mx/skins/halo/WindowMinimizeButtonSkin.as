package mx.skins.halo
{
   import flash.system.Capabilities;
   import mx.controls.Image;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.states.SetProperty;
   import mx.states.State;
   
   public class WindowMinimizeButtonSkin extends UIComponent
   {
      
      private static var macMinDisabledSkin:Class = WindowMinimizeButtonSkin_macMinDisabledSkin;
      
      private static var winMinOverSkin:Class = WindowMinimizeButtonSkin_winMinOverSkin;
      
      private static var macMinDownSkin:Class = WindowMinimizeButtonSkin_macMinDownSkin;
      
      private static var winMinDownSkin:Class = WindowMinimizeButtonSkin_winMinDownSkin;
      
      private static var winMinDisabledSkin:Class = WindowMinimizeButtonSkin_winMinDisabledSkin;
      
      private static var macMinOverSkin:Class = WindowMinimizeButtonSkin_macMinOverSkin;
      
      private static var winMinUpSkin:Class = WindowMinimizeButtonSkin_winMinUpSkin;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var macMinUpSkin:Class = WindowMinimizeButtonSkin_macMinUpSkin;
       
      
      private var isMac:Boolean;
      
      private var skinImage:Image;
      
      public function WindowMinimizeButtonSkin()
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
         _loc2_.value = isMac ? macMinUpSkin : winMinUpSkin;
         _loc1_.overrides.push(_loc2_);
         states.push(_loc1_);
         var _loc3_:State = new State();
         _loc3_.name = "down";
         var _loc4_:SetProperty;
         (_loc4_ = new SetProperty()).name = "source";
         _loc4_.target = skinImage;
         _loc4_.value = isMac ? macMinDownSkin : winMinDownSkin;
         _loc3_.overrides.push(_loc4_);
         states.push(_loc3_);
         var _loc5_:State;
         (_loc5_ = new State()).name = "over";
         var _loc6_:SetProperty;
         (_loc6_ = new SetProperty()).name = "source";
         _loc6_.target = skinImage;
         _loc6_.value = isMac ? macMinOverSkin : winMinOverSkin;
         _loc5_.overrides.push(_loc6_);
         states.push(_loc5_);
         var _loc7_:State;
         (_loc7_ = new State()).name = "disabled";
         var _loc8_:SetProperty;
         (_loc8_ = new SetProperty()).name = "source";
         _loc8_.target = skinImage;
         _loc8_.value = isMac ? macMinDisabledSkin : winMinDisabledSkin;
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
