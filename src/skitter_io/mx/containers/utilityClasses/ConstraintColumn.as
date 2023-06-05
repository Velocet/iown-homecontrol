package mx.containers.utilityClasses
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.IInvalidating;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   
   public class ConstraintColumn extends EventDispatcher implements IMXMLObject
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _container:IInvalidating;
      
      private var _explicitMinWidth:Number;
      
      mx_internal var _width:Number;
      
      mx_internal var contentSize:Boolean = false;
      
      private var _percentWidth:Number;
      
      private var _explicitWidth:Number;
      
      private var _explicitMaxWidth:Number;
      
      private var _x:Number;
      
      private var _id:String;
      
      public function ConstraintColumn()
      {
         super();
      }
      
      public function get container() : IInvalidating
      {
         return _container;
      }
      
      [Bindable("widthChanged")]
      public function get width() : Number
      {
         return mx_internal::_width;
      }
      
      [Bindable("percentWidthChanged")]
      public function get percentWidth() : Number
      {
         return _percentWidth;
      }
      
      public function set container(param1:IInvalidating) : void
      {
         _container = param1;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         if(_explicitMaxWidth != param1)
         {
            _explicitMaxWidth = param1;
            if(container)
            {
               container.invalidateSize();
               container.invalidateDisplayList();
            }
            dispatchEvent(new Event("maxWidthChanged"));
         }
      }
      
      public function set width(param1:Number) : void
      {
         if(explicitWidth != param1)
         {
            explicitWidth = param1;
            if(mx_internal::_width != param1)
            {
               mx_internal::_width = param1;
               if(container)
               {
                  container.invalidateSize();
                  container.invalidateDisplayList();
               }
               dispatchEvent(new Event("widthChanged"));
            }
         }
      }
      
      [Bindable("maxWidthChanged")]
      public function get maxWidth() : Number
      {
         return _explicitMaxWidth;
      }
      
      [Bindable("minWidthChanged")]
      public function get minWidth() : Number
      {
         return _explicitMinWidth;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function initialized(param1:Object, param2:String) : void
      {
         this.id = param2;
         if(!this.width && !this.percentWidth)
         {
            mx_internal::contentSize = true;
         }
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         if(_explicitWidth == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _percentWidth = NaN;
         }
         _explicitWidth = param1;
         if(container)
         {
            container.invalidateSize();
            container.invalidateDisplayList();
         }
         dispatchEvent(new Event("explicitWidthChanged"));
      }
      
      public function setActualWidth(param1:Number) : void
      {
         if(mx_internal::_width != param1)
         {
            mx_internal::_width = param1;
            dispatchEvent(new Event("widthChanged"));
         }
      }
      
      public function set minWidth(param1:Number) : void
      {
         if(_explicitMinWidth != param1)
         {
            _explicitMinWidth = param1;
            if(container)
            {
               container.invalidateSize();
               container.invalidateDisplayList();
            }
            dispatchEvent(new Event("minWidthChanged"));
         }
      }
      
      public function set percentWidth(param1:Number) : void
      {
         if(_percentWidth == param1)
         {
            return;
         }
         if(!isNaN(param1))
         {
            _explicitWidth = NaN;
         }
         _percentWidth = param1;
         if(container)
         {
            container.invalidateSize();
            container.invalidateDisplayList();
         }
         dispatchEvent(new Event("percentWidthChanged"));
      }
      
      public function set x(param1:Number) : void
      {
         if(param1 != _x)
         {
            _x = param1;
            dispatchEvent(new Event("xChanged"));
         }
      }
      
      [Bindable("explicitWidthChanged")]
      public function get explicitWidth() : Number
      {
         return _explicitWidth;
      }
      
      public function set id(param1:String) : void
      {
         _id = param1;
      }
      
      [Bindable("xChanged")]
      public function get x() : Number
      {
         return _x;
      }
   }
}
