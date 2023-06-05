package mx.skins.halo
{
   import flash.display.GradientType;
   import flash.geom.Matrix;
   import mx.core.mx_internal;
   import mx.skins.Border;
   import mx.styles.StyleManager;
   import mx.utils.ColorUtil;
   
   public class ScrollThumbSkin extends Border
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var cache:Object = {};
       
      
      public function ScrollThumbSkin()
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
            _loc6_.borderColorDrk1 = ColorUtil.adjustBrightness2(param2,-50);
         }
         return cache[_loc5_];
      }
      
      override public function get measuredWidth() : Number
      {
         return 16;
      }
      
      override public function get measuredHeight() : Number
      {
         return 10;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("backgroundColor");
         var _loc4_:uint = getStyle("borderColor");
         var _loc5_:Number = getStyle("cornerRadius");
         var _loc6_:Array = getStyle("fillAlphas");
         var _loc7_:Array = getStyle("fillColors");
         StyleManager.getColorNames(_loc7_);
         var _loc8_:Array = getStyle("highlightAlphas");
         var _loc9_:uint = getStyle("themeColor");
         var _loc10_:Number = 7305079;
         var _loc11_:Object = calcDerivedStyles(_loc9_,_loc4_,_loc7_[0],_loc7_[1]);
         var _loc12_:Number = Math.max(_loc5_ - 1,0);
         var _loc13_:Object = {
            "tl":0,
            "tr":_loc12_,
            "bl":0,
            "br":_loc12_
         };
         _loc12_ = Math.max(_loc12_ - 1,0);
         var _loc14_:Object = {
            "tl":0,
            "tr":_loc12_,
            "bl":0,
            "br":_loc12_
         };
         var _loc15_:Boolean = Boolean(parent) && false && parent.parent.rotation != 0;
         if(isNaN(_loc3_))
         {
            _loc3_ = 16777215;
         }
         graphics.clear();
         drawRoundRect(1,0,param1 - 3,param2,_loc13_,_loc3_,1);
         switch(name)
         {
            case "thumbUpSkin":
            default:
               _loc17_ = [_loc7_[0],_loc7_[1]];
               _loc18_ = [_loc6_[0],_loc6_[1]];
               drawRoundRect(0,0,param1,param2,0,16777215,0);
               if(_loc15_)
               {
                  drawRoundRect(1,0,param1 - 2,param2,_loc5_,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],horizontalGradientMatrix(2,0,param1,param2),GradientType.LINEAR,null,{
                     "x":1,
                     "y":1,
                     "w":param1 - 4,
                     "h":param2 - 2,
                     "r":_loc14_
                  });
               }
               else
               {
                  drawRoundRect(1,param2 - _loc12_,param1 - 3,_loc12_ + 4,{
                     "tl":0,
                     "tr":0,
                     "bl":0,
                     "br":_loc12_
                  },[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],_loc15_ ? horizontalGradientMatrix(0,param2 - 4,param1 - 3,8) : verticalGradientMatrix(0,param2 - 4,param1 - 3,8),GradientType.LINEAR,null,{
                     "x":1,
                     "y":param2 - _loc12_,
                     "w":param1 - 4,
                     "h":_loc12_,
                     "r":{
                        "tl":0,
                        "tr":0,
                        "bl":0,
                        "br":_loc12_ - 1
                     }
                  });
               }
               drawRoundRect(1,0,param1 - 3,param2,_loc13_,[_loc4_,_loc11_.borderColorDrk1],1,_loc15_ ? horizontalGradientMatrix(0,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 4,
                  "h":param2 - 2,
                  "r":_loc14_
               });
               drawRoundRect(1,1,param1 - 4,param2 - 2,_loc14_,_loc17_,_loc18_,_loc15_ ? horizontalGradientMatrix(1,0,param1 - 2,param2 - 2) : verticalGradientMatrix(1,0,param1 - 2,param2 - 2));
               if(_loc15_)
               {
                  drawRoundRect(1,0,(param1 - 4) / 2,param2 - 2,0,[16777215,16777215],_loc8_,horizontalGradientMatrix(1,1,param1 - 4,(param2 - 2) / 2));
               }
               else
               {
                  drawRoundRect(1,1,param1 - 4,(param2 - 2) / 2,_loc14_,[16777215,16777215],_loc8_,_loc15_ ? horizontalGradientMatrix(1,0,(param1 - 4) / 2,param2 - 2) : verticalGradientMatrix(1,1,param1 - 4,(param2 - 2) / 2));
               }
               break;
            case "thumbOverSkin":
               if(_loc7_.length > 2)
               {
                  _loc19_ = [_loc7_[2],_loc7_[3]];
               }
               else
               {
                  _loc19_ = [_loc7_[0],_loc7_[1]];
               }
               if(_loc6_.length > 2)
               {
                  _loc20_ = [_loc6_[2],_loc6_[3]];
               }
               else
               {
                  _loc20_ = [_loc6_[0],_loc6_[1]];
               }
               drawRoundRect(0,0,param1,param2,0,16777215,0);
               if(_loc15_)
               {
                  drawRoundRect(1,0,param1 - 2,param2,_loc5_,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],horizontalGradientMatrix(2,0,param1,param2),GradientType.LINEAR,null,{
                     "x":1,
                     "y":1,
                     "w":param1 - 4,
                     "h":param2 - 2,
                     "r":_loc14_
                  });
               }
               else
               {
                  drawRoundRect(1,param2 - _loc12_,param1 - 3,_loc12_ + 4,{
                     "tl":0,
                     "tr":0,
                     "bl":0,
                     "br":_loc12_
                  },[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],_loc15_ ? horizontalGradientMatrix(0,param2 - 4,param1 - 3,8) : verticalGradientMatrix(0,param2 - 4,param1 - 3,8),GradientType.LINEAR,null,{
                     "x":1,
                     "y":param2 - _loc12_,
                     "w":param1 - 4,
                     "h":_loc12_,
                     "r":{
                        "tl":0,
                        "tr":0,
                        "bl":0,
                        "br":_loc12_ - 1
                     }
                  });
               }
               drawRoundRect(1,0,param1 - 3,param2,_loc13_,[_loc9_,_loc11_.themeColDrk1],1,_loc15_ ? horizontalGradientMatrix(1,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 4,
                  "h":param2 - 2,
                  "r":_loc14_
               });
               drawRoundRect(1,1,param1 - 4,param2 - 2,_loc14_,_loc19_,_loc20_,_loc15_ ? horizontalGradientMatrix(1,0,param1,param2) : verticalGradientMatrix(1,0,param1,param2));
               break;
            case "thumbDownSkin":
               if(_loc15_)
               {
                  drawRoundRect(1,0,param1 - 2,param2,_loc13_,[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],horizontalGradientMatrix(2,0,param1,param2),GradientType.LINEAR,null,{
                     "x":1,
                     "y":1,
                     "w":param1 - 4,
                     "h":param2 - 2,
                     "r":_loc14_
                  });
               }
               else
               {
                  drawRoundRect(1,param2 - _loc12_,param1 - 3,_loc12_ + 4,{
                     "tl":0,
                     "tr":0,
                     "bl":0,
                     "br":_loc12_
                  },[_loc11_.borderColorDrk1,_loc11_.borderColorDrk1],[1,0],_loc15_ ? horizontalGradientMatrix(0,param2 - 4,param1 - 3,8) : verticalGradientMatrix(0,param2 - 4,param1 - 3,8),GradientType.LINEAR,null,{
                     "x":1,
                     "y":param2 - _loc12_,
                     "w":param1 - 4,
                     "h":_loc12_,
                     "r":{
                        "tl":0,
                        "tr":0,
                        "bl":0,
                        "br":_loc12_ - 1
                     }
                  });
               }
               drawRoundRect(1,0,param1 - 3,param2,_loc13_,[_loc9_,_loc11_.themeColDrk2],1,_loc15_ ? horizontalGradientMatrix(1,0,param1,param2) : verticalGradientMatrix(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 4,
                  "h":param2 - 2,
                  "r":_loc14_
               });
               drawRoundRect(1,1,param1 - 4,param2 - 2,_loc14_,[_loc11_.fillColorPress1,_loc11_.fillColorPress2],1,_loc15_ ? horizontalGradientMatrix(1,0,param1,param2) : verticalGradientMatrix(1,0,param1,param2));
               break;
            case "thumbDisabledSkin":
               drawRoundRect(0,0,param1,param2,0,16777215,0);
               drawRoundRect(1,0,param1 - 3,param2,_loc13_,10066329,0.5);
               drawRoundRect(1,1,param1 - 4,param2 - 2,_loc14_,16777215,0.5);
         }
         var _loc16_:Number = Math.floor(param1 / 2 - 4);
         drawRoundRect(_loc16_,Math.floor(param2 / 2 - 4),5,1,0,0,0.4);
         drawRoundRect(_loc16_,Math.floor(param2 / 2 - 2),5,1,0,0,0.4);
         drawRoundRect(_loc16_,Math.floor(param2 / 2),5,1,0,0,0.4);
         drawRoundRect(_loc16_,Math.floor(param2 / 2 + 2),5,1,0,0,0.4);
         drawRoundRect(_loc16_,Math.floor(param2 / 2 + 4),5,1,0,0,0.4);
      }
   }
}
