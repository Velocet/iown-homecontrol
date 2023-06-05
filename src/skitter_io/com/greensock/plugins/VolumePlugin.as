package com.greensock.plugins
{
   import com.greensock.*;
   import flash.display.*;
   import flash.media.SoundTransform;
   
   public class VolumePlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      protected var _target:Object;
      
      protected var _st:SoundTransform;
      
      public function VolumePlugin()
      {
         super();
         this.propName = "volume";
         this.overwriteProps = ["volume"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         if(isNaN(param2) || !param1.hasOwnProperty("soundTransform"))
         {
            return false;
         }
         _target = param1;
         _st = _target.soundTransform;
         addTween(_st,"volume",_st.volume,param2,"volume");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         updateTweens(param1);
         _target.soundTransform = _st;
      }
   }
}
