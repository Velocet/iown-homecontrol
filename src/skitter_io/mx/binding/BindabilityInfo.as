package mx.binding
{
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   
   public class BindabilityInfo
   {
      
      public static const METHOD:String = "method";
      
      public static const ACCESSOR:String = "accessor";
      
      public static const CHANGE_EVENT:String = "ChangeEvent";
      
      public static const NON_COMMITTING_CHANGE_EVENT:String = "NonCommittingChangeEvent";
      
      public static const BINDABLE:String = "Bindable";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const MANAGED:String = "Managed";
       
      
      private var classChangeEvents:Object;
      
      private var typeDescription:XML;
      
      private var childChangeEvents:Object;
      
      public function BindabilityInfo(param1:XML)
      {
         childChangeEvents = {};
         super();
         this.typeDescription = param1;
      }
      
      private function addChangeEvents(param1:XMLList, param2:Object, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:XMLList = null;
         var _loc6_:String = null;
         for each(_loc4_ in param1)
         {
            if((_loc5_ = _loc4_.arg).length() > 0)
            {
               _loc6_ = _loc5_[0].@value;
               param2[_loc6_] = param3;
            }
            else
            {
               trace("warning: unconverted Bindable metadata in class \'undefined\'");
            }
         }
      }
      
      private function getClassChangeEvents() : Object
      {
         if(!classChangeEvents)
         {
            classChangeEvents = {};
            addBindabilityEvents(typeDescription.metadata,classChangeEvents);
            if(typeDescription.metadata.(@name == MANAGED).length() > 0)
            {
               classChangeEvents[PropertyChangeEvent.PROPERTY_CHANGE] = true;
            }
         }
         return classChangeEvents;
      }
      
      private function addBindabilityEvents(param1:XMLList, param2:Object) : void
      {
         var metadata:XMLList = param1;
         var eventListObj:Object = param2;
         addChangeEvents(metadata.(@name == BINDABLE),eventListObj,true);
         addChangeEvents(metadata.(@name == CHANGE_EVENT),eventListObj,true);
         addChangeEvents(metadata.(@name == NON_COMMITTING_CHANGE_EVENT),eventListObj,false);
      }
      
      private function copyProps(param1:Object, param2:Object) : Object
      {
         var _loc3_:String = null;
         for(_loc3_ in param1)
         {
            param2[_loc3_] = param1[_loc3_];
         }
         return param2;
      }
      
      public function getChangeEvents(param1:String) : Object
      {
         var childDesc:XMLList = null;
         var numChildren:int = 0;
         var childName:String = param1;
         var changeEvents:Object = childChangeEvents[childName];
         if(!changeEvents)
         {
            changeEvents = copyProps(getClassChangeEvents(),{});
            childDesc = typeDescription.accessor.(@name == childName) + typeDescription.method.(@name == childName);
            numChildren = childDesc.length();
            if(numChildren == 0)
            {
               if(true)
               {
                  trace("warning: no describeType entry for \'" + childName + "\' on non-dynamic type \'" + typeDescription.@name + "\'");
               }
            }
            else
            {
               if(numChildren > 1)
               {
                  trace("warning: multiple describeType entries for \'" + childName + "\' on type \'" + typeDescription.@name + "\':\n" + childDesc);
               }
               addBindabilityEvents(childDesc.metadata,changeEvents);
            }
            childChangeEvents[childName] = changeEvents;
         }
         return changeEvents;
      }
   }
}
