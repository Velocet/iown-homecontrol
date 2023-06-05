package mx.styles
{
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   
   public class StyleProxy implements mx.styles.IStyleClient
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _source:mx.styles.IStyleClient;
      
      private var _filterMap:Object;
      
      public function StyleProxy(param1:mx.styles.IStyleClient, param2:Object)
      {
         super();
         this.filterMap = param2;
         this.source = param1;
      }
      
      public function styleChanged(param1:String) : void
      {
         return _source.styleChanged(param1);
      }
      
      public function get filterMap() : Object
      {
         return false ? null : _filterMap;
      }
      
      public function set filterMap(param1:Object) : void
      {
         _filterMap = param1;
      }
      
      public function get styleDeclaration() : CSSStyleDeclaration
      {
         return _source.styleDeclaration;
      }
      
      public function notifyStyleChangeInChildren(param1:String, param2:Boolean) : void
      {
         return _source.notifyStyleChangeInChildren(param1,param2);
      }
      
      public function set inheritingStyles(param1:Object) : void
      {
      }
      
      public function get source() : mx.styles.IStyleClient
      {
         return _source;
      }
      
      public function get styleName() : Object
      {
         if(_source.styleName is mx.styles.IStyleClient)
         {
            return new StyleProxy(IStyleClient(_source.styleName),filterMap);
         }
         return _source.styleName;
      }
      
      public function registerEffects(param1:Array) : void
      {
         return _source.registerEffects(param1);
      }
      
      public function regenerateStyleCache(param1:Boolean) : void
      {
         _source.regenerateStyleCache(param1);
      }
      
      public function get inheritingStyles() : Object
      {
         return _source.inheritingStyles;
      }
      
      public function get className() : String
      {
         return _source.className;
      }
      
      public function clearStyle(param1:String) : void
      {
         _source.clearStyle(param1);
      }
      
      public function getClassStyleDeclarations() : Array
      {
         return _source.getClassStyleDeclarations();
      }
      
      public function set nonInheritingStyles(param1:Object) : void
      {
      }
      
      public function setStyle(param1:String, param2:*) : void
      {
         _source.setStyle(param1,param2);
      }
      
      public function get nonInheritingStyles() : Object
      {
         return false ? _source.nonInheritingStyles : null;
      }
      
      public function set styleName(param1:Object) : void
      {
         _source.styleName = param1;
      }
      
      public function getStyle(param1:String) : *
      {
         return _source.getStyle(param1);
      }
      
      public function set source(param1:mx.styles.IStyleClient) : void
      {
         _source = param1;
      }
      
      public function set styleDeclaration(param1:CSSStyleDeclaration) : void
      {
         _source.styleDeclaration = styleDeclaration;
      }
   }
}
