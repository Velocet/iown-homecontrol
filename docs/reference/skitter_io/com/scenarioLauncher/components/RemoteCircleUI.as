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
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class RemoteCircleUI extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _1360216880circle:Canvas;
      
      private var _1111076900circleMask:Canvas;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var colorChanged:Boolean = false;
      
      mx_internal var _watchers:Array;
      
      private var _color:uint;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function RemoteCircleUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":366,
                        "height":262,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"circle",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":366,
                                 "height":366,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"circleMask",
                                    "events":{"creationComplete":"__circleMask_creationComplete"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "width":366,
                                          "height":366
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
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         RemoteCircleUI._watcherSetupUtil = param1;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
         this.colorChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      private function _RemoteCircleUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = BlendMode.LAYER;
         _loc1_ = BlendMode.ERASE;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:RemoteCircleUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._RemoteCircleUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_components_RemoteCircleUIWatcherSetupUtil");
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
      
      private function _RemoteCircleUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            circle.blendMode = param1;
         },"circle.blendMode");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = BlendMode.ERASE;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            circleMask.blendMode = param1;
         },"circleMask.blendMode");
         result[1] = binding;
         return result;
      }
      
      public function __circleMask_creationComplete(param1:FlexEvent) : void
      {
         this.circleMask_creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get circleMask() : Canvas
      {
         return this._1111076900circleMask;
      }
      
      protected function circleMask_creationCompleteHandler(param1:FlexEvent) : void
      {
         this.circleMask.graphics.clear();
         this.circleMask.graphics.beginFill(0);
         this.circleMask.graphics.drawCircle(183,183,174);
         this.circleMask.graphics.endFill();
      }
      
      public function set circle(param1:Canvas) : void
      {
         var _loc2_:Object = this._1360216880circle;
         if(_loc2_ !== param1)
         {
            this._1360216880circle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circle",_loc2_,param1));
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      [Bindable(event="propertyChange")]
      public function get circle() : Canvas
      {
         return this._1360216880circle;
      }
      
      private function drawCircle() : void
      {
         this.circle.graphics.clear();
         this.circle.graphics.beginFill(this._color);
         this.circle.graphics.drawCircle(183,183,183);
         this.circle.graphics.endFill();
      }
      
      override protected function commitProperties() : void
      {
         if(this.colorChanged)
         {
            this.colorChanged = false;
            this.drawCircle();
         }
      }
      
      public function set circleMask(param1:Canvas) : void
      {
         var _loc2_:Object = this._1111076900circleMask;
         if(_loc2_ !== param1)
         {
            this._1111076900circleMask = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"circleMask",_loc2_,param1));
         }
      }
   }
}
