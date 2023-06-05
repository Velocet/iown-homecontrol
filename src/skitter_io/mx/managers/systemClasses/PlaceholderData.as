package mx.managers.systemClasses
{
   import flash.events.IEventDispatcher;
   
   public class PlaceholderData
   {
       
      
      public var bridge:IEventDispatcher;
      
      public var data:Object;
      
      public var id:String;
      
      public function PlaceholderData(param1:String, param2:IEventDispatcher, param3:Object)
      {
         super();
         this.id = param1;
         this.bridge = param2;
         this.data = param3;
      }
   }
}
