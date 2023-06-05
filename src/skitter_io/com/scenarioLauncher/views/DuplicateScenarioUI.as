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
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.TextInput;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class DuplicateScenarioUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      private var _1084821266renameScenario:TextInput;
      
      private var scenarioChanged:Boolean = false;
      
      mx_internal var _watchers:Array;
      
      private var _duplicatedScenarioID:Number = -1;
      
      private var _1018396155btnCancelScenarioDuplicate:Button;
      
      private var _embed_mxml__1507538325:Class;
      
      private var _1197736021scenarioImage:Image;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      private var _659094206btnValidateScenario:Button;
      
      private var _1855074747btnChoseImage:Button;
      
      mx_internal var _bindings:Array;
      
      private var _scenario:Scenario;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function DuplicateScenarioUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":384,
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
                                    "cacheAsBitmap":false,
                                    "source":_embed_mxml__1507538325,
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
                              "id":"renameScenario",
                              "stylesFactory":function():void
                              {
                                 this.horizontalCenter = "0";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "name":"renameScenario",
                                    "styleName":"VR18BCCP",
                                    "width":288
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
                                    "useHandCursor":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":7};
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
                                                      "y":234,
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
                                                      "y":234,
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
         });
         this._embed_mxml__1507538325 = DuplicateScenarioUI__embed_mxml__1507538325;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 384;
         this.x = 320;
         this.y = 291;
         this.addEventListener("creationComplete",this.___DuplicateScenarioUI_CommonPopup1_creationComplete);
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         DuplicateScenarioUI._watcherSetupUtil = param1;
      }
      
      protected function btnValidateScenarioClickHandler(param1:MouseEvent) : void
      {
         if(this.scenario != null)
         {
            this.scenario.name = this.renameScenario.text;
         }
         var _loc2_:Bitmap = this.scenarioImage.content as Bitmap;
         var _loc3_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.SCENARIO_UPDATE_VALIDATE);
         _loc3_.scenario = this.scenario;
         if(_loc2_)
         {
            _loc3_.scenarioBitMap = _loc2_.bitmapData;
         }
         dispatchEvent(_loc3_);
         closeHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelScenarioDuplicate() : Button
      {
         return this._1018396155btnCancelScenarioDuplicate;
      }
      
      public function set duplicatedScenarioID(param1:Number) : void
      {
         this._duplicatedScenarioID = param1;
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
      
      public function set btnChoseImage(param1:Button) : void
      {
         var _loc2_:Object = this._1855074747btnChoseImage;
         if(_loc2_ !== param1)
         {
            this._1855074747btnChoseImage = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnChoseImage",_loc2_,param1));
         }
      }
      
      public function get scenario() : Scenario
      {
         return this._scenario;
      }
      
      private function selectedFileHandler(param1:Event) : void
      {
         var _loc2_:File = param1.target as File;
         if(_loc2_ != null)
         {
            this.scenarioImage.source = _loc2_.nativePath;
         }
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:DuplicateScenarioUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._DuplicateScenarioUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_DuplicateScenarioUIWatcherSetupUtil");
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
      
      public function set btnValidateScenario(param1:Button) : void
      {
         var _loc2_:Object = this._659094206btnValidateScenario;
         if(_loc2_ !== param1)
         {
            this._659094206btnValidateScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnValidateScenario",_loc2_,param1));
         }
      }
      
      public function set scenario(param1:Scenario) : void
      {
         this._scenario = param1;
         this.scenarioChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function __btnChoseImage_click(param1:MouseEvent) : void
      {
         this.btnChoseImageClickHandler(param1);
      }
      
      public function __btnCancelScenarioDuplicate_click(param1:MouseEvent) : void
      {
         this.btnCancelScenarioDuplicateClickHandler(param1);
      }
      
      override protected function refreshUI() : void
      {
         if(this.scenario != null)
         {
            this.renameScenario.text = this.scenario.name;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioImage() : Image
      {
         return this._1197736021scenarioImage;
      }
      
      public function ___DuplicateScenarioUI_CommonPopup1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnChoseImage() : Button
      {
         return this._1855074747btnChoseImage;
      }
      
      override protected function initLabels() : void
      {
         this.btnChoseImage.label = resourceManager.getString("scenarios","BTN_CHOOSE_PICTURE");
         this.btnValidateScenario.label = resourceManager.getString("common","BTN_VALIDATE");
         this.btnCancelScenarioDuplicate.label = resourceManager.getString("common","BTN_CANCEL");
         this.renameScenario.htmlText = resourceManager.getString("scenarios","RENAME_SCENARIO");
      }
      
      private function _DuplicateScenarioUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():int
         {
            return Globals.SCENARIO_NAME_MAX_CHAR;
         },function(param1:int):void
         {
            renameScenario.maxChars = param1;
         },"renameScenario.maxChars");
         result[0] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidateScenario() : Button
      {
         return this._659094206btnValidateScenario;
      }
      
      public function get duplicatedScenarioID() : Number
      {
         return this._duplicatedScenarioID;
      }
      
      protected function btnCancelScenarioDuplicateClickHandler(param1:MouseEvent) : void
      {
         closeHandler();
      }
      
      private function _DuplicateScenarioUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = Globals.SCENARIO_NAME_MAX_CHAR;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:File = null;
         super.commitProperties();
         if(this.scenarioChanged)
         {
            this.scenarioChanged = false;
            if(this._scenario != null && this._duplicatedScenarioID != -1)
            {
               _loc1_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this._duplicatedScenarioID + ".png");
               if(_loc1_.exists)
               {
                  this.scenarioImage.source = null;
                  this.scenarioImage.source = _loc1_.nativePath;
               }
            }
         }
      }
      
      public function set renameScenario(param1:TextInput) : void
      {
         var _loc2_:Object = this._1084821266renameScenario;
         if(_loc2_ !== param1)
         {
            this._1084821266renameScenario = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"renameScenario",_loc2_,param1));
         }
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
      
      [Bindable(event="propertyChange")]
      public function get renameScenario() : TextInput
      {
         return this._1084821266renameScenario;
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         this.scenarioImage.addEventListener(Event.COMPLETE,this.imageLoadedHandler);
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
