package mx.events
{
   import mx.core.mx_internal;
   
   public final class CollectionEventKind
   {
      
      public static const ADD:String = "add";
      
      public static const REMOVE:String = "remove";
      
      public static const UPDATE:String = "update";
      
      public static const MOVE:String = "move";
      
      mx_internal static const EXPAND:String = "expand";
      
      public static const REPLACE:String = "replace";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const REFRESH:String = "refresh";
      
      public static const RESET:String = "reset";
       
      
      public function CollectionEventKind()
      {
         super();
      }
   }
}
