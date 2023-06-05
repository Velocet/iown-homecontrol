package mx.skins.halo
{
   import flash.display.Graphics;
   import flash.filters.DropShadowFilter;
   import mx.core.EdgeMetrics;
   import mx.core.mx_internal;
   import mx.graphics.RectangularDropShadow;
   import mx.skins.RectangularBorder;
   
   public class ToolTipBorder extends RectangularBorder
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _borderMetrics:EdgeMetrics;
      
      private var dropShadow:RectangularDropShadow;
      
      public function ToolTipBorder()
      {
         super();
      }
      
      override public function get borderMetrics() : EdgeMetrics
      {
         if(_borderMetrics)
         {
            return _borderMetrics;
         }
         var _loc1_:String = getStyle("borderStyle");
         switch(_loc1_)
         {
            case "errorTipRight":
               _borderMetrics = new EdgeMetrics(15,1,3,3);
               break;
            case "errorTipAbove":
               _borderMetrics = new EdgeMetrics(3,1,3,15);
               break;
            case "errorTipBelow":
               _borderMetrics = new EdgeMetrics(3,13,3,3);
               break;
            default:
               _borderMetrics = new EdgeMetrics(3,1,3,3);
         }
         return _borderMetrics;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:String = getStyle("borderStyle");
         var _loc4_:uint = getStyle("backgroundColor");
         var _loc5_:Number = getStyle("backgroundAlpha");
         var _loc6_:uint = getStyle("borderColor");
         var _loc7_:Number = getStyle("cornerRadius");
         var _loc8_:uint = getStyle("shadowColor");
         var _loc9_:Number = 0.1;
         var _loc10_:Graphics;
         (_loc10_ = graphics).clear();
         filters = [];
         switch(_loc3_)
         {
            case "none":
               break;
            case "errorTipRight":
               drawRoundRect(11,0,param1 - 11,param2 - 2,3,_loc6_,_loc5_);
               _loc10_.beginFill(_loc6_,_loc5_);
               _loc10_.moveTo(11,7);
               _loc10_.lineTo(0,13);
               _loc10_.lineTo(11,19);
               _loc10_.moveTo(11,7);
               _loc10_.endFill();
               filters = [new DropShadowFilter(2,90,0,0.4)];
               break;
            case "errorTipAbove":
               drawRoundRect(0,0,param1,param2 - 13,3,_loc6_,_loc5_);
               _loc10_.beginFill(_loc6_,_loc5_);
               _loc10_.moveTo(9,param2 - 13);
               _loc10_.lineTo(15,param2 - 2);
               _loc10_.lineTo(21,param2 - 13);
               _loc10_.moveTo(9,param2 - 13);
               _loc10_.endFill();
               filters = [new DropShadowFilter(2,90,0,0.4)];
               break;
            case "errorTipBelow":
               drawRoundRect(0,11,param1,param2 - 13,3,_loc6_,_loc5_);
               _loc10_.beginFill(_loc6_,_loc5_);
               _loc10_.moveTo(9,11);
               _loc10_.lineTo(15,0);
               _loc10_.lineTo(21,11);
               _loc10_.moveTo(10,11);
               _loc10_.endFill();
               filters = [new DropShadowFilter(2,90,0,0.4)];
               break;
            default:
               drawRoundRect(3,1,param1 - 6,param2 - 4,_loc7_,_loc4_,_loc5_);
               if(!dropShadow)
               {
                  dropShadow = new RectangularDropShadow();
               }
               dropShadow.distance = 3;
               dropShadow.angle = 90;
               dropShadow.color = 0;
               dropShadow.alpha = 0.4;
               dropShadow.tlRadius = _loc7_ + 2;
               dropShadow.trRadius = _loc7_ + 2;
               dropShadow.blRadius = _loc7_ + 2;
               dropShadow.brRadius = _loc7_ + 2;
               dropShadow.drawShadow(graphics,3,0,param1 - 6,param2 - 4);
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         if(param1 == "borderStyle" || param1 == "styleName" || param1 == null)
         {
            _borderMetrics = null;
         }
         invalidateDisplayList();
      }
   }
}
