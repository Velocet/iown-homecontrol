package mx.resources
{
   public interface IResourceBundle
   {
       
      
      function get bundleName() : String;
      
      function get content() : Object;
      
      function get locale() : String;
   }
}
