package mx.controls.listClasses
{
   import flash.events.IEventDispatcher;
   import mx.core.IDataRenderer;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.managers.ILayoutManagerClient;
   import mx.styles.ISimpleStyleClient;
   
   public interface IListItemRenderer extends IDataRenderer, IEventDispatcher, IFlexDisplayObject, ILayoutManagerClient, ISimpleStyleClient, IUIComponent
   {
       
   }
}
