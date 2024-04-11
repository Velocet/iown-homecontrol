package com.scenarioLauncher.views.help
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
   import ioService.views.common.CustomCanvas;
   import mx.binding.*;
   import mx.containers.Box;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class HelpCategoryButton extends CustomCanvas
   {
       
      
      private var _320749718categoryLabel:Label;
      
      private var _categoryLabel:String;
      
      private var _categoryLabelChanged:Boolean = false;
      
      private var _318335741categoryImage:LinkButton;
      
      private var _mouseOver:Boolean = false;
      
      private var _imageSkinOver:String = "";
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _imageSkin:String = "";
      
      private var _367345007buttonContainer:Box;
      
      public function HelpCategoryButton()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                     this.verticalAlign = "bottom";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":VBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"helpButtonVBox",
                                 "percentHeight":100,
                                 "percentWidth":100,
                                 "verticalScrollPolicy":"off",
                                 "horizontalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Box,
                                    "id":"buttonContainer",
                                    "events":{
                                       "mouseOut":"__buttonContainer_mouseOut",
                                       "mouseOver":"__buttonContainer_mouseOver"
                                    },
                                    "stylesFactory":function():void
                                    {
                                       this.verticalAlign = "top";
                                       this.horizontalAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "verticalScrollPolicy":"off",
                                          "horizontalScrollPolicy":"off",
                                          "mouseChildren":false,
                                          "buttonMode":true,
                                          "useHandCursor":true,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":LinkButton,
                                             "id":"categoryImage",
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentHeight":100,
                                                   "percentWidth":100
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Label,
                           "id":"categoryLabel",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "y":-5,
                                 "styleName":"helpButtonText"
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
      }
      
      public function __buttonContainer_mouseOver(param1:MouseEvent) : void
      {
         this.mouseOverHandler(param1);
      }
      
      public function set categoryImage(param1:LinkButton) : void
      {
         var _loc2_:Object = this._318335741categoryImage;
         if(_loc2_ !== param1)
         {
            this._318335741categoryImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryImage",_loc2_,param1));
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._categoryLabelChanged)
         {
            this._categoryLabelChanged = false;
            this.categoryLabel.text = this._categoryLabel;
         }
      }
      
      public function get imageSkinOver() : String
      {
         return this._imageSkinOver;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryLabel() : Label
      {
         return this._320749718categoryLabel;
      }
      
      public function set imageSkinOver(param1:String) : void
      {
         this._imageSkinOver = param1;
         invalidateProperties();
      }
      
      public function __buttonContainer_mouseOut(param1:MouseEvent) : void
      {
         this.mouseOutHandler(param1);
      }
      
      public function set text(param1:String) : void
      {
         this._categoryLabel = param1;
         this._categoryLabelChanged = true;
         invalidateProperties();
      }
      
      public function set buttonContainer(param1:Box) : void
      {
         var _loc2_:Object = this._367345007buttonContainer;
         if(_loc2_ !== param1)
         {
            this._367345007buttonContainer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonContainer",_loc2_,param1));
         }
      }
      
      public function set categoryLabel(param1:Label) : void
      {
         var _loc2_:Object = this._320749718categoryLabel;
         if(_loc2_ !== param1)
         {
            this._320749718categoryLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryLabel",_loc2_,param1));
         }
      }
      
      private function mouseOutHandler(param1:MouseEvent) : void
      {
         if(this.categoryImage.styleName != this._imageSkin)
         {
            this.categoryImage.styleName = this._imageSkin;
         }
      }
      
      public function get text() : String
      {
         return this._categoryLabel;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonContainer() : Box
      {
         return this._367345007buttonContainer;
      }
      
      public function set imageSkin(param1:String) : void
      {
         this._imageSkin = param1;
         invalidateProperties();
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
         if(this.categoryImage.styleName != this._imageSkinOver)
         {
            this.categoryImage.styleName = this._imageSkinOver;
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.categoryImage.styleName = this._imageSkin;
      }
      
      public function get imageSkin() : String
      {
         return this._imageSkin;
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryImage() : LinkButton
      {
         return this._318335741categoryImage;
      }
   }
}
