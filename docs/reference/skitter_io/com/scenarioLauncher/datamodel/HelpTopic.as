package com.scenarioLauncher.datamodel
{
   import mx.collections.ArrayCollection;
   
   public class HelpTopic
   {
       
      
      public var title:String = "";
      
      public var questions:ArrayCollection;
      
      public function HelpTopic()
      {
         this.questions = new ArrayCollection();
         super();
      }
   }
}
