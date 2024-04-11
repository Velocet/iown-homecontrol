package com.scenarioLauncher.datamodel
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class RemoteItem implements IEventDispatcher
   {
      
      private static var _341605641remoteJImage:Class = RemoteItem_remoteJImage;
      
      private static var _284347339remoteLImage:Class = RemoteItem_remoteLImage;
      
      private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
      
      private static var _570638849remoteBImage:Class = RemoteItem_remoteBImage;
      
      private static var _427493094remoteGImage:Class = RemoteItem_remoteGImage;
      
      private static var _312976490remoteKImage:Class = RemoteItem_remoteKImage;
      
      private static var _484751396remoteEImage:Class = RemoteItem_remoteEImage;
      
      private static var _398863943remoteHImage:Class = RemoteItem_remoteHImage;
      
      private static var _255718188remoteMImage:Class = RemoteItem_remoteMImage;
      
      private static var _513380547remoteDImage:Class = RemoteItem_remoteDImage;
      
      private static var _370234792remoteIImage:Class = RemoteItem_remoteIImage;
      
      private static var _542009698remoteCImage:Class = RemoteItem_remoteCImage;
      
      private static var _227089037remoteNImage:Class = RemoteItem_remoteNImage;
      
      private static var _456122245remoteFImage:Class = RemoteItem_remoteFImage;
      
      private static var _599268000remoteAImage:Class = RemoteItem_remoteAImage;
       
      
      public var remoteImageClass:String;
      
      public var remoteName:String = "N/A";
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function RemoteItem(param1:String, param2:String)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.remoteImageClass = param2;
         this.remoteName = param1;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteNImage() : Class
      {
         return RemoteItem._227089037remoteNImage;
      }
      
      public static function get staticEventDispatcher() : IEventDispatcher
      {
         return _staticBindingEventDispatcher;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteKImage() : Class
      {
         return RemoteItem._312976490remoteKImage;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteGImage() : Class
      {
         return RemoteItem._427493094remoteGImage;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteCImage() : Class
      {
         return RemoteItem._542009698remoteCImage;
      }
      
      private static function set remoteMImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._255718188remoteMImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._255718188remoteMImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteMImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteKImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._312976490remoteKImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._312976490remoteKImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteKImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteIImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._370234792remoteIImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._370234792remoteIImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteIImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteGImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._427493094remoteGImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._427493094remoteGImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteGImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteLImage() : Class
      {
         return RemoteItem._284347339remoteLImage;
      }
      
      private static function set remoteEImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._484751396remoteEImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._484751396remoteEImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteEImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteHImage() : Class
      {
         return RemoteItem._398863943remoteHImage;
      }
      
      private static function set remoteCImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._542009698remoteCImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._542009698remoteCImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteCImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteDImage() : Class
      {
         return RemoteItem._513380547remoteDImage;
      }
      
      private static function set remoteAImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._599268000remoteAImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._599268000remoteAImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteAImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteIImage() : Class
      {
         return RemoteItem._370234792remoteIImage;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteMImage() : Class
      {
         return RemoteItem._255718188remoteMImage;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteAImage() : Class
      {
         return RemoteItem._599268000remoteAImage;
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteEImage() : Class
      {
         return RemoteItem._484751396remoteEImage;
      }
      
      private static function set remoteLImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._284347339remoteLImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._284347339remoteLImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteLImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteNImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._227089037remoteNImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._227089037remoteNImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteNImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteHImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._398863943remoteHImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._398863943remoteHImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteHImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteJImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._341605641remoteJImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._341605641remoteJImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteJImage",_loc2_,param1));
            }
         }
      }
      
      private static function set remoteFImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._456122245remoteFImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._456122245remoteFImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteFImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteJImage() : Class
      {
         return RemoteItem._341605641remoteJImage;
      }
      
      private static function set remoteDImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._513380547remoteDImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._513380547remoteDImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteDImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteFImage() : Class
      {
         return RemoteItem._456122245remoteFImage;
      }
      
      private static function set remoteBImage(param1:Class) : void
      {
         var _loc3_:IEventDispatcher = null;
         var _loc2_:Object = RemoteItem._570638849remoteBImage;
         if(_loc2_ !== param1)
         {
            RemoteItem._570638849remoteBImage = param1;
            _loc3_ = RemoteItem.staticEventDispatcher;
            if(_loc3_ != null)
            {
               _loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(RemoteItem,"remoteBImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private static function get remoteBImage() : Class
      {
         return RemoteItem._570638849remoteBImage;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
      
      public function get imageClass() : Class
      {
         var _loc1_:Class = null;
         switch(this.remoteImageClass.toLowerCase())
         {
            case "remotea":
               _loc1_ = remoteAImage;
               break;
            case "remoteb":
               _loc1_ = remoteBImage;
               break;
            case "remotec":
               _loc1_ = remoteCImage;
               break;
            case "remoted":
               _loc1_ = remoteDImage;
               break;
            case "remotee":
               _loc1_ = remoteEImage;
               break;
            case "remotef":
               _loc1_ = remoteFImage;
               break;
            case "remoteg":
               _loc1_ = remoteGImage;
               break;
            case "remoteh":
               _loc1_ = remoteHImage;
               break;
            case "remotei":
               _loc1_ = remoteIImage;
               break;
            case "remotej":
               _loc1_ = remoteJImage;
               break;
            case "remotek":
               _loc1_ = remoteKImage;
               break;
            case "remotel":
               _loc1_ = remoteLImage;
               break;
            case "remotem":
               _loc1_ = remoteMImage;
               break;
            case "remoten":
               _loc1_ = remoteNImage;
         }
         return _loc1_;
      }
   }
}
