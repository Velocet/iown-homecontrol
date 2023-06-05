package
{
   import mx.resources.ResourceBundle;
   
   public class fr_FR$controls_properties extends ResourceBundle
   {
       
      
      public function fr_FR$controls_properties()
      {
         super("fr_FR","controls");
      }
      
      override protected function getContent() : Object
      {
         return {
            "noLabel":"Non",
            "dayNamesShortest":"D,L,M,M,J,V,S",
            "missingAttributeSrc":"URL : {0}. La balise {1} requiert la source de l\'attribut.",
            "unknownInput":"Type d\'entrée {0} inconnu.",
            "tagNotFound":"URL : {0}. Au moins une vidéo de balise ref est requise.",
            "badArgs":"Arguments erronés pour _play.",
            "undefinedArray":"cuePoint.array non défini.",
            "wrongDisabled":"Le paramètre disabled (désactivé) doit être un nombre.",
            "wrongTimeName":"L\'heure doit être un nombre et/ou le nom ne doit pas être non défini ou nul.",
            "wrongIndex":"CuePoint.index doit correspondre à une valeur comprise entre -1 et cuePoint.array.length.",
            "nullURL":"Un URL nul a été envoyé à VideoPlayer.load.",
            "yesLabel":"Oui",
            "wrongFormat":"Format inattendu du paramètre cuePoint.",
            "incorrectType":"Le type doit correspondre à 0, 1 ou 2.",
            "requiredField":"Champ obligatoire",
            "unexpectedEnd":"Fin inattendue de la chaîne du paramètre cuePoint.",
            "wrongNumParams":"Les paramètres numériques doivent correspondre à des nombres.",
            "invalidCall":"Impossible d\'appeler la reconnexion pour une connexion HTTP.",
            "cancelLabel":"Annuler",
            "errWrongType":"ERREUR: le fournisseur de données (dataProvider) de {0} doit correspondre au type String, ViewStack, Array ou IList.",
            "notfpad":"URL : {0}. Noeud racine différent de fpad.",
            "wrongTime":"Le paramètre time (heure) doit être un nombre.",
            "errWrongContainer":"ERREUR : le fournisseur de données (dataProvider) de {0} ne doit pas contenir d\'objets de type flash.display.DisplayObject.",
            "label":"%3%% EN COURS DE CHARGEMENT",
            "unsupportedMode":"IMEMode : {0} non pris en charge.",
            "notImplemented":"{0} non encore implémenté.",
            "errorMessages":"Impossible d\'établir une connexion avec le serveur ou d\'identifier FLV sur le serveur.,Aucun point de repère approprié trouvé.,Point de repère incorrect.,Recherche incorrecte.,Chemin d\'accès au contenu incorrect.,XML incorrect.,Aucune correspondance de vitesse en bits ; ne doit pas correspondre au paramètre FLV par défaut.,Impossible de supprimer le lecteur vidéo par défaut.",
            "missingRoot":"URL : {0}. Aucun noeud racine n\'a été trouvé. Si l\'URL se rapporte à un fichier au format FLV, il doit porter une extension .flv et être dépourvu de paramètre.",
            "notLoadable":"Impossible de charger {0}.",
            "missingAttributes":"URL : {0}. La balise {1} requiert les attributs d\'ID, de largeur et de hauteur. Ces deux derniers doivent être des valeurs numériques supérieures ou égales à 0.",
            "rootNotSMIL":"URL : {0}. Noeud racine différent de SMIL : \'{1}\'.",
            "wrongType":"Le paramètre type doit être un nombre.",
            "firstDayOfWeek":"0",
            "wrongName":"Le nom ne peut pas être non défini ou nul.",
            "undefinedParameter":"Paramètre cuePoint non défini.",
            "yearSymbol":"",
            "cannotDisable":"Impossible de désactiver les points de repère ActionScript.",
            "missingProxy":"URL : {0}. XML fpad requiert une balise proxy.",
            "okLabel":"OK",
            "rootNotFound":"URL : {0}. Aucun noeud racine n\'a été trouvé ; s\'il s\'agit d\'un fichier au format FLV, il doit porter une extension .flv."
         };
      }
   }
}
