package mx.collections
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.collections.errors.SortError;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.utils.ObjectUtil;
   
   public class SortField extends EventDispatcher
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
       
      
      private var _caseInsensitive:Boolean;
      
      private var _numeric:Object;
      
      private var _descending:Boolean;
      
      private var _compareFunction:Function;
      
      private var _usingCustomCompareFunction:Boolean;
      
      private var _name:String;
      
      private var resourceManager:IResourceManager;
      
      public function SortField(param1:String = null, param2:Boolean = false, param3:Boolean = false, param4:Object = null)
      {
         resourceManager = ResourceManager.getInstance();
         super();
         _name = param1;
         _caseInsensitive = param2;
         _descending = param3;
         _numeric = param4;
         _compareFunction = stringCompare;
      }
      
      [Bindable("caseInsensitiveChanged")]
      public function get caseInsensitive() : Boolean
      {
         return _caseInsensitive;
      }
      
      mx_internal function get usingCustomCompareFunction() : Boolean
      {
         return _usingCustomCompareFunction;
      }
      
      public function set caseInsensitive(param1:Boolean) : void
      {
         if(param1 != _caseInsensitive)
         {
            _caseInsensitive = param1;
            dispatchEvent(new Event("caseInsensitiveChanged"));
         }
      }
      
      [Bindable("nameChanged")]
      public function get name() : String
      {
         return _name;
      }
      
      [Bindable("numericChanged")]
      public function get numeric() : Object
      {
         return _numeric;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
         dispatchEvent(new Event("nameChanged"));
      }
      
      private function numericCompare(param1:Object, param2:Object) : int
      {
         var fa:Number = NaN;
         var fb:Number = NaN;
         var a:Object = param1;
         var b:Object = param2;
         try
         {
            fa = _name == null ? Number(a) : Number(a[_name]);
         }
         catch(error:Error)
         {
         }
         try
         {
            fb = _name == null ? Number(b) : Number(b[_name]);
         }
         catch(error:Error)
         {
         }
         return ObjectUtil.numericCompare(fa,fb);
      }
      
      public function set numeric(param1:Object) : void
      {
         if(_numeric != param1)
         {
            _numeric = param1;
            dispatchEvent(new Event("numericChanged"));
         }
      }
      
      private function stringCompare(param1:Object, param2:Object) : int
      {
         var fa:String = null;
         var fb:String = null;
         var a:Object = param1;
         var b:Object = param2;
         try
         {
            fa = _name == null ? String(a) : String(a[_name]);
         }
         catch(error:Error)
         {
         }
         try
         {
            fb = _name == null ? String(b) : String(b[_name]);
         }
         catch(error:Error)
         {
         }
         return ObjectUtil.stringCompare(fa,fb,_caseInsensitive);
      }
      
      public function get compareFunction() : Function
      {
         return _compareFunction;
      }
      
      public function reverse() : void
      {
         descending = !descending;
      }
      
      mx_internal function getArraySortOnOptions() : int
      {
         if(mx_internal::usingCustomCompareFunction || name == null || _compareFunction == xmlCompare || _compareFunction == dateCompare)
         {
            return -1;
         }
         var _loc1_:* = 0;
         if(caseInsensitive)
         {
            _loc1_ |= 0;
         }
         if(descending)
         {
            _loc1_ |= 0;
         }
         if(numeric == true || _compareFunction == numericCompare)
         {
            _loc1_ |= 0;
         }
         return _loc1_;
      }
      
      private function dateCompare(param1:Object, param2:Object) : int
      {
         var fa:Date = null;
         var fb:Date = null;
         var a:Object = param1;
         var b:Object = param2;
         try
         {
            fa = _name == null ? a as Date : a[_name] as Date;
         }
         catch(error:Error)
         {
         }
         try
         {
            fb = _name == null ? b as Date : b[_name] as Date;
         }
         catch(error:Error)
         {
         }
         return ObjectUtil.dateCompare(fa,fb);
      }
      
      mx_internal function internalCompare(param1:Object, param2:Object) : int
      {
         var _loc3_:int = compareFunction(param1,param2);
         if(descending)
         {
            _loc3_ *= -1;
         }
         return _loc3_;
      }
      
      override public function toString() : String
      {
         return ObjectUtil.toString(this);
      }
      
      private function nullCompare(param1:Object, param2:Object) : int
      {
         var typeLeft:String;
         var typeRight:String;
         var value:Object = null;
         var left:Object = null;
         var right:Object = null;
         var message:String = null;
         var a:Object = param1;
         var b:Object = param2;
         var found:Boolean = false;
         if(a == null && b == null)
         {
            return 0;
         }
         if(_name)
         {
            try
            {
               left = a[_name];
            }
            catch(error:Error)
            {
            }
            try
            {
               right = b[_name];
            }
            catch(error:Error)
            {
            }
         }
         if(left == null && right == null)
         {
            return 0;
         }
         if(left == null && !_name)
         {
            left = a;
         }
         if(right == null && !_name)
         {
            right = b;
         }
         typeLeft = typeof left;
         typeRight = typeof right;
         if(typeLeft == "string" || typeRight == "string")
         {
            found = true;
            _compareFunction = stringCompare;
         }
         else if(typeLeft == "object" || typeRight == "object")
         {
            if(left is Date || right is Date)
            {
               found = true;
               _compareFunction = dateCompare;
            }
         }
         else if(typeLeft == "xml" || typeRight == "xml")
         {
            found = true;
            _compareFunction = xmlCompare;
         }
         else if(typeLeft == "number" || typeRight == "number" || typeLeft == "boolean" || typeRight == "boolean")
         {
            found = true;
            _compareFunction = numericCompare;
         }
         if(found)
         {
            return _compareFunction(left,right);
         }
         message = String(resourceManager.getString("collections","noComparatorSortField",[name]));
         throw new SortError(message);
      }
      
      public function set descending(param1:Boolean) : void
      {
         if(_descending != param1)
         {
            _descending = param1;
            dispatchEvent(new Event("descendingChanged"));
         }
      }
      
      mx_internal function initCompare(param1:Object) : void
      {
         var value:Object = null;
         var typ:String = null;
         var test:String = null;
         var obj:Object = param1;
         if(!mx_internal::usingCustomCompareFunction)
         {
            if(numeric == true)
            {
               _compareFunction = numericCompare;
            }
            else if(caseInsensitive || numeric == false)
            {
               _compareFunction = stringCompare;
            }
            else
            {
               if(_name)
               {
                  try
                  {
                     value = obj[_name];
                  }
                  catch(error:Error)
                  {
                  }
               }
               if(value == null)
               {
                  value = obj;
               }
               typ = typeof value;
               switch(typ)
               {
                  case "string":
                     _compareFunction = stringCompare;
                     break;
                  case "object":
                     if(value is Date)
                     {
                        _compareFunction = dateCompare;
                     }
                     else
                     {
                        _compareFunction = stringCompare;
                        try
                        {
                           test = String(value.toString());
                        }
                        catch(error2:Error)
                        {
                        }
                        if(!test || test == "[object Object]")
                        {
                           _compareFunction = nullCompare;
                        }
                     }
                     break;
                  case "xml":
                     _compareFunction = xmlCompare;
                     break;
                  case "boolean":
                  case "number":
                     _compareFunction = numericCompare;
               }
            }
         }
      }
      
      [Bindable("descendingChanged")]
      public function get descending() : Boolean
      {
         return _descending;
      }
      
      public function set compareFunction(param1:Function) : void
      {
         _compareFunction = param1;
         _usingCustomCompareFunction = param1 != null;
      }
      
      private function xmlCompare(param1:Object, param2:Object) : int
      {
         var sa:String = null;
         var sb:String = null;
         var a:Object = param1;
         var b:Object = param2;
         try
         {
            sa = _name == null ? String(a.toString()) : String(a[_name].toString());
         }
         catch(error:Error)
         {
         }
         try
         {
            sb = _name == null ? String(b.toString()) : String(b[_name].toString());
         }
         catch(error:Error)
         {
         }
         if(numeric == true)
         {
            return ObjectUtil.numericCompare(parseFloat(sa),parseFloat(sb));
         }
         return ObjectUtil.stringCompare(sa,sb,_caseInsensitive);
      }
   }
}
