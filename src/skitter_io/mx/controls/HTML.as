package mx.controls
{
   import flash.events.Event;
   import flash.events.HTMLUncaughtScriptExceptionEvent;
   import flash.events.MouseEvent;
   import flash.html.HTMLHistoryItem;
   import flash.html.HTMLHost;
   import flash.html.HTMLLoader;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.ClassFactory;
   import mx.core.EdgeMetrics;
   import mx.core.FlexHTMLLoader;
   import mx.core.IDataRenderer;
   import mx.core.IFactory;
   import mx.core.ScrollControlBase;
   import mx.core.ScrollPolicy;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.managers.IFocusManagerComponent;
   
   public class HTML extends ScrollControlBase implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer, IFocusManagerComponent
   {
      
      private static const MAX_HTML_HEIGHT:Number = 2880;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static const MAX_HTML_WIDTH:Number = 2880;
       
      
      private var _data:Object;
      
      private var _userAgent:String;
      
      private var _htmlLoaderFactory:IFactory;
      
      private var _location:String;
      
      private var _runtimeApplicationDomain:ApplicationDomain;
      
      private var htmlTextChanged:Boolean = false;
      
      public var htmlLoader:HTMLLoader;
      
      private var _paintsDefaultBackground:Boolean;
      
      private var locationChanged:Boolean = false;
      
      private var htmlHostChanged:Boolean = false;
      
      private var _listData:BaseListData;
      
      private var _htmlText:String;
      
      private var _htmlHost:HTMLHost;
      
      private var paintsDefaultBackgroundChanged:Boolean = false;
      
      private var userAgentChanged:Boolean = false;
      
      private var runtimeApplicationDomainChanged:Boolean = false;
      
      private var textSet:Boolean;
      
      public function HTML()
      {
         _htmlLoaderFactory = new ClassFactory(FlexHTMLLoader);
         super();
         mx_internal::_horizontalScrollPolicy = ScrollPolicy.AUTO;
         mx_internal::_verticalScrollPolicy = ScrollPolicy.AUTO;
         tabEnabled = false;
         tabChildren = true;
      }
      
      public static function get pdfCapability() : int
      {
         return HTMLLoader.pdfCapability;
      }
      
      public function get contentHeight() : Number
      {
         if(!htmlLoader)
         {
            return 0;
         }
         return htmlLoader.contentHeight;
      }
      
      public function get userAgent() : String
      {
         return _userAgent;
      }
      
      public function set userAgent(param1:String) : void
      {
         _userAgent = param1;
         userAgentChanged = true;
         invalidateProperties();
      }
      
      public function get loaded() : Boolean
      {
         if(!htmlLoader || locationChanged || htmlTextChanged)
         {
            return false;
         }
         return htmlLoader.loaded;
      }
      
      public function cancelLoad() : void
      {
         if(htmlLoader)
         {
            htmlLoader.cancelLoad();
         }
      }
      
      private function htmlLoader_htmlRenderHandler(param1:Event) : void
      {
         dispatchEvent(param1);
         adjustScrollBars();
      }
      
      [Bindable("htmlLoaderFactoryChanged")]
      public function get htmlLoaderFactory() : IFactory
      {
         return _htmlLoaderFactory;
      }
      
      public function historyForward() : void
      {
         if(htmlLoader)
         {
            htmlLoader.historyForward();
         }
      }
      
      public function set htmlLoaderFactory(param1:IFactory) : void
      {
         _htmlLoaderFactory = param1;
         dispatchEvent(new Event("htmlLoaderFactoryChanged"));
      }
      
      public function get historyLength() : int
      {
         if(!htmlLoader)
         {
            return 0;
         }
         return htmlLoader.historyLength;
      }
      
      public function reload() : void
      {
         if(htmlLoader)
         {
            htmlLoader.reload();
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!htmlLoader)
         {
            htmlLoader = htmlLoaderFactory.newInstance();
            htmlLoader.addEventListener(Event.HTML_DOM_INITIALIZE,htmlLoader_domInitialize);
            htmlLoader.addEventListener(Event.COMPLETE,htmlLoader_completeHandler);
            htmlLoader.addEventListener(Event.HTML_RENDER,htmlLoader_htmlRenderHandler);
            htmlLoader.addEventListener(Event.LOCATION_CHANGE,htmlLoader_locationChangeHandler);
            htmlLoader.addEventListener(Event.HTML_BOUNDS_CHANGE,htmlLoader_htmlBoundsChangeHandler);
            htmlLoader.addEventListener(Event.SCROLL,htmlLoader_scrollHandler);
            htmlLoader.addEventListener(HTMLUncaughtScriptExceptionEvent.UNCAUGHT_SCRIPT_EXCEPTION,htmlLoader_uncaughtScriptExceptionHandler);
            addChild(htmlLoader);
         }
      }
      
      public function historyGo(param1:int) : void
      {
         if(htmlLoader)
         {
            htmlLoader.historyGo(param1);
         }
      }
      
      private function htmlLoader_domInitialize(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      private function adjustScrollBars() : void
      {
         setScrollBarProperties(htmlLoader.contentWidth,htmlLoader.width,htmlLoader.contentHeight,htmlLoader.height);
         if(verticalScrollBar)
         {
            verticalScrollBar.lineScrollSize = 20;
         }
         if(horizontalScrollBar)
         {
            horizontalScrollBar.lineScrollSize = 20;
         }
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      [Bindable("locationChange")]
      public function get location() : String
      {
         return _location;
      }
      
      private function htmlLoader_completeHandler(param1:Event) : void
      {
         invalidateSize();
         dispatchEvent(param1);
      }
      
      public function set historyPosition(param1:int) : void
      {
         if(htmlLoader)
         {
            htmlLoader.historyPosition = param1;
         }
      }
      
      public function getHistoryAt(param1:int) : HTMLHistoryItem
      {
         if(!htmlLoader)
         {
            return null;
         }
         return htmlLoader.getHistoryAt(param1);
      }
      
      public function get runtimeApplicationDomain() : ApplicationDomain
      {
         return _runtimeApplicationDomain;
      }
      
      override protected function scrollHandler(param1:Event) : void
      {
         super.scrollHandler(param1);
         htmlLoader.scrollH = horizontalScrollPosition;
         htmlLoader.scrollV = verticalScrollPosition;
      }
      
      public function historyBack() : void
      {
         if(htmlLoader)
         {
            htmlLoader.historyBack();
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(htmlHostChanged)
         {
            htmlLoader.htmlHost = _htmlHost;
            htmlHostChanged = false;
         }
         if(paintsDefaultBackgroundChanged)
         {
            htmlLoader.paintsDefaultBackground = _paintsDefaultBackground;
            paintsDefaultBackgroundChanged = false;
         }
         if(runtimeApplicationDomainChanged)
         {
            htmlLoader.runtimeApplicationDomain = _runtimeApplicationDomain;
            runtimeApplicationDomainChanged = false;
         }
         if(userAgentChanged)
         {
            htmlLoader.userAgent = _userAgent;
            userAgentChanged = false;
         }
         if(locationChanged)
         {
            htmlLoader.load(new URLRequest(_location));
            locationChanged = false;
         }
         if(htmlTextChanged)
         {
            htmlLoader.loadString(_htmlText);
            htmlTextChanged = false;
         }
      }
      
      public function get contentWidth() : Number
      {
         if(!htmlLoader)
         {
            return 0;
         }
         return htmlLoader.contentWidth;
      }
      
      public function get domWindow() : Object
      {
         if(!htmlLoader)
         {
            return null;
         }
         return htmlLoader.window;
      }
      
      override protected function mouseWheelHandler(param1:MouseEvent) : void
      {
         if(param1.target != this)
         {
            return;
         }
         param1.delta *= 6;
         super.mouseWheelHandler(param1);
      }
      
      override public function set verticalScrollPosition(param1:Number) : void
      {
         param1 = Math.max(param1,0);
         if(Boolean(htmlLoader) && false)
         {
            param1 = Math.min(param1,0 - 0);
         }
         super.verticalScrollPosition = param1;
         if(htmlLoader)
         {
            htmlLoader.scrollV = param1;
         }
         else
         {
            invalidateProperties();
         }
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:* = undefined;
         _data = param1;
         if(_listData)
         {
            _loc2_ = _listData.label;
         }
         else if(_data != null)
         {
            if(_data is String)
            {
               _loc2_ = String(_data);
            }
            else
            {
               _loc2_ = _data.toString();
            }
         }
         if(_loc2_ !== undefined && !textSet)
         {
            htmlText = _loc2_;
            textSet = false;
         }
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      private function htmlLoader_scrollHandler(param1:Event) : void
      {
         horizontalScrollPosition = htmlLoader.scrollH;
         verticalScrollPosition = htmlLoader.scrollV;
      }
      
      public function get historyPosition() : int
      {
         if(!htmlLoader)
         {
            return 0;
         }
         return htmlLoader.historyPosition;
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:EdgeMetrics = viewMetrics;
         _loc1_.left += getStyle("paddingLeft");
         _loc1_.top += getStyle("paddingTop");
         _loc1_.right += getStyle("paddingRight");
         _loc1_.bottom += getStyle("paddingBottom");
         measuredWidth = Math.min(htmlLoader.contentWidth + _loc1_.left + _loc1_.right,MAX_HTML_WIDTH);
         measuredHeight = Math.min(htmlLoader.contentHeight + _loc1_.top + _loc1_.bottom,MAX_HTML_HEIGHT);
      }
      
      public function set listData(param1:BaseListData) : void
      {
         _listData = param1;
      }
      
      private function htmlLoader_uncaughtScriptExceptionHandler(param1:HTMLUncaughtScriptExceptionEvent) : void
      {
         var _loc2_:Event = param1.clone();
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
      
      private function htmlLoader_locationChangeHandler(param1:Event) : void
      {
         var _loc2_:* = _location != htmlLoader.location;
         _location = htmlLoader.location;
         if(_loc2_)
         {
            dispatchEvent(param1);
         }
      }
      
      public function set htmlHost(param1:HTMLHost) : void
      {
         _htmlHost = param1;
         htmlHostChanged = true;
         invalidateProperties();
      }
      
      [Bindable("dataChange")]
      public function get listData() : BaseListData
      {
         return _listData;
      }
      
      public function set htmlText(param1:String) : void
      {
         _htmlText = param1;
         htmlTextChanged = true;
         _location = null;
         locationChanged = false;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("htmlTextChanged"));
      }
      
      public function set location(param1:String) : void
      {
         _location = param1;
         locationChanged = true;
         _htmlText = null;
         htmlTextChanged = false;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("locationChange"));
      }
      
      public function get htmlHost() : HTMLHost
      {
         return _htmlHost;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:EdgeMetrics = viewMetrics;
         _loc3_.left += getStyle("paddingLeft");
         _loc3_.top += getStyle("paddingTop");
         _loc3_.right += getStyle("paddingRight");
         _loc3_.bottom += getStyle("paddingBottom");
         htmlLoader.x = _loc3_.left;
         htmlLoader.y = _loc3_.top;
         var _loc4_:Number = Math.max(param1 - _loc3_.left - _loc3_.right,1);
         var _loc5_:Number = Math.max(param2 - _loc3_.top - _loc3_.bottom,1);
         htmlLoader.width = _loc4_;
         htmlLoader.height = _loc5_;
      }
      
      [Bindable("htmlTextChanged")]
      public function get htmlText() : String
      {
         return _htmlText;
      }
      
      private function htmlLoader_htmlBoundsChangeHandler(param1:Event) : void
      {
         invalidateSize();
         adjustScrollBars();
      }
      
      public function get paintsDefaultBackground() : Boolean
      {
         return _paintsDefaultBackground;
      }
      
      public function set paintsDefaultBackground(param1:Boolean) : void
      {
         _paintsDefaultBackground = param1;
         paintsDefaultBackgroundChanged = true;
         invalidateProperties();
      }
      
      public function set runtimeApplicationDomain(param1:ApplicationDomain) : void
      {
         _runtimeApplicationDomain = param1;
         runtimeApplicationDomainChanged = true;
         invalidateProperties();
      }
   }
}
