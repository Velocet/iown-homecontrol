package mx.collections
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.IExternalizable;
   import mx.core.mx_internal;
   
   public class ArrayCollection extends ListCollectionView implements IExternalizable
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function ArrayCollection(param1:Array = null)
      {
         super();
         this.source = param1;
      }
      
      public function set source(param1:Array) : void
      {
         list = new ArrayList(param1);
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         if(list is IExternalizable)
         {
            IExternalizable(list).readExternal(param1);
         }
         else
         {
            source = param1.readObject() as Array;
         }
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         if(list is IExternalizable)
         {
            IExternalizable(list).writeExternal(param1);
         }
         else
         {
            param1.writeObject(source);
         }
      }
      
      [Bindable("listChanged")]
      public function get source() : Array
      {
         if(Boolean(list) && list is ArrayList)
         {
            return ArrayList(list).source;
         }
         return null;
      }
   }
}
