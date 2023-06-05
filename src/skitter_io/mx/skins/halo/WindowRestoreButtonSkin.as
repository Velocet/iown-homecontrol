package mx.skins.halo
{
   import mx.controls.Image;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.states.SetProperty;
   import mx.states.State;
   
   public class WindowRestoreButtonSkin extends UIComponent
   {
      
      private static var winRestoreDownSkin:Class = WindowRestoreButtonSkin_winRestoreDownSkin;
      
      private static var winRestoreOverSkin:Class = WindowRestoreButtonSkin_winRestoreOverSkin;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var winRestoreUpSkin:Class = WindowRestoreButtonSkin_winRestoreUpSkin;
       
      
      private var skinImage:Image;
      
      public function WindowRestoreButtonSkin()
      {
         super();
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
         _loc2_.value = winRestoreUpSkin;
         _loc1_.overrides.push(_loc2_);
         states.push(_loc1_);
         var _loc3_:State = new State();
         _loc3_.name = "down";
         var _loc4_:SetProperty;
         (_loc4_ = new SetProperty()).name = "source";
         _loc4_.target = skinImage;
         _loc4_.value = winRestoreDownSkin;
         _loc3_.overrides.push(_loc4_);
         states.push(_loc3_);
         var _loc5_:State;
         (_loc5_ = new State()).name = "over";
         var _loc6_:SetProperty;
         (_loc6_ = new SetProperty()).name = "source";
         _loc6_.target = skinImage;
         _loc6_.value = winRestoreOverSkin;
         _loc5_.overrides.push(_loc6_);
         states.push(_loc5_);
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
