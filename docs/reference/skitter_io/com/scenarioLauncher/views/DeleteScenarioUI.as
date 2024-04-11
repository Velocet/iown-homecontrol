package com.scenarioLauncher.views
{
   import com.scenarioLauncher.events.ScenarioEvent;
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
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class DeleteScenarioUI extends CommonPopup
   {
       
      
      private var _embed_mxml__1507538325:Class;
      
      private var scenarioChanged:Boolean = false;
      
      private var _936211840btnValidateDeletion:Button;
      
      private var _1224215265msgScenarioDeletion:Text;
      
      private var _896357860btnCancelDeletion:Button;
      
      private var _scenario:Scenario;
      
      private var _1197736021scenarioImage:Image;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function DeleteScenarioUI()
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
                           "horizontalScrollPolicy":"off",
                           "verticalScrollPolicy":"off",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":10};
                              }
                           }),new UIComponentDescriptor({
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
                                 return {"height":17};
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"msgScenarioDeletion",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "selectable":false,
                                    "name":"msgScenarioDeletion",
                                    "styleName":"VR18BC",
                                    "percentWidth":100
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":17};
                              }
                           }),new UIComponentDescriptor({
                              "type":HBox,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":88,
                                    "horizontalScrollPolicy":"off",
                                    "verticalScrollPolicy":"off",
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
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnValidateDeletion",
                                                "events":{"click":"__btnValidateDeletion_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnValidateDeletion",
                                                      "styleName":"btnValidate",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
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
                                             "horizontalScrollPolicy":"off",
                                             "verticalScrollPolicy":"off",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnCancelDeletion",
                                                "events":{"click":"__btnCancelDeletion_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "cacheAsBitmap":false,
                                                      "name":"btnCancelDeletion",
                                                      "styleName":"btnCancel",
                                                      "buttonMode":true,
                                                      "useHandCursor":true,
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
         this._embed_mxml__1507538325 = DeleteScenarioUI__embed_mxml__1507538325;
         super();
         mx_internal::_document = this;
         this.width = 384;
         this.x = 320;
         this.y = 291;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnValidateDeletion() : Button
      {
         return this._936211840btnValidateDeletion;
      }
      
      protected function btnValidateDeletionClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ScenarioEvent = new ScenarioEvent(ScenarioEvent.SCENARIO_DELETE);
         _loc2_.scenario = this.scenario;
         dispatchEvent(_loc2_);
         closeHandler();
      }
      
      public function set btnValidateDeletion(param1:Button) : void
      {
         var _loc2_:Object = this._936211840btnValidateDeletion;
         if(_loc2_ !== param1)
         {
            this._936211840btnValidateDeletion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnValidateDeletion",_loc2_,param1));
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:File = null;
         super.commitProperties();
         if(this.scenarioChanged)
         {
            this.scenarioChanged = false;
            if(this._scenario != null)
            {
               _loc1_ = File.applicationStorageDirectory.resolvePath("scenario_images/scenario_" + this._scenario.id + ".png");
               if(_loc1_.exists)
               {
                  this.scenarioImage.source = null;
                  this.scenarioImage.source = _loc1_.nativePath;
               }
            }
         }
      }
      
      public function __btnCancelDeletion_click(param1:MouseEvent) : void
      {
         this.btnCancelDeletionClickHandler(param1);
      }
      
      public function set btnCancelDeletion(param1:Button) : void
      {
         var _loc2_:Object = this._896357860btnCancelDeletion;
         if(_loc2_ !== param1)
         {
            this._896357860btnCancelDeletion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnCancelDeletion",_loc2_,param1));
         }
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set msgScenarioDeletion(param1:Text) : void
      {
         var _loc2_:Object = this._1224215265msgScenarioDeletion;
         if(_loc2_ !== param1)
         {
            this._1224215265msgScenarioDeletion = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msgScenarioDeletion",_loc2_,param1));
         }
      }
      
      override protected function createChildren() : void
      {
         this.setStyle("paddingLeft",5);
         this.setStyle("paddingRight",5);
         super.createChildren();
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
      
      public function get scenario() : Scenario
      {
         return this._scenario;
      }
      
      public function set scenario(param1:Scenario) : void
      {
         this._scenario = param1;
         this.scenarioChanged = true;
         this.invalidateProperties();
      }
      
      [Bindable(event="propertyChange")]
      public function get btnCancelDeletion() : Button
      {
         return this._896357860btnCancelDeletion;
      }
      
      protected function btnCancelDeletionClickHandler(param1:MouseEvent) : void
      {
         closeHandler();
      }
      
      [Bindable(event="propertyChange")]
      public function get scenarioImage() : Image
      {
         return this._1197736021scenarioImage;
      }
      
      [Bindable(event="propertyChange")]
      public function get msgScenarioDeletion() : Text
      {
         return this._1224215265msgScenarioDeletion;
      }
      
      override protected function refreshUI() : void
      {
      }
      
      public function __btnValidateDeletion_click(param1:MouseEvent) : void
      {
         this.btnValidateDeletionClickHandler(param1);
      }
      
      override protected function initLabels() : void
      {
         this.msgScenarioDeletion.htmlText = resourceManager.getString("scenarios","MSG_DELETE_SCENARIO",[this._scenario.name]);
         this.btnValidateDeletion.label = resourceManager.getString("common","BTN_YES");
         this.btnCancelDeletion.label = resourceManager.getString("common","BTN_NO");
      }
   }
}
