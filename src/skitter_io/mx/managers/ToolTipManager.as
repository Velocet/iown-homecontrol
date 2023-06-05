package mx.managers
{
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import mx.core.IToolTip;
   import mx.core.IUIComponent;
   import mx.core.Singleton;
   import mx.core.mx_internal;
   import mx.effects.IAbstractEffect;
   
   public class ToolTipManager extends EventDispatcher
   {
      
      private static var implClassDependency:mx.managers.ToolTipManagerImpl;
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var _impl:mx.managers.IToolTipManager2;
       
      
      public function ToolTipManager()
      {
         super();
      }
      
      mx_internal static function registerToolTip(param1:DisplayObject, param2:String, param3:String) : void
      {
         impl.registerToolTip(param1,param2,param3);
      }
      
      public static function get enabled() : Boolean
      {
         return impl.enabled;
      }
      
      public static function set enabled(param1:Boolean) : void
      {
         impl.enabled = param1;
      }
      
      public static function createToolTip(param1:String, param2:Number, param3:Number, param4:String = null, param5:IUIComponent = null) : IToolTip
      {
         return impl.createToolTip(param1,param2,param3,param4,param5);
      }
      
      public static function set hideDelay(param1:Number) : void
      {
         impl.hideDelay = param1;
      }
      
      public static function set showDelay(param1:Number) : void
      {
         impl.showDelay = param1;
      }
      
      public static function get showDelay() : Number
      {
         return impl.showDelay;
      }
      
      public static function destroyToolTip(param1:IToolTip) : void
      {
         return impl.destroyToolTip(param1);
      }
      
      public static function get scrubDelay() : Number
      {
         return impl.scrubDelay;
      }
      
      public static function get toolTipClass() : Class
      {
         return impl.toolTipClass;
      }
      
      mx_internal static function registerErrorString(param1:DisplayObject, param2:String, param3:String) : void
      {
         impl.registerErrorString(param1,param2,param3);
      }
      
      mx_internal static function sizeTip(param1:IToolTip) : void
      {
         impl.sizeTip(param1);
      }
      
      public static function set currentTarget(param1:DisplayObject) : void
      {
         impl.currentTarget = param1;
      }
      
      public static function set showEffect(param1:IAbstractEffect) : void
      {
         impl.showEffect = param1;
      }
      
      private static function get impl() : mx.managers.IToolTipManager2
      {
         if(!_impl)
         {
            _impl = IToolTipManager2(Singleton.getInstance("mx.managers::IToolTipManager2"));
         }
         return _impl;
      }
      
      public static function get hideDelay() : Number
      {
         return impl.hideDelay;
      }
      
      public static function set hideEffect(param1:IAbstractEffect) : void
      {
         impl.hideEffect = param1;
      }
      
      public static function set scrubDelay(param1:Number) : void
      {
         impl.scrubDelay = param1;
      }
      
      public static function get currentToolTip() : IToolTip
      {
         return impl.currentToolTip;
      }
      
      public static function set currentToolTip(param1:IToolTip) : void
      {
         impl.currentToolTip = param1;
      }
      
      public static function get showEffect() : IAbstractEffect
      {
         return impl.showEffect;
      }
      
      public static function get currentTarget() : DisplayObject
      {
         return impl.currentTarget;
      }
      
      public static function get hideEffect() : IAbstractEffect
      {
         return impl.hideEffect;
      }
      
      public static function set toolTipClass(param1:Class) : void
      {
         impl.toolTipClass = param1;
      }
   }
}
