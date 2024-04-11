package com.scenarioLauncher.components.renderers
{
   import com.scenarioLauncher.components.SLComboBox;
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
   import mx.controls.Label;
   import mx.controls.List;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class ListComboRenderer extends HBox implements IBindingClient, IDropInListItemRenderer
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1395391296cColor:Canvas;
      
      private var _listData:BaseListData;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1472470539_label:String;
      
      private var _587182482_labelColor:uint = 0;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindings:Array;
      
      public var _ListComboRenderer_Label1:Label;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _selected:Boolean = false;
      
      public function ListComboRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function():Object
            {
               return {
                  "height":22,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"cColor",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100,
                           "buttonMode":true,
                           "useHandCursor":true,
                           "horizontalScrollPolicy":"off",
                           "verticalScrollPolicy":"off",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Label,
                              "id":"_ListComboRenderer_Label1",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "mouseChildren":false,
                                    "mouseEnabled":false
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.paddingLeft = 5;
            this.paddingRight = 5;
            this.paddingBottom = 0;
            this.paddingTop = 0;
            this.horizontalGap = 0;
            this.verticalGap = 0;
         };
         this.buttonMode = true;
         this.useHandCursor = true;
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.height = 22;
         this.addEventListener("creationComplete",this.___ListComboRenderer_HBox1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         ListComboRenderer._watcherSetupUtil = param1;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 != null)
         {
            if(param1.label != this._label)
            {
               this._label = param1.label as String;
            }
            if((this._listData.owner as List).selectedItem == param1 && (parentDocument as SLComboBox).highLightSelectedItem)
            {
               this._selected = true;
               this._labelColor = 16758037;
            }
            else
            {
               this._selected = false;
               this._labelColor = 0;
            }
         }
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
      
      private function set _labelColor(param1:uint) : void
      {
         var _loc2_:Object = this._587182482_labelColor;
         if(_loc2_ !== param1)
         {
            this._587182482_labelColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelColor",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:ListComboRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._ListComboRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_components_renderers_ListComboRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      protected function hbox1_creationCompleteHandler(param1:FlexEvent) : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onhbox_mouseHoverHandler);
         addEventListener(MouseEvent.MOUSE_OUT,this.onhbox_mouseOutHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get cColor() : Canvas
      {
         return this._1395391296cColor;
      }
      
      public function ___ListComboRenderer_HBox1_creationComplete(param1:FlexEvent) : void
      {
         this.hbox1_creationCompleteHandler(param1);
      }
      
      protected function onhbox_mouseOutHandler(param1:MouseEvent) : void
      {
         this.cColor.setStyle("backgroundColor",15197410);
         if(this._selected)
         {
            this._labelColor = 16758037;
         }
         else
         {
            this._labelColor = 0;
         }
      }
      
      private function set _label(param1:String) : void
      {
         var _loc2_:Object = this._1472470539_label;
         if(_loc2_ !== param1)
         {
            this._1472470539_label = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_label",_loc2_,param1));
         }
      }
      
      private function _ListComboRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _ListComboRenderer_Label1.text = param1;
         },"_ListComboRenderer_Label1.text");
         result[0] = binding;
         binding = new Binding(this,function():uint
         {
            return _labelColor;
         },function(param1:uint):void
         {
            _ListComboRenderer_Label1.setStyle("color",param1);
         },"_ListComboRenderer_Label1.color");
         result[1] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      private function get _labelColor() : uint
      {
         return this._587182482_labelColor;
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set cColor(param1:Canvas) : void
      {
         var _loc2_:Object = this._1395391296cColor;
         if(_loc2_ !== param1)
         {
            this._1395391296cColor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cColor",_loc2_,param1));
         }
      }
      
      private function _ListComboRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._label;
         _loc1_ = this._labelColor;
      }
      
      protected function onhbox_mouseHoverHandler(param1:MouseEvent) : void
      {
         this.cColor.setStyle("backgroundColor",11840165);
         this._labelColor = 16777215;
      }
   }
}
