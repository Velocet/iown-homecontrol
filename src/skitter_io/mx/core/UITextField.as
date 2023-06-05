package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.utils.getQualifiedClassName;
   import mx.automation.IAutomationObject;
   import mx.managers.ISystemManager;
   import mx.managers.IToolTipManagerClient;
   import mx.managers.SystemManager;
   import mx.managers.ToolTipManager;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   import mx.styles.StyleProtoChain;
   import mx.utils.StringUtil;
   
   public class UITextField extends FlexTextField implements IAutomationObject, IIMESupport, IFlexModule, IInvalidating, ISimpleStyleClient, IToolTipManagerClient, IUITextField
   {
      
      mx_internal static const TEXT_WIDTH_PADDING:int = 5;
      
      mx_internal static const TEXT_HEIGHT_PADDING:int = 4;
      
      private static var truncationIndicatorResource:String;
      
      private static var _embeddedFontRegistry:mx.core.IEmbeddedFontRegistry;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      mx_internal static var debuggingBorders:Boolean = false;
       
      
      private var _enabled:Boolean = true;
      
      private var untruncatedText:String;
      
      private var cachedEmbeddedFont:mx.core.EmbeddedFont = null;
      
      private var cachedTextFormat:TextFormat;
      
      private var _automationDelegate:IAutomationObject;
      
      private var _automationName:String;
      
      private var _styleName:Object;
      
      private var _document:Object;
      
      mx_internal var _toolTip:String;
      
      private var _nestLevel:int = 0;
      
      private var _explicitHeight:Number;
      
      private var _moduleFactory:mx.core.IFlexModuleFactory;
      
      private var _initialized:Boolean = false;
      
      private var _nonInheritingStyles:Object;
      
      private var _inheritingStyles:Object;
      
      private var _includeInLayout:Boolean = true;
      
      private var invalidateDisplayListFlag:Boolean = true;
      
      mx_internal var explicitColor:uint = 4294967295;
      
      private var _processedDescriptors:Boolean = true;
      
      private var _updateCompletePendingFlag:Boolean = false;
      
      private var explicitHTMLText:String = null;
      
      mx_internal var _parent:DisplayObjectContainer;
      
      private var _imeMode:String = null;
      
      private var resourceManager:IResourceManager;
      
      mx_internal var styleChangedFlag:Boolean = true;
      
      private var _ignorePadding:Boolean = true;
      
      private var _owner:DisplayObjectContainer;
      
      private var _explicitWidth:Number;
      
      public function UITextField()
      {
         resourceManager = ResourceManager.getInstance();
         _inheritingStyles = UIComponent.mx_internal::STYLE_UNINITIALIZED;
         _nonInheritingStyles = UIComponent.mx_internal::STYLE_UNINITIALIZED;
         super();
         super.text = "";
         focusRect = false;
         selectable = false;
         tabEnabled = false;
         if(mx_internal::debuggingBorders)
         {
            border = true;
         }
         if(!truncationIndicatorResource)
         {
            truncationIndicatorResource = resourceManager.getString("core","truncationIndicator");
         }
         addEventListener(Event.CHANGE,changeHandler);
         addEventListener("textFieldStyleChange",textFieldStyleChangeHandler);
         resourceManager.addEventListener(Event.CHANGE,resourceManager_changeHandler,false,0,true);
      }
      
      private static function get embeddedFontRegistry() : mx.core.IEmbeddedFontRegistry
      {
         if(!_embeddedFontRegistry)
         {
            _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         return _embeddedFontRegistry;
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
      }
      
      public function get nestLevel() : int
      {
         return _nestLevel;
      }
      
      private function textFieldStyleChangeHandler(param1:Event) : void
      {
         if(explicitHTMLText != null)
         {
            super.htmlText = explicitHTMLText;
         }
      }
      
      public function truncateToFit(param1:String = null) : Boolean
      {
         var _loc4_:String = null;
         if(!param1)
         {
            param1 = truncationIndicatorResource;
         }
         validateNow();
         var _loc2_:String = super.text;
         untruncatedText = _loc2_;
         var _loc3_:Number = width;
         if(_loc2_ != "" && textWidth + mx_internal::TEXT_WIDTH_PADDING > _loc3_ + 1e-14)
         {
            _loc4_ = super.text = _loc2_;
            _loc2_.slice(0,Math.floor(_loc3_ / (textWidth + mx_internal::TEXT_WIDTH_PADDING) * _loc2_.length));
            while(_loc4_.length > 1 && textWidth + mx_internal::TEXT_WIDTH_PADDING > _loc3_)
            {
               _loc4_ = _loc4_.slice(0,-1);
               super.text = _loc4_ + param1;
            }
            return true;
         }
         return false;
      }
      
      public function set nestLevel(param1:int) : void
      {
         if(param1 > 1 && _nestLevel != param1)
         {
            _nestLevel = param1;
            StyleProtoChain.initTextField(this);
            mx_internal::styleChangedFlag = true;
            validateNow();
         }
      }
      
      public function get minHeight() : Number
      {
         return 0;
      }
      
      public function getExplicitOrMeasuredHeight() : Number
      {
         return !isNaN(explicitHeight) ? explicitHeight : measuredHeight;
      }
      
      public function getStyle(param1:String) : *
      {
         if(StyleManager.mx_internal::inheritingStyles[param1])
         {
            return !!inheritingStyles ? inheritingStyles[param1] : IStyleClient(parent).getStyle(param1);
         }
         return !!nonInheritingStyles ? nonInheritingStyles[param1] : IStyleClient(parent).getStyle(param1);
      }
      
      public function get className() : String
      {
         var _loc1_:String = getQualifiedClassName(this);
         var _loc2_:int = _loc1_.indexOf("::");
         if(_loc2_ != -1)
         {
            _loc1_ = _loc1_.substr(_loc2_ + 2);
         }
         return _loc1_;
      }
      
      public function setColor(param1:uint) : void
      {
         mx_internal::explicitColor = param1;
         mx_internal::styleChangedFlag = true;
         invalidateDisplayListFlag = true;
         validateNow();
      }
      
      override public function replaceText(param1:int, param2:int, param3:String) : void
      {
         super.replaceText(param1,param2,param3);
         dispatchEvent(new Event("textReplace"));
      }
      
      private function creatingSystemManager() : ISystemManager
      {
         return moduleFactory != null && moduleFactory is ISystemManager ? ISystemManager(moduleFactory) : systemManager;
      }
      
      public function set document(param1:Object) : void
      {
         _document = param1;
      }
      
      public function get automationName() : String
      {
         if(_automationName)
         {
            return _automationName;
         }
         if(automationDelegate)
         {
            return automationDelegate.automationName;
         }
         return "";
      }
      
      public function get explicitMinHeight() : Number
      {
         return NaN;
      }
      
      public function get focusPane() : Sprite
      {
         return null;
      }
      
      public function getTextStyles() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.align = getStyle("textAlign");
         _loc1_.bold = getStyle("fontWeight") == "bold";
         if(enabled)
         {
            if(mx_internal::explicitColor == StyleManager.NOT_A_COLOR)
            {
               _loc1_.color = getStyle("color");
            }
            else
            {
               _loc1_.color = mx_internal::explicitColor;
            }
         }
         else
         {
            _loc1_.color = getStyle("disabledColor");
         }
         _loc1_.font = StringUtil.trimArrayElements(getStyle("fontFamily"),",");
         _loc1_.indent = getStyle("textIndent");
         _loc1_.italic = getStyle("fontStyle") == "italic";
         _loc1_.kerning = getStyle("kerning");
         _loc1_.leading = getStyle("leading");
         _loc1_.leftMargin = ignorePadding ? 0 : getStyle("paddingLeft");
         _loc1_.letterSpacing = getStyle("letterSpacing");
         _loc1_.rightMargin = ignorePadding ? 0 : getStyle("paddingRight");
         _loc1_.size = getStyle("fontSize");
         _loc1_.underline = getStyle("textDecoration") == "underline";
         cachedTextFormat = _loc1_;
         return _loc1_;
      }
      
      override public function set text(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         if(!isHTML && super.text == param1)
         {
            return;
         }
         super.text = param1;
         explicitHTMLText = null;
         if(invalidateDisplayListFlag)
         {
            validateNow();
         }
      }
      
      public function getExplicitOrMeasuredWidth() : Number
      {
         return !isNaN(explicitWidth) ? explicitWidth : measuredWidth;
      }
      
      public function get showInAutomationHierarchy() : Boolean
      {
         return true;
      }
      
      public function set automationName(param1:String) : void
      {
         _automationName = param1;
      }
      
      public function get systemManager() : ISystemManager
      {
         var _loc2_:IUIComponent = null;
         var _loc1_:DisplayObject = parent;
         while(_loc1_)
         {
            _loc2_ = _loc1_ as IUIComponent;
            if(_loc2_)
            {
               return _loc2_.systemManager;
            }
            _loc1_ = _loc1_.parent;
         }
         return null;
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
      }
      
      public function get percentWidth() : Number
      {
         return NaN;
      }
      
      public function get explicitHeight() : Number
      {
         return _explicitHeight;
      }
      
      public function get baselinePosition() : Number
      {
         var _loc1_:TextLineMetrics = null;
         if(false)
         {
            _loc1_ = getLineMetrics(0);
            return height - 4 - _loc1_.descent;
         }
         if(!parent)
         {
            return NaN;
         }
         var _loc2_:* = text == "";
         if(_loc2_)
         {
            super.text = "Wj";
         }
         _loc1_ = getLineMetrics(0);
         if(_loc2_)
         {
            super.text = "";
         }
         return 2 + _loc1_.ascent;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         mouseEnabled = param1;
         _enabled = param1;
         styleChanged("color");
      }
      
      public function get minWidth() : Number
      {
         return 0;
      }
      
      public function get automationValue() : Array
      {
         if(automationDelegate)
         {
            return automationDelegate.automationValue;
         }
         return [""];
      }
      
      public function get tweeningProperties() : Array
      {
         return null;
      }
      
      public function get measuredWidth() : Number
      {
         validateNow();
         if(!stage)
         {
            return textWidth + mx_internal::TEXT_WIDTH_PADDING;
         }
         return textWidth * transform.concatenatedMatrix.d + mx_internal::TEXT_WIDTH_PADDING;
      }
      
      public function set tweeningProperties(param1:Array) : void
      {
      }
      
      public function createAutomationIDPart(param1:IAutomationObject) : Object
      {
         return null;
      }
      
      override public function get parent() : DisplayObjectContainer
      {
         return !!mx_internal::_parent ? mx_internal::_parent : super.parent;
      }
      
      public function set updateCompletePendingFlag(param1:Boolean) : void
      {
         _updateCompletePendingFlag = param1;
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         if(width != param1)
         {
            width = param1;
         }
         if(height != param2)
         {
            height = param2;
         }
      }
      
      public function get numAutomationChildren() : int
      {
         return 0;
      }
      
      public function set focusPane(param1:Sprite) : void
      {
      }
      
      public function getAutomationChildAt(param1:int) : IAutomationObject
      {
         return null;
      }
      
      public function get inheritingStyles() : Object
      {
         return _inheritingStyles;
      }
      
      public function get owner() : DisplayObjectContainer
      {
         return !!_owner ? _owner : parent;
      }
      
      public function parentChanged(param1:DisplayObjectContainer) : void
      {
         if(!param1)
         {
            mx_internal::_parent = null;
            _nestLevel = 0;
         }
         else if(param1 is IStyleClient)
         {
            mx_internal::_parent = param1;
         }
         else if(param1 is SystemManager)
         {
            mx_internal::_parent = param1;
         }
         else
         {
            mx_internal::_parent = param1.parent;
         }
      }
      
      public function get processedDescriptors() : Boolean
      {
         return _processedDescriptors;
      }
      
      public function get maxWidth() : Number
      {
         return UIComponent.DEFAULT_MAX_WIDTH;
      }
      
      private function getEmbeddedFont(param1:String, param2:Boolean, param3:Boolean) : mx.core.EmbeddedFont
      {
         if(cachedEmbeddedFont)
         {
            if(cachedEmbeddedFont.fontName == param1 && cachedEmbeddedFont.fontStyle == EmbeddedFontRegistry.getFontStyle(param2,param3))
            {
               return cachedEmbeddedFont;
            }
         }
         cachedEmbeddedFont = new mx.core.EmbeddedFont(param1,param2,param3);
         return cachedEmbeddedFont;
      }
      
      public function get initialized() : Boolean
      {
         return _initialized;
      }
      
      public function invalidateDisplayList() : void
      {
         invalidateDisplayListFlag = true;
      }
      
      public function invalidateProperties() : void
      {
      }
      
      override public function insertXMLText(param1:int, param2:int, param3:String, param4:Boolean = false) : void
      {
         super.insertXMLText(param1,param2,param3,param4);
         dispatchEvent(new Event("textInsert"));
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         var _loc2_:IInvalidating = null;
         if(_includeInLayout != param1)
         {
            _includeInLayout = param1;
            _loc2_ = parent as IInvalidating;
            if(_loc2_)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
         }
      }
      
      override public function set htmlText(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         if(isHTML && super.htmlText == param1)
         {
            return;
         }
         if(Boolean(cachedTextFormat) && styleSheet == null)
         {
            defaultTextFormat = cachedTextFormat;
         }
         super.htmlText = param1;
         explicitHTMLText = param1;
         if(invalidateDisplayListFlag)
         {
            validateNow();
         }
      }
      
      public function set showInAutomationHierarchy(param1:Boolean) : void
      {
      }
      
      private function resourceManager_changeHandler(param1:Event) : void
      {
         truncationIndicatorResource = resourceManager.getString("core","truncationIndicator");
         if(untruncatedText != null)
         {
            super.text = untruncatedText;
            truncateToFit();
         }
      }
      
      public function set measuredMinWidth(param1:Number) : void
      {
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         _explicitHeight = param1;
      }
      
      public function get explicitMinWidth() : Number
      {
         return NaN;
      }
      
      public function set percentWidth(param1:Number) : void
      {
      }
      
      public function get imeMode() : String
      {
         return _imeMode;
      }
      
      public function get moduleFactory() : mx.core.IFlexModuleFactory
      {
         return _moduleFactory;
      }
      
      public function set systemManager(param1:ISystemManager) : void
      {
      }
      
      public function get explicitMaxWidth() : Number
      {
         return NaN;
      }
      
      public function get document() : Object
      {
         return _document;
      }
      
      public function get updateCompletePendingFlag() : Boolean
      {
         return _updateCompletePendingFlag;
      }
      
      public function replayAutomatableEvent(param1:Event) : Boolean
      {
         if(automationDelegate)
         {
            return automationDelegate.replayAutomatableEvent(param1);
         }
         return false;
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function set owner(param1:DisplayObjectContainer) : void
      {
         _owner = param1;
      }
      
      public function get automationTabularData() : Object
      {
         return null;
      }
      
      public function set nonInheritingStyles(param1:Object) : void
      {
         _nonInheritingStyles = param1;
      }
      
      public function get includeInLayout() : Boolean
      {
         return _includeInLayout;
      }
      
      public function get measuredMinWidth() : Number
      {
         return 0;
      }
      
      public function set isPopUp(param1:Boolean) : void
      {
      }
      
      public function set automationDelegate(param1:Object) : void
      {
         _automationDelegate = param1 as IAutomationObject;
      }
      
      public function get measuredHeight() : Number
      {
         validateNow();
         if(!stage)
         {
            return textHeight + mx_internal::TEXT_HEIGHT_PADDING;
         }
         return textHeight * transform.concatenatedMatrix.a + mx_internal::TEXT_HEIGHT_PADDING;
      }
      
      public function set processedDescriptors(param1:Boolean) : void
      {
         _processedDescriptors = param1;
      }
      
      public function setFocus() : void
      {
         systemManager.stage.focus = this;
      }
      
      public function initialize() : void
      {
      }
      
      public function set percentHeight(param1:Number) : void
      {
      }
      
      public function resolveAutomationIDPart(param1:Object) : Array
      {
         return [];
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
         _inheritingStyles = param1;
      }
      
      public function getUITextFormat() : UITextFormat
      {
         validateNow();
         var _loc1_:UITextFormat = new UITextFormat(creatingSystemManager());
         _loc1_.moduleFactory = moduleFactory;
         _loc1_.mx_internal::copyFrom(getTextFormat());
         _loc1_.antiAliasType = antiAliasType;
         _loc1_.gridFitType = gridFitType;
         _loc1_.sharpness = sharpness;
         _loc1_.thickness = thickness;
         return _loc1_;
      }
      
      private function changeHandler(param1:Event) : void
      {
         explicitHTMLText = null;
      }
      
      public function set initialized(param1:Boolean) : void
      {
         _initialized = param1;
      }
      
      public function get nonZeroTextHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(super.text == "")
         {
            super.text = "Wj";
            _loc1_ = textHeight;
            super.text = "";
            return _loc1_;
         }
         return textHeight;
      }
      
      public function owns(param1:DisplayObject) : Boolean
      {
         return param1 == this;
      }
      
      override public function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         if(styleSheet)
         {
            return;
         }
         super.setTextFormat(param1,param2,param3);
         dispatchEvent(new Event("textFormatChange"));
      }
      
      public function get nonInheritingStyles() : Object
      {
         return _nonInheritingStyles;
      }
      
      public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
         this.visible = param1;
      }
      
      public function get maxHeight() : Number
      {
         return UIComponent.DEFAULT_MAX_HEIGHT;
      }
      
      public function get automationDelegate() : Object
      {
         return _automationDelegate;
      }
      
      public function get isPopUp() : Boolean
      {
         return false;
      }
      
      public function set ignorePadding(param1:Boolean) : void
      {
         _ignorePadding = param1;
         styleChanged(null);
      }
      
      public function set styleName(param1:Object) : void
      {
         if(_styleName === param1)
         {
            return;
         }
         _styleName = param1;
         if(parent)
         {
            StyleProtoChain.initTextField(this);
            styleChanged("styleName");
         }
      }
      
      public function styleChanged(param1:String) : void
      {
         mx_internal::styleChangedFlag = true;
         if(!invalidateDisplayListFlag)
         {
            invalidateDisplayListFlag = true;
            if("callLater" in parent)
            {
               Object(parent).callLater(validateNow);
            }
         }
      }
      
      public function get percentHeight() : Number
      {
         return NaN;
      }
      
      private function get isHTML() : Boolean
      {
         return explicitHTMLText != null;
      }
      
      public function get explicitMaxHeight() : Number
      {
         return NaN;
      }
      
      public function get styleName() : Object
      {
         return _styleName;
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         _explicitWidth = param1;
      }
      
      public function validateNow() : void
      {
         var _loc1_:TextFormat = null;
         var _loc2_:mx.core.EmbeddedFont = null;
         var _loc3_:mx.core.IFlexModuleFactory = null;
         var _loc4_:ISystemManager = null;
         if(!parent)
         {
            return;
         }
         if(!isNaN(explicitWidth) && super.width != explicitWidth)
         {
            super.width = explicitWidth > 4 ? explicitWidth : 4;
         }
         if(!isNaN(explicitHeight) && super.height != explicitHeight)
         {
            super.height = explicitHeight;
         }
         if(mx_internal::styleChangedFlag)
         {
            _loc1_ = getTextStyles();
            if(_loc1_.font)
            {
               _loc2_ = getEmbeddedFont(_loc1_.font,_loc1_.bold,_loc1_.italic);
               _loc3_ = embeddedFontRegistry.getAssociatedModuleFactory(_loc2_,moduleFactory);
               if(_loc3_ != null)
               {
                  embedFonts = true;
               }
               else
               {
                  _loc4_ = creatingSystemManager();
                  embedFonts = _loc4_ != null && Boolean(_loc4_.isFontFaceEmbedded(_loc1_));
               }
            }
            else
            {
               embedFonts = getStyle("embedFonts");
            }
            if(getStyle("fontAntiAliasType") != undefined)
            {
               antiAliasType = getStyle("fontAntiAliasType");
               gridFitType = getStyle("fontGridFitType");
               sharpness = getStyle("fontSharpness");
               thickness = getStyle("fontThickness");
            }
            if(!styleSheet)
            {
               super.setTextFormat(_loc1_);
               defaultTextFormat = _loc1_;
            }
            dispatchEvent(new Event("textFieldStyleChange"));
         }
         mx_internal::styleChangedFlag = false;
         invalidateDisplayListFlag = false;
      }
      
      public function set toolTip(param1:String) : void
      {
         var _loc2_:String = mx_internal::_toolTip;
         mx_internal::_toolTip = param1;
         ToolTipManager.mx_internal::registerToolTip(this,_loc2_,param1);
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         if(this.x != param1)
         {
            this.x = param1;
         }
         if(this.y != param2)
         {
            this.y = param2;
         }
      }
      
      public function get toolTip() : String
      {
         return mx_internal::_toolTip;
      }
      
      public function get ignorePadding() : Boolean
      {
         return _ignorePadding;
      }
      
      public function get explicitWidth() : Number
      {
         return _explicitWidth;
      }
      
      public function invalidateSize() : void
      {
         invalidateDisplayListFlag = true;
      }
      
      public function set measuredMinHeight(param1:Number) : void
      {
      }
      
      public function get measuredMinHeight() : Number
      {
         return 0;
      }
      
      public function set moduleFactory(param1:mx.core.IFlexModuleFactory) : void
      {
         _moduleFactory = param1;
      }
   }
}
