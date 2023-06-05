package com.greensock.plugins
{
   import com.greensock.*;
   import flash.display.*;
   import flash.filters.*;
   
   public class BevelFilterPlugin extends FilterPlugin
   {
      
      public static const API:Number = 1;
      
      private static var _propNames:Array = ["distance","angle","highlightColor","highlightAlpha","shadowColor","shadowAlpha","blurX","blurY","strength","quality"];
       
      
      public function BevelFilterPlugin()
      {
         super();
         this.propName = "bevelFilter";
         this.overwriteProps = ["bevelFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         _target = param1;
         _type = BevelFilter;
         initFilter(param2,new BevelFilter(0,0,16777215,0.5,0,0.5,2,2,0,int(param2.quality) || true),_propNames);
         return true;
      }
   }
}
