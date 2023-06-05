package com.scenarioLauncher.components.renderers
{
   import com.scenarioLauncher.components.HelpReaderUI;
   import com.scenarioLauncher.datamodel.HelpQuestion;
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
   import mx.containers.VBox;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.effects.Resize;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class HelpQuestionRenderer extends Canvas
   {
       
      
      private var _1458624095questionTitleText:Text;
      
      private var helpQuestion:HelpQuestion;
      
      public var helpReader:HelpReaderUI;
      
      private var tempHeight:Number = -1;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _959441419answerText:Text;
      
      public function HelpQuestionRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.verticalAlign = "top";
                     this.horizontalAlign = "left";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "verticalScrollPolicy":"off",
                        "horizontalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"questionTitleText",
                           "events":{"click":"__questionTitleText_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"helpQuestion",
                                 "percentWidth":100,
                                 "selectable":true,
                                 "buttonMode":true,
                                 "mouseChildren":false,
                                 "useHandCursor":true
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"answerText",
                           "stylesFactory":function():void
                           {
                              this.paddingLeft = 20;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "visible":false,
                                 "styleName":"helpAnswer",
                                 "includeInLayout":false,
                                 "width":700
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
         this.addEventListener("creationComplete",this.___HelpQuestionRenderer_Canvas1_creationComplete);
      }
      
      [Bindable(event="propertyChange")]
      public function get answerText() : Text
      {
         return this._959441419answerText;
      }
      
      public function __questionTitleText_click(param1:MouseEvent) : void
      {
         this.clickHandler(param1);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function helpItemOpenHandler(param1:HelpReaderEvent) : void
      {
         if(param1.helpQuestion == this.helpQuestion)
         {
            this.helpReader.selectedHelpQuestion = this.helpQuestion;
         }
      }
      
      public function set answerText(param1:Text) : void
      {
         var _loc2_:Object = this._959441419answerText;
         if(_loc2_ !== param1)
         {
            this._959441419answerText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"answerText",_loc2_,param1));
         }
      }
      
      private function helpItemSelectedHandler(param1:HelpReaderEvent) : void
      {
         var _loc2_:Resize = null;
         if(param1.helpQuestion != this.helpQuestion && this.answerText.visible)
         {
            this.questionTitleText.setStyle("color","0x000000");
            this.answerText.setStyle("color","0x000000");
            this.helpReader.selectedHelpQuestion = param1.helpQuestion;
            this.helpReader.selectedHelpTopic = param1.helpTopic;
            _loc2_ = new Resize(this.answerText);
            this.tempHeight = this.answerText.height;
            _loc2_.heightFrom = this.answerText.height;
            _loc2_.duration = 500;
            _loc2_.heightTo = 0;
            _loc2_.addEventListener(EffectEvent.EFFECT_END,this.effectEndHandler);
            _loc2_.play();
         }
         else if(this.helpReader.selectedHelpQuestion == null)
         {
            this.helpReader.selectedHelpQuestion = this.helpQuestion;
            this.openText();
         }
         else if(param1.helpQuestion == this.helpQuestion)
         {
            this.openText();
         }
      }
      
      private function openText() : void
      {
         this.answerText.includeInLayout = true;
         this.answerText.visible = true;
         if(this.tempHeight < 0)
         {
            this.tempHeight = this.answerText.height;
         }
         this.answerText.height = 0;
         var _loc1_:Resize = new Resize(this.answerText);
         _loc1_.duration = 500;
         _loc1_.heightFrom = 0;
         _loc1_.heightTo = this.tempHeight;
         _loc1_.play();
         this.questionTitleText.setStyle("color","0xaf465a");
         this.answerText.setStyle("color","0xaf465a");
      }
      
      [Bindable(event="propertyChange")]
      public function get questionTitleText() : Text
      {
         return this._1458624095questionTitleText;
      }
      
      private function effectEndHandler(param1:EffectEvent) : void
      {
         this.answerText.includeInLayout = false;
         this.answerText.visible = false;
         this.answerText.height = this.tempHeight;
         var _loc2_:HelpReaderEvent = new HelpReaderEvent(HelpReaderEvent.HELP_ITEM_CLOSED);
         _loc2_.helpQuestion = this.helpReader.selectedHelpQuestion;
         _loc2_.helpTopic = this.helpReader.selectedHelpTopic;
         dispatchEvent(_loc2_);
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         this.helpReader.selectedHelpQuestion = this.helpQuestion;
         var _loc2_:Boolean = this.answerText.visible;
         var _loc3_:HelpReaderEvent = new HelpReaderEvent(HelpReaderEvent.HELP_ITEM_SELECTED);
         _loc3_.helpQuestion = this.helpQuestion;
         dispatchEvent(_loc3_);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this.helpQuestion = HelpQuestion(param1);
         this.refreshData();
      }
      
      private function refreshData() : void
      {
         if(this.questionTitleText != null && this.answerText != null && this.helpQuestion != null)
         {
            this.questionTitleText.text = this.helpQuestion.title;
            this.answerText.text = this.helpQuestion.answer;
         }
      }
      
      public function ___HelpQuestionRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete(param1);
      }
      
      protected function onCreationComplete(param1:FlexEvent) : void
      {
         addEventListener(HelpReaderEvent.HELP_ITEMS_REFRESH,this.helpItemSelectedHandler);
         addEventListener(HelpReaderEvent.HELP_ITEM_OPEN,this.helpItemOpenHandler);
         this.refreshData();
      }
      
      public function set questionTitleText(param1:Text) : void
      {
         var _loc2_:Object = this._1458624095questionTitleText;
         if(_loc2_ !== param1)
         {
            this._1458624095questionTitleText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"questionTitleText",_loc2_,param1));
         }
      }
   }
}
