package mx.core.windowClasses
{
   import flash.display.DisplayObject;
   import flash.display.NativeWindowDisplayState;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import mx.controls.Button;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUITextField;
   import mx.core.IWindow;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   
   public class TitleBar extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var closeButton:Button;
      
      private var minimizeButtonSkin:Class;
      
      mx_internal var titleIconObject:Object;
      
      public var titleTextField:IUITextField;
      
      private var _title:String = "";
      
      private var titleIconChanged:Boolean = false;
      
      public var maximizeButton:Button;
      
      private var closeButtonSkin:Class;
      
      mx_internal var titleBarBackground:IFlexDisplayObject;
      
      public var minimizeButton:Button;
      
      private var _titleIcon:Class;
      
      private var maximizeButtonSkin:Class;
      
      private var titleChanged:Boolean = false;
      
      private var restoreButtonSkin:Class;
      
      public function TitleBar()
      {
         super();
         doubleClickEnabled = true;
         addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         addEventListener(MouseEvent.DOUBLE_CLICK,doubleClickHandler);
      }
      
      private static function isMac() : Boolean
      {
         return Capabilities.os.substring(0,3) == "Mac";
      }
      
      protected function placeButtons(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Number = getStyle("buttonPadding");
         var _loc8_:Number = getStyle("titleBarButtonPadding");
         minimizeButton.setActualSize(minimizeButton.measuredWidth,minimizeButton.measuredHeight);
         maximizeButton.setActualSize(maximizeButton.measuredWidth,maximizeButton.measuredHeight);
         closeButton.setActualSize(closeButton.measuredWidth,closeButton.measuredHeight);
         if(param1 == "right")
         {
            minimizeButton.move(param2 - (NaN + 2 * _loc7_) - param6 - _loc8_,(param3 - 0) / 2);
            maximizeButton.move(param2 - (NaN + _loc7_) - param6 - _loc8_,(param3 - 0) / 2);
            closeButton.move(param2 - 0 - param6 - _loc8_,(param3 - 0) / 2);
         }
         else
         {
            _loc8_ = Math.max(_loc8_,param4);
            closeButton.move(_loc8_,(param3 - 0) / 2);
            minimizeButton.move(_loc7_ + _loc8_ + closeButton.measuredWidth,(param3 - 0) / 2);
            maximizeButton.move(_loc8_ + _loc7_ * 2 + closeButton.measuredWidth + minimizeButton.measuredWidth,(param3 - 0) / 2);
         }
      }
      
      private function minimizeButton_clickHandler(param1:Event) : void
      {
         window.minimize();
      }
      
      private function measureChromeText(param1:IUITextField) : Rectangle
      {
         var _loc2_:Number = 20;
         var _loc3_:Number = 14;
         if(Boolean(param1) && Boolean(param1.text))
         {
            param1.validateNow();
            _loc2_ = param1.textWidth;
            _loc3_ = param1.textHeight;
         }
         return new Rectangle(0,0,_loc2_,_loc3_);
      }
      
      override protected function createChildren() : void
      {
         var _loc2_:IStyleClient = null;
         var _loc3_:ISimpleStyleClient = null;
         super.createChildren();
         var _loc1_:Class = getStyle("titleBarBackgroundSkin");
         if(_loc1_)
         {
            if(!mx_internal::titleBarBackground)
            {
               mx_internal::titleBarBackground = new _loc1_();
               _loc2_ = mx_internal::titleBarBackground as IStyleClient;
               if(_loc2_)
               {
                  _loc2_.setStyle("backgroundImage",undefined);
               }
               _loc3_ = mx_internal::titleBarBackground as ISimpleStyleClient;
               if(_loc3_)
               {
                  _loc3_.styleName = this;
               }
               addChild(DisplayObject(mx_internal::titleBarBackground));
            }
         }
         if(!titleTextField)
         {
            titleTextField = IUITextField(createInFontContext(UITextField));
            titleTextField.text = _title;
            titleTextField.styleName = getStyle("titleTextStyleName");
            titleTextField.enabled = true;
            addChild(DisplayObject(titleTextField));
         }
         if(!mx_internal::titleIconObject && Boolean(_titleIcon))
         {
            mx_internal::titleIconObject = new _titleIcon();
            addChild(DisplayObject(mx_internal::titleIconObject));
         }
         if(!minimizeButton)
         {
            minimizeButton = new Button();
            minimizeButtonSkin = getStyle("minimizeButtonSkin");
            if(minimizeButtonSkin)
            {
               minimizeButton.setStyle("skin",minimizeButtonSkin);
            }
            minimizeButton.focusEnabled = false;
            minimizeButton.enabled = window.minimizable;
            minimizeButton.addEventListener(MouseEvent.MOUSE_DOWN,button_mouseDownHandler);
            minimizeButton.addEventListener(MouseEvent.CLICK,minimizeButton_clickHandler);
            addChild(minimizeButton);
         }
         if(!maximizeButton)
         {
            maximizeButton = new Button();
            maximizeButtonSkin = getStyle("maximizeButtonSkin");
            if(maximizeButtonSkin)
            {
               maximizeButton.setStyle("skin",maximizeButtonSkin);
            }
            maximizeButton.focusEnabled = false;
            maximizeButton.enabled = window.maximizable;
            maximizeButton.addEventListener(MouseEvent.MOUSE_DOWN,button_mouseDownHandler);
            maximizeButton.addEventListener(MouseEvent.CLICK,maximizeButton_clickHandler);
            addChild(maximizeButton);
            restoreButtonSkin = isMac() ? null : getStyle("restoreButtonSkin");
         }
         if(!closeButton)
         {
            closeButton = new Button();
            closeButtonSkin = getStyle("closeButtonSkin");
            if(closeButtonSkin)
            {
               closeButton.setStyle("skin",closeButtonSkin);
            }
            closeButton.focusEnabled = false;
            closeButton.addEventListener(MouseEvent.MOUSE_DOWN,button_mouseDownHandler);
            closeButton.addEventListener(MouseEvent.CLICK,closeButton_clickHandler);
            addChild(closeButton);
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:Class = null;
         var _loc4_:IStyleClient = null;
         var _loc5_:ISimpleStyleClient = null;
         super.styleChanged(param1);
         invalidateDisplayList();
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         if(_loc2_ || param1 == "titleBarBackgroundSkin")
         {
            _loc3_ = getStyle("titleBarBackgroundSkin");
            if(_loc3_)
            {
               if(mx_internal::titleBarBackground)
               {
                  removeChild(DisplayObject(mx_internal::titleBarBackground));
                  mx_internal::titleBarBackground = null;
               }
               mx_internal::titleBarBackground = new _loc3_();
               if(_loc4_ = mx_internal::titleBarBackground as IStyleClient)
               {
                  _loc4_.setStyle("backgroundImage",undefined);
               }
               if(_loc5_ = mx_internal::titleBarBackground as ISimpleStyleClient)
               {
                  _loc5_.styleName = this;
               }
               addChildAt(DisplayObject(mx_internal::titleBarBackground),0);
            }
         }
         if(_loc2_ || param1 == "titleTextStyleName")
         {
            if(titleTextField)
            {
               titleTextField.styleName = getStyle("titleTextStyleName");
            }
         }
         if(_loc2_ || param1 == "closeButtonSkin")
         {
            closeButtonSkin = getStyle("closeButtonSkin");
            if(Boolean(closeButtonSkin) && Boolean(closeButton))
            {
               closeButton.setStyle("skin",closeButtonSkin);
            }
         }
         if(_loc2_ || param1 == "maximizeButtonSkin")
         {
            maximizeButtonSkin = getStyle("maximizeButtonSkin");
            if(Boolean(maximizeButtonSkin) && Boolean(maximizeButton))
            {
               maximizeButton.setStyle("skin",maximizeButtonSkin);
            }
         }
         if(_loc2_ || param1 == "minimizeButtonSkin")
         {
            minimizeButtonSkin = getStyle("minimizeButtonSkin");
            if(Boolean(minimizeButtonSkin) && Boolean(minimizeButton))
            {
               minimizeButton.setStyle("skin",minimizeButtonSkin);
            }
         }
         if(_loc2_ || param1 == "restoreButtonSkin")
         {
            restoreButtonSkin = getStyle("restoreButtonSkin");
         }
      }
      
      private function closeButton_clickHandler(param1:Event) : void
      {
         window.close();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(titleChanged)
         {
            titleTextField.text = _title;
            titleChanged = false;
         }
         if(titleIconChanged)
         {
            if(mx_internal::titleIconObject)
            {
               removeChild(DisplayObject(mx_internal::titleIconObject));
               mx_internal::titleIconObject = null;
            }
            if(_titleIcon)
            {
               mx_internal::titleIconObject = new _titleIcon();
               addChild(DisplayObject(mx_internal::titleIconObject));
            }
            titleIconChanged = false;
         }
      }
      
      protected function doubleClickHandler(param1:MouseEvent) : void
      {
         if(isMac())
         {
            window.minimize();
         }
         else if(window.nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
         {
            window.restore();
         }
         else
         {
            window.maximize();
         }
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      private function maximizeButton_clickHandler(param1:Event) : void
      {
         if(window.nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
         {
            window.restore();
         }
         else
         {
            window.maximize();
            maximizeButton.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OUT));
         }
      }
      
      private function button_mouseDownHandler(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      public function set titleIcon(param1:Class) : void
      {
         _titleIcon = param1;
         titleIconChanged = true;
         invalidateProperties();
         invalidateSize();
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         window.nativeWindow.startMove();
         param1.stopPropagation();
      }
      
      override protected function measure() : void
      {
         super.measure();
         titleTextField.validateNow();
         if(false)
         {
            titleTextField.text = " ";
            titleTextField.validateNow();
         }
         measuredHeight = Math.max(NaN,Math.max(maximizeButton.measuredHeight,minimizeButton.measuredHeight,closeButton.measuredHeight) + 12);
         measuredWidth = NaN;
         if(mx_internal::titleIconObject)
         {
            measuredHeight = Math.max(measuredHeight,NaN);
            measuredWidth += mx_internal::titleIconObject.width;
         }
      }
      
      public function set title(param1:String) : void
      {
         _title = param1;
         titleChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get titleIcon() : Class
      {
         return _titleIcon;
      }
      
      protected function placeTitle(param1:String, param2:Number, param3:Number, param4:String) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:TextFormat = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         titleTextField.text = _title;
         titleTextField.validateNow();
         if(param4 == "left")
         {
            _loc5_ = Math.max(NaN,NaN,NaN);
         }
         else
         {
            _loc5_ = Math.min(closeButton.x,minimizeButton.x,maximizeButton.x);
         }
         if(param1 == "left")
         {
            if(param4 == "left")
            {
               titleTextField.setActualSize(width - param3 - 2 - _loc5_,measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
               titleTextField.move(_loc5_,(height - (measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING)) / 2);
               titleTextField.truncateToFit();
            }
            else
            {
               titleTextField.setActualSize(Math.max(0,_loc5_) - 2,measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
               titleTextField.move(param2,(height - (measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING)) / 2);
               titleTextField.truncateToFit();
            }
         }
         else
         {
            (_loc6_ = new TextFormat()).align = TextFormatAlign.LEFT;
            titleTextField.setTextFormat(_loc6_);
            _loc8_ = titleTextField.getLineMetrics(0).width;
            titleTextField.truncateToFit();
            if(param4 == "left")
            {
               titleTextField.setActualSize(width - param3 - _loc5_ - 2,measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
               _loc7_ = Math.max(_loc5_,(width - param2 - param3 - _loc8_) / 2);
               titleTextField.move(_loc7_,(height - (measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING)) / 2);
            }
            else
            {
               titleTextField.setActualSize(width - param2 - param3 - (width - _loc5_) - 2,measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
               _loc7_ = Math.max(0,Math.min(_loc5_ - _loc8_ - 2,(width - param2 - param3 - _loc8_) / 2));
               titleTextField.move(_loc7_,(height - (measureChromeText(titleTextField).height + UITextField.mx_internal::TEXT_HEIGHT_PADDING)) / 2);
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         super.updateDisplayList(param1,param2);
         if(window.nativeWindow.closed)
         {
            return;
         }
         var _loc3_:Number = 0;
         var _loc4_:Number = 5;
         var _loc5_:int = getStyle("cornerRadius") / 2;
         if(mx_internal::titleBarBackground)
         {
            mx_internal::titleBarBackground.move(0,0);
            IFlexDisplayObject(mx_internal::titleBarBackground).setActualSize(param1,param2);
         }
         if(mx_internal::titleIconObject)
         {
            _loc8_ = 0;
            _loc9_ = (height - _loc8_) / 2;
            mx_internal::titleIconObject.move(_loc5_,_loc9_);
            _loc3_ += _loc5_ + mx_internal::titleIconObject.width + getStyle("buttonPadding");
         }
         if(!isMac())
         {
            if(window.nativeWindow.displayState == NativeWindowDisplayState.MAXIMIZED)
            {
               if(restoreButtonSkin)
               {
                  maximizeButton.setStyle("skin",restoreButtonSkin);
               }
            }
            else
            {
               maximizeButton.setStyle("skin",maximizeButtonSkin);
            }
         }
         var _loc6_:String;
         if((_loc6_ = getStyle("buttonAlignment")) == "right")
         {
            placeButtons(_loc6_,width,height,_loc3_,_loc4_,_loc5_);
         }
         else if(_loc6_ == "left")
         {
            placeButtons(_loc6_,width,height,_loc3_,_loc4_,_loc5_);
         }
         else if(isMac())
         {
            _loc6_ = "left";
            placeButtons("left",width,height,_loc3_,_loc4_,_loc5_);
         }
         else
         {
            placeButtons("right",width,height,_loc3_,_loc4_,_loc5_);
         }
         var _loc7_:String;
         if((_loc7_ = String(getStyle("titleAlignment"))) == "center" || _loc7_ == "left")
         {
            placeTitle(_loc7_,_loc3_,_loc4_,_loc6_);
         }
         else if(isMac())
         {
            placeTitle("center",_loc3_,_loc4_,_loc6_);
         }
         else
         {
            placeTitle("left",_loc3_,_loc4_,_loc6_);
         }
      }
      
      private function get window() : IWindow
      {
         return IWindow(parent);
      }
   }
}
