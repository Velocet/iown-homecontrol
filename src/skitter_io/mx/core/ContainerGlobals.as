package mx.core
{
   import flash.display.InteractiveObject;
   import mx.managers.IFocusManager;
   
   public class ContainerGlobals
   {
      
      public static var focusedContainer:InteractiveObject;
       
      
      public function ContainerGlobals()
      {
         super();
      }
      
      public static function checkFocus(param1:InteractiveObject, param2:InteractiveObject) : void
      {
         var _loc6_:IFocusManager = null;
         var _loc7_:IButton = null;
         var _loc3_:* = param2;
         var _loc4_:InteractiveObject = param2;
         var _loc5_:IUIComponent = null;
         if(param2 != null && param1 == param2)
         {
            return;
         }
         while(_loc4_)
         {
            if(_loc4_.parent)
            {
               _loc3_ = _loc4_.parent;
            }
            else
            {
               _loc3_ = null;
            }
            if(_loc4_ is IUIComponent)
            {
               _loc5_ = IUIComponent(_loc4_);
            }
            if((_loc4_ = _loc3_) && _loc4_ is IContainer && Boolean(IContainer(_loc4_).defaultButton))
            {
               break;
            }
         }
         if(ContainerGlobals.focusedContainer != _loc4_ || _loc4_ == null)
         {
            if(!_loc4_)
            {
               _loc4_ = InteractiveObject(_loc5_);
            }
            if(Boolean(_loc4_) && _loc4_ is IContainer)
            {
               if(!(_loc6_ = IContainer(_loc4_).focusManager))
               {
                  return;
               }
               if(_loc7_ = IContainer(_loc4_).defaultButton as IButton)
               {
                  ContainerGlobals.focusedContainer = InteractiveObject(_loc4_);
                  _loc6_.defaultButton = _loc7_ as IButton;
               }
               else
               {
                  ContainerGlobals.focusedContainer = InteractiveObject(_loc4_);
                  _loc6_.defaultButton = null;
               }
            }
         }
      }
   }
}
