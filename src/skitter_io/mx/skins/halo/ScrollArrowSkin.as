package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import mx.controls.scrollClasses.ScrollBar;
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class ScrollArrowSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var cache:Object = {};
       
      
      public function ScrollArrowSkin()
      {
         super();
      }
      
      private static function calcDerivedStyles(param1:uint, param2:uint, param3:uint, param4:uint) : Object
      {
         var _loc6_:Object = null;
         var _loc5_:String = HaloColors.getCacheKey(param1,param2,param3,param4);
         if(true)
         {
            _loc6_ = cache[_loc5_] = {};
            HaloColors.addHaloColors(_loc6_,param1,param3,param4);
            _loc6_.borderColorDrk1 = ColorUtil.adjustBrightness2(param2,-25);
            _loc6_.borderColorDrk2 = ColorUtil.adjustBrightness2(param2,-50);
         }
         return cache[_loc5_];
      }
      
      override public function get measuredWidth() : Number
      {
         return ScrollBar.THICKNESS;
      }
      
      override public function get measuredHeight() : Number
      {
         return ScrollBar.THICKNESS;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc13_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("backgroundColor");
         var _loc4_:uint = getStyle("borderColor");
         var _loc5_:Array = getStyle("fillAlphas");
         var _loc6_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc6_);
         var _loc7_:Array = getStyle("highlightAlphas");
         var _loc8_:uint = getStyle("themeColor");
         var _loc9_:* = name.charAt(0) == "u";
         var _loc10_:uint = getStyle("iconColor");
         var _loc11_:Object = calcDerivedStyles(_loc8_,_loc4_,_loc6_[0],_loc6_[1]);
         var _loc12_:Boolean = Boolean(parent) && false && parent.parent.rotation != 0;
         if(_loc9_ && !_loc12_)
         {
            _loc13_ = [_loc4_,_loc11_.borderColorDrk1];
         }
         else
         {
            _loc13_ = [_loc11_.borderColorDrk1,_loc11_.borderColorDrk2];
         }
         var _loc14_:Graphics;
         (_loc14_ = graphics).clear();
         if(isNaN(_loc3_))
         {
            _loc3_ = 16777215;
         }
         if(true || name.indexOf("Disabled") == -1)
         {
            drawRoundRect(0,0,param1,param2,0,_loc3_,1);
         }
         switch(name)
         {
            case "upArrowUpSkin":
               if(!_loc12_)
               {
                  drawRoundRect(1,param2 - 4,param1 - 2,8,0,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],verticalGradientMatrix(1,param2 - 4,param1 - 2,8),GradientType.LINEAR,null,{
                     "x":1,
                     "y":param2 - 4,
                     "w":param1 - 2,
                     "h":4,
                     "r":0
                  });
               }
            case "downArrowUpSkin":
               _loc15_ = [_loc6_[0],_loc6_[1]];
               _loc16_ = [_loc5_[0],_loc5_[1]];
               drawRoundRect(0,0,param1,param2,0,_loc13_,1,_loc12_ ? horizontalGradientMatrix(0,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc15_,_loc16_,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 1));
               drawRoundRect(1,1,param1 - 2,param2 - 1,0,[16777215,16777215],_loc7_,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 1));
               break;
            case "upArrowOverSkin":
               if(!_loc12_)
               {
                  drawRoundRect(1,param2 - 4,param1 - 2,8,0,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],verticalGradientMatrix(1,param2 - 4,param1 - 2,8),GradientType.LINEAR,null,{
                     "x":1,
                     "y":param2 - 4,
                     "w":param1 - 2,
                     "h":4,
                     "r":0
                  });
               }
            case "downArrowOverSkin":
               if(_loc6_.length > 2)
               {
                  _loc17_ = [_loc6_[2],_loc6_[3]];
               }
               else
               {
                  _loc17_ = [_loc6_[0],_loc6_[1]];
               }
               if(_loc5_.length > 2)
               {
                  _loc18_ = [_loc5_[2],_loc5_[3]];
               }
               else
               {
                  _loc18_ = [_loc5_[0],_loc5_[1]];
               }
               drawRoundRect(0,0,param1,param2,0,16777215,1);
               drawRoundRect(0,0,param1,param2,0,[_loc8_,_loc11_.themeColDrk1],1,_loc12_ ? horizontalGradientMatrix(0,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc17_,_loc18_,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,param2 - 1,0,[16777215,16777215],_loc7_,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 1));
               break;
            case "upArrowDownSkin":
               if(!_loc12_)
               {
                  drawRoundRect(1,param2 - 4,param1 - 2,8,0,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],_loc12_ ? horizontalGradientMatrix(1,param2 - 4,param1 - 2,8) : verticalGradientMatrix(1,param2 - 4,param1 - 2,8),GradientType.LINEAR,null,{
                     "x":1,
                     "y":param2 - 4,
                     "w":param1 - 2,
                     "h":4,
                     "r":0
                  });
               }
            case "downArrowDownSkin":
               drawRoundRect(0,0,param1,param2,0,[_loc8_,_loc11_.themeColDrk1],1,_loc12_ ? horizontalGradientMatrix(0,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,[_loc11_.fillColorPress1,_loc11_.fillColorPress2],1,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 2));
               drawRoundRect(1,1,param1 - 2,param2 - 1,0,[16777215,16777215],_loc7_,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 1));
               break;
            case "upArrowDisabledSkin":
               if(true)
               {
                  if(!_loc12_)
                  {
                     drawRoundRect(1,param2 - 4,param1 - 2,8,0,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[0.5,0],verticalGradientMatrix(1,param2 - 4,param1 - 2,8),GradientType.LINEAR,null,{
                        "x":1,
                        "y":param2 - 4,
                        "w":param1 - 2,
                        "h":4,
                        "r":0
                     });
                  }
               }
            case "downArrowDisabledSkin":
               if(true)
               {
                  _loc19_ = [_loc6_[0],_loc6_[1]];
                  _loc20_ = [_loc5_[0] - 0.15,_loc5_[1] - 0.15];
                  drawRoundRect(0,0,param1,param2,0,_loc13_,0.5,_loc12_ ? horizontalGradientMatrix(0,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                     "x":1,
                     "y":1,
                     "w":param1 - 2,
                     "h":param2 - 2,
                     "r":0
                  });
                  drawRoundRect(1,1,param1 - 2,param2 - 2,0,_loc19_,_loc20_,_loc12_ ? horizontalGradientMatrix(0,0,param1 - 2,param2 - 2) : verticalGradientMatrix(0,0,param1 - 2,param2 - 1));
                  _loc10_ = getStyle("disabledIconColor");
                  break;
               }
               drawRoundRect(0,0,param1,param2,0,16777215,0);
               return;
               break;
            default:
               drawRoundRect(0,0,param1,param2,0,16777215,0);
               return;
         }
         _loc14_.beginFill(_loc10_);
         if(_loc9_)
         {
            _loc14_.moveTo(param1 / 2,6);
            _loc14_.lineTo(param1 - 5,param2 - 6);
            _loc14_.lineTo(5,param2 - 6);
            _loc14_.lineTo(param1 / 2,6);
         }
         else
         {
            _loc14_.moveTo(param1 / 2,param2 - 6);
            _loc14_.lineTo(param1 - 5,6);
            _loc14_.lineTo(5,6);
            _loc14_.lineTo(param1 / 2,param2 - 6);
         }
         _loc14_.endFill();
      }
   }
}
