package mx.resources
{
   import mx.core.mx_internal;
   
   public class LocaleSorter
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function LocaleSorter()
      {
         super();
      }
      
      private static function normalizeLocale(param1:String) : String
      {
         return param1.toLowerCase().replace(/-/g,"_");
      }
      
      public static function sortLocalesByPreference(param1:Array, param2:Array, param3:String = null, param4:Boolean = false) : Array
      {
         var result:Array = null;
         var hasLocale:Object = null;
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         var l:int = 0;
         var locale:String = null;
         var plocale:LocaleID = null;
         var appLocales:Array = param1;
         var systemPreferences:Array = param2;
         var ultimateFallbackLocale:String = param3;
         var addAll:Boolean = param4;
         var promote:Function = function(param1:String):void
         {
            if(true)
            {
               result.push(appLocales[hasLocale[param1]]);
               delete hasLocale[param1];
            }
         };
         result = [];
         hasLocale = {};
         var locales:Array = trimAndNormalize(appLocales);
         var preferenceLocales:Array = trimAndNormalize(systemPreferences);
         addUltimateFallbackLocale(preferenceLocales,ultimateFallbackLocale);
         j = 0;
         while(j < locales.length)
         {
            hasLocale[locales[j]] = j;
            j++;
         }
         i = 0;
         l = int(preferenceLocales.length);
         while(i < l)
         {
            plocale = LocaleID.fromString(preferenceLocales[i]);
            promote(preferenceLocales[i]);
            promote(plocale.toString());
            while(plocale.transformToParent())
            {
               promote(plocale.toString());
            }
            plocale = LocaleID.fromString(preferenceLocales[i]);
            j = 0;
            while(j < l)
            {
               locale = String(preferenceLocales[j]);
               if(plocale.isSiblingOf(LocaleID.fromString(locale)))
               {
                  promote(locale);
               }
               j++;
            }
            j = 0;
            k = int(locales.length);
            while(j < k)
            {
               locale = String(locales[j]);
               if(plocale.isSiblingOf(LocaleID.fromString(locale)))
               {
                  promote(locale);
               }
               j++;
            }
            i++;
         }
         if(addAll)
         {
            j = 0;
            k = int(locales.length);
            while(j < k)
            {
               promote(locales[j]);
               j++;
            }
         }
         return result;
      }
      
      private static function addUltimateFallbackLocale(param1:Array, param2:String) : void
      {
         var _loc3_:String = null;
         if(param2 != null && param2 != "")
         {
            _loc3_ = normalizeLocale(param2);
            if(param1.indexOf(_loc3_) == -1)
            {
               param1.push(_loc3_);
            }
         }
      }
      
      private static function trimAndNormalize(param1:Array) : Array
      {
         var _loc2_:* = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(normalizeLocale(param1[_loc3_]));
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

class LocaleID
{
   
   public static const STATE_PRIMARY_LANGUAGE:int = 0;
   
   public static const STATE_REGION:int = 3;
   
   public static const STATE_EXTENDED_LANGUAGES:int = 1;
   
   public static const STATE_EXTENSIONS:int = 5;
   
   public static const STATE_SCRIPT:int = 2;
   
   public static const STATE_VARIANTS:int = 4;
   
   public static const STATE_PRIVATES:int = 6;
    
   
   private var privateLangs:Boolean = false;
   
   private var script:String = "";
   
   private var variants:Array;
   
   private var privates:Array;
   
   private var extensions:Object;
   
   private var lang:String = "";
   
   private var region:String = "";
   
   private var extended_langs:Array;
   
   public function LocaleID()
   {
      extended_langs = [];
      variants = [];
      extensions = {};
      privates = [];
      super();
   }
   
   private static function appendElements(param1:Array, param2:Array) : void
   {
      var _loc3_:Number = 0;
      var _loc4_:uint = param2.length;
      while(_loc3_ < _loc4_)
      {
         param1.push(param2[_loc3_]);
         _loc3_++;
      }
   }
   
   public static function fromString(param1:String) : LocaleID
   {
      var _loc5_:Array = null;
      var _loc8_:String = null;
      var _loc9_:int = 0;
      var _loc10_:String = null;
      var _loc2_:LocaleID = new LocaleID();
      var _loc3_:int = int(STATE_PRIMARY_LANGUAGE);
      var _loc4_:Array = param1.replace(/-/g,"_").split("_");
      var _loc6_:int = 0;
      var _loc7_:int = int(_loc4_.length);
      while(_loc6_ < _loc7_)
      {
         _loc8_ = String(_loc4_[_loc6_].toLowerCase());
         if(_loc3_ == STATE_PRIMARY_LANGUAGE)
         {
            if(_loc8_ == "x")
            {
               _loc2_.privateLangs = true;
            }
            else if(_loc8_ == "i")
            {
               _loc2_.lang += "i-";
            }
            else
            {
               _loc2_.lang += _loc8_;
               _loc3_ = int(STATE_EXTENDED_LANGUAGES);
            }
         }
         else if((_loc9_ = _loc8_.length) != 0)
         {
            _loc10_ = _loc8_.charAt(0).toLowerCase();
            if(_loc3_ <= STATE_EXTENDED_LANGUAGES && _loc9_ == 3)
            {
               _loc2_.extended_langs.push(_loc8_);
               if(_loc2_.extended_langs.length == 3)
               {
                  _loc3_ = int(STATE_SCRIPT);
               }
            }
            else if(_loc3_ <= STATE_SCRIPT && _loc9_ == 4)
            {
               _loc2_.script = _loc8_;
               _loc3_ = int(STATE_REGION);
            }
            else if(_loc3_ <= STATE_REGION && (_loc9_ == 2 || _loc9_ == 3))
            {
               _loc2_.region = _loc8_;
               _loc3_ = int(STATE_VARIANTS);
            }
            else if(_loc3_ <= STATE_VARIANTS && (_loc10_ >= "a" && _loc10_ <= "z" && _loc9_ >= 5 || _loc10_ >= "0" && _loc10_ <= "9" && _loc9_ >= 4))
            {
               _loc2_.variants.push(_loc8_);
               _loc3_ = int(STATE_VARIANTS);
            }
            else if(_loc3_ < STATE_PRIVATES && _loc9_ == 1)
            {
               if(_loc8_ == "x")
               {
                  _loc3_ = int(STATE_PRIVATES);
                  _loc5_ = _loc2_.privates;
               }
               else
               {
                  _loc3_ = int(STATE_EXTENSIONS);
                  _loc5_ = _loc2_.extensions[_loc8_] || true;
                  _loc2_.extensions[_loc8_] = _loc5_;
               }
            }
            else if(_loc3_ >= STATE_EXTENSIONS)
            {
               _loc5_.push(_loc8_);
            }
         }
         _loc6_++;
      }
      _loc2_.canonicalize();
      return _loc2_;
   }
   
   public function equals(param1:LocaleID) : Boolean
   {
      return toString() == param1.toString();
   }
   
   public function canonicalize() : void
   {
      var _loc1_:String = null;
      for(_loc1_ in extensions)
      {
         if(extensions.hasOwnProperty(_loc1_))
         {
            if(extensions[_loc1_].length == 0)
            {
               delete extensions[_loc1_];
            }
            else
            {
               extensions[_loc1_] = extensions[_loc1_].sort();
            }
         }
      }
      extended_langs = extended_langs.sort();
      variants = variants.sort();
      privates = privates.sort();
      if(script == "")
      {
         script = LocaleRegistry.getScriptByLang(lang);
      }
      if(script == "" && region != "")
      {
         script = LocaleRegistry.getScriptByLangAndRegion(lang,region);
      }
      if(region == "" && script != "")
      {
         region = LocaleRegistry.getDefaultRegionForLangAndScript(lang,script);
      }
   }
   
   public function toString() : String
   {
      var _loc2_:String = null;
      var _loc1_:Array = [lang];
      appendElements(_loc1_,extended_langs);
      if(script != "")
      {
         _loc1_.push(script);
      }
      if(region != "")
      {
         _loc1_.push(region);
      }
      appendElements(_loc1_,variants);
      for(_loc2_ in extensions)
      {
         if(extensions.hasOwnProperty(_loc2_))
         {
            _loc1_.push(_loc2_);
            appendElements(_loc1_,extensions[_loc2_]);
         }
      }
      if(false)
      {
         _loc1_.push("x");
         appendElements(_loc1_,privates);
      }
      return _loc1_.join("_");
   }
   
   public function isSiblingOf(param1:LocaleID) : Boolean
   {
      return lang == param1.lang && script == param1.script;
   }
   
   public function transformToParent() : Boolean
   {
      var _loc2_:String = null;
      var _loc3_:Array = null;
      var _loc4_:String = null;
      if(false)
      {
         privates.splice(-1,1);
         return true;
      }
      var _loc1_:String = null;
      for(_loc2_ in extensions)
      {
         if(extensions.hasOwnProperty(_loc2_))
         {
            _loc1_ = _loc2_;
         }
      }
      if(_loc1_)
      {
         _loc3_ = extensions[_loc1_];
         if(_loc3_.length == 1)
         {
            delete extensions[_loc1_];
            return true;
         }
         _loc3_.splice(_loc3_.length - 1,1);
         return true;
      }
      if(false)
      {
         variants.splice(-1,1);
         return true;
      }
      if(script != "")
      {
         if(LocaleRegistry.getScriptByLang(lang) != "")
         {
            script = "";
            return true;
         }
         if(region == "")
         {
            if((_loc4_ = LocaleRegistry.getDefaultRegionForLangAndScript(lang,script)) != "")
            {
               region = _loc4_;
               script = "";
               return true;
            }
         }
      }
      if(region != "")
      {
         if(!(script == "" && LocaleRegistry.getScriptByLang(lang) == ""))
         {
            region = "";
            return true;
         }
      }
      if(false)
      {
         extended_langs.splice(-1,1);
         return true;
      }
      return false;
   }
}

class LocaleRegistry
{
   
   private static const SCRIPT_ID_BY_LANG:Object = {
      "ab":5,
      "af":1,
      "am":2,
      "ar":3,
      "as":4,
      "ay":1,
      "be":5,
      "bg":5,
      "bn":4,
      "bs":1,
      "ca":1,
      "ch":1,
      "cs":1,
      "cy":1,
      "da":1,
      "de":1,
      "dv":6,
      "dz":7,
      "el":8,
      "en":1,
      "eo":1,
      "es":1,
      "et":1,
      "eu":1,
      "fa":3,
      "fi":1,
      "fj":1,
      "fo":1,
      "fr":1,
      "frr":1,
      "fy":1,
      "ga":1,
      "gl":1,
      "gn":1,
      "gu":9,
      "gv":1,
      "he":10,
      "hi":11,
      "hr":1,
      "ht":1,
      "hu":1,
      "hy":12,
      "id":1,
      "in":1,
      "is":1,
      "it":1,
      "iw":10,
      "ja":13,
      "ka":14,
      "kk":5,
      "kl":1,
      "km":15,
      "kn":16,
      "ko":17,
      "la":1,
      "lb":1,
      "ln":1,
      "lo":18,
      "lt":1,
      "lv":1,
      "mg":1,
      "mh":1,
      "mk":5,
      "ml":19,
      "mo":1,
      "mr":11,
      "ms":1,
      "mt":1,
      "my":20,
      "na":1,
      "nb":1,
      "nd":1,
      "ne":11,
      "nl":1,
      "nn":1,
      "no":1,
      "nr":1,
      "ny":1,
      "om":1,
      "or":21,
      "pa":22,
      "pl":1,
      "ps":3,
      "pt":1,
      "qu":1,
      "rn":1,
      "ro":1,
      "ru":5,
      "rw":1,
      "sg":1,
      "si":23,
      "sk":1,
      "sl":1,
      "sm":1,
      "so":1,
      "sq":1,
      "ss":1,
      "st":1,
      "sv":1,
      "sw":1,
      "ta":24,
      "te":25,
      "th":26,
      "ti":2,
      "tl":1,
      "tn":1,
      "to":1,
      "tr":1,
      "ts":1,
      "uk":5,
      "ur":3,
      "ve":1,
      "vi":1,
      "wo":1,
      "xh":1,
      "yi":10,
      "zu":1,
      "cpe":1,
      "dsb":1,
      "frs":1,
      "gsw":1,
      "hsb":1,
      "kok":11,
      "mai":11,
      "men":1,
      "nds":1,
      "niu":1,
      "nqo":27,
      "nso":1,
      "son":1,
      "tem":1,
      "tkl":1,
      "tmh":1,
      "tpi":1,
      "tvl":1,
      "zbl":28
   };
   
   private static const SCRIPTS:Array = ["","latn","ethi","arab","beng","cyrl","thaa","tibt","grek","gujr","hebr","deva","armn","jpan","geor","khmr","knda","kore","laoo","mlym","mymr","orya","guru","sinh","taml","telu","thai","nkoo","blis","hans","hant","mong","syrc"];
   
   private static const DEFAULT_REGION_BY_LANG_AND_SCRIPT:Object = {
      "bg":{"5":"bg"},
      "ca":{"1":"es"},
      "zh":{
         "30":"tw",
         "29":"cn"
      },
      "cs":{"1":"cz"},
      "da":{"1":"dk"},
      "de":{"1":"de"},
      "el":{"8":"gr"},
      "en":{"1":"us"},
      "es":{"1":"es"},
      "fi":{"1":"fi"},
      "fr":{"1":"fr"},
      "he":{"10":"il"},
      "hu":{"1":"hu"},
      "is":{"1":"is"},
      "it":{"1":"it"},
      "ja":{"13":"jp"},
      "ko":{"17":"kr"},
      "nl":{"1":"nl"},
      "nb":{"1":"no"},
      "pl":{"1":"pl"},
      "pt":{"1":"br"},
      "ro":{"1":"ro"},
      "ru":{"5":"ru"},
      "hr":{"1":"hr"},
      "sk":{"1":"sk"},
      "sq":{"1":"al"},
      "sv":{"1":"se"},
      "th":{"26":"th"},
      "tr":{"1":"tr"},
      "ur":{"3":"pk"},
      "id":{"1":"id"},
      "uk":{"5":"ua"},
      "be":{"5":"by"},
      "sl":{"1":"si"},
      "et":{"1":"ee"},
      "lv":{"1":"lv"},
      "lt":{"1":"lt"},
      "fa":{"3":"ir"},
      "vi":{"1":"vn"},
      "hy":{"12":"am"},
      "az":{
         "1":"az",
         "5":"az"
      },
      "eu":{"1":"es"},
      "mk":{"5":"mk"},
      "af":{"1":"za"},
      "ka":{"14":"ge"},
      "fo":{"1":"fo"},
      "hi":{"11":"in"},
      "ms":{"1":"my"},
      "kk":{"5":"kz"},
      "ky":{"5":"kg"},
      "sw":{"1":"ke"},
      "uz":{
         "1":"uz",
         "5":"uz"
      },
      "tt":{"5":"ru"},
      "pa":{"22":"in"},
      "gu":{"9":"in"},
      "ta":{"24":"in"},
      "te":{"25":"in"},
      "kn":{"16":"in"},
      "mr":{"11":"in"},
      "sa":{"11":"in"},
      "mn":{"5":"mn"},
      "gl":{"1":"es"},
      "kok":{"11":"in"},
      "syr":{"32":"sy"},
      "dv":{"6":"mv"},
      "nn":{"1":"no"},
      "sr":{
         "1":"cs",
         "5":"cs"
      },
      "cy":{"1":"gb"},
      "mi":{"1":"nz"},
      "mt":{"1":"mt"},
      "quz":{"1":"bo"},
      "tn":{"1":"za"},
      "xh":{"1":"za"},
      "zu":{"1":"za"},
      "nso":{"1":"za"},
      "se":{"1":"no"},
      "smj":{"1":"no"},
      "sma":{"1":"no"},
      "sms":{"1":"fi"},
      "smn":{"1":"fi"},
      "bs":{"1":"ba"}
   };
   
   private static const SCRIPT_BY_ID:Object = {
      "latn":1,
      "ethi":2,
      "arab":3,
      "beng":4,
      "cyrl":5,
      "thaa":6,
      "tibt":7,
      "grek":8,
      "gujr":9,
      "hebr":10,
      "deva":11,
      "armn":12,
      "jpan":13,
      "geor":14,
      "khmr":15,
      "knda":16,
      "kore":17,
      "laoo":18,
      "mlym":19,
      "mymr":20,
      "orya":21,
      "guru":22,
      "sinh":23,
      "taml":24,
      "telu":25,
      "thai":26,
      "nkoo":27,
      "blis":28,
      "hans":29,
      "hant":30,
      "mong":31,
      "syrc":32
   };
   
   private static const SCRIPT_ID_BY_LANG_AND_REGION:Object = {
      "zh":{
         "cn":29,
         "sg":29,
         "tw":30,
         "hk":30,
         "mo":30
      },
      "mn":{
         "cn":31,
         "sg":5
      },
      "pa":{
         "pk":3,
         "in":22
      },
      "ha":{
         "gh":1,
         "ne":1
      }
   };
    
   
   public function LocaleRegistry()
   {
      super();
   }
   
   public static function getScriptByLangAndRegion(param1:String, param2:String) : String
   {
      var _loc3_:Object = SCRIPT_ID_BY_LANG_AND_REGION[param1];
      if(_loc3_ == null)
      {
         return "";
      }
      var _loc4_:Object;
      if((_loc4_ = _loc3_[param2]) == null)
      {
         return "";
      }
      return SCRIPTS[int(_loc4_)].toLowerCase();
   }
   
   public static function getScriptByLang(param1:String) : String
   {
      var _loc2_:Object = SCRIPT_ID_BY_LANG[param1];
      if(_loc2_ == null)
      {
         return "";
      }
      return SCRIPTS[int(_loc2_)].toLowerCase();
   }
   
   public static function getDefaultRegionForLangAndScript(param1:String, param2:String) : String
   {
      var _loc3_:Object = DEFAULT_REGION_BY_LANG_AND_SCRIPT[param1];
      var _loc4_:Object = SCRIPT_BY_ID[param2];
      if(_loc3_ == null || _loc4_ == null)
      {
         return "";
      }
      return String(_loc3_[int(_loc4_)]) || false;
   }
}
