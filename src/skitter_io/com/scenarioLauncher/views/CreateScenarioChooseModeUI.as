package com.scenarioLauncher.views
{
   import com.scenarioLauncher.components.CustomButton;
   import com.scenarioLauncher.events.ScenarioEvent;
   import com.scenarioLauncher.managers.KCPopupManager;
   import com.scenarioLauncher.utils.FiltersUtils;
   import com.scenarioLauncher.views.common.CommonPopup;
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
   import ioService.datamodel.Scenario;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class CreateScenarioChooseModeUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _296317413btnCreateScenarioManually:CustomButton;
      
      mx_internal var _watchers:Array;
      
      private var _453508784createScenarioSnapShot:Text;
      
      private var _embed_mxml__258095618:Class;
      
      private var _797315847createScenarioManuallyTitle:Text;
      
      private var _embed_mxml__2140510619:Class;
      
      private var _embed_mxml__1507538325:Class;
      
      private var _290695122createScenarioChooseModeTitle:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _153961428btnCreateScenarioSnapShot:CustomButton;
      
      private var _1366090120createScenarioSnapShotTitle:Text;
      
      mx_internal var _bindings:Array;
      
      private var _scenario:Scenario;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _311152799createScenarioManually:Text;
      
      public function CreateScenarioChooseModeUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":962,
                  "height":507,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Image,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "source":_embed_mxml__1507538325,
                           "x":433,
                           "y":30,
                           "width":65,
                           "height":65
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Text,
                     "id":"createScenarioChooseModeTitle",
                     "stylesFactory":function():void
                     {
                        this.textAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "selectable":false,
                           "name":"createScenarioChooseModeTitle",
                           "styleName":"createScenarioChooseModeUILabelsBold",
                           "percentWidth":100,
                           "y":107
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Canvas,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "styleName":"createScenarioCanvas",
                           "verticalScrollPolicy":"off",
                           "horizontalScrollPolicy":"off",
                           "width":462,
                           "height":329,
                           "x":11,
                           "y":152,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Image,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__2140510619,
                                    "x":137,
                                    "y":17
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"createScenarioManuallyTitle",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"createScenarioManuallyTitle",
                                    "styleName":"createScenarioChooseModeUILabelsBold",
                                    "x":196,
                                    "y":24
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"createScenarioManually",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"createScenarioManually",
                                    "styleName":"createScenarioChooseModeUILabels",
                                    "percentWidth":100,
                                    "y":86
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":CustomButton,
                              "id":"btnCreateScenarioManually",
                              "events":{"click":"__btnCreateScenarioManually_click"},
                              "stylesFactory":function():void
                              {
                                 this.icon = _embed_mxml__2140510619;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"btnCreateScenarioManually",
                                    "iconWidth":20,
                                    "iconHeight":20,
                                    "iconX":38,
                                    "iconY":3,
                                    "styleName":"createScenarioChooseModeUIBtns",
                                    "height":25,
                                    "minWidth":96,
                                    "x":182,
                                    "y":283,
                                    "buttonMode":true,
                                    "useHandCursor":true
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Canvas,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "styleName":"createScenarioCanvas",
                           "verticalScrollPolicy":"off",
                           "horizontalScrollPolicy":"off",
                           "width":462,
                           "height":329,
                           "x":489,
                           "y":152,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Image,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__258095618,
                                    "x":143,
                                    "y":24
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"createScenarioSnapShotTitle",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"createScenarioSnapShotTitle",
                                    "styleName":"createScenarioChooseModeUILabelsBold",
                                    "x":205,
                                    "y":24
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"createScenarioSnapShot",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"createScenarioSnapShot",
                                    "styleName":"createScenarioChooseModeUILabels",
                                    "percentWidth":100,
                                    "y":86
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":CustomButton,
                              "id":"btnCreateScenarioSnapShot",
                              "events":{"click":"__btnCreateScenarioSnapShot_click"},
                              "stylesFactory":function():void
                              {
                                 this.icon = _embed_mxml__258095618;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"btnCreateScenarioSnapShot",
                                    "iconWidth":22,
                                    "iconHeight":16,
                                    "iconX":37,
                                    "iconY":5,
                                    "styleName":"createScenarioChooseModeUIBtns",
                                    "height":25,
                                    "minWidth":96,
                                    "x":182,
                                    "y":283,
                                    "buttonMode":true,
                                    "useHandCursor":true
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__1507538325 = CreateScenarioChooseModeUI__embed_mxml__1507538325;
         this._embed_mxml__2140510619 = CreateScenarioChooseModeUI__embed_mxml__2140510619;
         this._embed_mxml__258095618 = CreateScenarioChooseModeUI__embed_mxml__258095618;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 962;
         this.height = 507;
         this.x = 31;
         this.y = 190;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         CreateScenarioChooseModeUI._watcherSetupUtil = param1;
      }
      
      public function __btnCreateScenarioManually_click(param1:MouseEvent) : void
      {
         this.onBtnCreateScenarioManuallyClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get createScenarioSnapShotTitle() : Text
      {
         return this._1366090120createScenarioSnapShotTitle;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:CreateScenarioChooseModeUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._CreateScenarioChooseModeUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_CreateScenarioChooseModeUIWatcherSetupUtil");
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
      
      [Bindable(event="propertyChange")]
      public function get btnCreateScenarioManually() : CustomButton
      {
         return this._296317413btnCreateScenarioManually;
      }
      
      public function set scenario(param1:Scenario) : void
      {
         this._scenario = param1;
      }
      
      public function set createScenarioChooseModeTitle(param1:Text) : void
      {
         var _loc2_:Object = this._290695122createScenarioChooseModeTitle;
         if(_loc2_ !== param1)
         {
            this._290695122createScenarioChooseModeTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createScenarioChooseModeTitle",_loc2_,param1));
         }
      }
      
      private function _CreateScenarioChooseModeUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = [FiltersUtils.buttonShadow()];
         _loc1_ = [FiltersUtils.buttonShadow()];
      }
      
      public function get scenario() : Scenario
      {
         return this._scenario;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCreateScenarioSnapShot() : CustomButton
      {
         return this._153961428btnCreateScenarioSnapShot;
      }
      
      override protected function refreshUI() : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function get createScenarioSnapShot() : Text
      {
         return this._453508784createScenarioSnapShot;
      }
      
      [Bindable(event="propertyChange")]
      public function get createScenarioManually() : Text
      {
         return this._311152799createScenarioManually;
      }
      
      public function set btnCreateScenarioManually(param1:CustomButton) : void
      {
         var _loc2_:Object = this._296317413btnCreateScenarioManually;
         if(_loc2_ !== param1)
         {
            this._296317413btnCreateScenarioManually = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCreateScenarioManually",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         this.createScenarioChooseModeTitle.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_CHOOSE_MODE_TITLE");
         this.createScenarioManuallyTitle.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_MANUALLY_TITLE");
         this.createScenarioManually.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_MANUALLY");
         this.createScenarioSnapShotTitle.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_SNAPSHOT_TITLE");
         this.createScenarioSnapShot.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_SNAPSHOT");
      }
      
      private function onBtnCreateScenarioManuallyClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.CREATE_SCENARIO_MANUALLY_CLICK);
         _loc2_.scenario = this._scenario;
         this.dispatchEvent(_loc2_);
      }
      
      private function onBtnCreateScenarioSnapShotClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:SnapshotScenarioUI = new SnapshotScenarioUI();
         closeHandler();
         KCPopupManager.singleton.displayPopup(_loc2_);
      }
      
      private function _CreateScenarioChooseModeUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.verticalScrollPolicy = param1;
         },"this.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            this.horizontalScrollPolicy = param1;
         },"this.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():Array
         {
            return [FiltersUtils.buttonShadow()];
         },function(param1:Array):void
         {
            btnCreateScenarioManually.filters = param1;
         },"btnCreateScenarioManually.filters");
         result[2] = binding;
         binding = new Binding(this,function():Array
         {
            return [FiltersUtils.buttonShadow()];
         },function(param1:Array):void
         {
            btnCreateScenarioSnapShot.filters = param1;
         },"btnCreateScenarioSnapShot.filters");
         result[3] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get createScenarioChooseModeTitle() : Text
      {
         return this._290695122createScenarioChooseModeTitle;
      }
      
      public function __btnCreateScenarioSnapShot_click(param1:MouseEvent) : void
      {
         this.onBtnCreateScenarioSnapShotClickHandler(param1);
      }
      
      public function set btnCreateScenarioSnapShot(param1:CustomButton) : void
      {
         var _loc2_:Object = this._153961428btnCreateScenarioSnapShot;
         if(_loc2_ !== param1)
         {
            this._153961428btnCreateScenarioSnapShot = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCreateScenarioSnapShot",_loc2_,param1));
         }
      }
      
      public function set createScenarioManually(param1:Text) : void
      {
         var _loc2_:Object = this._311152799createScenarioManually;
         if(_loc2_ !== param1)
         {
            this._311152799createScenarioManually = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createScenarioManually",_loc2_,param1));
         }
      }
      
      public function set createScenarioSnapShotTitle(param1:Text) : void
      {
         var _loc2_:Object = this._1366090120createScenarioSnapShotTitle;
         if(_loc2_ !== param1)
         {
            this._1366090120createScenarioSnapShotTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createScenarioSnapShotTitle",_loc2_,param1));
         }
      }
      
      public function set createScenarioSnapShot(param1:Text) : void
      {
         var _loc2_:Object = this._453508784createScenarioSnapShot;
         if(_loc2_ !== param1)
         {
            this._453508784createScenarioSnapShot = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createScenarioSnapShot",_loc2_,param1));
         }
      }
      
      public function set createScenarioManuallyTitle(param1:Text) : void
      {
         var _loc2_:Object = this._797315847createScenarioManuallyTitle;
         if(_loc2_ !== param1)
         {
            this._797315847createScenarioManuallyTitle = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"createScenarioManuallyTitle",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get createScenarioManuallyTitle() : Text
      {
         return this._797315847createScenarioManuallyTitle;
      }
   }
}
