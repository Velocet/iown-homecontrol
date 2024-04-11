package com.scenarioLauncher.views
{
   import com.scenarioLauncher.events.ScenarioEvent;
   import com.scenarioLauncher.model.Globals;
   import com.scenarioLauncher.utils.BitmapUtils;
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
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.TextInput;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class CustomizeScenarioUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var tempBitmapDataChanged:Boolean = false;
      
      private var scenarioChanged:Boolean = false;
      
      private var _tempBitmapData:BitmapData;
      
      mx_internal var _watchers:Array;
      
      private var _tempScenarioName:String;
      
      private var _1008330181scenarioName:TextInput;
      
      private var _1018396155btnCancelScenarioDuplicate:Button;
      
      private var _1197736021scenarioImage:Image;
      
      private var _embed_mxml__1507538325:Class;
      
      private var _tempScenarioNameChanged:Boolean = false;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _659094206btnValidateScenario:Button;
      
      private var _135405964btnDeleteImage:Button;
      
      private var _1855074747btnChoseImage:Button;
      
      private var _scenario:Scenario;
      
      private var defaultScenarioImage:Class;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function CustomizeScenarioUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":400,
                  "height":310,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ViewStack,
                     "propertiesFactory":function():Object
                     {
                        return {
                           "resizeToContent":true,
                           "percentHeight":100,
                           "percentWidth":100,
                           "creationPolicy":"all",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"scenarioImage",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "maintainAspectRatio":true,
                                             "cacheAsBitmap":true,
                                             "source":_embed_mxml__1507538325,
                                             "x":166,
                                             "y":39,
                                             "width":51,
                                             "height":51
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":2};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":TextInput,
                                       "id":"scenarioName",
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalCenter = "0";
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "name":"scenarioName",
                                             "styleName":"VR18BCCP",
                                             "x":48,
                                             "y":109,
                                             "width":288
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":25};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnChoseImage",
                                       "events":{"click":"__btnChoseImage_click"},
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 10;
                                          this.paddingRight = 10;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "name":"btnChoseImage",
                                             "styleName":"btnValidate",
                                             "buttonMode":true,
                                             "useHandCursor":true,
                                             "x":50,
                                             "y":186
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":3};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnDeleteImage",
                                       "events":{"click":"__btnDeleteImage_click"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "cacheAsBitmap":false,
                                             "styleName":"btnValidate",
                                             "buttonMode":true,
                                             "useHandCursor":true,
                                             "x":50,
                                             "y":186
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Spacer,
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":20};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":HBox,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":88,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function():void
                                                {
                                                   this.horizontalAlign = "center";
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":50,
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":Button,
                                                         "id":"btnValidateScenario",
                                                         "events":{"click":"__btnValidateScenario_click"},
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "cacheAsBitmap":false,
                                                               "name":"btnValidateScenario",
                                                               "styleName":"btnValidate",
                                                               "buttonMode":true,
                                                               "useHandCursor":true,
                                                               "x":50,
                                                               "y":254,
                                                               "width":113
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
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":50,
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":Button,
                                                         "id":"btnCancelScenarioDuplicate",
                                                         "events":{"click":"__btnCancelScenarioDuplicate_click"},
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "cacheAsBitmap":false,
                                                               "name":"btnCancelScenarioDuplicate",
                                                               "styleName":"btnCancel",
                                                               "buttonMode":true,
                                                               "useHandCursor":true,
                                                               "x":221,
                                                               "y":254,
                                                               "width":113
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
                  })]
               };
            }
         });
         this.defaultScenarioImage = CustomizeScenarioUI_defaultScenarioImage;
         this._embed_mxml__1507538325 = CustomizeScenarioUI__embed_mxml__1507538325;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 310;
         this.x = 320;
         this.y = 291;
         this.addEventListener("creationComplete",this.___CustomizeScenarioUI_CommonPopup1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         CustomizeScenarioUI._watcherSetupUtil = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioName() : TextInput
      {
         return this._1008330181scenarioName;
      }
      
      protected function btnValidateScenarioClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Bitmap = this.scenarioImage.content as Bitmap;
         var _loc3_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.SCENARIO_UPDATE_VALIDATE);
         if(this.scenarioName.text == resourceManager.getString("scenarios","NAME_MY_SCENARIO"))
         {
            _loc3_.scenarioName = this._tempScenarioName;
         }
         else
         {
            _loc3_.scenarioName = this.scenarioName.text;
         }
         _loc3_.scenario = this._scenario;
         _loc3_.scenarioBitMap = _loc2_ != null ? _loc2_.bitmapData : null;
         dispatchEvent(_loc3_);
         closeHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelScenarioDuplicate() : Button
      {
         return this._1018396155btnCancelScenarioDuplicate;
      }
      
      public function set btnCancelScenarioDuplicate(param1:Button) : void
      {
         var _loc2_:Object = this._1018396155btnCancelScenarioDuplicate;
         if(_loc2_ !== param1)
         {
            this._1018396155btnCancelScenarioDuplicate = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelScenarioDuplicate",_loc2_,param1));
         }
      }
      
      protected function btnDeleteImage_clickHandler(param1:MouseEvent) : void
      {
         this.scenarioImage.source = null;
         this.scenarioImage.source = this.defaultScenarioImage;
         this._tempBitmapData = null;
      }
      
      public function get scenario() : Scenario
      {
         return this._scenario;
      }
      
      private function selectedFileHandler(param1:Event) : void
      {
         trace(param1.target);
         var _loc2_:File = param1.target as File;
         if(_loc2_ != null)
         {
            this.scenarioImage.source = _loc2_.nativePath;
         }
      }
      
      private function scenarioNameTextFocusInHandler(param1:FocusEvent) : void
      {
         if(this.scenarioName.text == resourceManager.getString("scenarios","NAME_MY_SCENARIO"))
         {
            this.scenarioName.text = "";
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:CustomizeScenarioUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._CustomizeScenarioUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_CustomizeScenarioUIWatcherSetupUtil");
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
      
      override protected function createChildren() : void
      {
         this.setStyle("paddingLeft",5);
         this.setStyle("paddingRight",5);
         super.createChildren();
      }
      
      public function set scenario(param1:Scenario) : void
      {
         this._scenario = param1;
         this.scenarioChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function set btnChoseImage(param1:Button) : void
      {
         var _loc2_:Object = this._1855074747btnChoseImage;
         if(_loc2_ !== param1)
         {
            this._1855074747btnChoseImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnChoseImage",_loc2_,param1));
         }
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
      
      private function _CustomizeScenarioUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = ScrollPolicy.OFF;
         _loc1_ = Globals.SCENARIO_NAME_MAX_CHAR;
         _loc1_ = this.btnChoseImage.width;
      }
      
      public function __btnCancelScenarioDuplicate_click(param1:MouseEvent) : void
      {
         this.btnCancelScenarioDuplicateClickHandler(param1);
      }
      
      override protected function initLabels() : void
      {
         this.btnChoseImage.label = resourceManager.getString("scenarios","BTN_CHOOSE_PICTURE");
         this.btnValidateScenario.label = resourceManager.getString("common","BTN_VALIDATE");
         this.btnCancelScenarioDuplicate.label = resourceManager.getString("common","BTN_CANCEL");
         this.btnDeleteImage.label = resourceManager.getString("scenarios","BTN_DELETE_PICTURE");
         this.scenarioName.addEventListener(FocusEvent.FOCUS_IN,this.scenarioNameTextFocusInHandler);
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioImage() : Image
      {
         return this._1197736021scenarioImage;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnChoseImage() : Button
      {
         return this._1855074747btnChoseImage;
      }
      
      public function __btnChoseImage_click(param1:MouseEvent) : void
      {
         this.btnChoseImageClickHandler(param1);
      }
      
      public function get tempScenarioName() : String
      {
         return this._tempScenarioName;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidateScenario() : Button
      {
         return this._659094206btnValidateScenario;
      }
      
      protected function btnCancelScenarioDuplicateClickHandler(param1:MouseEvent) : void
      {
         closeHandler();
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:String = null;
         super.commitProperties();
         if(this.tempBitmapDataChanged)
         {
            this.tempBitmapDataChanged = false;
            this.scenarioImage.source = new Bitmap(this.tempBitmapData);
         }
         if(this._tempScenarioNameChanged)
         {
            this._tempScenarioNameChanged = false;
            _loc1_ = String(resourceManager.getString("scenarios","SCENARIO",[""]));
            if(this._tempScenarioName.indexOf(_loc1_) != 0)
            {
               this.scenarioName.htmlText = this._tempScenarioName;
            }
            else
            {
               this.scenarioName.htmlText = resourceManager.getString("scenarios","NAME_MY_SCENARIO");
            }
         }
      }
      
      public function set scenarioName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1008330181scenarioName;
         if(_loc2_ !== param1)
         {
            this._1008330181scenarioName = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioName",_loc2_,param1));
         }
      }
      
      public function __btnDeleteImage_click(param1:MouseEvent) : void
      {
         this.btnDeleteImage_clickHandler(param1);
      }
      
      public function set tempScenarioName(param1:String) : void
      {
         this._tempScenarioName = param1;
         this._tempScenarioNameChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function set tempBitmapData(param1:BitmapData) : void
      {
         this._tempBitmapData = param1;
         this.tempBitmapDataChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      private function imageLoadedHandler(param1:Event) : void
      {
         var _loc2_:Bitmap = this.scenarioImage.content as Bitmap;
         BitmapUtils.resizeBitmap(_loc2_,256,256);
         this.scenarioImage.source = new Bitmap(_loc2_.bitmapData);
      }
      
      public function __btnValidateScenario_click(param1:MouseEvent) : void
      {
         this.btnValidateScenarioClickHandler(param1);
      }
      
      public function get tempBitmapData() : BitmapData
      {
         return this._tempBitmapData;
      }
      
      public function set scenarioImage(param1:Image) : void
      {
         var _loc2_:Object = this._1197736021scenarioImage;
         if(_loc2_ !== param1)
         {
            this._1197736021scenarioImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenarioImage",_loc2_,param1));
         }
      }
      
      public function ___CustomizeScenarioUI_CommonPopup1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         this.scenarioImage.addEventListener(Event.COMPLETE,this.imageLoadedHandler);
      }
      
      public function set btnDeleteImage(param1:Button) : void
      {
         var _loc2_:Object = this._135405964btnDeleteImage;
         if(_loc2_ !== param1)
         {
            this._135405964btnDeleteImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDeleteImage",_loc2_,param1));
         }
      }
      
      private function _CustomizeScenarioUI_bindingsSetup() : Array
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
         binding = new Binding(this,function():int
         {
            return Globals.SCENARIO_NAME_MAX_CHAR;
         },function(param1:int):void
         {
            scenarioName.maxChars = param1;
         },"scenarioName.maxChars");
         result[2] = binding;
         binding = new Binding(this,function():Number
         {
            return btnChoseImage.width;
         },function(param1:Number):void
         {
            btnDeleteImage.width = param1;
         },"btnDeleteImage.width");
         result[3] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDeleteImage() : Button
      {
         return this._135405964btnDeleteImage;
      }
      
      protected function btnChoseImageClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:File = new File();
         var _loc3_:FileFilter = new FileFilter("Image","*.jpg;*.jpeg;*.png;*.gif");
         _loc2_.addEventListener(Event.SELECT,this.selectedFileHandler);
         _loc2_.browseForOpen(resourceManager.getString("scenarios","SCENARIO_IMAGE"),[_loc3_]);
      }
   }
}
