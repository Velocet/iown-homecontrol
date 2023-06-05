package mx.controls
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.text.TextLineMetrics;
   import flash.utils.Timer;
   import mx.core.FlexVersion;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.styles.ISimpleStyleClient;
   
   public class ProgressBar extends UIComponent implements IFontContextComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _direction:String = "right";
      
      private var stopPolledMode:Boolean = false;
      
      mx_internal var _labelField:IUITextField;
      
      mx_internal var _determinateBar:IFlexDisplayObject;
      
      private var sourceChanged:Boolean = false;
      
      private var _interval:Number = 30;
      
      private var trackSkinChanged:Boolean = false;
      
      mx_internal var _content:UIComponent;
      
      private var _source:Object;
      
      mx_internal var _track:IFlexDisplayObject;
      
      mx_internal var _bar:UIComponent;
      
      mx_internal var _barMask:IFlexDisplayObject;
      
      private var barSkinChanged:Boolean = false;
      
      private var _stringSource:String;
      
      private var _labelPlacement:String = "bottom";
      
      private var _value:Number = 0;
      
      private var indeterminateChanged:Boolean = true;
      
      private var _mode:String = "event";
      
      private var stringSourceChanged:Boolean = false;
      
      private var modeChanged:Boolean = false;
      
      private var _conversion:Number = 1;
      
      mx_internal var _indeterminateBar:IFlexDisplayObject;
      
      private var indeterminateSkinChanged:Boolean = false;
      
      private var _indeterminate:Boolean = false;
      
      private var pollTimer:Timer;
      
      private var _minimum:Number = 0;
      
      private var labelOverride:String;
      
      private var _maximum:Number = 0;
      
      private var visibleChanged:Boolean = false;
      
      private var indeterminatePlaying:Boolean = false;
      
      private var _label:String;
      
      public function ProgressBar()
      {
         super();
         pollTimer = new Timer(_interval);
         cacheAsBitmap = true;
      }
      
      [Bindable("minimumChanged")]
      public function get minimum() : Number
      {
         return _minimum;
      }
      
      [Bindable("conversionChanged")]
      public function get conversion() : Number
      {
         return _conversion;
      }
      
      private function completeHandler(param1:Event) : void
      {
         dispatchEvent(param1);
         invalidateDisplayList();
      }
      
      [Bindable("sourceChanged")]
      public function get source() : Object
      {
         return _source;
      }
      
      public function set minimum(param1:Number) : void
      {
         if(!isNaN(param1) && _mode == ProgressBarMode.MANUAL && param1 != _minimum)
         {
            _minimum = param1;
            invalidateDisplayList();
            dispatchEvent(new Event("minimumChanged"));
         }
      }
      
      [Bindable("maximumChanged")]
      public function get maximum() : Number
      {
         return _maximum;
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:Class = null;
         super.createChildren();
         if(!mx_internal::_content)
         {
            mx_internal::_content = new UIComponent();
            addChild(mx_internal::_content);
         }
         if(!mx_internal::_bar)
         {
            mx_internal::_bar = new UIComponent();
            mx_internal::_content.addChild(mx_internal::_bar);
         }
         if(!mx_internal::_barMask)
         {
            if(true)
            {
               _loc1_ = getStyle("maskSkin");
               mx_internal::_barMask = new _loc1_();
            }
            else
            {
               mx_internal::_barMask = new UIComponent();
            }
            mx_internal::_barMask.visible = true;
            mx_internal::_bar.addChild(DisplayObject(mx_internal::_barMask));
            UIComponent(mx_internal::_bar).mask = DisplayObject(mx_internal::_barMask);
         }
         if(!mx_internal::_labelField)
         {
            mx_internal::_labelField = IUITextField(createInFontContext(UITextField));
            mx_internal::_labelField.styleName = this;
            addChild(DisplayObject(mx_internal::_labelField));
         }
      }
      
      public function set source(param1:Object) : void
      {
         var value:Object = param1;
         if(value is String)
         {
            _stringSource = String(value);
            try
            {
               value = document[_stringSource];
            }
            catch(e:Error)
            {
               stringSourceChanged = true;
            }
         }
         if(Boolean(_source) && _source is IEventDispatcher)
         {
            removeSourceListeners();
         }
         if(value)
         {
            _source = value;
            sourceChanged = true;
            modeChanged = true;
            indeterminateChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
         else if(_source != null)
         {
            _source = null;
            sourceChanged = true;
            indeterminateChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            pollTimer.reset();
         }
      }
      
      public function set conversion(param1:Number) : void
      {
         if(!isNaN(param1) && Number(param1) > 0 && param1 != _conversion)
         {
            _conversion = Number(param1);
            invalidateDisplayList();
            dispatchEvent(new Event("conversionChanged"));
         }
      }
      
      public function set maximum(param1:Number) : void
      {
         if(!isNaN(param1) && _mode == ProgressBarMode.MANUAL && param1 != _maximum)
         {
            _maximum = param1;
            invalidateDisplayList();
            dispatchEvent(new Event("maximumChanged"));
         }
      }
      
      public function set mode(param1:String) : void
      {
         if(param1 != _mode)
         {
            if(_mode == ProgressBarMode.POLLED)
            {
               stopPolledMode = true;
            }
            _mode = param1;
            modeChanged = true;
            indeterminateChanged = true;
            invalidateProperties();
            invalidateDisplayList();
         }
      }
      
      private function removeSourceListeners() : void
      {
         _source.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
         _source.removeEventListener(Event.COMPLETE,completeHandler);
      }
      
      private function stopPlayingIndeterminate() : void
      {
         if(indeterminatePlaying)
         {
            indeterminatePlaying = false;
            pollTimer.removeEventListener(TimerEvent.TIMER,updateIndeterminateHandler);
            if(_mode != ProgressBarMode.POLLED)
            {
               pollTimer.reset();
            }
         }
      }
      
      [Bindable("labelPlacementChanged")]
      public function get labelPlacement() : String
      {
         return _labelPlacement;
      }
      
      private function progressHandler(param1:ProgressEvent) : void
      {
         _setProgress(param1.bytesLoaded,param1.bytesTotal);
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         super.measure();
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = getStyle("trackHeight");
         var _loc6_:Number = 0;
         var _loc7_:Number = isNaN(_loc5_) ? 0 : _loc5_;
         var _loc8_:Number = getStyle("horizontalGap");
         var _loc9_:Number = getStyle("verticalGap");
         var _loc10_:Number = getStyle("paddingLeft");
         var _loc11_:Number = getStyle("paddingRight");
         var _loc12_:Number = getStyle("paddingTop");
         var _loc13_:Number = getStyle("paddingBottom");
         var _loc14_:Number = getStyle("labelWidth");
         var _loc15_:TextLineMetrics = measureText(predictLabelText());
         var _loc16_:Number = isNaN(_loc14_) ? _loc15_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING : _loc14_;
         var _loc17_:Number = _loc15_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
         switch(labelPlacement)
         {
            case ProgressBarLabelPlacement.LEFT:
            case ProgressBarLabelPlacement.RIGHT:
               _loc1_ = _loc16_ + _loc6_ + _loc10_ + _loc11_ + _loc8_;
               _loc2_ = Math.max(_loc17_,_loc7_) + _loc12_ + _loc13_;
               measuredMinWidth = _loc1_;
               break;
            case ProgressBarLabelPlacement.CENTER:
               _loc1_ = Math.max(_loc16_,_loc6_) + _loc10_ + _loc11_ + _loc8_;
               _loc2_ = Math.max(_loc17_,_loc7_) + _loc12_ + _loc13_;
               measuredMinWidth = _loc16_;
               break;
            default:
               _loc1_ = Math.max(_loc16_,_loc6_) + _loc10_ + _loc11_;
               _loc2_ = _loc17_ + _loc7_ + _loc12_ + _loc13_ + _loc9_;
               measuredMinWidth = _loc16_;
         }
         measuredWidth = _loc1_;
         measuredMinHeight = measuredHeight = _loc2_;
         if(!isNaN(_loc3_))
         {
            measuredMinWidth = _loc3_;
         }
         if(!isNaN(_loc4_))
         {
            measuredMinHeight = _loc4_;
         }
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      private function predictLabelText() : String
      {
         var _loc2_:Number = NaN;
         if(label == null)
         {
            return "";
         }
         var _loc1_:String = label;
         if(_maximum != 0)
         {
            _loc2_ = _maximum;
         }
         else
         {
            _loc2_ = 100000;
         }
         if(_loc1_)
         {
            if(_indeterminate)
            {
               _loc1_ = _loc1_.replace("%1",String(Math.floor(_loc2_ / _conversion)));
               _loc1_ = _loc1_.replace("%2","??");
               _loc1_ = _loc1_.replace("%3","");
               _loc1_ = _loc1_.replace("%%","");
            }
            else
            {
               _loc1_ = _loc1_.replace("%1",String(Math.floor(_loc2_ / _conversion)));
               _loc1_ = _loc1_.replace("%2",String(Math.floor(_loc2_ / _conversion)));
               _loc1_ = _loc1_.replace("%3","100");
               _loc1_ = _loc1_.replace("%%","%");
            }
         }
         var _loc3_:String = getFullLabelText();
         if(_loc1_.length > _loc3_.length)
         {
            return _loc1_;
         }
         return _loc3_;
      }
      
      [Bindable("change")]
      public function get value() : Number
      {
         return _value;
      }
      
      public function set indeterminate(param1:Boolean) : void
      {
         _indeterminate = param1;
         indeterminateChanged = true;
         invalidateProperties();
         invalidateDisplayList();
         dispatchEvent(new Event("indeterminateChanged"));
      }
      
      private function createBar() : void
      {
         if(mx_internal::_determinateBar)
         {
            mx_internal::_bar.removeChild(DisplayObject(mx_internal::_determinateBar));
            mx_internal::_determinateBar = null;
         }
         var _loc1_:Class = getStyle("barSkin");
         if(_loc1_)
         {
            mx_internal::_determinateBar = new _loc1_();
            if(mx_internal::_determinateBar is ISimpleStyleClient)
            {
               ISimpleStyleClient(mx_internal::_determinateBar).styleName = this;
            }
            mx_internal::_bar.addChild(DisplayObject(mx_internal::_determinateBar));
         }
      }
      
      private function createIndeterminateBar() : void
      {
         if(mx_internal::_indeterminateBar)
         {
            mx_internal::_bar.removeChild(DisplayObject(mx_internal::_indeterminateBar));
            mx_internal::_indeterminateBar = null;
         }
         var _loc1_:Class = getStyle("indeterminateSkin");
         if(_loc1_)
         {
            mx_internal::_indeterminateBar = new _loc1_();
            if(mx_internal::_indeterminateBar is ISimpleStyleClient)
            {
               ISimpleStyleClient(mx_internal::_indeterminateBar).styleName = this;
            }
            mx_internal::_indeterminateBar.visible = false;
            mx_internal::_bar.addChild(DisplayObject(mx_internal::_indeterminateBar));
         }
      }
      
      [Bindable("directionChanged")]
      public function get direction() : String
      {
         return _direction;
      }
      
      private function addSourceListeners() : void
      {
         _source.addEventListener(ProgressEvent.PROGRESS,progressHandler);
         _source.addEventListener(Event.COMPLETE,completeHandler);
      }
      
      private function updateIndeterminateHandler(param1:Event) : void
      {
         if(true)
         {
            mx_internal::_indeterminateBar.x = NaN;
         }
         else
         {
            mx_internal::_indeterminateBar.x = -(getStyle("indeterminateMoveInterval") - 2);
         }
      }
      
      private function updatePolledHandler(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(_source)
         {
            _loc2_ = _source;
            _loc3_ = Number(_loc2_.bytesLoaded);
            _loc4_ = Number(_loc2_.bytesTotal);
            if(!isNaN(_loc3_) && !isNaN(_loc4_))
            {
               _setProgress(_loc3_,_loc4_);
               if(percentComplete >= 100 && _value > 0)
               {
                  pollTimer.reset();
               }
            }
         }
      }
      
      public function set labelPlacement(param1:String) : void
      {
         if(param1 != _labelPlacement)
         {
            _labelPlacement = param1;
         }
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new Event("labelPlacementChanged"));
      }
      
      [Bindable("modeChanged")]
      public function get mode() : String
      {
         return _mode;
      }
      
      [Bindable("progress")]
      public function get percentComplete() : Number
      {
         if(_value < _minimum || _maximum < _minimum)
         {
            return 0;
         }
         if(_maximum - _minimum == 0)
         {
            return 0;
         }
         var _loc1_:Number = 100 * (_value - _minimum) / (_maximum - _minimum);
         if(isNaN(_loc1_) || _loc1_ < 0)
         {
            return 0;
         }
         if(_loc1_ > 100)
         {
            return 100;
         }
         return _loc1_;
      }
      
      public function setProgress(param1:Number, param2:Number) : void
      {
         if(_mode == ProgressBarMode.MANUAL)
         {
            _setProgress(param1,param2);
         }
      }
      
      private function createTrack() : void
      {
         if(mx_internal::_track)
         {
            mx_internal::_content.removeChild(DisplayObject(mx_internal::_track));
            mx_internal::_track = null;
         }
         var _loc1_:Class = getStyle("trackSkin");
         if(_loc1_)
         {
            mx_internal::_track = new _loc1_();
            if(mx_internal::_track is ISimpleStyleClient)
            {
               ISimpleStyleClient(mx_internal::_track).styleName = this;
            }
            mx_internal::_content.addChildAt(DisplayObject(mx_internal::_track),0);
         }
      }
      
      [Bindable("indeterminateChanged")]
      public function get indeterminate() : Boolean
      {
         return _indeterminate;
      }
      
      private function startPlayingIndeterminate() : void
      {
         if(!indeterminatePlaying)
         {
            indeterminatePlaying = true;
            pollTimer.addEventListener(TimerEvent.TIMER,updateIndeterminateHandler,false,0,true);
            pollTimer.start();
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Boolean = false;
         super.styleChanged(param1);
         if(param1 == null || param1 == "styleName")
         {
            barSkinChanged = trackSkinChanged = indeterminateSkinChanged = true;
            _loc2_ = true;
         }
         else if(param1 == "barSkin")
         {
            barSkinChanged = true;
            _loc2_ = true;
         }
         else if(param1 == "trackSkin")
         {
            trackSkinChanged = true;
            _loc2_ = true;
         }
         else if(param1 == "indeterminateSkin")
         {
            indeterminateSkinChanged = true;
            _loc2_ = true;
         }
         if(_loc2_)
         {
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      private function getFullLabelText() : String
      {
         var _loc1_:Number = Math.max(_value,0);
         var _loc2_:Number = Math.max(_maximum,0);
         var _loc3_:String = label;
         if(_loc3_)
         {
            if(_indeterminate)
            {
               _loc3_ = _loc3_.replace("%1",String(Math.floor(_loc1_ / _conversion)));
               _loc3_ = _loc3_.replace("%2","??");
               _loc3_ = _loc3_.replace("%3","");
               _loc3_ = _loc3_.replace("%%","");
            }
            else
            {
               _loc3_ = _loc3_.replace("%1",String(Math.floor(_loc1_ / _conversion)));
               _loc3_ = _loc3_.replace("%2",String(Math.floor(_loc2_ / _conversion)));
               _loc3_ = _loc3_.replace("%3",String(Math.floor(percentComplete)));
               _loc3_ = _loc3_.replace("%%","%");
            }
         }
         return _loc3_;
      }
      
      override protected function commitProperties() : void
      {
         var index:int = 0;
         super.commitProperties();
         if(hasFontContextChanged() && mx_internal::_labelField != null)
         {
            index = getChildIndex(DisplayObject(mx_internal::_labelField));
            removeChild(DisplayObject(mx_internal::_labelField));
            mx_internal::_labelField = IUITextField(createInFontContext(UITextField));
            mx_internal::_labelField.styleName = this;
            addChildAt(DisplayObject(mx_internal::_labelField),index);
         }
         if(trackSkinChanged)
         {
            trackSkinChanged = false;
            createTrack();
         }
         if(barSkinChanged)
         {
            barSkinChanged = false;
            createBar();
         }
         if(indeterminateSkinChanged)
         {
            indeterminateSkinChanged = false;
            createIndeterminateBar();
         }
         if(stringSourceChanged)
         {
            stringSourceChanged = false;
            try
            {
               _source = document[_stringSource];
            }
            catch(e:Error)
            {
            }
         }
         if(sourceChanged)
         {
            sourceChanged = false;
            dispatchEvent(new Event("sourceChanged"));
         }
         if(modeChanged)
         {
            modeChanged = false;
            if(_source)
            {
               if(_mode == ProgressBarMode.EVENT)
               {
                  if(_source is IEventDispatcher)
                  {
                     addSourceListeners();
                  }
                  else
                  {
                     _source = null;
                  }
               }
               else if(_source is IEventDispatcher)
               {
                  removeSourceListeners();
               }
            }
            if(_mode == ProgressBarMode.POLLED)
            {
               pollTimer.addEventListener(TimerEvent.TIMER,updatePolledHandler,false,0,true);
               pollTimer.start();
            }
            else if(stopPolledMode)
            {
               stopPolledMode = false;
               pollTimer.removeEventListener(TimerEvent.TIMER,updatePolledHandler);
               pollTimer.reset();
            }
            dispatchEvent(new Event("modeChanged"));
         }
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         label = labelOverride;
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         visibleChanged = true;
         invalidateDisplayList();
      }
      
      public function set label(param1:String) : void
      {
         labelOverride = param1;
         _label = param1 != null ? param1 : String(resourceManager.getString("controls","label"));
         invalidateDisplayList();
         dispatchEvent(new Event("labelChanged"));
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
         trackSkinChanged = true;
         barSkinChanged = true;
         indeterminateSkinChanged = true;
      }
      
      private function layoutContent(param1:Number, param2:Number) : void
      {
         mx_internal::_track.move(0,0);
         mx_internal::_track.setActualSize(param1,param2);
         mx_internal::_bar.move(0,0);
         mx_internal::_determinateBar.move(0,0);
         mx_internal::_indeterminateBar.setActualSize(param1 + getStyle("indeterminateMoveInterval"),param2);
      }
      
      private function _setProgress(param1:Number, param2:Number) : void
      {
         var _loc3_:ProgressEvent = null;
         if(enabled && !isNaN(param1) && !isNaN(param2))
         {
            _value = param1;
            _maximum = param2;
            dispatchEvent(new Event(Event.CHANGE));
            _loc3_ = new ProgressEvent(ProgressEvent.PROGRESS);
            _loc3_.bytesLoaded = param1;
            _loc3_.bytesTotal = param2;
            dispatchEvent(_loc3_);
            if(_indeterminate)
            {
               startPlayingIndeterminate();
            }
            if(_value == _maximum && _value > 0)
            {
               if(_indeterminate)
               {
                  stopPlayingIndeterminate();
               }
               if(mode != ProgressBarMode.EVENT)
               {
                  dispatchEvent(new Event(Event.COMPLETE));
               }
            }
            invalidateDisplayList();
         }
      }
      
      [Bindable("labelChanged")]
      public function get label() : String
      {
         return _label;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Graphics = null;
         var _loc18_:Number = NaN;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("horizontalGap");
         var _loc4_:Number = getStyle("verticalGap");
         var _loc5_:Number = getStyle("paddingLeft");
         var _loc6_:Number = getStyle("paddingRight");
         var _loc7_:Number = getStyle("paddingTop");
         var _loc8_:Number = getStyle("paddingBottom");
         var _loc9_:Number = _loc5_;
         var _loc10_:Number = _loc7_;
         var _loc11_:Number = getStyle("labelWidth");
         var _loc12_:Number = getStyle("trackHeight");
         _loc12_ = isNaN(_loc12_) ? 0 : _loc12_;
         var _loc13_:TextLineMetrics = measureText(predictLabelText());
         var _loc14_:Number = isNaN(_loc11_) ? _loc13_.width + UITextField.mx_internal::TEXT_WIDTH_PADDING : _loc11_;
         var _loc15_:Number = _loc13_.height + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
         switch(labelPlacement)
         {
            case ProgressBarLabelPlacement.TOP:
               mx_internal::_labelField.move(_loc9_,_loc10_);
               mx_internal::_labelField.setActualSize(_loc14_,_loc15_);
               mx_internal::_content.move(_loc9_,_loc10_ + _loc15_ + _loc4_);
               layoutContent(param1 - _loc9_ - _loc6_,_loc12_);
               break;
            case ProgressBarLabelPlacement.RIGHT:
               _loc16_ = param1 - _loc9_ - _loc6_ - _loc14_ - _loc3_;
               mx_internal::_labelField.move(_loc9_ + _loc16_ + _loc3_,(param2 - _loc15_) / 2);
               mx_internal::_labelField.setActualSize(_loc14_,_loc15_);
               mx_internal::_content.move(_loc9_,_loc10_ + (_loc15_ - _loc12_) / 2);
               layoutContent(_loc16_,_loc12_);
               break;
            case ProgressBarLabelPlacement.LEFT:
               mx_internal::_labelField.move(_loc9_,_loc10_ + (param2 - _loc15_) / 2);
               mx_internal::_labelField.setActualSize(_loc14_,_loc15_);
               mx_internal::_content.move(_loc9_ + _loc14_ + _loc3_,_loc10_ + (_loc15_ - _loc12_) / 2);
               layoutContent(param1 - _loc9_ - _loc14_ - _loc4_ - _loc6_,_loc12_);
               break;
            case ProgressBarLabelPlacement.CENTER:
               mx_internal::_labelField.move((param1 - _loc14_) / 2,(param2 - _loc15_) / 2);
               mx_internal::_labelField.setActualSize(_loc14_,_loc15_);
               mx_internal::_content.move(_loc9_,_loc10_);
               layoutContent(param1 - _loc6_,param2 - _loc8_);
               break;
            default:
               mx_internal::_labelField.move(_loc9_,_loc10_ + _loc12_ + _loc4_);
               mx_internal::_labelField.setActualSize(_loc14_,_loc15_);
               mx_internal::_content.move(_loc9_,_loc10_);
               layoutContent(param1 - _loc9_ - _loc6_,_loc12_);
         }
         if(mx_internal::_barMask)
         {
            mx_internal::_barMask.move(0,0);
            if(true)
            {
               mx_internal::_barMask.setActualSize(mx_internal::_track.width,mx_internal::_track.height);
            }
            else
            {
               (_loc17_ = UIComponent(mx_internal::_barMask).graphics).clear();
               _loc17_.beginFill(16776960);
               _loc17_.drawRect(1,1,-2,-2);
               _loc17_.endFill();
            }
         }
         mx_internal::_labelField.text = getFullLabelText();
         mx_internal::_indeterminateBar.visible = _indeterminate;
         if(indeterminateChanged || visibleChanged)
         {
            indeterminateChanged = false;
            visibleChanged = false;
            mx_internal::_indeterminateBar.visible = _indeterminate;
            if(_indeterminate && _source == null && _mode == ProgressBarMode.EVENT && visible)
            {
               startPlayingIndeterminate();
            }
            else
            {
               stopPlayingIndeterminate();
            }
         }
         if(_indeterminate)
         {
            mx_internal::_determinateBar.setActualSize(mx_internal::_track.width,mx_internal::_track.height);
         }
         else
         {
            _loc18_ = Math.max(0,0 * percentComplete / 100);
            mx_internal::_determinateBar.setActualSize(_loc18_,mx_internal::_track.height);
            mx_internal::_determinateBar.x = direction == ProgressBarDirection.RIGHT ? 0 : 0 - _loc18_;
         }
      }
      
      public function set direction(param1:String) : void
      {
         if(param1 == ProgressBarDirection.LEFT || param1 == ProgressBarDirection.RIGHT)
         {
            _direction = param1;
         }
         invalidateDisplayList();
         dispatchEvent(new Event("directionChanged"));
      }
   }
}
