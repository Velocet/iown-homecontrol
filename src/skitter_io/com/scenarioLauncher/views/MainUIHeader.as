package com.scenarioLauncher.views
{
   import com.scenarioLauncher.model.Globals;
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
   import mx.containers.HBox;
   import mx.controls.Button;
   import mx.controls.Spacer;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class MainUIHeader extends CustomCanvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _watchers:Array;
      
      private var _1905796085_buttonWidth:Number;
      
      private var _205861821btnHelp:Button;
      
      private var _1120167891btnTelecommandes:Button;
      
      private var _navigateToInstallation:Function;
      
      private var _navigateToScenarios:Function;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _navigateToHelp:Function;
      
      private var _420744474btnMinimize:Button;
      
      private var _2082343164btnClose:Button;
      
      private var _1107065162btnInstallation:Button;
      
      private var btnDebug:Button;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1004222988btnScenario:Button;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _navigateToRemotesControl:Function;
      
      public function MainUIHeader()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CustomCanvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "right";
                     this.horizontalGap = 9;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":61,
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnInstallation",
                           "events":{"click":"__btnInstallation_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"btnInstallation",
                                 "buttonMode":true,
                                 "useHandCursor":true,
                                 "styleName":"mainUIHeaderButtons",
                                 "minWidth":156,
                                 "height":55
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnScenario",
                           "events":{"click":"__btnScenario_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"btnScenario",
                                 "buttonMode":true,
                                 "useHandCursor":true,
                                 "styleName":"mainUIHeaderButtons",
                                 "minWidth":156,
                                 "height":55
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnTelecommandes",
                           "events":{"click":"__btnTelecommandes_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"btnTelecommandes",
                                 "buttonMode":true,
                                 "useHandCursor":true,
                                 "styleName":"mainUIHeaderButtons",
                                 "minWidth":156,
                                 "height":55
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnHelp",
                           "events":{"click":"__btnHelp_click"},
                           "stylesFactory":function():void
                           {
                              this.fontWeight = "bold";
                              this.fontSize = 20;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "cacheAsBitmap":false,
                                 "name":"btnHelp",
                                 "buttonMode":true,
                                 "label":"?",
                                 "useHandCursor":true,
                                 "styleName":"mainUIHeaderButtonsHelp",
                                 "minWidth":69,
                                 "height":55
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Spacer,
                           "propertiesFactory":function():Object
                           {
                              return {"width":27};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnMinimize",
                  "events":{"click":"__btnMinimize_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"btnMinimize",
                        "buttonMode":true,
                        "useHandCursor":true,
                        "styleName":"btnMinimize",
                        "minWidth":20,
                        "x":952,
                        "y":14
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnClose",
                  "events":{"click":"__btnClose_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "cacheAsBitmap":false,
                        "name":"btnClose",
                        "buttonMode":true,
                        "useHandCursor":true,
                        "styleName":"btnClose",
                        "minWidth":20,
                        "x":987,
                        "y":14
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "stylesFactory":function():void
                  {
                     this.backgroundColor = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":111,
                        "percentWidth":100,
                        "height":5
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
         MainUIHeader._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnClose() : Button
      {
         return this._2082343164btnClose;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScenario() : Button
      {
         return this._1004222988btnScenario;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:MainUIHeader = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._MainUIHeader_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_MainUIHeaderWatcherSetupUtil");
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
      
      protected function btnDebugClickHandler(param1:MouseEvent) : void
      {
      }
      
      private function manageButtonSize() : void
      {
         var _loc1_:TextLineMetrics = this.btnInstallation.measureText(this.btnInstallation.label);
         var _loc2_:TextLineMetrics = this.btnScenario.measureText(this.btnScenario.label);
         var _loc3_:TextLineMetrics = this.btnTelecommandes.measureText(this.btnTelecommandes.label);
         var _loc4_:Number = Math.max(_loc1_.width,_loc2_.width,_loc3_.width) + 30;
         if(this._buttonWidth != _loc4_ && !isNaN(_loc4_))
         {
            this._buttonWidth = _loc4_;
         }
      }
      
      public function __btnHelp_click(param1:MouseEvent) : void
      {
         this.onBtnClickHandler(param1);
      }
      
      public function selectBtnHelp() : void
      {
         if(true)
         {
            this._navigateToHelp();
            this.btnInstallation.selected = false;
            this.btnScenario.selected = false;
            this.btnTelecommandes.selected = false;
            this.btnHelp.selected = true;
            this.handleButtonStyle();
         }
      }
      
      public function set btnTelecommandes(param1:Button) : void
      {
         var _loc2_:Object = this._1120167891btnTelecommandes;
         if(_loc2_ !== param1)
         {
            this._1120167891btnTelecommandes = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnTelecommandes",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         this.btnInstallation.label = resourceManager.getString("common","BTN_INSTALLATION");
         this.btnScenario.label = resourceManager.getString("common","BTN_SCENARIO");
         this.btnTelecommandes.label = resourceManager.getString("common","BTN_TELECOMMANDES");
      }
      
      public function set btnScenario(param1:Button) : void
      {
         var _loc2_:Object = this._1004222988btnScenario;
         if(_loc2_ !== param1)
         {
            this._1004222988btnScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScenario",_loc2_,param1));
         }
      }
      
      public function selectBtnInstallation() : void
      {
         if(true)
         {
            this._navigateToInstallation();
            this.btnInstallation.selected = true;
            this.btnScenario.selected = false;
            this.btnTelecommandes.selected = false;
            this.btnHelp.selected = false;
            this.handleButtonStyle();
         }
      }
      
      public function __btnScenario_click(param1:MouseEvent) : void
      {
         this.onBtnClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnInstallation() : Button
      {
         return this._1107065162btnInstallation;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.selectBtnInstallation();
      }
      
      private function closeApplication() : void
      {
         stage.nativeWindow.close();
      }
      
      public function set btnMinimize(param1:Button) : void
      {
         var _loc2_:Object = this._420744474btnMinimize;
         if(_loc2_ !== param1)
         {
            this._420744474btnMinimize = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnMinimize",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnMinimize() : Button
      {
         return this._420744474btnMinimize;
      }
      
      public function set navigateToRemotesControl(param1:Function) : void
      {
         this._navigateToRemotesControl = param1;
      }
      
      private function _MainUIHeader_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = this._buttonWidth;
         _loc1_ = this._buttonWidth;
         _loc1_ = this._buttonWidth;
      }
      
      public function __btnMinimize_click(param1:MouseEvent) : void
      {
         this.onBtnClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnHelp() : Button
      {
         return this._205861821btnHelp;
      }
      
      private function _MainUIHeader_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Number
         {
            return _buttonWidth;
         },function(param1:Number):void
         {
            btnInstallation.width = param1;
         },"btnInstallation.width");
         result[0] = binding;
         binding = new Binding(this,function():Number
         {
            return _buttonWidth;
         },function(param1:Number):void
         {
            btnScenario.width = param1;
         },"btnScenario.width");
         result[1] = binding;
         binding = new Binding(this,function():Number
         {
            return _buttonWidth;
         },function(param1:Number):void
         {
            btnTelecommandes.width = param1;
         },"btnTelecommandes.width");
         result[2] = binding;
         return result;
      }
      
      private function onBtnClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = (param1.target as Button).id;
         switch(_loc2_)
         {
            case "btnInstallation":
               this.selectBtnInstallation();
               break;
            case "btnScenario":
               this.selectBtnScenario();
               break;
            case "btnTelecommandes":
               this.selectBtnTelecommandes();
               break;
            case "btnHelp":
               this.selectBtnHelp();
               break;
            case "btnMinimize":
               this.minimizeApplication();
               break;
            case "btnClose":
               this.closeApplication();
         }
      }
      
      public function set navigateToInstallation(param1:Function) : void
      {
         this._navigateToInstallation = param1;
      }
      
      private function minimizeApplication() : void
      {
         stage.nativeWindow.minimize();
      }
      
      public function set navigateToHelp(param1:Function) : void
      {
         this._navigateToHelp = param1;
      }
      
      private function handleButtonStyle() : void
      {
         this.btnInstallation.styleName = this.btnInstallation.selected ? "mainUIHeaderButtonsSelected" : "mainUIHeaderButtons";
         this.btnScenario.styleName = this.btnScenario.selected ? "mainUIHeaderButtonsSelected" : "mainUIHeaderButtons";
         this.btnTelecommandes.styleName = this.btnTelecommandes.selected ? "mainUIHeaderButtonsSelected" : "mainUIHeaderButtons";
         this.btnHelp.styleName = this.btnHelp.selected ? "mainUIHeaderButtonsSelected" : "mainUIHeaderButtons";
      }
      
      public function __btnInstallation_click(param1:MouseEvent) : void
      {
         this.onBtnClickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnTelecommandes() : Button
      {
         return this._1120167891btnTelecommandes;
      }
      
      public function __btnClose_click(param1:MouseEvent) : void
      {
         this.onBtnClickHandler(param1);
      }
      
      private function set _buttonWidth(param1:Number) : void
      {
         var _loc2_:Object = this._1905796085_buttonWidth;
         if(_loc2_ !== param1)
         {
            this._1905796085_buttonWidth = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_buttonWidth",_loc2_,param1));
         }
      }
      
      public function set navigateToScenarios(param1:Function) : void
      {
         this._navigateToScenarios = param1;
      }
      
      public function selectBtnTelecommandes() : void
      {
         if(true)
         {
            this._navigateToRemotesControl();
            this.btnInstallation.selected = false;
            this.btnScenario.selected = false;
            this.btnTelecommandes.selected = true;
            this.btnHelp.selected = false;
            this.handleButtonStyle();
         }
      }
      
      public function selectBtnScenario() : void
      {
         if(true)
         {
            this._navigateToScenarios();
            this.btnInstallation.selected = false;
            this.btnScenario.selected = true;
            this.btnTelecommandes.selected = false;
            this.btnHelp.selected = false;
            this.handleButtonStyle();
         }
      }
      
      public function set btnInstallation(param1:Button) : void
      {
         var _loc2_:Object = this._1107065162btnInstallation;
         if(_loc2_ !== param1)
         {
            this._1107065162btnInstallation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnInstallation",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _buttonWidth() : Number
      {
         return this._1905796085_buttonWidth;
      }
      
      public function set btnClose(param1:Button) : void
      {
         var _loc2_:Object = this._2082343164btnClose;
         if(_loc2_ !== param1)
         {
            this._2082343164btnClose = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnClose",_loc2_,param1));
         }
      }
      
      public function set btnHelp(param1:Button) : void
      {
         var _loc2_:Object = this._205861821btnHelp;
         if(_loc2_ !== param1)
         {
            this._205861821btnHelp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnHelp",_loc2_,param1));
         }
      }
      
      public function __btnTelecommandes_click(param1:MouseEvent) : void
      {
         this.onBtnClickHandler(param1);
      }
   }
}
