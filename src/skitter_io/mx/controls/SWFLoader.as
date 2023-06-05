package mx.controls
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.SecurityDomain;
   import flash.utils.ByteArray;
   import mx.core.Application;
   import mx.core.FlexLoader;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.ISWFLoader;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.InterManagerRequest;
   import mx.events.InvalidateRequestData;
   import mx.events.SWFBridgeEvent;
   import mx.events.SWFBridgeRequest;
   import mx.managers.CursorManager;
   import mx.managers.ISystemManager;
   import mx.managers.SystemManagerGlobals;
   import mx.styles.ISimpleStyleClient;
   import mx.utils.LoaderUtil;
   
   public class SWFLoader extends UIComponent implements ISWFLoader
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var lcKC:LoaderContext;
      
      private var _loadForCompatibility:Boolean = false;
      
      private var _loaderContext:LoaderContext;
      
      private var requestedURL:URLRequest;
      
      private var _swfBridge:IEventDispatcher;
      
      private var _bytesTotal:Number = NaN;
      
      private var useUnloadAndStop:Boolean;
      
      private var flexContent:Boolean = false;
      
      private var explicitLoaderContext:Boolean = false;
      
      private var resizableContent:Boolean = false;
      
      private var brokenImageBorder:IFlexDisplayObject;
      
      private var _source:Object;
      
      private var _maintainAspectRatio:Boolean = true;
      
      private var mouseShield:Sprite;
      
      private var contentRequestID:String = null;
      
      private var _smoothBitmapContent:Boolean = false;
      
      mx_internal var contentHolder:DisplayObject;
      
      private var brokenImage:Boolean = false;
      
      private var _bytesLoaded:Number = NaN;
      
      private var _autoLoad:Boolean = true;
      
      private var _showBusyCursor:Boolean = false;
      
      private var _scaleContent:Boolean = true;
      
      private var isContentLoaded:Boolean = false;
      
      private var unloadAndStopGC:Boolean;
      
      private var smoothBitmapContentChanged:Boolean = false;
      
      private var attemptingChildAppDomain:Boolean = false;
      
      private var _trustContent:Boolean = false;
      
      private var scaleContentChanged:Boolean = false;
      
      private var contentChanged:Boolean = false;
      
      public function SWFLoader()
      {
         super();
         tabChildren = true;
         tabEnabled = false;
         addEventListener(FlexEvent.INITIALIZE,this.initializeHandler);
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         addEventListener(MouseEvent.CLICK,this.clickHandler);
         showInAutomationHierarchy = false;
      }
      
      public function get contentHeight() : Number
      {
         return !!this.mx_internal::contentHolder ? this.mx_internal::contentHolder.height : NaN;
      }
      
      [Bindable("trustContentChanged")]
      public function get trustContent() : Boolean
      {
         return this._trustContent;
      }
      
      public function set trustContent(param1:Boolean) : void
      {
         if(this._trustContent != param1)
         {
            this._trustContent = param1;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("trustContentChanged"));
         }
      }
      
      [Bindable("maintainAspectRatioChanged")]
      public function get maintainAspectRatio() : Boolean
      {
         return this._maintainAspectRatio;
      }
      
      private function doScaleContent() : void
      {
         var interiorWidth:Number = NaN;
         var interiorHeight:Number = NaN;
         var contentWidth:Number = NaN;
         var contentHeight:Number = NaN;
         var x:Number = NaN;
         var y:Number = NaN;
         var newXScale:Number = NaN;
         var newYScale:Number = NaN;
         var scale:Number = NaN;
         var w:Number = NaN;
         var h:Number = NaN;
         var holder:Loader = null;
         var sizeSet:Boolean = false;
         var lInfo:LoaderInfo = null;
         if(!this.isContentLoaded)
         {
            return;
         }
         if(!this.resizableContent || this.maintainAspectRatio && !this.flexContent)
         {
            this.unScaleContent();
            interiorWidth = unscaledWidth;
            interiorHeight = unscaledHeight;
            contentWidth = this.contentHolderWidth;
            contentHeight = this.contentHolderHeight;
            x = 0;
            y = 0;
            newXScale = contentWidth == 0 ? 1 : interiorWidth / contentWidth;
            newYScale = contentHeight == 0 ? 1 : interiorHeight / contentHeight;
            if(this._maintainAspectRatio)
            {
               if(newXScale > newYScale)
               {
                  x = Math.floor((interiorWidth - contentWidth * newYScale) * this.getHorizontalAlignValue());
                  scale = newYScale;
               }
               else
               {
                  y = Math.floor((interiorHeight - contentHeight * newXScale) * this.getVerticalAlignValue());
                  scale = newXScale;
               }
               this.mx_internal::contentHolder.scaleX = scale;
               this.mx_internal::contentHolder.scaleY = scale;
            }
            else
            {
               this.mx_internal::contentHolder.scaleX = newXScale;
               this.mx_internal::contentHolder.scaleY = newYScale;
            }
            this.mx_internal::contentHolder.x = x;
            this.mx_internal::contentHolder.y = y;
         }
         else
         {
            this.mx_internal::contentHolder.x = 0;
            this.mx_internal::contentHolder.y = 0;
            w = unscaledWidth;
            h = unscaledHeight;
            if(this.mx_internal::contentHolder is Loader)
            {
               holder = Loader(this.mx_internal::contentHolder);
               try
               {
                  if(this.getContentSize().x > 0)
                  {
                     sizeSet = false;
                     if(holder.contentLoaderInfo.contentType == "application/x-shockwave-flash")
                     {
                        if(this.childAllowsParent)
                        {
                           if(holder.content is IFlexDisplayObject)
                           {
                              IFlexDisplayObject(holder.content).setActualSize(w,h);
                              sizeSet = true;
                           }
                        }
                        if(!sizeSet && Boolean(this.swfBridge))
                        {
                           this.swfBridge.dispatchEvent(new SWFBridgeRequest(SWFBridgeRequest.SET_ACTUAL_SIZE_REQUEST,false,false,null,{
                              "width":w,
                              "height":h
                           }));
                           sizeSet = true;
                        }
                     }
                     if(!sizeSet)
                     {
                        lInfo = holder.contentLoaderInfo;
                        if(lInfo)
                        {
                           this.mx_internal::contentHolder.scaleX = w / lInfo.width;
                           this.mx_internal::contentHolder.scaleY = h / lInfo.height;
                        }
                        else
                        {
                           this.mx_internal::contentHolder.width = w;
                           this.mx_internal::contentHolder.height = h;
                        }
                     }
                  }
                  else if(this.childAllowsParent && !(holder.content is IFlexDisplayObject))
                  {
                     this.mx_internal::contentHolder.width = w;
                     this.mx_internal::contentHolder.height = h;
                  }
               }
               catch(error:Error)
               {
                  mx_internal::contentHolder.width = w;
                  mx_internal::contentHolder.height = h;
               }
               if(!this.parentAllowsChild)
               {
                  this.mx_internal::contentHolder.scrollRect = new Rectangle(0,0,w / this.mx_internal::contentHolder.scaleX,h / this.mx_internal::contentHolder.scaleY);
               }
            }
            else
            {
               this.mx_internal::contentHolder.width = w;
               this.mx_internal::contentHolder.height = h;
            }
         }
      }
      
      public function set maintainAspectRatio(param1:Boolean) : void
      {
         this._maintainAspectRatio = param1;
         dispatchEvent(new Event("maintainAspectRatioChanged"));
      }
      
      private function unScaleContent() : void
      {
         this.mx_internal::contentHolder.scaleX = 1;
         this.mx_internal::contentHolder.scaleY = 1;
         this.mx_internal::contentHolder.x = 0;
         this.mx_internal::contentHolder.y = 0;
      }
      
      override public function regenerateStyleCache(param1:Boolean) : void
      {
         var sm:ISystemManager = null;
         var recursive:Boolean = param1;
         super.regenerateStyleCache(recursive);
         try
         {
            sm = this.content as ISystemManager;
            if(sm != null)
            {
               Object(sm).regenerateStyleCache(recursive);
            }
         }
         catch(error:Error)
         {
         }
      }
      
      private function get contentHolderHeight() : Number
      {
         var loaderInfo:LoaderInfo = null;
         var content:IFlexDisplayObject = null;
         var bridge:IEventDispatcher = null;
         var request:SWFBridgeRequest = null;
         var testContent:DisplayObject = null;
         if(this.mx_internal::contentHolder is Loader)
         {
            loaderInfo = Loader(this.mx_internal::contentHolder).contentLoaderInfo;
         }
         if(loaderInfo)
         {
            if(loaderInfo.contentType == "application/x-shockwave-flash")
            {
               try
               {
                  if(false)
                  {
                     bridge = this.swfBridge;
                     if(bridge)
                     {
                        request = new SWFBridgeRequest(SWFBridgeRequest.GET_SIZE_REQUEST);
                        bridge.dispatchEvent(request);
                        return request.data.height;
                     }
                  }
                  content = Loader(this.mx_internal::contentHolder).content as IFlexDisplayObject;
                  if(content)
                  {
                     return content.measuredHeight;
                  }
               }
               catch(error:Error)
               {
                  return mx_internal::contentHolder.height;
               }
            }
            else
            {
               try
               {
                  testContent = Loader(this.mx_internal::contentHolder).content;
               }
               catch(error:Error)
               {
                  return mx_internal::contentHolder.height;
               }
            }
            return loaderInfo.height;
         }
         if(this.mx_internal::contentHolder is IUIComponent)
         {
            return IUIComponent(this.mx_internal::contentHolder).getExplicitOrMeasuredHeight();
         }
         if(this.mx_internal::contentHolder is IFlexDisplayObject)
         {
            return IFlexDisplayObject(this.mx_internal::contentHolder).measuredHeight;
         }
         return this.mx_internal::contentHolder.height;
      }
      
      [Bindable("loaderContextChanged")]
      public function get loaderContext() : LoaderContext
      {
         return this._loaderContext;
      }
      
      public function set showBusyCursor(param1:Boolean) : void
      {
         if(this._showBusyCursor != param1)
         {
            this._showBusyCursor = param1;
            if(this._showBusyCursor)
            {
               CursorManager.mx_internal::registerToUseBusyCursor(this);
            }
            else
            {
               CursorManager.mx_internal::unRegisterToUseBusyCursor(this);
            }
         }
      }
      
      override public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         var sm:ISystemManager = null;
         var styleProp:String = param1;
         var recursive:Boolean = param2;
         super.notifyStyleChangeInChildren(styleProp,recursive);
         try
         {
            sm = this.content as ISystemManager;
            if(sm != null)
            {
               Object(sm).notifyStyleChangeInChildren(styleProp,recursive);
            }
         }
         catch(error:Error)
         {
         }
      }
      
      private function getHorizontalAlignValue() : Number
      {
         var _loc1_:String = getStyle("horizontalAlign");
         if(_loc1_ == "left")
         {
            return 0;
         }
         if(_loc1_ == "right")
         {
            return 1;
         }
         return 0.5;
      }
      
      [Bindable("sourceChanged")]
      public function get source() : Object
      {
         return this._source;
      }
      
      [Bindable("loadForCompatibilityChanged")]
      public function get loadForCompatibility() : Boolean
      {
         return this._loadForCompatibility;
      }
      
      private function contentLoaderInfo_httpStatusEventHandler(param1:HTTPStatusEvent) : void
      {
         dispatchEvent(param1);
      }
      
      [Bindable("autoLoadChanged")]
      public function get autoLoad() : Boolean
      {
         return this._autoLoad;
      }
      
      public function set source(param1:Object) : void
      {
         if(this._source != param1)
         {
            this._source = param1;
            this.contentChanged = true;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("sourceChanged"));
         }
      }
      
      [Bindable("smoothBitmapContentChanged")]
      public function get smoothBitmapContent() : Boolean
      {
         return this._smoothBitmapContent;
      }
      
      public function set loaderContext(param1:LoaderContext) : void
      {
         this._loaderContext = param1;
         this.explicitLoaderContext = true;
         dispatchEvent(new Event("loaderContextChanged"));
      }
      
      private function get contentHolderWidth() : Number
      {
         var loaderInfo:LoaderInfo = null;
         var content:IFlexDisplayObject = null;
         var request:SWFBridgeRequest = null;
         var testContent:DisplayObject = null;
         if(this.mx_internal::contentHolder is Loader)
         {
            loaderInfo = Loader(this.mx_internal::contentHolder).contentLoaderInfo;
         }
         if(loaderInfo)
         {
            if(loaderInfo.contentType == "application/x-shockwave-flash")
            {
               try
               {
                  if(this.swfBridge)
                  {
                     request = new SWFBridgeRequest(SWFBridgeRequest.GET_SIZE_REQUEST);
                     this.swfBridge.dispatchEvent(request);
                     return request.data.width;
                  }
                  content = Loader(this.mx_internal::contentHolder).content as IFlexDisplayObject;
                  if(content)
                  {
                     return content.measuredWidth;
                  }
               }
               catch(error:Error)
               {
                  return mx_internal::contentHolder.width;
               }
            }
            else
            {
               try
               {
                  testContent = Loader(this.mx_internal::contentHolder).content;
               }
               catch(error:Error)
               {
                  return mx_internal::contentHolder.width;
               }
            }
            return loaderInfo.width;
         }
         if(this.mx_internal::contentHolder is IUIComponent)
         {
            return IUIComponent(this.mx_internal::contentHolder).getExplicitOrMeasuredWidth();
         }
         if(this.mx_internal::contentHolder is IFlexDisplayObject)
         {
            return IFlexDisplayObject(this.mx_internal::contentHolder).measuredWidth;
         }
         return this.mx_internal::contentHolder.width;
      }
      
      [Bindable("progress")]
      public function get bytesLoaded() : Number
      {
         return this._bytesLoaded;
      }
      
      private function removeInitSystemManagerCompleteListener(param1:LoaderInfo) : void
      {
         var _loc2_:EventDispatcher = null;
         if(param1.contentType == "application/x-shockwave-flash")
         {
            _loc2_ = param1.sharedEvents;
            _loc2_.removeEventListener(SWFBridgeEvent.BRIDGE_NEW_APPLICATION,this.initSystemManagerCompleteEventHandler);
         }
      }
      
      public function set loadForCompatibility(param1:Boolean) : void
      {
         if(this._loadForCompatibility != param1)
         {
            this._loadForCompatibility = param1;
            this.contentChanged = true;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("loadForCompatibilityChanged"));
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         super.measure();
         if(this.isContentLoaded)
         {
            _loc1_ = this.mx_internal::contentHolder.scaleX;
            _loc2_ = this.mx_internal::contentHolder.scaleY;
            this.mx_internal::contentHolder.scaleX = 1;
            this.mx_internal::contentHolder.scaleY = 1;
            measuredWidth = this.contentHolderWidth;
            measuredHeight = this.contentHolderHeight;
            this.mx_internal::contentHolder.scaleX = _loc1_;
            this.mx_internal::contentHolder.scaleY = _loc2_;
         }
         else if(!this._source || this._source == "")
         {
            measuredWidth = 0;
            measuredHeight = 0;
         }
      }
      
      private function contentLoaderInfo_initEventHandler(param1:Event) : void
      {
         dispatchEvent(param1);
         this.addInitSystemManagerCompleteListener(LoaderInfo(param1.target).loader.contentLoaderInfo);
      }
      
      public function set autoLoad(param1:Boolean) : void
      {
         if(this._autoLoad != param1)
         {
            this._autoLoad = param1;
            this.contentChanged = true;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("autoLoadChanged"));
         }
      }
      
      private function doScaleLoader() : void
      {
         if(!this.isContentLoaded)
         {
            return;
         }
         this.unScaleContent();
         var _loc1_:Number = unscaledWidth;
         var _loc2_:Number = unscaledHeight;
         if(this.contentHolderWidth > _loc1_ || this.contentHolderHeight > _loc2_ || !this.parentAllowsChild)
         {
            this.mx_internal::contentHolder.scrollRect = new Rectangle(0,0,_loc1_,_loc2_);
         }
         else
         {
            this.mx_internal::contentHolder.scrollRect = null;
         }
         this.mx_internal::contentHolder.x = (_loc1_ - this.contentHolderWidth) * this.getHorizontalAlignValue();
         this.mx_internal::contentHolder.y = (_loc2_ - this.contentHolderHeight) * this.getVerticalAlignValue();
      }
      
      public function get content() : DisplayObject
      {
         if(this.mx_internal::contentHolder is Loader)
         {
            return Loader(this.mx_internal::contentHolder).content;
         }
         return this.mx_internal::contentHolder;
      }
      
      public function unloadAndStop(param1:Boolean = true) : void
      {
         this.useUnloadAndStop = true;
         this.unloadAndStopGC = param1;
         this.source = null;
         if(!this.autoLoad)
         {
            this.load(null);
         }
      }
      
      public function set smoothBitmapContent(param1:Boolean) : void
      {
         if(this._smoothBitmapContent != param1)
         {
            this._smoothBitmapContent = param1;
            this.smoothBitmapContentChanged = true;
            invalidateDisplayList();
         }
         dispatchEvent(new Event("smoothBitmapContentChanged"));
      }
      
      private function dispatchInvalidateRequest(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:ISystemManager;
         if(!(_loc4_ = systemManager).useSWFBridge())
         {
            return;
         }
         var _loc5_:IEventDispatcher = _loc4_.swfBridgeGroup.parentBridge;
         var _loc6_:* = 0;
         if(param1)
         {
            _loc6_ |= 0;
         }
         if(param2)
         {
            _loc6_ |= 0;
         }
         if(param3)
         {
            _loc6_ |= 0;
         }
         var _loc7_:SWFBridgeRequest = new SWFBridgeRequest(SWFBridgeRequest.INVALIDATE_REQUEST,false,false,_loc5_,_loc6_);
         _loc5_.dispatchEvent(_loc7_);
      }
      
      private function contentLoaderInfo_progressEventHandler(param1:ProgressEvent) : void
      {
         this._bytesTotal = param1.bytesTotal;
         this._bytesLoaded = param1.bytesLoaded;
         dispatchEvent(param1);
      }
      
      public function getVisibleApplicationRect(param1:Boolean = false) : Rectangle
      {
         var _loc2_:Rectangle = getVisibleRect();
         if(param1)
         {
            _loc2_ = systemManager.getVisibleApplicationRect(_loc2_);
         }
         return _loc2_;
      }
      
      public function get showBusyCursor() : Boolean
      {
         return this._showBusyCursor;
      }
      
      override public function get baselinePosition() : Number
      {
         if(false)
         {
            return 0;
         }
         return super.baselinePosition;
      }
      
      private function initSystemManagerCompleteEventHandler(param1:Event) : void
      {
         var _loc3_:ISystemManager = null;
         var _loc2_:Object = Object(param1);
         if(this.mx_internal::contentHolder is Loader && _loc2_.data == Loader(this.mx_internal::contentHolder).contentLoaderInfo.sharedEvents)
         {
            this._swfBridge = Loader(this.mx_internal::contentHolder).contentLoaderInfo.sharedEvents;
            _loc3_ = systemManager;
            _loc3_.addChildBridge(this._swfBridge,this);
            this.removeInitSystemManagerCompleteListener(Loader(this.mx_internal::contentHolder).contentLoaderInfo);
            this._swfBridge.addEventListener(SWFBridgeRequest.INVALIDATE_REQUEST,this.invalidateRequestHandler);
         }
      }
      
      [Bindable("complete")]
      public function get bytesTotal() : Number
      {
         return this._bytesTotal;
      }
      
      private function getVerticalAlignValue() : Number
      {
         var _loc1_:String = getStyle("verticalAlign");
         if(_loc1_ == "top")
         {
            return 0;
         }
         if(_loc1_ == "bottom")
         {
            return 1;
         }
         return 0.5;
      }
      
      private function contentLoaderInfo_unloadEventHandler(param1:Event) : void
      {
         var _loc2_:ISystemManager = null;
         this.isContentLoaded = false;
         dispatchEvent(param1);
         if(this._swfBridge)
         {
            this._swfBridge.removeEventListener(SWFBridgeRequest.INVALIDATE_REQUEST,this.invalidateRequestHandler);
            _loc2_ = systemManager;
            _loc2_.removeChildBridge(this._swfBridge);
            this._swfBridge = null;
         }
         if(this.mx_internal::contentHolder is Loader)
         {
            this.removeInitSystemManagerCompleteListener(Loader(this.mx_internal::contentHolder).contentLoaderInfo);
         }
      }
      
      mx_internal function contentLoaderInfo_completeEventHandler(param1:Event) : void
      {
         if(LoaderInfo(param1.target).loader != this.mx_internal::contentHolder)
         {
            return;
         }
         dispatchEvent(param1);
         this.contentLoaded();
         if(this.mx_internal::contentHolder is Loader)
         {
            this.removeInitSystemManagerCompleteListener(Loader(this.mx_internal::contentHolder).contentLoaderInfo);
         }
      }
      
      public function set scaleContent(param1:Boolean) : void
      {
         if(this._scaleContent != param1)
         {
            this._scaleContent = param1;
            this.scaleContentChanged = true;
            invalidateDisplayList();
         }
         dispatchEvent(new Event("scaleContentChanged"));
      }
      
      private function contentLoaderInfo_openEventHandler(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      private function initializeHandler(param1:FlexEvent) : void
      {
         if(this.contentChanged)
         {
            this.contentChanged = false;
            if(this._autoLoad)
            {
               this.load(this._source);
            }
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            param1.stopImmediatePropagation();
            return;
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         systemManager.getSandboxRoot().addEventListener(InterManagerRequest.DRAG_MANAGER_REQUEST,this.mouseShieldHandler,false,0,true);
      }
      
      [Bindable("progress")]
      public function get percentLoaded() : Number
      {
         var _loc1_:Number = isNaN(this._bytesTotal) || this._bytesTotal == 0 ? 0 : 100 * (this._bytesLoaded / this._bytesTotal);
         if(isNaN(_loc1_))
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      private function doSmoothBitmapContent() : void
      {
         if(this.content is Bitmap)
         {
            (this.content as Bitmap).smoothing = this._smoothBitmapContent;
         }
      }
      
      public function get swfBridge() : IEventDispatcher
      {
         return this._swfBridge;
      }
      
      private function loadContent(param1:Object) : void
      {
         var child:DisplayObject = null;
         var cls:Class = null;
         var url:String = null;
         var byteArray:ByteArray = null;
         var loader:Loader = null;
         var lc:LoaderContext = null;
         var rootURL:String = null;
         var currentDomain:ApplicationDomain = null;
         var topmostDomain:ApplicationDomain = null;
         var message:String = null;
         var classOrString:Object = param1;
         if(classOrString is Class)
         {
            cls = Class(classOrString);
         }
         else if(classOrString is String)
         {
            try
            {
               cls = Class(systemManager.getDefinitionByName(String(classOrString)));
            }
            catch(e:Error)
            {
            }
            url = String(classOrString);
         }
         else if(classOrString is ByteArray)
         {
            byteArray = ByteArray(classOrString);
         }
         else
         {
            url = String(classOrString.toString());
         }
         if(cls)
         {
            this.mx_internal::contentHolder = child = new cls();
            addChild(child);
            this.contentLoaded();
         }
         else if(classOrString is DisplayObject)
         {
            this.mx_internal::contentHolder = child = DisplayObject(classOrString);
            addChild(child);
            this.contentLoaded();
         }
         else if(byteArray)
         {
            loader = new FlexLoader();
            this.mx_internal::contentHolder = child = loader;
            addChild(child);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.mx_internal::contentLoaderInfo_completeEventHandler);
            loader.contentLoaderInfo.addEventListener(Event.INIT,this.contentLoaderInfo_initEventHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.contentLoaderInfo_ioErrorEventHandler);
            loader.contentLoaderInfo.addEventListener(Event.UNLOAD,this.contentLoaderInfo_unloadEventHandler);
            if(this.lcKC == null)
            {
               this.lcKC = new LoaderContext();
            }
            if(false)
            {
               this.lcKC.allowLoadBytesCodeExecution = true;
            }
            loader.loadBytes(byteArray,this.lcKC);
         }
         else
         {
            if(!url)
            {
               message = String(resourceManager.getString("controls","notLoadable",[this.source]));
               throw new Error(message);
            }
            loader = new FlexLoader();
            this.mx_internal::contentHolder = child = loader;
            addChild(loader);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.mx_internal::contentLoaderInfo_completeEventHandler);
            loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.contentLoaderInfo_httpStatusEventHandler);
            loader.contentLoaderInfo.addEventListener(Event.INIT,this.contentLoaderInfo_initEventHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.contentLoaderInfo_ioErrorEventHandler);
            loader.contentLoaderInfo.addEventListener(Event.OPEN,this.contentLoaderInfo_openEventHandler);
            loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.contentLoaderInfo_progressEventHandler);
            loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.contentLoaderInfo_securityErrorEventHandler);
            loader.contentLoaderInfo.addEventListener(Event.UNLOAD,this.contentLoaderInfo_unloadEventHandler);
            if(false && url.indexOf(".jpg") == -1 && LoaderUtil.normalizeURL(Application.application.systemManager.loaderInfo).indexOf("debug=true") > -1)
            {
               url += url.indexOf("?") > -1 ? "&debug=true" : "?debug=true";
            }
            if(!(url.indexOf(":") > -1 || url.indexOf("/") == 0 || url.indexOf("\\") == 0))
            {
               if(false)
               {
                  rootURL = "null";
               }
               else if(root)
               {
                  rootURL = LoaderUtil.normalizeURL(root.loaderInfo);
               }
               else if(systemManager)
               {
                  rootURL = LoaderUtil.normalizeURL(DisplayObject(systemManager).loaderInfo);
               }
               if(rootURL)
               {
                  url = LoaderUtil.createAbsoluteURL(rootURL,url);
               }
            }
            this.requestedURL = new URLRequest(url);
            lc = this.loaderContext;
            if(!lc)
            {
               lc = new LoaderContext();
               this._loaderContext = lc;
               if(this.loadForCompatibility)
               {
                  currentDomain = ApplicationDomain.currentDomain.parentDomain;
                  topmostDomain = null;
                  while(currentDomain)
                  {
                     topmostDomain = currentDomain;
                     currentDomain = currentDomain.parentDomain;
                  }
                  lc.applicationDomain = new ApplicationDomain(topmostDomain);
               }
               if(this.trustContent)
               {
                  lc.securityDomain = SecurityDomain.currentDomain;
               }
               else if(!this.loadForCompatibility)
               {
                  this.attemptingChildAppDomain = true;
                  lc.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
               }
            }
            loader.load(this.requestedURL,lc);
         }
         invalidateDisplayList();
      }
      
      public function get contentWidth() : Number
      {
         return !!this.mx_internal::contentHolder ? this.mx_internal::contentHolder.width : NaN;
      }
      
      [Bindable("scaleContentChanged")]
      public function get scaleContent() : Boolean
      {
         return this._scaleContent;
      }
      
      public function get childAllowsParent() : Boolean
      {
         if(!this.isContentLoaded)
         {
            return false;
         }
         try
         {
            if(this.mx_internal::contentHolder is Loader)
            {
               return Loader(this.mx_internal::contentHolder).contentLoaderInfo.childAllowsParent;
            }
         }
         catch(error:Error)
         {
            return false;
         }
         return true;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.contentChanged)
         {
            this.contentChanged = false;
            if(this._autoLoad)
            {
               this.load(this._source);
            }
         }
      }
      
      private function contentLoaderInfo_securityErrorEventHandler(param1:SecurityErrorEvent) : void
      {
         var _loc2_:LoaderContext = null;
         if(this.attemptingChildAppDomain)
         {
            this.attemptingChildAppDomain = false;
            _loc2_ = new LoaderContext();
            this._loaderContext = _loc2_;
            callLater(this.load);
            return;
         }
         dispatchEvent(param1);
         if(this.mx_internal::contentHolder is Loader)
         {
            this.removeInitSystemManagerCompleteListener(Loader(this.mx_internal::contentHolder).contentLoaderInfo);
         }
      }
      
      private function sizeShield() : void
      {
         if(Boolean(this.mouseShield) && Boolean(this.mouseShield.parent))
         {
            this.mouseShield.width = unscaledWidth;
            this.mouseShield.height = unscaledHeight;
         }
      }
      
      private function addInitSystemManagerCompleteListener(param1:LoaderInfo) : void
      {
         var _loc2_:EventDispatcher = null;
         if(param1.contentType == "application/x-shockwave-flash")
         {
            _loc2_ = param1.sharedEvents;
            _loc2_.addEventListener(SWFBridgeEvent.BRIDGE_NEW_APPLICATION,this.initSystemManagerCompleteEventHandler);
         }
      }
      
      private function invalidateRequestHandler(param1:Event) : void
      {
         if(param1 is SWFBridgeRequest)
         {
            return;
         }
         var _loc2_:SWFBridgeRequest = SWFBridgeRequest.marshal(param1);
         var _loc3_:uint = uint(_loc2_.data);
         if(_loc3_ & 0)
         {
            invalidateProperties();
         }
         if(_loc3_ & 0)
         {
            invalidateSize();
         }
         if(_loc3_ & 0)
         {
            invalidateDisplayList();
         }
         this.dispatchInvalidateRequest((_loc3_ & 0) != 0,(_loc3_ & 0) != 0,(_loc3_ & 0) != 0);
      }
      
      private function getContentSize() : Point
      {
         var _loc3_:IEventDispatcher = null;
         var _loc4_:SWFBridgeRequest = null;
         var _loc1_:Point = new Point();
         if(!this.mx_internal::contentHolder is Loader)
         {
            return _loc1_;
         }
         var _loc2_:Loader = Loader(this.mx_internal::contentHolder);
         if(_loc2_.contentLoaderInfo.childAllowsParent)
         {
            _loc1_.x = _loc2_.content.width;
            _loc1_.y = _loc2_.content.height;
         }
         else
         {
            _loc3_ = this.swfBridge;
            if(_loc3_)
            {
               _loc4_ = new SWFBridgeRequest(SWFBridgeRequest.GET_SIZE_REQUEST);
               _loc3_.dispatchEvent(_loc4_);
               _loc1_.x = _loc4_.data.width;
               _loc1_.y = _loc4_.data.height;
            }
         }
         if(_loc1_.x == 0)
         {
            _loc1_.x = _loc2_.contentLoaderInfo.width;
         }
         if(_loc1_.y == 0)
         {
            _loc1_.y = _loc2_.contentLoaderInfo.height;
         }
         return _loc1_;
      }
      
      public function load(param1:Object = null) : void
      {
         var imageData:Bitmap = null;
         var request:SWFBridgeEvent = null;
         var url:Object = param1;
         if(url)
         {
            this._source = url;
         }
         if(this.mx_internal::contentHolder)
         {
            if(this.isContentLoaded)
            {
               if(this.mx_internal::contentHolder is Loader)
               {
                  try
                  {
                     if(Loader(this.mx_internal::contentHolder).content is Bitmap)
                     {
                        imageData = Bitmap(Loader(this.mx_internal::contentHolder).content);
                        if(imageData.bitmapData)
                        {
                           imageData.bitmapData = null;
                        }
                     }
                  }
                  catch(error:Error)
                  {
                  }
                  if(this._swfBridge)
                  {
                     request = new SWFBridgeEvent(SWFBridgeEvent.BRIDGE_APPLICATION_UNLOADING,false,false,this._swfBridge);
                     this._swfBridge.dispatchEvent(request);
                  }
                  if(this.useUnloadAndStop && "unloadAndStop" in this.mx_internal::contentHolder)
                  {
                     this.mx_internal::contentHolder["unloadAndStop"](this.unloadAndStopGC);
                  }
                  else
                  {
                     Loader(this.mx_internal::contentHolder).unload();
                  }
                  if(!this.explicitLoaderContext)
                  {
                     this._loaderContext = null;
                  }
               }
               else if(this.mx_internal::contentHolder is Bitmap)
               {
                  imageData = Bitmap(this.mx_internal::contentHolder);
                  if(imageData.bitmapData)
                  {
                     imageData.bitmapData = null;
                  }
               }
            }
            else if(this.mx_internal::contentHolder is Loader)
            {
               try
               {
                  Loader(this.mx_internal::contentHolder).close();
               }
               catch(error:Error)
               {
               }
            }
            try
            {
               if(this.mx_internal::contentHolder.parent == this)
               {
                  removeChild(this.mx_internal::contentHolder);
               }
            }
            catch(error:Error)
            {
               try
               {
                  removeChild(mx_internal::contentHolder);
               }
               catch(error1:Error)
               {
               }
            }
            this.mx_internal::contentHolder = null;
         }
         this.isContentLoaded = false;
         this.brokenImage = false;
         this.useUnloadAndStop = false;
         if(!this._source || this._source == "")
         {
            return;
         }
         this.loadContent(this._source);
      }
      
      public function get parentAllowsChild() : Boolean
      {
         if(!this.isContentLoaded)
         {
            return false;
         }
         try
         {
            if(this.mx_internal::contentHolder is Loader)
            {
               return Loader(this.mx_internal::contentHolder).contentLoaderInfo.parentAllowsChild;
            }
         }
         catch(error:Error)
         {
            return false;
         }
         return true;
      }
      
      private function contentLoaded() : void
      {
         var loaderInfo:LoaderInfo = null;
         this.isContentLoaded = true;
         if(this.mx_internal::contentHolder is Loader)
         {
            loaderInfo = Loader(this.mx_internal::contentHolder).contentLoaderInfo;
         }
         this.resizableContent = false;
         if(loaderInfo)
         {
            if(loaderInfo.contentType == "application/x-shockwave-flash")
            {
               this.resizableContent = true;
            }
            if(this.resizableContent)
            {
               try
               {
                  if(Loader(this.mx_internal::contentHolder).content is IFlexDisplayObject)
                  {
                     this.flexContent = true;
                  }
                  else
                  {
                     this.flexContent = this.swfBridge != null;
                  }
               }
               catch(e:Error)
               {
                  flexContent = swfBridge != null;
               }
            }
         }
         try
         {
            if(tabChildren && this.mx_internal::contentHolder is Loader && (loaderInfo.contentType == "application/x-shockwave-flash" || Loader(this.mx_internal::contentHolder).content is DisplayObjectContainer))
            {
               Loader(this.mx_internal::contentHolder).tabChildren = true;
               DisplayObjectContainer(Loader(this.mx_internal::contentHolder).content).tabChildren = true;
            }
         }
         catch(e:Error)
         {
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function contentLoaderInfo_ioErrorEventHandler(param1:IOErrorEvent) : void
      {
         this.source = getStyle("brokenImageSkin");
         this.load();
         this.contentChanged = false;
         this.brokenImage = true;
         if(hasEventListener(param1.type))
         {
            dispatchEvent(param1);
         }
         if(this.mx_internal::contentHolder is Loader)
         {
            this.removeInitSystemManagerCompleteListener(Loader(this.mx_internal::contentHolder).contentLoaderInfo);
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Class = null;
         super.updateDisplayList(param1,param2);
         if(this.contentChanged)
         {
            this.contentChanged = false;
            if(this._autoLoad)
            {
               this.load(this._source);
            }
         }
         if(this.isContentLoaded)
         {
            if(this._scaleContent && !this.brokenImage)
            {
               this.doScaleContent();
            }
            else
            {
               this.doScaleLoader();
            }
            this.scaleContentChanged = false;
            if(this.smoothBitmapContentChanged)
            {
               this.doSmoothBitmapContent();
               this.smoothBitmapContentChanged = false;
            }
         }
         if(this.brokenImage && !this.brokenImageBorder)
         {
            _loc3_ = getStyle("brokenImageBorderSkin");
            if(_loc3_)
            {
               this.brokenImageBorder = IFlexDisplayObject(new _loc3_());
               if(this.brokenImageBorder is ISimpleStyleClient)
               {
                  ISimpleStyleClient(this.brokenImageBorder).styleName = this;
               }
               addChild(DisplayObject(this.brokenImageBorder));
            }
         }
         else if(!this.brokenImage && Boolean(this.brokenImageBorder))
         {
            removeChild(DisplayObject(this.brokenImageBorder));
            this.brokenImageBorder = null;
         }
         if(this.brokenImageBorder)
         {
            this.brokenImageBorder.setActualSize(param1,param2);
         }
         this.sizeShield();
      }
      
      private function mouseShieldHandler(param1:Event) : void
      {
         if(param1["name"] != "mouseShield")
         {
            return;
         }
         if(!this.isContentLoaded || this.parentAllowsChild)
         {
            return;
         }
         if(param1["value"])
         {
            if(!this.mouseShield)
            {
               this.mouseShield = new Sprite();
               this.mouseShield.graphics.beginFill(0,0);
               this.mouseShield.graphics.drawRect(0,0,100,100);
               this.mouseShield.graphics.endFill();
            }
            if(!this.mouseShield.parent)
            {
               addChild(this.mouseShield);
            }
            this.sizeShield();
         }
         else if(Boolean(this.mouseShield) && Boolean(this.mouseShield.parent))
         {
            removeChild(this.mouseShield);
         }
      }
   }
}
