package mx.managers
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.ApplicationGlobals;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.managers.layoutClasses.PriorityQueue;
   
   public class LayoutManager extends EventDispatcher implements ILayoutManager
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var instance:mx.managers.LayoutManager;
       
      
      private var invalidateClientPropertiesFlag:Boolean = false;
      
      private var invalidateDisplayListQueue:PriorityQueue;
      
      private var updateCompleteQueue:PriorityQueue;
      
      private var invalidateDisplayListFlag:Boolean = false;
      
      private var invalidateClientSizeFlag:Boolean = false;
      
      private var invalidateSizeQueue:PriorityQueue;
      
      private var originalFrameRate:Number;
      
      private var invalidatePropertiesFlag:Boolean = false;
      
      private var invalidatePropertiesQueue:PriorityQueue;
      
      private var invalidateSizeFlag:Boolean = false;
      
      private var callLaterPending:Boolean = false;
      
      private var _usePhasedInstantiation:Boolean = false;
      
      private var callLaterObject:UIComponent;
      
      private var targetLevel:int = 2147483647;
      
      public function LayoutManager()
      {
         updateCompleteQueue = new PriorityQueue();
         invalidatePropertiesQueue = new PriorityQueue();
         invalidateSizeQueue = new PriorityQueue();
         invalidateDisplayListQueue = new PriorityQueue();
         super();
      }
      
      public static function getInstance() : mx.managers.LayoutManager
      {
         if(!instance)
         {
            instance = new mx.managers.LayoutManager();
         }
         return instance;
      }
      
      public function set usePhasedInstantiation(param1:Boolean) : void
      {
         var sm:ISystemManager = null;
         var stage:Stage = null;
         var value:Boolean = param1;
         if(_usePhasedInstantiation != value)
         {
            _usePhasedInstantiation = value;
            try
            {
               sm = SystemManagerGlobals.topLevelSystemManagers[0];
               stage = SystemManagerGlobals.topLevelSystemManagers[0].stage;
               if(stage)
               {
                  if(value)
                  {
                     originalFrameRate = stage.frameRate;
                     stage.frameRate = 1000;
                  }
                  else
                  {
                     stage.frameRate = originalFrameRate;
                  }
               }
            }
            catch(e:SecurityError)
            {
            }
         }
      }
      
      private function waitAFrame() : void
      {
         callLaterObject.callLater(doPhasedInstantiation);
      }
      
      public function validateClient(param1:ILayoutManagerClient, param2:Boolean = false) : void
      {
         var _loc3_:ILayoutManagerClient = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = targetLevel;
         if(targetLevel == int.MAX_VALUE)
         {
            targetLevel = param1.nestLevel;
         }
         while(!_loc5_)
         {
            _loc5_ = true;
            _loc3_ = ILayoutManagerClient(invalidatePropertiesQueue.removeSmallestChild(param1));
            while(_loc3_)
            {
               _loc3_.validateProperties();
               if(!_loc3_.updateCompletePendingFlag)
               {
                  updateCompleteQueue.addObject(_loc3_,_loc3_.nestLevel);
                  _loc3_.updateCompletePendingFlag = true;
               }
               _loc3_ = ILayoutManagerClient(invalidatePropertiesQueue.removeSmallestChild(param1));
            }
            if(invalidatePropertiesQueue.isEmpty())
            {
               invalidatePropertiesFlag = false;
               invalidateClientPropertiesFlag = false;
            }
            _loc3_ = ILayoutManagerClient(invalidateSizeQueue.removeLargestChild(param1));
            while(_loc3_)
            {
               _loc3_.validateSize();
               if(!_loc3_.updateCompletePendingFlag)
               {
                  updateCompleteQueue.addObject(_loc3_,_loc3_.nestLevel);
                  _loc3_.updateCompletePendingFlag = true;
               }
               if(invalidateClientPropertiesFlag)
               {
                  _loc3_ = ILayoutManagerClient(invalidatePropertiesQueue.removeSmallestChild(param1));
                  if(_loc3_)
                  {
                     invalidatePropertiesQueue.addObject(_loc3_,_loc3_.nestLevel);
                     _loc5_ = false;
                     break;
                  }
               }
               _loc3_ = ILayoutManagerClient(invalidateSizeQueue.removeLargestChild(param1));
            }
            if(invalidateSizeQueue.isEmpty())
            {
               invalidateSizeFlag = false;
               invalidateClientSizeFlag = false;
            }
            if(!param2)
            {
               _loc3_ = ILayoutManagerClient(invalidateDisplayListQueue.removeSmallestChild(param1));
               while(_loc3_)
               {
                  _loc3_.validateDisplayList();
                  if(!_loc3_.updateCompletePendingFlag)
                  {
                     updateCompleteQueue.addObject(_loc3_,_loc3_.nestLevel);
                     _loc3_.updateCompletePendingFlag = true;
                  }
                  if(invalidateClientPropertiesFlag)
                  {
                     _loc3_ = ILayoutManagerClient(invalidatePropertiesQueue.removeSmallestChild(param1));
                     if(_loc3_)
                     {
                        invalidatePropertiesQueue.addObject(_loc3_,_loc3_.nestLevel);
                        _loc5_ = false;
                        break;
                     }
                  }
                  if(invalidateClientSizeFlag)
                  {
                     _loc3_ = ILayoutManagerClient(invalidateSizeQueue.removeLargestChild(param1));
                     if(_loc3_)
                     {
                        invalidateSizeQueue.addObject(_loc3_,_loc3_.nestLevel);
                        _loc5_ = false;
                        break;
                     }
                  }
                  _loc3_ = ILayoutManagerClient(invalidateDisplayListQueue.removeSmallestChild(param1));
               }
               if(invalidateDisplayListQueue.isEmpty())
               {
                  invalidateDisplayListFlag = false;
               }
            }
         }
         if(_loc6_ == int.MAX_VALUE)
         {
            targetLevel = int.MAX_VALUE;
            if(!param2)
            {
               _loc3_ = ILayoutManagerClient(updateCompleteQueue.removeLargestChild(param1));
               while(_loc3_)
               {
                  if(!_loc3_.initialized)
                  {
                     _loc3_.initialized = true;
                  }
                  _loc3_.dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
                  _loc3_.updateCompletePendingFlag = false;
                  _loc3_ = ILayoutManagerClient(updateCompleteQueue.removeLargestChild(param1));
               }
            }
         }
      }
      
      private function validateProperties() : void
      {
         var _loc1_:ILayoutManagerClient = ILayoutManagerClient(invalidatePropertiesQueue.removeSmallest());
         while(_loc1_)
         {
            _loc1_.validateProperties();
            if(!_loc1_.updateCompletePendingFlag)
            {
               updateCompleteQueue.addObject(_loc1_,_loc1_.nestLevel);
               _loc1_.updateCompletePendingFlag = true;
            }
            _loc1_ = ILayoutManagerClient(invalidatePropertiesQueue.removeSmallest());
         }
         if(invalidatePropertiesQueue.isEmpty())
         {
            invalidatePropertiesFlag = false;
         }
      }
      
      public function invalidateProperties(param1:ILayoutManagerClient) : void
      {
         if(!invalidatePropertiesFlag && Boolean(ApplicationGlobals.application.systemManager))
         {
            invalidatePropertiesFlag = true;
            if(!callLaterPending)
            {
               if(!callLaterObject)
               {
                  callLaterObject = new UIComponent();
                  callLaterObject.systemManager = ApplicationGlobals.application.systemManager;
                  callLaterObject.callLater(waitAFrame);
               }
               else
               {
                  callLaterObject.callLater(doPhasedInstantiation);
               }
               callLaterPending = true;
            }
         }
         if(targetLevel <= param1.nestLevel)
         {
            invalidateClientPropertiesFlag = true;
         }
         invalidatePropertiesQueue.addObject(param1,param1.nestLevel);
      }
      
      public function invalidateDisplayList(param1:ILayoutManagerClient) : void
      {
         if(!invalidateDisplayListFlag && Boolean(ApplicationGlobals.application.systemManager))
         {
            invalidateDisplayListFlag = true;
            if(!callLaterPending)
            {
               if(!callLaterObject)
               {
                  callLaterObject = new UIComponent();
                  callLaterObject.systemManager = ApplicationGlobals.application.systemManager;
                  callLaterObject.callLater(waitAFrame);
               }
               else
               {
                  callLaterObject.callLater(doPhasedInstantiation);
               }
               callLaterPending = true;
            }
         }
         else if(!invalidateDisplayListFlag && !ApplicationGlobals.application.systemManager)
         {
         }
         invalidateDisplayListQueue.addObject(param1,param1.nestLevel);
      }
      
      private function validateDisplayList() : void
      {
         var _loc1_:ILayoutManagerClient = ILayoutManagerClient(invalidateDisplayListQueue.removeSmallest());
         while(_loc1_)
         {
            _loc1_.validateDisplayList();
            if(!_loc1_.updateCompletePendingFlag)
            {
               updateCompleteQueue.addObject(_loc1_,_loc1_.nestLevel);
               _loc1_.updateCompletePendingFlag = true;
            }
            _loc1_ = ILayoutManagerClient(invalidateDisplayListQueue.removeSmallest());
         }
         if(invalidateDisplayListQueue.isEmpty())
         {
            invalidateDisplayListFlag = false;
         }
      }
      
      public function validateNow() : void
      {
         var _loc1_:int = 0;
         if(!usePhasedInstantiation)
         {
            _loc1_ = 0;
            while(callLaterPending && _loc1_++ < 100)
            {
               doPhasedInstantiation();
            }
         }
      }
      
      private function validateSize() : void
      {
         var _loc1_:ILayoutManagerClient = ILayoutManagerClient(invalidateSizeQueue.removeLargest());
         while(_loc1_)
         {
            _loc1_.validateSize();
            if(!_loc1_.updateCompletePendingFlag)
            {
               updateCompleteQueue.addObject(_loc1_,_loc1_.nestLevel);
               _loc1_.updateCompletePendingFlag = true;
            }
            _loc1_ = ILayoutManagerClient(invalidateSizeQueue.removeLargest());
         }
         if(invalidateSizeQueue.isEmpty())
         {
            invalidateSizeFlag = false;
         }
      }
      
      private function doPhasedInstantiation() : void
      {
         var _loc1_:ILayoutManagerClient = null;
         if(usePhasedInstantiation)
         {
            if(invalidatePropertiesFlag)
            {
               validateProperties();
               ApplicationGlobals.application.dispatchEvent(new Event("validatePropertiesComplete"));
            }
            else if(invalidateSizeFlag)
            {
               validateSize();
               ApplicationGlobals.application.dispatchEvent(new Event("validateSizeComplete"));
            }
            else if(invalidateDisplayListFlag)
            {
               validateDisplayList();
               ApplicationGlobals.application.dispatchEvent(new Event("validateDisplayListComplete"));
            }
         }
         else
         {
            if(invalidatePropertiesFlag)
            {
               validateProperties();
            }
            if(invalidateSizeFlag)
            {
               validateSize();
            }
            if(invalidateDisplayListFlag)
            {
               validateDisplayList();
            }
         }
         if(invalidatePropertiesFlag || invalidateSizeFlag || invalidateDisplayListFlag)
         {
            callLaterObject.callLater(doPhasedInstantiation);
         }
         else
         {
            usePhasedInstantiation = false;
            callLaterPending = false;
            _loc1_ = ILayoutManagerClient(updateCompleteQueue.removeLargest());
            while(_loc1_)
            {
               if(!_loc1_.initialized && Boolean(_loc1_.processedDescriptors))
               {
                  _loc1_.initialized = true;
               }
               _loc1_.dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
               _loc1_.updateCompletePendingFlag = false;
               _loc1_ = ILayoutManagerClient(updateCompleteQueue.removeLargest());
            }
            dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
         }
      }
      
      public function isInvalid() : Boolean
      {
         return invalidatePropertiesFlag || invalidateSizeFlag || invalidateDisplayListFlag;
      }
      
      public function get usePhasedInstantiation() : Boolean
      {
         return _usePhasedInstantiation;
      }
      
      public function invalidateSize(param1:ILayoutManagerClient) : void
      {
         if(!invalidateSizeFlag && Boolean(ApplicationGlobals.application.systemManager))
         {
            invalidateSizeFlag = true;
            if(!callLaterPending)
            {
               if(!callLaterObject)
               {
                  callLaterObject = new UIComponent();
                  callLaterObject.systemManager = ApplicationGlobals.application.systemManager;
                  callLaterObject.callLater(waitAFrame);
               }
               else
               {
                  callLaterObject.callLater(doPhasedInstantiation);
               }
               callLaterPending = true;
            }
         }
         if(targetLevel <= param1.nestLevel)
         {
            invalidateClientSizeFlag = true;
         }
         invalidateSizeQueue.addObject(param1,param1.nestLevel);
      }
   }
}
