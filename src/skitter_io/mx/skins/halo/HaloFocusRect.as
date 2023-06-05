package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.IStyleClient;
   import mx.utils.GraphicsUtil;
   
   public class HaloFocusRect extends ProgrammaticSkin implements IStyleClient
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _focusColor:Number;
      
      public function HaloFocusRect()
      {
         super();
      }
      
      public function get inheritingStyles() : Object
      {
         return styleName.inheritingStyles;
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
      }
      
      public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
      }
      
      public function registerEffects(param1:Array) : void
      {
      }
      
      public function regenerateStyleCache(param1:Boolean) : void
      {
      }
      
      public function get styleDeclaration() : CSSStyleDeclaration
      {
         return CSSStyleDeclaration(styleName);
      }
      
      public function getClassStyleDeclarations() : Array
      {
         return [];
      }
      
      public function get className() : String
      {
         return "HaloFocusRect";
      }
      
      public function clearStyle(param1:String) : void
      {
         if(param1 == "focusColor")
         {
            _focusColor = NaN;
         }
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         if(param1 == "focusColor")
         {
            _focusColor = param2;
         }
      }
      
      public function set nonInheritingStyles(param1:Object) : void
      {
      }
      
      public function get nonInheritingStyles() : Object
      {
         return styleName.nonInheritingStyles;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         super.updateDisplayList(param1,param2);
         var _loc3_:String = getStyle("focusBlendMode");
         var _loc4_:Number = getStyle("focusAlpha");
         var _loc5_:Number = getStyle("focusColor");
         var _loc6_:Number = getStyle("cornerRadius");
         var _loc7_:Number = getStyle("focusThickness");
         var _loc8_:String = getStyle("focusRoundedCorners");
         var _loc9_:Number = getStyle("themeColor");
         var _loc10_:Number = _loc5_;
         if(isNaN(_loc10_))
         {
            _loc10_ = _loc9_;
         }
         var _loc11_:Graphics;
         (_loc11_ = graphics).clear();
         if(_loc3_)
         {
            blendMode = _loc3_;
         }
         if(_loc8_ != "tl tr bl br" && _loc6_ > 0)
         {
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = 0;
            _loc15_ = 0;
            _loc16_ = _loc6_ + _loc7_;
            if(_loc8_.indexOf("tl") >= 0)
            {
               _loc12_ = _loc16_;
            }
            if(_loc8_.indexOf("tr") >= 0)
            {
               _loc14_ = _loc16_;
            }
            if(_loc8_.indexOf("bl") >= 0)
            {
               _loc13_ = _loc16_;
            }
            if(_loc8_.indexOf("br") >= 0)
            {
               _loc15_ = _loc16_;
            }
            _loc11_.beginFill(_loc10_,_loc4_);
            GraphicsUtil.drawRoundRectComplex(_loc11_,0,0,param1,param2,_loc12_,_loc14_,_loc13_,_loc15_);
            _loc12_ = !!_loc12_ ? _loc6_ : 0;
            _loc14_ = !!_loc14_ ? _loc6_ : 0;
            _loc13_ = !!_loc13_ ? _loc6_ : 0;
            _loc15_ = !!_loc15_ ? _loc6_ : 0;
            GraphicsUtil.drawRoundRectComplex(_loc11_,_loc7_,_loc7_,param1 - 2 * _loc7_,param2 - 2 * _loc7_,_loc12_,_loc14_,_loc13_,_loc15_);
            _loc11_.endFill();
            _loc16_ = _loc6_ + _loc7_ / 2;
            _loc12_ = !!_loc12_ ? _loc16_ : 0;
            _loc14_ = !!_loc14_ ? _loc16_ : 0;
            _loc13_ = !!_loc13_ ? _loc16_ : 0;
            _loc15_ = !!_loc15_ ? _loc16_ : 0;
            _loc11_.beginFill(_loc10_,_loc4_);
            GraphicsUtil.drawRoundRectComplex(_loc11_,_loc7_ / 2,_loc7_ / 2,param1 - _loc7_,param2 - _loc7_,_loc12_,_loc14_,_loc13_,_loc15_);
            _loc12_ = !!_loc12_ ? _loc6_ : 0;
            _loc14_ = !!_loc14_ ? _loc6_ : 0;
            _loc13_ = !!_loc13_ ? _loc6_ : 0;
            _loc15_ = !!_loc15_ ? _loc6_ : 0;
            GraphicsUtil.drawRoundRectComplex(_loc11_,_loc7_,_loc7_,param1 - 2 * _loc7_,param2 - 2 * _loc7_,_loc12_,_loc14_,_loc13_,_loc15_);
            _loc11_.endFill();
         }
         else
         {
            _loc11_.beginFill(_loc10_,_loc4_);
            _loc17_ = (_loc6_ > 0 ? _loc6_ + _loc7_ : 0) * 2;
            _loc11_.drawRoundRect(0,0,param1,param2,_loc17_,_loc17_);
            _loc17_ = _loc6_ * 2;
            _loc11_.drawRoundRect(_loc7_,_loc7_,param1 - 2 * _loc7_,param2 - 2 * _loc7_,_loc17_,_loc17_);
            _loc11_.endFill();
            _loc11_.beginFill(_loc10_,_loc4_);
            _loc17_ = (_loc6_ > 0 ? _loc6_ + _loc7_ / 2 : 0) * 2;
            _loc11_.drawRoundRect(_loc7_ / 2,_loc7_ / 2,param1 - _loc7_,param2 - _loc7_,_loc17_,_loc17_);
            _loc17_ = _loc6_ * 2;
            _loc11_.drawRoundRect(_loc7_,_loc7_,param1 - 2 * _loc7_,param2 - 2 * _loc7_,_loc17_,_loc17_);
            _loc11_.endFill();
         }
      }
      
      override public function getStyle(param1:String) : *
      {
         return param1 == "focusColor" ? _focusColor : super.getStyle(param1);
      }
      
      public function set styleDeclaration(param1:CSSStyleDeclaration) : void
      {
      }
   }
}
