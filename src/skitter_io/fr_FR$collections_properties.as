package
{
   import mx.resources.ResourceBundle;
   
   public class fr_FR$collections_properties extends ResourceBundle
   {
       
      
      public function fr_FR$collections_properties()
      {
         super("fr_FR","collections");
      }
      
      override protected function getContent() : Object
      {
         return {
            "findRestriction":"Les critères de recherche doivent contenir au moins une valeur de champ de tri.",
            "invalidInsert":"Insertion impossible lorsque la propriété active est beforeFirst.",
            "noComparator":"Impossible de déterminer le comparateur pour {0}.",
            "invalidType":"Type incorrect. Il doit s\'agir du type XML ou du type XMLList contenant un objet XML. ",
            "findCondition":"Les critères de recherche doivent contenir tous les champs de tri allant jusqu\'à {0}.",
            "noComparatorSortField":"Impossible de déterminer le comparateur pour la propriété SortField intitulée {0}.",
            "invalidIndex":"Index incorrect : {0}.",
            "itemNotFound":"Recherche impossible en l\'absence de tri de la vue.",
            "unknownMode":"Mode de recherche inconnu.",
            "bookmarkInvalid":"Le signet n\'est plus correct.",
            "noItems":"Aucun élément dans lequel effectuer la recherche.",
            "invalidRemove":"Suppression impossible lorsque la propriété active est beforeFirst ou afterLast.",
            "incorrectAddition":"Tentative d\'ajout d\'un élément déjà présent dans cette vue.",
            "unknownProperty":"Propriété inconnue : {0}.",
            "bookmarkNotFound":"Le signet ne provient pas de cette vue.",
            "invalidCursor":"Le curseur n\'est plus correct.",
            "outOfBounds":"L\'index {0} spécifié est hors limites.",
            "nonUnique":"Valeurs non uniques dans les éléments."
         };
      }
   }
}
