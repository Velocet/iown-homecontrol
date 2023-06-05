package
{
   import mx.core.EdgeMetrics;
   import mx.core.IBorder;
   import mx.core.IFlexAsset;
   import mx.core.IFlexDisplayObject;
   import mx.utils.NameUtil;
   
   public class ScenarioLauncher__embed_css__599586122 extends rightArrow implements IBorder, IFlexAsset, IFlexDisplayObject
   {
       
      
      public function ScenarioLauncher__embed_css__599586122()
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
      
      public function get borderMetrics() : EdgeMetrics
      {
         if(scale9Grid == null)
         {
            return EdgeMetrics.EMPTY;
         }
         return new EdgeMetrics(scale9Grid.left,scale9Grid.top,Math.ceil(measuredWidth - 0),Math.ceil(measuredHeight - 0));
      }
   }
}
