package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IContainer;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   import mx.graphics.RectangularDropShadow;
   import mx.skins.RectangularBorder;
   import mx.styles.IStyleClient;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class HaloBorder extends RectangularBorder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var BORDER_WIDTHS:Object = {
         "none":0,
         "solid":1,
         "inset":2,
         "outset":2,
         "alert":3,
         "dropdown":2,
         "menuBorder":1,
         "comboNonEdit":2
      };
       
      
      mx_internal var radiusObj:Object;
      
      mx_internal var backgroundHole:Object;
      
      mx_internal var radius:Number;
      
      mx_internal var bRoundedCorners:Boolean;
      
      mx_internal var backgroundColor:Object;
      
      private var dropShadow:RectangularDropShadow;
      
      protected var _borderMetrics:EdgeMetrics;
      
      mx_internal var backgroundAlphaName:String;
      
      public function HaloBorder()
      {
         super();
         BORDER_WIDTHS["default"] = 3;
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(param1 == null || param1 == "styleName" || param1 == "borderStyle" || param1 == "borderThickness" || param1 == "borderSides")
         {
            _borderMetrics = null;
         }
         invalidateDisplayList();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(isNaN(param1) || isNaN(param2))
         {
            return;
         }
         super.updateDisplayList(param1,param2);
         mx_internal::backgroundColor = mx_internal::getBackgroundColor();
         mx_internal::bRoundedCorners = false;
         mx_internal::backgroundAlphaName = "backgroundAlpha";
         mx_internal::backgroundHole = null;
         mx_internal::radius = 0;
         mx_internal::radiusObj = null;
         mx_internal::drawBorder(param1,param2);
         mx_internal::drawBackground(param1,param2);
      }
      
      mx_internal function drawBorder(param1:Number, param2:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = 0;
         var _loc7_:* = 0;
         var _loc8_:String = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = 0;
         var _loc11_:Boolean = false;
         var _loc12_:* = 0;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:Number = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = 0;
         var _loc18_:Number = 0;
         var _loc19_:Boolean = false;
         var _loc20_:Object = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Object = null;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:IContainer = null;
         var _loc30_:EdgeMetrics = null;
         var _loc31_:* = false;
         var _loc32_:Number = NaN;
         var _loc33_:Array = null;
         var _loc34_:* = 0;
         var _loc35_:Boolean = false;
         var _loc36_:Number = NaN;
         var _loc3_:String = getStyle("borderStyle");
         var _loc4_:Array = getStyle("highlightAlphas");
         var _loc21_:Boolean = false;
         var _loc26_:Graphics;
         (_loc26_ = graphics).clear();
         if(_loc3_)
         {
            switch(_loc3_)
            {
               case "none":
                  break;
               case "inset":
                  _loc7_ = getStyle("borderColor");
                  _loc22_ = ColorUtil.adjustBrightness2(_loc7_,-40);
                  _loc23_ = ColorUtil.adjustBrightness2(_loc7_,25);
                  _loc24_ = ColorUtil.adjustBrightness2(_loc7_,40);
                  if((_loc25_ = mx_internal::backgroundColor) === null || _loc25_ === "")
                  {
                     _loc25_ = _loc7_;
                  }
                  mx_internal::draw3dBorder(_loc23_,_loc22_,_loc24_,Number(_loc25_),Number(_loc25_),Number(_loc25_));
                  break;
               case "outset":
                  _loc7_ = getStyle("borderColor");
                  _loc22_ = ColorUtil.adjustBrightness2(_loc7_,-40);
                  _loc23_ = ColorUtil.adjustBrightness2(_loc7_,-25);
                  _loc24_ = ColorUtil.adjustBrightness2(_loc7_,40);
                  if((_loc25_ = mx_internal::backgroundColor) === null || _loc25_ === "")
                  {
                     _loc25_ = _loc7_;
                  }
                  mx_internal::draw3dBorder(_loc23_,_loc24_,_loc22_,Number(_loc25_),Number(_loc25_),Number(_loc25_));
                  break;
               case "alert":
               case "default":
                  if(false)
                  {
                     _loc27_ = getStyle("backgroundAlpha");
                     _loc5_ = getStyle("borderAlpha");
                     mx_internal::backgroundAlphaName = "borderAlpha";
                     mx_internal::radius = getStyle("cornerRadius");
                     mx_internal::bRoundedCorners = getStyle("roundedBottomCorners").toString().toLowerCase() == "true";
                     _loc28_ = mx_internal::bRoundedCorners ? mx_internal::radius : 0;
                     mx_internal::drawDropShadow(0,0,param1,param2,mx_internal::radius,mx_internal::radius,_loc28_,_loc28_);
                     if(!mx_internal::bRoundedCorners)
                     {
                        mx_internal::radiusObj = {};
                     }
                     if(_loc29_ = parent as IContainer)
                     {
                        _loc30_ = _loc29_.viewMetrics;
                        mx_internal::backgroundHole = {
                           "x":_loc30_.left,
                           "y":_loc30_.top,
                           "w":Math.max(0,param1 - _loc30_.left - _loc30_.right),
                           "h":Math.max(0,param2 - _loc30_.top - _loc30_.bottom),
                           "r":0
                        };
                        if(false && false)
                        {
                           if(_loc27_ != _loc5_)
                           {
                              mx_internal::drawDropShadow(mx_internal::backgroundHole.x,mx_internal::backgroundHole.y,mx_internal::backgroundHole.w,mx_internal::backgroundHole.h,0,0,0,0);
                           }
                           _loc26_.beginFill(Number(mx_internal::backgroundColor),_loc27_);
                           _loc26_.drawRect(mx_internal::backgroundHole.x,mx_internal::backgroundHole.y,mx_internal::backgroundHole.w,mx_internal::backgroundHole.h);
                           _loc26_.endFill();
                        }
                     }
                     mx_internal::backgroundColor = getStyle("borderColor");
                  }
                  break;
               case "dropdown":
                  _loc12_ = getStyle("dropdownBorderColor");
                  mx_internal::drawDropShadow(0,0,param1,param2,4,0,0,4);
                  drawRoundRect(0,0,param1,param2,{
                     "tl":4,
                     "tr":0,
                     "br":0,
                     "bl":4
                  },5068126,1);
                  drawRoundRect(0,0,param1,param2,{
                     "tl":4,
                     "tr":0,
                     "br":0,
                     "bl":4
                  },[16777215,16777215],[0.7,0],verticalGradientMatrix(0,0,param1,param2));
                  drawRoundRect(1,1,param1 - 1,param2 - 2,{
                     "tl":3,
                     "tr":0,
                     "br":0,
                     "bl":3
                  },16777215,1);
                  drawRoundRect(1,2,param1 - 1,param2 - 3,{
                     "tl":3,
                     "tr":0,
                     "br":0,
                     "bl":3
                  },[15658734,16777215],1,verticalGradientMatrix(0,0,param1 - 1,param2 - 3));
                  if(!isNaN(_loc12_))
                  {
                     drawRoundRect(0,0,param1 + 1,param2,{
                        "tl":4,
                        "tr":0,
                        "br":0,
                        "bl":4
                     },_loc12_,0.5);
                     drawRoundRect(1,1,param1 - 1,param2 - 2,{
                        "tl":3,
                        "tr":0,
                        "br":0,
                        "bl":3
                     },16777215,1);
                     drawRoundRect(1,2,param1 - 1,param2 - 3,{
                        "tl":3,
                        "tr":0,
                        "br":0,
                        "bl":3
                     },[15658734,16777215],1,verticalGradientMatrix(0,0,param1 - 1,param2 - 3));
                  }
                  mx_internal::backgroundColor = null;
                  break;
               case "menuBorder":
                  _loc7_ = getStyle("borderColor");
                  drawRoundRect(0,0,param1,param2,0,_loc7_,1);
                  mx_internal::drawDropShadow(1,1,param1 - 2,param2 - 2,0,0,0,0);
                  break;
               case "comboNonEdit":
                  break;
               case "controlBar":
                  if(param1 == 0 || param2 == 0)
                  {
                     mx_internal::backgroundColor = null;
                     break;
                  }
                  _loc31_ = (_loc14_ = getStyle("footerColors")) != null;
                  _loc32_ = getStyle("borderAlpha");
                  if(_loc31_)
                  {
                     _loc26_.lineStyle(0,_loc14_.length > 0 ? uint(_loc14_[1]) : uint(_loc14_[0]),_loc32_);
                     _loc26_.moveTo(0,0);
                     _loc26_.lineTo(param1,0);
                     _loc26_.lineStyle(0,0,0);
                     if(Boolean(parent) && false && parent.parent is IStyleClient)
                     {
                        mx_internal::radius = IStyleClient(parent.parent).getStyle("cornerRadius");
                        _loc32_ = Number(IStyleClient(parent.parent).getStyle("borderAlpha"));
                     }
                     if(isNaN(mx_internal::radius))
                     {
                        mx_internal::radius = 0;
                     }
                     if(IStyleClient(parent.parent).getStyle("roundedBottomCorners").toString().toLowerCase() != "true")
                     {
                        mx_internal::radius = 0;
                     }
                     drawRoundRect(0,1,param1,param2 - 1,{
                        "tl":0,
                        "tr":0,
                        "bl":mx_internal::radius,
                        "br":mx_internal::radius
                     },_loc14_,_loc32_,verticalGradientMatrix(0,0,param1,param2));
                     if(_loc14_.length > 1 && _loc14_[0] != _loc14_[1])
                     {
                        drawRoundRect(0,1,param1,param2 - 1,{
                           "tl":0,
                           "tr":0,
                           "bl":mx_internal::radius,
                           "br":mx_internal::radius
                        },[16777215,16777215],_loc4_,verticalGradientMatrix(0,0,param1,param2));
                        drawRoundRect(1,2,param1 - 2,param2 - 3,{
                           "tl":0,
                           "tr":0,
                           "bl":mx_internal::radius - 1,
                           "br":mx_internal::radius - 1
                        },_loc14_,_loc32_,verticalGradientMatrix(0,0,param1,param2));
                     }
                  }
                  mx_internal::backgroundColor = null;
                  break;
               case "applicationControlBar":
                  _loc13_ = getStyle("fillColors");
                  _loc5_ = getStyle("backgroundAlpha");
                  _loc4_ = getStyle("highlightAlphas");
                  _loc33_ = getStyle("fillAlphas");
                  _loc11_ = getStyle("docked");
                  _loc34_ = uint(mx_internal::backgroundColor);
                  mx_internal::radius = getStyle("cornerRadius");
                  if(!mx_internal::radius)
                  {
                     mx_internal::radius = 0;
                  }
                  mx_internal::drawDropShadow(0,1,param1,param2 - 1,mx_internal::radius,mx_internal::radius,mx_internal::radius,mx_internal::radius);
                  if(mx_internal::backgroundColor !== null && StyleManager.isValidStyleValue(mx_internal::backgroundColor))
                  {
                     drawRoundRect(0,1,param1,param2 - 1,mx_internal::radius,_loc34_,_loc5_,verticalGradientMatrix(0,0,param1,param2));
                  }
                  drawRoundRect(0,1,param1,param2 - 1,mx_internal::radius,_loc13_,_loc33_,verticalGradientMatrix(0,0,param1,param2));
                  drawRoundRect(0,1,param1,param2 / 2 - 1,{
                     "tl":mx_internal::radius,
                     "tr":mx_internal::radius,
                     "bl":0,
                     "br":0
                  },[16777215,16777215],_loc4_,verticalGradientMatrix(0,0,param1,param2 / 2 - 1));
                  drawRoundRect(0,1,param1,param2 - 1,{
                     "tl":mx_internal::radius,
                     "tr":mx_internal::radius,
                     "bl":0,
                     "br":0
                  },16777215,0.3,null,GradientType.LINEAR,null,{
                     "x":0,
                     "y":2,
                     "w":param1,
                     "h":param2 - 2,
                     "r":{
                        "tl":mx_internal::radius,
                        "tr":mx_internal::radius,
                        "bl":0,
                        "br":0
                     }
                  });
                  mx_internal::backgroundColor = null;
                  break;
               default:
                  _loc7_ = getStyle("borderColor");
                  _loc9_ = getStyle("borderThickness");
                  _loc8_ = getStyle("borderSides");
                  _loc35_ = true;
                  mx_internal::radius = getStyle("cornerRadius");
                  mx_internal::bRoundedCorners = getStyle("roundedBottomCorners").toString().toLowerCase() == "true";
                  _loc36_ = Math.max(mx_internal::radius - _loc9_,0);
                  _loc20_ = {
                     "x":_loc9_,
                     "y":_loc9_,
                     "w":param1 - _loc9_ * 2,
                     "h":param2 - _loc9_ * 2,
                     "r":_loc36_
                  };
                  if(!mx_internal::bRoundedCorners)
                  {
                     mx_internal::radiusObj = {
                        "tl":mx_internal::radius,
                        "tr":mx_internal::radius,
                        "bl":0,
                        "br":0
                     };
                     _loc20_.r = {
                        "tl":_loc36_,
                        "tr":_loc36_,
                        "bl":0,
                        "br":0
                     };
                  }
                  if(_loc8_ != "left top right bottom")
                  {
                     _loc20_.r = {
                        "tl":_loc36_,
                        "tr":_loc36_,
                        "bl":(mx_internal::bRoundedCorners ? _loc36_ : 0),
                        "br":(mx_internal::bRoundedCorners ? _loc36_ : 0)
                     };
                     mx_internal::radiusObj = {
                        "tl":mx_internal::radius,
                        "tr":mx_internal::radius,
                        "bl":(mx_internal::bRoundedCorners ? mx_internal::radius : 0),
                        "br":(mx_internal::bRoundedCorners ? mx_internal::radius : 0)
                     };
                     if((_loc8_ = _loc8_.toLowerCase()).indexOf("left") == -1)
                     {
                        _loc20_.x = 0;
                        _loc20_.w += _loc9_;
                        _loc20_.r.tl = 0;
                        _loc20_.r.bl = 0;
                        mx_internal::radiusObj.tl = 0;
                        mx_internal::radiusObj.bl = 0;
                        _loc35_ = false;
                     }
                     if(_loc8_.indexOf("top") == -1)
                     {
                        _loc20_.y = 0;
                        _loc20_.h += _loc9_;
                        _loc20_.r.tl = 0;
                        _loc20_.r.tr = 0;
                        mx_internal::radiusObj.tl = 0;
                        mx_internal::radiusObj.tr = 0;
                        _loc35_ = false;
                     }
                     if(_loc8_.indexOf("right") == -1)
                     {
                        _loc20_.w += _loc9_;
                        _loc20_.r.tr = 0;
                        _loc20_.r.br = 0;
                        mx_internal::radiusObj.tr = 0;
                        mx_internal::radiusObj.br = 0;
                        _loc35_ = false;
                     }
                     if(_loc8_.indexOf("bottom") == -1)
                     {
                        _loc20_.h += _loc9_;
                        _loc20_.r.bl = 0;
                        _loc20_.r.br = 0;
                        mx_internal::radiusObj.bl = 0;
                        mx_internal::radiusObj.br = 0;
                        _loc35_ = false;
                     }
                  }
                  if(mx_internal::radius == 0 && _loc35_)
                  {
                     mx_internal::drawDropShadow(0,0,param1,param2,0,0,0,0);
                     _loc26_.beginFill(_loc7_);
                     _loc26_.drawRect(0,0,param1,param2);
                     _loc26_.drawRect(_loc9_,_loc9_,param1 - 2 * _loc9_,param2 - 2 * _loc9_);
                     _loc26_.endFill();
                  }
                  else if(mx_internal::radiusObj)
                  {
                     mx_internal::drawDropShadow(0,0,param1,param2,mx_internal::radiusObj.tl,mx_internal::radiusObj.tr,mx_internal::radiusObj.br,mx_internal::radiusObj.bl);
                     drawRoundRect(0,0,param1,param2,mx_internal::radiusObj,_loc7_,1,null,null,null,_loc20_);
                     mx_internal::radiusObj.tl = Math.max(mx_internal::radius - _loc9_,0);
                     mx_internal::radiusObj.tr = Math.max(mx_internal::radius - _loc9_,0);
                     mx_internal::radiusObj.bl = mx_internal::bRoundedCorners ? Math.max(mx_internal::radius - _loc9_,0) : 0;
                     mx_internal::radiusObj.br = mx_internal::bRoundedCorners ? Math.max(mx_internal::radius - _loc9_,0) : 0;
                  }
                  else
                  {
                     mx_internal::drawDropShadow(0,0,param1,param2,mx_internal::radius,mx_internal::radius,mx_internal::radius,mx_internal::radius);
                     drawRoundRect(0,0,param1,param2,mx_internal::radius,_loc7_,1,null,null,null,_loc20_);
                     mx_internal::radius = Math.max(getStyle("cornerRadius") - _loc9_,0);
                  }
            }
         }
      }
      
      mx_internal function drawBackground(param1:Number, param2:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:EdgeMetrics = null;
         var _loc7_:Graphics = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Array = null;
         var _loc12_:Number = NaN;
         if(mx_internal::backgroundColor !== null && mx_internal::backgroundColor !== "" || getStyle("mouseShield") || getStyle("mouseShieldChildren"))
         {
            _loc4_ = Number(mx_internal::backgroundColor);
            _loc5_ = 1;
            _loc6_ = mx_internal::getBackgroundColorMetrics();
            _loc7_ = graphics;
            if(isNaN(_loc4_) || mx_internal::backgroundColor === "" || mx_internal::backgroundColor === null)
            {
               _loc5_ = 0;
               _loc4_ = 16777215;
            }
            else
            {
               _loc5_ = getStyle(mx_internal::backgroundAlphaName);
            }
            if(mx_internal::radius != 0 || Boolean(mx_internal::backgroundHole))
            {
               _loc8_ = _loc6_.bottom;
               if(mx_internal::radiusObj)
               {
                  _loc9_ = Math.max(mx_internal::radius - Math.max(_loc6_.top,_loc6_.left,_loc6_.right),0);
                  _loc10_ = mx_internal::bRoundedCorners ? Math.max(mx_internal::radius - Math.max(_loc6_.bottom,_loc6_.left,_loc6_.right),0) : 0;
                  mx_internal::radiusObj = {
                     "tl":_loc9_,
                     "tr":_loc9_,
                     "bl":_loc10_,
                     "br":_loc10_
                  };
                  drawRoundRect(_loc6_.left,_loc6_.top,width - (_loc6_.left + _loc6_.right),height - (_loc6_.top + _loc8_),mx_internal::radiusObj,_loc4_,_loc5_,null,GradientType.LINEAR,null,mx_internal::backgroundHole);
               }
               else
               {
                  drawRoundRect(_loc6_.left,_loc6_.top,width - (_loc6_.left + _loc6_.right),height - (_loc6_.top + _loc8_),mx_internal::radius,_loc4_,_loc5_,null,GradientType.LINEAR,null,mx_internal::backgroundHole);
               }
            }
            else
            {
               _loc7_.beginFill(_loc4_,_loc5_);
               _loc7_.drawRect(_loc6_.left,_loc6_.top,param1 - _loc6_.right - _loc6_.left,param2 - _loc6_.bottom - _loc6_.top);
               _loc7_.endFill();
            }
         }
         var _loc3_:String = getStyle("borderStyle");
         if(false && (_loc3_ == "alert" || _loc3_ == "default") && getStyle("headerColors") == null)
         {
            _loc12_ = !!(_loc11_ = getStyle("highlightAlphas")) ? Number(_loc11_[0]) : 0.3;
            drawRoundRect(0,0,param1,param2,{
               "tl":mx_internal::radius,
               "tr":mx_internal::radius,
               "bl":0,
               "br":0
            },16777215,_loc12_,null,GradientType.LINEAR,null,{
               "x":0,
               "y":1,
               "w":param1,
               "h":param2 - 1,
               "r":{
                  "tl":mx_internal::radius,
                  "tr":mx_internal::radius,
                  "bl":0,
                  "br":0
               }
            });
         }
      }
      
      mx_internal function drawDropShadow(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         var _loc11_:Number = NaN;
         var _loc12_:Boolean = false;
         if(getStyle("dropShadowEnabled") == false || getStyle("dropShadowEnabled") == "false" || param3 == 0 || param4 == 0)
         {
            return;
         }
         var _loc9_:Number = getStyle("shadowDistance");
         var _loc10_:String = getStyle("shadowDirection");
         if(getStyle("borderStyle") == "applicationControlBar")
         {
            _loc11_ = (_loc12_ = getStyle("docked")) ? 90 : mx_internal::getDropShadowAngle(_loc9_,_loc10_);
            _loc9_ = Math.abs(_loc9_);
         }
         else
         {
            _loc11_ = mx_internal::getDropShadowAngle(_loc9_,_loc10_);
            _loc9_ = Math.abs(_loc9_) + 2;
         }
         if(!dropShadow)
         {
            dropShadow = new RectangularDropShadow();
         }
         dropShadow.distance = _loc9_;
         dropShadow.angle = _loc11_;
         dropShadow.color = getStyle("dropShadowColor");
         dropShadow.alpha = 0.4;
         dropShadow.tlRadius = param5;
         dropShadow.trRadius = param6;
         dropShadow.blRadius = param8;
         dropShadow.brRadius = param7;
         dropShadow.drawShadow(graphics,param1,param2,param3,param4);
      }
      
      mx_internal function getBackgroundColor() : Object
      {
         var _loc2_:Object = null;
         var _loc1_:IUIComponent = parent as IUIComponent;
         if(Boolean(_loc1_) && !_loc1_.enabled)
         {
            _loc2_ = getStyle("backgroundDisabledColor");
            if(_loc2_ !== null && StyleManager.isValidStyleValue(_loc2_))
            {
               return _loc2_;
            }
         }
         return getStyle("backgroundColor");
      }
      
      mx_internal function draw3dBorder(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Number = width;
         var _loc8_:Number = height;
         mx_internal::drawDropShadow(0,0,width,height,0,0,0,0);
         var _loc9_:Graphics;
         (_loc9_ = graphics).beginFill(param1);
         _loc9_.drawRect(0,0,_loc7_,_loc8_);
         _loc9_.drawRect(1,0,_loc7_ - 2,_loc8_);
         _loc9_.endFill();
         _loc9_.beginFill(param2);
         _loc9_.drawRect(1,0,_loc7_ - 2,1);
         _loc9_.endFill();
         _loc9_.beginFill(param3);
         _loc9_.drawRect(1,_loc8_ - 1,_loc7_ - 2,1);
         _loc9_.endFill();
         _loc9_.beginFill(param4);
         _loc9_.drawRect(1,1,_loc7_ - 2,1);
         _loc9_.endFill();
         _loc9_.beginFill(param5);
         _loc9_.drawRect(1,_loc8_ - 2,_loc7_ - 2,1);
         _loc9_.endFill();
         _loc9_.beginFill(param6);
         _loc9_.drawRect(1,2,_loc7_ - 2,_loc8_ - 4);
         _loc9_.drawRect(2,2,_loc7_ - 4,_loc8_ - 4);
         _loc9_.endFill();
      }
      
      mx_internal function getBackgroundColorMetrics() : EdgeMetrics
      {
         return borderMetrics;
      }
      
      mx_internal function getDropShadowAngle(param1:Number, param2:String) : Number
      {
         if(param2 == "left")
         {
            return param1 >= 0 ? 135 : 225;
         }
         if(param2 == "right")
         {
            return param1 >= 0 ? 45 : 315;
         }
         return param1 >= 0 ? 90 : 270;
      }
      
      override public function get borderMetrics() : EdgeMetrics
      {
         var _loc1_:Number = NaN;
         var _loc3_:String = null;
         if(_borderMetrics)
         {
            return _borderMetrics;
         }
         var _loc2_:String = getStyle("borderStyle");
         if(_loc2_ == "default" || _loc2_ == "alert")
         {
            if(true)
            {
               return EdgeMetrics.EMPTY;
            }
            _borderMetrics = new EdgeMetrics(0,0,0,0);
         }
         else if(_loc2_ == "controlBar" || _loc2_ == "applicationControlBar")
         {
            _borderMetrics = new EdgeMetrics(1,1,1,1);
         }
         else if(_loc2_ == "solid")
         {
            _loc1_ = getStyle("borderThickness");
            if(isNaN(_loc1_))
            {
               _loc1_ = 0;
            }
            _borderMetrics = new EdgeMetrics(_loc1_,_loc1_,_loc1_,_loc1_);
            _loc3_ = getStyle("borderSides");
            if(_loc3_ != "left top right bottom")
            {
               if(_loc3_.indexOf("left") == -1)
               {
                  _borderMetrics.left = 0;
               }
               if(_loc3_.indexOf("top") == -1)
               {
                  _borderMetrics.top = 0;
               }
               if(_loc3_.indexOf("right") == -1)
               {
                  _borderMetrics.right = 0;
               }
               if(_loc3_.indexOf("bottom") == -1)
               {
                  _borderMetrics.bottom = 0;
               }
            }
         }
         else
         {
            _loc1_ = 0;
            if(isNaN(_loc1_))
            {
               _loc1_ = 0;
            }
            _borderMetrics = new EdgeMetrics(_loc1_,_loc1_,_loc1_,_loc1_);
         }
         return _borderMetrics;
      }
   }
}
