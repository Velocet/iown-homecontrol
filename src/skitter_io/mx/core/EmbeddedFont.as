package mx.core
{
   public class EmbeddedFont
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _fontName:String;
      
      private var _fontStyle:String;
      
      public function EmbeddedFont(param1:String, param2:Boolean, param3:Boolean)
      {
         super();
         _fontName = param1;
         _fontStyle = EmbeddedFontRegistry.getFontStyle(param2,param3);
      }
      
      public function get fontStyle() : String
      {
         return _fontStyle;
      }
      
      public function get fontName() : String
      {
         return _fontName;
      }
   }
}
