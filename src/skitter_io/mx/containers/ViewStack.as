package mx.containers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.automation.IAutomationObject;
   import mx.core.Container;
   import mx.core.ContainerCreationPolicy;
   import mx.core.EdgeMetrics;
   import mx.core.IInvalidating;
   import mx.core.IUIComponent;
   import mx.core.ScrollPolicy;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.effects.Effect;
   import mx.effects.EffectManager;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.graphics.RoundedRectangle;
   import mx.managers.HistoryManager;
   import mx.managers.IHistoryManagerClient;
   
   public class ViewStack extends Container implements IHistoryManagerClient
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var dispatchChangeEventPending:Boolean = false;
      
      private var historyManagementEnabledChanged:Boolean = false;
      
      mx_internal var vsPreferredHeight:Number;
      
      private var initialSelectedIndex:int = -1;
      
      private var firstTime:Boolean = true;
      
      mx_internal var _historyManagementEnabled:Boolean = false;
      
      private var overlayChild:Container;
      
      private var overlayTargetArea:RoundedRectangle;
      
      private var proposedSelectedIndex:int = -1;
      
      private var needToInstantiateSelectedChild:Boolean = false;
      
      private var bSaveState:Boolean = false;
      
      mx_internal var vsMinHeight:Number;
      
      private var bInLoadState:Boolean = false;
      
      mx_internal var vsPreferredWidth:Number;
      
      private var _resizeToContent:Boolean = false;
      
      mx_internal var vsMinWidth:Number;
      
      private var lastIndex:int = -1;
      
      private var _selectedIndex:int = -1;
      
      public function ViewStack()
      {
         super();
         addEventListener(ChildExistenceChangedEvent.CHILD_ADD,childAddHandler);
         addEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,childRemoveHandler);
      }
      
      protected function get contentHeight() : Number
      {
         var _loc1_:EdgeMetrics = viewMetricsAndPadding;
         return unscaledHeight - _loc1_.top - _loc1_.bottom;
      }
      
      public function set selectedChild(param1:Container) : void
      {
         var _loc2_:int = getChildIndex(DisplayObject(param1));
         if(_loc2_ >= 0 && _loc2_ < numChildren)
         {
            selectedIndex = _loc2_;
         }
      }
      
      override mx_internal function setActualCreationPolicies(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Container = null;
         super.mx_internal::setActualCreationPolicies(param1);
         if(param1 == ContainerCreationPolicy.ALL && numChildren > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < numChildren)
            {
               _loc3_ = getChildAt(_loc2_) as Container;
               if(Boolean(_loc3_) && _loc3_.mx_internal::numChildrenCreated == -1)
               {
                  _loc3_.createComponentsFromDescriptors();
               }
               _loc2_++;
            }
         }
      }
      
      private function dispatchChangeEvent(param1:int, param2:int) : void
      {
         var _loc3_:IndexChangedEvent = new IndexChangedEvent(IndexChangedEvent.CHANGE);
         _loc3_.oldIndex = param1;
         _loc3_.newIndex = param2;
         _loc3_.relatedObject = getChildAt(param2);
         dispatchEvent(_loc3_);
      }
      
      protected function get contentY() : Number
      {
         return getStyle("paddingTop");
      }
      
      protected function commitSelectedIndex(param1:int) : void
      {
         var _loc3_:Container = null;
         var _loc4_:Effect = null;
         if(numChildren == 0)
         {
            _selectedIndex = -1;
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > numChildren - 1)
         {
            param1 = numChildren - 1;
         }
         if(lastIndex != -1 && lastIndex < numChildren)
         {
            Container(getChildAt(lastIndex)).endEffectsStarted();
         }
         if(_selectedIndex != -1)
         {
            selectedChild.endEffectsStarted();
         }
         lastIndex = _selectedIndex;
         if(param1 == lastIndex)
         {
            return;
         }
         _selectedIndex = param1;
         if(initialSelectedIndex == -1)
         {
            initialSelectedIndex = _selectedIndex;
         }
         if(lastIndex != -1 && param1 != -1)
         {
            dispatchChangeEventPending = true;
         }
         var _loc2_:Boolean = false;
         if(lastIndex != -1 && lastIndex < numChildren)
         {
            _loc3_ = Container(getChildAt(lastIndex));
            _loc3_.setVisible(false);
            if(_loc3_.getStyle("hideEffect"))
            {
               if(_loc4_ = EffectManager.mx_internal::lastEffectCreated)
               {
                  _loc4_.addEventListener(EffectEvent.EFFECT_END,hideEffectEndHandler);
                  _loc2_ = true;
               }
            }
         }
         if(!_loc2_)
         {
            hideEffectEndHandler(null);
         }
      }
      
      private function instantiateSelectedChild() : void
      {
         if(!selectedChild)
         {
            return;
         }
         if(Boolean(selectedChild) && false)
         {
            if(initialized)
            {
               selectedChild.addEventListener(FlexEvent.CREATION_COMPLETE,childCreationCompleteHandler);
            }
            selectedChild.createComponentsFromDescriptors(true);
         }
         if(selectedChild is IInvalidating)
         {
            IInvalidating(selectedChild).invalidateSize();
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function initializeHandler(param1:FlexEvent) : void
      {
         overlayChild.removeEventListener(FlexEvent.INITIALIZE,initializeHandler);
         UIComponent(overlayChild).mx_internal::addOverlay(mx_internal::overlayColor,overlayTargetArea);
      }
      
      public function set historyManagementEnabled(param1:Boolean) : void
      {
         if(param1 != mx_internal::_historyManagementEnabled)
         {
            mx_internal::_historyManagementEnabled = param1;
            historyManagementEnabledChanged = true;
            invalidateProperties();
         }
      }
      
      override public function get horizontalScrollPolicy() : String
      {
         return ScrollPolicy.OFF;
      }
      
      private function childAddHandler(param1:ChildExistenceChangedEvent) : void
      {
         var _loc4_:IUIComponent = null;
         var _loc2_:DisplayObject = param1.relatedObject;
         var _loc3_:int = getChildIndex(_loc2_);
         if(_loc2_ is IUIComponent)
         {
            (_loc4_ = IUIComponent(_loc2_)).visible = false;
         }
         if(numChildren == 1 && proposedSelectedIndex == -1)
         {
            proposedSelectedIndex = 0;
            invalidateProperties();
         }
         else if(_loc3_ <= selectedIndex && numChildren > 1 && proposedSelectedIndex == -1)
         {
            ++selectedIndex;
         }
         if(_loc2_ is IAutomationObject)
         {
            IAutomationObject(_loc2_).showInAutomationHierarchy = true;
         }
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         if(historyManagementEnabled)
         {
            HistoryManager.register(this);
         }
      }
      
      public function get resizeToContent() : Boolean
      {
         return _resizeToContent;
      }
      
      public function saveState() : Object
      {
         var _loc1_:int = _selectedIndex == -1 ? 0 : _selectedIndex;
         return {"selectedIndex":_loc1_};
      }
      
      override public function get autoLayout() : Boolean
      {
         return true;
      }
      
      override mx_internal function removeOverlay() : void
      {
         if(overlayChild)
         {
            UIComponent(overlayChild).mx_internal::removeOverlay();
            overlayChild = null;
         }
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         HistoryManager.unregister(this);
      }
      
      [Bindable("creationComplete")]
      [Bindable("valueCommit")]
      public function get selectedChild() : Container
      {
         if(selectedIndex == -1)
         {
            return null;
         }
         return Container(getChildAt(selectedIndex));
      }
      
      private function hideEffectEndHandler(param1:EffectEvent) : void
      {
         if(param1)
         {
            param1.currentTarget.removeEventListener(EffectEvent.EFFECT_END,hideEffectEndHandler);
         }
         needToInstantiateSelectedChild = true;
         invalidateProperties();
         if(bSaveState)
         {
            HistoryManager.save();
            bSaveState = false;
         }
      }
      
      private function childCreationCompleteHandler(param1:FlexEvent) : void
      {
         param1.target.removeEventListener(FlexEvent.CREATION_COMPLETE,childCreationCompleteHandler);
         param1.target.dispatchEvent(new FlexEvent(FlexEvent.SHOW));
      }
      
      override public function set horizontalScrollPolicy(param1:String) : void
      {
      }
      
      public function get historyManagementEnabled() : Boolean
      {
         return mx_internal::_historyManagementEnabled;
      }
      
      public function loadState(param1:Object) : void
      {
         var _loc2_:int = !!param1 ? int(param1.selectedIndex) : 0;
         if(_loc2_ == -1)
         {
            _loc2_ = initialSelectedIndex;
         }
         if(_loc2_ == -1)
         {
            _loc2_ = 0;
         }
         if(_loc2_ != _selectedIndex)
         {
            bInLoadState = true;
            selectedIndex = _loc2_;
            bInLoadState = false;
         }
      }
      
      protected function get contentWidth() : Number
      {
         var _loc1_:EdgeMetrics = viewMetricsAndPadding;
         return unscaledWidth - _loc1_.left - _loc1_.right;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(historyManagementEnabledChanged)
         {
            if(historyManagementEnabled)
            {
               HistoryManager.register(this);
            }
            else
            {
               HistoryManager.unregister(this);
            }
            historyManagementEnabledChanged = false;
         }
         if(proposedSelectedIndex != -1)
         {
            commitSelectedIndex(proposedSelectedIndex);
            proposedSelectedIndex = -1;
         }
         if(needToInstantiateSelectedChild)
         {
            instantiateSelectedChild();
            needToInstantiateSelectedChild = false;
         }
         if(dispatchChangeEventPending)
         {
            dispatchChangeEvent(lastIndex,selectedIndex);
            dispatchChangeEventPending = false;
         }
         if(firstTime)
         {
            firstTime = false;
            addEventListener(Event.ADDED_TO_STAGE,addedToStageHandler,false,0,true);
            addEventListener(Event.REMOVED_FROM_STAGE,removedFromStageHandler,false,0,true);
         }
      }
      
      public function set resizeToContent(param1:Boolean) : void
      {
         if(param1 != _resizeToContent)
         {
            _resizeToContent = param1;
            if(param1)
            {
               invalidateSize();
            }
         }
      }
      
      override public function createComponentsFromDescriptors(param1:Boolean = true) : void
      {
         if(actualCreationPolicy == ContainerCreationPolicy.ALL)
         {
            super.createComponentsFromDescriptors();
            return;
         }
         var _loc2_:int = numChildren;
         var _loc3_:int = !!childDescriptors ? 0 : 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            createComponentFromDescriptor(childDescriptors[_loc4_],false);
            _loc4_++;
         }
         mx_internal::numChildrenCreated = numChildren - _loc2_;
         processedDescriptors = true;
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc8_:Container = null;
         super.measure();
         _loc1_ = 0;
         _loc2_ = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         if(Boolean(mx_internal::vsPreferredWidth) && !_resizeToContent)
         {
            measuredMinWidth = mx_internal::vsMinWidth;
            measuredMinHeight = mx_internal::vsMinHeight;
            measuredWidth = mx_internal::vsPreferredWidth;
            measuredHeight = mx_internal::vsPreferredHeight;
            return;
         }
         if(numChildren > 0 && selectedIndex != -1)
         {
            _loc1_ = (_loc8_ = Container(getChildAt(selectedIndex))).minWidth;
            _loc3_ = _loc8_.getExplicitOrMeasuredWidth();
            _loc2_ = _loc8_.minHeight;
            _loc4_ = _loc8_.getExplicitOrMeasuredHeight();
         }
         var _loc5_:EdgeMetrics;
         var _loc6_:Number = (_loc5_ = viewMetricsAndPadding).left + _loc5_.right;
         _loc1_ += _loc6_;
         _loc3_ += _loc6_;
         var _loc7_:Number = _loc5_.top + _loc5_.bottom;
         _loc2_ += _loc7_;
         _loc4_ += _loc7_;
         measuredMinWidth = _loc1_;
         measuredMinHeight = _loc2_;
         measuredWidth = _loc3_;
         measuredHeight = _loc4_;
         if(Boolean(selectedChild) && Container(selectedChild).mx_internal::numChildrenCreated == -1)
         {
            return;
         }
         if(numChildren == 0)
         {
            return;
         }
         mx_internal::vsMinWidth = _loc1_;
         mx_internal::vsMinHeight = _loc2_;
         mx_internal::vsPreferredWidth = _loc3_;
         mx_internal::vsPreferredHeight = _loc4_;
      }
      
      override public function set verticalScrollPolicy(param1:String) : void
      {
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(param1 == selectedIndex)
         {
            return;
         }
         proposedSelectedIndex = param1;
         invalidateProperties();
         if(historyManagementEnabled && _selectedIndex != -1 && !bInLoadState)
         {
            bSaveState = true;
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      override mx_internal function addOverlay(param1:uint, param2:RoundedRectangle = null) : void
      {
         if(overlayChild)
         {
            mx_internal::removeOverlay();
         }
         overlayChild = selectedChild;
         if(!overlayChild)
         {
            return;
         }
         mx_internal::overlayColor = param1;
         overlayTargetArea = param2;
         if(Boolean(selectedChild) && false)
         {
            selectedChild.addEventListener(FlexEvent.INITIALIZE,initializeHandler);
         }
         else
         {
            initializeHandler(null);
         }
      }
      
      override public function set autoLayout(param1:Boolean) : void
      {
      }
      
      override public function get verticalScrollPolicy() : String
      {
         return ScrollPolicy.OFF;
      }
      
      [Bindable("creationComplete")]
      [Bindable("valueCommit")]
      [Bindable("change")]
      public function get selectedIndex() : int
      {
         return proposedSelectedIndex == -1 ? _selectedIndex : proposedSelectedIndex;
      }
      
      private function childRemoveHandler(param1:ChildExistenceChangedEvent) : void
      {
         var _loc2_:DisplayObject = param1.relatedObject;
         var _loc3_:int = getChildIndex(_loc2_);
         if(_loc3_ > selectedIndex)
         {
            return;
         }
         var _loc4_:int = selectedIndex;
         if(_loc3_ < _loc4_ || _loc4_ == numChildren - 1)
         {
            if(_loc4_ == 0)
            {
               selectedIndex = -1;
               _selectedIndex = -1;
            }
            else
            {
               --selectedIndex;
            }
         }
         else if(_loc3_ == _loc4_)
         {
            needToInstantiateSelectedChild = true;
            invalidateProperties();
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc8_:Container = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         super.updateDisplayList(param1,param2);
         var _loc3_:int = numChildren;
         var _loc4_:Number = contentWidth;
         var _loc5_:Number = contentHeight;
         var _loc6_:Number = contentX;
         var _loc7_:Number = contentY;
         if(selectedIndex != -1)
         {
            _loc8_ = Container(getChildAt(selectedIndex));
            _loc9_ = _loc4_;
            _loc10_ = _loc5_;
            if(!isNaN(_loc8_.percentWidth))
            {
               if(_loc9_ > _loc8_.maxWidth)
               {
                  _loc9_ = _loc8_.maxWidth;
               }
            }
            else if(_loc9_ > _loc8_.explicitWidth)
            {
               _loc9_ = _loc8_.explicitWidth;
            }
            if(!isNaN(_loc8_.percentHeight))
            {
               if(_loc10_ > _loc8_.maxHeight)
               {
                  _loc10_ = _loc8_.maxHeight;
               }
            }
            else if(_loc10_ > _loc8_.explicitHeight)
            {
               _loc10_ = _loc8_.explicitHeight;
            }
            if(_loc8_.width != _loc9_ || _loc8_.height != _loc10_)
            {
               _loc8_.setActualSize(_loc9_,_loc10_);
            }
            if(_loc8_.x != _loc6_ || _loc8_.y != _loc7_)
            {
               _loc8_.move(_loc6_,_loc7_);
            }
            _loc8_.visible = true;
         }
      }
      
      protected function get contentX() : Number
      {
         return getStyle("paddingLeft");
      }
   }
}
