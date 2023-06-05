package com.scenarioLauncher.views.renderers
{
   import com.keepcore.LineLimitedText;
   import com.scenarioLauncher.events.RemoteEvent;
   import com.scenarioLauncher.views.util.RemoteUtil;
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
   import ioService.datamodel.Skitter;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.DynamicEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class RemoteTileListRenderer extends Canvas implements IBindingClient, IDropInListItemRenderer
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1041126385remoteName:Text;
      
      private var _highLight:ColorTransform;
      
      mx_internal var _watchers:Array;
      
      private var _6091847remoteImageButton:Button;
      
      private var _1955583783_rightScenarioLabel:String = "";
      
      private var _2001617460rightScenario:LineLimitedText;
      
      private var dataChanged:Boolean = false;
      
      private var _1460764855leftScenario:LineLimitedText;
      
      private var _804894522scenario1Image:Image;
      
      private var _1469999309_visible:Boolean = true;
      
      private var _1472470539_label:String;
      
      private var _1056883818caseRemote:Image;
      
      private var _listData:BaseListData;
      
      private var _111464958_leftScenarioLabel:String = "";
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _833523673scenario2Image:Image;
      
      private var _darker:ColorTransform;
      
      private var _316196445_styleName:Class;
      
      private var _491997949_visibleCase:Boolean = false;
      
      private var _594782856enableHandCursor:Boolean = true;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _remote:Skitter;
      
      private var _embed_mxml__658891085:Class;
      
      mx_internal var _bindings:Array;
      
      private var unknownName:String = "...";
      
      private var _embed_mxml__658888039:Class;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function RemoteTileListRenderer()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Text,
                  "id":"remoteName",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "selectable":false,
                        "name":"remoteName",
                        "width":216,
                        "y":0,
                        "styleName":"VB12WCL0LSm01",
                        "mouseChildren":false,
                        "mouseEnabled":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"remoteImageButton",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"remoteImageButton",
                        "buttonMode":true,
                        "styleName":"remoteControl",
                        "labelPlacement":"bottom",
                        "tabEnabled":true,
                        "x":0,
                        "y":25,
                        "width":194,
                        "height":194
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"caseRemote",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"caseRemote",
                        "x":11,
                        "y":25,
                        "width":200,
                        "height":200
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":LineLimitedText,
                  "id":"leftScenario",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "maxLines":2,
                        "name":"leftScenario",
                        "styleName":"VR10BCL0LSm01",
                        "x":55,
                        "y":129,
                        "width":53,
                        "mouseChildren":false,
                        "mouseEnabled":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":LineLimitedText,
                  "id":"rightScenario",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "maxLines":2,
                        "name":"rightScenario",
                        "styleName":"VR10BCL0LSm01",
                        "x":106,
                        "y":129,
                        "width":53,
                        "mouseChildren":false,
                        "mouseEnabled":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"scenario1Image",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__658891085,
                        "x":69,
                        "y":79,
                        "width":32,
                        "height":34,
                        "mouseChildren":false,
                        "mouseEnabled":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"scenario2Image",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "source":_embed_mxml__658888039,
                        "x":119,
                        "y":79,
                        "width":32,
                        "height":34,
                        "mouseChildren":false,
                        "mouseEnabled":false
                     };
                  }
               })]};
            }
         });
         this._1472470539_label = this.unknownName;
         this._highLight = new ColorTransform(1,1,1,1,0,0,0,0);
         this._darker = new ColorTransform(0.3,0.3,0.3,1,0,0,0,0);
         this._embed_mxml__658888039 = RemoteTileListRenderer__embed_mxml__658888039;
         this._embed_mxml__658891085 = RemoteTileListRenderer__embed_mxml__658891085;
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
            this.backgroundAlpha = 0;
         };
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___RemoteTileListRenderer_Canvas1_creationComplete);
         this.addEventListener("click",this.___RemoteTileListRenderer_Canvas1_click);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RemoteTileListRenderer._watcherSetupUtil = param1;
      }
      
      private function set _leftScenarioLabel(param1:String) : void
      {
         var _loc2_:Object = this._111464958_leftScenarioLabel;
         if(_loc2_ !== param1)
         {
            this._111464958_leftScenarioLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_leftScenarioLabel",_loc2_,param1));
         }
      }
      
      private function set _visibleCase(param1:Boolean) : void
      {
         var _loc2_:Object = this._491997949_visibleCase;
         if(_loc2_ !== param1)
         {
            this._491997949_visibleCase = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_visibleCase",_loc2_,param1));
         }
      }
      
      private function set _visible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1469999309_visible;
         if(_loc2_ !== param1)
         {
            this._1469999309_visible = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_visible",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _visibleCase() : Boolean
      {
         return this._491997949_visibleCase;
      }
      
      private function _RemoteTileListRenderer_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _label;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            remoteName.htmlText = param1;
         },"remoteName.htmlText");
         result[0] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            remoteName.visible = param1;
         },"remoteName.visible");
         result[1] = binding;
         binding = new Binding(this,function():Boolean
         {
            return enableHandCursor;
         },function(param1:Boolean):void
         {
            remoteImageButton.useHandCursor = param1;
         },"remoteImageButton.useHandCursor");
         result[2] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            remoteImageButton.visible = param1;
         },"remoteImageButton.visible");
         result[3] = binding;
         binding = new Binding(this,function():Object
         {
            return _styleName;
         },function(param1:Object):void
         {
            caseRemote.source = param1;
         },"caseRemote.source");
         result[4] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visibleCase;
         },function(param1:Boolean):void
         {
            caseRemote.visible = param1;
         },"caseRemote.visible");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _leftScenarioLabel;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            leftScenario.htmlText = param1;
         },"leftScenario.htmlText");
         result[6] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            leftScenario.visible = param1;
         },"leftScenario.visible");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _rightScenarioLabel;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            rightScenario.htmlText = param1;
         },"rightScenario.htmlText");
         result[8] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            rightScenario.visible = param1;
         },"rightScenario.visible");
         result[9] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            scenario1Image.visible = param1;
         },"scenario1Image.visible");
         result[10] = binding;
         binding = new Binding(this,function():Boolean
         {
            return _visible;
         },function(param1:Boolean):void
         {
            scenario2Image.visible = param1;
         },"scenario2Image.visible");
         result[11] = binding;
         return result;
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
      
      [Bindable(event="propertyChange")]
      public function get enableHandCursor() : Boolean
      {
         return this._594782856enableHandCursor;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RemoteTileListRenderer = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RemoteTileListRenderer_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_renderers_RemoteTileListRendererWatcherSetupUtil");
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
      
      private function _RemoteTileListRenderer_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._label;
         _loc1_ = this._visible;
         _loc1_ = this.enableHandCursor;
         _loc1_ = this._visible;
         _loc1_ = this._styleName;
         _loc1_ = this._visibleCase;
         _loc1_ = this._leftScenarioLabel;
         _loc1_ = this._visible;
         _loc1_ = this._rightScenarioLabel;
         _loc1_ = this._visible;
         _loc1_ = this._visible;
         _loc1_ = this._visible;
      }
      
      public function set rightScenario(param1:LineLimitedText) : void
      {
         var _loc2_:Object = this._2001617460rightScenario;
         if(_loc2_ !== param1)
         {
            this._2001617460rightScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightScenario",_loc2_,param1));
         }
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:DynamicEvent = new DynamicEvent(RemoteEvent.REMOTE_CONTROL_CLICK);
         _loc2_.remote = this._remote;
         _loc2_.renderer = this;
         this.listData.owner.dispatchEvent(_loc2_);
      }
      
      [Bindable(event="propertyChange")]
      public function get caseRemote() : Image
      {
         return this._1056883818caseRemote;
      }
      
      [Bindable(event="propertyChange")]
      private function get _rightScenarioLabel() : String
      {
         return this._1955583783_rightScenarioLabel;
      }
      
      public function set enableHandCursor(param1:Boolean) : void
      {
         var _loc2_:Object = this._594782856enableHandCursor;
         if(_loc2_ !== param1)
         {
            this._594782856enableHandCursor = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"enableHandCursor",_loc2_,param1));
         }
      }
      
      private function set _styleName(param1:Class) : void
      {
         var _loc2_:Object = this._316196445_styleName;
         if(_loc2_ !== param1)
         {
            this._316196445_styleName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_styleName",_loc2_,param1));
         }
      }
      
      public function ___RemoteTileListRenderer_Canvas1_click(param1:MouseEvent) : void
      {
         this.clickHandler(param1);
      }
      
      public function set remoteImageButton(param1:Button) : void
      {
         var _loc2_:Object = this._6091847remoteImageButton;
         if(_loc2_ !== param1)
         {
            this._6091847remoteImageButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteImageButton",_loc2_,param1));
         }
      }
      
      public function set scenario2Image(param1:Image) : void
      {
         var _loc2_:Object = this._833523673scenario2Image;
         if(_loc2_ !== param1)
         {
            this._833523673scenario2Image = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenario2Image",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get leftScenario() : LineLimitedText
      {
         return this._1460764855leftScenario;
      }
      
      public function set caseRemote(param1:Image) : void
      {
         var _loc2_:Object = this._1056883818caseRemote;
         if(_loc2_ !== param1)
         {
            this._1056883818caseRemote = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"caseRemote",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _visible() : Boolean
      {
         return this._1469999309_visible;
      }
      
      private function dataChangedHandler(param1:FlexEvent) : void
      {
         this.dataChanged = true;
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get rightScenario() : LineLimitedText
      {
         return this._2001617460rightScenario;
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteImageButton() : Button
      {
         return this._6091847remoteImageButton;
      }
      
      public function set listData(param1:BaseListData) : void
      {
         this._listData = param1;
      }
      
      public function ___RemoteTileListRenderer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._remote != null)
         {
            this._visible = true;
            this._styleName = RemoteUtil.getImageCaseStyleName(this._remote);
            if(this._styleName != null)
            {
               this._visibleCase = true;
            }
            if(!this._remote.active)
            {
               this.transform.colorTransform = this._darker;
            }
            else
            {
               this.transform.colorTransform = this._highLight;
            }
            if(this._remote.name != "")
            {
               this._label = this._remote.name;
            }
            else
            {
               this._label = this.unknownName;
            }
            if(this._remote.ScenarioOnButton1 != null)
            {
               this._leftScenarioLabel = this._remote.ScenarioOnButton1.name;
            }
            else
            {
               this._leftScenarioLabel = "";
            }
            if(this._remote.ScenarioOnButton2 != null)
            {
               this._rightScenarioLabel = this._remote.ScenarioOnButton2.name;
            }
            else
            {
               this._rightScenarioLabel = "";
            }
         }
         else if(this.remoteImageButton)
         {
            this._visible = false;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._remote = param1 as Skitter;
         this.dataChanged = true;
         invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get scenario1Image() : Image
      {
         return this._804894522scenario1Image;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenario2Image() : Image
      {
         return this._833523673scenario2Image;
      }
      
      [Bindable(event="propertyChange")]
      private function get _styleName() : Class
      {
         return this._316196445_styleName;
      }
      
      private function set _rightScenarioLabel(param1:String) : void
      {
         var _loc2_:Object = this._1955583783_rightScenarioLabel;
         if(_loc2_ !== param1)
         {
            this._1955583783_rightScenarioLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_rightScenarioLabel",_loc2_,param1));
         }
      }
      
      public function get listData() : BaseListData
      {
         return this._listData;
      }
      
      public function set remoteName(param1:Text) : void
      {
         var _loc2_:Object = this._1041126385remoteName;
         if(_loc2_ !== param1)
         {
            this._1041126385remoteName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"remoteName",_loc2_,param1));
         }
      }
      
      public function set leftScenario(param1:LineLimitedText) : void
      {
         var _loc2_:Object = this._1460764855leftScenario;
         if(_loc2_ !== param1)
         {
            this._1460764855leftScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftScenario",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get remoteName() : Text
      {
         return this._1041126385remoteName;
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         addEventListener(FlexEvent.DATA_CHANGE,this.dataChangedHandler);
      }
      
      public function set scenario1Image(param1:Image) : void
      {
         var _loc2_:Object = this._804894522scenario1Image;
         if(_loc2_ !== param1)
         {
            this._804894522scenario1Image = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenario1Image",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _label() : String
      {
         return this._1472470539_label;
      }
      
      [Bindable(event="propertyChange")]
      private function get _leftScenarioLabel() : String
      {
         return this._111464958_leftScenarioLabel;
      }
   }
}
