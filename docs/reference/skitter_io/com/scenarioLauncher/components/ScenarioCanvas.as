package com.scenarioLauncher.components
{
   import com.scenarioLauncher.views.common.CustomCanvas;
   import flash.display.Sprite;
   import flash.geom.Point;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class ScenarioCanvas extends CustomCanvas
   {
       
      
      private var _arrow:Sprite;
      
      private var _arrowPosition:Point;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ScenarioCanvas()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({"type":CustomCanvas});
         super();
         mx_internal::_document = this;
         this.useCustomCanvasSkin = true;
      }
      
      public function set arrowPosition(param1:Point) : void
      {
         this._arrowPosition = param1;
      }
      
      private function drawArrow() : void
      {
         if(this._arrow == null)
         {
            this._arrow = new Sprite();
            this._arrow.graphics.clear();
            this._arrow.graphics.beginFill(16777215,1);
            this._arrow.graphics.lineTo(0,23);
            this._arrow.graphics.lineTo(14,23);
            this._arrow.graphics.lineTo(0,0);
            this._arrow.graphics.endFill();
            this._arrow.y = -23;
            this._arrow.x = -100;
         }
         this.rawChildren.addChild(this._arrow);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function get arrowPosition() : Point
      {
         return this._arrowPosition;
      }
      
      public function refresh() : void
      {
         this._arrow.x = this.globalToContent(new Point(this._arrowPosition.x,0)).x - 1;
         this._arrow.visible = this._arrow.x >= 100 && this._arrow.x <= 700;
      }
      
      override protected function onCreationComplete(param1:FlexEvent) : void
      {
         super.onCreationComplete(param1);
         this.drawArrow();
      }
   }
}
