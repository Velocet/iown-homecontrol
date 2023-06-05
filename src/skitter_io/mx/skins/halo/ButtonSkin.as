package mx.skins.halo
{
   import flash.display.GradientType;
   import mx.core.IButton;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class ButtonSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var cache:Object = {};
       
      
      public function ButtonSkin()
      {
         super();
      }
      
      private static function calcDerivedStyles(param1:uint, param2:uint, param3:uint) : Object
      {
         var _loc5_:Object = null;
         var _loc4_:String = HaloColors.getCacheKey(param1,param2,param3);
         if(true)
         {
            _loc5_ = cache[_loc4_] = {};
            HaloColors.addHaloColors(_loc5_,param1,param2,param3);
         }
         return cache[_loc4_];
      }
      
      override public function get measuredWidth() : Number
      {
         return UIComponent.DEFAULT_MEASURED_MIN_WIDTH;
      }
      
      override public function get measuredHeight() : Number
      {
         return UIComponent.DEFAULT_MEASURED_MIN_HEIGHT;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc16_:Number = NaN;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:uint = getStyle("borderColor");
         var _loc4_:Number = getStyle("cornerRadius");
         var _loc5_:Array = getStyle("fillAlphas");
         var _loc6_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc6_);
         var _loc7_:Array = getStyle("highlightAlphas");
         var _loc8_:uint = getStyle("themeColor");
         var _loc9_:Object = calcDerivedStyles(_loc8_,_loc6_[0],_loc6_[1]);
         var _loc10_:Number = ColorUtil.adjustBrightness2(_loc3_,-50);
         var _loc11_:Number = ColorUtil.adjustBrightness2(_loc8_,-25);
         var _loc12_:Boolean = false;
         if(parent is IButton)
         {
            _loc12_ = Boolean(IButton(parent).emphasized);
         }
         var _loc13_:Number = Math.max(0,_loc4_);
         var _loc14_:Number = Math.max(0,_loc4_ - 1);
         var _loc15_:Number = Math.max(0,_loc4_ - 2);
         graphics.clear();
         switch(name)
         {
            case "selectedUpSkin":
            case "selectedOverSkin":
               drawRoundRect(0,0,param1,param2,_loc13_,[_loc8_,_loc11_],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc14_,[_loc6_[1],_loc6_[1]],1,verticalGradientMatrix(0,0,param1 - 2,param2 - 2));
               break;
            case "upSkin":
               _loc17_ = [_loc6_[0],_loc6_[1]];
               _loc18_ = [_loc5_[0],_loc5_[1]];
               if(_loc12_)
               {
                  drawRoundRect(0,0,param1,param2,_loc13_,[_loc8_,_loc11_],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                     "x":2,
                     "y":2,
                     "w":param1 - 4,
                     "h":param2 - 4,
                     "r":_loc4_ - 2
                  });
                  drawRoundRect(2,2,param1 - 4,param2 - 4,_loc15_,_loc17_,_loc18_,verticalGradientMatrix(2,2,param1 - 2,param2 - 2));
                  drawRoundRect(2,2,param1 - 4,(param2 - 4) / 2,{
                     "tl":_loc15_,
                     "tr":_loc15_,
                     "bl":0,
                     "br":0
                  },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               }
               else
               {
                  drawRoundRect(0,0,param1,param2,_loc13_,[_loc3_,_loc10_],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                     "x":1,
                     "y":1,
                     "w":param1 - 2,
                     "h":param2 - 2,
                     "r":_loc4_ - 1
                  });
                  drawRoundRect(1,1,param1 - 2,param2 - 2,_loc14_,_loc17_,_loc18_,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
                  drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,{
                     "tl":_loc14_,
                     "tr":_loc14_,
                     "bl":0,
                     "br":0
                  },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               }
               break;
            case "overSkin":
               if(_loc6_.length > 2)
               {
                  _loc19_ = [_loc6_[2],_loc6_[3]];
               }
               else
               {
                  _loc19_ = [_loc6_[0],_loc6_[1]];
               }
               if(_loc5_.length > 2)
               {
                  _loc20_ = [_loc5_[2],_loc5_[3]];
               }
               else
               {
                  _loc20_ = [_loc5_[0],_loc5_[1]];
               }
               drawRoundRect(0,0,param1,param2,_loc13_,[_loc8_,_loc11_],1,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc4_ - 1
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc14_,_loc19_,_loc20_,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,(param2 - 2) / 2,{
                  "tl":_loc14_,
                  "tr":_loc14_,
                  "bl":0,
                  "br":0
               },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               break;
            case "downSkin":
            case "selectedDownSkin":
               drawRoundRect(0,0,param1,param2,_loc13_,[_loc8_,_loc11_],1,verticalGradientMatrix(0,0,param1,param2));
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc14_,[_loc9_.fillColorPress1,_loc9_.fillColorPress2],1,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
               drawRoundRect(2,2,param1 - 4,(param2 - 4) / 2,{
                  "tl":_loc15_,
                  "tr":_loc15_,
                  "bl":0,
                  "br":0
               },[16777215,16777215],_loc7_,verticalGradientMatrix(1,1,param1 - 2,(param2 - 2) / 2));
               break;
            case "disabledSkin":
            case "selectedDisabledSkin":
               _loc21_ = [_loc6_[0],_loc6_[1]];
               _loc22_ = [Math.max(0,_loc5_[0] - 0.15),Math.max(0,_loc5_[1] - 0.15)];
               drawRoundRect(0,0,param1,param2,_loc13_,[_loc3_,_loc10_],0.5,verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":_loc4_ - 1
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,_loc14_,_loc21_,_loc22_,verticalGradientMatrix(1,1,param1 - 2,param2 - 2));
         }
      }
   }
}
