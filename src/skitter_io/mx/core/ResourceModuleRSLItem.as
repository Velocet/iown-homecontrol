package mx.core
{
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import mx.events.ResourceEvent;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   
   public class ResourceModuleRSLItem extends RSLItem
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ResourceModuleRSLItem(param1:String)
      {
         super(param1);
      }
      
      private function resourceErrorHandler(param1:ResourceEvent) : void
      {
         var _loc2_:IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR);
         _loc2_.text = param1.errorText;
         super.itemErrorHandler(_loc2_);
      }
      
      override public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
      {
         chainedProgressHandler = param1;
         chainedCompleteHandler = param2;
         chainedIOErrorHandler = param3;
         chainedSecurityErrorHandler = param4;
         chainedRSLErrorHandler = param5;
         var _loc7_:IEventDispatcher;
         var _loc6_:IResourceManager;
         (_loc7_ = (_loc6_ = ResourceManager.getInstance()).loadResourceModule(url)).addEventListener(ResourceEvent.PROGRESS,itemProgressHandler);
         _loc7_.addEventListener(ResourceEvent.COMPLETE,itemCompleteHandler);
         _loc7_.addEventListener(ResourceEvent.ERROR,resourceErrorHandler);
      }
   }
}
