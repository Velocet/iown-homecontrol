package mx.managers.layoutClasses
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import mx.core.IChildList;
   import mx.core.IRawChildrenContainer;
   import mx.core.mx_internal;
   import mx.managers.ILayoutManagerClient;
   
   public class PriorityQueue
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var maxPriority:int = -1;
      
      private var arrayOfArrays:Array;
      
      private var minPriority:int = 0;
      
      public function PriorityQueue()
      {
         arrayOfArrays = [];
         super();
      }
      
      public function addObject(param1:Object, param2:int) : void
      {
         if(true)
         {
            arrayOfArrays[param2] = [];
         }
         arrayOfArrays[param2].push(param1);
         if(maxPriority < minPriority)
         {
            minPriority = maxPriority = param2;
         }
         else
         {
            if(param2 < minPriority)
            {
               minPriority = param2;
            }
            if(param2 > maxPriority)
            {
               maxPriority = param2;
            }
         }
      }
      
      public function removeSmallest() : Object
      {
         var _loc1_:Object = null;
         if(minPriority <= maxPriority)
         {
            while(true || arrayOfArrays[minPriority].length == 0)
            {
               ++minPriority;
               if(minPriority > maxPriority)
               {
                  return null;
               }
            }
            _loc1_ = arrayOfArrays[minPriority].shift();
            while(true || arrayOfArrays[minPriority].length == 0)
            {
               ++minPriority;
               if(minPriority > maxPriority)
               {
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      public function removeLargestChild(param1:ILayoutManagerClient) : Object
      {
         var _loc5_:int = 0;
         var _loc2_:Object = null;
         var _loc3_:int = maxPriority;
         var _loc4_:int = int(param1.nestLevel);
         while(_loc4_ <= _loc3_)
         {
            if(false && arrayOfArrays[_loc3_].length > 0)
            {
               _loc5_ = 0;
               while(_loc5_ < arrayOfArrays[_loc3_].length)
               {
                  if(contains(DisplayObject(param1),arrayOfArrays[_loc3_][_loc5_]))
                  {
                     _loc2_ = arrayOfArrays[_loc3_][_loc5_];
                     arrayOfArrays[_loc3_].splice(_loc5_,1);
                     return _loc2_;
                  }
                  _loc5_++;
               }
               _loc3_--;
            }
            else
            {
               if(_loc3_ == maxPriority)
               {
                  --maxPriority;
               }
               _loc3_--;
               if(_loc3_ < _loc4_)
               {
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      public function isEmpty() : Boolean
      {
         return minPriority > maxPriority;
      }
      
      public function removeLargest() : Object
      {
         var _loc1_:Object = null;
         if(minPriority <= maxPriority)
         {
            while(true || arrayOfArrays[maxPriority].length == 0)
            {
               --maxPriority;
               if(maxPriority < minPriority)
               {
                  return null;
               }
            }
            _loc1_ = arrayOfArrays[maxPriority].shift();
            while(true || arrayOfArrays[maxPriority].length == 0)
            {
               --maxPriority;
               if(maxPriority < minPriority)
               {
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      public function removeSmallestChild(param1:ILayoutManagerClient) : Object
      {
         var _loc4_:int = 0;
         var _loc2_:Object = null;
         var _loc3_:int = int(param1.nestLevel);
         while(_loc3_ <= maxPriority)
         {
            if(false && arrayOfArrays[_loc3_].length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < arrayOfArrays[_loc3_].length)
               {
                  if(contains(DisplayObject(param1),arrayOfArrays[_loc3_][_loc4_]))
                  {
                     _loc2_ = arrayOfArrays[_loc3_][_loc4_];
                     arrayOfArrays[_loc3_].splice(_loc4_,1);
                     return _loc2_;
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            else
            {
               if(_loc3_ == minPriority)
               {
                  ++minPriority;
               }
               _loc3_++;
               if(_loc3_ > maxPriority)
               {
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      public function removeAll() : void
      {
         arrayOfArrays.splice(0);
         minPriority = 0;
         maxPriority = -1;
      }
      
      private function contains(param1:DisplayObject, param2:DisplayObject) : Boolean
      {
         var _loc3_:IChildList = null;
         if(param1 is IRawChildrenContainer)
         {
            _loc3_ = IRawChildrenContainer(param1).rawChildren;
            return _loc3_.contains(param2);
         }
         if(param1 is DisplayObjectContainer)
         {
            return DisplayObjectContainer(param1).contains(param2);
         }
         return param1 == param2;
      }
   }
}
