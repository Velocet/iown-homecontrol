package mx.controls.listClasses
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import mx.collections.ArrayCollection;
   import mx.collections.CursorBookmark;
   import mx.collections.ICollectionView;
   import mx.collections.IList;
   import mx.collections.IViewCursor;
   import mx.collections.ItemResponder;
   import mx.collections.ItemWrapper;
   import mx.collections.ListCollectionView;
   import mx.collections.ModifiedCollectionView;
   import mx.collections.XMLListCollection;
   import mx.collections.errors.CursorError;
   import mx.collections.errors.ItemPendingError;
   import mx.controls.dataGridClasses.DataGridListData;
   import mx.core.DragSource;
   import mx.core.EdgeMetrics;
   import mx.core.EventPriority;
   import mx.core.FlexShape;
   import mx.core.FlexVersion;
   import mx.core.IDataRenderer;
   import mx.core.IFactory;
   import mx.core.IFlexDisplayObject;
   import mx.core.IInvalidating;
   import mx.core.IUIComponent;
   import mx.core.IUID;
   import mx.core.IUITextField;
   import mx.core.ScrollControlBase;
   import mx.core.ScrollPolicy;
   import mx.core.SpriteAsset;
   import mx.core.mx_internal;
   import mx.effects.IEffect;
   import mx.effects.IEffectTargetHost;
   import mx.effects.Tween;
   import mx.events.CollectionEvent;
   import mx.events.CollectionEventKind;
   import mx.events.DragEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.MoveEvent;
   import mx.events.SandboxMouseEvent;
   import mx.events.ScrollEvent;
   import mx.events.ScrollEventDetail;
   import mx.events.ScrollEventDirection;
   import mx.events.TweenEvent;
   import mx.managers.DragManager;
   import mx.managers.IFocusManagerComponent;
   import mx.managers.ISystemManager;
   import mx.skins.halo.ListDropIndicator;
   import mx.styles.StyleManager;
   import mx.styles.StyleProxy;
   import mx.utils.ObjectUtil;
   import mx.utils.UIDUtil;
   
   public class ListBase extends ScrollControlBase implements IDataRenderer, IFocusManagerComponent, mx.controls.listClasses.IListItemRenderer, IDropInListItemRenderer, IEffectTargetHost
   {
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static var _listContentStyleFilters:Object = null;
      
      mx_internal static const DRAG_THRESHOLD:int = 4;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _labelField:String = "label";
      
      private var trackedRenderers:Array;
      
      mx_internal var bSelectionChanged:Boolean = false;
      
      protected var offscreenExtraColumnsLeft:int = 0;
      
      protected var selectionTweens:Object;
      
      protected var caretItemRenderer:mx.controls.listClasses.IListItemRenderer;
      
      protected var actualIterator:IViewCursor;
      
      protected var iteratorValid:Boolean = true;
      
      private var bSelectItem:Boolean = false;
      
      private var _allowMultipleSelection:Boolean = false;
      
      protected var cachedItemsChangeEffect:IEffect = null;
      
      private var lastSelectionData:mx.controls.listClasses.ListBaseSelectionData;
      
      protected var iterator:IViewCursor;
      
      protected var rendererChanged:Boolean = false;
      
      protected var unconstrainedRenderers:Dictionary;
      
      protected var freeItemRenderersByFactory:Dictionary;
      
      private var columnWidthChanged:Boolean = false;
      
      protected var explicitColumnCount:int = -1;
      
      private var _data:Object;
      
      private var bSelectedItemsChanged:Boolean = false;
      
      private var selectionDataArray:Array;
      
      protected var defaultRowCount:int = 4;
      
      private var _rowCount:int = -1;
      
      protected var offscreenExtraRowsTop:int = 0;
      
      private var _dataTipField:String = "label";
      
      private var cachedPaddingTopInvalid:Boolean = true;
      
      protected var selectedData:Object;
      
      private var _labelFunction:Function;
      
      mx_internal var listType:String = "grid";
      
      private var cachedPaddingBottomInvalid:Boolean = true;
      
      protected var runningDataEffect:Boolean = false;
      
      protected var runDataEffectNextUpdate:Boolean = false;
      
      private var bShiftKey:Boolean = false;
      
      private var columnCountChanged:Boolean = true;
      
      protected var rowMap:Object;
      
      mx_internal var _selectedIndex:int = -1;
      
      mx_internal var collectionIterator:IViewCursor;
      
      protected var lastDropIndex:int;
      
      private var bCtrlKey:Boolean = false;
      
      private var oldUnscaledHeight:Number;
      
      protected var explicitColumnWidth:Number;
      
      private var _dataTipFunction:Function;
      
      private var _iconFunction:Function;
      
      protected var dataItemWrappersByRenderer:Dictionary;
      
      protected var itemsNeedMeasurement:Boolean = true;
      
      protected var offscreenExtraRowsBottom:int = 0;
      
      protected var modifiedCollectionView:ModifiedCollectionView;
      
      private var _columnCount:int = -1;
      
      private var rowCountChanged:Boolean = true;
      
      protected var wordWrapChanged:Boolean = false;
      
      protected var explicitRowCount:int = -1;
      
      protected var offscreenExtraRows:int = 0;
      
      private var _dragEnabled:Boolean = false;
      
      private var bSortItemPending:Boolean = false;
      
      protected var caretIndicator:Sprite;
      
      protected var caretUID:String;
      
      protected var caretBookmark:CursorBookmark;
      
      public var allowDragSelection:Boolean = false;
      
      mx_internal var allowRendererStealingDuringLayout:Boolean = true;
      
      private var _selectable:Boolean = true;
      
      protected var listContent:mx.controls.listClasses.ListBaseContentHolder;
      
      private var _showDataTips:Boolean = false;
      
      private var _variableRowHeight:Boolean = false;
      
      private var cachedVerticalAlignInvalid:Boolean = true;
      
      private var _dragMoveEnabled:Boolean = false;
      
      private var _rowHeight:Number;
      
      private var _selectedItem:Object;
      
      public var menuSelectionMode:Boolean = false;
      
      mx_internal var cachedPaddingTop:Number;
      
      private var _selectedIndices:Array;
      
      private var _columnWidth:Number;
      
      protected var defaultColumnCount:int = 4;
      
      private var rendererTrackingSuspended:Boolean = false;
      
      private var oldUnscaledWidth:Number;
      
      private var _nullItemRenderer:IFactory;
      
      mx_internal var bColumnScrolling:Boolean = true;
      
      protected var showCaret:Boolean;
      
      private var firstSelectionData:mx.controls.listClasses.ListBaseSelectionData;
      
      private var mouseDownItem:mx.controls.listClasses.IListItemRenderer;
      
      protected var collection:ICollectionView;
      
      protected var offscreenExtraRowsOrColumnsChanged:Boolean = false;
      
      private var _offscreenExtraRowsOrColumns:int = 0;
      
      private var _iconField:String = "icon";
      
      protected var dataEffectCompleted:Boolean = false;
      
      private var bSelectedItemChanged:Boolean = false;
      
      private var _listData:mx.controls.listClasses.BaseListData;
      
      mx_internal var bSelectOnRelease:Boolean;
      
      protected var actualCollection:ICollectionView;
      
      mx_internal var lastHighlightItemRenderer:mx.controls.listClasses.IListItemRenderer;
      
      private var _itemRenderer:IFactory;
      
      mx_internal var itemMaskFreeList:Array;
      
      protected var keySelectionPending:Boolean = false;
      
      private var mouseDownPoint:Point;
      
      protected var selectionIndicators:Object;
      
      protected var highlightUID:String;
      
      mx_internal var dragScrollingInterval:int = 0;
      
      protected var anchorBookmark:CursorBookmark;
      
      protected var caretIndex:int = -1;
      
      protected var offscreenExtraColumnsRight:int = 0;
      
      private var _selectedItemsCompareFunction:Function;
      
      private var approximate:Boolean = false;
      
      protected var anchorIndex:int = -1;
      
      private var firstSelectedItem:Object;
      
      protected var selectionLayer:Sprite;
      
      protected var freeItemRenderers:Array;
      
      mx_internal var bSelectedIndexChanged:Boolean = false;
      
      mx_internal var cachedVerticalAlign:String;
      
      private var lastHighlightItemIndices:Point;
      
      mx_internal var lastHighlightItemRendererAtIndices:mx.controls.listClasses.IListItemRenderer;
      
      protected var lastSeekPending:mx.controls.listClasses.ListBaseSeekPending;
      
      private var bSelectedIndicesChanged:Boolean = false;
      
      private var proposedSelectedItemIndexes:Dictionary;
      
      private var _dropEnabled:Boolean = false;
      
      protected var itemsSizeChanged:Boolean = false;
      
      mx_internal var isPressed:Boolean = false;
      
      private var IS_ITEM_STYLE:Object;
      
      mx_internal var cachedPaddingBottom:Number;
      
      protected var highlightIndicator:Sprite;
      
      private var verticalScrollPositionPending:Number;
      
      protected var explicitRowHeight:Number;
      
      protected var highlightItemRenderer:mx.controls.listClasses.IListItemRenderer;
      
      private var rowHeightChanged:Boolean = false;
      
      mx_internal var lastDragEvent:DragEvent;
      
      private var _wordWrap:Boolean = false;
      
      private var horizontalScrollPositionPending:Number;
      
      mx_internal var dropIndicator:IFlexDisplayObject;
      
      private var _selectedItems:Array;
      
      protected var offscreenExtraColumns:int = 0;
      
      private var lastKey:uint = 0;
      
      protected var factoryMap:Dictionary;
      
      protected var reservedItemRenderers:Object;
      
      public function ListBase()
      {
         IS_ITEM_STYLE = {
            "alternatingItemColors":true,
            "backgroundColor":true,
            "backgroundDisabledColor":true,
            "color":true,
            "rollOverColor":true,
            "selectionColor":true,
            "selectionDisabledColor":true,
            "styleName":true,
            "textColor":true,
            "textRollOverColor":true,
            "textSelectedColor":true
         };
         rowMap = {};
         freeItemRenderers = [];
         reservedItemRenderers = {};
         unconstrainedRenderers = new Dictionary();
         dataItemWrappersByRenderer = new Dictionary(true);
         selectedData = {};
         selectionIndicators = {};
         selectionTweens = {};
         trackedRenderers = [];
         super();
         tabEnabled = true;
         factoryMap = new Dictionary(true);
         addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
         addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
         addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         addEventListener(MouseEvent.CLICK,mouseClickHandler);
         addEventListener(MouseEvent.DOUBLE_CLICK,mouseDoubleClickHandler);
         invalidateProperties();
      }
      
      [Bindable("iconFieldChanged")]
      public function get iconField() : String
      {
         return _iconField;
      }
      
      public function set iconField(param1:String) : void
      {
         _iconField = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("iconFieldChanged"));
      }
      
      mx_internal function getItemUID(param1:Object) : String
      {
         return itemToUID(param1);
      }
      
      public function measureWidthOfItems(param1:int = -1, param2:int = 0) : Number
      {
         return NaN;
      }
      
      private function terminateSelectionTracking() : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc1_:int = 0;
         while(_loc1_ < trackedRenderers.length)
         {
            _loc2_ = trackedRenderers[_loc1_] as mx.controls.listClasses.IListItemRenderer;
            _loc2_.removeEventListener(MoveEvent.MOVE,rendererMoveHandler);
            _loc1_++;
         }
         trackedRenderers = [];
      }
      
      public function get columnWidth() : Number
      {
         return _columnWidth;
      }
      
      public function createItemRenderer(param1:Object) : mx.controls.listClasses.IListItemRenderer
      {
         return null;
      }
      
      protected function clearSelected(param1:Boolean = false) : void
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         var _loc4_:mx.controls.listClasses.IListItemRenderer = null;
         for(_loc2_ in selectedData)
         {
            _loc3_ = selectedData[_loc2_].data;
            removeSelectionData(_loc2_);
            if(_loc4_ = UIDToItemRenderer(itemToUID(_loc3_)))
            {
               drawItem(_loc4_,false,_loc2_ == highlightUID,false,param1);
            }
         }
         clearSelectionData();
         mx_internal::_selectedIndex = -1;
         _selectedItem = null;
         caretIndex = -1;
         anchorIndex = -1;
         caretBookmark = null;
         anchorBookmark = null;
      }
      
      protected function addToRowArrays() : void
      {
         listItems.splice(0,0,null);
         rowInfo.splice(0,0,null);
      }
      
      public function get nullItemRenderer() : IFactory
      {
         return _nullItemRenderer;
      }
      
      [Bindable("showDataTipsChanged")]
      public function get showDataTips() : Boolean
      {
         return _showDataTips;
      }
      
      public function set columnWidth(param1:Number) : void
      {
         explicitColumnWidth = param1;
         if(_columnWidth != param1)
         {
            mx_internal::setColumnWidth(param1);
            invalidateSize();
            itemsSizeChanged = true;
            invalidateDisplayList();
            dispatchEvent(new Event("columnWidthChanged"));
         }
      }
      
      protected function scrollHorizontally(param1:int, param2:int, param3:Boolean) : void
      {
      }
      
      protected function drawHighlightIndicator(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:mx.controls.listClasses.IListItemRenderer) : void
      {
         var _loc8_:Graphics;
         (_loc8_ = Sprite(param1).graphics).clear();
         _loc8_.beginFill(param6);
         _loc8_.drawRect(0,0,param4,param5);
         _loc8_.endFill();
         param1.x = param2;
         param1.y = param3;
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      override public function get verticalScrollPosition() : Number
      {
         if(!isNaN(verticalScrollPositionPending))
         {
            return verticalScrollPositionPending;
         }
         return super.verticalScrollPosition;
      }
      
      protected function drawCaretIndicator(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:mx.controls.listClasses.IListItemRenderer) : void
      {
         var _loc8_:Graphics;
         (_loc8_ = Sprite(param1).graphics).clear();
         _loc8_.lineStyle(1,param6,1);
         _loc8_.drawRect(0,0,param4 - 1,param5 - 1);
         param1.x = param2;
         param1.y = param3;
      }
      
      private function makeAdditionalRows(param1:int) : void
      {
         var curY:Number;
         var cursorPos:CursorBookmark = null;
         var rowIndex:int = param1;
         if(iterator)
         {
            cursorPos = iterator.bookmark;
            try
            {
               iterator.seek(CursorBookmark.CURRENT,listItems.length);
            }
            catch(e:ItemPendingError)
            {
               lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.CURRENT,listItems.length);
               e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
               iteratorValid = false;
            }
         }
         curY = rowInfo[rowIndex].y + rowInfo[rowIndex].height;
         makeRowsAndColumns(0,curY,listContent.width,listContent.height,0,rowIndex + 1);
         seekPositionIgnoreError(iterator,cursorPos);
      }
      
      public function set showDataTips(param1:Boolean) : void
      {
         _showDataTips = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("showDataTipsChanged"));
      }
      
      public function set nullItemRenderer(param1:IFactory) : void
      {
         _nullItemRenderer = param1;
         invalidateSize();
         invalidateDisplayList();
         itemsSizeChanged = true;
         rendererChanged = true;
         dispatchEvent(new Event("nullItemRendererChanged"));
      }
      
      protected function moveIndicatorsHorizontally(param1:String, param2:Number) : void
      {
         if(param1 != null)
         {
            if(false)
            {
               selectionIndicators[param1].x += param2;
            }
            if(highlightUID == param1)
            {
               highlightIndicator.x += param2;
            }
            if(caretUID == param1)
            {
               caretIndicator.x += param2;
            }
         }
      }
      
      private function seekPreviousSafely(param1:IViewCursor, param2:int) : Boolean
      {
         var iterator:IViewCursor = param1;
         var pos:int = param2;
         try
         {
            iterator.movePrevious();
         }
         catch(e:ItemPendingError)
         {
            lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,pos);
            e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
            iteratorValid = false;
         }
         return iteratorValid;
      }
      
      public function measureHeightOfItems(param1:int = -1, param2:int = 0) : Number
      {
         return NaN;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedItem() : Object
      {
         return _selectedItem;
      }
      
      protected function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc4_:DragEvent = null;
         var _loc5_:mx.controls.listClasses.BaseListData = null;
         if(!enabled || !selectable)
         {
            return;
         }
         _loc2_ = new Point(param1.localX,param1.localY);
         _loc2_ = DisplayObject(param1.target).localToGlobal(_loc2_);
         _loc2_ = globalToLocal(_loc2_);
         if(mx_internal::isPressed && mouseDownPoint && (Math.abs(0 - _loc2_.x) > mx_internal::DRAG_THRESHOLD || Math.abs(0 - _loc2_.y) > mx_internal::DRAG_THRESHOLD))
         {
            if(dragEnabled && true && Boolean(mouseDownPoint))
            {
               (_loc4_ = new DragEvent(DragEvent.DRAG_START)).dragInitiator = this;
               _loc4_.localX = mouseDownPoint.x;
               _loc4_.localY = mouseDownPoint.y;
               _loc4_.buttonDown = true;
               dispatchEvent(_loc4_);
            }
         }
         _loc3_ = mouseEventToItemRenderer(param1);
         if(Boolean(_loc3_) && Boolean(highlightItemRenderer))
         {
            _loc5_ = rowMap[_loc3_.name];
            if(highlightItemRenderer && highlightUID && _loc5_.uid != highlightUID)
            {
               if(!mx_internal::isPressed)
               {
                  if(getStyle("useRollOver") && false)
                  {
                     mx_internal::clearHighlight(highlightItemRenderer);
                  }
               }
            }
         }
         else if(!_loc3_ && Boolean(highlightItemRenderer))
         {
            if(!mx_internal::isPressed)
            {
               if(getStyle("useRollOver") && false)
               {
                  mx_internal::clearHighlight(highlightItemRenderer);
               }
            }
         }
         if(Boolean(_loc3_) && !highlightItemRenderer)
         {
            mouseOverHandler(param1);
         }
      }
      
      public function get selectable() : Boolean
      {
         return _selectable;
      }
      
      protected function seekPendingFailureHandler(param1:Object, param2:mx.controls.listClasses.ListBaseSeekPending) : void
      {
      }
      
      override public function set verticalScrollPosition(param1:Number) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = false;
         if(!dataProvider || !isNaN(verticalScrollPositionPending))
         {
            verticalScrollPositionPending = param1;
            if(dataProvider)
            {
               invalidateDisplayList();
            }
            return;
         }
         verticalScrollPositionPending = NaN;
         var _loc2_:int = super.verticalScrollPosition;
         super.verticalScrollPosition = param1;
         mx_internal::removeClipMask();
         var _loc3_:int = offscreenExtraRowsTop;
         var _loc4_:int = offscreenExtraRowsBottom;
         if(_loc2_ != param1)
         {
            _loc6_ = (_loc5_ = param1 - _loc2_) > 0;
            if((_loc5_ = Math.abs(_loc5_)) >= 0 - offscreenExtraRows || !iteratorValid)
            {
               clearIndicators();
               clearVisibleData();
               makeRowsAndColumnsWithExtraRows(oldUnscaledWidth,oldUnscaledHeight);
            }
            else
            {
               scrollVertically(param1,_loc5_,_loc6_);
               adjustListContent(oldUnscaledWidth,oldUnscaledHeight);
            }
            if(variableRowHeight)
            {
               configureScrollBars();
            }
            drawRowBackgrounds();
         }
         mx_internal::addClipMask(offscreenExtraRowsTop != _loc3_ || offscreenExtraRowsBottom != _loc4_);
      }
      
      [Bindable("viewChanged")]
      [Bindable("scroll")]
      override public function get horizontalScrollPosition() : Number
      {
         if(!isNaN(horizontalScrollPositionPending))
         {
            return horizontalScrollPositionPending;
         }
         return super.horizontalScrollPosition;
      }
      
      protected function itemRendererToIndices(param1:mx.controls.listClasses.IListItemRenderer) : Point
      {
         if(!param1 || !(param1.name in rowMap))
         {
            return null;
         }
         var _loc2_:int = int(rowMap[param1.name].rowIndex);
         var _loc3_:int = int(listItems[_loc2_].length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(listItems[_loc2_][_loc4_] == param1)
            {
               break;
            }
            _loc4_++;
         }
         return new Point(_loc4_ + horizontalScrollPosition,_loc2_ + verticalScrollPosition + offscreenExtraRowsTop);
      }
      
      private function reduceRows(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         while(param1 >= 0)
         {
            if(rowInfo[param1].y < listContent.height)
            {
               break;
            }
            _loc2_ = int(listItems[param1].length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               addToFreeItemRenderers(listItems[param1][_loc3_]);
               _loc3_++;
            }
            _loc4_ = String(rowInfo[param1].uid);
            delete visibleData[_loc4_];
            removeIndicators(_loc4_);
            listItems.pop();
            rowInfo.pop();
            param1--;
         }
      }
      
      public function get dragMoveEnabled() : Boolean
      {
         return _dragMoveEnabled;
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:Point = null;
         var _loc4_:ListEvent = null;
         if(!selectable)
         {
            return;
         }
         if(!iteratorValid)
         {
            return;
         }
         if(!collection || false)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.UP:
            case Keyboard.DOWN:
               moveSelectionVertically(param1.keyCode,param1.shiftKey,param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.LEFT:
            case Keyboard.RIGHT:
               moveSelectionHorizontally(param1.keyCode,param1.shiftKey,param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.END:
            case Keyboard.HOME:
            case Keyboard.PAGE_UP:
            case Keyboard.PAGE_DOWN:
               moveSelectionVertically(param1.keyCode,param1.shiftKey,param1.ctrlKey);
               param1.stopPropagation();
               break;
            case Keyboard.SPACE:
               if(caretIndex != -1 && caretIndex - verticalScrollPosition >= 0 && caretIndex - verticalScrollPosition < listItems.length)
               {
                  _loc2_ = listItems[caretIndex - verticalScrollPosition][0];
                  if(selectItem(_loc2_,param1.shiftKey,param1.ctrlKey))
                  {
                     _loc3_ = itemRendererToIndices(_loc2_);
                     _loc4_ = new ListEvent(ListEvent.CHANGE);
                     if(_loc3_)
                     {
                        _loc4_.columnIndex = _loc3_.x;
                        _loc4_.rowIndex = _loc3_.y;
                     }
                     _loc4_.itemRenderer = _loc2_;
                     dispatchEvent(_loc4_);
                  }
               }
               break;
            default:
               if(findKey(param1.charCode))
               {
                  param1.stopPropagation();
               }
         }
      }
      
      protected function reKeyVisibleData() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = {};
         for each(_loc2_ in visibleData)
         {
            if(_loc2_.data)
            {
               _loc1_[itemToUID(_loc2_.data)] = _loc2_;
            }
         }
         listContent.visibleData = _loc1_;
      }
      
      protected function copySelectedItems(param1:Boolean = true) : Array
      {
         var _loc2_:* = [];
         var _loc3_:mx.controls.listClasses.ListBaseSelectionData = firstSelectionData;
         while(_loc3_ != null)
         {
            if(param1)
            {
               _loc2_.push(_loc3_.data);
            }
            else
            {
               _loc2_.push(_loc3_.index);
            }
            _loc3_ = _loc3_.mx_internal::nextSelectionData;
         }
         return _loc2_;
      }
      
      public function invalidateList() : void
      {
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      protected function moveIndicatorsVertically(param1:String, param2:Number) : void
      {
         if(param1 != null)
         {
            if(false)
            {
               selectionIndicators[param1].y += param2;
            }
            if(highlightUID == param1)
            {
               highlightIndicator.y += param2;
            }
            if(caretUID == param1)
            {
               caretIndicator.y += param2;
            }
         }
      }
      
      public function indexToItemRenderer(param1:int) : mx.controls.listClasses.IListItemRenderer
      {
         var _loc2_:int = verticalScrollPosition - offscreenExtraRowsTop;
         if(param1 < _loc2_ || param1 >= _loc2_ + listItems.length)
         {
            return null;
         }
         return listItems[param1 - _loc2_][0];
      }
      
      protected function get dragImage() : IUIComponent
      {
         var _loc1_:ListItemDragProxy = new ListItemDragProxy();
         _loc1_.owner = this;
         _loc1_.moduleFactory = moduleFactory;
         return _loc1_;
      }
      
      protected function copyItemWithUID(param1:Object) : Object
      {
         var _loc2_:Object = null;
         _loc2_ = ObjectUtil.copy(param1);
         if(_loc2_ is IUID)
         {
            IUID(_loc2_).uid = UIDUtil.createUID();
         }
         else if(_loc2_ is Object && "mx_internal_uid" in _loc2_)
         {
            _loc2_.mx_internal_uid = UIDUtil.createUID();
         }
         return _loc2_;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedIndices() : Array
      {
         if(bSelectedIndicesChanged)
         {
            return _selectedIndices;
         }
         return copySelectedItems(false);
      }
      
      public function get variableRowHeight() : Boolean
      {
         return _variableRowHeight;
      }
      
      protected function mouseDoubleClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:Point = null;
         var _loc4_:ListEvent = null;
         _loc2_ = mouseEventToItemRenderer(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc3_ = itemRendererToIndices(_loc2_);
         if(_loc3_)
         {
            (_loc4_ = new ListEvent(ListEvent.ITEM_DOUBLE_CLICK)).columnIndex = _loc3_.x;
            _loc4_.rowIndex = _loc3_.y;
            _loc4_.itemRenderer = _loc2_;
            dispatchEvent(_loc4_);
         }
      }
      
      mx_internal function selectionDataPendingResultHandler(param1:Object, param2:ListBaseSelectionDataPending) : void
      {
         if(param2.bookmark)
         {
            mx_internal::collectionIterator.seek(param2.bookmark,param2.offset);
         }
         setSelectionDataLoop(param2.items,param2.index,param2.useFind);
      }
      
      public function set selectedItem(param1:Object) : void
      {
         if(!collection || false)
         {
            _selectedItem = param1;
            bSelectedItemChanged = true;
            mx_internal::bSelectionChanged = true;
            invalidateDisplayList();
            return;
         }
         commitSelectedItem(param1);
      }
      
      private function adjustScrollPosition() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc1_:Boolean = false;
         if(!isNaN(horizontalScrollPositionPending))
         {
            _loc1_ = true;
            _loc2_ = Math.min(horizontalScrollPositionPending,maxHorizontalScrollPosition);
            horizontalScrollPositionPending = NaN;
            super.horizontalScrollPosition = _loc2_;
         }
         if(!isNaN(verticalScrollPositionPending))
         {
            _loc1_ = true;
            _loc3_ = Math.min(verticalScrollPositionPending,maxVerticalScrollPosition);
            verticalScrollPositionPending = NaN;
            super.verticalScrollPosition = _loc3_;
         }
         if(_loc1_)
         {
            _loc4_ = scrollPositionToIndex(horizontalScrollPosition,verticalScrollPosition - offscreenExtraRowsTop);
            seekPositionSafely(_loc4_);
         }
      }
      
      protected function itemToUID(param1:Object) : String
      {
         if(param1 == null)
         {
            return "null";
         }
         return UIDUtil.getUID(param1);
      }
      
      protected function dragEnterHandler(param1:DragEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         mx_internal::lastDragEvent = param1;
         if(enabled && iteratorValid && param1.dragSource.hasFormat("items"))
         {
            DragManager.acceptDragDrop(this);
            DragManager.showFeedback(param1.ctrlKey ? "null" : DragManager.MOVE);
            showDropFeedback(param1);
            return;
         }
         hideDropFeedback(param1);
         DragManager.showFeedback(DragManager.NONE);
      }
      
      protected function indexToColumn(param1:int) : int
      {
         return 0;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         _selectable = param1;
      }
      
      protected function moveRowVertically(param1:int, param2:int, param3:Number) : void
      {
         var _loc4_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            _loc4_ = listItems[param1][_loc5_];
            _loc4_.move(_loc4_.x,_loc4_.y + param3);
            _loc5_++;
         }
         rowInfo[param1].y += param3;
      }
      
      override public function set horizontalScrollPosition(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = false;
         if(!dataProvider || !isNaN(horizontalScrollPositionPending))
         {
            horizontalScrollPositionPending = param1;
            if(dataProvider)
            {
               invalidateDisplayList();
            }
            return;
         }
         horizontalScrollPositionPending = NaN;
         var _loc2_:int = super.horizontalScrollPosition;
         super.horizontalScrollPosition = param1;
         mx_internal::removeClipMask();
         if(_loc2_ != param1)
         {
            if(itemsSizeChanged)
            {
               return;
            }
            _loc3_ = param1 - _loc2_;
            _loc4_ = _loc3_ > 0;
            _loc3_ = Math.abs(_loc3_);
            if(mx_internal::bColumnScrolling && _loc3_ >= columnCount)
            {
               clearIndicators();
               clearVisibleData();
               makeRowsAndColumnsWithExtraColumns(oldUnscaledWidth,oldUnscaledHeight);
               drawRowBackgrounds();
            }
            else
            {
               scrollHorizontally(param1,_loc3_,_loc4_);
            }
         }
         mx_internal::addClipMask(false);
      }
      
      public function set dragMoveEnabled(param1:Boolean) : void
      {
         _dragMoveEnabled = param1;
      }
      
      public function isItemHighlighted(param1:Object) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Boolean = Boolean(highlightIndicator) && highlightIndicator.parent.getChildIndex(highlightIndicator) != highlightIndicator.parent.numChildren - 1;
         if(param1 is String)
         {
            return param1 == highlightUID && !_loc2_;
         }
         return itemToUID(param1) == highlightUID && !_loc2_;
      }
      
      override protected function mouseWheelHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:ScrollEvent = null;
         if(Boolean(verticalScrollBar) && false)
         {
            param1.stopPropagation();
            _loc2_ = verticalScrollPosition;
            _loc3_ = verticalScrollPosition;
            _loc3_ -= param1.delta * 0;
            _loc3_ = Math.max(0,Math.min(_loc3_,verticalScrollBar.maxScrollPosition));
            verticalScrollPosition = _loc3_;
            if(_loc2_ != verticalScrollPosition)
            {
               (_loc4_ = new ScrollEvent(ScrollEvent.SCROLL)).direction = ScrollEventDirection.VERTICAL;
               _loc4_.position = verticalScrollPosition;
               _loc4_.delta = verticalScrollPosition - _loc2_;
               dispatchEvent(_loc4_);
            }
         }
      }
      
      protected function restoreRowArrays(param1:int) : void
      {
         rowInfo.splice(0,param1);
         listItems.splice(0,param1);
      }
      
      public function set labelField(param1:String) : void
      {
         _labelField = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("labelFieldChanged"));
      }
      
      private function seekPositionIgnoreError(param1:IViewCursor, param2:CursorBookmark) : void
      {
         var iterator:IViewCursor = param1;
         var cursorPos:CursorBookmark = param2;
         if(iterator)
         {
            try
            {
               iterator.seek(cursorPos,0);
            }
            catch(e:ItemPendingError)
            {
            }
         }
      }
      
      protected function finishDataChangeEffect(param1:EffectEvent) : void
      {
         collection = actualCollection;
         actualCollection = null;
         modifiedCollectionView = null;
         listContent.iterator = iterator = actualIterator;
         runningDataEffect = false;
         unconstrainedRenderers = new Dictionary();
         terminateSelectionTracking();
         reKeyVisibleData();
         var _loc2_:int = scrollPositionToIndex(horizontalScrollPosition - offscreenExtraColumnsLeft,verticalScrollPosition - offscreenExtraRowsTop);
         iterator.seek(CursorBookmark.FIRST,_loc2_);
         callLater(cleanupAfterDataChangeEffect);
      }
      
      public function set offscreenExtraRowsOrColumns(param1:int) : void
      {
         param1 = Math.max(param1,0);
         if(param1 % 2)
         {
            param1++;
         }
         if(_offscreenExtraRowsOrColumns == param1)
         {
            return;
         }
         _offscreenExtraRowsOrColumns = param1;
         offscreenExtraRowsOrColumnsChanged = true;
         invalidateProperties();
      }
      
      mx_internal function clearHighlight(param1:mx.controls.listClasses.IListItemRenderer) : void
      {
         var _loc4_:ListEvent = null;
         var _loc2_:String = itemToUID(param1.data);
         drawItem(UIDToItemRenderer(_loc2_),isItemSelected(param1.data),false,_loc2_ == caretUID);
         var _loc3_:Point = itemRendererToIndices(param1);
         if(Boolean(_loc3_) && Boolean(lastHighlightItemIndices))
         {
            (_loc4_ = new ListEvent(ListEvent.ITEM_ROLL_OUT)).columnIndex = lastHighlightItemIndices.x;
            _loc4_.rowIndex = lastHighlightItemIndices.y;
            _loc4_.itemRenderer = mx_internal::lastHighlightItemRendererAtIndices;
            dispatchEvent(_loc4_);
            lastHighlightItemIndices = null;
         }
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         if(param1 == _wordWrap)
         {
            return;
         }
         _wordWrap = param1;
         wordWrapChanged = true;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("wordWrapChanged"));
      }
      
      private function shiftSelectionLoop(param1:Boolean, param2:int, param3:Object, param4:Boolean, param5:CursorBookmark) : void
      {
         var data:Object = null;
         var uid:String = null;
         var incr:Boolean = param1;
         var index:int = param2;
         var stopData:Object = param3;
         var transition:Boolean = param4;
         var placeHolder:CursorBookmark = param5;
         try
         {
            do
            {
               data = iterator.current;
               uid = itemToUID(data);
               insertSelectionDataBefore(uid,new mx.controls.listClasses.ListBaseSelectionData(data,index,approximate),firstSelectionData);
               if(UIDToItemRenderer(uid))
               {
                  drawItem(UIDToItemRenderer(uid),true,uid == highlightUID,false,transition);
               }
               if(data === stopData)
               {
                  if(UIDToItemRenderer(uid))
                  {
                     drawItem(UIDToItemRenderer(uid),true,uid == highlightUID,true,transition);
                  }
                  break;
               }
               if(incr)
               {
                  index++;
               }
               else
               {
                  index--;
               }
            }
            while(incr ? iterator.moveNext() : iterator.movePrevious());
            
         }
         catch(e:ItemPendingError)
         {
            e.addResponder(new ItemResponder(selectionPendingResultHandler,selectionPendingFailureHandler,new ListBaseSelectionPending(incr,index,stopData,transition,placeHolder,CursorBookmark.CURRENT,0)));
            iteratorValid = false;
         }
         try
         {
            iterator.seek(placeHolder,0);
            if(!iteratorValid)
            {
               iteratorValid = true;
               lastSeekPending = null;
            }
         }
         catch(e2:ItemPendingError)
         {
            lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(placeHolder,0);
            e2.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
         }
      }
      
      protected function clearHighlightIndicator(param1:Sprite, param2:mx.controls.listClasses.IListItemRenderer) : void
      {
         if(highlightIndicator)
         {
            Sprite(highlightIndicator).graphics.clear();
         }
      }
      
      protected function truncateRowArrays(param1:int) : void
      {
         listItems.splice(param1);
         rowInfo.splice(param1);
      }
      
      public function get itemRenderer() : IFactory
      {
         return _itemRenderer;
      }
      
      protected function seekPositionSafely(param1:int) : Boolean
      {
         var index:int = param1;
         try
         {
            iterator.seek(CursorBookmark.FIRST,index);
            if(!iteratorValid)
            {
               iteratorValid = true;
               lastSeekPending = null;
            }
         }
         catch(e:ItemPendingError)
         {
            lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,index);
            e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
            iteratorValid = false;
         }
         return iteratorValid;
      }
      
      mx_internal function set $horizontalScrollPosition(param1:Number) : void
      {
         var _loc2_:int = super.horizontalScrollPosition;
         if(_loc2_ != param1)
         {
            super.horizontalScrollPosition = param1;
         }
      }
      
      protected function applySelectionEffect(param1:Sprite, param2:String, param3:mx.controls.listClasses.IListItemRenderer) : void
      {
         var _loc5_:Function = null;
         var _loc4_:Number;
         if((_loc4_ = getStyle("selectionDuration")) != 0)
         {
            param1.alpha = 0;
            selectionTweens[param2] = new Tween(param1,0,1,_loc4_,5);
            selectionTweens[param2].addEventListener(TweenEvent.TWEEN_UPDATE,mx_internal::selectionTween_updateHandler);
            selectionTweens[param2].addEventListener(TweenEvent.TWEEN_END,mx_internal::selectionTween_endHandler);
            selectionTweens[param2].setTweenHandlers(onSelectionTweenUpdate,onSelectionTweenUpdate);
            if((_loc5_ = getStyle("selectionEasingFunction") as Function) != null)
            {
               selectionTweens[param2].easingFunction = _loc5_;
            }
         }
      }
      
      override public function set showInAutomationHierarchy(param1:Boolean) : void
      {
      }
      
      protected function removeFromRowArrays(param1:int) : void
      {
         listItems.splice(param1,1);
         rowInfo.splice(param1,1);
      }
      
      protected function updateList() : void
      {
         mx_internal::removeClipMask();
         var _loc1_:CursorBookmark = !!iterator ? iterator.bookmark : null;
         clearIndicators();
         clearVisibleData();
         if(iterator)
         {
            if(Boolean(offscreenExtraColumns) || Boolean(offscreenExtraColumnsLeft) || Boolean(offscreenExtraColumnsRight))
            {
               makeRowsAndColumnsWithExtraColumns(unscaledWidth,unscaledHeight);
            }
            else
            {
               makeRowsAndColumnsWithExtraRows(unscaledWidth,unscaledHeight);
            }
            iterator.seek(_loc1_,0);
         }
         else
         {
            makeRowsAndColumns(0,0,listContent.width,listContent.height,0,0);
         }
         drawRowBackgrounds();
         configureScrollBars();
         mx_internal::addClipMask(true);
      }
      
      public function set variableRowHeight(param1:Boolean) : void
      {
         _variableRowHeight = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("variableRowHeightChanged"));
      }
      
      protected function isRendererUnconstrained(param1:Object) : Boolean
      {
         return false;
      }
      
      public function set selectedIndices(param1:Array) : void
      {
         if(!collection || false)
         {
            _selectedIndices = param1;
            bSelectedIndicesChanged = true;
            mx_internal::bSelectionChanged = true;
            invalidateDisplayList();
            return;
         }
         mx_internal::commitSelectedIndices(param1);
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:Point = null;
         var _loc4_:ListEvent = null;
         mouseDownPoint = null;
         _loc2_ = mouseEventToItemRenderer(param1);
         _loc3_ = itemRendererToIndices(_loc2_);
         mouseIsUp();
         if(!enabled || !selectable)
         {
            return;
         }
         if(mouseDownItem)
         {
            (_loc4_ = new ListEvent(ListEvent.CHANGE)).itemRenderer = mouseDownItem;
            _loc3_ = itemRendererToIndices(mouseDownItem);
            if(_loc3_)
            {
               _loc4_.columnIndex = _loc3_.x;
               _loc4_.rowIndex = _loc3_.y;
            }
            dispatchEvent(_loc4_);
            mouseDownItem = null;
         }
         if(!_loc2_ || !hitTestPoint(param1.stageX,param1.stageY))
         {
            mx_internal::isPressed = false;
            return;
         }
         if(mx_internal::bSelectOnRelease)
         {
            mx_internal::bSelectOnRelease = false;
            if(selectItem(_loc2_,param1.shiftKey,param1.ctrlKey))
            {
               (_loc4_ = new ListEvent(ListEvent.CHANGE)).itemRenderer = _loc2_;
               if(_loc3_)
               {
                  _loc4_.columnIndex = _loc3_.x;
                  _loc4_.rowIndex = _loc3_.y;
               }
               dispatchEvent(_loc4_);
            }
         }
         mx_internal::isPressed = false;
      }
      
      public function get allowMultipleSelection() : Boolean
      {
         return _allowMultipleSelection;
      }
      
      public function itemToItemRenderer(param1:Object) : mx.controls.listClasses.IListItemRenderer
      {
         return UIDToItemRenderer(itemToUID(param1));
      }
      
      public function isItemSelected(param1:Object) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1 is String)
         {
            return selectedData[param1] != undefined;
         }
         return selectedData[itemToUID(param1)] != undefined;
      }
      
      protected function dragScroll() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:ScrollEvent = null;
         var _loc1_:Number = 0;
         if(mx_internal::dragScrollingInterval == 0)
         {
            return;
         }
         var _loc6_:Number = 30;
         _loc3_ = verticalScrollPosition;
         if(false)
         {
            _loc1_ = viewMetrics.top + (variableRowHeight ? getStyle("fontSize") / 4 : rowHeight);
         }
         clearInterval(mx_internal::dragScrollingInterval);
         if(mouseY < _loc1_)
         {
            verticalScrollPosition = Math.max(0,_loc3_ - 1);
            if(false)
            {
               _loc2_ = 100;
            }
            else
            {
               _loc4_ = Math.min(0 - mouseY - 30,0);
               _loc2_ = 0.593 * _loc4_ * _loc4_ + 1 + _loc6_;
            }
            mx_internal::dragScrollingInterval = setInterval(dragScroll,_loc2_);
            if(_loc3_ != verticalScrollPosition)
            {
               (_loc5_ = new ScrollEvent(ScrollEvent.SCROLL)).detail = ScrollEventDetail.THUMB_POSITION;
               _loc5_.direction = ScrollEventDirection.VERTICAL;
               _loc5_.position = verticalScrollPosition;
               _loc5_.delta = verticalScrollPosition - _loc3_;
               dispatchEvent(_loc5_);
            }
         }
         else if(mouseY > unscaledHeight - _loc1_)
         {
            verticalScrollPosition = Math.min(maxVerticalScrollPosition,verticalScrollPosition + 1);
            if(false)
            {
               _loc2_ = 100;
            }
            else
            {
               _loc4_ = Math.min(mouseY - unscaledHeight - 30,0);
               _loc2_ = 0.593 * _loc4_ * _loc4_ + 1 + _loc6_;
            }
            mx_internal::dragScrollingInterval = setInterval(dragScroll,_loc2_);
            if(_loc3_ != verticalScrollPosition)
            {
               (_loc5_ = new ScrollEvent(ScrollEvent.SCROLL)).detail = ScrollEventDetail.THUMB_POSITION;
               _loc5_.direction = ScrollEventDirection.VERTICAL;
               _loc5_.position = verticalScrollPosition;
               _loc5_.delta = verticalScrollPosition - _loc3_;
               dispatchEvent(_loc5_);
            }
         }
         else
         {
            mx_internal::dragScrollingInterval = setInterval(dragScroll,15);
         }
         if(false && mx_internal::lastDragEvent && _loc3_ != verticalScrollPosition)
         {
            dragOverHandler(mx_internal::lastDragEvent);
         }
      }
      
      protected function moveSelectionHorizontally(param1:uint, param2:Boolean, param3:Boolean) : void
      {
      }
      
      private function findStringLoop(param1:String, param2:CursorBookmark, param3:int, param4:int) : Boolean
      {
         var itmStr:String = null;
         var item:mx.controls.listClasses.IListItemRenderer = null;
         var pt:Point = null;
         var evt:ListEvent = null;
         var more:Boolean = false;
         var str:String = param1;
         var cursorPos:CursorBookmark = param2;
         var i:int = param3;
         var stopIndex:int = param4;
         while(i != stopIndex)
         {
            itmStr = itemToLabel(iterator.current);
            itmStr = itmStr.substring(0,str.length);
            if(str == itmStr || str.toUpperCase() == itmStr.toUpperCase())
            {
               iterator.seek(cursorPos,0);
               scrollToIndex(i);
               mx_internal::commitSelectedIndex(i);
               item = indexToItemRenderer(i);
               pt = itemRendererToIndices(item);
               evt = new ListEvent(ListEvent.CHANGE);
               evt.itemRenderer = item;
               if(pt)
               {
                  evt.columnIndex = pt.x;
                  evt.rowIndex = pt.y;
               }
               dispatchEvent(evt);
               return true;
            }
            try
            {
               more = iterator.moveNext();
            }
            catch(e1:ItemPendingError)
            {
               e1.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,CursorBookmark.CURRENT,1,i + 1,stopIndex)));
               iteratorValid = false;
               return false;
            }
            if(!more && stopIndex != collection.length)
            {
               i = -1;
               try
               {
                  iterator.seek(CursorBookmark.FIRST,0);
               }
               catch(e2:ItemPendingError)
               {
                  e2.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,CursorBookmark.FIRST,0,0,stopIndex)));
                  iteratorValid = false;
                  return false;
               }
            }
            i++;
         }
         iterator.seek(cursorPos,0);
         iteratorValid = true;
         return false;
      }
      
      protected function drawRowBackgrounds() : void
      {
      }
      
      private function selectionIndicesPendingResultHandler(param1:Object, param2:ListBaseSelectionDataPending) : void
      {
         if(param2.bookmark)
         {
            iterator.seek(param2.bookmark,param2.offset);
         }
         setSelectionIndicesLoop(param2.index,param2.items,param2.useFind);
      }
      
      public function itemRendererContains(param1:mx.controls.listClasses.IListItemRenderer, param2:DisplayObject) : Boolean
      {
         if(!param2)
         {
            return false;
         }
         if(!param1)
         {
            return false;
         }
         return param1.owns(param2);
      }
      
      public function removeDataEffectItem(param1:Object) : void
      {
         if(modifiedCollectionView)
         {
            modifiedCollectionView.removeItem(dataItemWrappersByRenderer[param1]);
            iterator.seek(CursorBookmark.CURRENT);
            if(mx_internal::invalidateDisplayListFlag)
            {
               callLater(invalidateList);
            }
            else
            {
               invalidateList();
            }
         }
      }
      
      public function itemRendererToIndex(param1:mx.controls.listClasses.IListItemRenderer) : int
      {
         var _loc2_:int = 0;
         if(param1.name in rowMap)
         {
            _loc2_ = int(rowMap[param1.name].rowIndex);
            return _loc2_ + verticalScrollPosition - offscreenExtraRowsTop;
         }
         return int.MIN_VALUE;
      }
      
      override public function set horizontalScrollPolicy(param1:String) : void
      {
         super.horizontalScrollPolicy = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      public function get dropEnabled() : Boolean
      {
         return _dropEnabled;
      }
      
      private function setSelectionIndicesLoop(param1:int, param2:Array, param3:Boolean = false) : void
      {
         var data:Object = null;
         var uid:String = null;
         var index:int = param1;
         var indices:Array = param2;
         var firstTime:Boolean = param3;
         while(indices.length)
         {
            if(index != indices[0])
            {
               try
               {
                  mx_internal::collectionIterator.seek(CursorBookmark.CURRENT,indices[0] - index);
               }
               catch(e:ItemPendingError)
               {
                  e.addResponder(new ItemResponder(selectionIndicesPendingResultHandler,selectionIndicesPendingFailureHandler,new ListBaseSelectionDataPending(firstTime,index,indices,CursorBookmark.CURRENT,indices[0] - index)));
                  return;
               }
            }
            index = int(indices[0]);
            indices.shift();
            data = mx_internal::collectionIterator.current;
            if(firstTime)
            {
               mx_internal::_selectedIndex = index;
               _selectedItem = data;
               caretIndex = index;
               caretBookmark = mx_internal::collectionIterator.bookmark;
               anchorIndex = index;
               anchorBookmark = mx_internal::collectionIterator.bookmark;
               firstTime = false;
            }
            uid = itemToUID(data);
            insertSelectionDataAfter(uid,new mx.controls.listClasses.ListBaseSelectionData(data,index,false),lastSelectionData);
            if(UIDToItemRenderer(uid))
            {
               drawItem(UIDToItemRenderer(uid),true,uid == highlightUID,caretIndex == index);
            }
         }
         if(initialized)
         {
            updateList();
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:EdgeMetrics = viewMetrics;
         var _loc2_:int = explicitColumnCount < 1 ? defaultColumnCount : explicitColumnCount;
         var _loc3_:int = explicitRowCount < 1 ? defaultRowCount : explicitRowCount;
         if(!isNaN(explicitRowHeight))
         {
            measuredHeight = explicitRowHeight * _loc3_ + _loc1_.top + _loc1_.bottom;
            measuredMinHeight = explicitRowHeight * Math.min(_loc3_,2) + _loc1_.top + _loc1_.bottom;
         }
         else
         {
            measuredHeight = rowHeight * _loc3_ + _loc1_.top + _loc1_.bottom;
            measuredMinHeight = rowHeight * Math.min(_loc3_,2) + _loc1_.top + _loc1_.bottom;
         }
         if(!isNaN(explicitColumnWidth))
         {
            measuredWidth = explicitColumnWidth * _loc2_ + _loc1_.left + _loc1_.right;
            measuredMinWidth = explicitColumnWidth * Math.min(_loc2_,1) + _loc1_.left + _loc1_.right;
         }
         else
         {
            measuredWidth = columnWidth * _loc2_ + _loc1_.left + _loc1_.right;
            measuredMinWidth = columnWidth * Math.min(_loc2_,1) + _loc1_.left + _loc1_.right;
         }
         if(verticalScrollPolicy == ScrollPolicy.AUTO && verticalScrollBar && false)
         {
            measuredWidth -= 0;
            measuredMinWidth -= 0;
         }
         if(horizontalScrollPolicy == ScrollPolicy.AUTO && horizontalScrollBar && false)
         {
            measuredHeight -= 0;
            measuredMinHeight -= 0;
         }
      }
      
      [Bindable("dataChange")]
      public function get listData() : mx.controls.listClasses.BaseListData
      {
         return _listData;
      }
      
      private function removeSelectionData(param1:String) : void
      {
         var _loc2_:mx.controls.listClasses.ListBaseSelectionData = selectedData[param1];
         if(firstSelectionData == _loc2_)
         {
            firstSelectionData = _loc2_.mx_internal::nextSelectionData;
         }
         if(lastSelectionData == _loc2_)
         {
            lastSelectionData = _loc2_.mx_internal::prevSelectionData;
         }
         if(_loc2_.mx_internal::prevSelectionData != null)
         {
            _loc2_.mx_internal::prevSelectionData.mx_internal::nextSelectionData = _loc2_.mx_internal::nextSelectionData;
         }
         if(_loc2_.mx_internal::nextSelectionData != null)
         {
            _loc2_.mx_internal::nextSelectionData.mx_internal::prevSelectionData = _loc2_.mx_internal::prevSelectionData;
         }
         delete selectedData[param1];
      }
      
      protected function setRowHeight(param1:Number) : void
      {
         _rowHeight = param1;
      }
      
      public function indicesToIndex(param1:int, param2:int) : int
      {
         return param1 * columnCount + param2;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get value() : Object
      {
         var _loc1_:Object = selectedItem;
         if(!_loc1_)
         {
            return null;
         }
         if(typeof _loc1_ != "object")
         {
            return _loc1_;
         }
         return _loc1_.data != null ? _loc1_.data : _loc1_.label;
      }
      
      mx_internal function getRowInfo() : Array
      {
         return rowInfo;
      }
      
      private function rendererMoveHandler(param1:MoveEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         if(!rendererTrackingSuspended)
         {
            _loc2_ = param1.currentTarget as mx.controls.listClasses.IListItemRenderer;
            drawItem(_loc2_,true);
         }
      }
      
      protected function calculateDropIndicatorY(param1:Number, param2:int) : Number
      {
         var _loc3_:int = 0;
         var _loc4_:Number = 0;
         if(param1 && param2 < param1 && Boolean(listItems[param2].length) && Boolean(listItems[param2][0]))
         {
            return listItems[param2][0].y - 1;
         }
         _loc3_ = 0;
         while(_loc3_ < param1)
         {
            if(!listItems[_loc3_].length)
            {
               break;
            }
            _loc4_ += rowInfo[_loc3_].height;
            _loc3_++;
         }
         return _loc4_;
      }
      
      protected function clearCaretIndicator(param1:Sprite, param2:mx.controls.listClasses.IListItemRenderer) : void
      {
         if(caretIndicator)
         {
            Sprite(caretIndicator).graphics.clear();
         }
      }
      
      override public function validateDisplayList() : void
      {
         var _loc1_:ISystemManager = null;
         if(mx_internal::invalidateDisplayListFlag)
         {
            _loc1_ = parent as ISystemManager;
            if(_loc1_)
            {
               if(_loc1_ == systemManager.topLevelSystemManager && _loc1_.document != this)
               {
                  setActualSize(getExplicitOrMeasuredWidth(),getExplicitOrMeasuredHeight());
               }
            }
            if(runDataEffectNextUpdate)
            {
               runDataEffectNextUpdate = false;
               runningDataEffect = true;
               initiateDataChangeEffect(scaleX == 0 ? 0 : width / scaleX,scaleY == 0 ? 0 : height / scaleY);
            }
            else
            {
               updateDisplayList(scaleX == 0 ? 0 : width / scaleX,scaleY == 0 ? 0 : height / scaleY);
            }
            mx_internal::invalidateDisplayListFlag = false;
         }
      }
      
      mx_internal function getListVisibleData() : Object
      {
         return visibleData;
      }
      
      public function getRendererSemanticValue(param1:Object, param2:String) : Object
      {
         return modifiedCollectionView.getSemantics(dataItemWrappersByRenderer[param1]) == param2;
      }
      
      mx_internal function setColumnCount(param1:int) : void
      {
         _columnCount = param1;
      }
      
      mx_internal function hasOnlyTextRenderers() : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc1_:Array = listItems[-1];
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(!(_loc1_[_loc3_] is IUITextField))
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      protected function sumRowHeights(param1:int, param2:int) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:int = param1;
         while(_loc4_ <= param2)
         {
            _loc3_ += rowInfo[_loc4_].height;
            _loc4_++;
         }
         return _loc3_;
      }
      
      protected function get rowInfo() : Array
      {
         return listContent.rowInfo;
      }
      
      private function selectionPendingFailureHandler(param1:Object, param2:ListBaseSelectionPending) : void
      {
      }
      
      mx_internal function convertIndexToColumn(param1:int) : int
      {
         return indexToColumn(param1);
      }
      
      mx_internal function createItemMask(param1:Number, param2:Number, param3:Number, param4:Number, param5:DisplayObjectContainer = null) : DisplayObject
      {
         var _loc6_:Shape = null;
         var _loc7_:Graphics = null;
         if(!mx_internal::itemMaskFreeList)
         {
            mx_internal::itemMaskFreeList = [];
         }
         if(false)
         {
            if((_loc6_ = mx_internal::itemMaskFreeList.pop()).width != param3)
            {
               _loc6_.width = param3;
            }
            if(_loc6_.height != param4)
            {
               _loc6_.height = param4;
            }
         }
         else
         {
            (_loc6_ = new FlexShape()).name = "mask";
            (_loc7_ = _loc6_.graphics).beginFill(16777215);
            _loc7_.drawRect(0,0,param3,param4);
            _loc7_.endFill();
            _loc6_.visible = false;
            if(param5)
            {
               param5.addChild(_loc6_);
            }
            else
            {
               listContent.addChild(_loc6_);
            }
         }
         if(_loc6_.x != param1)
         {
            _loc6_.x = param1;
         }
         if(_loc6_.y != param2)
         {
            _loc6_.y = param2;
         }
         return _loc6_;
      }
      
      mx_internal function convertIndexToRow(param1:int) : int
      {
         return indexToRow(param1);
      }
      
      protected function get listItems() : Array
      {
         return !!listContent ? listContent.listItems : [];
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.commitProperties();
         if(Boolean(listContent) && listContent.iterator != iterator)
         {
            listContent.iterator = iterator;
         }
         if(cachedPaddingTopInvalid)
         {
            cachedPaddingTopInvalid = false;
            mx_internal::cachedPaddingTop = getStyle("paddingTop");
            itemsSizeChanged = true;
            invalidateDisplayList();
         }
         if(cachedPaddingBottomInvalid)
         {
            cachedPaddingBottomInvalid = false;
            mx_internal::cachedPaddingBottom = getStyle("paddingBottom");
            itemsSizeChanged = true;
            invalidateDisplayList();
         }
         if(cachedVerticalAlignInvalid)
         {
            cachedVerticalAlignInvalid = false;
            mx_internal::cachedVerticalAlign = getStyle("verticalAlign");
            itemsSizeChanged = true;
            invalidateDisplayList();
         }
         if(columnCountChanged)
         {
            if(_columnCount < 1)
            {
               _columnCount = defaultColumnCount;
            }
            if(!isNaN(explicitWidth) && isNaN(explicitColumnWidth) && explicitColumnCount > 0)
            {
               mx_internal::setColumnWidth((explicitWidth - 0 - 0) / columnCount);
            }
            columnCountChanged = false;
         }
         if(rowCountChanged)
         {
            if(_rowCount < 1)
            {
               _rowCount = defaultRowCount;
            }
            if(!isNaN(explicitHeight) && isNaN(explicitRowHeight) && explicitRowCount > 0)
            {
               setRowHeight((explicitHeight - 0 - 0) / rowCount);
            }
            rowCountChanged = false;
         }
         if(offscreenExtraRowsOrColumnsChanged)
         {
            mx_internal::adjustOffscreenRowsAndColumns();
            if(iterator)
            {
               _loc1_ = Math.min(offscreenExtraColumns / 2,horizontalScrollPosition);
               _loc2_ = Math.min(offscreenExtraRows / 2,verticalScrollPosition);
               _loc3_ = scrollPositionToIndex(horizontalScrollPosition - _loc1_,verticalScrollPosition - _loc2_);
               seekPositionSafely(_loc3_);
               invalidateList();
            }
            offscreenExtraRowsOrColumnsChanged = false;
         }
      }
      
      protected function setRowCount(param1:int) : void
      {
         _rowCount = param1;
      }
      
      public function set labelFunction(param1:Function) : void
      {
         _labelFunction = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("labelFunctionChanged"));
      }
      
      protected function adjustAfterAdd(param1:Array, param2:int) : Boolean
      {
         var length:int = 0;
         var requiresValueCommit:Boolean = false;
         var data:mx.controls.listClasses.ListBaseSelectionData = null;
         var placeHolder:CursorBookmark = null;
         var p:String = null;
         var items:Array = param1;
         var location:int = param2;
         length = int(items.length);
         requiresValueCommit = false;
         for(p in selectedData)
         {
            data = selectedData[p];
            if(data.index >= location)
            {
               data.index += length;
            }
         }
         if(mx_internal::_selectedIndex >= location)
         {
            mx_internal::_selectedIndex += length;
            requiresValueCommit = true;
         }
         if(anchorIndex >= location)
         {
            anchorIndex += length;
            placeHolder = iterator.bookmark;
            try
            {
               iterator.seek(CursorBookmark.FIRST,anchorIndex);
               anchorBookmark = iterator.bookmark;
            }
            catch(e:ItemPendingError)
            {
               e.addResponder(new ItemResponder(mx_internal::setBookmarkPendingResultHandler,mx_internal::setBookmarkPendingFailureHandler,{
                  "property":"anchorBookmark",
                  "value":anchorIndex
               }));
            }
            iterator.seek(placeHolder);
         }
         if(caretIndex >= location)
         {
            caretIndex += length;
            placeHolder = iterator.bookmark;
            try
            {
               iterator.seek(CursorBookmark.FIRST,caretIndex);
               caretBookmark = iterator.bookmark;
            }
            catch(e:ItemPendingError)
            {
               e.addResponder(new ItemResponder(mx_internal::setBookmarkPendingResultHandler,mx_internal::setBookmarkPendingFailureHandler,{
                  "property":"caretBookmark",
                  "value":caretIndex
               }));
            }
            iterator.seek(placeHolder);
         }
         return requiresValueCommit;
      }
      
      private function mouseLeaveHandler(param1:Event) : void
      {
         var _loc2_:ListEvent = null;
         var _loc3_:Point = null;
         mouseDownPoint = null;
         mouseIsUp();
         if(!enabled || !selectable)
         {
            return;
         }
         if(mouseDownItem)
         {
            _loc2_ = new ListEvent(ListEvent.CHANGE);
            _loc2_.itemRenderer = mouseDownItem;
            _loc3_ = itemRendererToIndices(mouseDownItem);
            if(_loc3_)
            {
               _loc2_.columnIndex = _loc3_.x;
               _loc2_.rowIndex = _loc3_.y;
            }
            dispatchEvent(_loc2_);
            mouseDownItem = null;
         }
         mx_internal::isPressed = false;
      }
      
      public function unconstrainRenderer(param1:Object) : void
      {
         unconstrainedRenderers[param1] = true;
      }
      
      mx_internal function getIterator() : IViewCursor
      {
         return iterator;
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedItems() : Array
      {
         return bSelectedItemsChanged ? _selectedItems : copySelectedItems();
      }
      
      protected function findKey(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         return _loc2_ >= 33 && _loc2_ <= 126 && findString(String.fromCharCode(_loc2_));
      }
      
      override public function set verticalScrollPolicy(param1:String) : void
      {
         super.verticalScrollPolicy = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(!collection || false)
         {
            mx_internal::_selectedIndex = param1;
            mx_internal::bSelectionChanged = true;
            mx_internal::bSelectedIndexChanged = true;
            invalidateDisplayList();
            return;
         }
         mx_internal::commitSelectedIndex(param1);
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         _itemRenderer = param1;
         invalidateSize();
         invalidateDisplayList();
         itemsSizeChanged = true;
         rendererChanged = true;
         dispatchEvent(new Event("itemRendererChanged"));
      }
      
      public function hideDropFeedback(param1:DragEvent) : void
      {
         if(mx_internal::dropIndicator)
         {
            DisplayObject(mx_internal::dropIndicator).parent.removeChild(DisplayObject(mx_internal::dropIndicator));
            mx_internal::dropIndicator = null;
            drawFocus(false);
         }
      }
      
      private function commitSelectedItems(param1:Array) : void
      {
         var i:int;
         var n:int;
         var useFind:Boolean = false;
         var uid:String = null;
         var items:Array = param1;
         clearSelected();
         items = items.slice();
         useFind = false;
         try
         {
            mx_internal::collectionIterator.seek(CursorBookmark.FIRST,0);
         }
         catch(e:ItemPendingError)
         {
            e.addResponder(new ItemResponder(mx_internal::selectionDataPendingResultHandler,selectionDataPendingFailureHandler,new ListBaseSelectionDataPending(useFind,0,items,null,0)));
            return;
         }
         n = int(items.length);
         selectionDataArray = new Array(n);
         firstSelectedItem = !!n ? items[0] : null;
         proposedSelectedItemIndexes = new Dictionary();
         i = 0;
         while(i < n)
         {
            uid = itemToUID(items[i]);
            proposedSelectedItemIndexes[uid] = i;
            i++;
         }
         setSelectionDataLoop(items,0,useFind);
      }
      
      public function set dataTipField(param1:String) : void
      {
         _dataTipField = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("dataTipFieldChanged"));
      }
      
      private function makeRowsAndColumnsWithExtraColumns(param1:Number, param2:Number) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:int = offscreenExtraColumns / 2;
         var _loc4_:int = offscreenExtraColumns / 2;
         if(horizontalScrollPosition > 0 - columnCount)
         {
            super.horizontalScrollPosition = Math.max(0,0 - columnCount);
         }
         offscreenExtraColumnsLeft = Math.min(_loc3_,horizontalScrollPosition);
         var _loc5_:int = scrollPositionToIndex(horizontalScrollPosition - offscreenExtraColumnsLeft,verticalScrollPosition);
         seekPositionSafely(_loc5_);
         var _loc6_:CursorBookmark = iterator.bookmark;
         if(offscreenExtraColumnsLeft > 0)
         {
            makeRowsAndColumns(0,0,0,listContent.height,0,0,true,offscreenExtraColumnsLeft);
         }
         var _loc7_:Number = !!offscreenExtraColumnsLeft ? listItems[0][offscreenExtraColumnsLeft - 1].x + columnWidth : 0;
         var _loc8_:Point = makeRowsAndColumns(_loc7_,0,_loc7_ + listContent.widthExcludingOffsets,listContent.height,offscreenExtraColumnsLeft,0);
         if(_loc4_ > 0 && true)
         {
            if(offscreenExtraColumnsLeft + _loc8_.x - 1 < 0)
            {
               _loc7_ = 0;
            }
            else
            {
               _loc7_ = listItems[0][offscreenExtraColumnsLeft + _loc8_.x - 1].x + columnWidth;
            }
            _loc10_ = int(listItems[0].length);
            if((_loc8_ = makeRowsAndColumns(_loc7_,0,_loc7_,listContent.height,offscreenExtraColumnsLeft + _loc8_.x,0,true,_loc4_)).x < _loc4_)
            {
               if(_loc11_ = listItems[0].length - (_loc10_ + _loc8_.x))
               {
                  _loc12_ = 0;
                  while(_loc12_ < listItems.length)
                  {
                     _loc13_ = 0;
                     while(_loc13_ < _loc11_)
                     {
                        listItems[_loc12_].pop();
                        _loc13_++;
                     }
                     _loc12_++;
                  }
               }
            }
            offscreenExtraColumnsRight = _loc8_.x;
         }
         else
         {
            offscreenExtraColumnsRight = 0;
         }
         var _loc9_:Number = 0;
         listContent.leftOffset = -offscreenExtraColumnsLeft * columnWidth;
         listContent.rightOffset = offscreenExtraColumnsRight > 0 ? listItems[0][listItems[0].length - 1].x + columnWidth - _loc9_ + listContent.leftOffset : 0;
         iterator.seek(_loc6_,0);
         adjustListContent(param1,param2);
      }
      
      protected function dragOverHandler(param1:DragEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         mx_internal::lastDragEvent = param1;
         if(enabled && iteratorValid && param1.dragSource.hasFormat("items"))
         {
            DragManager.showFeedback(param1.ctrlKey ? "null" : DragManager.MOVE);
            showDropFeedback(param1);
            return;
         }
         hideDropFeedback(param1);
         DragManager.showFeedback(DragManager.NONE);
      }
      
      private function adjustSelectionSettings(param1:Boolean) : void
      {
         if(mx_internal::bSelectionChanged)
         {
            mx_internal::bSelectionChanged = false;
            if(bSelectedIndicesChanged && (param1 || _selectedIndices == null))
            {
               bSelectedIndicesChanged = false;
               mx_internal::bSelectedIndexChanged = false;
               mx_internal::commitSelectedIndices(_selectedIndices);
            }
            if(bSelectedItemChanged && (param1 || _selectedItem == null))
            {
               bSelectedItemChanged = false;
               mx_internal::bSelectedIndexChanged = false;
               commitSelectedItem(_selectedItem);
            }
            if(bSelectedItemsChanged && (param1 || _selectedItems == null))
            {
               bSelectedItemsChanged = false;
               mx_internal::bSelectedIndexChanged = false;
               commitSelectedItems(_selectedItems);
            }
            if(mx_internal::bSelectedIndexChanged && (param1 || mx_internal::_selectedIndex == -1))
            {
               mx_internal::commitSelectedIndex(mx_internal::_selectedIndex);
               mx_internal::bSelectedIndexChanged = false;
            }
         }
      }
      
      private function clearSelectionData() : void
      {
         selectedData = {};
         firstSelectionData = null;
         lastSelectionData = null;
      }
      
      protected function shiftRow(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc6_:int = 0;
         while(_loc6_ < param3)
         {
            _loc5_ = listItems[param1][_loc6_];
            if(param4)
            {
               listItems[param2][_loc6_] = _loc5_;
               rowMap[_loc5_.name].rowIndex = param2;
            }
            else
            {
               rowMap[_loc5_.name].rowIndex = param1;
            }
            _loc6_++;
         }
         if(param4)
         {
            rowInfo[param2] = rowInfo[param1];
         }
      }
      
      mx_internal function selectionTween_endHandler(param1:TweenEvent) : void
      {
         mx_internal::selectionTween_updateHandler(param1);
      }
      
      mx_internal function resetDragScrolling() : void
      {
         if(mx_internal::dragScrollingInterval != 0)
         {
            clearInterval(mx_internal::dragScrollingInterval);
            mx_internal::dragScrollingInterval = 0;
         }
      }
      
      protected function mouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:ListEvent = null;
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc4_:Point = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:mx.controls.listClasses.BaseListData = null;
         if(!enabled || !selectable)
         {
            return;
         }
         if(mx_internal::dragScrollingInterval != 0 && !param1.buttonDown)
         {
            mouseIsUp();
         }
         mx_internal::isPressed = param1.buttonDown;
         _loc3_ = mouseEventToItemRenderer(param1);
         _loc4_ = itemRendererToIndices(_loc3_);
         if(!_loc3_)
         {
            return;
         }
         _loc5_ = itemToUID(_loc3_.data);
         if(!mx_internal::isPressed || allowDragSelection)
         {
            if(param1.relatedObject)
            {
               if(Boolean(mx_internal::lastHighlightItemRenderer) && Boolean(highlightUID))
               {
                  _loc6_ = (_loc7_ = rowMap[_loc3_.name]).uid;
               }
               if(itemRendererContains(_loc3_,param1.relatedObject) || _loc5_ == _loc6_ || param1.relatedObject == highlightIndicator)
               {
                  return;
               }
            }
            if(getStyle("useRollOver") && _loc3_.data != null)
            {
               if(allowDragSelection)
               {
                  mx_internal::bSelectOnRelease = true;
               }
               drawItem(UIDToItemRenderer(_loc5_),isItemSelected(_loc3_.data),true,_loc5_ == caretUID);
               if(_loc4_)
               {
                  _loc2_ = new ListEvent(ListEvent.ITEM_ROLL_OVER);
                  _loc2_.columnIndex = _loc4_.x;
                  _loc2_.rowIndex = _loc4_.y;
                  _loc2_.itemRenderer = _loc3_;
                  dispatchEvent(_loc2_);
                  lastHighlightItemIndices = _loc4_;
                  mx_internal::lastHighlightItemRendererAtIndices = _loc3_;
               }
            }
         }
         else
         {
            if(false)
            {
               return;
            }
            if(mx_internal::dragScrollingInterval != 0 && allowDragSelection || menuSelectionMode)
            {
               if(selectItem(_loc3_,param1.shiftKey,param1.ctrlKey))
               {
                  _loc2_ = new ListEvent(ListEvent.CHANGE);
                  _loc2_.itemRenderer = _loc3_;
                  if(_loc4_)
                  {
                     _loc2_.columnIndex = _loc4_.x;
                     _loc2_.rowIndex = _loc4_.y;
                  }
                  dispatchEvent(_loc2_);
               }
            }
         }
      }
      
      protected function mouseClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:Point = null;
         var _loc4_:ListEvent = null;
         _loc2_ = mouseEventToItemRenderer(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc3_ = itemRendererToIndices(_loc2_);
         if(_loc3_)
         {
            (_loc4_ = new ListEvent(ListEvent.ITEM_CLICK)).columnIndex = _loc3_.x;
            _loc4_.rowIndex = _loc3_.y;
            _loc4_.itemRenderer = _loc2_;
            dispatchEvent(_loc4_);
         }
      }
      
      private function selectionIndicesPendingFailureHandler(param1:Object, param2:ListBaseSelectionDataPending) : void
      {
      }
      
      protected function finishKeySelection() : void
      {
         var _loc1_:String = null;
         var _loc5_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc7_:Point = null;
         var _loc8_:ListEvent = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0 - offscreenExtraRowsTop - offscreenExtraRowsBottom;
         var _loc4_:int = rowInfo[_loc2_ - offscreenExtraRowsBottom - 1].y + rowInfo[_loc2_ - offscreenExtraRowsBottom - 1].height > 0 - 0 ? 1 : 0;
         if(lastKey == Keyboard.PAGE_DOWN)
         {
            if(_loc3_ - _loc4_ == 0)
            {
               caretIndex = Math.min(verticalScrollPosition + _loc3_ - _loc4_,-1);
            }
            else
            {
               caretIndex = Math.min(verticalScrollPosition + _loc3_ - _loc4_ - 1,-1);
            }
         }
         var _loc6_:Boolean = false;
         if(bSelectItem && caretIndex - verticalScrollPosition >= 0)
         {
            if(caretIndex - verticalScrollPosition > Math.max(_loc3_ - _loc4_ - 1,0))
            {
               if(lastKey == Keyboard.END && maxVerticalScrollPosition > verticalScrollPosition)
               {
                  --caretIndex;
                  moveSelectionVertically(lastKey,bShiftKey,bCtrlKey);
                  return;
               }
               caretIndex = _loc3_ - _loc4_ - 1 + verticalScrollPosition;
            }
            if(_loc5_ = listItems[caretIndex - verticalScrollPosition + offscreenExtraRowsTop][0])
            {
               _loc1_ = itemToUID(_loc5_.data);
               _loc5_ = UIDToItemRenderer(_loc1_);
               if(!bCtrlKey || lastKey == Keyboard.SPACE)
               {
                  selectItem(_loc5_,bShiftKey,bCtrlKey);
                  _loc6_ = true;
               }
               if(bCtrlKey)
               {
                  drawItem(_loc5_,false,_loc1_ == highlightUID,true);
               }
            }
         }
         if(_loc6_)
         {
            _loc7_ = itemRendererToIndices(_loc5_);
            _loc8_ = new ListEvent(ListEvent.CHANGE);
            if(_loc7_)
            {
               _loc8_.columnIndex = _loc7_.x;
               _loc8_.rowIndex = _loc7_.y;
            }
            _loc8_.itemRenderer = _loc5_;
            dispatchEvent(_loc8_);
         }
      }
      
      private function selectionDataPendingFailureHandler(param1:Object, param2:ListBaseSelectionDataPending) : void
      {
      }
      
      mx_internal function addClipMask(param1:Boolean) : void
      {
         var _loc10_:DisplayObject = null;
         var _loc11_:Number = NaN;
         if(param1)
         {
            if(horizontalScrollBar && false || mx_internal::hasOnlyTextRenderers() || runningDataEffect || true || true || true || true)
            {
               listContent.mask = maskShape;
               selectionLayer.mask = null;
            }
            else
            {
               listContent.mask = null;
               selectionLayer.mask = maskShape;
            }
         }
         if(false)
         {
            return;
         }
         var _loc2_:int = -1;
         var _loc3_:ListRowInfo = rowInfo[_loc2_];
         var _loc4_:Array = listItems[_loc2_];
         if(_loc3_.y + _loc3_.height <= listContent.height)
         {
            return;
         }
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:Number = _loc3_.y;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0 - _loc3_.y;
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc11_ = (_loc10_ = _loc4_[_loc9_]).y - _loc6_;
            if(_loc10_ is IUITextField)
            {
               _loc10_.height = _loc8_ - _loc11_;
            }
            else
            {
               _loc10_.mask = mx_internal::createItemMask(0,_loc6_ + _loc11_,_loc7_,_loc8_ - _loc11_);
            }
            _loc9_++;
         }
      }
      
      public function set allowMultipleSelection(param1:Boolean) : void
      {
         _allowMultipleSelection = param1;
      }
      
      protected function scrollVertically(param1:int, param2:int, param3:Boolean) : void
      {
         var i:int = 0;
         var j:int = 0;
         var numRows:int = 0;
         var numCols:int = 0;
         var uid:String = null;
         var curY:Number = NaN;
         var cursorPos:CursorBookmark = null;
         var discardRows:int = 0;
         var desiredoffscreenExtraRowsTop:int = 0;
         var newoffscreenExtraRowsTop:int = 0;
         var offscreenExtraRowsBottomToMake:int = 0;
         var newTopOffset:Number = NaN;
         var fillHeight:Number = NaN;
         var pt:Point = null;
         var rowIdx:int = 0;
         var modDeltaPos:int = 0;
         var desiredPrefixItems:int = 0;
         var actual:Point = null;
         var row:Array = null;
         var rowData:Object = null;
         var desiredSuffixItems:int = 0;
         var newOffscreenRows:int = 0;
         var visibleAreaBottomY:int = 0;
         var pos:int = param1;
         var deltaPos:int = param2;
         var scrollUp:Boolean = param3;
         var rowCount:int = 0;
         var columnCount:int = int(listItems[0].length);
         var moveBlockDistance:Number = 0;
         var listContentVisibleHeight:Number = 0;
         if(scrollUp)
         {
            discardRows = deltaPos;
            desiredoffscreenExtraRowsTop = offscreenExtraRows / 2;
            newoffscreenExtraRowsTop = Math.min(desiredoffscreenExtraRowsTop,offscreenExtraRowsTop + deltaPos);
            if(offscreenExtraRowsTop < desiredoffscreenExtraRowsTop)
            {
               discardRows = Math.max(0,deltaPos - (desiredoffscreenExtraRowsTop - offscreenExtraRowsTop));
            }
            moveBlockDistance = sumRowHeights(0,discardRows - 1);
            i = 0;
            while(i < discardRows)
            {
               if(!seekNextSafely(iterator,pos))
               {
                  return;
               }
               i++;
            }
            i = 0;
            while(i < rowCount)
            {
               numCols = int(listItems[i].length);
               if(i < discardRows)
               {
                  destroyRow(i,numCols);
               }
               else if(discardRows > 0)
               {
                  moveRowVertically(i,numCols,-moveBlockDistance);
                  moveIndicatorsVertically(rowInfo[i].uid,-moveBlockDistance);
                  shiftRow(i,i - discardRows,numCols,true);
                  if(listItems[i].length == 0)
                  {
                     listItems[i - discardRows].splice(0);
                  }
               }
               i++;
            }
            if(discardRows)
            {
               truncateRowArrays(rowCount - discardRows);
            }
            curY = rowInfo[rowCount - discardRows - 1].y + rowInfo[rowCount - discardRows - 1].height;
            cursorPos = iterator.bookmark;
            try
            {
               iterator.seek(CursorBookmark.CURRENT,rowCount - discardRows);
               if(!iteratorValid)
               {
                  iteratorValid = true;
                  lastSeekPending = null;
               }
            }
            catch(e1:ItemPendingError)
            {
               lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(cursorPos,0);
               e1.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
               iteratorValid = false;
            }
            offscreenExtraRowsBottomToMake = offscreenExtraRows / 2;
            newTopOffset = 0;
            i = 0;
            while(i < newoffscreenExtraRowsTop)
            {
               newTopOffset -= rowInfo[i].height;
               i++;
            }
            fillHeight = listContentVisibleHeight - (curY + newTopOffset);
            if(fillHeight > 0)
            {
               pt = makeRowsAndColumns(0,curY,listContent.width,curY + fillHeight,0,rowCount - discardRows);
               rowCount += pt.y;
            }
            else
            {
               rowIdx = rowCount - discardRows - 1;
               fillHeight += rowInfo[rowIdx--].height;
               while(fillHeight < 0)
               {
                  offscreenExtraRowsBottomToMake--;
                  fillHeight += rowInfo[rowIdx--].height;
               }
            }
            if(offscreenExtraRowsBottomToMake > 0)
            {
               if(pt)
               {
                  curY = rowInfo[rowCount - discardRows - 1].y + rowInfo[rowCount - discardRows - 1].height;
               }
               pt = makeRowsAndColumns(0,curY,listContent.width,listContent.height,0,rowCount - discardRows,true,offscreenExtraRowsBottomToMake);
            }
            else
            {
               pt = new Point(0,0);
            }
            try
            {
               iterator.seek(cursorPos,0);
            }
            catch(e2:ItemPendingError)
            {
               lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(cursorPos,0);
               e2.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
               iteratorValid = false;
            }
            offscreenExtraRowsTop = newoffscreenExtraRowsTop;
            offscreenExtraRowsBottom = offscreenExtraRows / 2 - offscreenExtraRowsBottomToMake + pt.y;
         }
         else
         {
            curY = 0;
            modDeltaPos = deltaPos;
            desiredPrefixItems = offscreenExtraRows / 2;
            if(pos < desiredPrefixItems)
            {
               modDeltaPos -= desiredPrefixItems - pos;
            }
            i = 0;
            while(i < modDeltaPos)
            {
               addToRowArrays();
               i++;
            }
            actual = new Point(0,0);
            if(modDeltaPos > 0)
            {
               try
               {
                  iterator.seek(CursorBookmark.CURRENT,-modDeltaPos);
                  if(!iteratorValid)
                  {
                     iteratorValid = true;
                     lastSeekPending = null;
                  }
               }
               catch(e3:ItemPendingError)
               {
                  lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.CURRENT,-modDeltaPos);
                  e3.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                  iteratorValid = false;
               }
               cursorPos = iterator.bookmark;
               mx_internal::allowRendererStealingDuringLayout = false;
               actual = makeRowsAndColumns(0,curY,listContent.width,listContent.height,0,0,true,modDeltaPos);
               mx_internal::allowRendererStealingDuringLayout = true;
               try
               {
                  iterator.seek(cursorPos,0);
               }
               catch(e4:ItemPendingError)
               {
                  lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(cursorPos,0);
                  e4.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                  iteratorValid = false;
               }
            }
            if(actual.y == 0 && modDeltaPos > 0)
            {
               verticalScrollPosition = 0;
               restoreRowArrays(modDeltaPos);
            }
            moveBlockDistance = sumRowHeights(0,actual.y - 1);
            desiredSuffixItems = offscreenExtraRows / 2;
            newOffscreenRows = 0;
            visibleAreaBottomY = listContentVisibleHeight + sumRowHeights(0,Math.min(desiredPrefixItems,pos) - 1);
            i = actual.y;
            while(i < listItems.length)
            {
               row = listItems[i];
               rowData = rowInfo[i];
               moveRowVertically(i,listItems[i].length,moveBlockDistance);
               if(rowData.y >= visibleAreaBottomY)
               {
                  newOffscreenRows++;
                  if(newOffscreenRows > desiredSuffixItems)
                  {
                     destroyRow(i,listItems[i].length);
                     removeFromRowArrays(i);
                     i--;
                  }
                  else
                  {
                     shiftRow(i,i + deltaPos,listItems[i].length,false);
                     moveIndicatorsVertically(rowInfo[i].uid,moveBlockDistance);
                  }
               }
               else
               {
                  shiftRow(i,i + deltaPos,listItems[i].length,false);
                  moveIndicatorsVertically(rowInfo[i].uid,moveBlockDistance);
               }
               i++;
            }
            rowCount = 0;
            offscreenExtraRowsTop = Math.min(desiredPrefixItems,pos);
            offscreenExtraRowsBottom = Math.min(newOffscreenRows,desiredSuffixItems);
         }
         listContent.topOffset = -sumRowHeights(0,offscreenExtraRowsTop - 1);
         listContent.bottomOffset = rowInfo[-1].y + rowInfo[-1].height + listContent.topOffset - listContentVisibleHeight;
         adjustListContent(oldUnscaledWidth,oldUnscaledHeight);
         mx_internal::addClipMask(true);
      }
      
      protected function selectItem(param1:mx.controls.listClasses.IListItemRenderer, param2:Boolean, param3:Boolean, param4:Boolean = true) : Boolean
      {
         var uid:String;
         var selectionChange:Boolean;
         var placeHolder:CursorBookmark = null;
         var index:int = 0;
         var numSelected:int = 0;
         var curSelectionData:mx.controls.listClasses.ListBaseSelectionData = null;
         var oldAnchorBookmark:CursorBookmark = null;
         var oldAnchorIndex:int = 0;
         var incr:Boolean = false;
         var item:mx.controls.listClasses.IListItemRenderer = param1;
         var shiftKey:Boolean = param2;
         var ctrlKey:Boolean = param3;
         var transition:Boolean = param4;
         if(!item || !isItemSelectable(item.data))
         {
            return false;
         }
         selectionChange = false;
         placeHolder = iterator.bookmark;
         index = itemRendererToIndex(item);
         uid = itemToUID(item.data);
         if(!allowMultipleSelection || !shiftKey && !ctrlKey)
         {
            numSelected = 0;
            if(allowMultipleSelection)
            {
               curSelectionData = firstSelectionData;
               if(curSelectionData != null)
               {
                  numSelected++;
                  if(curSelectionData.mx_internal::nextSelectionData)
                  {
                     numSelected++;
                  }
               }
            }
            if(ctrlKey && false)
            {
               selectionChange = true;
               clearSelected(transition);
            }
            else if(mx_internal::_selectedIndex != index || mx_internal::bSelectedIndexChanged || allowMultipleSelection && numSelected != 1)
            {
               selectionChange = true;
               clearSelected(transition);
               insertSelectionDataBefore(uid,new mx.controls.listClasses.ListBaseSelectionData(item.data,index,approximate),firstSelectionData);
               drawItem(UIDToItemRenderer(uid),true,uid == highlightUID,true,transition);
               mx_internal::_selectedIndex = index;
               _selectedItem = item.data;
               iterator.seek(CursorBookmark.CURRENT,mx_internal::_selectedIndex - indicesToIndex(verticalScrollPosition - offscreenExtraRowsTop,horizontalScrollPosition - offscreenExtraColumnsLeft));
               caretIndex = mx_internal::_selectedIndex;
               caretBookmark = iterator.bookmark;
               anchorIndex = mx_internal::_selectedIndex;
               anchorBookmark = iterator.bookmark;
               iterator.seek(placeHolder,0);
            }
         }
         else if(shiftKey && allowMultipleSelection)
         {
            if(anchorBookmark)
            {
               oldAnchorBookmark = anchorBookmark;
               oldAnchorIndex = anchorIndex;
               incr = anchorIndex < index;
               clearSelected(false);
               caretIndex = index;
               caretBookmark = iterator.bookmark;
               anchorIndex = oldAnchorIndex;
               anchorBookmark = oldAnchorBookmark;
               mx_internal::_selectedIndex = index;
               _selectedItem = item.data;
               try
               {
                  iterator.seek(anchorBookmark,0);
               }
               catch(e:ItemPendingError)
               {
                  e.addResponder(new ItemResponder(selectionPendingResultHandler,selectionPendingFailureHandler,new ListBaseSelectionPending(incr,index,item.data,transition,placeHolder,CursorBookmark.CURRENT,0)));
                  iteratorValid = false;
               }
               shiftSelectionLoop(incr,anchorIndex,item.data,transition,placeHolder);
            }
            selectionChange = true;
         }
         else if(ctrlKey && allowMultipleSelection)
         {
            if(false)
            {
               removeSelectionData(uid);
               drawItem(UIDToItemRenderer(uid),false,uid == highlightUID,true,transition);
               if(item.data == selectedItem)
               {
                  calculateSelectedIndexAndItem();
               }
            }
            else
            {
               insertSelectionDataBefore(uid,new mx.controls.listClasses.ListBaseSelectionData(item.data,index,approximate),firstSelectionData);
               drawItem(UIDToItemRenderer(uid),true,uid == highlightUID,true,transition);
               mx_internal::_selectedIndex = index;
               _selectedItem = item.data;
            }
            iterator.seek(CursorBookmark.CURRENT,index - indicesToIndex(verticalScrollPosition,horizontalScrollPosition));
            caretIndex = index;
            caretBookmark = iterator.bookmark;
            anchorIndex = index;
            anchorBookmark = iterator.bookmark;
            iterator.seek(placeHolder,0);
            selectionChange = true;
         }
         return selectionChange;
      }
      
      mx_internal function selectionTween_updateHandler(param1:TweenEvent) : void
      {
         Sprite(param1.target.listener).alpha = Number(param1.value);
      }
      
      protected function prepareDataEffect(param1:CollectionEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Class = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!cachedItemsChangeEffect)
         {
            _loc2_ = getStyle("itemsChangeEffect");
            _loc3_ = _loc2_ as Class;
            if(_loc3_)
            {
               _loc2_ = new _loc3_();
            }
            cachedItemsChangeEffect = _loc2_ as IEffect;
         }
         if(runningDataEffect)
         {
            collection = actualCollection;
            listContent.iterator = iterator = actualIterator;
            cachedItemsChangeEffect.end();
            modifiedCollectionView = null;
         }
         if(Boolean(cachedItemsChangeEffect) && iteratorValid)
         {
            _loc5_ = (_loc4_ = iterator.bookmark.getViewIndex()) + rowCount * columnCount - 1;
            if(!modifiedCollectionView && collection is IList)
            {
               modifiedCollectionView = new ModifiedCollectionView(ICollectionView(collection));
            }
            if(modifiedCollectionView)
            {
               modifiedCollectionView.processCollectionEvent(param1,_loc4_,_loc5_);
               runDataEffectNextUpdate = true;
               if(mx_internal::invalidateDisplayListFlag)
               {
                  callLater(invalidateList);
               }
               else
               {
                  invalidateList();
               }
            }
         }
      }
      
      protected function drawSelectionIndicator(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:uint, param7:mx.controls.listClasses.IListItemRenderer) : void
      {
         var _loc8_:Graphics;
         (_loc8_ = Sprite(param1).graphics).clear();
         _loc8_.beginFill(param6);
         _loc8_.drawRect(0,0,param4,param5);
         _loc8_.endFill();
         param1.x = param2;
         param1.y = param3;
      }
      
      mx_internal function setColumnWidth(param1:Number) : void
      {
         _columnWidth = param1;
      }
      
      protected function makeRowsAndColumns(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int, param7:Boolean = false, param8:uint = 0) : Point
      {
         return new Point(0,0);
      }
      
      public function isItemVisible(param1:Object) : Boolean
      {
         return itemToItemRenderer(param1) != null;
      }
      
      mx_internal function commitSelectedIndices(param1:Array) : void
      {
         var indices:Array = param1;
         clearSelected();
         try
         {
            mx_internal::collectionIterator.seek(CursorBookmark.FIRST,0);
         }
         catch(e:ItemPendingError)
         {
            e.addResponder(new ItemResponder(selectionIndicesPendingResultHandler,selectionIndicesPendingFailureHandler,new ListBaseSelectionDataPending(true,0,indices,CursorBookmark.FIRST,0)));
            return;
         }
         setSelectionIndicesLoop(0,indices,true);
      }
      
      public function calculateDropIndex(param1:DragEvent = null) : int
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param1)
         {
            _loc4_ = new Point(param1.localX,param1.localY);
            _loc4_ = DisplayObject(param1.target).localToGlobal(_loc4_);
            _loc4_ = listContent.globalToLocal(_loc4_);
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(listItems[_loc6_][0])
               {
                  _loc3_ = listItems[_loc6_][0];
               }
               if(rowInfo[_loc6_].y <= _loc4_.y && _loc4_.y < rowInfo[_loc6_].y + rowInfo[_loc6_].height)
               {
                  _loc2_ = listItems[_loc6_][0];
                  break;
               }
               _loc6_++;
            }
            if(_loc2_)
            {
               lastDropIndex = itemRendererToIndex(_loc2_);
            }
            else if(_loc3_)
            {
               lastDropIndex = itemRendererToIndex(_loc3_) + 1;
            }
            else
            {
               lastDropIndex = !!collection ? 0 : 0;
            }
         }
         return lastDropIndex;
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:Point = null;
         if(!enabled || !selectable)
         {
            return;
         }
         if(runningDataEffect)
         {
            cachedItemsChangeEffect.end();
            dataEffectCompleted = true;
            itemsSizeChanged = true;
            invalidateList();
            dataItemWrappersByRenderer = new Dictionary();
            validateDisplayList();
         }
         mx_internal::isPressed = true;
         _loc2_ = mouseEventToItemRenderer(param1);
         if(!_loc2_)
         {
            return;
         }
         mx_internal::bSelectOnRelease = false;
         _loc3_ = new Point(param1.localX,param1.localY);
         _loc3_ = DisplayObject(param1.target).localToGlobal(_loc3_);
         mouseDownPoint = globalToLocal(_loc3_);
         systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler,true,0,true);
         systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,mouseLeaveHandler,false,0,true);
         if(!dragEnabled)
         {
            mx_internal::dragScrollingInterval = setInterval(dragScroll,15);
         }
         if(dragEnabled && false)
         {
            mx_internal::bSelectOnRelease = true;
         }
         else if(selectItem(_loc2_,param1.shiftKey,param1.ctrlKey))
         {
            mouseDownItem = _loc2_;
         }
      }
      
      [Bindable("labelFieldChanged")]
      public function get labelField() : String
      {
         return _labelField;
      }
      
      private function onSelectionTweenUpdate(param1:Number) : void
      {
      }
      
      public function set selectedItemsCompareFunction(param1:Function) : void
      {
         _selectedItemsCompareFunction = param1;
         dispatchEvent(new Event("selectedItemsCompareFunctionChanged"));
      }
      
      protected function clearIndicators() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in selectionTweens)
         {
            removeIndicators(_loc1_);
         }
         while(false)
         {
            selectionLayer.removeChildAt(0);
         }
         selectionTweens = {};
         selectionIndicators = {};
         highlightIndicator = null;
         highlightUID = null;
         caretIndicator = null;
         caretUID = null;
      }
      
      public function get offscreenExtraRowsOrColumns() : int
      {
         return _offscreenExtraRowsOrColumns;
      }
      
      public function get wordWrap() : Boolean
      {
         return _wordWrap;
      }
      
      protected function drawItem(param1:mx.controls.listClasses.IListItemRenderer, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc6_:Sprite = null;
         var _loc7_:* = null;
         var _loc12_:Number = NaN;
         if(!param1)
         {
            return;
         }
         var _loc8_:mx.controls.listClasses.ListBaseContentHolder;
         if(!(_loc8_ = DisplayObject(param1).parent as mx.controls.listClasses.ListBaseContentHolder))
         {
            return;
         }
         var _loc9_:Array = _loc8_.rowInfo;
         var _loc10_:Sprite = _loc8_.selectionLayer;
         var _loc11_:mx.controls.listClasses.BaseListData;
         if(!(_loc11_ = rowMap[param1.name]))
         {
            return;
         }
         if(param3 && (!highlightItemRenderer || highlightUID != _loc11_.uid))
         {
            if(!highlightIndicator)
            {
               _loc6_ = new SpriteAsset();
               _loc10_.addChild(DisplayObject(_loc6_));
               highlightIndicator = _loc6_;
            }
            else if(highlightIndicator.parent != _loc10_)
            {
               _loc10_.addChild(highlightIndicator);
            }
            else
            {
               _loc10_.setChildIndex(DisplayObject(highlightIndicator),_loc10_.numChildren - 1);
            }
            _loc6_ = highlightIndicator;
            drawHighlightIndicator(_loc6_,param1.x,_loc9_[_loc11_.rowIndex].y,param1.width,_loc9_[_loc11_.rowIndex].height,getStyle("rollOverColor"),param1);
            mx_internal::lastHighlightItemRenderer = highlightItemRenderer = param1;
            highlightUID = _loc11_.uid;
         }
         else if(!param3 && highlightItemRenderer && (_loc11_ && highlightUID == _loc11_.uid))
         {
            clearHighlightIndicator(highlightIndicator,param1);
            highlightItemRenderer = null;
            highlightUID = null;
         }
         if(param2)
         {
            _loc12_ = runningDataEffect ? param1.y - mx_internal::cachedPaddingTop : Number(_loc9_[_loc11_.rowIndex].y);
            if(true)
            {
               (_loc6_ = new SpriteAsset()).mouseEnabled = false;
               _loc10_.addChild(DisplayObject(_loc6_));
               selectionIndicators[_loc11_.uid] = _loc6_;
               drawSelectionIndicator(_loc6_,param1.x,_loc12_,param1.width,_loc9_[_loc11_.rowIndex].height,enabled ? getStyle("selectionColor") : getStyle("selectionDisabledColor"),param1);
               if(param5)
               {
                  applySelectionEffect(_loc6_,_loc11_.uid,param1);
               }
            }
            else
            {
               _loc6_ = selectionIndicators[_loc11_.uid];
               drawSelectionIndicator(_loc6_,param1.x,_loc12_,param1.width,_loc9_[_loc11_.rowIndex].height,enabled ? getStyle("selectionColor") : getStyle("selectionDisabledColor"),param1);
            }
         }
         else if(!param2)
         {
            if(Boolean(_loc11_) && false)
            {
               if(false)
               {
                  selectionTweens[_loc11_.uid].removeEventListener(TweenEvent.TWEEN_UPDATE,mx_internal::selectionTween_updateHandler);
                  selectionTweens[_loc11_.uid].removeEventListener(TweenEvent.TWEEN_END,mx_internal::selectionTween_endHandler);
                  if(selectionIndicators[_loc11_.uid].alpha < 1)
                  {
                     Tween.mx_internal::removeTween(selectionTweens[_loc11_.uid]);
                  }
                  delete selectionTweens[_loc11_.uid];
               }
               _loc10_.removeChild(selectionIndicators[_loc11_.uid]);
               delete selectionIndicators[_loc11_.uid];
            }
         }
         if(param4)
         {
            if(showCaret)
            {
               if(!caretIndicator)
               {
                  (_loc6_ = new SpriteAsset()).mouseEnabled = false;
                  _loc10_.addChild(DisplayObject(_loc6_));
                  caretIndicator = _loc6_;
               }
               else if(caretIndicator.parent != _loc10_)
               {
                  _loc10_.addChild(caretIndicator);
               }
               else
               {
                  _loc10_.setChildIndex(DisplayObject(caretIndicator),_loc10_.numChildren - 1);
               }
               _loc6_ = caretIndicator;
               drawCaretIndicator(_loc6_,param1.x,_loc9_[_loc11_.rowIndex].y,param1.width,_loc9_[_loc11_.rowIndex].height,getStyle("selectionColor"),param1);
               caretItemRenderer = param1;
               caretUID = _loc11_.uid;
            }
         }
         else if(!param4 && caretItemRenderer && caretUID == _loc11_.uid)
         {
            clearCaretIndicator(caretIndicator,param1);
            caretItemRenderer = null;
            caretUID = "";
         }
         if(param1 is IFlexDisplayObject)
         {
            if(param1 is IInvalidating)
            {
               IInvalidating(param1).invalidateDisplayList();
               IInvalidating(param1).validateNow();
            }
         }
         else if(param1 is IUITextField)
         {
            IUITextField(param1).validateNow();
         }
      }
      
      private function strictEqualityCompareFunction(param1:Object, param2:Object) : Boolean
      {
         return param1 === param2;
      }
      
      protected function dragExitHandler(param1:DragEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         mx_internal::lastDragEvent = null;
         hideDropFeedback(param1);
         mx_internal::resetDragScrolling();
         DragManager.showFeedback(DragManager.NONE);
      }
      
      protected function adjustAfterRemove(param1:Array, param2:int, param3:Boolean) : Boolean
      {
         var data:mx.controls.listClasses.ListBaseSelectionData = null;
         var requiresValueCommit:Boolean = false;
         var i:int = 0;
         var length:int = 0;
         var placeHolder:CursorBookmark = null;
         var s:String = null;
         var items:Array = param1;
         var location:int = param2;
         var emitEvent:Boolean = param3;
         requiresValueCommit = emitEvent;
         i = 0;
         length = int(items.length);
         for(s in selectedData)
         {
            i++;
            data = selectedData[s];
            if(data.index > location)
            {
               data.index -= length;
            }
         }
         if(mx_internal::_selectedIndex > location)
         {
            mx_internal::_selectedIndex -= length;
            requiresValueCommit = true;
         }
         if(i > 0 && mx_internal::_selectedIndex == -1)
         {
            mx_internal::_selectedIndex = data.index;
            _selectedItem = data.data;
            requiresValueCommit = true;
         }
         if(i == 0)
         {
            mx_internal::_selectedIndex = -1;
            mx_internal::bSelectionChanged = true;
            mx_internal::bSelectedIndexChanged = true;
            invalidateDisplayList();
         }
         if(anchorIndex > location)
         {
            anchorIndex -= length;
            placeHolder = iterator.bookmark;
            try
            {
               iterator.seek(CursorBookmark.FIRST,anchorIndex);
               anchorBookmark = iterator.bookmark;
            }
            catch(e:ItemPendingError)
            {
               e.addResponder(new ItemResponder(mx_internal::setBookmarkPendingResultHandler,mx_internal::setBookmarkPendingFailureHandler,{
                  "property":"anchorBookmark",
                  "value":anchorIndex
               }));
            }
            iterator.seek(placeHolder);
         }
         if(caretIndex > location)
         {
            caretIndex -= length;
            placeHolder = iterator.bookmark;
            try
            {
               iterator.seek(CursorBookmark.FIRST,caretIndex);
               caretBookmark = iterator.bookmark;
            }
            catch(e:ItemPendingError)
            {
               e.addResponder(new ItemResponder(mx_internal::setBookmarkPendingResultHandler,mx_internal::setBookmarkPendingFailureHandler,{
                  "property":"caretBookmark",
                  "value":caretIndex
               }));
            }
            iterator.seek(placeHolder);
         }
         return requiresValueCommit;
      }
      
      public function itemToIcon(param1:Object) : Class
      {
         var iconClass:Class = null;
         var icon:* = undefined;
         var data:Object = param1;
         if(data == null)
         {
            return null;
         }
         if(iconFunction != null)
         {
            return iconFunction(data);
         }
         if(data is XML)
         {
            try
            {
               if(data[iconField].length() != 0)
               {
                  icon = String(data[iconField]);
                  if(icon != null)
                  {
                     iconClass = Class(systemManager.getDefinitionByName(icon));
                     if(iconClass)
                     {
                        return iconClass;
                     }
                     return document[icon];
                  }
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is Object)
         {
            try
            {
               if(data[iconField] != null)
               {
                  if(data[iconField] is Class)
                  {
                     return data[iconField];
                  }
                  if(data[iconField] is String)
                  {
                     iconClass = Class(systemManager.getDefinitionByName(data[iconField]));
                     if(iconClass)
                     {
                        return iconClass;
                     }
                     return document[data[iconField]];
                  }
               }
            }
            catch(e:Error)
            {
            }
         }
         return null;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         var _loc2_:IFlexDisplayObject = border as IFlexDisplayObject;
         if(_loc2_)
         {
            if(_loc2_ is IUIComponent)
            {
               IUIComponent(_loc2_).enabled = param1;
            }
            if(_loc2_ is IInvalidating)
            {
               IInvalidating(_loc2_).invalidateDisplayList();
            }
         }
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      override public function get baselinePosition() : Number
      {
         if(false)
         {
            return super.baselinePosition;
         }
         if(!mx_internal::validateBaselinePosition())
         {
            return NaN;
         }
         var _loc1_:* = dataProvider == null;
         var _loc2_:Boolean = dataProvider != null && false;
         var _loc3_:Object = dataProvider;
         if(_loc1_ || _loc2_)
         {
            dataProvider = [null];
            validateNow();
         }
         if(!listItems || false)
         {
            return super.baselinePosition;
         }
         var _loc4_:IUIComponent;
         if(!(_loc4_ = listItems[0][0] as IUIComponent))
         {
            return super.baselinePosition;
         }
         var _loc5_:mx.controls.listClasses.ListBaseContentHolder;
         var _loc6_:Number = (_loc5_ = ListBaseContentHolder(_loc4_.parent)).y + _loc4_.y + _loc4_.baselinePosition;
         if(_loc1_ || _loc2_)
         {
            dataProvider = _loc3_;
            validateNow();
         }
         return _loc6_;
      }
      
      public function addDataEffectItem(param1:Object) : void
      {
         if(modifiedCollectionView)
         {
            modifiedCollectionView.addItem(dataItemWrappersByRenderer[param1]);
         }
         if(false)
         {
            iterator.seek(CursorBookmark.FIRST);
         }
         else
         {
            iterator.seek(CursorBookmark.CURRENT);
         }
         if(mx_internal::invalidateDisplayListFlag)
         {
            callLater(invalidateList);
         }
         else
         {
            invalidateList();
         }
      }
      
      private function makeRowsAndColumnsWithExtraRows(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc8_:int = offscreenExtraRows / 2;
         var _loc9_:int = offscreenExtraRows / 2;
         offscreenExtraRowsTop = Math.min(_loc8_,verticalScrollPosition);
         var _loc10_:int = scrollPositionToIndex(horizontalScrollPosition,verticalScrollPosition - offscreenExtraRowsTop);
         seekPositionSafely(_loc10_);
         var _loc11_:CursorBookmark = iterator.bookmark;
         if(offscreenExtraRowsTop > 0)
         {
            makeRowsAndColumns(0,0,listContent.width,listContent.height,0,0,true,offscreenExtraRowsTop);
         }
         var _loc12_:Number = !!offscreenExtraRowsTop ? rowInfo[offscreenExtraRowsTop - 1].y + rowHeight : 0;
         _loc7_ = makeRowsAndColumns(0,_loc12_,listContent.width,_loc12_ + listContent.heightExcludingOffsets,0,offscreenExtraRowsTop);
         if(_loc9_ > 0 && true)
         {
            if(offscreenExtraRowsTop + _loc7_.y - 1 < 0)
            {
               _loc12_ = 0;
            }
            else
            {
               _loc12_ = rowInfo[offscreenExtraRowsTop + _loc7_.y - 1].y + rowInfo[offscreenExtraRowsTop + _loc7_.y - 1].height;
            }
            _loc14_ = 0;
            if((_loc7_ = makeRowsAndColumns(0,_loc12_,listContent.width,_loc12_,0,offscreenExtraRowsTop + _loc7_.y,true,_loc9_)).y == _loc9_)
            {
               while(_loc7_.y > 0 && false && listItems[-1].length == 0)
               {
                  --_loc7_.y;
                  listItems.pop();
                  rowInfo.pop();
               }
            }
            else if(_loc7_.y < _loc9_)
            {
               if(_loc15_ = 0 - (_loc14_ + _loc7_.y))
               {
                  _loc16_ = 0;
                  while(_loc16_ < _loc15_)
                  {
                     listItems.pop();
                     rowInfo.pop();
                     _loc16_++;
                  }
               }
            }
            offscreenExtraRowsBottom = _loc7_.y;
         }
         else
         {
            offscreenExtraRowsBottom = 0;
         }
         var _loc13_:Number = 0;
         listContent.topOffset = -offscreenExtraRowsTop * rowHeight;
         listContent.bottomOffset = offscreenExtraRowsBottom > 0 ? listItems[-1][0].y + rowHeight - _loc13_ + listContent.topOffset : 0;
         if(iteratorValid)
         {
            iterator.seek(_loc11_,0);
         }
         adjustListContent(param1,param2);
      }
      
      mx_internal function indicesToItemRenderer(param1:int, param2:int) : mx.controls.listClasses.IListItemRenderer
      {
         return listItems[param1][param2];
      }
      
      mx_internal function getItemRendererForMouseEvent(param1:MouseEvent) : mx.controls.listClasses.IListItemRenderer
      {
         return mouseEventToItemRenderer(param1);
      }
      
      mx_internal function set $verticalScrollPosition(param1:Number) : void
      {
         var _loc2_:int = super.verticalScrollPosition;
         if(_loc2_ != param1)
         {
            super.verticalScrollPosition = param1;
         }
      }
      
      protected function mouseOutHandler(param1:MouseEvent) : void
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         if(!enabled || !selectable)
         {
            return;
         }
         mx_internal::isPressed = param1.buttonDown;
         _loc2_ = mouseEventToItemRenderer(param1);
         if(!_loc2_)
         {
            return;
         }
         if(!mx_internal::isPressed)
         {
            if(itemRendererContains(_loc2_,param1.relatedObject) || param1.relatedObject == listContent || param1.relatedObject == highlightIndicator || !highlightItemRenderer)
            {
               return;
            }
            if(getStyle("useRollOver") && _loc2_.data != null)
            {
               mx_internal::clearHighlight(_loc2_);
            }
         }
      }
      
      public function set dropEnabled(param1:Boolean) : void
      {
         if(_dropEnabled && !param1)
         {
            removeEventListener(DragEvent.DRAG_ENTER,dragEnterHandler,false);
            removeEventListener(DragEvent.DRAG_EXIT,dragExitHandler,false);
            removeEventListener(DragEvent.DRAG_OVER,dragOverHandler,false);
            removeEventListener(DragEvent.DRAG_DROP,dragDropHandler,false);
         }
         _dropEnabled = param1;
         if(param1)
         {
            addEventListener(DragEvent.DRAG_ENTER,dragEnterHandler,false,EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_EXIT,dragExitHandler,false,EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_OVER,dragOverHandler,false,EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_DROP,dragDropHandler,false,EventPriority.DEFAULT_HANDLER);
         }
      }
      
      protected function get listContentStyleFilters() : Object
      {
         return _listContentStyleFilters;
      }
      
      public function itemToLabel(param1:Object) : String
      {
         var data:Object = param1;
         if(data == null)
         {
            return " ";
         }
         if(labelFunction != null)
         {
            return labelFunction(data);
         }
         if(data is XML)
         {
            try
            {
               if(data[labelField].length() != 0)
               {
                  data = data[labelField];
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is Object)
         {
            try
            {
               if(data[labelField] != null)
               {
                  data = data[labelField];
               }
            }
            catch(e:Error)
            {
            }
         }
         if(data is String)
         {
            return String(data);
         }
         try
         {
            return data.toString();
         }
         catch(e:Error)
         {
            return " ";
         }
      }
      
      public function set rowCount(param1:int) : void
      {
         explicitRowCount = param1;
         if(_rowCount != param1)
         {
            setRowCount(param1);
            rowCountChanged = true;
            invalidateProperties();
            invalidateSize();
            itemsSizeChanged = true;
            invalidateDisplayList();
            dispatchEvent(new Event("rowCountChanged"));
         }
      }
      
      public function set columnCount(param1:int) : void
      {
         explicitColumnCount = param1;
         if(_columnCount != param1)
         {
            mx_internal::setColumnCount(param1);
            columnCountChanged = true;
            invalidateProperties();
            invalidateSize();
            itemsSizeChanged = true;
            invalidateDisplayList();
            dispatchEvent(new Event("columnCountChanged"));
         }
      }
      
      private function partialPurgeItemRenderers() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:String = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:Dictionary = null;
         var _loc5_:* = undefined;
         dataEffectCompleted = false;
         while(false)
         {
            _loc3_ = DisplayObject(freeItemRenderers.pop());
            if(_loc3_.parent)
            {
               listContent.removeChild(_loc3_);
            }
         }
         for(_loc1_ in freeItemRenderersByFactory)
         {
            _loc4_ = freeItemRenderersByFactory[_loc1_];
            for(_loc5_ in _loc4_)
            {
               _loc3_ = DisplayObject(_loc5_);
               delete _loc4_[_loc5_];
               if(_loc3_.parent)
               {
                  listContent.removeChild(_loc3_);
               }
            }
         }
         for(_loc2_ in reservedItemRenderers)
         {
            _loc3_ = DisplayObject(reservedItemRenderers[_loc2_]);
            if(_loc3_.parent)
            {
               listContent.removeChild(_loc3_);
            }
         }
         reservedItemRenderers = {};
         rowMap = {};
         clearVisibleData();
      }
      
      protected function seekPendingResultHandler(param1:Object, param2:mx.controls.listClasses.ListBaseSeekPending) : void
      {
         var data:Object = param1;
         var info:mx.controls.listClasses.ListBaseSeekPending = param2;
         if(info != lastSeekPending)
         {
            return;
         }
         lastSeekPending = null;
         iteratorValid = true;
         try
         {
            iterator.seek(info.bookmark,info.offset);
         }
         catch(e:ItemPendingError)
         {
            lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(info.bookmark,info.offset);
            e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
            iteratorValid = false;
         }
         if(bSortItemPending)
         {
            bSortItemPending = false;
            adjustAfterSort();
         }
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      mx_internal function mouseEventToItemRendererOrEditor(param1:MouseEvent) : mx.controls.listClasses.IListItemRenderer
      {
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         if(_loc2_ == listContent)
         {
            _loc3_ = new Point(param1.stageX,param1.stageY);
            _loc3_ = listContent.globalToLocal(_loc3_);
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(listItems[_loc6_].length)
               {
                  if(_loc3_.y < _loc4_ + rowInfo[_loc6_].height)
                  {
                     if((_loc7_ = int(listItems[_loc6_].length)) == 1)
                     {
                        return listItems[_loc6_][0];
                     }
                     _loc8_ = Math.floor(_loc3_.x / columnWidth);
                     return listItems[_loc6_][_loc8_];
                  }
               }
               _loc4_ += rowInfo[_loc6_].height;
               _loc6_++;
            }
         }
         else if(_loc2_ == highlightIndicator)
         {
            return mx_internal::lastHighlightItemRenderer;
         }
         while(Boolean(_loc2_) && _loc2_ != this)
         {
            if(_loc2_ is mx.controls.listClasses.IListItemRenderer && _loc2_.parent == listContent)
            {
               if(_loc2_.visible)
               {
                  return IListItemRenderer(_loc2_);
               }
               break;
            }
            if(_loc2_ is IUIComponent)
            {
               _loc2_ = IUIComponent(_loc2_).owner;
            }
            else
            {
               _loc2_ = _loc2_.parent;
            }
         }
         return null;
      }
      
      protected function configureScrollBars() : void
      {
      }
      
      protected function clearVisibleData() : void
      {
         listContent.visibleData = {};
      }
      
      private function insertSelectionDataAfter(param1:String, param2:mx.controls.listClasses.ListBaseSelectionData, param3:mx.controls.listClasses.ListBaseSelectionData) : void
      {
         if(param3 == null)
         {
            firstSelectionData = lastSelectionData = param2;
         }
         else
         {
            if(param3 == lastSelectionData)
            {
               lastSelectionData = param2;
            }
            param2.mx_internal::prevSelectionData = param3;
            param2.mx_internal::nextSelectionData = param3.mx_internal::nextSelectionData;
            param3.mx_internal::nextSelectionData = param2;
         }
         selectedData[param1] = param2;
      }
      
      protected function moveSelectionVertically(param1:uint, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc13_:ScrollEvent = null;
         var _loc8_:Boolean = false;
         showCaret = true;
         var _loc9_:int = 0;
         var _loc10_:int = 0 - offscreenExtraRowsTop - offscreenExtraRowsBottom;
         var _loc11_:int = rowInfo[_loc9_ - offscreenExtraRowsBottom - 1].y + rowInfo[_loc9_ - offscreenExtraRowsBottom - 1].height > 0 - 0 ? 1 : 0;
         var _loc12_:Boolean = false;
         bSelectItem = false;
         switch(param1)
         {
            case Keyboard.UP:
               if(caretIndex > 0)
               {
                  --caretIndex;
                  _loc12_ = true;
                  bSelectItem = true;
               }
               break;
            case Keyboard.DOWN:
               if(caretIndex < -1)
               {
                  ++caretIndex;
                  _loc12_ = true;
                  bSelectItem = true;
               }
               else if(caretIndex == -1 && Boolean(_loc11_))
               {
                  if(verticalScrollPosition < maxVerticalScrollPosition)
                  {
                     _loc4_ = verticalScrollPosition + 1;
                  }
               }
               break;
            case Keyboard.PAGE_UP:
               if(caretIndex > verticalScrollPosition && caretIndex < verticalScrollPosition + _loc10_)
               {
                  caretIndex = verticalScrollPosition;
               }
               else
               {
                  caretIndex = Math.max(caretIndex - Math.max(_loc10_ - _loc11_,1),0);
                  _loc4_ = Math.max(caretIndex,0);
               }
               bSelectItem = true;
               break;
            case Keyboard.PAGE_DOWN:
               if(!(caretIndex >= verticalScrollPosition && caretIndex < verticalScrollPosition + _loc10_ - _loc11_ - 1))
               {
                  if(caretIndex == verticalScrollPosition && _loc10_ - _loc11_ <= 1)
                  {
                     ++caretIndex;
                  }
                  _loc4_ = Math.max(Math.min(caretIndex,maxVerticalScrollPosition),0);
               }
               bSelectItem = true;
               break;
            case Keyboard.HOME:
               if(caretIndex > 0)
               {
                  caretIndex = 0;
                  bSelectItem = true;
                  _loc4_ = 0;
               }
               break;
            case Keyboard.END:
               if(caretIndex < -1)
               {
                  caretIndex = -1;
                  bSelectItem = true;
                  _loc4_ = maxVerticalScrollPosition;
               }
         }
         if(_loc12_)
         {
            if(caretIndex >= verticalScrollPosition + _loc10_ - _loc11_)
            {
               if(_loc10_ - _loc11_ == 0)
               {
                  _loc4_ = Math.min(maxVerticalScrollPosition,caretIndex);
               }
               else
               {
                  _loc4_ = Math.min(maxVerticalScrollPosition,caretIndex - _loc10_ + _loc11_ + 1);
               }
            }
            else if(caretIndex < verticalScrollPosition)
            {
               _loc4_ = Math.max(caretIndex,0);
            }
         }
         if(!isNaN(_loc4_))
         {
            if(verticalScrollPosition != _loc4_)
            {
               (_loc13_ = new ScrollEvent(ScrollEvent.SCROLL)).detail = ScrollEventDetail.THUMB_POSITION;
               _loc13_.direction = ScrollEventDirection.VERTICAL;
               _loc13_.delta = _loc4_ - verticalScrollPosition;
               _loc13_.position = _loc4_;
               verticalScrollPosition = _loc4_;
               dispatchEvent(_loc13_);
            }
            if(!iteratorValid)
            {
               keySelectionPending = true;
               return;
            }
         }
         bShiftKey = param2;
         bCtrlKey = param3;
         lastKey = param1;
         finishKeySelection();
      }
      
      protected function getReservedOrFreeItemRenderer(param1:Object) : mx.controls.listClasses.IListItemRenderer
      {
         var _loc2_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc3_:String = null;
         var _loc4_:IFactory = null;
         var _loc5_:Dictionary = null;
         var _loc6_:* = undefined;
         if(runningDataEffect)
         {
            _loc2_ = IListItemRenderer(reservedItemRenderers[_loc3_ = itemToUID(param1)]);
         }
         if(_loc2_)
         {
            delete reservedItemRenderers[_loc3_];
         }
         else
         {
            _loc4_ = getItemRendererFactory(param1);
            if(freeItemRenderersByFactory)
            {
               if(_loc4_ == itemRenderer)
               {
                  if(false)
                  {
                     _loc2_ = freeItemRenderers.pop();
                     delete freeItemRenderersByFactory[_loc4_][_loc2_];
                  }
               }
               else if(_loc5_ = freeItemRenderersByFactory[_loc4_])
               {
                  var _loc7_:int = 0;
                  var _loc8_:* = _loc5_;
                  for(_loc6_ in _loc8_)
                  {
                     _loc2_ = _loc6_;
                     delete freeItemRenderersByFactory[_loc4_][_loc2_];
                  }
               }
            }
         }
         return _loc2_;
      }
      
      protected function addDragData(param1:Object) : void
      {
         param1.addHandler(copySelectedItems,"items");
      }
      
      private function adjustAfterSort() : void
      {
         var p:String = null;
         var index:int = 0;
         var newVerticalScrollPosition:int = 0;
         var newHorizontalScrollPosition:int = 0;
         var pos:int = 0;
         var data:mx.controls.listClasses.ListBaseSelectionData = null;
         var i:int = 0;
         for(p in selectedData)
         {
            i++;
         }
         index = !!anchorBookmark ? anchorBookmark.getViewIndex() : -1;
         if(index >= 0)
         {
            if(i == 1)
            {
               mx_internal::_selectedIndex = anchorIndex = caretIndex = index;
               data = selectedData[p];
               data.index = index;
            }
            newVerticalScrollPosition = indexToRow(index);
            if(newVerticalScrollPosition == -1)
            {
               return;
            }
            newVerticalScrollPosition = Math.min(maxVerticalScrollPosition,newVerticalScrollPosition);
            newHorizontalScrollPosition = indexToColumn(index);
            if(newHorizontalScrollPosition == -1)
            {
               return;
            }
            newHorizontalScrollPosition = Math.min(maxHorizontalScrollPosition,newHorizontalScrollPosition);
            pos = scrollPositionToIndex(newHorizontalScrollPosition,newVerticalScrollPosition);
            try
            {
               iterator.seek(CursorBookmark.CURRENT,pos - index);
               if(!iteratorValid)
               {
                  iteratorValid = true;
                  lastSeekPending = null;
               }
            }
            catch(e:ItemPendingError)
            {
               lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.CURRENT,pos - index);
               e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
               iteratorValid = false;
               return;
            }
            super.verticalScrollPosition = newVerticalScrollPosition;
            if(mx_internal::listType != "vertical")
            {
               super.horizontalScrollPosition = newHorizontalScrollPosition;
            }
         }
         else
         {
            try
            {
               index = scrollPositionToIndex(horizontalScrollPosition,verticalScrollPosition - offscreenExtraRowsTop);
               iterator.seek(CursorBookmark.FIRST,index);
               if(!iteratorValid)
               {
                  iteratorValid = true;
                  lastSeekPending = null;
               }
            }
            catch(e:ItemPendingError)
            {
               lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,index);
               e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
               iteratorValid = false;
               return;
            }
         }
         if(i > 1)
         {
            commitSelectedItems(selectedItems);
         }
      }
      
      public function set listData(param1:mx.controls.listClasses.BaseListData) : void
      {
         _listData = param1;
      }
      
      private function initiateSelectionTracking(param1:Array) : void
      {
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as mx.controls.listClasses.IListItemRenderer;
            if(false)
            {
               _loc3_.addEventListener(MoveEvent.MOVE,rendererMoveHandler);
               trackedRenderers.push(_loc3_);
            }
            _loc2_++;
         }
      }
      
      private function setSelectionDataLoop(param1:Array, param2:int, param3:Boolean = true) : void
      {
         var uid:String = null;
         var item:Object = null;
         var bookmark:CursorBookmark = null;
         var compareFunction:Function = null;
         var selectionData:mx.controls.listClasses.ListBaseSelectionData = null;
         var lastSelectionData:mx.controls.listClasses.ListBaseSelectionData = null;
         var len:int = 0;
         var data:Object = null;
         var i:int = 0;
         var items:Array = param1;
         var index:int = param2;
         var useFind:Boolean = param3;
         if(useFind)
         {
            while(items.length)
            {
               item = items.pop();
               uid = itemToUID(item);
               try
               {
                  mx_internal::collectionIterator.findAny(item);
               }
               catch(e1:ItemPendingError)
               {
                  items.push(item);
                  e1.addResponder(new ItemResponder(mx_internal::selectionDataPendingResultHandler,selectionDataPendingFailureHandler,new ListBaseSelectionDataPending(useFind,0,items,null,0)));
                  return;
               }
               bookmark = mx_internal::collectionIterator.bookmark;
               index = bookmark.getViewIndex();
               if(index < 0)
               {
                  try
                  {
                     mx_internal::collectionIterator.seek(CursorBookmark.FIRST,0);
                  }
                  catch(e2:ItemPendingError)
                  {
                     e2.addResponder(new ItemResponder(mx_internal::selectionDataPendingResultHandler,selectionDataPendingFailureHandler,new ListBaseSelectionDataPending(false,0,items,CursorBookmark.FIRST,0)));
                     return;
                  }
                  setSelectionDataLoop(items,0,false);
                  return;
               }
               insertSelectionDataBefore(uid,new mx.controls.listClasses.ListBaseSelectionData(item,index,true),firstSelectionData);
               if(items.length == 0)
               {
                  mx_internal::_selectedIndex = index;
                  _selectedItem = item;
                  caretIndex = index;
                  caretBookmark = mx_internal::collectionIterator.bookmark;
                  anchorIndex = index;
                  anchorBookmark = mx_internal::collectionIterator.bookmark;
               }
            }
         }
         else
         {
            compareFunction = selectedItemsCompareFunction;
            if(compareFunction == null)
            {
               compareFunction = strictEqualityCompareFunction;
            }
            while(Boolean(items.length) && true)
            {
               len = int(items.length);
               data = mx_internal::collectionIterator.current;
               i = 0;
               while(i < len)
               {
                  item = items[i];
                  if(compareFunction(data,item))
                  {
                     uid = itemToUID(data);
                     selectionDataArray[proposedSelectedItemIndexes[uid]] = new mx.controls.listClasses.ListBaseSelectionData(data,index,false);
                     items.splice(i,1);
                     if(item === firstSelectedItem)
                     {
                        mx_internal::_selectedIndex = index;
                        _selectedItem = data;
                        caretIndex = index;
                        caretBookmark = mx_internal::collectionIterator.bookmark;
                        anchorIndex = index;
                        anchorBookmark = mx_internal::collectionIterator.bookmark;
                     }
                     break;
                  }
                  i++;
               }
               try
               {
                  mx_internal::collectionIterator.moveNext();
                  index++;
               }
               catch(e2:ItemPendingError)
               {
                  e2.addResponder(new ItemResponder(mx_internal::selectionDataPendingResultHandler,selectionDataPendingFailureHandler,new ListBaseSelectionDataPending(false,index,items,CursorBookmark.FIRST,index)));
                  return;
               }
            }
            len = 0;
            lastSelectionData = firstSelectionData;
            if(len)
            {
               selectionData = selectionDataArray[0];
               if(selectionData)
               {
                  uid = itemToUID(selectionData.data);
                  insertSelectionDataBefore(uid,selectionData,firstSelectionData);
                  lastSelectionData = selectionData;
               }
            }
            i = 1;
            while(i < len)
            {
               selectionData = selectionDataArray[i];
               if(selectionData)
               {
                  uid = itemToUID(selectionData.data);
                  insertSelectionDataAfter(uid,selectionData,lastSelectionData);
                  lastSelectionData = selectionData;
               }
               i++;
            }
            selectionDataArray = null;
            proposedSelectedItemIndexes = null;
            firstSelectedItem = null;
         }
         if(initialized)
         {
            updateList();
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      public function set dragEnabled(param1:Boolean) : void
      {
         if(_dragEnabled && !param1)
         {
            removeEventListener(DragEvent.DRAG_START,dragStartHandler,false);
            removeEventListener(DragEvent.DRAG_COMPLETE,dragCompleteHandler,false);
         }
         _dragEnabled = param1;
         if(param1)
         {
            addEventListener(DragEvent.DRAG_START,dragStartHandler,false,EventPriority.DEFAULT_HANDLER);
            addEventListener(DragEvent.DRAG_COMPLETE,dragCompleteHandler,false,EventPriority.DEFAULT_HANDLER);
         }
      }
      
      mx_internal function getListContentHolder() : mx.controls.listClasses.ListBaseContentHolder
      {
         return listContent;
      }
      
      public function set iconFunction(param1:Function) : void
      {
         _iconFunction = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("iconFunctionChanged"));
      }
      
      protected function initiateDataChangeEffect(param1:Number, param2:Number) : void
      {
         var _loc9_:Array = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         actualCollection = collection;
         actualIterator = iterator;
         collection = modifiedCollectionView;
         modifiedCollectionView.showPreservedState = true;
         listContent.iterator = iterator = collection.createCursor();
         var _loc3_:int = scrollPositionToIndex(horizontalScrollPosition - offscreenExtraColumnsLeft,verticalScrollPosition - offscreenExtraRowsTop);
         iterator.seek(CursorBookmark.FIRST,_loc3_);
         updateDisplayList(param1,param2);
         var _loc4_:* = [];
         var _loc5_:Dictionary = new Dictionary(true);
         var _loc6_:int = 0;
         while(_loc6_ < listItems.length)
         {
            if((Boolean(_loc9_ = listItems[_loc6_])) && _loc9_.length > 0)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc9_.length)
               {
                  if(_loc11_ = _loc9_[_loc10_])
                  {
                     _loc4_.push(_loc11_);
                     _loc5_[_loc11_] = true;
                  }
                  _loc10_++;
               }
            }
            _loc6_++;
         }
         cachedItemsChangeEffect.targets = _loc4_;
         if(true)
         {
            cachedItemsChangeEffect.effectTargetHost = this;
         }
         cachedItemsChangeEffect.captureStartValues();
         modifiedCollectionView.showPreservedState = false;
         iterator.seek(CursorBookmark.FIRST,_loc3_);
         itemsSizeChanged = true;
         updateDisplayList(param1,param2);
         var _loc7_:* = [];
         var _loc8_:Array = cachedItemsChangeEffect.targets;
         _loc6_ = 0;
         while(_loc6_ < listItems.length)
         {
            if((Boolean(_loc9_ = listItems[_loc6_])) && _loc9_.length > 0)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc9_.length)
               {
                  if((Boolean(_loc11_ = _loc9_[_loc10_])) && !_loc5_[_loc11_])
                  {
                     _loc8_.push(_loc11_);
                     _loc7_.push(_loc11_);
                  }
                  _loc10_++;
               }
            }
            _loc6_++;
         }
         if(_loc7_.length > 0)
         {
            cachedItemsChangeEffect.targets = _loc8_;
            cachedItemsChangeEffect.captureMoreStartValues(_loc7_);
         }
         cachedItemsChangeEffect.captureEndValues();
         modifiedCollectionView.showPreservedState = true;
         iterator.seek(CursorBookmark.FIRST,_loc3_);
         itemsSizeChanged = true;
         updateDisplayList(param1,param2);
         initiateSelectionTracking(_loc8_);
         cachedItemsChangeEffect.addEventListener(EffectEvent.EFFECT_END,finishDataChangeEffect);
         cachedItemsChangeEffect.play();
      }
      
      [Bindable("labelFunctionChanged")]
      public function get labelFunction() : Function
      {
         return _labelFunction;
      }
      
      [Bindable("dataTipFieldChanged")]
      public function get dataTipField() : String
      {
         return _dataTipField;
      }
      
      protected function adjustListContent(param1:Number = -1, param2:Number = -1) : void
      {
         if(param2 < 0)
         {
            param2 = oldUnscaledHeight;
            param1 = oldUnscaledWidth;
         }
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         listContent.move(_loc3_,_loc4_);
         var _loc5_:Number = Math.max(0,listContent.rightOffset) - _loc3_ - 0;
         var _loc6_:Number = Math.max(0,listContent.bottomOffset) - _loc4_ - 0;
         listContent.setActualSize(param1 + _loc5_,param2 + _loc6_);
      }
      
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedIndex() : int
      {
         return mx_internal::_selectedIndex;
      }
      
      mx_internal function setBookmarkPendingFailureHandler(param1:Object, param2:Object) : void
      {
      }
      
      private function insertSelectionDataBefore(param1:String, param2:mx.controls.listClasses.ListBaseSelectionData, param3:mx.controls.listClasses.ListBaseSelectionData) : void
      {
         if(param3 == null)
         {
            firstSelectionData = lastSelectionData = param2;
         }
         else
         {
            if(param3 == firstSelectionData)
            {
               firstSelectionData = param2;
            }
            param2.mx_internal::nextSelectionData = param3;
            param2.mx_internal::prevSelectionData = param3.mx_internal::prevSelectionData;
            param3.mx_internal::prevSelectionData = param2;
         }
         selectedData[param1] = param2;
      }
      
      mx_internal function getCaretIndex() : int
      {
         return caretIndex;
      }
      
      mx_internal function removeClipMask() : void
      {
         var _loc7_:DisplayObject = null;
         if(Boolean(listContent) && false)
         {
            return;
         }
         var _loc1_:int = -1;
         if(_loc1_ < 0)
         {
            return;
         }
         var _loc2_:Number = Number(rowInfo[_loc1_].height);
         var _loc3_:ListRowInfo = rowInfo[_loc1_];
         var _loc4_:Array;
         var _loc5_:int = int((_loc4_ = listItems[_loc1_]).length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc7_ = _loc4_[_loc6_]) is IUITextField)
            {
               if(_loc7_.height != _loc2_ - (_loc7_.y - _loc3_.y))
               {
                  _loc7_.height = _loc2_ - (_loc7_.y - _loc3_.y);
               }
            }
            else if(Boolean(_loc7_) && Boolean(_loc7_.mask))
            {
               mx_internal::itemMaskFreeList.push(_loc7_.mask);
               _loc7_.mask = null;
            }
            _loc6_++;
         }
      }
      
      mx_internal function reconstructDataFromListItems() : Array
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         if(!listItems)
         {
            return [];
         }
         _loc1_ = [];
         _loc2_ = 0;
         while(_loc2_ < listItems.length)
         {
            if(false)
            {
               _loc3_ = listItems[_loc2_][0] as mx.controls.listClasses.IListItemRenderer;
               if(_loc3_)
               {
                  _loc4_ = _loc3_.data;
                  _loc1_.push(_loc4_);
                  _loc6_ = 0;
                  while(_loc6_ < listItems[_loc2_].length)
                  {
                     _loc3_ = listItems[_loc2_][_loc6_] as mx.controls.listClasses.IListItemRenderer;
                     if(_loc3_)
                     {
                        if((_loc5_ = _loc3_.data) != _loc4_)
                        {
                           _loc1_.push(_loc5_);
                        }
                     }
                     _loc6_++;
                  }
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set dataTipFunction(param1:Function) : void
      {
         _dataTipFunction = param1;
         itemsSizeChanged = true;
         invalidateDisplayList();
         dispatchEvent(new Event("dataTipFunctionChanged"));
      }
      
      private function calculateSelectedIndexAndItem() : void
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = selectedData;
         for(_loc2_ in _loc4_)
         {
            _loc1_ = 1;
         }
         if(!_loc1_)
         {
            mx_internal::_selectedIndex = -1;
            _selectedItem = null;
            return;
         }
         mx_internal::_selectedIndex = selectedData[_loc2_].index;
         _selectedItem = selectedData[_loc2_].data;
      }
      
      protected function scrollPositionToIndex(param1:int, param2:int) : int
      {
         return !!iterator ? param2 : -1;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(!listContent)
         {
            listContent = new mx.controls.listClasses.ListBaseContentHolder(this);
            listContent.styleName = new StyleProxy(this,listContentStyleFilters);
            addChild(listContent);
         }
         if(!selectionLayer)
         {
            selectionLayer = listContent.selectionLayer;
         }
      }
      
      public function findString(param1:String) : Boolean
      {
         var stopIndex:int;
         var i:int;
         var cursorPos:CursorBookmark = null;
         var bMovedNext:Boolean = false;
         var str:String = param1;
         if(!collection || false)
         {
            return false;
         }
         cursorPos = iterator.bookmark;
         stopIndex = selectedIndex;
         i = stopIndex + 1;
         if(selectedIndex == -1)
         {
            try
            {
               iterator.seek(CursorBookmark.FIRST,0);
            }
            catch(e1:ItemPendingError)
            {
               e1.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,CursorBookmark.FIRST,0,0,collection.length)));
               iteratorValid = false;
               return false;
            }
            stopIndex = 0;
            i = 0;
         }
         else
         {
            try
            {
               iterator.seek(CursorBookmark.FIRST,stopIndex);
            }
            catch(e2:ItemPendingError)
            {
               if(anchorIndex == -1)
               {
                  e2.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,CursorBookmark.FIRST,0,0,collection.length)));
               }
               else
               {
                  e2.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,anchorBookmark,1,anchorIndex + 1,anchorIndex)));
               }
               iteratorValid = false;
               return false;
            }
            bMovedNext = false;
            try
            {
               bMovedNext = iterator.moveNext();
            }
            catch(e3:ItemPendingError)
            {
               e3.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,anchorBookmark,1,anchorIndex + 1,anchorIndex)));
               iteratorValid = false;
               return false;
            }
            if(!bMovedNext)
            {
               try
               {
                  iterator.seek(CursorBookmark.FIRST,0);
               }
               catch(e4:ItemPendingError)
               {
                  e4.addResponder(new ItemResponder(findPendingResultHandler,findPendingFailureHandler,new ListBaseFindPending(str,cursorPos,CursorBookmark.FIRST,0,0,collection.length)));
                  iteratorValid = false;
                  return false;
               }
               stopIndex = 0;
               i = 0;
            }
         }
         return findStringLoop(str,cursorPos,i,stopIndex);
      }
      
      private function commitSelectedItem(param1:Object, param2:Boolean = true) : void
      {
         if(param2)
         {
            clearSelected();
         }
         if(param1 != null)
         {
            commitSelectedItems([param1]);
         }
      }
      
      [Bindable("selectedItemsCompareFunctionChanged")]
      public function get selectedItemsCompareFunction() : Function
      {
         return _selectedItemsCompareFunction;
      }
      
      mx_internal function commitSelectedIndex(param1:int) : void
      {
         var bookmark:CursorBookmark = null;
         var len:int = 0;
         var data:Object = null;
         var selectedBookmark:CursorBookmark = null;
         var uid:String = null;
         var value:int = param1;
         if(value != -1)
         {
            value = Math.min(value,-1);
            bookmark = iterator.bookmark;
            len = value - scrollPositionToIndex(horizontalScrollPosition - offscreenExtraColumnsLeft,verticalScrollPosition - offscreenExtraRowsTop);
            try
            {
               iterator.seek(CursorBookmark.CURRENT,len);
            }
            catch(e:ItemPendingError)
            {
               iterator.seek(bookmark,0);
               mx_internal::bSelectedIndexChanged = true;
               mx_internal::_selectedIndex = value;
               return;
            }
            data = iterator.current;
            selectedBookmark = iterator.bookmark;
            uid = itemToUID(data);
            iterator.seek(bookmark,0);
            if(true)
            {
               if(Boolean(listContent) && Boolean(UIDToItemRenderer(uid)))
               {
                  selectItem(UIDToItemRenderer(uid),false,false);
               }
               else
               {
                  clearSelected();
                  insertSelectionDataBefore(uid,new mx.controls.listClasses.ListBaseSelectionData(data,value,approximate),firstSelectionData);
                  mx_internal::_selectedIndex = value;
                  caretIndex = value;
                  caretBookmark = selectedBookmark;
                  anchorIndex = value;
                  anchorBookmark = selectedBookmark;
                  _selectedItem = data;
               }
            }
         }
         else
         {
            clearSelected();
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      protected function get visibleData() : Object
      {
         return listContent.visibleData;
      }
      
      public function set rowHeight(param1:Number) : void
      {
         explicitRowHeight = param1;
         if(_rowHeight != param1)
         {
            setRowHeight(param1);
            invalidateSize();
            itemsSizeChanged = true;
            invalidateDisplayList();
            dispatchEvent(new Event("rowHeightChanged"));
         }
      }
      
      private function seekNextSafely(param1:IViewCursor, param2:int) : Boolean
      {
         var iterator:IViewCursor = param1;
         var pos:int = param2;
         try
         {
            iterator.moveNext();
         }
         catch(e:ItemPendingError)
         {
            lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,pos);
            e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
            iteratorValid = false;
         }
         return iteratorValid;
      }
      
      public function showDropFeedback(param1:DragEvent) : void
      {
         var _loc6_:Class = null;
         var _loc7_:EdgeMetrics = null;
         if(!mx_internal::dropIndicator)
         {
            if(!(_loc6_ = getStyle("dropIndicatorSkin")))
            {
               _loc6_ = ListDropIndicator;
            }
            mx_internal::dropIndicator = IFlexDisplayObject(new _loc6_());
            _loc7_ = viewMetrics;
            drawFocus(true);
            mx_internal::dropIndicator.x = 2;
            mx_internal::dropIndicator.setActualSize(-4,4);
            mx_internal::dropIndicator.visible = true;
            listContent.addChild(DisplayObject(mx_internal::dropIndicator));
            if(collection)
            {
               if(mx_internal::dragScrollingInterval == 0)
               {
                  mx_internal::dragScrollingInterval = setInterval(dragScroll,15);
               }
            }
         }
         var _loc2_:int = 0;
         var _loc3_:int = rowInfo[_loc2_ - offscreenExtraRowsBottom - 1].y + rowInfo[_loc2_ - offscreenExtraRowsBottom - 1].height > 0 - 0 ? 1 : 0;
         var _loc4_:Number = (_loc4_ = calculateDropIndex(param1)) - verticalScrollPosition;
         var _loc5_:Number = 0;
         if(_loc4_ >= _loc5_)
         {
            if(_loc3_)
            {
               _loc4_ = _loc5_ - 1;
            }
            else
            {
               _loc4_ = _loc5_;
            }
         }
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         mx_internal::dropIndicator.y = calculateDropIndicatorY(_loc5_,_loc4_ + offscreenExtraRowsTop);
      }
      
      public function set data(param1:Object) : void
      {
         _data = param1;
         if(Boolean(_listData) && _listData is DataGridListData)
         {
            selectedItem = _data[DataGridListData(_listData).dataField];
         }
         else if(_listData is ListData && ListData(_listData).labelField in _data)
         {
            selectedItem = _data[ListData(_listData).labelField];
         }
         else
         {
            selectedItem = _data;
         }
         dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
      }
      
      public function get rowCount() : int
      {
         return _rowCount;
      }
      
      mx_internal function get rendererArray() : Array
      {
         return listItems;
      }
      
      public function get columnCount() : int
      {
         return _columnCount;
      }
      
      protected function purgeItemRenderers() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Array = null;
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Dictionary = null;
         var _loc6_:* = undefined;
         rendererChanged = false;
         while(false)
         {
            _loc2_ = listItems.pop();
            while(_loc2_.length)
            {
               _loc3_ = IListItemRenderer(_loc2_.pop());
               if(_loc3_)
               {
                  listContent.removeChild(DisplayObject(_loc3_));
                  if(false)
                  {
                     delete visibleData[itemToUID(dataItemWrappersByRenderer[_loc3_])];
                  }
                  else
                  {
                     delete visibleData[itemToUID(_loc3_.data)];
                  }
               }
            }
         }
         while(false)
         {
            if((_loc4_ = DisplayObject(freeItemRenderers.pop())).parent)
            {
               listContent.removeChild(_loc4_);
            }
         }
         for(_loc1_ in freeItemRenderersByFactory)
         {
            _loc5_ = freeItemRenderersByFactory[_loc1_];
            for(_loc6_ in _loc5_)
            {
               _loc4_ = DisplayObject(_loc6_);
               delete _loc5_[_loc6_];
               if(_loc4_.parent)
               {
                  listContent.removeChild(_loc4_);
               }
            }
         }
         rowMap = {};
         listContent.rowInfo = [];
      }
      
      protected function mouseEventToItemRenderer(param1:MouseEvent) : mx.controls.listClasses.IListItemRenderer
      {
         return mx_internal::mouseEventToItemRendererOrEditor(param1);
      }
      
      protected function UIDToItemRenderer(param1:String) : mx.controls.listClasses.IListItemRenderer
      {
         if(!listContent)
         {
            return null;
         }
         return visibleData[param1];
      }
      
      public function get dragEnabled() : Boolean
      {
         return _dragEnabled;
      }
      
      private function findPendingResultHandler(param1:Object, param2:ListBaseFindPending) : void
      {
         iterator.seek(param2.bookmark,param2.offset);
         findStringLoop(param2.searchString,param2.startingBookmark,param2.currentIndex,param2.stopIndex);
      }
      
      protected function set allowItemSizeChangeNotification(param1:Boolean) : void
      {
         listContent.mx_internal::allowItemSizeChangeNotification = param1;
      }
      
      [Bindable("iconFunctionChanged")]
      public function get iconFunction() : Function
      {
         return _iconFunction;
      }
      
      protected function collectionChangeHandler(param1:Event) : void
      {
         var len:int = 0;
         var index:int = 0;
         var i:int = 0;
         var data:mx.controls.listClasses.ListBaseSelectionData = null;
         var p:String = null;
         var selectedUID:String = null;
         var ce:CollectionEvent = null;
         var emitEvent:Boolean = false;
         var oldUID:String = null;
         var sd:mx.controls.listClasses.ListBaseSelectionData = null;
         var requiresValueCommit:Boolean = false;
         var firstUID:String = null;
         var uid:String = null;
         var deletedItems:Array = null;
         var fakeRemove:CollectionEvent = null;
         var event:Event = param1;
         if(event is CollectionEvent)
         {
            ce = CollectionEvent(event);
            if(ce.kind == CollectionEventKind.ADD)
            {
               prepareDataEffect(ce);
               if(ce.location == 0 && verticalScrollPosition == 0)
               {
                  try
                  {
                     iterator.seek(CursorBookmark.FIRST);
                     if(!iteratorValid)
                     {
                        iteratorValid = true;
                        lastSeekPending = null;
                     }
                  }
                  catch(e:ItemPendingError)
                  {
                     lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,0);
                     e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                     iteratorValid = false;
                  }
               }
               else if(mx_internal::listType == "vertical" && verticalScrollPosition >= ce.location)
               {
                  super.verticalScrollPosition += ce.items.length;
               }
               emitEvent = adjustAfterAdd(ce.items,ce.location);
               if(emitEvent)
               {
                  dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
               }
            }
            else if(ce.kind == CollectionEventKind.REPLACE)
            {
               selectedUID = !!selectedItem ? itemToUID(selectedItem) : null;
               len = int(ce.items.length);
               i = 0;
               while(i < len)
               {
                  oldUID = itemToUID(ce.items[i].oldValue);
                  sd = selectedData[oldUID];
                  if(sd)
                  {
                     sd.data = ce.items[i].newValue;
                     delete selectedData[oldUID];
                     selectedData[itemToUID(sd.data)] = sd;
                     if(selectedUID == oldUID)
                     {
                        _selectedItem = sd.data;
                        dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                     }
                  }
                  i++;
               }
               prepareDataEffect(ce);
            }
            else if(ce.kind == CollectionEventKind.REMOVE)
            {
               prepareDataEffect(ce);
               requiresValueCommit = false;
               if(false && Boolean(listItems[0].length))
               {
                  firstUID = String(rowMap[listItems[0][0].name].uid);
                  selectedUID = !!selectedItem ? itemToUID(selectedItem) : null;
                  i = 0;
                  while(i < ce.items.length)
                  {
                     uid = itemToUID(ce.items[i]);
                     if(uid == firstUID && verticalScrollPosition == 0)
                     {
                        try
                        {
                           iterator.seek(CursorBookmark.FIRST);
                           if(!iteratorValid)
                           {
                              iteratorValid = true;
                              lastSeekPending = null;
                           }
                        }
                        catch(e1:ItemPendingError)
                        {
                           lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,0);
                           e1.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                           iteratorValid = false;
                           continue;
                        }
                     }
                     if(false)
                     {
                        removeSelectionData(uid);
                     }
                     if(selectedUID == uid)
                     {
                        _selectedItem = null;
                        mx_internal::_selectedIndex = -1;
                        requiresValueCommit = true;
                     }
                     removeIndicators(uid);
                     i++;
                  }
                  if(mx_internal::listType == "vertical" && verticalScrollPosition >= ce.location)
                  {
                     if(verticalScrollPosition > ce.location)
                     {
                        super.verticalScrollPosition = verticalScrollPosition - Math.min(ce.items.length,verticalScrollPosition - ce.location);
                     }
                     else if(verticalScrollPosition >= collection.length)
                     {
                        super.verticalScrollPosition = Math.max(-1,0);
                     }
                     try
                     {
                        offscreenExtraRowsTop = Math.min(offscreenExtraRowsTop,verticalScrollPosition);
                        index = scrollPositionToIndex(horizontalScrollPosition,verticalScrollPosition - offscreenExtraRowsTop);
                        iterator.seek(CursorBookmark.FIRST,index);
                        if(!iteratorValid)
                        {
                           iteratorValid = true;
                           lastSeekPending = null;
                        }
                     }
                     catch(e2:ItemPendingError)
                     {
                        lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,index);
                        e2.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                        iteratorValid = false;
                     }
                  }
                  emitEvent = adjustAfterRemove(ce.items,ce.location,requiresValueCommit);
                  if(emitEvent)
                  {
                     dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                  }
               }
            }
            else if(ce.kind == CollectionEventKind.MOVE)
            {
               if(ce.oldLocation < ce.location)
               {
                  for(p in selectedData)
                  {
                     data = selectedData[p];
                     if(data.index > ce.oldLocation && data.index < ce.location)
                     {
                        --data.index;
                     }
                     else if(data.index == ce.oldLocation)
                     {
                        data.index = ce.location;
                     }
                  }
                  if(mx_internal::_selectedIndex > ce.oldLocation && mx_internal::_selectedIndex < ce.location)
                  {
                     --mx_internal::_selectedIndex;
                  }
                  else if(mx_internal::_selectedIndex == ce.oldLocation)
                  {
                     mx_internal::_selectedIndex = ce.location;
                  }
               }
               else if(ce.location < ce.oldLocation)
               {
                  for(p in selectedData)
                  {
                     data = selectedData[p];
                     if(data.index > ce.location && data.index < ce.oldLocation)
                     {
                        ++data.index;
                     }
                     else if(data.index == ce.oldLocation)
                     {
                        data.index = ce.location;
                     }
                  }
                  if(mx_internal::_selectedIndex > ce.location && mx_internal::_selectedIndex < ce.oldLocation)
                  {
                     ++mx_internal::_selectedIndex;
                  }
                  else if(mx_internal::_selectedIndex == ce.oldLocation)
                  {
                     mx_internal::_selectedIndex = ce.location;
                  }
               }
               if(ce.oldLocation == verticalScrollPosition)
               {
                  if(ce.location > maxVerticalScrollPosition)
                  {
                     iterator.seek(CursorBookmark.CURRENT,maxVerticalScrollPosition - ce.location);
                  }
                  super.verticalScrollPosition = Math.min(ce.location,maxVerticalScrollPosition);
               }
               else if(ce.location >= verticalScrollPosition && ce.oldLocation < verticalScrollPosition)
               {
                  seekNextSafely(iterator,verticalScrollPosition);
               }
               else if(ce.location <= verticalScrollPosition && ce.oldLocation > verticalScrollPosition)
               {
                  seekPreviousSafely(iterator,verticalScrollPosition);
               }
            }
            else if(ce.kind == CollectionEventKind.REFRESH)
            {
               if(anchorBookmark)
               {
                  try
                  {
                     iterator.seek(anchorBookmark,0);
                     if(!iteratorValid)
                     {
                        iteratorValid = true;
                        lastSeekPending = null;
                     }
                  }
                  catch(e:ItemPendingError)
                  {
                     bSortItemPending = true;
                     lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(anchorBookmark,0);
                     e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                     iteratorValid = false;
                  }
                  catch(cursorError:CursorError)
                  {
                     clearSelected();
                  }
                  adjustAfterSort();
               }
               else
               {
                  try
                  {
                     index = scrollPositionToIndex(horizontalScrollPosition,verticalScrollPosition);
                     iterator.seek(CursorBookmark.FIRST,index);
                     if(!iteratorValid)
                     {
                        iteratorValid = true;
                        lastSeekPending = null;
                     }
                  }
                  catch(e:ItemPendingError)
                  {
                     bSortItemPending = true;
                     lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,index);
                     e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                     iteratorValid = false;
                  }
               }
            }
            else if(ce.kind == CollectionEventKind.RESET)
            {
               if(runningDataEffect && false)
               {
                  deletedItems = mx_internal::reconstructDataFromListItems();
                  if(deletedItems.length)
                  {
                     fakeRemove = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
                     fakeRemove.kind = CollectionEventKind.REMOVE;
                     fakeRemove.items = deletedItems;
                     fakeRemove.location = 0;
                     prepareDataEffect(fakeRemove);
                  }
               }
               try
               {
                  iterator.seek(CursorBookmark.FIRST);
                  if(!iteratorValid)
                  {
                     iteratorValid = true;
                     lastSeekPending = null;
                  }
                  mx_internal::collectionIterator.seek(CursorBookmark.FIRST);
               }
               catch(e:ItemPendingError)
               {
                  lastSeekPending = new mx.controls.listClasses.ListBaseSeekPending(CursorBookmark.FIRST,0);
                  e.addResponder(new ItemResponder(seekPendingResultHandler,seekPendingFailureHandler,lastSeekPending));
                  iteratorValid = false;
               }
               if(mx_internal::bSelectedIndexChanged || bSelectedItemChanged || bSelectedIndicesChanged || bSelectedItemsChanged)
               {
                  mx_internal::bSelectionChanged = true;
               }
               else
               {
                  mx_internal::commitSelectedIndex(-1);
               }
               if(isNaN(verticalScrollPositionPending))
               {
                  verticalScrollPositionPending = 0;
                  super.verticalScrollPosition = 0;
               }
               if(isNaN(horizontalScrollPositionPending))
               {
                  horizontalScrollPositionPending = 0;
                  super.horizontalScrollPosition = 0;
               }
               invalidateSize();
            }
            else if(ce.kind == CollectionEventKind.UPDATE)
            {
               selectedUID = !!selectedItem ? itemToUID(selectedItem) : null;
               len = int(ce.items.length);
               i = 0;
               while(i < len)
               {
                  if(ce.items[i].property == "uid")
                  {
                     oldUID = String(ce.items[i].oldValue);
                     sd = selectedData[oldUID];
                     if(sd)
                     {
                        sd.data = ce.items[i].target;
                        delete selectedData[oldUID];
                        selectedData[ce.items[i].newValue] = sd;
                        if(selectedUID == oldUID)
                        {
                           _selectedItem = sd.data;
                           dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                        }
                     }
                  }
                  i++;
               }
            }
         }
         itemsSizeChanged = true;
         invalidateDisplayList();
      }
      
      public function set dataProvider(param1:Object) : void
      {
         var _loc3_:XMLList = null;
         var _loc4_:* = null;
         if(collection)
         {
            collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler);
         }
         if(param1 is Array)
         {
            collection = new ArrayCollection(param1 as Array);
         }
         else if(param1 is ICollectionView)
         {
            collection = ICollectionView(param1);
         }
         else if(param1 is IList)
         {
            collection = new ListCollectionView(IList(param1));
         }
         else if(param1 is XMLList)
         {
            collection = new XMLListCollection(param1 as XMLList);
         }
         else if(param1 is XML)
         {
            _loc3_ = new XMLList();
            _loc3_ += param1;
            collection = new XMLListCollection(_loc3_);
         }
         else
         {
            _loc4_ = [];
            if(param1 != null)
            {
               _loc4_.push(param1);
            }
            collection = new ArrayCollection(_loc4_);
         }
         iterator = collection.createCursor();
         mx_internal::collectionIterator = collection.createCursor();
         collection.addEventListener(CollectionEvent.COLLECTION_CHANGE,collectionChangeHandler,false,0,true);
         clearSelectionData();
         var _loc2_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
         _loc2_.kind = CollectionEventKind.RESET;
         collectionChangeHandler(_loc2_);
         dispatchEvent(_loc2_);
         itemsNeedMeasurement = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      protected function destroyRow(param1:int, param2:int) : void
      {
         var _loc3_:mx.controls.listClasses.IListItemRenderer = null;
         var _loc4_:String = String(rowInfo[param1].uid);
         removeIndicators(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            _loc3_ = listItems[param1][_loc5_];
            if(_loc3_.data)
            {
               delete visibleData[_loc4_];
            }
            addToFreeItemRenderers(_loc3_);
            _loc5_++;
         }
      }
      
      protected function dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         hideDropFeedback(param1);
         mx_internal::lastDragEvent = null;
         mx_internal::resetDragScrolling();
         if(enabled && param1.dragSource.hasFormat("items"))
         {
            if(!dataProvider)
            {
               dataProvider = [];
            }
            _loc2_ = param1.dragSource.dataForFormat("items") as Array;
            _loc3_ = calculateDropIndex(param1);
            if(param1.action == DragManager.MOVE && dragMoveEnabled)
            {
               if(param1.dragInitiator == this)
               {
                  (_loc4_ = selectedIndices).sort(Array.NUMERIC);
                  _loc5_ = int(_loc4_.length - 1);
                  while(_loc5_ >= 0)
                  {
                     mx_internal::collectionIterator.seek(CursorBookmark.FIRST,_loc4_[_loc5_]);
                     if(_loc4_[_loc5_] < _loc3_)
                     {
                        _loc3_--;
                     }
                     mx_internal::collectionIterator.remove();
                     _loc5_--;
                  }
                  clearSelected(false);
               }
            }
            mx_internal::collectionIterator.seek(CursorBookmark.FIRST,_loc3_);
            _loc5_ = int(_loc2_.length - 1);
            while(_loc5_ >= 0)
            {
               if(param1.action == DragManager.COPY)
               {
                  mx_internal::collectionIterator.insert(copyItemWithUID(_loc2_[_loc5_]));
               }
               else if(param1.action == DragManager.MOVE)
               {
                  mx_internal::collectionIterator.insert(_loc2_[_loc5_]);
               }
               _loc5_--;
            }
         }
         mx_internal::lastDragEvent = null;
      }
      
      [Bindable("dataTipFunctionChanged")]
      public function get dataTipFunction() : Function
      {
         return _dataTipFunction;
      }
      
      public function scrollToIndex(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(param1 >= verticalScrollPosition + listItems.length - offscreenExtraRowsBottom || param1 < verticalScrollPosition)
         {
            _loc2_ = Math.min(param1,maxVerticalScrollPosition);
            verticalScrollPosition = _loc2_;
            return true;
         }
         return false;
      }
      
      protected function addToFreeItemRenderers(param1:mx.controls.listClasses.IListItemRenderer) : void
      {
         DisplayObject(param1).visible = false;
         var _loc2_:IFactory = factoryMap[param1];
         var _loc3_:ItemWrapper = dataItemWrappersByRenderer[param1];
         var _loc4_:String = !!_loc3_ ? itemToUID(_loc3_) : itemToUID(param1.data);
         if(visibleData[_loc4_] == param1)
         {
            delete visibleData[_loc4_];
         }
         if(_loc3_)
         {
            reservedItemRenderers[itemToUID(_loc3_)] = param1;
         }
         else
         {
            if(!freeItemRenderersByFactory)
            {
               freeItemRenderersByFactory = new Dictionary(true);
            }
            if(freeItemRenderersByFactory[_loc2_] == undefined)
            {
               freeItemRenderersByFactory[_loc2_] = new Dictionary(true);
            }
            freeItemRenderersByFactory[_loc2_][param1] = 1;
            if(_loc2_ == itemRenderer)
            {
               freeItemRenderers.push(param1);
            }
         }
         delete rowMap[param1.name];
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            ListBase.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      public function isItemSelectable(param1:Object) : Boolean
      {
         if(!selectable)
         {
            return false;
         }
         if(param1 == null)
         {
            return false;
         }
         return true;
      }
      
      private function findPendingFailureHandler(param1:Object, param2:ListBaseFindPending) : void
      {
      }
      
      public function get rowHeight() : Number
      {
         return _rowHeight;
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return _data;
      }
      
      mx_internal function adjustOffscreenRowsAndColumns() : void
      {
         offscreenExtraColumns = 0;
         offscreenExtraRows = offscreenExtraRowsOrColumns;
      }
      
      protected function indexToRow(param1:int) : int
      {
         return param1;
      }
      
      protected function get dragImageOffsets() : Point
      {
         var _loc1_:Point = new Point();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(false)
            {
               _loc1_.x = listItems[_loc3_][0].x;
               _loc1_.y = listItems[_loc3_][0].y;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      [Bindable("collectionChange")]
      public function get dataProvider() : Object
      {
         if(actualCollection)
         {
            return actualCollection;
         }
         return collection;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(false)
         {
            itemsSizeChanged = true;
            invalidateDisplayList();
         }
         else if(param1 == "paddingTop")
         {
            cachedPaddingTopInvalid = true;
            invalidateProperties();
         }
         else if(param1 == "paddingBottom")
         {
            cachedPaddingBottomInvalid = true;
            invalidateProperties();
         }
         else if(param1 == "verticalAlign")
         {
            cachedVerticalAlignInvalid = true;
            invalidateProperties();
         }
         else if(param1 == "itemsChangeEffect")
         {
            cachedItemsChangeEffect = null;
         }
         else if(Boolean(listContent) && Boolean(listItems))
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = int(listItems[_loc3_].length);
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  if(listItems[_loc3_][_loc5_])
                  {
                     listItems[_loc3_][_loc5_].styleChanged(param1);
                  }
                  _loc5_++;
               }
               _loc3_++;
            }
         }
         super.styleChanged(param1);
         if(mx_internal::invalidateSizeFlag)
         {
            itemsNeedMeasurement = true;
            invalidateProperties();
         }
         if(StyleManager.isSizeInvalidatingStyle(param1))
         {
            scrollAreaChanged = true;
         }
      }
      
      private function selectionPendingResultHandler(param1:Object, param2:ListBaseSelectionPending) : void
      {
         iterator.seek(param2.bookmark,param2.offset);
         shiftSelectionLoop(param2.incrementing,param2.index,param2.stopData,param2.transition,param2.placeHolder);
      }
      
      public function set selectedItems(param1:Array) : void
      {
         if(!collection || false)
         {
            _selectedItems = param1;
            bSelectedItemsChanged = true;
            mx_internal::bSelectionChanged = true;
            invalidateDisplayList();
            return;
         }
         commitSelectedItems(param1);
      }
      
      public function itemToDataTip(param1:Object) : String
      {
         var data:Object = param1;
         if(data == null)
         {
            return " ";
         }
         if(dataTipFunction != null)
         {
            return dataTipFunction(data);
         }
         if(data is XML)
         {
            try
            {
               if(data[dataTipField].length() != 0)
               {
                  data = data[dataTipField];
               }
            }
            catch(e:Error)
            {
            }
         }
         else if(data is Object)
         {
            try
            {
               if(data[dataTipField] != null)
               {
                  data = data[dataTipField];
               }
               else if(data.label != null)
               {
                  data = data.label;
               }
            }
            catch(e:Error)
            {
            }
         }
         if(data is String)
         {
            return String(data);
         }
         try
         {
            return data.toString();
         }
         catch(e:Error)
         {
            return " ";
         }
      }
      
      protected function dragStartHandler(param1:DragEvent) : void
      {
         var _loc2_:DragSource = null;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         _loc2_ = new DragSource();
         addDragData(_loc2_);
         DragManager.doDrag(this,_loc2_,param1,dragImage,0,0,0.5,dragMoveEnabled);
      }
      
      private function cleanupAfterDataChangeEffect() : void
      {
         if(runningDataEffect || runDataEffectNextUpdate)
         {
            return;
         }
         var _loc1_:int = scrollPositionToIndex(horizontalScrollPosition - offscreenExtraColumnsLeft,verticalScrollPosition - offscreenExtraRowsTop);
         iterator.seek(CursorBookmark.FIRST,_loc1_);
         dataEffectCompleted = true;
         itemsSizeChanged = true;
         invalidateList();
         dataItemWrappersByRenderer = new Dictionary();
      }
      
      mx_internal function setBookmarkPendingResultHandler(param1:Object, param2:Object) : void
      {
         var placeHolder:CursorBookmark = null;
         var data:Object = param1;
         var info:Object = param2;
         placeHolder = iterator.bookmark;
         try
         {
            iterator.seek(CursorBookmark.FIRST,info.value);
            this[info.property] = iterator.bookmark;
         }
         catch(e:ItemPendingError)
         {
            e.addResponder(new ItemResponder(mx_internal::setBookmarkPendingResultHandler,mx_internal::setBookmarkPendingFailureHandler,info));
         }
         iterator.seek(placeHolder);
      }
      
      protected function removeIndicators(param1:String) : void
      {
         if(false)
         {
            selectionTweens[param1].removeEventListener(TweenEvent.TWEEN_UPDATE,mx_internal::selectionTween_updateHandler);
            selectionTweens[param1].removeEventListener(TweenEvent.TWEEN_END,mx_internal::selectionTween_endHandler);
            if(selectionIndicators[param1].alpha < 1)
            {
               Tween.mx_internal::removeTween(selectionTweens[param1]);
            }
            delete selectionTweens[param1];
         }
         if(false)
         {
            selectionIndicators[param1].parent.removeChild(selectionIndicators[param1]);
            selectionIndicators[param1] = null;
         }
         if(param1 == highlightUID)
         {
            highlightItemRenderer = null;
            highlightUID = null;
            clearHighlightIndicator(highlightIndicator,UIDToItemRenderer(param1));
         }
         if(param1 == caretUID)
         {
            caretItemRenderer = null;
            caretUID = null;
            clearCaretIndicator(caretIndicator,UIDToItemRenderer(param1));
         }
      }
      
      private function mouseIsUp() : void
      {
         systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP,mouseUpHandler,true);
         systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,mouseLeaveHandler);
         if(!dragEnabled && mx_internal::dragScrollingInterval != 0)
         {
            clearInterval(mx_internal::dragScrollingInterval);
            mx_internal::dragScrollingInterval = 0;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:CursorBookmark = null;
         var _loc6_:int = 0;
         super.updateDisplayList(param1,param2);
         if(oldUnscaledWidth == param1 && oldUnscaledHeight == param2 && !itemsSizeChanged && !mx_internal::bSelectionChanged && !scrollAreaChanged)
         {
            return;
         }
         if(oldUnscaledWidth != param1)
         {
            itemsSizeChanged = true;
         }
         mx_internal::removeClipMask();
         var _loc4_:Graphics;
         (_loc4_ = selectionLayer.graphics).clear();
         if(false && false)
         {
            _loc4_.beginFill(8421504,0);
            _loc4_.drawRect(0,0,listContent.width,listContent.height);
            _loc4_.endFill();
         }
         if(rendererChanged)
         {
            purgeItemRenderers();
         }
         else if(dataEffectCompleted)
         {
            partialPurgeItemRenderers();
         }
         adjustListContent(param1,param2);
         var _loc5_:Boolean;
         if(_loc5_ = Boolean(collection) && false)
         {
            adjustScrollPosition();
         }
         if(oldUnscaledWidth == param1 && !scrollAreaChanged && !itemsSizeChanged && false && iterator && columnCount == 1)
         {
            _loc6_ = -1;
            if(oldUnscaledHeight > param2)
            {
               reduceRows(_loc6_);
            }
            else
            {
               makeAdditionalRows(_loc6_);
            }
         }
         else
         {
            if(iterator)
            {
               _loc3_ = iterator.bookmark;
            }
            clearIndicators();
            rendererTrackingSuspended = true;
            if(iterator)
            {
               if(Boolean(offscreenExtraColumns) || Boolean(offscreenExtraColumnsLeft) || Boolean(offscreenExtraColumnsRight))
               {
                  makeRowsAndColumnsWithExtraColumns(param1,param2);
               }
               else
               {
                  makeRowsAndColumnsWithExtraRows(param1,param2);
               }
            }
            else
            {
               makeRowsAndColumns(0,0,listContent.width,listContent.height,0,0);
            }
            rendererTrackingSuspended = false;
            seekPositionIgnoreError(iterator,_loc3_);
         }
         oldUnscaledWidth = param1;
         oldUnscaledHeight = param2;
         configureScrollBars();
         mx_internal::addClipMask(true);
         itemsSizeChanged = false;
         wordWrapChanged = false;
         adjustSelectionSettings(_loc5_);
         if(keySelectionPending && iteratorValid)
         {
            keySelectionPending = false;
            finishKeySelection();
         }
      }
      
      protected function dragCompleteHandler(param1:DragEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         mx_internal::isPressed = false;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.action == DragManager.MOVE && dragMoveEnabled)
         {
            if(param1.relatedObject != this)
            {
               _loc2_ = selectedIndices;
               _loc2_.sort(Array.NUMERIC);
               _loc3_ = int(_loc2_.length);
               _loc4_ = _loc3_ - 1;
               while(_loc4_ >= 0)
               {
                  mx_internal::collectionIterator.seek(CursorBookmark.FIRST,_loc2_[_loc4_]);
                  mx_internal::collectionIterator.remove();
                  _loc4_--;
               }
               clearSelected(false);
            }
         }
         mx_internal::lastDragEvent = null;
         mx_internal::resetDragScrolling();
      }
      
      public function getItemRendererFactory(param1:Object) : IFactory
      {
         if(param1 == null)
         {
            return nullItemRenderer;
         }
         return itemRenderer;
      }
   }
}
