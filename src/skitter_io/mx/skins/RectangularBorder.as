package mx.skins
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Shape;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getDefinitionByName;
   import mx.core.EdgeMetrics;
   import mx.core.FlexLoader;
   import mx.core.FlexShape;
   import mx.core.IChildList;
   import mx.core.IContainer;
   import mx.core.IRawChildrenContainer;
   import mx.core.IRectangularBorder;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.styles.ISimpleStyleClient;
   
   public class RectangularBorder extends Border implements IRectangularBorder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var backgroundImage:DisplayObject;
      
      private var backgroundImageHeight:Number;
      
      private var _backgroundImageBounds:Rectangle;
      
      private var backgroundImageStyle:Object;
      
      private var backgroundImageWidth:Number;
      
      private var resourceManager:IResourceManager;
      
      public function RectangularBorder()
      {
         resourceManager = ResourceManager.getInstance();
         super();
         addEventListener(Event.REMOVED,removedHandler);
      }
      
      public function layoutBackgroundImage() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Graphics = null;
         var _loc1_:DisplayObject = parent;
         var _loc2_:EdgeMetrics = _loc1_ is IContainer ? IContainer(_loc1_).viewMetrics : borderMetrics;
         var _loc3_:* = getStyle("backgroundAttachment") != "fixed";
         if(_backgroundImageBounds)
         {
            _loc4_ = 0;
            _loc5_ = 0;
         }
         else
         {
            _loc4_ = width - _loc2_.left - _loc2_.right;
            _loc5_ = height - _loc2_.top - _loc2_.bottom;
         }
         var _loc6_:Number = getBackgroundSize();
         if(isNaN(_loc6_))
         {
            _loc7_ = 1;
            _loc8_ = 1;
         }
         else
         {
            _loc7_ = (_loc14_ = _loc6_ * 0.01) * _loc4_ / backgroundImageWidth;
            _loc8_ = _loc14_ * _loc5_ / backgroundImageHeight;
         }
         backgroundImage.scaleX = _loc7_;
         backgroundImage.scaleY = _loc8_;
         var _loc9_:Number = Math.round(0.5 * (_loc4_ - backgroundImageWidth * _loc7_));
         var _loc10_:Number = Math.round(0.5 * (_loc5_ - backgroundImageHeight * _loc8_));
         backgroundImage.x = _loc2_.left;
         backgroundImage.y = _loc2_.top;
         var _loc11_:Shape;
         (_loc11_ = Shape(backgroundImage.mask)).x = _loc2_.left;
         _loc11_.y = _loc2_.top;
         if(_loc3_ && _loc1_ is IContainer)
         {
            _loc9_ -= IContainer(_loc1_).horizontalScrollPosition;
            _loc10_ -= IContainer(_loc1_).verticalScrollPosition;
         }
         backgroundImage.alpha = getStyle("backgroundAlpha");
         backgroundImage.x += _loc9_;
         backgroundImage.y += _loc10_;
         var _loc12_:Number = width - _loc2_.left - _loc2_.right;
         var _loc13_:Number = height - _loc2_.top - _loc2_.bottom;
         if(_loc11_.width != _loc12_ || _loc11_.height != _loc13_)
         {
            (_loc15_ = _loc11_.graphics).clear();
            _loc15_.beginFill(16777215);
            _loc15_.drawRect(0,0,_loc12_,_loc13_);
            _loc15_.endFill();
         }
      }
      
      public function set backgroundImageBounds(param1:Rectangle) : void
      {
         if(Boolean(_backgroundImageBounds) && Boolean(param1) && _backgroundImageBounds.equals(param1))
         {
            return;
         }
         _backgroundImageBounds = param1;
         invalidateDisplayList();
      }
      
      private function getBackgroundSize() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:Number = NaN;
         var _loc2_:Object = getStyle("backgroundSize");
         if(Boolean(_loc2_) && _loc2_ is String)
         {
            _loc3_ = int(_loc2_.indexOf("%"));
            if(_loc3_ != -1)
            {
               _loc1_ = Number(_loc2_.substr(0,_loc3_));
            }
         }
         return _loc1_;
      }
      
      private function removedHandler(param1:Event) : void
      {
         var _loc2_:IChildList = null;
         if(backgroundImage)
         {
            _loc2_ = parent is IRawChildrenContainer ? IRawChildrenContainer(parent).rawChildren : IChildList(parent);
            _loc2_.removeChild(backgroundImage.mask);
            _loc2_.removeChild(backgroundImage);
            backgroundImage = null;
         }
      }
      
      private function initBackgroundImage(param1:DisplayObject) : void
      {
         backgroundImage = param1;
         if(param1 is Loader)
         {
            backgroundImageWidth = Loader(param1).contentLoaderInfo.width;
            backgroundImageHeight = Loader(param1).contentLoaderInfo.height;
         }
         else
         {
            backgroundImageWidth = backgroundImage.width;
            backgroundImageHeight = backgroundImage.height;
            if(param1 is ISimpleStyleClient)
            {
               ISimpleStyleClient(param1).styleName = styleName;
            }
         }
         var _loc2_:IChildList = parent is IRawChildrenContainer ? IRawChildrenContainer(parent).rawChildren : IChildList(parent);
         var _loc3_:Shape = new FlexShape();
         _loc3_.name = "backgroundMask";
         _loc3_.x = 0;
         _loc3_.y = 0;
         _loc2_.addChild(_loc3_);
         var _loc4_:int = int(_loc2_.getChildIndex(this));
         _loc2_.addChildAt(backgroundImage,_loc4_ + 1);
         backgroundImage.mask = _loc3_;
      }
      
      public function get backgroundImageBounds() : Rectangle
      {
         return _backgroundImageBounds;
      }
      
      public function get hasBackgroundImage() : Boolean
      {
         return backgroundImage != null;
      }
      
      private function completeEventHandler(param1:Event) : void
      {
         if(!parent)
         {
            return;
         }
         var _loc2_:DisplayObject = DisplayObject(LoaderInfo(param1.target).loader);
         initBackgroundImage(_loc2_);
         layoutBackgroundImage();
         dispatchEvent(param1.clone());
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var newStyle:Object;
         var cls:Class = null;
         var newStyleObj:DisplayObject = null;
         var loader:Loader = null;
         var loaderContext:LoaderContext = null;
         var message:String = null;
         var unscaledWidth:Number = param1;
         var unscaledHeight:Number = param2;
         if(!parent)
         {
            return;
         }
         newStyle = getStyle("backgroundImage");
         if(newStyle != backgroundImageStyle)
         {
            removedHandler(null);
            backgroundImageStyle = newStyle;
            if(Boolean(newStyle) && Boolean(newStyle as Class))
            {
               cls = Class(newStyle);
               initBackgroundImage(new cls());
            }
            else if(Boolean(newStyle) && newStyle is String)
            {
               try
               {
                  cls = Class(getDefinitionByName(String(newStyle)));
               }
               catch(e:Error)
               {
               }
               if(cls)
               {
                  newStyleObj = new cls();
                  initBackgroundImage(newStyleObj);
               }
               else
               {
                  loader = new FlexLoader();
                  loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeEventHandler);
                  loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,errorEventHandler);
                  loader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR,errorEventHandler);
                  loaderContext = new LoaderContext();
                  loaderContext.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
                  loader.load(new URLRequest(String(newStyle)),loaderContext);
               }
            }
            else if(newStyle)
            {
               message = String(resourceManager.getString("skins","notLoaded",[newStyle]));
               throw new Error(message);
            }
         }
         if(backgroundImage)
         {
            layoutBackgroundImage();
         }
      }
      
      private function errorEventHandler(param1:Event) : void
      {
      }
   }
}
