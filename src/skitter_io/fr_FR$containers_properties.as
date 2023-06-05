package
{
   import mx.resources.ResourceBundle;
   
   public class fr_FR$containers_properties extends ResourceBundle
   {
       
      
      public function fr_FR$containers_properties()
      {
         super("fr_FR","containers");
      }
      
      override protected function getContent() : Object
      {
         return {
            "noRowsFound":"Aucun attribut ConstraintRow n\'a été trouvé.",
            "noColumnsFound":"Aucun attribut ConstraintColumn n\'a été trouvé.",
            "rowNotFound":"Attribut ConstraintRow {0} introuvable.",
            "columnNotFound":"Attribut ConstraintColumn {0} introuvable."
         };
      }
   }
}
