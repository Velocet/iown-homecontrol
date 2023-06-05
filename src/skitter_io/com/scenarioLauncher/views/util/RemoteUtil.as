package com.scenarioLauncher.views.util
{
   import ioService.datamodel.Skitter;
   
   public class RemoteUtil
   {
      
      public static const caseImagePurple:Class = RemoteUtil_caseImagePurple;
      
      public static const caseImageGreen:Class = RemoteUtil_caseImageGreen;
      
      public static const caseImageGrey:Class = RemoteUtil_caseImageGrey;
       
      
      public function RemoteUtil()
      {
         super();
      }
      
      public static function getImageCaseStyleName(param1:Skitter) : Class
      {
         var _loc2_:Class = null;
         switch(param1.RubberColour)
         {
            case Skitter.DEFAULT:
               _loc2_ = null;
               break;
            case Skitter.GREEN:
               _loc2_ = caseImageGreen;
               break;
            case Skitter.PURPLE:
               _loc2_ = caseImagePurple;
               break;
            case Skitter.GREY:
               _loc2_ = caseImageGrey;
         }
         return _loc2_;
      }
   }
}
