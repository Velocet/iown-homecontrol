package mx.core
{
   import flash.html.HTMLLoader;
   import mx.managers.IFocusManagerComplexComponent;
   import mx.utils.NameUtil;
   
   public class FlexHTMLLoader extends HTMLLoader implements IFocusManagerComplexComponent
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _focusEnabled:Boolean = true;
      
      private var _mouseFocusEnabled:Boolean = true;
      
      public function FlexHTMLLoader()
      {
         super();
         try
         {
            name = NameUtil.createUniqueName(this);
         }
         catch(e:Error)
         {
         }
      }
      
      override public function toString() : String
      {
         return NameUtil.displayObjectToString(this);
      }
      
      public function get focusEnabled() : Boolean
      {
         return _focusEnabled;
      }
      
      public function assignFocus(param1:String) : void
      {
         stage.assignFocus(this,param1);
      }
      
      public function get mouseFocusEnabled() : Boolean
      {
         return _mouseFocusEnabled;
      }
      
      public function set focusEnabled(param1:Boolean) : void
      {
         _focusEnabled = param1;
      }
      
      public function drawFocus(param1:Boolean) : void
      {
      }
      
      public function setFocus() : void
      {
         stage.focus = this;
      }
      
      public function set mouseFocusEnabled(param1:Boolean) : void
      {
         _mouseFocusEnabled = param1;
      }
   }
}
