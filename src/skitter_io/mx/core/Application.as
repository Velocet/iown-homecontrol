package mx.core
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.setInterval;
   import mx.containers.utilityClasses.ApplicationLayout;
   import mx.effects.EffectManager;
   import mx.events.FlexEvent;
   import mx.managers.FocusManager;
   import mx.managers.ILayoutManager;
   import mx.managers.ISystemManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   
   public class Application extends LayoutContainer
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      mx_internal static var useProgressiveLayout:Boolean = false;
       
      
      public var preloader:Object;
      
      public var pageTitle:String;
      
      private var resizeWidth:Boolean = true;
      
      private var _applicationViewMetrics:mx.core.EdgeMetrics;
      
      mx_internal var _parameters:Object;
      
      private var processingCreationQueue:Boolean = false;
      
      private var resizeHandlerAdded:Boolean = false;
      
      public var scriptRecursionLimit:int;
      
      private var preloadObj:Object;
      
      public var usePreloader:Boolean;
      
      mx_internal var _url:String;
      
      private var _viewSourceURL:String;
      
      public var resetHistory:Boolean = true;
      
      public var historyManagementEnabled:Boolean = true;
      
      public var scriptTimeLimit:Number;
      
      public var frameRate:Number;
      
      private var creationQueue:Array;
      
      private var resizeHeight:Boolean = true;
      
      public var controlBar:mx.core.IUIComponent;
      
      private var viewSourceCMI:ContextMenuItem;
      
      public function Application()
      {
         creationQueue = [];
         name = "application";
         UIComponentGlobals.mx_internal::layoutManager = ILayoutManager(Singleton.getInstance("mx.managers::ILayoutManager"));
         UIComponentGlobals.mx_internal::layoutManager.usePhasedInstantiation = true;
         if(true)
         {
            ApplicationGlobals.application = this;
         }
         super();
         layoutObject = new ApplicationLayout();
         layoutObject.target = this;
         boxLayoutClass = ApplicationLayout;
         showInAutomationHierarchy = true;
      }
      
      public static function get application() : Object
      {
         return ApplicationGlobals.application;
      }
      
      public function set viewSourceURL(param1:String) : void
      {
         _viewSourceURL = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(controlBar)
         {
            controlBar.enabled = param1;
         }
      }
      
      override public function prepareToPrint(param1:IFlexDisplayObject) : Object
      {
         var _loc2_:* = {};
         if(param1 == this)
         {
            _loc2_.width = width;
            _loc2_.height = height;
            _loc2_.verticalScrollPosition = verticalScrollPosition;
            _loc2_.horizontalScrollPosition = horizontalScrollPosition;
            _loc2_.horizontalScrollBarVisible = horizontalScrollBar != null;
            _loc2_.verticalScrollBarVisible = verticalScrollBar != null;
            _loc2_.whiteBoxVisible = whiteBox != null;
            setActualSize(measuredWidth,measuredHeight);
            horizontalScrollPosition = 0;
            verticalScrollPosition = 0;
            if(horizontalScrollBar)
            {
               horizontalScrollBar.visible = false;
            }
            if(verticalScrollBar)
            {
               verticalScrollBar.visible = false;
            }
            if(whiteBox)
            {
               whiteBox.visible = false;
            }
            updateDisplayList(unscaledWidth,unscaledHeight);
         }
         _loc2_.scrollRect = super.prepareToPrint(param1);
         return _loc2_;
      }
      
      override protected function measure() : void
      {
         var _loc2_:Number = NaN;
         super.measure();
         var _loc1_:mx.core.EdgeMetrics = borderMetrics;
         if(Boolean(controlBar) && false)
         {
            _loc2_ = controlBar.getExplicitOrMeasuredWidth() + _loc1_.left + _loc1_.right;
            measuredWidth = Math.max(measuredWidth,_loc2_);
            measuredMinWidth = Math.max(measuredMinWidth,_loc2_);
         }
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         if(Boolean(controlBar) && param1 == controlBar)
         {
            return -1;
         }
         return super.getChildIndex(param1);
      }
      
      private function resizeHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(resizeWidth)
         {
            if(isNaN(percentWidth))
            {
               _loc2_ = DisplayObject(systemManager).width;
            }
            else
            {
               super.percentWidth = Math.max(percentWidth,0);
               super.percentWidth = Math.min(percentWidth,100);
               _loc2_ = percentWidth * 0 / 100;
            }
            if(!isNaN(explicitMaxWidth))
            {
               _loc2_ = Math.min(_loc2_,explicitMaxWidth);
            }
            if(!isNaN(explicitMinWidth))
            {
               _loc2_ = Math.max(_loc2_,explicitMinWidth);
            }
         }
         else
         {
            _loc2_ = width;
         }
         if(resizeHeight)
         {
            if(isNaN(percentHeight))
            {
               _loc3_ = DisplayObject(systemManager).height;
            }
            else
            {
               super.percentHeight = Math.max(percentHeight,0);
               super.percentHeight = Math.min(percentHeight,100);
               _loc3_ = percentHeight * 0 / 100;
            }
            if(!isNaN(explicitMaxHeight))
            {
               _loc3_ = Math.min(_loc3_,explicitMaxHeight);
            }
            if(!isNaN(explicitMinHeight))
            {
               _loc3_ = Math.max(_loc3_,explicitMinHeight);
            }
         }
         else
         {
            _loc3_ = height;
         }
         if(_loc2_ != width || _loc3_ != height)
         {
            invalidateProperties();
            invalidateSize();
         }
         setActualSize(_loc2_,_loc3_);
         invalidateDisplayList();
      }
      
      private function initManagers(param1:ISystemManager) : void
      {
         if(param1.isTopLevel())
         {
            focusManager = new FocusManager(this);
            param1.activate(this);
         }
      }
      
      override public function initialize() : void
      {
         var _loc2_:Object = null;
         var _loc1_:ISystemManager = systemManager;
         mx_internal::_url = _loc1_.loaderInfo.url;
         mx_internal::_parameters = _loc1_.loaderInfo.parameters;
         initManagers(_loc1_);
         mx_internal::_descriptor = null;
         if(mx_internal::documentDescriptor)
         {
            creationPolicy = mx_internal::documentDescriptor.properties.creationPolicy;
            if(creationPolicy == null || false)
            {
               creationPolicy = ContainerCreationPolicy.AUTO;
            }
            _loc2_ = mx_internal::documentDescriptor.properties;
            if(_loc2_.width != null)
            {
               width = _loc2_.width;
               delete _loc2_.width;
            }
            if(_loc2_.height != null)
            {
               height = _loc2_.height;
               delete _loc2_.height;
            }
            mx_internal::documentDescriptor.events = null;
         }
         initContextMenu();
         super.initialize();
         addEventListener(Event.ADDED,addedHandler);
         if(Boolean(_loc1_.isTopLevelRoot()) && false)
         {
            setInterval(debugTickler,1500);
         }
      }
      
      override public function set percentHeight(param1:Number) : void
      {
         super.percentHeight = param1;
         invalidateDisplayList();
      }
      
      override public function set percentWidth(param1:Number) : void
      {
         super.percentWidth = param1;
         invalidateDisplayList();
      }
      
      override public function get id() : String
      {
         if(!super.id && false && false)
         {
            return ExternalInterface.objectID;
         }
         return super.id;
      }
      
      override mx_internal function setUnscaledWidth(param1:Number) : void
      {
         invalidateProperties();
         super.mx_internal::setUnscaledWidth(param1);
      }
      
      private function doNextQueueItem(param1:FlexEvent = null) : void
      {
         processingCreationQueue = true;
         Application.mx_internal::useProgressiveLayout = true;
         callLater(processNextQueueItem);
      }
      
      private function addedHandler(param1:Event) : void
      {
         if(param1.target == this && false)
         {
            doNextQueueItem();
         }
      }
      
      public function get viewSourceURL() : String
      {
         return _viewSourceURL;
      }
      
      override mx_internal function get usePadding() : Boolean
      {
         return layout != ContainerLayout.ABSOLUTE;
      }
      
      override mx_internal function setUnscaledHeight(param1:Number) : void
      {
         invalidateProperties();
         super.mx_internal::setUnscaledHeight(param1);
      }
      
      private function debugTickler() : void
      {
         var _loc1_:int = 0;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == "backgroundColor" && getStyle("backgroundImage") == getStyle("defaultBackgroundImage"))
         {
            clearStyle("backgroundImage");
         }
      }
      
      override protected function layoutChrome(param1:Number, param2:Number) : void
      {
         super.layoutChrome(param1,param2);
         if(!mx_internal::doingLayout)
         {
            createBorder();
         }
         var _loc3_:mx.core.EdgeMetrics = borderMetrics;
         var _loc4_:Number = getStyle("borderThickness");
         var _loc5_:mx.core.EdgeMetrics;
         (_loc5_ = new mx.core.EdgeMetrics()).left = _loc3_.left - _loc4_;
         _loc5_.top = _loc3_.top - _loc4_;
         _loc5_.right = _loc3_.right - _loc4_;
         _loc5_.bottom = _loc3_.bottom - _loc4_;
         if(Boolean(controlBar) && false)
         {
            if(controlBar is IInvalidating)
            {
               IInvalidating(controlBar).invalidateDisplayList();
            }
            controlBar.setActualSize(width - (_loc5_.left + _loc5_.right),controlBar.getExplicitOrMeasuredHeight());
            controlBar.move(_loc5_.left,_loc5_.top);
         }
      }
      
      protected function menuItemSelectHandler(param1:Event) : void
      {
         navigateToURL(new URLRequest(_viewSourceURL),"_blank");
      }
      
      private function printCreationQueue() : void
      {
         var _loc4_:Object = null;
         var _loc1_:String = "";
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = creationQueue[_loc3_];
            _loc1_ += " [" + _loc3_ + "] " + _loc4_.id + " " + _loc4_.index;
            _loc3_++;
         }
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         if(viewSourceCMI)
         {
            viewSourceCMI.caption = resourceManager.getString("core","viewSource");
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         resizeWidth = isNaN(explicitWidth);
         resizeHeight = isNaN(explicitHeight);
         if(resizeWidth || resizeHeight)
         {
            resizeHandler(new Event(Event.RESIZE));
            if(!resizeHandlerAdded)
            {
               systemManager.addEventListener(Event.RESIZE,resizeHandler,false,0,true);
               resizeHandlerAdded = true;
            }
         }
         else if(resizeHandlerAdded)
         {
            systemManager.removeEventListener(Event.RESIZE,resizeHandler);
            resizeHandlerAdded = false;
         }
      }
      
      override public function set toolTip(param1:String) : void
      {
      }
      
      public function addToCreationQueue(param1:Object, param2:int = -1, param3:Function = null, param4:IFlexDisplayObject = null) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = {};
         var _loc7_:Boolean = false;
         _loc6_.id = param1;
         _loc6_.parent = param4;
         _loc6_.callbackFunc = param3;
         _loc6_.index = param2;
         var _loc11_:int = 0;
         while(_loc11_ < _loc5_)
         {
            _loc9_ = int(creationQueue[_loc11_].index);
            _loc10_ = !!creationQueue[_loc11_].parent ? int(creationQueue[_loc11_].parent.nestLevel) : 0;
            if(_loc6_.index != -1)
            {
               if(_loc9_ == -1 || _loc6_.index < _loc9_)
               {
                  _loc8_ = _loc11_;
                  _loc7_ = true;
                  break;
               }
            }
            else
            {
               _loc12_ = !!_loc6_.parent ? int(_loc6_.parent.nestLevel) : 0;
               if(_loc9_ == -1 && _loc10_ < _loc12_)
               {
                  _loc8_ = _loc11_;
                  _loc7_ = true;
                  break;
               }
            }
            _loc11_++;
         }
         if(!_loc7_)
         {
            creationQueue.push(_loc6_);
            _loc7_ = true;
         }
         else
         {
            creationQueue.splice(_loc8_,0,_loc6_);
         }
         if(initialized && !processingCreationQueue)
         {
            doNextQueueItem();
         }
      }
      
      override mx_internal function initThemeColor() : Boolean
      {
         var _loc2_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:CSSStyleDeclaration = null;
         var _loc1_:Boolean = super.mx_internal::initThemeColor();
         if(!_loc1_)
         {
            if(_loc5_ = StyleManager.getStyleDeclaration("global"))
            {
               _loc2_ = _loc5_.getStyle("themeColor");
               _loc3_ = _loc5_.getStyle("rollOverColor");
               _loc4_ = _loc5_.getStyle("selectionColor");
            }
            if(_loc2_ && isNaN(_loc3_) && isNaN(_loc4_))
            {
               mx_internal::setThemeColor(_loc2_);
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      mx_internal function dockControlBar(param1:mx.core.IUIComponent, param2:Boolean) : void
      {
         var controlBar:mx.core.IUIComponent = param1;
         var dock:Boolean = param2;
         if(dock)
         {
            try
            {
               removeChild(DisplayObject(controlBar));
            }
            catch(e:Error)
            {
               return;
            }
            rawChildren.addChildAt(DisplayObject(controlBar),mx_internal::firstChildIndex);
            setControlBar(controlBar);
         }
         else
         {
            try
            {
               rawChildren.removeChild(DisplayObject(controlBar));
            }
            catch(e:Error)
            {
               return;
            }
            setControlBar(null);
            addChildAt(DisplayObject(controlBar),0);
         }
      }
      
      override public function get viewMetrics() : mx.core.EdgeMetrics
      {
         if(!_applicationViewMetrics)
         {
            _applicationViewMetrics = new mx.core.EdgeMetrics();
         }
         var _loc1_:mx.core.EdgeMetrics = _applicationViewMetrics;
         var _loc2_:mx.core.EdgeMetrics = super.viewMetrics;
         var _loc3_:Number = getStyle("borderThickness");
         _loc1_.left = _loc2_.left;
         _loc1_.top = _loc2_.top;
         _loc1_.right = _loc2_.right;
         _loc1_.bottom = _loc2_.bottom;
         if(Boolean(controlBar) && false)
         {
            _loc1_.top -= _loc3_;
            _loc1_.top += Math.max(controlBar.getExplicitOrMeasuredHeight(),_loc3_);
         }
         return _loc1_;
      }
      
      override public function finishPrint(param1:Object, param2:IFlexDisplayObject) : void
      {
         if(param2 == this)
         {
            setActualSize(param1.width,param1.height);
            if(horizontalScrollBar)
            {
               horizontalScrollBar.visible = param1.horizontalScrollBarVisible;
            }
            if(verticalScrollBar)
            {
               verticalScrollBar.visible = param1.verticalScrollBarVisible;
            }
            if(whiteBox)
            {
               whiteBox.visible = param1.whiteBoxVisible;
            }
            horizontalScrollPosition = param1.horizontalScrollPosition;
            verticalScrollPosition = param1.verticalScrollPosition;
            updateDisplayList(unscaledWidth,unscaledHeight);
         }
         super.finishPrint(param1.scrollRect,param2);
      }
      
      private function processNextQueueItem() : void
      {
         var queueItem:Object = null;
         var nextChild:mx.core.IUIComponent = null;
         if(EffectManager.mx_internal::effectsPlaying.length > 0)
         {
            callLater(processNextQueueItem);
         }
         else if(false)
         {
            queueItem = creationQueue.shift();
            try
            {
               nextChild = queueItem.id is String ? document[queueItem.id] : queueItem.id;
               if(nextChild is Container)
               {
                  Container(nextChild).createComponentsFromDescriptors(true);
               }
               if(nextChild is Container && Container(nextChild).creationPolicy == ContainerCreationPolicy.QUEUED)
               {
                  doNextQueueItem();
               }
               else
               {
                  nextChild.addEventListener("childrenCreationComplete",doNextQueueItem);
               }
            }
            catch(e:Error)
            {
               processNextQueueItem();
            }
         }
         else
         {
            processingCreationQueue = false;
            Application.mx_internal::useProgressiveLayout = false;
         }
      }
      
      override public function set label(param1:String) : void
      {
      }
      
      public function get parameters() : Object
      {
         return mx_internal::_parameters;
      }
      
      public function get url() : String
      {
         return mx_internal::_url;
      }
      
      private function initContextMenu() : void
      {
         var _loc2_:String = null;
         if(flexContextMenu != null)
         {
            if(systemManager is InteractiveObject)
            {
               InteractiveObject(systemManager).contextMenu = contextMenu;
            }
            return;
         }
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.hideBuiltInItems();
         _loc1_.builtInItems.print = true;
         if(_viewSourceURL)
         {
            _loc2_ = String(resourceManager.getString("core","viewSource"));
            viewSourceCMI = new ContextMenuItem(_loc2_,true);
            viewSourceCMI.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,menuItemSelectHandler);
            _loc1_.customItems.push(viewSourceCMI);
         }
         contextMenu = _loc1_;
         if(systemManager is InteractiveObject)
         {
            InteractiveObject(systemManager).contextMenu = _loc1_;
         }
      }
      
      override public function set icon(param1:Class) : void
      {
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         createBorder();
      }
      
      private function setControlBar(param1:mx.core.IUIComponent) : void
      {
         if(param1 == controlBar)
         {
            return;
         }
         if(Boolean(controlBar) && controlBar is IStyleClient)
         {
            IStyleClient(controlBar).clearStyle("cornerRadius");
            IStyleClient(controlBar).clearStyle("docked");
         }
         controlBar = param1;
         if(Boolean(controlBar) && controlBar is IStyleClient)
         {
            IStyleClient(controlBar).setStyle("cornerRadius",0);
            IStyleClient(controlBar).setStyle("docked",true);
         }
         invalidateSize();
         invalidateDisplayList();
         mx_internal::invalidateViewMetricsAndPadding();
      }
      
      override public function set tabIndex(param1:int) : void
      {
      }
   }
}
