package com.scenarioLauncher.views.common
{
   import com.scenarioLauncher.utils.GB;
   import com.scenarioLauncher.views.common.skins.CustomCanvasSkin;
   import mx.containers.Canvas;
   import mx.core.ScrollPolicy;
   import mx.events.FlexEvent;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class CustomCanvas extends Canvas
   {
      
      public static const CORNER_RADIUS_TOP_RIGHT_STYLE:String = "cornerRadiusTR";
      
      private static const BORDER_COLOR_BOTTOM_DEFAULT:uint = 0;
      
      private static const CORNER_RADIUS_BOTTOM_RIGHT_DEFAULT:uint = 0;
      
      public static const CORNER_RADIUS_TOP_LEFT_STYLE:String = "cornerRadiusTL";
      
      public static const BORDER_COLOR_LEFT_STYLE:String = "borderColorLeft";
      
      private static const CORNER_RADIUS_BOTTOM_LEFT_DEFAULT:uint = 0;
      
      private static const BORDER_COLOR_TOP_DEFAULT:uint = 0;
      
      private static const CORNER_RADIUS_TOP_RIGHT_DEFAULT:uint = 0;
      
      private static const CORNER_RADIUS_TOP_LEFT_DEFAULT:uint = 0;
      
      public static const CORNER_RADIUS_BOTTOM_RIGHT_STYLE:String = "cornerRadiusBR";
      
      private static var classConstructed:Boolean = classConstruct();
      
      private static const BORDER_COLOR_LEFT_DEFAULT:uint = 0;
      
      private static const BORDER_COLOR_RIGHT_DEFAULT:uint = 0;
      
      public static const CORNER_RADIUS_BOTTOM_LEFT_STYLE:String = "cornerRadiusBL";
      
      public static const BORDER_COLOR_BOTTOM_STYLE:String = "borderColorBottom";
      
      private static const COMPONENT_NAME:String = "KCCustomCanvas";
      
      public static const BORDER_COLOR_TOP_STYLE:String = "borderColorTop";
      
      public static const BORDER_COLOR_RIGHT_STYLE:String = "borderColorRight";
       
      
      protected var _ready:Boolean = false;
      
      private var _useCustomCanvasSkin:Boolean = false;
      
      protected var _init:Boolean = false;
      
      public function CustomCanvas()
      {
         super();
         this.cacheAsBitmap = false;
         addEventListener(FlexEvent.INITIALIZE,this.onInitialize,false,0,true);
         addEventListener(FlexEvent.CREATION_COMPLETE,this.onCreationComplete,false,0,true);
      }
      
      private static function classConstruct() : Boolean
      {
         var aStyle:CSSStyleDeclaration = StyleManager.getStyleDeclaration(COMPONENT_NAME);
         if(aStyle)
         {
            if(aStyle.getStyle(CORNER_RADIUS_TOP_LEFT_STYLE) == undefined)
            {
               aStyle.setStyle(CORNER_RADIUS_TOP_LEFT_STYLE,CORNER_RADIUS_TOP_LEFT_DEFAULT);
            }
            if(aStyle.getStyle(CORNER_RADIUS_TOP_RIGHT_STYLE) == undefined)
            {
               aStyle.setStyle(CORNER_RADIUS_TOP_RIGHT_STYLE,CORNER_RADIUS_TOP_RIGHT_DEFAULT);
            }
            if(aStyle.getStyle(CORNER_RADIUS_BOTTOM_LEFT_STYLE) == undefined)
            {
               aStyle.setStyle(CORNER_RADIUS_BOTTOM_LEFT_STYLE,CORNER_RADIUS_BOTTOM_LEFT_DEFAULT);
            }
            if(aStyle.getStyle(CORNER_RADIUS_BOTTOM_RIGHT_STYLE) == undefined)
            {
               aStyle.setStyle(CORNER_RADIUS_BOTTOM_RIGHT_STYLE,CORNER_RADIUS_BOTTOM_RIGHT_DEFAULT);
            }
            if(aStyle.getStyle(BORDER_COLOR_TOP_STYLE) == undefined)
            {
               aStyle.setStyle(BORDER_COLOR_TOP_STYLE,BORDER_COLOR_TOP_DEFAULT);
            }
            if(aStyle.getStyle(BORDER_COLOR_RIGHT_STYLE) == undefined)
            {
               aStyle.setStyle(BORDER_COLOR_RIGHT_STYLE,BORDER_COLOR_RIGHT_DEFAULT);
            }
            if(aStyle.getStyle(BORDER_COLOR_BOTTOM_STYLE) == undefined)
            {
               aStyle.setStyle(BORDER_COLOR_BOTTOM_STYLE,BORDER_COLOR_BOTTOM_DEFAULT);
            }
            if(aStyle.getStyle(BORDER_COLOR_LEFT_STYLE) == undefined)
            {
               aStyle.setStyle(BORDER_COLOR_LEFT_STYLE,BORDER_COLOR_LEFT_DEFAULT);
            }
         }
         else
         {
            aStyle = new CSSStyleDeclaration();
            aStyle.defaultFactory = function():void
            {
               this[CORNER_RADIUS_TOP_LEFT_STYLE] = CORNER_RADIUS_TOP_LEFT_DEFAULT;
               this[CORNER_RADIUS_TOP_RIGHT_STYLE] = CORNER_RADIUS_TOP_RIGHT_DEFAULT;
               this[CORNER_RADIUS_BOTTOM_LEFT_STYLE] = CORNER_RADIUS_BOTTOM_LEFT_DEFAULT;
               this[CORNER_RADIUS_BOTTOM_RIGHT_STYLE] = CORNER_RADIUS_BOTTOM_RIGHT_DEFAULT;
               this[BORDER_COLOR_TOP_STYLE] = BORDER_COLOR_TOP_DEFAULT;
               this[BORDER_COLOR_RIGHT_STYLE] = BORDER_COLOR_RIGHT_DEFAULT;
               this[BORDER_COLOR_BOTTOM_STYLE] = BORDER_COLOR_BOTTOM_DEFAULT;
               this[BORDER_COLOR_LEFT_STYLE] = BORDER_COLOR_LEFT_DEFAULT;
            };
            StyleManager.setStyleDeclaration(COMPONENT_NAME,aStyle,true);
         }
         return true;
      }
      
      protected function initUIOnce() : void
      {
         if(!this._init)
         {
            this._init = true;
            this.horizontalScrollPolicy = ScrollPolicy.OFF;
            this.verticalScrollPolicy = ScrollPolicy.OFF;
         }
      }
      
      protected function onInitialize(param1:FlexEvent) : void
      {
      }
      
      protected function initUI() : void
      {
      }
      
      public function get useCustomCanvasSkin() : Boolean
      {
         return this._useCustomCanvasSkin;
      }
      
      protected function refreshUI() : void
      {
         GB.triggerGC();
      }
      
      override protected function resourcesChanged() : void
      {
         if(this._ready)
         {
            this.initLabels();
         }
      }
      
      protected function initLabels() : void
      {
      }
      
      protected function onCreationComplete(param1:FlexEvent) : void
      {
         this._ready = true;
         this.initUIOnce();
         this.initLabels();
         this.initUI();
         this.refreshUI();
      }
      
      public function set useCustomCanvasSkin(param1:Boolean) : void
      {
         this._useCustomCanvasSkin = param1;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         if(this._useCustomCanvasSkin)
         {
            this.setStyle("borderSkin",CustomCanvasSkin);
            this.setStyle("cornerRadiusTL",getStyle(CORNER_RADIUS_TOP_LEFT_STYLE));
            this.setStyle("cornerRadiusTR",getStyle(CORNER_RADIUS_TOP_RIGHT_STYLE));
            this.setStyle("cornerRadiusBL",getStyle(CORNER_RADIUS_BOTTOM_LEFT_STYLE));
            this.setStyle("cornerRadiusBR",getStyle(CORNER_RADIUS_BOTTOM_RIGHT_STYLE));
            this.setStyle("borderTop",getStyle(BORDER_COLOR_TOP_STYLE));
            this.setStyle("borderRight",getStyle(BORDER_COLOR_RIGHT_STYLE));
            this.setStyle("borderBottom",getStyle(BORDER_COLOR_BOTTOM_STYLE));
            this.setStyle("borderLeft",getStyle(BORDER_COLOR_LEFT_STYLE));
         }
      }
   }
}
