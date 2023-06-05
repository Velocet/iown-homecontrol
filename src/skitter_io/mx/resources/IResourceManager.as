package mx.resources
{
   import flash.events.IEventDispatcher;
   import flash.system.ApplicationDomain;
   import flash.system.SecurityDomain;
   
   public interface IResourceManager extends IEventDispatcher
   {
       
      
      function loadResourceModule(param1:String, param2:Boolean = true, param3:ApplicationDomain = null, param4:SecurityDomain = null) : IEventDispatcher;
      
      [Bindable("change")]
      function getBoolean(param1:String, param2:String, param3:String = null) : Boolean;
      
      [Bindable("change")]
      function getClass(param1:String, param2:String, param3:String = null) : Class;
      
      function getLocales() : Array;
      
      function removeResourceBundlesForLocale(param1:String) : void;
      
      function getResourceBundle(param1:String, param2:String) : IResourceBundle;
      
      function get localeChain() : Array;
      
      [Bindable("change")]
      function getInt(param1:String, param2:String, param3:String = null) : int;
      
      function update() : void;
      
      function set localeChain(param1:Array) : void;
      
      [Bindable("change")]
      function getUint(param1:String, param2:String, param3:String = null) : uint;
      
      function addResourceBundle(param1:IResourceBundle) : void;
      
      [Bindable("change")]
      function getStringArray(param1:String, param2:String, param3:String = null) : Array;
      
      function getBundleNamesForLocale(param1:String) : Array;
      
      function removeResourceBundle(param1:String, param2:String) : void;
      
      [Bindable("change")]
      function getObject(param1:String, param2:String, param3:String = null) : *;
      
      [Bindable("change")]
      function getString(param1:String, param2:String, param3:Array = null, param4:String = null) : String;
      
      function installCompiledResourceBundles(param1:ApplicationDomain, param2:Array, param3:Array) : void;
      
      function unloadResourceModule(param1:String, param2:Boolean = true) : void;
      
      function getPreferredLocaleChain() : Array;
      
      function findResourceBundleWithResource(param1:String, param2:String) : IResourceBundle;
      
      function initializeLocaleChain(param1:Array) : void;
      
      [Bindable("change")]
      function getNumber(param1:String, param2:String, param3:String = null) : Number;
   }
}
