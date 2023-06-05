package com.scenarioLauncher.components
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.controls.TextInput;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class TextInputPassword extends Canvas
   {
      
      public static var WEBDINGS:Class = TextInputPassword_WEBDINGS;
       
      
      private var _password:String = "";
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _3701ti:TextInput;
      
      private var bulletPassword:String = "";
      
      public function TextInputPassword()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":TextInput,
                  "id":"ti",
                  "events":{
                     "keyDown":"__ti_keyDown",
                     "change":"__ti_change",
                     "textInput":"__ti_textInput"
                  },
                  "stylesFactory":function():void
                  {
                     this.fontFamily = "WEBDINGS";
                     this.fontSize = 18;
                     this.themeColor = 16763904;
                     this.textAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"VR18BCP",
                        "percentWidth":100,
                        "focusEnabled":false,
                        "maxChars":6
                     };
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
      }
      
      protected function ti_keyDownHandler(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.DELETE:
               if(this.ti.selectionBeginIndex == this.ti.selectionEndIndex)
               {
                  this.deleteHandler(true);
               }
               else
               {
                  this.deleteStringHandler();
               }
               break;
            case Keyboard.BACKSPACE:
               if(this.ti.selectionBeginIndex == this.ti.selectionEndIndex)
               {
                  this.deleteHandler(false);
               }
               else
               {
                  this.deleteStringHandler();
               }
         }
      }
      
      public function __ti_keyDown(param1:KeyboardEvent) : void
      {
         this.ti_keyDownHandler(param1);
      }
      
      private function deleteHandler(param1:Boolean) : void
      {
         var _loc2_:String = "";
         if(param1)
         {
            _loc2_ = this._password.substr(0,this.ti.selectionBeginIndex);
            _loc2_ += this._password.substr(this.ti.selectionBeginIndex + 1,this._password.length);
            this._password = _loc2_;
            this.bulletPassword = this.bulletPassword.substr(0,this.bulletPassword.length - 1);
         }
         else
         {
            _loc2_ = this._password.substr(0,this.ti.selectionBeginIndex - 1);
            _loc2_ += this._password.substr(this.ti.selectionBeginIndex,this._password.length);
            this._password = _loc2_;
            this.bulletPassword = this.bulletPassword.substr(0,this.bulletPassword.length - 1);
         }
      }
      
      public function set ti(param1:TextInput) : void
      {
         var _loc2_:Object = this._3701ti;
         if(_loc2_ !== param1)
         {
            this._3701ti = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ti",_loc2_,param1));
         }
      }
      
      public function __ti_textInput(param1:TextEvent) : void
      {
         this.ti_textInputHandler(param1);
      }
      
      public function get text() : String
      {
         return this._password;
      }
      
      private function deleteStringHandler() : void
      {
         var _loc1_:String = "";
         _loc1_ = this._password.substr(0,this.ti.selectionBeginIndex);
         _loc1_ += this._password.substr(this.ti.selectionEndIndex,this._password.length);
         this._password = _loc1_;
         this.bulletPassword = this.bulletPassword.substr(0,this.bulletPassword.length - (this.ti.selectionEndIndex - this.ti.selectionBeginIndex));
      }
      
      public function reset() : void
      {
         this.text = "";
         this.ti.text = "";
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      [Bindable(event="propertyChange")]
      public function get ti() : TextInput
      {
         return this._3701ti;
      }
      
      public function set text(param1:String) : void
      {
         this.bulletPassword = param1;
         this._password = param1;
      }
      
      public function __ti_change(param1:Event) : void
      {
         this.ti_changeHandler(param1);
      }
      
      protected function ti_textInputHandler(param1:TextEvent) : void
      {
         this._password += param1.text;
         var _loc2_:RegExp = /[\D-\d]$/i;
         this.bulletPassword += param1.text.replace(_loc2_,"=");
      }
      
      protected function ti_changeHandler(param1:Event) : void
      {
         this.ti.text = this.bulletPassword;
      }
   }
}
