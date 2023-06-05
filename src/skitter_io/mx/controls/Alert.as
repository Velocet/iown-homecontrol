package mx.controls
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventPhase;
   import mx.containers.Panel;
   import mx.controls.alertClasses.AlertForm;
   import mx.core.Application;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.managers.ISystemManager;
   import mx.managers.PopUpManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class Alert extends Panel
   {
      
      public static const NONMODAL:uint = 32768;
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static var cancelLabelOverride:String;
      
      private static var _resourceManager:IResourceManager;
      
      public static var buttonHeight:Number = 22;
      
      private static var noLabelOverride:String;
      
      private static var _yesLabel:String;
      
      private static var yesLabelOverride:String;
      
      public static var buttonWidth:Number = false ? 60 : 65;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var _okLabel:String;
      
      public static const NO:uint = 2;
      
      public static const YES:uint = 1;
      
      private static var initialized:Boolean = false;
      
      private static var _cancelLabel:String;
      
      public static const OK:uint = 4;
      
      private static var okLabelOverride:String;
      
      private static var _noLabel:String;
      
      public static const CANCEL:uint = 8;
       
      
      mx_internal var alertForm:AlertForm;
      
      public var defaultButtonFlag:uint = 4;
      
      public var text:String = "";
      
      public var buttonFlags:uint = 4;
      
      public var iconClass:Class;
      
      public function Alert()
      {
         super();
         title = "";
      }
      
      private static function initialize() : void
      {
         if(!initialized)
         {
            resourceManager.addEventListener(Event.CHANGE,static_resourceManager_changeHandler,false,0,true);
            static_resourcesChanged();
            initialized = true;
         }
      }
      
      private static function static_resourcesChanged() : void
      {
         cancelLabel = cancelLabelOverride;
         noLabel = noLabelOverride;
         okLabel = okLabelOverride;
         yesLabel = yesLabelOverride;
      }
      
      public static function get cancelLabel() : String
      {
         initialize();
         return _cancelLabel;
      }
      
      public static function set yesLabel(param1:String) : void
      {
         yesLabelOverride = param1;
         _yesLabel = param1 != null ? param1 : String(resourceManager.getString("controls","yesLabel"));
      }
      
      private static function static_creationCompleteHandler(param1:FlexEvent) : void
      {
         if(param1.target is IFlexDisplayObject && param1.eventPhase == EventPhase.AT_TARGET)
         {
            param1.target.removeEventListener(FlexEvent.CREATION_COMPLETE,static_creationCompleteHandler);
            PopUpManager.centerPopUp(IFlexDisplayObject(param1.target));
         }
      }
      
      public static function get noLabel() : String
      {
         initialize();
         return _noLabel;
      }
      
      public static function set cancelLabel(param1:String) : void
      {
         cancelLabelOverride = param1;
         _cancelLabel = param1 != null ? param1 : String(resourceManager.getString("controls","cancelLabel"));
      }
      
      private static function get resourceManager() : IResourceManager
      {
         if(!_resourceManager)
         {
            _resourceManager = ResourceManager.getInstance();
         }
         return _resourceManager;
      }
      
      public static function get yesLabel() : String
      {
         initialize();
         return _yesLabel;
      }
      
      public static function set noLabel(param1:String) : void
      {
         noLabelOverride = param1;
         _noLabel = param1 != null ? param1 : String(resourceManager.getString("controls","noLabel"));
      }
      
      private static function static_resourceManager_changeHandler(param1:Event) : void
      {
         static_resourcesChanged();
      }
      
      public static function set okLabel(param1:String) : void
      {
         okLabelOverride = param1;
         _okLabel = param1 != null ? param1 : String(resourceManager.getString("controls","okLabel"));
      }
      
      public static function get okLabel() : String
      {
         initialize();
         return _okLabel;
      }
      
      public static function show(param1:String = "", param2:String = "", param3:uint = 4, param4:Sprite = null, param5:Function = null, param6:Class = null, param7:uint = 4) : Alert
      {
         var _loc10_:ISystemManager = null;
         var _loc8_:Boolean = !!(param3 & 0) ? false : true;
         if(!param4)
         {
            if((_loc10_ = ISystemManager(Application.application.systemManager)).useSWFBridge())
            {
               param4 = Sprite(_loc10_.getSandboxRoot());
            }
            else
            {
               param4 = Sprite(Application.application);
            }
         }
         var _loc9_:Alert = new Alert();
         if(Boolean(param3 & 0) || Boolean(param3 & 0) || Boolean(param3 & 0) || Boolean(param3 & 0))
         {
            _loc9_.buttonFlags = param3;
         }
         if(param7 == Alert.OK || param7 == Alert.CANCEL || param7 == Alert.YES || param7 == Alert.NO)
         {
            _loc9_.defaultButtonFlag = param7;
         }
         _loc9_.text = param1;
         _loc9_.title = param2;
         _loc9_.iconClass = param6;
         if(param5 != null)
         {
            _loc9_.addEventListener(CloseEvent.CLOSE,param5);
         }
         if(param4 is UIComponent)
         {
            _loc9_.moduleFactory = UIComponent(param4).moduleFactory;
         }
         PopUpManager.addPopUp(_loc9_,param4,_loc8_);
         _loc9_.setActualSize(_loc9_.getExplicitOrMeasuredWidth(),_loc9_.getExplicitOrMeasuredHeight());
         _loc9_.addEventListener(FlexEvent.CREATION_COMPLETE,static_creationCompleteHandler);
         return _loc9_;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:String = null;
         super.styleChanged(param1);
         if(param1 == "messageStyleName")
         {
            _loc2_ = getStyle("messageStyleName");
            styleName = _loc2_;
         }
         if(mx_internal::alertForm)
         {
            mx_internal::alertForm.styleChanged(param1);
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:EdgeMetrics = viewMetrics;
         measuredWidth = Math.max(measuredWidth,mx_internal::alertForm.getExplicitOrMeasuredWidth() + _loc1_.left + _loc1_.right);
         measuredHeight = mx_internal::alertForm.getExplicitOrMeasuredHeight() + _loc1_.top + _loc1_.bottom;
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         static_resourcesChanged();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:EdgeMetrics = viewMetrics;
         mx_internal::alertForm.setActualSize(param1 - _loc3_.left - _loc3_.right - getStyle("paddingLeft") - getStyle("paddingRight"),param2 - _loc3_.top - _loc3_.bottom - getStyle("paddingTop") - getStyle("paddingBottom"));
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         var _loc1_:String = getStyle("messageStyleName");
         if(_loc1_)
         {
            styleName = _loc1_;
         }
         if(!mx_internal::alertForm)
         {
            mx_internal::alertForm = new AlertForm();
            mx_internal::alertForm.styleName = this;
            addChild(mx_internal::alertForm);
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            Alert.mx_internal::createAccessibilityImplementation(this);
         }
      }
   }
}
