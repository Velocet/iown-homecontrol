package com.scenarioLauncher.views
{
   import com.scenarioLauncher.business.ServerCommunicationManager;
   import com.scenarioLauncher.components.Spinner;
   import com.scenarioLauncher.events.InstallationEvent;
   import com.scenarioLauncher.managers.DialogsManager;
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
   import ioService.constants.ErrorCodes;
   import ioService.datamodel.Scenario;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.rpc.events.FaultEvent;
   import mx.styles.*;
   
   public class TestScenarioUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _884507683lbScenarioNameInProgress:Text;
      
      private var _1888623148cancelTest:Button;
      
      private var _1845518267lbTestSuccess:Text;
      
      private var _1472314778btnOKSuccessTestSuccess:Button;
      
      private var _1337757551testFailed:VBox;
      
      private var _1006876838retryTest:Button;
      
      private var _embed_mxml__1507538325:Class;
      
      private var _358502602testSuccessImage:Image;
      
      private var _1330029970lbScenarioNameFailed:Text;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _685071121_scenario:Scenario;
      
      private var _475301367canvasContainer:Canvas;
      
      private var _2061021020testInProgress:Canvas;
      
      private var _2035198737testSuccess:VBox;
      
      private var _84712837lbTestFailed:Text;
      
      private var _938164210lbScenarioNameSuccess:Text;
      
      private var _2004438503spinner:Spinner;
      
      mx_internal var _watchers:Array;
      
      private var _1418958529testScenarioViewStack:ViewStack;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _embed_mxml__801521088:Class;
      
      private var _654941254lbTestInProgress:Text;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var _embed_mxml__928423959:Class;
      
      public function TestScenarioUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":384,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"testScenarioViewStack",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "creationPolicy":"all",
                           "percentWidth":100,
                           "percentHeight":100,
                           "name":"testScenarioViewStack",
                           "resizeToContent":true,
                           "clipContent":false,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"testInProgress",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "clipContent":false,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "y":37,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__1507538325,
                                                      "width":32,
                                                      "height":32
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbScenarioNameInProgress",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbScenarioNameInProgress",
                                                      "styleName":"VR24B"
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"lbTestInProgress",
                                       "stylesFactory":function():void
                                       {
                                          this.textAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "name":"lbTestInProgress",
                                             "percentWidth":100,
                                             "styleName":"VR18BC",
                                             "y":99
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spinner,
                                       "id":"spinner",
                                       "stylesFactory":function():void
                                       {
                                          this.tickColor = 16758037;
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "size":48,
                                             "tickWidth":4,
                                             "autoPlay":false
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "id":"testSuccess",
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "clipContent":false,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.verticalAlign = "middle";
                                          this.horizontalAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__1507538325,
                                                      "width":34,
                                                      "height":34
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbScenarioNameSuccess",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbScenarioNameSuccess",
                                                      "styleName":"VR24B"
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":20};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"canvasContainer",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"testSuccessImage",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__928423959
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbTestSuccess",
                                                "stylesFactory":function():void
                                                {
                                                   this.textAlign = "center";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbTestSuccess",
                                                      "styleName":"VR18BCL0",
                                                      "y":0
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":30};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnOKSuccessTestSuccess",
                                       "events":{"click":"__btnOKSuccessTestSuccess_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"btnOKSuccessTestSuccess",
                                             "styleName":"btnValidate",
                                             "buttonMode":true,
                                             "useHandCursor":true,
                                             "y":175,
                                             "minWidth":113,
                                             "height":24
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "id":"testFailed",
                              "stylesFactory":function():void
                              {
                                 this.verticalGap = 20;
                                 this.horizontalAlign = "center";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "clipContent":false,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.verticalAlign = "middle";
                                          this.horizontalAlign = "center";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__1507538325,
                                                      "x":72,
                                                      "y":40,
                                                      "width":34,
                                                      "height":34
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbScenarioNameFailed",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbScenarioNameFailed",
                                                      "styleName":"VR24B",
                                                      "x":115,
                                                      "y":42
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalAlign = "center";
                                          this.verticalAlign = "top";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "source":_embed_mxml__801521088,
                                                      "x":79,
                                                      "y":107
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"lbTestFailed",
                                                "stylesFactory":function():void
                                                {
                                                   this.textAlign = "center";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "selectable":false,
                                                      "name":"lbTestFailed",
                                                      "styleName":"VR18BCL0",
                                                      "x":3,
                                                      "y":106
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalAlign = "center";
                                          this.horizontalGap = 30;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"retryTest",
                                                "events":{"click":"__retryTest_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"retryTest",
                                                      "styleName":"btnValidate",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "height":24,
                                                      "minWidth":113,
                                                      "y":196
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"cancelTest",
                                                "events":{"click":"__cancelTest_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"cancelTest",
                                                      "styleName":"btnCancel",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
                                                      "height":24,
                                                      "minWidth":113,
                                                      "y":196
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._embed_mxml__1507538325 = TestScenarioUI__embed_mxml__1507538325;
         this._embed_mxml__801521088 = TestScenarioUI__embed_mxml__801521088;
         this._embed_mxml__928423959 = TestScenarioUI__embed_mxml__928423959;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 384;
         this.clipContent = false;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         TestScenarioUI._watcherSetupUtil = param1;
      }
      
      protected function setTestSuccessSpecificIconPosition() : void
      {
         var _loc1_:TextLineMetrics = null;
         this.lbTestSuccess.validateNow();
         _loc1_ = this.lbTestSuccess.getLineMetrics(0);
         this.testSuccessImage.x = this.lbTestSuccess.x + _loc1_.x - this.testSuccessImage.width - 5;
      }
      
      [Bindable(event="propertyChange")]
      public function get canvasContainer() : Canvas
      {
         return this._475301367canvasContainer;
      }
      
      private function _TestScenarioUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this._scenario.name;
         _loc1_ = this.lbTestInProgress.y + this.lbTestInProgress.height + 30;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this._scenario.name;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = (this.canvasContainer.width - this.lbTestSuccess.width) / 2;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = this._scenario.name;
      }
      
      public function set lbTestFailed(param1:Text) : void
      {
         var _loc2_:Object = this._84712837lbTestFailed;
         if(_loc2_ !== param1)
         {
            this._84712837lbTestFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbTestFailed",_loc2_,param1));
         }
      }
      
      public function set canvasContainer(param1:Canvas) : void
      {
         var _loc2_:Object = this._475301367canvasContainer;
         if(_loc2_ !== param1)
         {
            this._475301367canvasContainer = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canvasContainer",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get testSuccess() : VBox
      {
         return this._2035198737testSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get spinner() : Spinner
      {
         return this._2004438503spinner;
      }
      
      private function onTestScenarioStart(param1:MouseEvent = null) : void
      {
         if(this._scenario)
         {
            this.testScenarioViewStack.selectedChild = this.testInProgress;
            this.refreshPopup();
            this.spinner.play();
            ServerCommunicationManager.instance.testScenario(this._scenario);
         }
      }
      
      public function set testSuccess(param1:VBox) : void
      {
         var _loc2_:Object = this._2035198737testSuccess;
         if(_loc2_ !== param1)
         {
            this._2035198737testSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"testSuccess",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbScenarioNameInProgress() : Text
      {
         return this._884507683lbScenarioNameInProgress;
      }
      
      private function OnTestScenarioHandler(param1:InstallationEvent) : void
      {
         this.testScenarioViewStack.selectedChild = this.testSuccess;
         this.refreshPopup();
         this.spinner.stop();
         this.setTestSuccessSpecificIconPosition();
      }
      
      override protected function initLabels() : void
      {
         this.lbTestFailed.htmlText = resourceManager.getString("scenarios","LBL_TEST_FAILED",[this._scenario.name]);
         this.retryTest.label = resourceManager.getString("common","BTN_RETRY");
         this.cancelTest.label = resourceManager.getString("common","BTN_CANCEL");
         this.lbTestSuccess.htmlText = resourceManager.getString("scenarios","LBL_TEST_SUCCESS",[this._scenario.name]);
         this.btnOKSuccessTestSuccess.label = resourceManager.getString("common","BTN_OK");
         this.lbTestInProgress.htmlText = resourceManager.getString("scenarios","LBL_TEST_IN_PROGRESS");
      }
      
      public function set spinner(param1:Spinner) : void
      {
         var _loc2_:Object = this._2004438503spinner;
         if(_loc2_ !== param1)
         {
            this._2004438503spinner = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spinner",_loc2_,param1));
         }
      }
      
      public function set scenario(param1:Scenario) : void
      {
         this._scenario = param1;
      }
      
      private function testInProgressResponseSuccess() : void
      {
         this.testScenarioViewStack.selectedChild = this.testSuccess;
         this.refreshPopup();
         this.spinner.stop();
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelTest() : Button
      {
         return this._1888623148cancelTest;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         ServerCommunicationManager.instance.addEventListener(FaultEvent.FAULT,this.OnFaultEventCallBack);
         ServerCommunicationManager.instance.addEventListener(InstallationEvent.TEST_SCENARIO,this.OnTestScenarioHandler);
         this.onTestScenarioStart();
      }
      
      public function set testInProgress(param1:Canvas) : void
      {
         var _loc2_:Object = this._2061021020testInProgress;
         if(_loc2_ !== param1)
         {
            this._2061021020testInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"testInProgress",_loc2_,param1));
         }
      }
      
      public function set lbScenarioNameInProgress(param1:Text) : void
      {
         var _loc2_:Object = this._884507683lbScenarioNameInProgress;
         if(_loc2_ !== param1)
         {
            this._884507683lbScenarioNameInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbScenarioNameInProgress",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get retryTest() : Button
      {
         return this._1006876838retryTest;
      }
      
      private function _TestScenarioUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            testInProgress.verticalScrollPolicy = param1;
         },"testInProgress.verticalScrollPolicy");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            testInProgress.horizontalScrollPolicy = param1;
         },"testInProgress.horizontalScrollPolicy");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _scenario.name;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            lbScenarioNameInProgress.htmlText = param1;
         },"lbScenarioNameInProgress.htmlText");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return NaN;
         },function(param1:Number):void
         {
            spinner.y = param1;
         },"spinner.y");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            testSuccess.verticalScrollPolicy = param1;
         },"testSuccess.verticalScrollPolicy");
         result[4] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            testSuccess.horizontalScrollPolicy = param1;
         },"testSuccess.horizontalScrollPolicy");
         result[5] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _scenario.name;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            lbScenarioNameSuccess.htmlText = param1;
         },"lbScenarioNameSuccess.htmlText");
         result[6] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            canvasContainer.verticalScrollPolicy = param1;
         },"canvasContainer.verticalScrollPolicy");
         result[7] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            canvasContainer.horizontalScrollPolicy = param1;
         },"canvasContainer.horizontalScrollPolicy");
         result[8] = binding;
         binding = new Binding(this,function():Number
         {
            return (0 - 0) / 2;
         },function(param1:Number):void
         {
            lbTestSuccess.x = param1;
         },"lbTestSuccess.x");
         result[9] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            testFailed.verticalScrollPolicy = param1;
         },"testFailed.verticalScrollPolicy");
         result[10] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            testFailed.horizontalScrollPolicy = param1;
         },"testFailed.horizontalScrollPolicy");
         result[11] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = _scenario.name;
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            lbScenarioNameFailed.htmlText = param1;
         },"lbScenarioNameFailed.htmlText");
         result[12] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOKSuccessTestSuccess() : Button
      {
         return this._1472314778btnOKSuccessTestSuccess;
      }
      
      protected function retryTest_clickHandler(param1:MouseEvent) : void
      {
         this.onTestScenarioStart();
      }
      
      [Bindable(event="propertyChange")]
      public function get lbScenarioNameFailed() : Text
      {
         return this._1330029970lbScenarioNameFailed;
      }
      
      [Bindable(event="propertyChange")]
      public function get testFailed() : VBox
      {
         return this._1337757551testFailed;
      }
      
      public function set cancelTest(param1:Button) : void
      {
         var _loc2_:Object = this._1888623148cancelTest;
         if(_loc2_ !== param1)
         {
            this._1888623148cancelTest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelTest",_loc2_,param1));
         }
      }
      
      public function set lbTestInProgress(param1:Text) : void
      {
         var _loc2_:Object = this._654941254lbTestInProgress;
         if(_loc2_ !== param1)
         {
            this._654941254lbTestInProgress = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbTestInProgress",_loc2_,param1));
         }
      }
      
      public function set lbTestSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._1845518267lbTestSuccess;
         if(_loc2_ !== param1)
         {
            this._1845518267lbTestSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbTestSuccess",_loc2_,param1));
         }
      }
      
      private function OnFaultEventCallBack(param1:FaultEvent) : void
      {
         switch(param1.fault.faultCode)
         {
            case ErrorCodes.ERROR_TEST_SCENARIO:
               this.testScenarioViewStack.selectedChild = this.testFailed;
               this.refreshPopup();
               break;
            case ErrorCodes.ERROR_CREATE_SCENARIO:
               this.testScenarioViewStack.selectedChild = this.testFailed;
               this.refreshPopup();
               break;
            case ErrorCodes.ERROR_SKITTER_NOT_CONNECTED:
               closeHandler();
               DialogsManager.showSkitterNotConnectedPopup();
         }
      }
      
      public function set testScenarioViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1418958529testScenarioViewStack;
         if(_loc2_ !== param1)
         {
            this._1418958529testScenarioViewStack = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"testScenarioViewStack",_loc2_,param1));
         }
      }
      
      public function __retryTest_click(param1:MouseEvent) : void
      {
         this.retryTest_clickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get lbTestFailed() : Text
      {
         return this._84712837lbTestFailed;
      }
      
      public function __btnOKSuccessTestSuccess_click(param1:MouseEvent) : void
      {
         this.btnOKTestSuccessClickHandler(param1);
      }
      
      public function get scenario() : Scenario
      {
         return this._scenario;
      }
      
      private function refreshPopup() : void
      {
         this.initLabels();
         this.refreshUI();
         validateNow();
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:TestScenarioUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._TestScenarioUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_TestScenarioUIWatcherSetupUtil");
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
      
      public function set testSuccessImage(param1:Image) : void
      {
         var _loc2_:Object = this._358502602testSuccessImage;
         if(_loc2_ !== param1)
         {
            this._358502602testSuccessImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"testSuccessImage",_loc2_,param1));
         }
      }
      
      public function __cancelTest_click(param1:MouseEvent) : void
      {
         this.cancelTest_clickHandler(param1);
      }
      
      private function testInProgressResponseFailed() : void
      {
         this.testScenarioViewStack.selectedChild = this.testFailed;
         this.refreshPopup();
         this.spinner.stop();
      }
      
      [Bindable(event="propertyChange")]
      public function get testInProgress() : Canvas
      {
         return this._2061021020testInProgress;
      }
      
      override protected function refreshUI() : void
      {
         super.refreshUI();
         this.width = 384;
      }
      
      public function set retryTest(param1:Button) : void
      {
         var _loc2_:Object = this._1006876838retryTest;
         if(_loc2_ !== param1)
         {
            this._1006876838retryTest = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"retryTest",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbTestInProgress() : Text
      {
         return this._654941254lbTestInProgress;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbTestSuccess() : Text
      {
         return this._1845518267lbTestSuccess;
      }
      
      [Bindable(event="propertyChange")]
      public function get testScenarioViewStack() : ViewStack
      {
         return this._1418958529testScenarioViewStack;
      }
      
      [Bindable(event="propertyChange")]
      public function get testSuccessImage() : Image
      {
         return this._358502602testSuccessImage;
      }
      
      protected function cancelTest_clickHandler(param1:MouseEvent) : void
      {
         closeHandler();
      }
      
      public function set btnOKSuccessTestSuccess(param1:Button) : void
      {
         var _loc2_:Object = this._1472314778btnOKSuccessTestSuccess;
         if(_loc2_ !== param1)
         {
            this._1472314778btnOKSuccessTestSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOKSuccessTestSuccess",_loc2_,param1));
         }
      }
      
      public function set lbScenarioNameFailed(param1:Text) : void
      {
         var _loc2_:Object = this._1330029970lbScenarioNameFailed;
         if(_loc2_ !== param1)
         {
            this._1330029970lbScenarioNameFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbScenarioNameFailed",_loc2_,param1));
         }
      }
      
      public function set testFailed(param1:VBox) : void
      {
         var _loc2_:Object = this._1337757551testFailed;
         if(_loc2_ !== param1)
         {
            this._1337757551testFailed = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"testFailed",_loc2_,param1));
         }
      }
      
      public function set lbScenarioNameSuccess(param1:Text) : void
      {
         var _loc2_:Object = this._938164210lbScenarioNameSuccess;
         if(_loc2_ !== param1)
         {
            this._938164210lbScenarioNameSuccess = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbScenarioNameSuccess",_loc2_,param1));
         }
      }
      
      private function set _scenario(param1:Scenario) : void
      {
         var _loc2_:Object = this._685071121_scenario;
         if(_loc2_ !== param1)
         {
            this._685071121_scenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_scenario",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _scenario() : Scenario
      {
         return this._685071121_scenario;
      }
      
      [Bindable(event="propertyChange")]
      public function get lbScenarioNameSuccess() : Text
      {
         return this._938164210lbScenarioNameSuccess;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
      }
      
      protected function btnOKTestSuccessClickHandler(param1:MouseEvent) : void
      {
         closeHandler();
      }
   }
}
