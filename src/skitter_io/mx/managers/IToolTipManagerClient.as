package mx.managers
{
   import mx.core.IFlexDisplayObject;
   
   public interface IToolTipManagerClient extends IFlexDisplayObject
   {
       
      
      function get toolTip() : String;
      
      function set toolTip(param1:String) : void;
   }
}
