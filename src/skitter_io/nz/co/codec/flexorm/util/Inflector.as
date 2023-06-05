package nz.co.codec.flexorm.util
{
   public class Inflector
   {
      
      private static var uncountable:Array = ["sheep","fish","deer","series","species","money","rice","information","equipment"];
      
      private static var irregular:Array = [["move","moves"],["foot","feet"],["goose","geese"],["sex","sexes"],["child","children"],["man","men"],["tooth","teeth"],["person","people"]];
      
      private static var plural:Array = [[/(quiz)$/i,"$1zes"],[/^(ox)$/i,"$1en"],[/([m|l])ouse$/i,"$1ice"],[/(matr|vert|ind)ix|ex$/i,"$1ices"],[/(x|ch|ss|sh)$/i,"$1es"],[/([^aeiouy]|qu)y$/i,"$1ies"],[/(hive)$/i,"$1s"],[/(?:([^f])fe|([lr])f)$/i,"$1$2ves"],[/(shea|lea|loa|thie)f$/i,"$1ves"],[/sis$/i,"ses"],[/([ti])um$/i,"$1a"],[/(tomat|potat|ech|her|vet)o$/i,"$1oes"],[/(bu)s$/i,"$1ses"],[/(alias|status)$/i,"$1es"],[/(octop)us$/i,"$1i"],[/(ax|test)is$/i,"$1es"],[/(us)$/i,"$1es"],[/s$/i,"s"],[/$/i,"s"]];
      
      private static var singular:Array = [[/(quiz)zes$/i,"$1"],[/(matr)ices$/i,"$1ix"],[/(vert|ind)ices$/i,"$1ex"],[/^(ox)en$/i,"$1"],[/(alias|status)es$/i,"$1"],[/(octop|vir)i$/i,"$1us"],[/(cris|ax|test)es$/i,"$1is"],[/(shoe)s$/i,"$1"],[/(o)es$/i,"$1"],[/(bus)es$/i,"$1"],[/([m|l])ice$/i,"$1ouse"],[/(x|ch|ss|sh)es$/i,"$1"],[/(m)ovies$/i,"$1ovie"],[/(s)eries$/i,"$1eries"],[/([^aeiouy]|qu)ies$/i,"$1y"],[/([lr])ves$/i,"$1f"],[/(tive)s$/i,"$1"],[/(hive)s$/i,"$1"],[/(li|wi|kni)ves$/i,"$1fe"],[/(shea|loa|lea|thie)ves$/i,"$1f"],[/(^analy)ses$/i,"$1sis"],[/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$/i,"$1$2sis"],[/([ti])a$/i,"$1um"],[/(n)ews$/i,"$1ews"],[/(h|bl)ouses$/i,"$1ouse"],[/(corpse)s$/i,"$1"],[/(us)es$/i,"$1"],[/s$/i,""]];
       
      
      public function Inflector()
      {
         super();
      }
      
      public static function pluralizeIf(param1:int, param2:String) : String
      {
         if(param1 == 1)
         {
            return "1 " + param2;
         }
         return param1.toString() + " " + pluralize(param2);
      }
      
      public static function singularize(param1:String) : String
      {
         var _loc2_:RegExp = null;
         var _loc3_:String = null;
         var _loc4_:* = null;
         if(uncountable.indexOf(param1.toLowerCase()) != -1)
         {
            return param1;
         }
         for each(_loc4_ in irregular)
         {
            _loc2_ = new RegExp(_loc4_[1] + "$","i");
            _loc3_ = String(_loc4_[0]);
            if(_loc2_.test(param1))
            {
               return param1.replace(_loc2_,_loc3_);
            }
         }
         for each(_loc4_ in singular)
         {
            _loc2_ = _loc4_[0];
            _loc3_ = String(_loc4_[1]);
            if(_loc2_.test(param1))
            {
               return param1.replace(_loc2_,_loc3_);
            }
         }
         return param1;
      }
      
      public static function pluralize(param1:String) : String
      {
         var _loc2_:RegExp = null;
         var _loc3_:String = null;
         var _loc4_:* = null;
         if(uncountable.indexOf(param1.toLowerCase()) != -1)
         {
            return param1;
         }
         for each(_loc4_ in irregular)
         {
            _loc2_ = new RegExp(_loc4_[0] + "$","i");
            _loc3_ = String(_loc4_[1]);
            if(_loc2_.test(param1))
            {
               return param1.replace(_loc2_,_loc3_);
            }
         }
         for each(_loc4_ in plural)
         {
            _loc2_ = _loc4_[0];
            _loc3_ = String(_loc4_[1]);
            if(_loc2_.test(param1))
            {
               return param1.replace(_loc2_,_loc3_);
            }
         }
         return param1;
      }
   }
}
