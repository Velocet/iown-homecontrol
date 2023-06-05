package com.greensock.plugins
{
   import com.greensock.*;
   import flash.display.*;
   
   public class RoundPropsPlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      public function RoundPropsPlugin()
      {
         super();
         this.propName = "roundProps";
         this.overwriteProps = [];
         this.round = true;
      }
      
      public function add(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         addTween(param1,param2,param3,param3 + param4,param2);
         this.overwriteProps[this.overwriteProps.length] = param2;
      }
   }
}
