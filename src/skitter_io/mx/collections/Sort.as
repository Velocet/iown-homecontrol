package mx.collections
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.collections.errors.SortError;
   import mx.core.mx_internal;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.utils.ObjectUtil;
   
   public class Sort extends EventDispatcher
   {
      
      public static const ANY_INDEX_MODE:String = "any";
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      public static const LAST_INDEX_MODE:String = "last";
      
      public static const FIRST_INDEX_MODE:String = "first";
       
      
      private var noFieldsDescending:Boolean = false;
      
      private var usingCustomCompareFunction:Boolean;
      
      private var defaultEmptyField:mx.collections.SortField;
      
      private var _fields:Array;
      
      private var _compareFunction:Function;
      
      private var _unique:Boolean;
      
      private var fieldList:Array;
      
      private var resourceManager:IResourceManager;
      
      public function Sort()
      {
         resourceManager = ResourceManager.getInstance();
         fieldList = [];
         super();
      }
      
      public function get unique() : Boolean
      {
         return _unique;
      }
      
      public function get compareFunction() : Function
      {
         return usingCustomCompareFunction ? _compareFunction : internalCompare;
      }
      
      public function set unique(param1:Boolean) : void
      {
         _unique = param1;
      }
      
      public function sort(param1:Array) : void
      {
         var fixedCompareFunction:Function = null;
         var message:String = null;
         var uniqueRet1:Object = null;
         var fields:Array = null;
         var i:int = 0;
         var sortArgs:Object = null;
         var uniqueRet2:Object = null;
         var items:Array = param1;
         if(!items || items.length <= 1)
         {
            return;
         }
         if(usingCustomCompareFunction)
         {
            fixedCompareFunction = function(param1:Object, param2:Object):int
            {
               return compareFunction(param1,param2,_fields);
            };
            if(unique)
            {
               uniqueRet1 = items.sort(fixedCompareFunction,Array.UNIQUESORT);
               if(uniqueRet1 == 0)
               {
                  message = String(resourceManager.getString("collections","nonUnique"));
                  throw new SortError(message);
               }
            }
            else
            {
               items.sort(fixedCompareFunction);
            }
         }
         else
         {
            fields = this.fields;
            if(Boolean(fields) && fields.length > 0)
            {
               sortArgs = initSortFields(items[0],true);
               if(unique)
               {
                  if(Boolean(sortArgs) && fields.length == 1)
                  {
                     uniqueRet2 = items.sortOn(sortArgs.fields[0],sortArgs.options[0] | 0);
                  }
                  else
                  {
                     uniqueRet2 = items.sort(internalCompare,Array.UNIQUESORT);
                  }
                  if(uniqueRet2 == 0)
                  {
                     message = String(resourceManager.getString("collections","nonUnique"));
                     throw new SortError(message);
                  }
               }
               else if(sortArgs)
               {
                  items.sortOn(sortArgs.fields,sortArgs.options);
               }
               else
               {
                  items.sort(internalCompare);
               }
            }
            else
            {
               items.sort(internalCompare);
            }
         }
      }
      
      public function propertyAffectsSort(param1:String) : Boolean
      {
         var _loc3_:mx.collections.SortField = null;
         if(usingCustomCompareFunction || !fields)
         {
            return true;
         }
         var _loc2_:int = 0;
         while(_loc2_ < fields.length)
         {
            _loc3_ = fields[_loc2_];
            if(_loc3_.name == param1 || _loc3_.mx_internal::usingCustomCompareFunction)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function internalCompare(param1:Object, param2:Object, param3:Array = null) : int
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:mx.collections.SortField = null;
         var _loc4_:int = 0;
         if(!_fields)
         {
            _loc4_ = noFieldsCompare(param1,param2);
         }
         else
         {
            _loc5_ = 0;
            _loc6_ = !!param3 ? int(param3.length) : int(_fields.length);
            while(_loc4_ == 0 && _loc5_ < _loc6_)
            {
               _loc4_ = (_loc7_ = SortField(_fields[_loc5_])).mx_internal::internalCompare(param1,param2);
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      public function reverse() : void
      {
         var _loc1_:int = 0;
         if(fields)
         {
            _loc1_ = 0;
            while(_loc1_ < fields.length)
            {
               SortField(fields[_loc1_]).reverse();
               _loc1_++;
            }
         }
         noFieldsDescending = !noFieldsDescending;
      }
      
      private function noFieldsCompare(param1:Object, param2:Object, param3:Array = null) : int
      {
         var result:int;
         var message:String = null;
         var a:Object = param1;
         var b:Object = param2;
         var fields:Array = param3;
         if(!defaultEmptyField)
         {
            defaultEmptyField = new mx.collections.SortField();
            try
            {
               defaultEmptyField.mx_internal::initCompare(a);
            }
            catch(e:SortError)
            {
               message = String(resourceManager.getString("collections","noComparator",[a]));
               throw new SortError(message);
            }
         }
         result = defaultEmptyField.compareFunction(a,b);
         if(noFieldsDescending)
         {
            result *= -1;
         }
         return result;
      }
      
      public function findItem(param1:Array, param2:Object, param3:String, param4:Boolean = false, param5:Function = null) : int
      {
         var found:Boolean;
         var lowerBound:int;
         var objFound:Boolean;
         var obj:Object;
         var upperBound:int;
         var direction:int;
         var compareForFind:Function = null;
         var fieldsForCompare:Array = null;
         var message:String = null;
         var index:int = 0;
         var fieldName:String = null;
         var hadPreviousFieldName:Boolean = false;
         var i:int = 0;
         var hasFieldName:Boolean = false;
         var objIndex:int = 0;
         var match:Boolean = false;
         var prevCompare:int = 0;
         var nextCompare:int = 0;
         var items:Array = param1;
         var values:Object = param2;
         var mode:String = param3;
         var returnInsertionIndex:Boolean = param4;
         var compareFunction:Function = param5;
         if(!items)
         {
            message = String(resourceManager.getString("collections","noItems"));
            throw new SortError(message);
         }
         if(items.length == 0)
         {
            return returnInsertionIndex ? 1 : -1;
         }
         if(compareFunction == null)
         {
            compareForFind = this.compareFunction;
            if(Boolean(values) && false)
            {
               fieldsForCompare = [];
               hadPreviousFieldName = true;
               i = 0;
               while(true)
               {
                  if(i < fieldList.length)
                  {
                     fieldName = "null";
                     if(fieldName)
                     {
                        try
                        {
                           hasFieldName = values[fieldName] !== undefined;
                        }
                        catch(e:Error)
                        {
                           hasFieldName = false;
                        }
                        if(hasFieldName)
                        {
                           if(!hadPreviousFieldName)
                           {
                              break;
                           }
                           fieldsForCompare.push(fieldName);
                        }
                        else
                        {
                           hadPreviousFieldName = false;
                        }
                     }
                     else
                     {
                        fieldsForCompare.push(null);
                     }
                     continue;
                  }
                  if(fieldsForCompare.length == 0)
                  {
                     message = String(resourceManager.getString("collections","findRestriction"));
                     throw new SortError(message);
                  }
                  try
                  {
                     initSortFields(items[0]);
                  }
                  catch(initSortError:SortError)
                  {
                  }
               }
               message = String(resourceManager.getString("collections","findCondition",[fieldName]));
               throw new SortError(message);
            }
         }
         else
         {
            compareForFind = compareFunction;
         }
         found = false;
         objFound = false;
         index = 0;
         lowerBound = 0;
         upperBound = int(items.length - 1);
         obj = null;
         direction = 1;
         while(!objFound && lowerBound <= upperBound)
         {
            index = Math.round((lowerBound + upperBound) / 2);
            obj = items[index];
            direction = !!fieldsForCompare ? compareForFind(values,obj,fieldsForCompare) : compareForFind(values,obj);
            switch(direction)
            {
               case -1:
                  upperBound = index - 1;
                  break;
               case 0:
                  objFound = true;
                  switch(mode)
                  {
                     case ANY_INDEX_MODE:
                        found = true;
                        break;
                     case FIRST_INDEX_MODE:
                        found = index == lowerBound;
                        objIndex = index - 1;
                        match = true;
                        while(match && !found && objIndex >= lowerBound)
                        {
                           obj = items[objIndex];
                           prevCompare = !!fieldsForCompare ? compareForFind(values,obj,fieldsForCompare) : compareForFind(values,obj);
                           match = prevCompare == 0;
                           if(!match || match && objIndex == lowerBound)
                           {
                              found = true;
                              index = objIndex + (match ? 0 : 1);
                           }
                           objIndex--;
                        }
                        break;
                     case LAST_INDEX_MODE:
                        found = index == upperBound;
                        objIndex = index + 1;
                        match = true;
                        while(match && !found && objIndex <= upperBound)
                        {
                           obj = items[objIndex];
                           nextCompare = !!fieldsForCompare ? compareForFind(values,obj,fieldsForCompare) : compareForFind(values,obj);
                           match = nextCompare == 0;
                           if(!match || match && objIndex == upperBound)
                           {
                              found = true;
                              index = objIndex - (match ? 0 : 1);
                           }
                           objIndex++;
                        }
                        break;
                     default:
                        message = String(resourceManager.getString("collections","unknownMode"));
                        throw new SortError(message);
                  }
                  break;
               case 1:
                  lowerBound = index + 1;
                  break;
            }
         }
         if(!found && !returnInsertionIndex)
         {
            return -1;
         }
         return direction > 0 ? index + 1 : index;
      }
      
      private function initSortFields(param1:Object, param2:Boolean = false) : Object
      {
         var _loc4_:int = 0;
         var _loc5_:mx.collections.SortField = null;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         _loc4_ = 0;
         while(_loc4_ < fields.length)
         {
            SortField(fields[_loc4_]).mx_internal::initCompare(param1);
            _loc4_++;
         }
         if(param2)
         {
            _loc3_ = {
               "options":[],
               "fields":[]
            };
            _loc4_ = 0;
            while(_loc4_ < fields.length)
            {
               if((_loc6_ = (_loc5_ = fields[_loc4_]).mx_internal::getArraySortOnOptions()) == -1)
               {
                  return null;
               }
               _loc3_.fields.push(_loc5_.name);
               _loc3_.options.push(_loc6_);
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public function set fields(param1:Array) : void
      {
         var _loc2_:mx.collections.SortField = null;
         var _loc3_:int = 0;
         _fields = param1;
         fieldList = [];
         if(_fields)
         {
            _loc3_ = 0;
            while(_loc3_ < _fields.length)
            {
               _loc2_ = SortField(_fields[_loc3_]);
               fieldList.push(_loc2_.name);
               _loc3_++;
            }
         }
         dispatchEvent(new Event("fieldsChanged"));
      }
      
      [Bindable("fieldsChanged")]
      public function get fields() : Array
      {
         return _fields;
      }
      
      public function set compareFunction(param1:Function) : void
      {
         _compareFunction = param1;
         usingCustomCompareFunction = _compareFunction != null;
      }
      
      override public function toString() : String
      {
         return ObjectUtil.toString(this);
      }
   }
}
