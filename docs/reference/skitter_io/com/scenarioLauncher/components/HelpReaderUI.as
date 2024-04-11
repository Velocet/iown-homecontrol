package com.scenarioLauncher.components
{
   import com.keepcore.KCTimeAnalyzer;
   import com.scenarioLauncher.components.renderers.HelpTopicRenderer;
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
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.effects.Move;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.styles.*;
   
   public class HelpReaderUI extends Canvas
   {
      
      public static const SCROLL_OFFSET:int = 150;
      
      public static const SCROLL_DURATION:int = 200;
       
      
      private var _xmlContent:XML;
      
      public var selectedHelpQuestion:HelpQuestion = null;
      
      public var selectedHelpTopic:HelpTopic = null;
      
      private var _1697755034scrollUpButton:Button;
      
      private var _dataProvider:XML = null;
      
      private var _530004280mainContainer:VBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _guiInitialized:Boolean = false;
      
      private var yDown:Number = 0;
      
      private var moveEffect:Move;
      
      private var _865067743scrollDownButton:Button;
      
      private var ypos:Number = 0;
      
      private var _title:String = "";
      
      private var xmlContentChanged:Boolean = false;
      
      private var yUp:Number = 0;
      
      public function HelpReaderUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "id":"mainContainer",
                  "stylesFactory":function():void
                  {
                     this.paddingLeft = 87;
                     this.paddingTop = 17;
                     this.paddingRight = 30;
                     this.paddingBottom = 5;
                     this.verticalGap = 10;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":97,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"scrollUpButton",
                  "events":{"click":"__scrollUpButton_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "width":20,
                        "height":20,
                        "label":"U",
                        "x":910,
                        "y":20,
                        "styleName":"scrollUpButton",
                        "useHandCursor":true,
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"scrollDownButton",
                  "events":{"click":"__scrollDownButton_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "width":20,
                        "height":20,
                        "label":"D",
                        "x":910,
                        "y":300,
                        "styleName":"scrollDownButton",
                        "useHandCursor":true,
                        "buttonMode":true
                     };
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___HelpReaderUI_Canvas1_creationComplete);
      }
      
      public function __scrollUpButton_click(param1:MouseEvent) : void
      {
         this.scrollUpHandler(param1);
      }
      
      private function extractTopics() : ArrayCollection
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc5_:HelpTopic = null;
         var _loc6_:XMLList = null;
         var _loc7_:* = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:HelpQuestion = null;
         var _loc1_:XMLList = this._xmlContent.topic;
         var _loc2_:ArrayCollection = new ArrayCollection();
         for each(_loc3_ in _loc1_)
         {
            _loc4_ = _loc3_.@title;
            _loc5_ = new HelpTopic();
            this.title = _loc4_;
            _loc5_.title = _loc4_;
            _loc2_.addItem(_loc5_);
            _loc6_ = _loc3_.question;
            for each(_loc7_ in _loc6_)
            {
               _loc8_ = String(_loc7_.@title);
               _loc9_ = _loc7_.text();
               _loc10_ = new HelpQuestion(_loc8_,_loc9_);
               _loc5_.questions.addItem(_loc10_);
            }
         }
         return _loc2_;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set dataProvider(param1:XML) : void
      {
         this._xmlContent = param1;
         this.xmlContentChanged = true;
         invalidateProperties();
      }
      
      private function helpItemSelectedHandler(param1:HelpReaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:HelpReaderEvent = null;
         KCTimeAnalyzer.Tracer("CLICK",0);
         var _loc2_:Array = this.mainContainer.getChildren();
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new HelpReaderEvent(HelpReaderEvent.HELP_ITEMS_REFRESH)).helpQuestion = param1.helpQuestion;
            _loc4_.helpTopic = param1.helpTopic;
            _loc3_.dispatchEvent(_loc4_);
         }
         this.yUp = Math.min(0,this.mainContainer.y + SCROLL_OFFSET);
         this.yDown = Math.max(Math.min(0,height - this.mainContainer.height),this.mainContainer.y - SCROLL_OFFSET);
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollDownButton() : Button
      {
         return this._865067743scrollDownButton;
      }
      
      private function set _110371416title(param1:String) : void
      {
         this._title = param1;
      }
      
      private function refreshData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:ArrayCollection = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:HelpTopicRenderer = null;
         if(this.mainContainer != null)
         {
            _loc1_ = this.mainContainer.getChildren();
            if(_loc1_.length > 0)
            {
               for each(_loc4_ in _loc1_)
               {
                  if(_loc4_.hasEventListener(HelpReaderEvent.HELP_ITEM_SELECTED))
                  {
                     _loc4_.removeEventListener(HelpReaderEvent.HELP_ITEM_SELECTED,this.helpItemSelectedHandler);
                  }
                  if(_loc4_.hasEventListener(HelpReaderEvent.HELP_ITEM_SELECTED))
                  {
                     this.mainContainer.removeAllChildren();
                  }
               }
            }
            _loc2_ = this.extractTopics();
            for each(_loc3_ in _loc2_)
            {
               (_loc5_ = new HelpTopicRenderer()).helpReader = this;
               _loc5_.addEventListener(HelpReaderEvent.HELP_ITEM_SELECTED,this.helpItemSelectedHandler,false,0,true);
               _loc5_.addEventListener(HelpReaderEvent.HELP_ITEM_CLOSED,this.helpItemClosedHandler,false,0,true);
               _loc5_.data = _loc3_;
               _loc5_.percentWidth = 100;
               this.mainContainer.addChild(_loc5_);
            }
         }
      }
      
      public function set mainContainer(param1:VBox) : void
      {
         var _loc2_:Object = this._530004280mainContainer;
         if(_loc2_ !== param1)
         {
            this._530004280mainContainer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainContainer",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollUpButton() : Button
      {
         return this._1697755034scrollUpButton;
      }
      
      private function helpItemClosedHandler(param1:HelpReaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:HelpReaderEvent = null;
         var _loc2_:Array = this.mainContainer.getChildren();
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new HelpReaderEvent(HelpReaderEvent.HELP_ITEM_OPEN)).helpQuestion = param1.helpQuestion;
            _loc4_.helpTopic = param1.helpTopic;
            _loc3_.dispatchEvent(_loc4_);
         }
      }
      
      public function ___HelpReaderUI_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this.title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
         }
      }
      
      protected function onCreationComplete(param1:FlexEvent) : void
      {
         this.moveEffect = new Move();
         this.moveEffect.duration = SCROLL_DURATION;
         this.moveEffect.addEventListener(EffectEvent.EFFECT_END,this.effectEndHandler);
         this.mainContainer.addEventListener(MouseEvent.MOUSE_WHEEL,this.scrollHandler);
         this.mainContainer.addEventListener(ResizeEvent.RESIZE,this.onResizeHandler);
         this._guiInitialized = true;
         invalidateProperties();
      }
      
      private function scrollHandler(param1:MouseEvent) : void
      {
         if(param1.delta > 0 && this.scrollUpButton.enabled)
         {
            this.scrollUpHandler();
         }
         else if(param1.delta < 0 && this.scrollDownButton.enabled)
         {
            this.scrollDownHandler();
         }
      }
      
      public function set scrollUpButton(param1:Button) : void
      {
         var _loc2_:Object = this._1697755034scrollUpButton;
         if(_loc2_ !== param1)
         {
            this._1697755034scrollUpButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollUpButton",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainContainer() : VBox
      {
         return this._530004280mainContainer;
      }
      
      public function set scrollDownButton(param1:Button) : void
      {
         var _loc2_:Object = this._865067743scrollDownButton;
         if(_loc2_ !== param1)
         {
            this._865067743scrollDownButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollDownButton",_loc2_,param1));
         }
      }
      
      public function get dataProvider() : XML
      {
         return this._dataProvider;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.xmlContentChanged && this._guiInitialized)
         {
            this.xmlContentChanged = false;
            if(this.mainContainer != null)
            {
               this.mainContainer.y = 0;
            }
            this.refreshData();
         }
      }
      
      private function onResizeHandler(param1:ResizeEvent) : void
      {
         this.scrollUpButton.visible = this.mainContainer.height > height || this.mainContainer.y < 0;
         this.scrollDownButton.visible = this.mainContainer.height > height || this.mainContainer.y < 0;
         this.handleVisibility();
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      private function handleVisibility() : void
      {
         if(this.mainContainer.y == this.yUp)
         {
            this.scrollUpButton.visible = false;
            this.scrollDownButton.visible = true;
         }
         else if(this.mainContainer.y == this.yDown)
         {
            this.scrollUpButton.visible = true;
            this.scrollDownButton.visible = false;
         }
         if(this.mainContainer.height < height)
         {
            this.scrollUpButton.visible = false;
            this.scrollDownButton.visible = false;
         }
      }
      
      private function scrollDownHandler(param1:MouseEvent = null) : void
      {
         this.scrollUpButton.enabled = false;
         this.scrollDownButton.enabled = false;
         this.yDown = Math.max(Math.min(0,height - this.mainContainer.height),this.mainContainer.y - SCROLL_OFFSET);
         this.moveEffect.yFrom = this.mainContainer.y;
         this.moveEffect.yTo = this.yDown;
         this.moveEffect.target = this.mainContainer;
         this.moveEffect.play();
      }
      
      private function effectEndHandler(param1:EffectEvent) : void
      {
         this.scrollUpButton.enabled = true;
         this.scrollDownButton.enabled = true;
         this.handleVisibility();
      }
      
      private function scrollUpHandler(param1:MouseEvent = null) : void
      {
         this.scrollUpButton.enabled = false;
         this.scrollDownButton.enabled = false;
         this.yUp = Math.min(0,this.mainContainer.y + SCROLL_OFFSET);
         this.moveEffect.yFrom = this.mainContainer.y;
         this.moveEffect.yTo = Math.min(0,this.mainContainer.y + SCROLL_OFFSET);
         this.moveEffect.target = this.mainContainer;
         this.moveEffect.play();
      }
      
      public function __scrollDownButton_click(param1:MouseEvent) : void
      {
         this.scrollDownHandler(param1);
      }
      
      public function removeAll() : void
      {
         this.selectedHelpQuestion = null;
         this.selectedHelpTopic = null;
         if(this.mainContainer)
         {
            this.mainContainer.removeAllChildren();
         }
      }
   }
}
