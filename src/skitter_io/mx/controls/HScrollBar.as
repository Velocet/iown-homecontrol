package mx.controls
{
   import flash.ui.Keyboard;
   import mx.controls.scrollClasses.ScrollBar;
   import mx.controls.scrollClasses.ScrollBarDirection;
   import mx.core.mx_internal;
   
   public class HScrollBar extends ScrollBar
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function HScrollBar()
      {
         super();
         super.direction = ScrollBarDirection.HORIZONTAL;
         scaleX = -1;
         rotation = -90;
      }
      
      override mx_internal function get virtualHeight() : Number
      {
         return unscaledWidth;
      }
      
      override protected function measure() : void
      {
         super.measure();
         measuredWidth = mx_internal::_minHeight;
         measuredHeight = mx_internal::_minWidth;
      }
      
      override public function get minHeight() : Number
      {
         return mx_internal::_minWidth;
      }
      
      override mx_internal function get virtualWidth() : Number
      {
         return unscaledHeight;
      }
      
      override public function get minWidth() : Number
      {
         return mx_internal::_minHeight;
      }
      
      override mx_internal function isScrollBarKey(param1:uint) : Boolean
      {
         if(param1 == Keyboard.LEFT)
         {
            mx_internal::lineScroll(-1);
            return true;
         }
         if(param1 == Keyboard.RIGHT)
         {
            mx_internal::lineScroll(1);
            return true;
         }
         return super.mx_internal::isScrollBarKey(param1);
      }
      
      override public function set direction(param1:String) : void
      {
      }
   }
}
