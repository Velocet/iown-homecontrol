package mx.core.windowClasses
{
   import flash.display.DisplayObject;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUITextField;
   import mx.core.UIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   
   public class StatusBar extends UIComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var statusChanged:Boolean = false;
      
      public var statusTextField:IUITextField;
      
      mx_internal var statusBarBackground:IFlexDisplayObject;
      
      private var _status:String = "";
      
      public function StatusBar()
      {
         super();
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:Class = null;
         var _loc4_:IStyleClient = null;
         var _loc5_:ISimpleStyleClient = null;
         super.styleChanged(param1);
         invalidateDisplayList();
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         if(_loc2_ || param1 == "statusBarBackgroundSkin")
         {
            _loc3_ = getStyle("statusBarBackgroundSkin");
            if(_loc3_)
            {
               if(mx_internal::statusBarBackground)
               {
                  removeChild(DisplayObject(mx_internal::statusBarBackground));
                  mx_internal::statusBarBackground = null;
               }
               mx_internal::statusBarBackground = new _loc3_();
               if(_loc4_ = mx_internal::statusBarBackground as IStyleClient)
               {
                  _loc4_.setStyle("backgroundImage",undefined);
               }
               if(_loc5_ = mx_internal::statusBarBackground as ISimpleStyleClient)
               {
                  _loc5_.styleName = this;
               }
               addChildAt(DisplayObject(mx_internal::statusBarBackground),0);
            }
         }
         if(_loc2_ || param1 == "statusTextStyleName")
         {
            if(statusTextField)
            {
               statusTextField.styleName = getStyle("statusTextStyleName");
            }
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         statusTextField.validateNow();
         if(false)
         {
            statusTextField.text = " ";
            statusTextField.validateNow();
         }
         measuredHeight = NaN;
         measuredWidth = statusTextField.textWidth;
      }
      
      public function set status(param1:String) : void
      {
         _status = param1;
         statusChanged = true;
         invalidateProperties();
         invalidateSize();
      }
      
      public function get status() : String
      {
         return _status;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         mx_internal::statusBarBackground.setActualSize(param1,param2);
         statusTextField.text = _status;
         statusTextField.width = param1;
         statusTextField.truncateToFit("...");
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(statusChanged)
         {
            statusTextField.text = _status;
            statusChanged = false;
         }
      }
      
      override protected function createChildren() : void
      {
         var _loc2_:IStyleClient = null;
         var _loc3_:ISimpleStyleClient = null;
         super.createChildren();
         var _loc1_:Class = getStyle("statusBarBackgroundSkin");
         if(_loc1_)
         {
            mx_internal::statusBarBackground = new _loc1_();
            _loc2_ = mx_internal::statusBarBackground as IStyleClient;
            if(_loc2_)
            {
               _loc2_.setStyle("backgroundImage",undefined);
            }
            _loc3_ = mx_internal::statusBarBackground as ISimpleStyleClient;
            if(_loc3_)
            {
               _loc3_.styleName = this;
            }
            addChild(DisplayObject(mx_internal::statusBarBackground));
         }
         if(!statusTextField)
         {
            statusTextField = IUITextField(createInFontContext(UITextField));
            statusTextField.text = _status;
            statusTextField.styleName = getStyle("statusTextStyleName");
            statusTextField.enabled = true;
            addChild(DisplayObject(statusTextField));
         }
      }
   }
}
