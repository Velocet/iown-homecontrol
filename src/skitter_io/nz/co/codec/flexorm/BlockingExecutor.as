package nz.co.codec.flexorm
{
   public class BlockingExecutor extends Executor
   {
       
      
      private var _finalHandler:Function;
      
      public function BlockingExecutor()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:Object = null;
         var _loc2_:ICommand = null;
         if(false)
         {
            if(this._finalHandler != null)
            {
               this._finalHandler(data);
            }
            _responder.result(new EntityEvent(data));
         }
         else
         {
            _loc1_ = q.shift();
            if(_loc1_ is ICommand)
            {
               _loc2_ = ICommand(_loc1_);
               _loc2_.responder = this;
               _loc2_.execute();
            }
            else if(_loc1_ is Function)
            {
               _loc1_(lastResult);
               this.result(lastResult);
            }
         }
      }
      
      public function set finalHandler(param1:Function) : void
      {
         this._finalHandler = param1;
      }
      
      public function addFunction(param1:Function) : void
      {
         ++childCount;
         q.push(param1);
      }
      
      override public function result(param1:Object) : void
      {
         lastResult = param1;
         this.execute();
      }
   }
}
