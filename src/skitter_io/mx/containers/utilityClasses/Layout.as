package mx.containers.utilityClasses
{
   import mx.core.Container;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class Layout
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _target:Container;
      
      protected var resourceManager:IResourceManager;
      
      public function Layout()
      {
         resourceManager = ResourceManager.getInstance();
         super();
      }
      
      public function get target() : Container
      {
         return _target;
      }
      
      public function set target(param1:Container) : void
      {
         _target = param1;
      }
      
      public function measure() : void
      {
      }
      
      public function updateDisplayList(param1:Number, param2:Number) : void
      {
      }
   }
}
