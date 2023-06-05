package
{
   import mx.resources.ResourceBundle;
   
   public class fr_FR$core_properties extends ResourceBundle
   {
       
      
      public function fr_FR$core_properties()
      {
         super("fr_FR","core");
      }
      
      override protected function getContent() : Object
      {
         return {
            "notImplementedInFTETextField":"{0}\' n\'est pas implémenté dans FTETextField.",
            "badIndex":"L\'index fourni est hors limites.",
            "stateUndefined":"Etat {0} non défini.",
            "versionAlreadyRead":"La version de compatibilité a déjà été identifiée.",
            "nullParameter":"Le paramètre {0} ne peut pas être nul.",
            "multipleChildSets_ClassAndSubclass":"Plusieurs jeux d\'enfants visuels ont été spécifiés pour ce composant (définition des composants de base et dérivé).",
            "fontIncompatible":"avertissement : la police incorporée \'{0}\' spécifiée pour {1} n\'est pas compatible. Ce composant requiert que la police incorporée soit déclarée avec embedAsCff={2}.",
            "badFile":"Le fichier n\'existe pas.",
            "badParameter":"Le paramètre {0} doit contenir une valeur acceptée.",
            "notExecuting":"Le répéteur ne s\'exécute pas.",
            "multipleChildSets_ClassAndInstance":"Plusieurs jeux d\'enfants visuels ont été spécifiés pour ce composant (définition et instance du composant).",
            "unsupportedTypeInFTETextField":"FTETextField ne prend pas en charge la définition du type sur \"input\".",
            "truncationIndicator":"...",
            "versionAlreadySet":"La version de compatibilité a déjà été définie.",
            "viewSource":"Afficher la source"
         };
      }
   }
}
