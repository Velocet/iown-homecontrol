package mx.controls.scrollClasses
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import mx.controls.Button;
   import mx.core.mx_internal;
   import mx.events.ScrollEventDetail;
   
   public class ScrollThumb extends Button
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var lastY:Number;
      
      private var datamin:Number;
      
      private var ymax:Number;
      
      private var ymin:Number;
      
      private var datamax:Number;
      
      public function ScrollThumb()
      {
         super();
         explicitMinHeight = 10;
         stickyHighlighting = true;
      }
      
      private function stopDragThumb() : void
      {
         var _loc1_:ScrollBar = ScrollBar(parent);
         _loc1_.mx_internal::isScrolling = false;
         _loc1_.mx_internal::dispatchScrollEvent(_loc1_.mx_internal::oldPosition,ScrollEventDetail.THUMB_POSITION);
         _loc1_.mx_internal::oldPosition = NaN;
         systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
      }
      
      override protected function mouseDownHandler(param1:MouseEvent) : void
      {
         super.mouseDownHandler(param1);
         var _loc2_:ScrollBar = ScrollBar(parent);
         _loc2_.mx_internal::oldPosition = _loc2_.scrollPosition;
         lastY = param1.localY;
         systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler,true);
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         if(ymin == ymax)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         _loc2_ = globalToLocal(_loc2_);
         var _loc3_:Number = _loc2_.y - lastY;
         _loc3_ += y;
         if(_loc3_ < ymin)
         {
            _loc3_ = ymin;
         }
         else if(_loc3_ > ymax)
         {
            _loc3_ = ymax;
         }
         var _loc4_:ScrollBar;
         (_loc4_ = ScrollBar(parent)).mx_internal::isScrolling = true;
         mx_internal::$y = _loc3_;
         var _loc5_:Number = _loc4_.scrollPosition;
         var _loc6_:Number = Math.round((datamax - datamin) * (y - ymin) / (ymax - ymin)) + datamin;
         _loc4_.scrollPosition = _loc6_;
         _loc4_.mx_internal::dispatchScrollEvent(_loc5_,ScrollEventDetail.THUMB_TRACK);
         param1.updateAfterEvent();
      }
      
      override mx_internal function buttonReleased() : void
      {
         super.mx_internal::buttonReleased();
         stopDragThumb();
      }
      
      mx_internal function setRange(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.ymin = param1;
         this.ymax = param2;
         this.datamin = param3;
         this.datamax = param4;
      }
   }
}
