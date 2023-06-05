package mx.core
{
   public class ComponentDescriptor
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var events:Object;
      
      public var type:Class;
      
      public var document:Object;
      
      private var _properties:Object;
      
      public var propertiesFactory:Function;
      
      public var id:String;
      
      public function ComponentDescriptor(param1:Object)
      {
         var _loc2_:String = null;
         super();
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
      }
      
      public function toString() : String
      {
         return "ComponentDescriptor_" + id;
      }
      
      public function invalidateProperties() : void
      {
         _properties = null;
      }
      
      public function get properties() : Object
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_properties)
         {
            return _properties;
         }
         if(propertiesFactory != null)
         {
            _properties = propertiesFactory.call(document);
         }
         if(_properties)
         {
            _loc1_ = _properties.childDescriptors;
            if(_loc1_)
            {
               _loc2_ = int(_loc1_.length);
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc1_[_loc3_].document = document;
                  _loc3_++;
               }
            }
         }
         else
         {
            _properties = {};
         }
         return _properties;
      }
   }
}
