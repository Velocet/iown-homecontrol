package mx.states
{
   import mx.core.mx_internal;
   import mx.effects.IEffect;
   
   public class Transition
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public var effect:IEffect;
      
      public var toState:String = "*";
      
      public var fromState:String = "*";
      
      public function Transition()
      {
         super();
      }
   }
}
