package mx.utils
{
   import flash.utils.Dictionary;
   import mx.core.mx_internal;
   
   public class XMLNotifier
   {
      
      private static var instance:mx.utils.XMLNotifier;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function XMLNotifier(param1:XMLNotifierSingleton)
      {
         super();
      }
      
      public static function getInstance() : mx.utils.XMLNotifier
      {
         if(!instance)
         {
            instance = new mx.utils.XMLNotifier(new XMLNotifierSingleton());
         }
         return instance;
      }
      
      mx_internal static function initializeXMLForNotification() : Function
      {
         var notificationFunction:Function = function(param1:Object, param2:String, param3:Object, param4:Object, param5:Object):void
         {
            var _loc8_:Object = null;
            var _loc7_:Dictionary;
            if((_loc7_ = arguments.callee.watched) != null)
            {
               for(_loc8_ in _loc7_)
               {
                  IXMLNotifiable(_loc8_).xmlNotification(param1,param2,param3,param4,param5);
               }
            }
         };
         return notificationFunction;
      }
      
      public function watchXML(param1:Object, param2:IXMLNotifiable, param3:String = null) : void
      {
         var _loc6_:Dictionary = null;
         var _loc5_:Object;
         var _loc4_:XML;
         if(!((_loc5_ = (_loc4_ = XML(param1)).notification()) is Function))
         {
            _loc5_ = mx_internal::initializeXMLForNotification();
            _loc4_.setNotification(_loc5_ as Function);
            if(Boolean(param3) && _loc5_["uid"] == null)
            {
               _loc5_["uid"] = param3;
            }
         }
         if(_loc5_["watched"] == undefined)
         {
            _loc5_["watched"] = _loc6_ = new Dictionary(true);
         }
         else
         {
            _loc6_ = _loc5_["watched"];
         }
         _loc6_[param2] = true;
      }
      
      public function unwatchXML(param1:Object, param2:IXMLNotifiable) : void
      {
         var _loc5_:Dictionary = null;
         var _loc3_:XML = XML(param1);
         var _loc4_:Object;
         if(!((_loc4_ = _loc3_.notification()) is Function))
         {
            return;
         }
         if(_loc4_["watched"] != undefined)
         {
            delete (_loc5_ = _loc4_["watched"])[param2];
         }
      }
   }
}

class XMLNotifierSingleton
{
    
   
   public function XMLNotifierSingleton()
   {
      super();
   }
}
