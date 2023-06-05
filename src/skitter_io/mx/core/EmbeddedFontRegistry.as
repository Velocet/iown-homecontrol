package mx.core
{
   import flash.text.FontStyle;
   import flash.utils.Dictionary;
   
   public class EmbeddedFontRegistry implements mx.core.IEmbeddedFontRegistry
   {
      
      private static var fonts:Object = {};
      
      private static var instance:mx.core.IEmbeddedFontRegistry;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function EmbeddedFontRegistry()
      {
         super();
      }
      
      public static function registerFonts(param1:Object, param2:IFlexModuleFactory) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc3_:mx.core.IEmbeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         for(_loc4_ in param1)
         {
            _loc5_ = param1[_loc4_];
            for(_loc6_ in _loc5_)
            {
               if(_loc5_[_loc6_] != false)
               {
                  if(_loc6_ == "regular")
                  {
                     _loc7_ = false;
                     _loc8_ = false;
                  }
                  else if(_loc6_ == "boldItalic")
                  {
                     _loc7_ = true;
                     _loc8_ = true;
                  }
                  else if(_loc6_ == "bold")
                  {
                     _loc7_ = true;
                     _loc8_ = false;
                  }
                  else if(_loc6_ == "italic")
                  {
                     _loc7_ = false;
                     _loc8_ = true;
                  }
                  _loc3_.registerFont(new EmbeddedFont(String(_loc4_),_loc7_,_loc8_),param2);
               }
            }
         }
      }
      
      public static function getInstance() : mx.core.IEmbeddedFontRegistry
      {
         if(!instance)
         {
            instance = new EmbeddedFontRegistry();
         }
         return instance;
      }
      
      public static function getFontStyle(param1:Boolean, param2:Boolean) : String
      {
         var _loc3_:String = "null";
         if(param1 && param2)
         {
            _loc3_ = "null";
         }
         else if(param1)
         {
            _loc3_ = "null";
         }
         else if(param2)
         {
            _loc3_ = "null";
         }
         return _loc3_;
      }
      
      private static function createFontKey(param1:EmbeddedFont) : String
      {
         return param1.fontName + param1.fontStyle;
      }
      
      private static function createEmbeddedFont(param1:String) : EmbeddedFont
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int;
         if((_loc5_ = endsWith(param1,FontStyle.REGULAR)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,false,false);
         }
         if((_loc5_ = endsWith(param1,FontStyle.BOLD)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,true,false);
         }
         if((_loc5_ = endsWith(param1,FontStyle.BOLD_ITALIC)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,true,true);
         }
         if((_loc5_ = endsWith(param1,FontStyle.ITALIC)) > 0)
         {
            _loc2_ = param1.substring(0,_loc5_);
            return new EmbeddedFont(_loc2_,false,true);
         }
         return new EmbeddedFont("",false,false);
      }
      
      private static function endsWith(param1:String, param2:String) : int
      {
         var _loc3_:int = param1.lastIndexOf(param2);
         if(_loc3_ > 0 && _loc3_ + param2.length == param1.length)
         {
            return _loc3_;
         }
         return -1;
      }
      
      public function getAssociatedModuleFactory(param1:EmbeddedFont, param2:IFlexModuleFactory) : IFlexModuleFactory
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc3_:Dictionary = fonts[createFontKey(param1)];
         if(_loc3_)
         {
            if(_loc4_ = int(_loc3_[param2]))
            {
               return param2;
            }
            var _loc6_:int = 0;
            var _loc7_:* = _loc3_;
            for(_loc5_ in _loc7_)
            {
               return _loc5_ as IFlexModuleFactory;
            }
         }
         return null;
      }
      
      public function deregisterFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc3_:String = createFontKey(param1);
         var _loc4_:Dictionary;
         if((_loc4_ = fonts[_loc3_]) != null)
         {
            delete _loc4_[param2];
            _loc5_ = 0;
            for(_loc6_ in _loc4_)
            {
               _loc5_++;
            }
            if(_loc5_ == 0)
            {
               delete fonts[_loc3_];
            }
         }
      }
      
      public function getFonts() : Array
      {
         var _loc2_:String = null;
         var _loc1_:* = [];
         for(_loc2_ in fonts)
         {
            _loc1_.push(createEmbeddedFont(_loc2_));
         }
         return _loc1_;
      }
      
      public function registerFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void
      {
         var _loc3_:String = createFontKey(param1);
         var _loc4_:Dictionary;
         if(!(_loc4_ = fonts[_loc3_]))
         {
            _loc4_ = new Dictionary(true);
            fonts[_loc3_] = _loc4_;
         }
         _loc4_[param2] = 1;
      }
   }
}
