package org.efflex.mx.viewStackEffects.effectClasses
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import mx.core.UIComponent;
   import org.efflex.mx.viewStackEffects.List;
   
   public class ListInstance extends ViewStackTweenEffectInstance
   {
       
      
      public var scaleDurationByChange:Boolean;
      
      public var direction:String;
      
      public function ListInstance(param1:UIComponent)
      {
         super(param1);
      }
      
      override protected function playViewStackEffect() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         super.playViewStackEffect();
         switch(direction)
         {
            case List.HORIZONTAL:
               if(!wasInterrupted)
               {
                  display.x = -(selectedIndexFrom * contentWidth);
               }
               _loc1_ = -(contentWidth * selectedIndexTo);
               _loc2_ = 0;
               _loc4_ = contentWidth;
               _loc3_ = Math.abs(0 - _loc1_);
               break;
            case List.VERTICAL:
               if(!wasInterrupted)
               {
                  display.y = -(selectedIndexFrom * contentHeight);
               }
               _loc1_ = 0;
               _loc2_ = -(contentHeight * selectedIndexTo);
               _loc4_ = contentHeight;
               _loc3_ = Math.abs(0 - _loc2_);
         }
         createList();
         var _loc5_:Number = scaleDurationByChange ? duration * (_loc3_ / _loc4_) : duration;
         tween = createTween(this,new Array(display.x,display.y),new Array(_loc1_,_loc2_),_loc5_);
      }
      
      private function createList() : void
      {
         var _loc1_:Bitmap = null;
         var _loc3_:BitmapData = null;
         var _loc2_:Number = 0;
         var _loc4_:Number = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = bitmapDatum[_loc4_] as BitmapData;
            if(_loc3_)
            {
               _loc1_ = new Bitmap(_loc3_);
               if(direction == List.HORIZONTAL)
               {
                  _loc1_.x = contentWidth * _loc4_;
               }
               if(direction == List.VERTICAL)
               {
                  _loc1_.y = contentHeight * _loc4_;
               }
               display.addChild(_loc1_);
            }
            _loc4_++;
         }
      }
      
      override protected function setIndicesRequired() : void
      {
         var _loc1_:int = Math.min(selectedIndexFrom,selectedIndexTo);
         var _loc2_:int = Math.max(selectedIndexFrom,selectedIndexTo);
         var _loc3_:Array = new Array();
         var _loc4_:int = _loc1_;
         while(_loc4_ <= _loc2_)
         {
            addRequiredIndex(_loc4_);
            _loc4_++;
         }
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         super.onTweenUpdate(param1);
         display.x = Number(param1[0]);
         display.y = Number(param1[1]);
      }
   }
}
