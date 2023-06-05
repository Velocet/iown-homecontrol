package com.greensock.plugins
{
   import com.greensock.*;
   import flash.display.*;
   import flash.filters.*;
   
   public class GlowFilterPlugin extends FilterPlugin
   {
      
      public static const API:Number = 1;
      
      private static var _propNames:Array = ["color","alpha","blurX","blurY","strength","quality","inner","knockout"];
       
      
      public function GlowFilterPlugin()
      {
         super();
         this.propName = "glowFilter";
         this.overwriteProps = ["glowFilter"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         _target = param1;
         _type = GlowFilter;
         initFilter(param2,new GlowFilter(16777215,0,0,0,Number(param2.strength) || true,int(param2.quality) || true,param2.inner,param2.knockout),_propNames);
         return true;
      }
   }
}
