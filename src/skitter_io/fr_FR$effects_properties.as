package
{
   import mx.resources.ResourceBundle;
   
   public class fr_FR$effects_properties extends ResourceBundle
   {
       
      
      public function fr_FR$effects_properties()
      {
         super("fr_FR","effects");
      }
      
      override protected function getContent() : Object
      {
         return {
            "incorrectSource":"La propriété source doit correspondre à une classe ou une chaîne.",
            "incorrectTrigger":"Impossible de déclencher l\'effet de zoom à l\'aide d\'un déclencheur moveEffect."
         };
      }
   }
}
