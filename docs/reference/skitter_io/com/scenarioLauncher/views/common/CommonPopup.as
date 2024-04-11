package com.scenarioLauncher.views.common
{
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.utils.GB;
   import com.scenarioLauncher.views.common.skins.CommonPopupSkin;
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
   import mx.core.Application;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class CommonPopup extends VBox
   {
       
      
      protected var _ready:Boolean = false;
      
      protected var _init:Boolean = false;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function CommonPopup()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({"type":VBox});
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.borderSkin = CommonPopupSkin;
         };
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.clipContent = false;
         this.addEventListener("initialize",this.___CommonPopup_VBox1_initialize);
         this.addEventListener("creationComplete",this.___CommonPopup_VBox1_creationComplete);
         this.addEventListener("updateComplete",this.___CommonPopup_VBox1_updateComplete);
      }
      
      protected function onUpdateComplete(param1:FlexEvent) : void
      {
         GB.triggerGC();
      }
      
      public function ___CommonPopup_VBox1_updateComplete(param1:FlexEvent) : void
      {
         this.onUpdateComplete(param1);
      }
      
      public function manageError(param1:FaultEvent) : void
      {
         KCPopupManager.singleton.removePopup(this);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.refreshUI();
      }
      
      protected function initUI() : void
      {
      }
      
      protected function onInitialize(param1:FlexEvent) : void
      {
         this.initLabels();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      protected function initLabels() : void
      {
      }
      
      public function closeHandler(param1:MouseEvent = null) : void
      {
         GB.triggerGC();
         KCPopupManager.singleton.removePopup(this);
      }
      
      protected function initUIOnce() : void
      {
         if(!this._init)
         {
            this._init = true;
            this.horizontalScrollPolicy = ScrollPolicy.OFF;
            this.verticalScrollPolicy = ScrollPolicy.OFF;
         }
      }
      
      override protected function resourcesChanged() : void
      {
         if(this._ready)
         {
            this.initLabels();
         }
      }
      
      public function ___CommonPopup_VBox1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete(param1);
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.setStyle("paddingTop",23);
         this.setStyle("paddingBottom",23);
         if(!getStyle("paddingLeft"))
         {
            this.setStyle("paddingLeft",25);
         }
         if(!getStyle("paddingRight"))
         {
            this.setStyle("paddingRight",25);
         }
         this.setStyle("horizontalAlign","center");
      }
      
      protected function refreshUI() : void
      {
         x = (Application.application.width - this.width) / 2;
         y = Application.application.height - 335 - this.height / 2;
      }
      
      protected function onCreationComplete(param1:FlexEvent) : void
      {
         this._ready = true;
         this.initUIOnce();
         this.initLabels();
         this.refreshUI();
         this.initUI();
      }
      
      public function ___CommonPopup_VBox1_initialize(param1:FlexEvent) : void
      {
         this.onInitialize(param1);
      }
   }
}
