package mx.core
{
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import mx.managers.IToolTipManagerClient;
   import mx.styles.ISimpleStyleClient;
   
   public interface IUITextField extends IIMESupport, IFlexModule, IInvalidating, ISimpleStyleClient, IToolTipManagerClient, IUIComponent
   {
       
      
      function replaceText(param1:int, param2:int, param3:String) : void;
      
      function get doubleClickEnabled() : Boolean;
      
      function get nestLevel() : int;
      
      function get caretIndex() : int;
      
      function set doubleClickEnabled(param1:Boolean) : void;
      
      function get maxScrollH() : int;
      
      function set nestLevel(param1:int) : void;
      
      function get numLines() : int;
      
      function get scrollH() : int;
      
      function setColor(param1:uint) : void;
      
      function get maxScrollV() : int;
      
      function getImageReference(param1:String) : DisplayObject;
      
      function get scrollV() : int;
      
      function get border() : Boolean;
      
      function get text() : String;
      
      function get styleSheet() : StyleSheet;
      
      function getCharBoundaries(param1:int) : Rectangle;
      
      function get background() : Boolean;
      
      function set scrollH(param1:int) : void;
      
      function getFirstCharInParagraph(param1:int) : int;
      
      function get type() : String;
      
      function replaceSelectedText(param1:String) : void;
      
      function set borderColor(param1:uint) : void;
      
      function get alwaysShowSelection() : Boolean;
      
      function get sharpness() : Number;
      
      function get tabIndex() : int;
      
      function get textColor() : uint;
      
      function set defaultTextFormat(param1:TextFormat) : void;
      
      function get condenseWhite() : Boolean;
      
      function get displayAsPassword() : Boolean;
      
      function get autoSize() : String;
      
      function setSelection(param1:int, param2:int) : void;
      
      function set scrollV(param1:int) : void;
      
      function set useRichTextClipboard(param1:Boolean) : void;
      
      function get selectionBeginIndex() : int;
      
      function get selectable() : Boolean;
      
      function set border(param1:Boolean) : void;
      
      function set multiline(param1:Boolean) : void;
      
      function set background(param1:Boolean) : void;
      
      function set embedFonts(param1:Boolean) : void;
      
      function set text(param1:String) : void;
      
      function get selectionEndIndex() : int;
      
      function set mouseWheelEnabled(param1:Boolean) : void;
      
      function appendText(param1:String) : void;
      
      function get antiAliasType() : String;
      
      function set styleSheet(param1:StyleSheet) : void;
      
      function set nonInheritingStyles(param1:Object) : void;
      
      function set textColor(param1:uint) : void;
      
      function get wordWrap() : Boolean;
      
      function getLineIndexAtPoint(param1:Number, param2:Number) : int;
      
      function get htmlText() : String;
      
      function set tabIndex(param1:int) : void;
      
      function get thickness() : Number;
      
      function getLineIndexOfChar(param1:int) : int;
      
      function get bottomScrollV() : int;
      
      function set restrict(param1:String) : void;
      
      function set alwaysShowSelection(param1:Boolean) : void;
      
      function getTextFormat(param1:int = -1, param2:int = -1) : TextFormat;
      
      function set sharpness(param1:Number) : void;
      
      function set type(param1:String) : void;
      
      function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void;
      
      function set gridFitType(param1:String) : void;
      
      function getUITextFormat() : UITextFormat;
      
      function set inheritingStyles(param1:Object) : void;
      
      function setFocus() : void;
      
      function get borderColor() : uint;
      
      function set condenseWhite(param1:Boolean) : void;
      
      function get textWidth() : Number;
      
      function getLineOffset(param1:int) : int;
      
      function set displayAsPassword(param1:Boolean) : void;
      
      function set autoSize(param1:String) : void;
      
      function get defaultTextFormat() : TextFormat;
      
      function get useRichTextClipboard() : Boolean;
      
      function get nonZeroTextHeight() : Number;
      
      function set backgroundColor(param1:uint) : void;
      
      function get embedFonts() : Boolean;
      
      function set selectable(param1:Boolean) : void;
      
      function get multiline() : Boolean;
      
      function set maxChars(param1:int) : void;
      
      function get textHeight() : Number;
      
      function get nonInheritingStyles() : Object;
      
      function getLineText(param1:int) : String;
      
      function set focusRect(param1:Object) : void;
      
      function get mouseWheelEnabled() : Boolean;
      
      function get restrict() : String;
      
      function getParagraphLength(param1:int) : int;
      
      function set mouseEnabled(param1:Boolean) : void;
      
      function get gridFitType() : String;
      
      function get inheritingStyles() : Object;
      
      function set ignorePadding(param1:Boolean) : void;
      
      function set antiAliasType(param1:String) : void;
      
      function get backgroundColor() : uint;
      
      function getCharIndexAtPoint(param1:Number, param2:Number) : int;
      
      function set tabEnabled(param1:Boolean) : void;
      
      function get maxChars() : int;
      
      function get focusRect() : Object;
      
      function get ignorePadding() : Boolean;
      
      function get mouseEnabled() : Boolean;
      
      function get length() : int;
      
      function set wordWrap(param1:Boolean) : void;
      
      function get tabEnabled() : Boolean;
      
      function set thickness(param1:Number) : void;
      
      function getLineLength(param1:int) : int;
      
      function truncateToFit(param1:String = null) : Boolean;
      
      function set htmlText(param1:String) : void;
      
      function getLineMetrics(param1:int) : TextLineMetrics;
      
      function getStyle(param1:String) : *;
   }
}
