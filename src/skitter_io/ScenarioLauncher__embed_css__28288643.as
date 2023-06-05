package
{
   import com.scenarioLauncher.views.skins.ProgressBarBorderSkin;
   import mx.core.IBorder;
   import mx.core.IFlexAsset;
   import mx.core.IFlexDisplayObject;
   import mx.utils.NameUtil;
   
   public class ScenarioLauncher__embed_css__28288643 extends ProgressBarBorderSkin implements IBorder, IFlexAsset, IFlexDisplayObject
   {
       
      
      public function ScenarioLauncher__embed_css__28288643()
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
