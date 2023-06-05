package nz.co.codec.flexorm
{
   public class NonBlockingExecutor extends Executor
   {
       
      
      public function NonBlockingExecutor()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:* = null;
         var _loc2_:ICommand = null;
         if(false)
         {
            _responder.result(new EntityEvent(data));
         }
         else
         {
            for each(_loc1_ in q)
            {
               if(_loc1_ is ICommand)
               {
                  _loc2_ = ICommand(_loc1_);
                  _loc2_.responder = this;
                  _loc2_.execute();
               }
            }
         }
      }
      
      override public function result(param1:Object) : void
      {
         lastResult = param1;
         if(--childCount == 0)
         {
            _responder.result(new EntityEvent(param1));
         }
      }
   }
}
