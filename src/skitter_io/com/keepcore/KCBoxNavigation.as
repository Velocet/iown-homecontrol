package com.keepcore
{
   import com.greensock.TweenNano;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.collections.ArrayCollection;
   import mx.collections.Sort;
   import mx.containers.Box;
   import mx.containers.BoxDirection;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.controls.listClasses.BaseListData;
   import mx.controls.listClasses.IDropInListItemRenderer;
   import mx.core.ClassFactory;
   import mx.core.Container;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponent;
   import mx.effects.Move;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.ResizeEvent;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class KCBoxNavigation extends Box
   {
      
      private static const leftIconDisabled:Class = KCBoxNavigation_leftIconDisabled;
      
      public static const LEFT_BUTTON_STYLENAME:String = "LeftButtonStyleName";
      
      private static const rightIconDisabled:Class = KCBoxNavigation_rightIconDisabled;
      
      private static const MAPCONTROL_BACKGROUND_COLOR_DEFAULT:uint = 26828;
      
      private static var classConstructed:Boolean = classConstruct();
      
      private static const leftIcon:Class = KCBoxNavigation_leftIcon;
      
      public static const HORIZONTAL:String = "horizontal";
      
      private static var _scrollDuration:Number = 0.2;
      
      private static const COMPONENT_NAME:String = "KCBoxNavigation";
      
      public static const RIGHT_BUTTON_STYLENAME:String = "RightButtonStyleName";
      
      private static const rightIcon:Class = KCBoxNavigation_rightIcon;
      
      public static const VERTICAL:String = "vertical";
       
      
      private var _previousButtonBarThickness:Number = 0;
      
      private var previousButtonPositionChanged:Boolean = false;
      
      private var _itemWidth:Number = 0;
      
      private var nextButton:LinkButton;
      
      private var previousButton:LinkButton;
      
      private var itemHandlerChanged:Boolean = false;
      
      private var previousButtonBarThicknessChanged:Boolean = false;
      
      private var showOnlyRequiredContainerChanged:Boolean = false;
      
      private var _selectedItem:Object = null;
      
      private var _itemVerticalGap:Number = 0;
      
      private var _itemHorizontalGap:Number = 0;
      
      private var sortCompareFunction:Function = null;
      
      private var itemSizeChanged:Boolean = false;
      
      private var _nextButtonBarThickness:Number = 0;
      
      private var scrollHasChanged:Boolean = false;
      
      private var _previousButtonPosition:Point = null;
      
      private var mainCanvas:Canvas;
      
      private var dataProviderChanged:Boolean = false;
      
      private var _nullItemRenderer:Class;
      
      private var previousButtonContainer:Box;
      
      private var nextButtonPositionChanged:Boolean = false;
      
      private var nextButtonBarThicknessChanged:Boolean = false;
      
      private var _previousButtonStyleName:String = "";
      
      private var _nextButtonStyleName:String = "";
      
      private var _dataProvider:ArrayCollection;
      
      private var _columnCount:Number = 7;
      
      private var _rowCount:Number = 2;
      
      private var moveEffect:Move;
      
      private var mainContainer:Box;
      
      private var currentlyScrolling:Boolean = false;
      
      private var _itemHeight:Number = 0;
      
      private var _boxDirection:String = "horizontal";
      
      private var _itemRenderer:Class;
      
      private var nullItemRendererChanged:Boolean = false;
      
      private var _showOnlyRequiredContainers:Boolean = true;
      
      private var itemRendererChanged:Boolean = false;
      
      private var _nextButtonPosition:Point = null;
      
      private var _autoScroll:Boolean = true;
      
      private var nextButtonContainer:Box;
      
      public function KCBoxNavigation()
      {
         mainContainer = new Box();
         mainCanvas = new Canvas();
         previousButtonContainer = new VBox();
         nextButtonContainer = new VBox();
         _itemRenderer = Label;
         _nullItemRenderer = Label;
         super();
         addEventListener(ResizeEvent.RESIZE,resizeEventHandler);
      }
      
      private static function classConstruct() : Boolean
      {
         var _loc1_:CSSStyleDeclaration = StyleManager.getStyleDeclaration(COMPONENT_NAME);
         return true;
      }
      
      private function manageContainerVisibility() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
         var _loc4_:HBox = null;
         var _loc5_:int = 0;
         if(dataProvider)
         {
            _loc1_ = 0;
            _loc2_ = mainContainer.getChildren();
            _loc3_ = false;
            if(boxDirection == HORIZONTAL)
            {
               _loc4_ = null;
               _loc5_ = 0;
               while(_loc5_ < rowCount)
               {
                  _loc4_ = _loc2_[_loc5_] as HBox;
                  _loc3_ = !_showOnlyRequiredContainers || _loc5_ == 0 || _loc5_ * columnCount < _loc1_;
                  _loc4_.visible = _loc3_;
                  _loc4_.includeInLayout = _loc3_;
                  _loc5_++;
               }
            }
            else
            {
               boxDirection == VERTICAL;
            }
         }
      }
      
      private function getColumnByItemIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         if(sortCompareFunction == null)
         {
            if(param1 >= maxItemDisplayable)
            {
               _loc2_ = columnCount + (param1 - rowCount * columnCount) / rowCount;
            }
            else
            {
               _loc2_ = param1 % columnCount;
            }
         }
         else
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private function previousButtonMouseOver(param1:MouseEvent) : void
      {
         previousButton.scaleX = previousButton.scaleY = 1.05;
      }
      
      public function set scrollDuration(param1:Number) : void
      {
         _scrollDuration = param1;
      }
      
      public function get itemHeight() : Number
      {
         return _itemHeight;
      }
      
      public function get nullItemRenderer() : Class
      {
         return _nullItemRenderer;
      }
      
      private function scrollNextHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:KCBoxNavigationEvent = null;
         if(!currentlyScrolling)
         {
            if(boxDirection == BoxDirection.HORIZONTAL)
            {
               _loc2_ = itemWidth + itemHorizontalGap;
               _loc3_ = 0 - 0;
               _loc4_ = 0 - _loc2_;
               if((_loc5_ = Math.max(_loc3_,_loc4_)) != mainContainer.x)
               {
                  currentlyScrolling = true;
                  TweenNano.to(mainContainer,_scrollDuration,{
                     "x":_loc5_,
                     "onComplete":scrollEffectEndHandler
                  });
                  (_loc6_ = new KCBoxNavigationEvent(KCBoxNavigationEvent.SCROLL_NEXT)).scrollOffset = _loc5_ - 0;
                  dispatchEvent(_loc6_);
               }
            }
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         previousButton = new LinkButton();
         previousButton.doubleClickEnabled = false;
         nextButton = new LinkButton();
         nextButton.doubleClickEnabled = false;
         nextButton.styleName = _nextButtonStyleName;
         previousButton.styleName = _previousButtonStyleName;
         previousButton.addEventListener(MouseEvent.MOUSE_OVER,previousButtonMouseOver);
         previousButton.addEventListener(MouseEvent.MOUSE_OUT,previousButtonMouseOut);
         nextButton.addEventListener(MouseEvent.MOUSE_OVER,nextButtonMouseOver);
         nextButton.addEventListener(MouseEvent.MOUSE_OUT,nextButtonMouseOut);
         previousButton.addEventListener(MouseEvent.CLICK,scrollPreviousHandler);
         nextButton.addEventListener(MouseEvent.CLICK,scrollNextHandler);
         setStyle("verticalAlign","middle");
         setStyle("horizontalAlign","center");
         mainCanvas.percentHeight = 100;
         mainCanvas.percentWidth = 100;
         mainContainer.percentWidth = 100;
         mainContainer.percentHeight = 100;
         mainCanvas.verticalScrollPolicy = ScrollPolicy.OFF;
         mainCanvas.horizontalScrollPolicy = ScrollPolicy.OFF;
         setStyle("verticalGap",getStyle("verticalGap"));
         setStyle("horizontalGap",getStyle("horizontalGap"));
         setStyle("paddingTop",getStyle("paddingTop"));
         setStyle("paddingRight",getStyle("paddingRight"));
         setStyle("paddingBottom",getStyle("paddingBottom"));
         setStyle("paddingLeft",getStyle("paddingLeft"));
         itemHorizontalGap = _itemHorizontalGap;
         itemVerticalGap = _itemVerticalGap;
         if(boxDirection == HORIZONTAL)
         {
            direction = BoxDirection.HORIZONTAL;
            mainContainer.direction = BoxDirection.VERTICAL;
         }
         else
         {
            direction = BoxDirection.VERTICAL;
            mainContainer.direction = BoxDirection.HORIZONTAL;
         }
         mainCanvas.addChild(mainContainer);
         mainContainer.addEventListener(ResizeEvent.RESIZE,resizeEventHandler);
         previousButtonContainer.setStyle("verticalAlign","middle");
         previousButtonContainer.setStyle("horizontalAlign","center");
         if(_previousButtonBarThickness > 0)
         {
            previousButtonBarThicknessChanged = true;
         }
         if(_nextButtonBarThickness > 0)
         {
            nextButtonBarThicknessChanged = true;
         }
         previousButtonContainer.addChild(previousButton);
         nextButtonContainer.setStyle("verticalAlign","middle");
         nextButtonContainer.setStyle("horizontalAlign","center");
         nextButtonContainer.addChild(nextButton);
         nextButtonPositionChanged = true;
         previousButtonPositionChanged = true;
         addChild(previousButtonContainer);
         addChild(mainCanvas);
         mainCanvas.clipContent = true;
         addChild(nextButtonContainer);
         prepareBoxes();
      }
      
      private function itemMouseClickHandler(param1:MouseEvent) : void
      {
         _selectedItem = (param1.currentTarget as _itemRenderer).data;
         var _loc2_:KCBoxNavigationEvent = new KCBoxNavigationEvent(KCBoxNavigationEvent.ITEM_CLICK);
         _loc2_.item = _selectedItem;
         _loc2_.itemPosition = new Point(param1.currentTarget.x,param1.currentTarget.y);
         _loc2_.uiTarget = param1.currentTarget;
         dispatchEvent(_loc2_);
      }
      
      private function resizeEventHandler(param1:ResizeEvent) : void
      {
         var _loc2_:Number = NaN;
         if(boxDirection == BoxDirection.HORIZONTAL)
         {
            _loc2_ = 0 - 0;
            if(mainContainer.x < _loc2_)
            {
               mainContainer.x = _loc2_;
            }
            scrollHasChanged = true;
            invalidateProperties();
         }
      }
      
      private function get maxItemDisplayable() : int
      {
         return columnCount * rowCount;
      }
      
      public function get showOnlyRequiredContainers() : Boolean
      {
         return _showOnlyRequiredContainers;
      }
      
      private function sizeItems() : void
      {
         var _loc2_:* = null;
         var _loc3_:Array = null;
         var _loc4_:* = null;
         var _loc1_:Array = mainContainer.getChildren();
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = _loc2_.getChildren();
            for each(_loc4_ in _loc3_)
            {
               _loc4_.width = itemWidth;
               _loc4_.height = itemHeight;
            }
         }
      }
      
      private function dataProviderCollectionChangeHandler(param1:CollectionEvent) : void
      {
         if(param1.kind == CollectionEventKind.ADD)
         {
            feedBoxes(param1.items);
            scrollHasChanged = true;
         }
         else if(param1.kind == CollectionEventKind.REPLACE)
         {
            replaceItems(param1.items,param1.location);
         }
         else if(param1.kind == CollectionEventKind.UPDATE)
         {
            updateItems(param1.items);
         }
         else
         {
            dataProviderChanged = true;
         }
         invalidateProperties();
      }
      
      public function set itemHeight(param1:Number) : void
      {
         _itemHeight = param1;
         itemSizeChanged = true;
         invalidateProperties();
      }
      
      public function get nextButtonBarThickness() : Number
      {
         return _nextButtonBarThickness;
      }
      
      private function removeItemHandlers() : void
      {
         var _loc2_:* = null;
         var _loc3_:Array = null;
         var _loc4_:* = null;
         var _loc1_:Array = getChildren();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is Container)
            {
               _loc3_ = (_loc2_ as Container).getChildren();
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_.hasEventListener(MouseEvent.CLICK))
                  {
                     _loc4_.removeEventListener(MouseEvent.CLICK,itemMouseClickHandler);
                  }
               }
            }
         }
      }
      
      public function set nullItemRenderer(param1:Class) : void
      {
         _nullItemRenderer = param1;
         nullItemRendererChanged = true;
         invalidateProperties();
      }
      
      public function get previousButtonBarThickness() : Number
      {
         return _previousButtonBarThickness;
      }
      
      private function scrollEffectEndHandler(param1:EffectEvent = null) : void
      {
         currentlyScrolling = false;
         scrollHasChanged = true;
         invalidateProperties();
      }
      
      public function get nextButtonPosition() : Point
      {
         return _nextButtonPosition;
      }
      
      public function get previousButtonPosition() : Point
      {
         return _previousButtonPosition;
      }
      
      public function get rowCount() : Number
      {
         return _rowCount;
      }
      
      public function get nextButtonStyleName() : String
      {
         return _nextButtonStyleName;
      }
      
      public function get columnCount() : Number
      {
         return _columnCount;
      }
      
      public function get selectedItem() : Object
      {
         return _selectedItem;
      }
      
      public function scrollToBegin() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:KCBoxNavigationEvent = null;
         if(!currentlyScrolling)
         {
            if(boxDirection == BoxDirection.HORIZONTAL)
            {
               _loc1_ = 0;
               if(_loc1_ != mainContainer.x)
               {
                  currentlyScrolling = true;
                  TweenNano.to(mainContainer,_scrollDuration,{
                     "x":_loc1_,
                     "onComplete":scrollEffectEndHandler
                  });
                  _loc2_ = new KCBoxNavigationEvent(KCBoxNavigationEvent.SCROLL_BEGIN);
                  _loc2_.scrollOffset = _loc1_ - 0;
                  dispatchEvent(_loc2_);
               }
            }
         }
      }
      
      public function get autoScroll() : Boolean
      {
         return _autoScroll;
      }
      
      private function replaceItems(param1:Array, param2:int) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:HBox = null;
         var _loc8_:* = undefined;
         var _loc9_:Class = null;
         var _loc10_:ClassFactory = null;
         var _loc11_:* = undefined;
         var _loc3_:Array = mainContainer.getChildren();
         for each(_loc4_ in param1)
         {
            _loc5_ = getRowByItemIndex(param2);
            _loc6_ = getColumnByItemIndex(param2);
            _loc8_ = (_loc7_ = _loc3_[_loc5_] as HBox).getChildAt(_loc6_);
            _loc9_ = !!_loc4_.newValue ? itemRenderer : nullItemRenderer;
            (_loc11_ = (_loc10_ = new ClassFactory(_loc9_)).newInstance()).data = _loc4_.newValue;
            _loc7_.addChild(_loc11_);
            _loc7_.removeChild(_loc8_);
            _loc7_.setChildIndex(_loc11_,_loc6_);
            if(_loc11_ is IDropInListItemRenderer)
            {
               (_loc11_ as IDropInListItemRenderer).listData = new BaseListData("","",this,_loc5_,_loc7_.getChildren().length);
            }
            if(itemWidth > 0)
            {
               _loc11_.width = itemWidth;
            }
            else
            {
               _itemWidth = _loc11_.width;
            }
            if(itemHeight > 0)
            {
               _loc11_.height = itemHeight;
            }
            else
            {
               _itemHeight = _loc11_.height;
            }
            addItemHandlers(_loc11_);
         }
      }
      
      public function get itemVerticalGap() : Number
      {
         return _itemVerticalGap;
      }
      
      public function scrollNext() : void
      {
         scrollNextHandler();
      }
      
      public function get itemWidth() : Number
      {
         return _itemWidth;
      }
      
      public function set showOnlyRequiredContainers(param1:Boolean) : void
      {
         if(_showOnlyRequiredContainers != param1)
         {
            _showOnlyRequiredContainers = param1;
            showOnlyRequiredContainerChanged = true;
            invalidateProperties();
         }
      }
      
      public function set dataProvider(param1:ArrayCollection) : void
      {
         if(param1 is ArrayCollection && param1 != null)
         {
            _dataProvider = param1;
            _dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE,dataProviderCollectionChangeHandler);
            dataProviderChanged = true;
            invalidateProperties();
         }
      }
      
      private function updateItems(param1:Array) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:* = null;
         var _loc5_:Array = null;
         var _loc6_:* = null;
         var _loc2_:Array = mainContainer.getChildren();
         for each(_loc3_ in param1)
         {
            for each(_loc4_ in _loc2_)
            {
               _loc5_ = _loc4_.getChildren();
               for each(_loc6_ in _loc5_)
               {
                  if(_loc6_ != null && _loc6_.hasOwnProperty("data") && _loc6_["data"] == _loc3_.source)
                  {
                     addItemHandlers(_loc6_);
                     _loc6_.dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
                  }
               }
            }
         }
      }
      
      public function set itemHorizontalGap(param1:Number) : void
      {
         var _loc2_:Array = null;
         var _loc3_:* = null;
         _itemHorizontalGap = param1;
         if(mainContainer)
         {
            if(boxDirection == BoxDirection.VERTICAL)
            {
               mainContainer.setStyle("horizontalGap",_itemHorizontalGap);
            }
            else if(boxDirection == BoxDirection.HORIZONTAL)
            {
               _loc2_ = mainContainer.getChildren();
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.setStyle("horizontalGap",_itemHorizontalGap);
               }
            }
         }
      }
      
      public function get scrollDuration() : Number
      {
         return _scrollDuration;
      }
      
      private function feedBoxesHorizontal(param1:Array = null) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:Class = null;
         var _loc10_:ClassFactory = null;
         var _loc11_:* = undefined;
         var _loc2_:Array = mainContainer.getChildren();
         var _loc3_:int = 0;
         if(param1 == null)
         {
            param1 = dataProvider.toArray();
         }
         else
         {
            _loc3_ = 0 - param1.length;
         }
         var _loc4_:int = int(param1.length);
         var _loc5_:HBox = null;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = 0;
            if(sortCompareFunction == null)
            {
               if(_loc6_ + _loc3_ >= maxItemDisplayable)
               {
                  _loc7_ = (_loc6_ + _loc3_ - rowCount * columnCount) % rowCount;
               }
               else
               {
                  _loc7_ = (_loc6_ + _loc3_) / columnCount;
               }
            }
            else
            {
               _loc7_ = (_loc6_ + _loc3_) / (0 / rowCount);
            }
            _loc5_ = _loc2_[_loc7_] as HBox;
            _loc9_ = (_loc8_ = param1[_loc6_]) != null ? itemRenderer : nullItemRenderer;
            (_loc11_ = (_loc10_ = new ClassFactory(_loc9_)).newInstance()).data = _loc8_;
            addItemHandlers(_loc11_);
            if(_loc11_ is IDropInListItemRenderer)
            {
               (_loc11_ as IDropInListItemRenderer).listData = new BaseListData("","",this,_loc7_,_loc5_.getChildren().length);
            }
            if(itemWidth > 0)
            {
               _loc11_.width = itemWidth;
            }
            else
            {
               _itemWidth = _loc11_.width;
            }
            if(itemHeight > 0)
            {
               _loc11_.height = itemHeight;
            }
            else
            {
               _itemHeight = _loc11_.height;
            }
            _loc5_.addChild(_loc11_);
            _loc6_++;
         }
         if(_autoScroll)
         {
            validateNow();
            callLater(scrollToEnd);
         }
         sortCompareFunction = null;
      }
      
      public function set nextButtonBarThickness(param1:Number) : void
      {
         _nextButtonBarThickness = param1;
         nextButtonBarThicknessChanged = true;
         invalidateProperties();
      }
      
      private function previousButtonMouseOut(param1:MouseEvent) : void
      {
         previousButton.scaleX = previousButton.scaleY = 1;
      }
      
      public function scrollToEnd() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:KCBoxNavigationEvent = null;
         if(!currentlyScrolling)
         {
            if(boxDirection == BoxDirection.HORIZONTAL)
            {
               _loc1_ = 0 - 0;
               if(_loc1_ != mainContainer.x)
               {
                  currentlyScrolling = true;
                  TweenNano.to(mainContainer,_scrollDuration,{
                     "x":_loc1_,
                     "onComplete":scrollEffectEndHandler
                  });
                  _loc2_ = new KCBoxNavigationEvent(KCBoxNavigationEvent.SCROLL_END);
                  _loc2_.scrollOffset = _loc1_ - 0;
                  dispatchEvent(_loc2_);
               }
            }
         }
      }
      
      private function nextButtonMouseOut(param1:MouseEvent) : void
      {
         nextButton.scaleX = nextButton.scaleY = 1;
      }
      
      public function set previousButtonBarThickness(param1:Number) : void
      {
         _previousButtonBarThickness = param1;
         previousButtonBarThicknessChanged = true;
         invalidateProperties();
      }
      
      public function set nextButtonPosition(param1:Point) : void
      {
         _nextButtonPosition = param1;
         nextButtonPositionChanged = true;
         invalidateProperties();
      }
      
      private function nextButtonMouseOver(param1:MouseEvent) : void
      {
         nextButton.scaleX = nextButton.scaleY = 1.05;
      }
      
      public function set previousButtonPosition(param1:Point) : void
      {
         _previousButtonPosition = param1;
         previousButtonPositionChanged = true;
         invalidateProperties();
      }
      
      public function set rowCount(param1:Number) : void
      {
         if(param1 != _rowCount)
         {
            _rowCount = param1;
         }
      }
      
      private function updateScrollButtons() : void
      {
         if(boxDirection == BoxDirection.HORIZONTAL)
         {
            previousButton.visible = previousButton.enabled = false;
            var _loc1_:* = mainContainer.x > 0 - 0;
            nextButton.enabled = mainContainer.x > 0 - 0;
            nextButton.visible = _loc1_;
         }
      }
      
      public function set previousButtonStyleName(param1:String) : void
      {
         _previousButtonStyleName = param1;
         if(previousButton != null)
         {
            previousButton.styleName = _previousButtonStyleName;
         }
      }
      
      public function set columnCount(param1:Number) : void
      {
         if(param1 != _columnCount)
         {
            _columnCount = param1;
         }
      }
      
      private function getRowByItemIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         if(sortCompareFunction == null)
         {
            if(param1 >= maxItemDisplayable)
            {
               _loc2_ = (param1 - rowCount * columnCount) % rowCount;
            }
            else
            {
               _loc2_ = param1 / columnCount;
            }
         }
         else
         {
            _loc2_ = param1 / (0 / rowCount);
         }
         return _loc2_;
      }
      
      public function set nextButtonStyleName(param1:String) : void
      {
         _nextButtonStyleName = param1;
         if(nextButton != null)
         {
            nextButton.styleName = _nextButtonStyleName;
         }
      }
      
      public function set autoScroll(param1:Boolean) : void
      {
         _autoScroll = param1;
      }
      
      public function get dataProvider() : ArrayCollection
      {
         return _dataProvider;
      }
      
      public function get itemHorizontalGap() : Number
      {
         return _itemHorizontalGap;
      }
      
      private function updateButtonsPosition() : void
      {
         if(_nextButtonBarThickness > 0)
         {
            nextButtonContainer.width = _nextButtonBarThickness;
         }
         if(_previousButtonBarThickness > 0)
         {
            previousButtonContainer.width = _previousButtonBarThickness;
         }
         if(_nextButtonPosition)
         {
            if(false)
            {
               nextButtonContainer.setStyle("paddingLeft",_nextButtonPosition.x);
               nextButtonContainer.setStyle("paddingRight",0);
            }
            else
            {
               nextButtonContainer.setStyle("paddingRight",0);
               nextButtonContainer.setStyle("paddingLeft",0);
            }
            if(false)
            {
               nextButtonContainer.setStyle("paddingTop",_nextButtonPosition.y);
               nextButtonContainer.setStyle("paddingBottom",0);
            }
            else
            {
               nextButtonContainer.setStyle("paddingTop",0);
               nextButtonContainer.setStyle("paddingBottom",0);
            }
         }
         else
         {
            nextButtonContainer.setStyle("paddingLeft",0);
            nextButtonContainer.setStyle("paddingTop",0);
            nextButtonContainer.setStyle("paddingRight",0);
            nextButtonContainer.setStyle("paddingLeft",0);
         }
         if(_previousButtonPosition)
         {
            if(false)
            {
               previousButtonContainer.setStyle("paddingLeft",_previousButtonPosition.x);
               previousButtonContainer.setStyle("paddingRight",0);
            }
            else
            {
               previousButtonContainer.setStyle("paddingRight",0);
               previousButtonContainer.setStyle("paddingLeft",0);
            }
            if(false)
            {
               previousButtonContainer.setStyle("paddingTop",_previousButtonPosition.y);
               previousButtonContainer.setStyle("paddingBottom",0);
            }
            else
            {
               previousButtonContainer.setStyle("paddingTop",0);
               previousButtonContainer.setStyle("paddingBottom",0);
            }
         }
         else
         {
            previousButtonContainer.setStyle("paddingLeft",0);
            previousButtonContainer.setStyle("paddingTop",0);
            previousButtonContainer.setStyle("paddingRight",0);
            previousButtonContainer.setStyle("paddingLeft",0);
         }
      }
      
      private function scrollPreviousHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:KCBoxNavigationEvent = null;
         if(!currentlyScrolling)
         {
            if(boxDirection == BoxDirection.HORIZONTAL)
            {
               _loc2_ = itemWidth + itemHorizontalGap;
               _loc3_ = Math.min(0,mainContainer.x + _loc2_);
               if(mainContainer.x != _loc3_)
               {
                  currentlyScrolling = true;
                  TweenNano.to(mainContainer,_scrollDuration,{
                     "x":_loc3_,
                     "onComplete":scrollEffectEndHandler
                  });
                  (_loc4_ = new KCBoxNavigationEvent(KCBoxNavigationEvent.SCROLL_PREVIOUS)).scrollOffset = _loc3_ - 0;
                  dispatchEvent(_loc4_);
               }
            }
         }
      }
      
      public function getHorizontalScrollPosition() : Number
      {
         return 0;
      }
      
      public function set itemVerticalGap(param1:Number) : void
      {
         _itemVerticalGap = param1;
         mainContainer.setStyle("verticalGap",_itemVerticalGap);
      }
      
      public function sortCollection(param1:Function) : void
      {
         sortCompareFunction = param1;
         var _loc2_:Sort = new Sort();
         _loc2_.compareFunction = sortCompareFunction;
         dataProvider.sort = _loc2_;
         dataProvider.refresh();
         dataProviderChanged = true;
         invalidateProperties();
      }
      
      private function feedBoxes(param1:Array = null) : void
      {
         manageContainerVisibility();
         if(boxDirection == HORIZONTAL)
         {
            feedBoxesHorizontal(param1);
         }
         else if(boxDirection == VERTICAL)
         {
         }
      }
      
      private function addItemHandlers(param1:UIComponent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:* = null;
         if(param1 is _itemRenderer && !param1.hasEventListener(MouseEvent.CLICK))
         {
            param1.addEventListener(MouseEvent.CLICK,itemMouseClickHandler);
         }
         else if(param1 is Container)
         {
            _loc2_ = (param1 as Container).getChildren();
            for each(_loc3_ in _loc2_)
            {
               addItemHandlers(_loc3_);
            }
         }
      }
      
      public function set itemWidth(param1:Number) : void
      {
         _itemWidth = param1;
         itemSizeChanged = true;
         invalidateProperties();
      }
      
      public function get previousButtonStyleName() : String
      {
         return _previousButtonStyleName;
      }
      
      public function set itemRenderer(param1:Class) : void
      {
         _itemRenderer = param1;
         itemRendererChanged = true;
         invalidateProperties();
      }
      
      public function set boxDirection(param1:String) : void
      {
         if(_boxDirection != param1)
         {
            _boxDirection = param1;
         }
      }
      
      public function get boxDirection() : String
      {
         return _boxDirection;
      }
      
      public function get itemRenderer() : Class
      {
         return _itemRenderer;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(itemRendererChanged || nullItemRendererChanged)
         {
            prepareBoxes();
            itemRendererChanged = false;
            nullItemRendererChanged = false;
            scrollHasChanged = true;
            itemHandlerChanged = true;
         }
         if(dataProviderChanged)
         {
            prepareBoxes();
            feedBoxes();
            dataProviderChanged = false;
            scrollHasChanged = true;
            itemHandlerChanged = true;
         }
         if(showOnlyRequiredContainerChanged)
         {
            manageContainerVisibility();
            showOnlyRequiredContainerChanged = false;
         }
         if(itemSizeChanged)
         {
            sizeItems();
            itemSizeChanged = false;
            scrollHasChanged = true;
         }
         if(scrollHasChanged)
         {
            updateScrollButtons();
            scrollHasChanged = false;
         }
         if(itemHandlerChanged)
         {
            addItemHandlers(this);
            itemHandlerChanged = false;
         }
         if(nextButtonPositionChanged || previousButtonPositionChanged || previousButtonBarThicknessChanged || nextButtonBarThicknessChanged)
         {
            updateButtonsPosition();
            nextButtonPositionChanged = false;
            previousButtonPositionChanged = false;
            previousButtonBarThicknessChanged = false;
            nextButtonBarThicknessChanged = false;
         }
      }
      
      private function prepareBoxes() : void
      {
         var _loc1_:HBox = null;
         var _loc2_:int = 0;
         var _loc3_:VBox = null;
         var _loc4_:int = 0;
         mainContainer.removeAllChildren();
         if(boxDirection == HORIZONTAL)
         {
            _loc2_ = 0;
            while(_loc2_ < rowCount)
            {
               _loc1_ = new HBox();
               _loc1_.setStyle("horizontalAlign","center");
               _loc1_.setStyle("verticalAlign","middle");
               _loc1_.visible = false;
               _loc1_.includeInLayout = false;
               mainContainer.addChild(_loc1_);
               _loc2_++;
            }
         }
         else if(boxDirection == VERTICAL)
         {
            _loc4_ = 0;
            while(_loc4_ < columnCount)
            {
               _loc3_ = new VBox();
               _loc3_.setStyle("horizontalAlign","center");
               _loc3_.setStyle("verticalAlign","middle");
               _loc3_.visible = false;
               _loc3_.includeInLayout = false;
               mainContainer.addChild(_loc3_);
               _loc4_++;
            }
         }
         itemHorizontalGap = _itemHorizontalGap;
         itemVerticalGap = _itemVerticalGap;
      }
   }
}
