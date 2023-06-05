package mx.core
{
   import flash.display.Sprite;
   import mx.utils.NameUtil;
   
   public class FlexSprite extends Sprite
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function FlexSprite()
      {
         super();
         try
         {
            name = NameUtil.createUniqueName(this);
         }
         catch(e:Error)
         {
         }
      }
      
      override public function toString() : String
      {
         return NameUtil.displayObjectToString(this);
      }
   }
}
