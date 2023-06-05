package nz.co.codec.flexorm
{
   import mx.rpc.IResponder;
   
   public class Executor implements IExecutor
   {
       
      
      protected var _responder:IResponder;
      
      private var _data:Object;
      
      private var _debugLevel:int;
      
      private var _workingStorage:Object;
      
      private var _id;
      
      protected var childCount:int;
      
      protected var lastResult:Object;
      
      private var _label:String;
      
      protected var q:Array;
      
      public function Executor()
      {
         super();
         this._workingStorage = {};
         this._debugLevel = 0;
         this.childCount = 0;
         this.q = [];
      }
      
      public function set responder(param1:IResponder) : void
      {
         this._responder = param1;
      }
      
      internal function set workingStorage(param1:Object) : void
      {
         this._workingStorage = param1;
      }
      
      public function get id() : *
      {
         return this._id;
      }
      
      public function result(param1:Object) : void
      {
      }
      
      public function add(param1:ICommand, param2:Function = null) : void
      {
         ++this.childCount;
         this.q.push(param1);
         if(param2 != null)
         {
            ++this.childCount;
            this.q.push(param2);
         }
      }
      
      public function fault(param1:Object) : void
      {
         this._responder.fault(param1);
      }
      
      public function branchNonBlocking() : NonBlockingExecutor
      {
         var _loc1_:NonBlockingExecutor = new NonBlockingExecutor();
         _loc1_.workingStorage = this._workingStorage;
         _loc1_.debugLevel = this._debugLevel;
         this.add(_loc1_);
         return _loc1_;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set id(param1:*) : void
      {
         this._id = param1;
      }
      
      public function get parent() : IExecutor
      {
         return this._responder is IExecutor ? IExecutor(this._responder) : null;
      }
      
      public function getProperty(param1:String) : *
      {
         return this._workingStorage[param1];
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function setProperty(param1:String, param2:*) : void
      {
         this._workingStorage[param1] = param2;
      }
      
      public function set debugLevel(param1:int) : void
      {
         this._debugLevel = param1;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get debugLevel() : int
      {
         return this._debugLevel;
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function execute() : void
      {
      }
      
      public function branchBlocking() : BlockingExecutor
      {
         var _loc1_:BlockingExecutor = new BlockingExecutor();
         _loc1_.workingStorage = this._workingStorage;
         _loc1_.debugLevel = this._debugLevel;
         this.add(_loc1_);
         return _loc1_;
      }
   }
}
