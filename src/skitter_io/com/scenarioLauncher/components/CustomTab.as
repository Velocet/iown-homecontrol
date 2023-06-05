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
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class CustomTab extends VBox
   {
       
      
      private var tabLabelChanged:Boolean = false;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _48018227tabLabelUI:Text;
      
      private var _tabLabel:String;
      
      public function CustomTab()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "stylesFactory":function():void
                  {
                     this.borderSides = "left";
                     this.borderColor = 4604481;
                     this.borderThickness = 1;
                     this.borderStyle = "solid";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function():void
                        {
                           this.paddingLeft = 17;
                           this.paddingTop = 9;
                           this.paddingRight = 86;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"tabStyle",
                              "minWidth":100,
                              "height":29,
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":Text,
                                 "id":"tabLabelUI",
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "selectable":false,
                                       "styleName":"VB15WC",
                                       "name":"tabLabelUI"
                                    };
                                 }
                              })]
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "stylesFactory":function():void
                  {
                     this.backgroundColor = 0;
                     this.borderSides = "left bottom";
                     this.borderColor = 4604481;
                     this.borderThickness = 1;
                     this.borderStyle = "solid";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":9,
                        "percentWidth":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Spacer,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":1,
                        "percentWidth":100
                     };
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
            this.verticalGap = 0;
         };
      }
      
      private function set _925088673tabLabel(param1:String) : void
      {
         this._tabLabel = param1;
         this.tabLabelChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      [Bindable(event="propertyChange")]
      public function set tabLabel(param1:String) : void
      {
         var _loc2_:Object = this.tabLabel;
         if(_loc2_ !== param1)
         {
            this._925088673tabLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabLabel",_loc2_,param1));
         }
      }
      
      public function set tabLabelUI(param1:Text) : void
      {
         var _loc2_:Object = this._48018227tabLabelUI;
         if(_loc2_ !== param1)
         {
            this._48018227tabLabelUI = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabLabelUI",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      override protected function commitProperties() : void
      {
         if(this.tabLabelChanged)
         {
            this.tabLabelUI.htmlText = this._tabLabel;
            this.tabLabelChanged = false;
         }
         super.commitProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get tabLabelUI() : Text
      {
         return this._48018227tabLabelUI;
      }
      
      public function get tabLabel() : String
      {
         return this._tabLabel;
      }
   }
}
