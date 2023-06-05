package com.scenarioLauncher.components
{
   import mx.controls.Button;
   import mx.core.mx_internal;
   
   public class ButtonCombo extends Button
   {
      
      public static const LARGE:String = "largeSize";
      
      public static const SMALL:String = "smallSize";
       
      
      private var _type:String;
      
      public function ButtonCombo()
      {
         super();
         this.cacheAsBitmap = false;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(mx_internal::currentIcon != null)
         {
            if(this.type == SMALL)
            {
               mx_internal::currentIcon.x = 171;
            }
            else if(this.type == LARGE)
            {
               mx_internal::currentIcon.x = 219;
            }
            mx_internal::currentIcon.y = 10;
            mx_internal::currentIcon.width = 14;
            mx_internal::currentIcon.height = 9;
         }
      }
   }
}
