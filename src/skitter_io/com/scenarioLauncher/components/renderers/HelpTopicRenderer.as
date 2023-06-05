package com.scenarioLauncher.components.renderers
{
   import com.scenarioLauncher.components.HelpReaderUI;
   import com.scenarioLauncher.datamodel.HelpQuestion;
   import com.scenarioLauncher.datamodel.HelpTopic;
   import com.scenarioLauncher.events.HelpReaderEvent;
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
   import mx.controls.Label;
   import mx.controls.Spacer;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class HelpTopicRenderer extends Canvas
   {
       
      
      public var helpReader:HelpReaderUI;
      
      private var _1768009292questionsContainer:VBox;
      
      private var helpTopic:HelpTopic;
      
      private var _935240181topicTitleLabel:Label;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _1870027693titleBox:HBox;
      
      public function HelpTopicRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":HBox,
                           "id":"titleBox",
                           "stylesFactory":function():void
                           {
                              this.verticalAlign = "middle";
                              this.horizontalAlign = "left";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "verticalScrollPolicy":"off",
                                 "horizontalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function():void
                                    {
                                       this.backgroundColor = 16758037;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":9,
                                          "height":9
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"topicTitleLabel",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"helpTopic",
                                          "percentWidth":100
                                       };
                                    }
                                 })]
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "verticalScrollPolicy":"off",
                                 "horizontalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Spacer,
                                    "propertiesFactory":function():Object
                                    {
                                       return {"width":98};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"questionsContainer",
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":100,
                                          "mouseChildren":true,
                                          "verticalScrollPolicy":"off",
                                          "horizontalScrollPolicy":"off"
                                       };
                                    }
                                 })]
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
         this.addEventListener("creationComplete",this.___HelpTopicRenderer_Canvas1_creationComplete);
      }
      
      public function ___HelpTopicRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete(param1);
      }
      
      private function helpItemOpenHandler(param1:HelpReaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = this.questionsContainer.getChildren();
         for each(_loc3_ in _loc2_)
         {
            _loc3_.dispatchEvent(param1.clone());
         }
      }
      
      private function helpItemsRefreshHandler(param1:HelpReaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = this.questionsContainer.getChildren();
         for each(_loc3_ in _loc2_)
         {
            _loc3_.dispatchEvent(param1.clone());
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      [Bindable(event="propertyChange")]
      public function get topicTitleLabel() : Label
      {
         return this._935240181topicTitleLabel;
      }
      
      [Bindable(event="propertyChange")]
      public function get titleBox() : HBox
      {
         return this._1870027693titleBox;
      }
      
      public function set topicTitleLabel(param1:Label) : void
      {
         var _loc2_:Object = this._935240181topicTitleLabel;
         if(_loc2_ !== param1)
         {
            this._935240181topicTitleLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topicTitleLabel",_loc2_,param1));
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.helpTopic = HelpTopic(param1);
         this.refreshData();
      }
      
      private function helpItemSelectedHandler(param1:HelpReaderEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function refreshData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:HelpQuestionRenderer = null;
         if(this.questionsContainer != null && this.helpTopic != null)
         {
            this.questionsContainer.removeAllChildren();
            if(this.helpTopic != null)
            {
               this.topicTitleLabel.text = this.helpTopic.title;
               _loc1_ = 1;
               for each(_loc2_ in this.helpTopic.questions)
               {
                  _loc3_ = new HelpQuestionRenderer();
                  _loc3_.helpReader = this.helpReader;
                  _loc3_.percentWidth = 100;
                  _loc2_.title = _loc1_++ + ". " + _loc2_.title;
                  _loc3_.data = _loc2_;
                  _loc3_.addEventListener(HelpReaderEvent.HELP_ITEM_SELECTED,this.helpItemSelectedHandler);
                  _loc3_.addEventListener(HelpReaderEvent.HELP_ITEM_CLOSED,this.helpItemClosedHandler);
                  this.questionsContainer.addChild(_loc3_);
               }
            }
         }
      }
      
      public function set questionsContainer(param1:VBox) : void
      {
         var _loc2_:Object = this._1768009292questionsContainer;
         if(_loc2_ !== param1)
         {
            this._1768009292questionsContainer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questionsContainer",_loc2_,param1));
         }
      }
      
      private function helpItemClosedHandler(param1:HelpReaderEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      [Bindable(event="propertyChange")]
      public function get questionsContainer() : VBox
      {
         return this._1768009292questionsContainer;
      }
      
      public function set titleBox(param1:HBox) : void
      {
         var _loc2_:Object = this._1870027693titleBox;
         if(_loc2_ !== param1)
         {
            this._1870027693titleBox = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleBox",_loc2_,param1));
         }
      }
      
      protected function onCreationComplete(param1:FlexEvent) : void
      {
         addEventListener(HelpReaderEvent.HELP_ITEMS_REFRESH,this.helpItemsRefreshHandler);
         addEventListener(HelpReaderEvent.HELP_ITEM_OPEN,this.helpItemOpenHandler);
         this.refreshData();
      }
   }
}
