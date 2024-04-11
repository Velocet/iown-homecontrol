package com.scenarioLauncher.views.renderers
{
   import com.scenarioLauncher.datamodel.RemoteItem;
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
   import mx.containers.VBox;
   import mx.controls.Image;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class HelpRemoteItemRenderer extends VBox
   {
       
      
      private var remoteItem:RemoteItem = null;
      
      private var _2089091915remoteImage:Image;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var guiInitialized:Boolean = false;
      
      private var remoteItemChanged:Boolean = false;
      
      public function HelpRemoteItemRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"remoteImage",
                  "propertiesFactory":function():Object
                  {
                     return {"maintainAspectRatio":true};
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.horizontalAlign = "center";
            this.verticalAlign = "bottom";
         };
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___HelpRemoteItemRenderer_VBox1_creationComplete);
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.guiInitialized = true;
         invalidateProperties();
      }
      
      public function set remoteImage(param1:Image) : void
      {
         var _loc2_:Object = this._2089091915remoteImage;
         if(_loc2_ !== param1)
         {
            this._2089091915remoteImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteImage",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      override protected function commitProperties() : void
      {
         if(this.remoteItemChanged && this.guiInitialized)
         {
            this.remoteItemChanged = false;
            if(this.remoteItem != null)
            {
               this.remoteImage.source = this.remoteItem.imageClass;
            }
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.remoteItem = param1 as RemoteItem;
         this.remoteItemChanged = true;
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteImage() : Image
      {
         return this._2089091915remoteImage;
      }
      
      public function ___HelpRemoteItemRenderer_VBox1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
   }
}
