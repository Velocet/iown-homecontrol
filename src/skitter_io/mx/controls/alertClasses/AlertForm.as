package mx.controls.alertClasses
{
   import flash.display.DisplayObject;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   import mx.controls.Alert;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.IFontContextComponent;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.managers.IFocusManagerContainer;
   import mx.managers.ISystemManager;
   import mx.managers.PopUpManager;
   
   public class AlertForm extends UIComponent implements IFontContextComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      mx_internal var buttons:Array;
      
      private var icon:DisplayObject;
      
      mx_internal var textField:IUITextField;
      
      mx_internal var defaultButton:Button;
      
      private var textWidth:Number;
      
      private var defaultButtonChanged:Boolean = false;
      
      private var textHeight:Number;
      
      public function AlertForm()
      {
         mx_internal::buttons = [];
         super();
         tabChildren = true;
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.styleChanged(param1);
         if(!param1 || param1 == "styleName" || param1 == "buttonStyleName")
         {
            if(mx_internal::buttons)
            {
               _loc2_ = getStyle("buttonStyleName");
               _loc3_ = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  mx_internal::buttons[_loc4_].styleName = _loc2_;
                  _loc4_++;
               }
            }
         }
      }
      
      public function set fontContext(param1:IFlexModuleFactory) : void
      {
         this.moduleFactory = param1;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ISystemManager = null;
         super.commitProperties();
         if(hasFontContextChanged() && mx_internal::textField != null)
         {
            _loc1_ = getChildIndex(DisplayObject(mx_internal::textField));
            mx_internal::removeTextField();
            mx_internal::createTextField(_loc1_);
         }
         if(defaultButtonChanged && Boolean(mx_internal::defaultButton))
         {
            defaultButtonChanged = false;
            Alert(parent).defaultButton = mx_internal::defaultButton;
            if(parent is IFocusManagerContainer)
            {
               _loc2_ = Alert(parent).systemManager;
               _loc2_.activate(IFocusManagerContainer(parent));
            }
            mx_internal::defaultButton.setFocus();
         }
      }
      
      private function createButton(param1:String, param2:String) : Button
      {
         var _loc3_:Button = new Button();
         _loc3_.label = param1;
         _loc3_.name = param2;
         var _loc4_:String;
         if(_loc4_ = getStyle("buttonStyleName"))
         {
            _loc3_.styleName = _loc4_;
         }
         _loc3_.addEventListener(MouseEvent.CLICK,clickHandler);
         _loc3_.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         _loc3_.owner = parent;
         addChild(_loc3_);
         _loc3_.setActualSize(Alert.buttonWidth,Alert.buttonHeight);
         mx_internal::buttons.push(_loc3_);
         return _loc3_;
      }
      
      override protected function resourcesChanged() : void
      {
         var _loc1_:Button = null;
         super.resourcesChanged();
         _loc1_ = Button(getChildByName("OK"));
         if(_loc1_)
         {
            _loc1_.label = String(Alert.okLabel);
         }
         _loc1_ = Button(getChildByName("CANCEL"));
         if(_loc1_)
         {
            _loc1_.label = String(Alert.cancelLabel);
         }
         _loc1_ = Button(getChildByName("YES"));
         if(_loc1_)
         {
            _loc1_.label = String(Alert.yesLabel);
         }
         _loc1_ = Button(getChildByName("NO"));
         if(_loc1_)
         {
            _loc1_.label = String(Alert.noLabel);
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc5_:String = null;
         var _loc6_:Button = null;
         super.createChildren();
         mx_internal::createTextField(-1);
         var _loc1_:Class = Alert(parent).iconClass;
         if(Boolean(_loc1_) && !icon)
         {
            icon = new _loc1_();
            addChild(icon);
         }
         var _loc2_:Alert = Alert(parent);
         var _loc3_:uint = _loc2_.buttonFlags;
         var _loc4_:uint = _loc2_.defaultButtonFlag;
         if(_loc3_ & 0)
         {
            _loc5_ = String(Alert.okLabel);
            _loc6_ = createButton(_loc5_,"OK");
            if(_loc4_ == Alert.OK)
            {
               mx_internal::defaultButton = _loc6_;
            }
         }
         if(_loc3_ & 0)
         {
            _loc5_ = String(Alert.yesLabel);
            _loc6_ = createButton(_loc5_,"YES");
            if(_loc4_ == Alert.YES)
            {
               mx_internal::defaultButton = _loc6_;
            }
         }
         if(_loc3_ & 0)
         {
            _loc5_ = String(Alert.noLabel);
            _loc6_ = createButton(_loc5_,"NO");
            if(_loc4_ == Alert.NO)
            {
               mx_internal::defaultButton = _loc6_;
            }
         }
         if(_loc3_ & 0)
         {
            _loc5_ = String(Alert.cancelLabel);
            _loc6_ = createButton(_loc5_,"CANCEL");
            if(_loc4_ == Alert.CANCEL)
            {
               mx_internal::defaultButton = _loc6_;
            }
         }
         if(!mx_internal::defaultButton && false)
         {
            mx_internal::defaultButton = mx_internal::buttons[0];
         }
         if(mx_internal::defaultButton)
         {
            defaultButtonChanged = true;
            invalidateProperties();
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:String = Alert(parent).title;
         var _loc2_:TextLineMetrics = Alert(parent).mx_internal::getTitleTextField().getUITextFormat().measureText(_loc1_);
         var _loc3_:int = Math.max(mx_internal::buttons.length,2);
         var _loc4_:Number = _loc3_ * mx_internal::buttons[0].width + (_loc3_ - 1) * 8;
         var _loc5_:Number = Math.max(_loc4_,_loc2_.width);
         mx_internal::textField.width = 2 * _loc5_;
         textWidth = NaN;
         var _loc6_:Number = Math.max(_loc5_,textWidth);
         _loc6_ = Math.min(_loc6_,2 * _loc5_);
         if(textWidth < _loc6_ && false)
         {
            mx_internal::textField.multiline = false;
            mx_internal::textField.wordWrap = false;
         }
         else if(false)
         {
            mx_internal::textField.wordWrap = true;
            mx_internal::textField.multiline = true;
         }
         _loc6_ += 16;
         if(icon)
         {
            _loc6_ += NaN;
         }
         textHeight = NaN;
         var _loc7_:Number = textHeight;
         if(icon)
         {
            _loc7_ = Math.max(_loc7_,icon.height);
         }
         _loc7_ = (_loc7_ = Math.min(_loc7_,0)) + (mx_internal::buttons[0].height + 24);
         measuredWidth = _loc6_;
         measuredHeight = _loc7_;
      }
      
      public function get fontContext() : IFlexModuleFactory
      {
         return moduleFactory;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = Button(param1.currentTarget).name;
         removeAlert(_loc2_);
      }
      
      mx_internal function removeTextField() : void
      {
         if(mx_internal::textField)
         {
            removeChild(DisplayObject(mx_internal::textField));
            mx_internal::textField = null;
         }
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:uint = Alert(parent).buttonFlags;
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            if(Boolean(_loc2_ & 0) || !(_loc2_ & 0))
            {
               removeAlert("CANCEL");
            }
            else if(_loc2_ & 0)
            {
               removeAlert("NO");
            }
         }
      }
      
      mx_internal function createTextField(param1:int) : void
      {
         if(!mx_internal::textField)
         {
            mx_internal::textField = IUITextField(createInFontContext(UITextField));
            mx_internal::textField.styleName = this;
            mx_internal::textField.text = Alert(parent).text;
            mx_internal::textField.multiline = true;
            mx_internal::textField.wordWrap = true;
            mx_internal::textField.selectable = true;
            if(param1 == -1)
            {
               addChild(DisplayObject(mx_internal::textField));
            }
            else
            {
               addChildAt(DisplayObject(mx_internal::textField),param1);
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         super.updateDisplayList(param1,param2);
         _loc4_ = param2 - mx_internal::buttons[0].height;
         _loc5_ = 0 * (mx_internal::buttons[0].width + 8) - 8;
         _loc3_ = (param1 - _loc5_) / 2;
         var _loc6_:int = 0;
         while(_loc6_ < mx_internal::buttons.length)
         {
            mx_internal::buttons[_loc6_].move(_loc3_,_loc4_);
            mx_internal::buttons[_loc6_].tabIndex = _loc6_ + 1;
            _loc3_ += mx_internal::buttons[_loc6_].width + 8;
            _loc6_++;
         }
         _loc5_ = textWidth;
         if(icon)
         {
            _loc5_ += NaN;
         }
         _loc3_ = (param1 - _loc5_) / 2;
         if(icon)
         {
            icon.x = _loc3_;
            icon.y = (_loc4_ - 0) / 2;
            _loc3_ += NaN;
         }
         var _loc7_:Number = Number(mx_internal::textField.getExplicitOrMeasuredHeight());
         mx_internal::textField.move(_loc3_,(_loc4_ - _loc7_) / 2);
         mx_internal::textField.setActualSize(textWidth + 5,_loc7_);
      }
      
      private function removeAlert(param1:String) : void
      {
         var _loc2_:Alert = Alert(parent);
         _loc2_.visible = false;
         var _loc3_:CloseEvent = new CloseEvent(CloseEvent.CLOSE);
         if(param1 == "YES")
         {
            _loc3_.detail = Alert.YES;
         }
         else if(param1 == "NO")
         {
            _loc3_.detail = Alert.NO;
         }
         else if(param1 == "OK")
         {
            _loc3_.detail = Alert.OK;
         }
         else if(param1 == "CANCEL")
         {
            _loc3_.detail = Alert.CANCEL;
         }
         _loc2_.dispatchEvent(_loc3_);
         PopUpManager.removePopUp(_loc2_);
      }
   }
}
