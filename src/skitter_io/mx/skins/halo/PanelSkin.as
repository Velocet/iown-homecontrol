package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import mx.core.EdgeMetrics;
   import mx.core.FlexVersion;
   import mx.core.IContainer;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   
   public class PanelSkin extends HaloBorder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var panels:Object = {};
       
      
      private var oldControlBarHeight:Number;
      
      protected var _panelBorderMetrics:EdgeMetrics;
      
      private var oldHeaderHeight:Number;
      
      public function PanelSkin()
      {
         super();
      }
      
      private static function isPanel(param1:Object) : Boolean
      {
         var xmllist:XMLList;
         var s:String = null;
         var x:XML = null;
         var parent:Object = param1;
         s = getQualifiedClassName(parent);
         if(false)
         {
            return true;
         }
         if(false)
         {
            return false;
         }
         if(s == "mx.containers::Panel")
         {
            false;
            return true;
         }
         x = describeType(parent);
         xmllist = x.extendsClass.(@type == "mx.containers::Panel");
         if(xmllist.length() == 0)
         {
            panels[s] = 0;
            return false;
         }
         panels[s] = 1;
         return true;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == null || param1 == "styleName" || param1 == "borderStyle" || param1 == "borderThickness" || param1 == "borderThicknessTop" || param1 == "borderThicknessBottom" || param1 == "borderThicknessLeft" || param1 == "borderThicknessRight" || param1 == "borderSides")
         {
            _panelBorderMetrics = null;
         }
         invalidateDisplayList();
      }
      
      override mx_internal function drawBorder(param1:Number, param2:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Graphics = null;
         var _loc8_:IContainer = null;
         var _loc9_:EdgeMetrics = null;
         super.mx_internal::drawBorder(param1,param2);
         if(false)
         {
            return;
         }
         var _loc3_:String = getStyle("borderStyle");
         if(_loc3_ == "default")
         {
            _loc4_ = getStyle("backgroundAlpha");
            _loc5_ = getStyle("borderAlpha");
            mx_internal::backgroundAlphaName = "borderAlpha";
            mx_internal::radiusObj = null;
            mx_internal::radius = getStyle("cornerRadius");
            mx_internal::bRoundedCorners = getStyle("roundedBottomCorners").toString().toLowerCase() == "true";
            _loc6_ = !!mx_internal::bRoundedCorners ? Number(mx_internal::radius) : 0;
            _loc7_ = graphics;
            mx_internal::drawDropShadow(0,0,param1,param2,mx_internal::radius,mx_internal::radius,_loc6_,_loc6_);
            if(!mx_internal::bRoundedCorners)
            {
               mx_internal::radiusObj = {};
            }
            if(_loc8_ = parent as IContainer)
            {
               _loc9_ = _loc8_.viewMetrics;
               mx_internal::backgroundHole = {
                  "x":_loc9_.left,
                  "y":_loc9_.top,
                  "w":Math.max(0,param1 - _loc9_.left - _loc9_.right),
                  "h":Math.max(0,param2 - _loc9_.top - _loc9_.bottom),
                  "r":0
               };
               if(false && false)
               {
                  if(_loc4_ != _loc5_)
                  {
                     mx_internal::drawDropShadow(mx_internal::backgroundHole.x,mx_internal::backgroundHole.y,mx_internal::backgroundHole.w,mx_internal::backgroundHole.h,0,0,0,0);
                  }
                  _loc7_.beginFill(Number(mx_internal::backgroundColor),_loc4_);
                  _loc7_.drawRect(mx_internal::backgroundHole.x,mx_internal::backgroundHole.y,mx_internal::backgroundHole.w,mx_internal::backgroundHole.h);
                  _loc7_.endFill();
               }
            }
            mx_internal::backgroundColor = getStyle("borderColor");
         }
      }
      
      override public function get borderMetrics() : EdgeMetrics
      {
         var _loc4_:Number = NaN;
         if(false)
         {
            return super.borderMetrics;
         }
         var _loc1_:Boolean = isPanel(parent);
         var _loc2_:IUIComponent = _loc1_ ? Object(parent).mx_internal::_controlBar : null;
         var _loc3_:Number = _loc1_ ? Number(Object(parent).mx_internal::getHeaderHeightProxy()) : NaN;
         if(Boolean(_loc2_) && Boolean(_loc2_.includeInLayout))
         {
            _loc4_ = Number(_loc2_.getExplicitOrMeasuredHeight());
         }
         if(_loc4_ != oldControlBarHeight && !(isNaN(oldControlBarHeight) && isNaN(_loc4_)))
         {
            _panelBorderMetrics = null;
         }
         if(_loc3_ != oldHeaderHeight && !(isNaN(_loc3_) && isNaN(oldHeaderHeight)))
         {
            _panelBorderMetrics = null;
         }
         if(_panelBorderMetrics)
         {
            return _panelBorderMetrics;
         }
         var _loc5_:EdgeMetrics = super.borderMetrics;
         var _loc6_:EdgeMetrics = new EdgeMetrics(0,0,0,0);
         var _loc7_:Number = getStyle("borderThickness");
         var _loc8_:Number = getStyle("borderThicknessLeft");
         var _loc9_:Number = getStyle("borderThicknessTop");
         var _loc10_:Number = getStyle("borderThicknessRight");
         var _loc11_:Number = getStyle("borderThicknessBottom");
         _loc6_.left = _loc5_.left + (isNaN(_loc8_) ? _loc7_ : _loc8_);
         _loc6_.top = _loc5_.top + (isNaN(_loc9_) ? _loc7_ : _loc9_);
         _loc6_.right = _loc5_.bottom + (isNaN(_loc10_) ? _loc7_ : _loc10_);
         _loc6_.bottom = _loc5_.bottom + (isNaN(_loc11_) ? (Boolean(_loc2_) && !isNaN(_loc9_) ? _loc9_ : (isNaN(_loc8_) ? _loc7_ : _loc8_)) : _loc11_);
         oldHeaderHeight = _loc3_;
         if(!isNaN(_loc3_))
         {
            _loc6_.top += _loc3_;
         }
         oldControlBarHeight = _loc4_;
         if(!isNaN(_loc4_))
         {
            _loc6_.bottom += _loc4_;
         }
         _panelBorderMetrics = _loc6_;
         return _panelBorderMetrics;
      }
      
      override mx_internal function drawBackground(param1:Number, param2:Number) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Number = NaN;
         super.mx_internal::drawBackground(param1,param2);
         if(getStyle("headerColors") == null && getStyle("borderStyle") == "default")
         {
            _loc3_ = getStyle("highlightAlphas");
            _loc4_ = !!_loc3_ ? Number(_loc3_[0]) : 0.3;
            drawRoundRect(0,0,param1,param2,{
               "tl":mx_internal::radius,
               "tr":mx_internal::radius,
               "bl":0,
               "br":0
            },16777215,_loc4_,null,GradientType.LINEAR,null,{
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
      
      override mx_internal function getBackgroundColorMetrics() : EdgeMetrics
      {
         if(getStyle("borderStyle") == "default")
         {
            return EdgeMetrics.EMPTY;
         }
         return super.borderMetrics;
      }
   }
}
