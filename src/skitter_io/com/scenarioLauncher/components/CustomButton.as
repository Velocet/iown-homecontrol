package com.scenarioLauncher.components
{
   import mx.controls.Button;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class CustomButton extends Button
   {
       
      
      private var _iconX:Number;
      
      private var _iconY:Number;
      
      private var _compoReady:Boolean = false;
      
      private var _iconWidth:Number;
      
      private var _iconHeight:Number;
      
      public function CustomButton()
      {
         super();
         this.cacheAsBitmap = false;
         this.addEventListener("creationComplete",this.___CustomButton_Button1_creationComplete);
      }
      
      public function set iconX(param1:Number) : void
      {
         this._iconX = param1;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.handleIcon();
      }
      
      private function handleIcon() : void
      {
         if(!this._compoReady)
         {
            if(mx_internal::currentIcon != null)
            {
               if(!isNaN(this._iconWidth))
               {
                  mx_internal::currentIcon.width = this._iconWidth;
               }
               if(!isNaN(this._iconHeight))
               {
                  mx_internal::currentIcon.height = this._iconHeight;
               }
               if(!isNaN(this._iconX))
               {
                  mx_internal::currentIcon.x = this._iconX;
               }
               if(!isNaN(this._iconY))
               {
                  mx_internal::currentIcon.y = this._iconY;
               }
            }
         }
      }
      
      public function get iconX() : Number
      {
         return this._iconX;
      }
      
      public function get iconWidth() : Number
      {
         return this._iconWidth;
      }
      
      public function get iconY() : Number
      {
         return this._iconY;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set iconWidth(param1:Number) : void
      {
         this._iconWidth = param1;
      }
      
      public function set iconHeight(param1:Number) : void
      {
         this._iconHeight = param1;
      }
      
      public function ___CustomButton_Button1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationCompleteHandler(param1);
      }
      
      public function set iconY(param1:Number) : void
      {
         this._iconY = param1;
      }
      
      public function get iconHeight() : Number
      {
         return this._iconHeight;
      }
      
      private function onCreationCompleteHandler(param1:FlexEvent) : void
      {
         this._compoReady = true;
      }
   }
}
