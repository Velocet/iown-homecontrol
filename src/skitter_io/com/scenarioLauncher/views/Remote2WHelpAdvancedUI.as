package com.scenarioLauncher.views
{
   import com.keepcore.KCBoxNavigation;
   import com.scenarioLauncher.datamodel.RemoteItem;
   import com.scenarioLauncher.views.common.CommonPopup;
   import com.scenarioLauncher.views.renderers.HelpRemoteItemRenderer;
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
   import mx.collections.ArrayCollection;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Image;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   public class Remote2WHelpAdvancedUI extends CommonPopup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      public var remotesXmlFile:Class;
      
      mx_internal var _watchers:Array;
      
      private var _1429922367boxNavigation:KCBoxNavigation;
      
      private var _embed_mxml__485684283:Class;
      
      private var _94069080btnOk:Button;
      
      private var _embed_mxml__994101535:Class;
      
      public var closureFunction:Function = null;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _1165656474pictoHelp:Image;
      
      private var _1791483012titleLabel:Text;
      
      private var _633839895pictoButton:Image;
      
      mx_internal var _bindings:Array;
      
      public var remotesXml:XML;
      
      private var _embed_mxml__88066507:Class;
      
      private var _577749334picto2W:Image;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function Remote2WHelpAdvancedUI()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":CommonPopup,
            "propertiesFactory":function():Object
            {
               return {
                  "width":850,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Image,
                     "id":"picto2W",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "source":_embed_mxml__485684283,
                           "x":405,
                           "y":14
                        };
                     }
                  }),new UIComponentDescriptor({
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
                              "type":HBox,
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                                 this.verticalAlign = "middle";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "y":63,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"pictoHelp",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml__88066507,
                                             "x":125
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Text,
                                       "id":"titleLabel",
                                       "stylesFactory":function():void
                                       {
                                          this.paddingLeft = 10;
                                          this.paddingRight = 10;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "selectable":false,
                                             "styleName":"help2WTitleLabel"
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"pictoButton",
                                       "propertiesFactory":function():Object
                                       {
                                          return {"source":_embed_mxml__994101535};
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":KCBoxNavigation,
                              "id":"boxNavigation",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "height":280,
                                    "itemWidth":255,
                                    "itemHeight":280,
                                    "previousButtonBarThickness":50,
                                    "nextButtonBarThickness":50,
                                    "itemRenderer":HelpRemoteItemRenderer,
                                    "previousButtonStyleName":"previousButtonStyle",
                                    "nextButtonStyleName":"nextButtonStyle"
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Spacer,
                              "propertiesFactory":function():Object
                              {
                                 return {"height":20};
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"btnOk",
                              "events":{"click":"__btnOk_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "cacheAsBitmap":false,
                                    "buttonMode":true,
                                    "useHandCursor":true,
                                    "styleName":"btnValidate",
                                    "width":113,
                                    "height":24
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this.remotesXmlFile = Remote2WHelpAdvancedUI_remotesXmlFile;
         this.remotesXml = XML(new this.remotesXmlFile());
         this._embed_mxml__485684283 = Remote2WHelpAdvancedUI__embed_mxml__485684283;
         this._embed_mxml__88066507 = Remote2WHelpAdvancedUI__embed_mxml__88066507;
         this._embed_mxml__994101535 = Remote2WHelpAdvancedUI__embed_mxml__994101535;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.width = 850;
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         Remote2WHelpAdvancedUI._watcherSetupUtil = param1;
      }
      
      public function __btnOk_click(param1:MouseEvent) : void
      {
         this.closeHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get titleLabel() : Text
      {
         return this._1791483012titleLabel;
      }
      
      override public function initialize() : void
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Remote2WHelpAdvancedUI = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         bindings = this._Remote2WHelpAdvancedUI_bindingsSetup();
         watchers = [];
         target = {};
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_com_scenarioLauncher_views_Remote2WHelpAdvancedUIWatcherSetupUtil");
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
      public function get pictoButton() : Image
      {
         return this._633839895pictoButton;
      }
      
      override protected function createChildren() : void
      {
         this.setStyle("paddingLeft",5);
         this.setStyle("paddingRight",5);
         super.createChildren();
      }
      
      [Bindable(event="propertyChange")]
      public function get picto2W() : Image
      {
         return this._577749334picto2W;
      }
      
      public function set pictoButton(param1:Image) : void
      {
         var _loc2_:Object = this._633839895pictoButton;
         if(_loc2_ !== param1)
         {
            this._633839895pictoButton = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pictoButton",_loc2_,param1));
         }
      }
      
      override protected function initLabels() : void
      {
         super.initLabels();
         this.titleLabel.text = resourceManager.getString("help","HELP_2W_TITLE");
         this.btnOk.label = resourceManager.getString("common","BTN_OK");
      }
      
      public function set btnOk(param1:Button) : void
      {
         var _loc2_:Object = this._94069080btnOk;
         if(_loc2_ !== param1)
         {
            this._94069080btnOk = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOk",_loc2_,param1));
         }
      }
      
      override public function closeHandler(param1:MouseEvent = null) : void
      {
         super.closeHandler(param1);
         if(this.closureFunction != null)
         {
            this.closureFunction();
         }
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:RemoteItem = null;
         super.onCreationComplete(param1);
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:XMLList = this.remotesXml.remotes_2w_advanced;
         for each(_loc4_ in _loc3_.children())
         {
            _loc5_ = new RemoteItem(_loc4_.@name,_loc4_.@image);
            _loc2_.addItem(_loc5_);
         }
         this.boxNavigation.dataProvider = _loc2_;
         this.titleLabel.validateNow();
      }
      
      [Bindable(event="propertyChange")]
      public function get boxNavigation() : KCBoxNavigation
      {
         return this._1429922367boxNavigation;
      }
      
      public function set pictoHelp(param1:Image) : void
      {
         var _loc2_:Object = this._1165656474pictoHelp;
         if(_loc2_ !== param1)
         {
            this._1165656474pictoHelp = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pictoHelp",_loc2_,param1));
         }
      }
      
      public function set picto2W(param1:Image) : void
      {
         var _loc2_:Object = this._577749334picto2W;
         if(_loc2_ !== param1)
         {
            this._577749334picto2W = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"picto2W",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOk() : Button
      {
         return this._94069080btnOk;
      }
      
      private function _Remote2WHelpAdvancedUI_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():Point
         {
            return new Point(0,100);
         },function(param1:Point):void
         {
            boxNavigation.previousButtonPosition = param1;
         },"boxNavigation.previousButtonPosition");
         result[0] = binding;
         binding = new Binding(this,function():Point
         {
            return new Point(0,100);
         },function(param1:Point):void
         {
            boxNavigation.nextButtonPosition = param1;
         },"boxNavigation.nextButtonPosition");
         result[1] = binding;
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get pictoHelp() : Image
      {
         return this._1165656474pictoHelp;
      }
      
      private function _Remote2WHelpAdvancedUI_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = new Point(0,100);
         _loc1_ = new Point(0,100);
      }
      
      public function set boxNavigation(param1:KCBoxNavigation) : void
      {
         var _loc2_:Object = this._1429922367boxNavigation;
         if(_loc2_ !== param1)
         {
            this._1429922367boxNavigation = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boxNavigation",_loc2_,param1));
         }
      }
      
      public function set titleLabel(param1:Text) : void
      {
         var _loc2_:Object = this._1791483012titleLabel;
         if(_loc2_ !== param1)
         {
            this._1791483012titleLabel = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleLabel",_loc2_,param1));
         }
      }
   }
}
