package com.scenarioLauncher.views
{
   import com.scenarioLauncher.components.ScrollingText;
   import com.scenarioLauncher.managers.CookieManager;
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
   import mx.containers.Canvas;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class WelcomeUI extends CustomCanvas implements IBindingClient
   {
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private static var _1233099618welcome:Class = WelcomeUI_welcome;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _739432642scrollingText:ScrollingText;
      
      public var _WelcomeUI_Label1:Label;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _WelcomeUI_Image1:Image;
      
      public function WelcomeUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"_WelcomeUI_Image1"
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"_WelcomeUI_Label1",
                  "stylesFactory":function():void
                  {
                     this.fontSize = 14;
                     this.color = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":176,
                        "y":719
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":819,
                        "height":30,
                        "x":185,
                        "y":714,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":ScrollingText,
                           "id":"scrollingText",
                           "stylesFactory":function():void
                           {
                              this.fontSize = 14;
                              this.color = 8618883;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "percentHeight":100,
                                 "direction":"rightToLeft",
                                 "speed":5
                              };
                           }
                        })]
                     };
                  }
               })]};
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
            this.cornerRadius = 10;
         };
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.addEventListener("creationComplete",this.___WelcomeUI_CustomCanvas1_creationComplete);
      }
      
      [Bindable(event="propertyChange")]
      public static function get welcome() : Class
      {
         return WelcomeUI._1233099618welcome;
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         WelcomeUI._watcherSetupUtil = param1;
      }
      
      public static function set welcome(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = WelcomeUI._1233099618welcome;
         if(_loc2_ !== param1)
         {
            WelcomeUI._1233099618welcome = param1;
            _loc3_ = WelcomeUI.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(WelcomeUI,"welcome",_loc2_,param1));
            }
         }
      }
      
      private function _WelcomeUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = welcome;
         _loc1_ = CookieManager.instance.getVersion();
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollingText() : ScrollingText
      {
         return this._739432642scrollingText;
      }
      
      public function set scrollingText(param1:ScrollingText) : void
      {
         var _loc2_:Object = this._739432642scrollingText;
         if(_loc2_ !== param1)
         {
            this._739432642scrollingText = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollingText",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:WelcomeUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._WelcomeUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_WelcomeUIWatcherSetupUtil");
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
      
      private function OnAppQuit() : void
      {
      }
      
      public function ___WelcomeUI_CustomCanvas1_creationComplete(param1:FlexEvent) : void
      {
         this.customcanvas1_creationCompleteHandler(param1);
      }
      
      private function initializeHandler() : void
      {
      }
      
      private function debugButtonClickHandler() : void
      {
      }
      
      private function _WelcomeUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Object
         {
            return welcome;
         },function(param1:Object):void
         {
            _WelcomeUI_Image1.source = param1;
         },"_WelcomeUI_Image1.source");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = CookieManager.instance.getVersion();
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _WelcomeUI_Label1.text = param1;
         },"_WelcomeUI_Label1.text");
         result[1] = binding;
         return result;
      }
      
      override protected function initLabels() : void
      {
         this.scrollingText.text = resourceManager.getString("common","LEGAL_TEXT");
      }
      
      protected function customcanvas1_creationCompleteHandler(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.scrollingText.start();
      }
   }
}
