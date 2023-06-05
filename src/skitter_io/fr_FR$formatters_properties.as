package
{
   import mx.resources.ResourceBundle;
   
   public class fr_FR$formatters_properties extends ResourceBundle
   {
       
      
      public function fr_FR$formatters_properties()
      {
         super("fr_FR","formatters");
      }
      
      override protected function getContent() : Object
      {
         return {
            "defaultInvalidValueError":"Valeur incorrecte",
            "areaCodeFormat":"(#)",
            "numberFormatterPrecision":"-1",
            "rounding":"none",
            "dayNamesShort":"Dim,Lun,Mar,Mer,Jeu,Ven,Sam",
            "useNegativeSignInNumber":"true",
            "currencyFormatterPrecision":"-1",
            "am":"AM",
            "useThousandsSeparator":"true",
            "areaCode":"-1",
            "zipCodeFormat":"#####",
            "validPatternChars":"+()#- .",
            "defaultInvalidFormatError":"Format incorrect",
            "phoneNumberFormat":"(#) ## ## ## ##",
            "monthNamesShort":"Jan,Fév,Mar,Avr,Mai,Jun,Jul,Aoû,Sep,Oct,Nov,Déc",
            "useNegativeSignInCurrency":"true",
            "pm":"PM"
         };
      }
   }
}
