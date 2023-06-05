package mx.managers
{
   import flash.display.DisplayObject;
   import mx.core.IToolTip;
   import mx.core.IUIComponent;
   import mx.effects.IAbstractEffect;
   
   public interface IToolTipManager2
   {
       
      
      function registerToolTip(param1:DisplayObject, param2:String, param3:String) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function get scrubDelay() : Number;
      
      function set hideEffect(param1:IAbstractEffect) : void;
      
      function createToolTip(param1:String, param2:Number, param3:Number, param4:String = null, param5:IUIComponent = null) : IToolTip;
      
      function set scrubDelay(param1:Number) : void;
      
      function set hideDelay(param1:Number) : void;
      
      function get currentTarget() : DisplayObject;
      
      function set showDelay(param1:Number) : void;
      
      function get showDelay() : Number;
      
      function get showEffect() : IAbstractEffect;
      
      function get hideDelay() : Number;
      
      function get currentToolTip() : IToolTip;
      
      function get hideEffect() : IAbstractEffect;
      
      function set currentToolTip(param1:IToolTip) : void;
      
      function get toolTipClass() : Class;
      
      function registerErrorString(param1:DisplayObject, param2:String, param3:String) : void;
      
      function destroyToolTip(param1:IToolTip) : void;
      
      function set toolTipClass(param1:Class) : void;
      
      function sizeTip(param1:IToolTip) : void;
      
      function set currentTarget(param1:DisplayObject) : void;
      
      function set showEffect(param1:IAbstractEffect) : void;
   }
}
