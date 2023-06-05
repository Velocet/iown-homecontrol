package mx.collections
{
   import mx.core.mx_internal;
   
   public class XMLListCollection extends ListCollectionView
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      public function XMLListCollection(param1:XMLList = null)
      {
         super();
         this.source = param1;
      }
      
      public function child(param1:Object) : XMLList
      {
         var propertyName:Object = param1;
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.child(propertyName);
         });
      }
      
      private function execXMLListFunction(param1:Function) : XMLList
      {
         var _loc2_:int = 0;
         var _loc3_:XMLList = null;
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         if(!localIndex)
         {
            return param1(source);
         }
         _loc2_ = 0;
         _loc3_ = new XMLList("");
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = localIndex[_loc4_];
            _loc3_ += param1(_loc5_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      override public function toString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(!localIndex)
         {
            return source.toString();
         }
         _loc1_ = "";
         _loc2_ = 0;
         while(_loc2_ < localIndex.length)
         {
            if(_loc2_ > 0)
            {
               _loc1_ += "\n";
            }
            _loc1_ += localIndex[_loc2_].toString();
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function text() : XMLList
      {
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.text();
         });
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(!localIndex)
         {
            return source.toXMLString();
         }
         _loc1_ = "";
         _loc2_ = 0;
         while(_loc2_ < localIndex.length)
         {
            if(_loc2_ > 0)
            {
               _loc1_ += "\n";
            }
            _loc1_ += localIndex[_loc2_].toXMLString();
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function copy() : XMLList
      {
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return XMLList(param1.copy());
         });
      }
      
      public function set source(param1:XMLList) : void
      {
         if(list)
         {
            XMLListAdapter(list).source = null;
         }
         list = new XMLListAdapter(param1);
      }
      
      public function attributes() : XMLList
      {
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.attributes();
         });
      }
      
      [Bindable("listChanged")]
      public function get source() : XMLList
      {
         return !!list ? XMLListAdapter(list).source : null;
      }
      
      public function attribute(param1:Object) : XMLList
      {
         var attributeName:Object = param1;
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.attribute(attributeName);
         });
      }
      
      public function descendants(param1:Object = "*") : XMLList
      {
         var name:Object = param1;
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.descendants(name);
         });
      }
      
      public function elements(param1:String = "*") : XMLList
      {
         var name:String = param1;
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.elements(name);
         });
      }
      
      public function children() : XMLList
      {
         return execXMLListFunction(function(param1:Object):XMLList
         {
            return param1.children();
         });
      }
   }
}
