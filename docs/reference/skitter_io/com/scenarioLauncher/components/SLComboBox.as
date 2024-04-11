package com.scenarioLauncher.components
{
   import com.scenarioLauncher.components.renderers.ListComboRenderer;
   import com.scenarioLauncher.views.common.CustomCanvas;
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
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.List;
   import mx.core.ClassFactory;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class SLComboBox extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
      
      private static const LIST_DISPLAY_DELAY:uint = 1500;
       
      
      private var _highLightSelectedItem:Boolean;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _3322014list:List;
      
      mx_internal var _watchers:Array;
      
      private var _1377687758button:com.scenarioLauncher.components.ButtonCombo;
      
      private var _type:String;
      
      private var _185056459_iconSystemVisible:Boolean;
      
      private var _2047990078listPaddingTop:Canvas;
      
      private var _462318446comboPrompt:Label;
      
      private var _selectedItem:Object;
      
      private var _comboToClose:ArrayCollection;
      
      private var _dropDownListHide:Boolean = false;
      
      private var _1728665219_prompt:String;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _838143798iconSystemDown:Image;
      
      private var _embed_mxml__1124217900:Class;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _embed_mxml__36247513:Class;
      
      private var _316196445_styleName:Object;
      
      mx_internal var _bindings:Array;
      
      private var _684669757iconSystemUp:Image;
      
      public function SLComboBox()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"listPaddingTop",
                  "propertiesFactory":function():Object
                  {
                     return {"visible":false};
                  }
               }),new UIComponentDescriptor({
                  "type":List,
                  "id":"list",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "visible":false,
                        "styleName":"slComboList",
                        "itemRenderer":_SLComboBox_ClassFactory1_c(),
                        "nullItemRenderer":_SLComboBox_ClassFactory2_c()
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":com.scenarioLauncher.components.ButtonCombo,
                  "id":"button",
                  "events":{"click":"__button_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"",
                        "buttonMode":true,
                        "useHandCursor":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"iconSystemUp",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "x":18,
                        "y":5,
                        "width":20,
                        "height":20,
                        "source":_embed_mxml__1124217900
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"iconSystemDown",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "x":18,
                        "y":5,
                        "width":20,
                        "height":20,
                        "source":_embed_mxml__36247513,
                        "visible":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"comboPrompt",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":2,
                        "mouseEnabled":false,
                        "mouseChildren":false
                     };
                  }
               })]};
            }
         });
         this._comboToClose = new ArrayCollection();
         this._embed_mxml__1124217900 = SLComboBox__embed_mxml__1124217900;
         this._embed_mxml__36247513 = SLComboBox__embed_mxml__36247513;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.clipContent = false;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         SLComboBox._watcherSetupUtil = param1;
      }
      
      public function get highLightSelectedItem() : Boolean
      {
         return this._highLightSelectedItem;
      }
      
      public function set highLightSelectedItem(param1:Boolean) : void
      {
         this._highLightSelectedItem = param1;
      }
      
      [Bindable(event="propertyChange")]
      private function get _prompt() : String
      {
         return this._1728665219_prompt;
      }
      
      public function set listPaddingTop(param1:Canvas) : void
      {
         var _loc2_:Object = this._2047990078listPaddingTop;
         if(_loc2_ !== param1)
         {
            this._2047990078listPaddingTop = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listPaddingTop",_loc2_,param1));
         }
      }
      
      public function set iconSystemUp(param1:Image) : void
      {
         var _loc2_:Object = this._684669757iconSystemUp;
         if(_loc2_ !== param1)
         {
            this._684669757iconSystemUp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconSystemUp",_loc2_,param1));
         }
      }
      
      private function onListRollOutHandler(param1:ListEvent) : void
      {
         this._dropDownListHide = true;
         setTimeout(this.hideDropdownList,LIST_DISPLAY_DELAY);
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:SLComboBox = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._SLComboBox_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_components_SLComboBoxWatcherSetupUtil");
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
      
      public function set iconSystemVisible(param1:Boolean) : void
      {
         this._iconSystemVisible = param1;
      }
      
      private function set _prompt(param1:String) : void
      {
         var _loc2_:Object = this._1728665219_prompt;
         if(_loc2_ !== param1)
         {
            this._1728665219_prompt = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_prompt",_loc2_,param1));
         }
      }
      
      public function __button_click(param1:MouseEvent) : void
      {
         this.onButtonClickHandler(param1);
      }
      
      private function set _iconSystemVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._185056459_iconSystemVisible;
         if(_loc2_ !== param1)
         {
            this._185056459_iconSystemVisible = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_iconSystemVisible",_loc2_,param1));
         }
      }
      
      public function set comboToClose(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ != null)
            {
               this._comboToClose.addItem(_loc2_);
            }
         }
      }
      
      private function set _3575610type(param1:String) : void
      {
         this._type = param1;
      }
      
      private function onListItemClickHandler(param1:ListEvent) : void
      {
         this.selectedItem = (param1.currentTarget as List).selectedItem;
         this.list.selectedItem = this.selectedItem;
         this.comboPrompt.setStyle("color",16777215);
         this.button.selected = false;
         this.listPaddingTop.visible = this.list.visible = false;
         if(this._iconSystemVisible)
         {
            this.iconSystemUp.visible = true;
            this.iconSystemDown.visible = false;
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("collectionChange")]
      [Bindable("change")]
      public function set selectedItem(param1:Object) : void
      {
         this._selectedItem = param1;
         this.list.selectedItem = param1;
         this.dispatchEvent(new ListEvent("change"));
      }
      
      public function hideDropdownList() : void
      {
         if(this._dropDownListHide)
         {
            if(this._iconSystemVisible)
            {
               this.iconSystemUp.visible = true;
               this.iconSystemDown.visible = false;
            }
            this.listPaddingTop.visible = this.list.visible = false;
            this.button.selected = false;
            this.comboPrompt.setStyle("color",16777215);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get comboPrompt() : Label
      {
         return this._462318446comboPrompt;
      }
      
      private function onListMouseOverHandler(param1:MouseEvent) : void
      {
         this._dropDownListHide = false;
      }
      
      private function _SLComboBox_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ListComboRenderer;
         return _loc1_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      private function _SLComboBox_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this.width;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this.width;
         _loc1_ = this.height;
         _loc1_ = this.type;
         _loc1_ = this._styleName;
         _loc1_ = this._iconSystemVisible;
         _loc1_ = this._iconSystemVisible ? 39 : 9;
         _loc1_ = this._prompt;
         _loc1_ = this.width - 30;
         _loc1_ = this.height - 3;
         _loc1_ = this._styleName;
      }
      
      private function onListRollOverHandler(param1:ListEvent) : void
      {
         this._dropDownListHide = false;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.button.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouseOverHandler);
         this.button.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouseOutHandler);
         this.button.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onListRollOverHandler);
         this.button.addEventListener(ListEvent.ITEM_ROLL_OUT,this.onListRollOutHandler);
         this.button.addEventListener(ListEvent.ITEM_CLICK,this.onListItemClickHandler);
         this.list.addEventListener(MouseEvent.MOUSE_OVER,this.onListMouseOverHandler);
         this.list.addEventListener(MouseEvent.MOUSE_OUT,this.onListMouseOutHandler);
         this.list.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onListRollOverHandler);
         this.list.addEventListener(ListEvent.ITEM_ROLL_OUT,this.onListRollOutHandler);
         this.list.addEventListener(ListEvent.ITEM_CLICK,this.onListItemClickHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get list() : List
      {
         return this._3322014list;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconSystemUp() : Image
      {
         return this._684669757iconSystemUp;
      }
      
      private function onListMouseOutHandler(param1:MouseEvent) : void
      {
         this._dropDownListHide = true;
         setTimeout(this.hideDropdownList,LIST_DISPLAY_DELAY);
      }
      
      private function _SLComboBox_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return this.width;
         },function(param1:Number):void
         {
            list.width = param1;
         },"list.width");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            list.verticalScrollPolicy = param1;
         },"list.verticalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return this.width;
         },function(param1:Number):void
         {
            button.width = param1;
         },"button.width");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return this.height;
         },function(param1:Number):void
         {
            button.height = param1;
         },"button.height");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = type;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            button.type = param1;
         },"button.type");
         result[4] = binding;
         binding = new Binding(this,function():Object
         {
            return _styleName;
         },function(param1:Object):void
         {
            button.styleName = param1;
         },"button.styleName");
         result[5] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _iconSystemVisible;
         },function(param1:Boolean):void
         {
            iconSystemUp.visible = param1;
         },"iconSystemUp.visible");
         result[6] = binding;
         binding = new Binding(this,function():Number
         {
            return _iconSystemVisible ? 39 : 9;
         },function(param1:Number):void
         {
            comboPrompt.x = param1;
         },"comboPrompt.x");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _prompt;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            comboPrompt.text = param1;
         },"comboPrompt.text");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return this.width - 30;
         },function(param1:Number):void
         {
            comboPrompt.width = param1;
         },"comboPrompt.width");
         result[9] = binding;
         binding = new Binding(this,function():Number
         {
            return this.height - 3;
         },function(param1:Number):void
         {
            comboPrompt.height = param1;
         },"comboPrompt.height");
         result[10] = binding;
         binding = new Binding(this,function():Object
         {
            return _styleName;
         },function(param1:Object):void
         {
            comboPrompt.styleName = param1;
         },"comboPrompt.styleName");
         result[11] = binding;
         return result;
      }
      
      public function set prompt(param1:String) : void
      {
         this._prompt = param1;
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get listPaddingTop() : Canvas
      {
         return this._2047990078listPaddingTop;
      }
      
      public function set iconSystemDown(param1:Image) : void
      {
         var _loc2_:Object = this._838143798iconSystemDown;
         if(_loc2_ !== param1)
         {
            this._838143798iconSystemDown = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconSystemDown",_loc2_,param1));
         }
      }
      
      override protected function onInitialize(param1:FlexEvent) : void
      {
         super.onInitialize(param1);
         this._styleName = this.styleName;
      }
      
      public function get iconSystemVisible() : Boolean
      {
         return this._iconSystemVisible;
      }
      
      private function set _styleName(param1:Object) : void
      {
         var _loc2_:Object = this._316196445_styleName;
         if(_loc2_ !== param1)
         {
            this._316196445_styleName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_styleName",_loc2_,param1));
         }
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedItem() : Object
      {
         return this._selectedItem;
      }
      
      public function set list(param1:List) : void
      {
         var _loc2_:Object = this._3322014list;
         if(_loc2_ !== param1)
         {
            this._3322014list = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"list",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get button() : com.scenarioLauncher.components.ButtonCombo
      {
         return this._1377687758button;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconSystemDown() : Image
      {
         return this._838143798iconSystemDown;
      }
      
      [Bindable(event="propertyChange")]
      private function get _iconSystemVisible() : Boolean
      {
         return this._185056459_iconSystemVisible;
      }
      
      public function set comboPrompt(param1:Label) : void
      {
         var _loc2_:Object = this._462318446comboPrompt;
         if(_loc2_ !== param1)
         {
            this._462318446comboPrompt = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"comboPrompt",_loc2_,param1));
         }
      }
      
      public function set button(param1:com.scenarioLauncher.components.ButtonCombo) : void
      {
         var _loc2_:Object = this._1377687758button;
         if(_loc2_ !== param1)
         {
            this._1377687758button = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"button",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set type(param1:String) : void
      {
         var _loc2_:Object = this.type;
         if(_loc2_ !== param1)
         {
            this._3575610type = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _styleName() : Object
      {
         return this._316196445_styleName;
      }
      
      [Bindable("collectionChange")]
      public function set dataProvider(param1:Object) : void
      {
         this.list.dataProvider = param1;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.list.height = (this.list.dataProvider as ArrayCollection).length * 22 + 14;
         this.list.y = -this.list.height + 6;
         this.listPaddingTop.width = this.width;
         this.listPaddingTop.y = this.list.y - 8;
         this.listPaddingTop.height = 8;
         this.listPaddingTop.setStyle("backgroundColor","0xe7e4e2");
      }
      
      private function onButtonClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this._iconSystemVisible)
         {
            this.iconSystemUp.visible = false;
            this.iconSystemDown.visible = true;
         }
         this.button.selected = true;
         this.comboPrompt.setStyle("color",12827575);
         this.listPaddingTop.visible = this.list.visible = true;
         for each(_loc2_ in this._comboToClose)
         {
            _loc2_.hideDropdownList();
         }
      }
      
      private function _SLComboBox_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ListComboRenderer;
         return _loc1_;
      }
   }
}
