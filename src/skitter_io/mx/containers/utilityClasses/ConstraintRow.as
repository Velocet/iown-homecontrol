package mx.containers.utilityClasses
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.IInvalidating;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   
   public class ConstraintRow extends EventDispatcher implements IMXMLObject
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _container:IInvalidating;
      
      mx_internal var _height:Number;
      
      private var _explicitMinHeight:Number;
      
      private var _y:Number;
      
      private var _percentHeight:Number;
      
      private var _explicitMaxHeight:Number;
      
      mx_internal var contentSize:Boolean = false;
      
      private var _explicitHeight:Number;
      
      private var _id:String;
      
      public function ConstraintRow()
      {
         super();
      }
      
      public function get container() : IInvalidating
      {
         return _container;
      }
      
      public function set container(param1:IInvalidating) : void
      {
         _container = param1;
      }
      
      public function set y(param1:Number) : void
      {
         if(param1 != _y)
         {
            _y = param1;
            dispatchEvent(new Event("yChanged"));
         }
      }
      
      public function set height(param1:Number) : void
      {
         if(explicitHeight != param1)
         {
            explicitHeight = param1;
            if(mx_internal::_height != param1)
            {
               mx_internal::_height = param1;
               if(container)
               {
                  container.invalidateSize();
                  container.invalidateDisplayList();
               }
               dispatchEvent(new Event("heightChanged"));
            }
         }
      }
      
      public function set maxHeight(param1:Number) : void
      {
         if(_explicitMaxHeight != param1)
         {
            _explicitMaxHeight = param1;
            if(container)
            {
               container.invalidateSize();
               container.invalidateDisplayList();
            }
            dispatchEvent(new Event("maxHeightChanged"));
         }
      }
      
      public function setActualHeight(param1:Number) : void
      {
         if(mx_internal::_height != param1)
         {
            mx_internal::_height = param1;
            dispatchEvent(new Event("heightChanged"));
         }
      }
      
      [Bindable("minHeightChanged")]
      public function get minHeight() : Number
      {
         return _explicitMinHeight;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function set percentHeight(param1:Number) : void
      {
         if(_percentHeight == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _explicitHeight = NaN;
         }
         _percentHeight = param1;
         if(container)
         {
            container.invalidateSize();
            container.invalidateDisplayList();
         }
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.id = param2;
         if(!this.height && !this.percentHeight)
         {
            mx_internal::contentSize = true;
         }
      }
      
      [Bindable("percentHeightChanged")]
      public function get percentHeight() : Number
      {
         return _percentHeight;
      }
      
      [Bindable("heightChanged")]
      public function get height() : Number
      {
         return mx_internal::_height;
      }
      
      [Bindable("maxHeightChanged")]
      public function get maxHeight() : Number
      {
         return _explicitMaxHeight;
      }
      
      public function set minHeight(param1:Number) : void
      {
         if(_explicitMinHeight != param1)
         {
            _explicitMinHeight = param1;
            if(container)
            {
               container.invalidateSize();
               container.invalidateDisplayList();
            }
            dispatchEvent(new Event("minHeightChanged"));
         }
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      [Bindable("yChanged")]
      public function get y() : Number
      {
         return _y;
      }
      
      [Bindable("explicitHeightChanged")]
      public function get explicitHeight() : Number
      {
         return _explicitHeight;
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         if(_explicitHeight == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _percentHeight = NaN;
         }
         _explicitHeight = param1;
         if(container)
         {
            container.invalidateSize();
            container.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitHeightChanged"));
      }
   }
}
