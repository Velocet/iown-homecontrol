package com.scenarioLauncher.views
{
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
   import mx.binding.*;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class SnapshotScenarioUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1546953251snapShotUserInformation:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _watchers:Array;
      
      private var _embed_mxml__258095618:Class;
      
      private var _659094206btnValidateScenario:Button;
      
      private var _1366090120createScenarioSnapShotTitle:Text;
      
      mx_internal var _bindings:Array;
      
      private var _361149967btnCancelScenarioUpdate:Button;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function SnapshotScenarioUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":528,
                  "height":385,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Image,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "source":_embed_mxml__258095618,
                           "x":181,
                           "y":36
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
                           "x":244,
                           "y":36
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Text,
                     "id":"snapShotUserInformation",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "selectable":false,
                           "name":"snapShotUserInformation",
                           "styleName":"createScenarioChooseModeUILabels",
                           "percentWidth":100,
                           "y":111
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"btnValidateScenario",
                     "events":{"click":"__btnValidateScenario_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "name":"btnValidateScenario",
                           "styleName":"btnValidateScenario",
                           "buttonMode":true,
                           "useHandCursor":true,
                           "x":145,
                           "y":321,
                           "width":95
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"btnCancelScenarioUpdate",
                     "events":{"click":"__btnCancelScenarioUpdate_click"},
                     "propertiesFactory":function():Object
                     {
                        return {
                           "cacheAsBitmap":false,
                           "name":"btnCancelScenarioUpdate",
                           "styleName":"btnCancelScenario",
                           "buttonMode":true,
                           "useHandCursor":true,
                           "x":288,
                           "y":321,
                           "width":95
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__258095618 = SnapshotScenarioUI__embed_mxml__258095618;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 528;
         this.height = 385;
         this.x = 248;
         this.y = 239;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         SnapshotScenarioUI._watcherSetupUtil = param1;
      }
      
      protected function btnValidateScenarioClickHandler(param1:MouseEvent) : void
      {
      }
      
      [Bindable(event="propertyChange")]
      public function get createScenarioSnapShotTitle() : Text
      {
         return this._1366090120createScenarioSnapShotTitle;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidateScenario() : Button
      {
         return this._659094206btnValidateScenario;
      }
      
      public function set btnValidateScenario(param1:Button) : void
      {
         var _loc2_:Object = this._659094206btnValidateScenario;
         if(_loc2_ !== param1)
         {
            this._659094206btnValidateScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnValidateScenario",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelScenarioUpdate() : Button
      {
         return this._361149967btnCancelScenarioUpdate;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:SnapshotScenarioUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._SnapshotScenarioUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_SnapshotScenarioUIWatcherSetupUtil");
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
      
      private function _SnapshotScenarioUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = [FiltersUtils.buttonShadow()];
         _loc1_ = [FiltersUtils.buttonShadow()];
      }
      
      private function _SnapshotScenarioUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Array
         {
            return [FiltersUtils.buttonShadow()];
         },function(param1:Array):void
         {
            btnValidateScenario.filters = param1;
         },"btnValidateScenario.filters");
         result[0] = binding;
         binding = new Binding(this,function():Array
         {
            return [FiltersUtils.buttonShadow()];
         },function(param1:Array):void
         {
            btnCancelScenarioUpdate.filters = param1;
         },"btnCancelScenarioUpdate.filters");
         result[1] = binding;
         return result;
      }
      
      protected function btnCancelScenarioUpdateClickHandler(param1:MouseEvent) : void
      {
         closeHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get snapShotUserInformation() : Text
      {
         return this._1546953251snapShotUserInformation;
      }
      
      public function set btnCancelScenarioUpdate(param1:Button) : void
      {
         var _loc2_:Object = this._361149967btnCancelScenarioUpdate;
         if(_loc2_ !== param1)
         {
            this._361149967btnCancelScenarioUpdate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelScenarioUpdate",_loc2_,param1));
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
      
      public function __btnValidateScenario_click(param1:MouseEvent) : void
      {
         this.btnValidateScenarioClickHandler(param1);
      }
      
      override protected function refreshUI() : void
      {
      }
      
      override protected function initLabels() : void
      {
         this.createScenarioSnapShotTitle.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_SNAPSHOT_TITLE");
         this.snapShotUserInformation.htmlText = resourceManager.getString("scenarios","LBL_CREATE_SCENARIO_SNAPSHOT_WARN");
         this.btnValidateScenario.label = resourceManager.getString("scenarios","BTN_VALIDATE");
         this.btnCancelScenarioUpdate.label = resourceManager.getString("scenarios","BTN_CANCEL");
      }
      
      public function __btnCancelScenarioUpdate_click(param1:MouseEvent) : void
      {
         this.btnCancelScenarioUpdateClickHandler(param1);
      }
      
      public function set snapShotUserInformation(param1:Text) : void
      {
         var _loc2_:Object = this._1546953251snapShotUserInformation;
         if(_loc2_ !== param1)
         {
            this._1546953251snapShotUserInformation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"snapShotUserInformation",_loc2_,param1));
         }
      }
   }
}
