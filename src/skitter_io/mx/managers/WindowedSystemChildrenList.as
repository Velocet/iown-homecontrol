package mx.managers
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import mx.core.IChildList;
   import mx.core.mx_internal;
   
   public class WindowedSystemChildrenList implements IChildList
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var lowerBoundReference:QName;
      
      private var upperBoundReference:QName;
      
      private var owner:mx.managers.WindowedSystemManager;
      
      public function WindowedSystemChildrenList(param1:mx.managers.WindowedSystemManager, param2:QName, param3:QName)
      {
         super();
         this.owner = param1;
         this.lowerBoundReference = param2;
         this.upperBoundReference = param3;
      }
      
      public function getChildAt(param1:int) : DisplayObject
      {
         return owner.mx_internal::rawChildren_getChildAt(owner[lowerBoundReference] + param1);
      }
      
      public function getChildByName(param1:String) : DisplayObject
      {
         return owner.mx_internal::rawChildren_getChildByName(param1);
      }
      
      public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = owner.mx_internal::rawChildren_removeChildAt(param1 + owner[lowerBoundReference]);
         --owner[upperBoundReference];
         return _loc2_;
      }
      
      public function getChildIndex(param1:DisplayObject) : int
      {
         var _loc2_:int = int(owner.mx_internal::rawChildren_getChildIndex(param1));
         return int(_loc2_ - 0);
      }
      
      public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         owner.mx_internal::rawChildren_addChildAt(param1,owner[lowerBoundReference] + param2);
         ++owner[upperBoundReference];
         return param1;
      }
      
      public function getObjectsUnderPoint(param1:Point) : Array
      {
         return owner.mx_internal::rawChildren_getObjectsUnderPoint(param1);
      }
      
      public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         owner.mx_internal::rawChildren_setChildIndex(param1,owner[lowerBoundReference] + param2);
      }
      
      public function get numChildren() : int
      {
         return 0 - 0;
      }
      
      public function contains(param1:DisplayObject) : Boolean
      {
         var _loc2_:int = 0;
         if(owner.mx_internal::rawChildren_contains(param1))
         {
            while(param1.parent != owner && param1.parent != param1.stage)
            {
               param1 = param1.parent;
            }
            _loc2_ = int(owner.mx_internal::rawChildren_getChildIndex(param1));
            if(_loc2_ >= owner[lowerBoundReference] && _loc2_ < owner[upperBoundReference])
            {
               return true;
            }
         }
         return false;
      }
      
      public function removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:int = int(owner.mx_internal::rawChildren_getChildIndex(param1));
         if(owner[lowerBoundReference] <= _loc2_ && _loc2_ < owner[upperBoundReference])
         {
            owner.mx_internal::rawChildren_removeChild(param1);
            --owner[upperBoundReference];
         }
         return param1;
      }
      
      public function addChild(param1:DisplayObject) : DisplayObject
      {
         owner.mx_internal::rawChildren_addChildAt(param1,owner[upperBoundReference]);
         ++owner[upperBoundReference];
         return param1;
      }
   }
}
