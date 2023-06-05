package nz.co.codec.flexorm.util
{
   public class Stack
   {
       
      
      private var data:Array;
      
      public function Stack()
      {
         super();
         this.data = [];
      }
      
      public function pop() : Object
      {
         return this.data.pop();
      }
      
      public function push(param1:Object) : void
      {
         this.data.push(param1);
      }
      
      public function getLastItem() : Object
      {
         return this.data[this.data.length - 1];
      }
   }
}
