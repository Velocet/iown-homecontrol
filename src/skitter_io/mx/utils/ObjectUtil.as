package mx.utils
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.xml.XMLNode;
   import mx.collections.IList;
   import mx.core.mx_internal;
   
   public class ObjectUtil
   {
      
      private static var defaultToStringExcludes:Array = ["password","credentials"];
      
      private static var CLASS_INFO_CACHE:Object = {};
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var refCount:int = 0;
       
      
      public function ObjectUtil()
      {
         super();
      }
      
      public static function isSimple(param1:Object) : Boolean
      {
         var _loc2_:* = typeof param1;
         switch(_loc2_)
         {
            case "number":
            case "string":
            case "boolean":
               return true;
            case "object":
               return param1 is Date || param1 is Array;
            default:
               return false;
         }
      }
      
      private static function internalToString(param1:Object, param2:int = 0, param3:Dictionary = null, param4:Array = null, param5:Array = null) : String
      {
         var str:String = null;
         var classInfo:Object = null;
         var properties:Array = null;
         var isArray:Boolean = false;
         var isDict:Boolean = false;
         var prop:* = undefined;
         var j:int = 0;
         var id:Object = null;
         var value:Object = param1;
         var indent:int = param2;
         var refs:Dictionary = param3;
         var namespaceURIs:Array = param4;
         var exclude:Array = param5;
         var type:String = value == null ? "null" : typeof value;
         switch(type)
         {
            case "boolean":
            case "number":
               return value.toString();
            case "string":
               return "\"" + value.toString() + "\"";
            case "object":
               if(value is Date)
               {
                  return value.toString();
               }
               if(value is XMLNode)
               {
                  return value.toString();
               }
               if(value is Class)
               {
                  return "(" + getQualifiedClassName(value) + ")";
               }
               classInfo = getClassInfo(value,exclude,{
                  "includeReadOnly":true,
                  "uris":namespaceURIs
               });
               properties = classInfo.properties;
               str = "(" + classInfo.name + ")";
               if(refs == null)
               {
                  refs = new Dictionary(true);
               }
               try
               {
                  id = refs[value];
                  if(id != null)
                  {
                     str += "#" + int(id);
                     return str;
                  }
               }
               catch(e:Error)
               {
                  return String(value);
               }
               if(value != null)
               {
                  str += "#" + refCount.toString();
                  refs[value] = refCount;
                  ++refCount;
               }
               isArray = value is Array;
               isDict = value is Dictionary;
               indent += 2;
               j = 0;
               while(j < properties.length)
               {
                  str = newline(str,indent);
                  prop = properties[j];
                  if(isArray)
                  {
                     str += "[";
                  }
                  else if(isDict)
                  {
                     str += "{";
                  }
                  if(isDict)
                  {
                     str += internalToString(prop,indent,refs,namespaceURIs,exclude);
                  }
                  else
                  {
                     str += prop.toString();
                  }
                  if(isArray)
                  {
                     str += "] ";
                  }
                  else if(isDict)
                  {
                     str += "} = ";
                  }
                  else
                  {
                     str += " = ";
                  }
                  try
                  {
                     str += internalToString(value[prop],indent,refs,namespaceURIs,exclude);
                  }
                  catch(e:Error)
                  {
                     str += "?";
                  }
                  j++;
               }
               indent -= 2;
               return str;
               break;
            case "xml":
               return value.toXMLString();
            default:
               return "(" + type + ")";
         }
      }
      
      public static function getClassInfo(param1:Object, param2:Array = null, param3:Object = null) : Object
      {
         var isDict:Boolean;
         var excludeObject:Object;
         var dynamic:Boolean;
         var isArray:Boolean;
         var propertyNames:Array;
         var n:int = 0;
         var i:int = 0;
         var result:Object = null;
         var cacheKey:String = null;
         var className:String = null;
         var classAlias:String = null;
         var properties:XMLList = null;
         var prop:XML = null;
         var metadataInfo:Object = null;
         var classInfo:XML = null;
         var numericIndex:Boolean = false;
         var key:* = undefined;
         var p:String = null;
         var pi:Number = NaN;
         var uris:Array = null;
         var uri:String = null;
         var qName:QName = null;
         var j:int = 0;
         var obj:Object = param1;
         var excludes:Array = param2;
         var options:Object = param3;
         if(obj is ObjectProxy)
         {
            obj = ObjectProxy(obj).object_proxy::object;
         }
         if(options == null)
         {
            options = {
               "uris":null,
               "includeReadOnly":true,
               "includeTransient":true
            };
         }
         propertyNames = [];
         dynamic = false;
         if(typeof obj == "xml")
         {
            className = "XML";
            properties = obj.text();
            if(properties.length())
            {
               propertyNames.push("*");
            }
            properties = obj.attributes();
         }
         else
         {
            classInfo = DescribeTypeCache.describeType(obj).typeDescription;
            className = classInfo.@name.toString();
            classAlias = classInfo.@alias.toString();
            dynamic = classInfo.@isDynamic.toString() == "true";
            if(options.includeReadOnly)
            {
               properties = classInfo..accessor.(@access != "writeonly") + classInfo..variable;
            }
            else
            {
               properties = classInfo..accessor.(@access == "readwrite") + classInfo..variable;
            }
            numericIndex = false;
         }
         if(!dynamic)
         {
            cacheKey = getCacheKey(obj,excludes,options);
            result = CLASS_INFO_CACHE[cacheKey];
            if(result != null)
            {
               return result;
            }
         }
         result = {};
         result["name"] = className;
         result["alias"] = classAlias;
         result["properties"] = propertyNames;
         result["dynamic"] = dynamic;
         result["metadata"] = metadataInfo = recordMetadata(properties);
         excludeObject = {};
         if(excludes)
         {
            n = int(excludes.length);
            i = 0;
            while(i < n)
            {
               excludeObject[excludes[i]] = 1;
               i++;
            }
         }
         isArray = className == "Array";
         isDict = className == "flash.utils::Dictionary";
         if(isDict)
         {
            for(key in obj)
            {
               propertyNames.push(key);
            }
         }
         else if(dynamic)
         {
            for(p in obj)
            {
               if(excludeObject[p] != 1)
               {
                  if(isArray)
                  {
                     pi = parseInt(p);
                     if(isNaN(pi))
                     {
                        propertyNames.push(new QName("",p));
                     }
                     else
                     {
                        propertyNames.push(pi);
                     }
                  }
                  else
                  {
                     propertyNames.push(new QName("",p));
                  }
               }
            }
            numericIndex = isArray && !isNaN(Number(p));
         }
         if(!(isArray || isDict || className == "Object"))
         {
            if(className == "XML")
            {
               n = properties.length();
               i = 0;
               while(i < n)
               {
                  p = String(properties[i].name());
                  if(excludeObject[p] != 1)
                  {
                     propertyNames.push(new QName("","@" + p));
                  }
                  i++;
               }
            }
            else
            {
               n = properties.length();
               uris = options.uris;
               i = 0;
               while(i < n)
               {
                  prop = properties[i];
                  p = prop.@name.toString();
                  uri = prop.@uri.toString();
                  if(excludeObject[p] != 1)
                  {
                     if(!(!options.includeTransient && internalHasMetadata(metadataInfo,p,"Transient")))
                     {
                        if(uris != null)
                        {
                           if(uris.length == 1 && uris[0] == "*")
                           {
                              qName = new QName(uri,p);
                              try
                              {
                                 obj[qName];
                                 propertyNames.push();
                              }
                              catch(e:Error)
                              {
                              }
                           }
                           else
                           {
                              j = 0;
                              while(j < uris.length)
                              {
                                 uri = String(uris[j]);
                                 if(prop.@uri.toString() == uri)
                                 {
                                    qName = new QName(uri,p);
                                    try
                                    {
                                       obj[qName];
                                       propertyNames.push(qName);
                                    }
                                    catch(e:Error)
                                    {
                                    }
                                 }
                                 j++;
                              }
                           }
                        }
                        else if(uri.length == 0)
                        {
                           qName = new QName(uri,p);
                           try
                           {
                              obj[qName];
                              propertyNames.push(qName);
                           }
                           catch(e:Error)
                           {
                           }
                        }
                     }
                  }
                  i++;
               }
            }
         }
         propertyNames.sort(0 | (numericIndex ? Array.NUMERIC : 0));
         if(!isDict)
         {
            i = 0;
            while(i < propertyNames.length - 1)
            {
               if(propertyNames[i].toString() == propertyNames[i + 1].toString())
               {
                  propertyNames.splice(i,1);
                  i--;
               }
               i++;
            }
         }
         if(!dynamic)
         {
            cacheKey = getCacheKey(obj,excludes,options);
            CLASS_INFO_CACHE[cacheKey] = result;
         }
         return result;
      }
      
      private static function arrayCompare(param1:Array, param2:Array, param3:int, param4:int, param5:Dictionary) : int
      {
         var _loc7_:Object = null;
         var _loc6_:int = 0;
         if(param1.length != param2.length)
         {
            if(param1.length < param2.length)
            {
               _loc6_ = -1;
            }
            else
            {
               _loc6_ = 1;
            }
         }
         else
         {
            for(_loc7_ in param1)
            {
               if(!param2.hasOwnProperty(_loc7_))
               {
                  return -1;
               }
               if((_loc6_ = internalCompare(param1[_loc7_],param2[_loc7_],param3,param4,param5)) != 0)
               {
                  return _loc6_;
               }
            }
            for(_loc7_ in param2)
            {
               if(!param1.hasOwnProperty(_loc7_))
               {
                  return 1;
               }
            }
         }
         return _loc6_;
      }
      
      public static function stringCompare(param1:String, param2:String, param3:Boolean = false) : int
      {
         if(param1 == null && param2 == null)
         {
            return 0;
         }
         if(param1 == null)
         {
            return 1;
         }
         if(param2 == null)
         {
            return -1;
         }
         if(param3)
         {
            param1 = param1.toLocaleLowerCase();
            param2 = param2.toLocaleLowerCase();
         }
         var _loc4_:int;
         if((_loc4_ = param1.localeCompare(param2)) < -1)
         {
            _loc4_ = -1;
         }
         else if(_loc4_ > 1)
         {
            _loc4_ = 1;
         }
         return _loc4_;
      }
      
      public static function dateCompare(param1:Date, param2:Date) : int
      {
         if(param1 == null && param2 == null)
         {
            return 0;
         }
         if(param1 == null)
         {
            return 1;
         }
         if(param2 == null)
         {
            return -1;
         }
         var _loc3_:Number = param1.getTime();
         var _loc4_:Number = param2.getTime();
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      public static function numericCompare(param1:Number, param2:Number) : int
      {
         if(isNaN(param1) && isNaN(param2))
         {
            return 0;
         }
         if(isNaN(param1))
         {
            return 1;
         }
         if(isNaN(param2))
         {
            return -1;
         }
         if(param1 < param2)
         {
            return -1;
         }
         if(param1 > param2)
         {
            return 1;
         }
         return 0;
      }
      
      private static function newline(param1:String, param2:int = 0) : String
      {
         var _loc3_:* = param1;
         _loc3_ += "\n";
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ += " ";
            _loc4_++;
         }
         return _loc3_;
      }
      
      private static function getRef(param1:Object, param2:Dictionary) : Object
      {
         var _loc3_:Object = param2[param1];
         while(Boolean(_loc3_) && _loc3_ != param2[_loc3_])
         {
            _loc3_ = param2[_loc3_];
         }
         if(!_loc3_)
         {
            _loc3_ = param1;
         }
         if(_loc3_ != param2[param1])
         {
            param2[param1] = _loc3_;
         }
         return _loc3_;
      }
      
      private static function recordMetadata(param1:XMLList) : Object
      {
         var prop:XML = null;
         var propName:String = null;
         var metadataList:XMLList = null;
         var metadata:Object = null;
         var md:XML = null;
         var mdName:String = null;
         var argsList:XMLList = null;
         var value:Object = null;
         var arg:XML = null;
         var existing:Object = null;
         var argKey:String = null;
         var argValue:String = null;
         var existingArray:Array = null;
         var properties:XMLList = param1;
         var result:Object = null;
         try
         {
            for each(prop in properties)
            {
               propName = prop.attribute("name").toString();
               metadataList = prop.metadata;
               if(metadataList.length() > 0)
               {
                  if(result == null)
                  {
                     result = {};
                  }
                  metadata = {};
                  result[propName] = metadata;
                  for each(md in metadataList)
                  {
                     mdName = md.attribute("name").toString();
                     argsList = md.arg;
                     value = {};
                     for each(arg in argsList)
                     {
                        argKey = arg.attribute("key").toString();
                        if(argKey != null)
                        {
                           argValue = arg.attribute("value").toString();
                           value[argKey] = argValue;
                        }
                     }
                     existing = metadata[mdName];
                     if(existing != null)
                     {
                        if(existing is Array)
                        {
                           existingArray = existing as Array;
                        }
                        else
                        {
                           existingArray = [existing];
                           delete metadata[mdName];
                        }
                        existingArray.push(value);
                        existing = existingArray;
                     }
                     else
                     {
                        existing = value;
                     }
                     metadata[mdName] = existing;
                  }
               }
            }
         }
         catch(e:Error)
         {
         }
         return result;
      }
      
      public static function compare(param1:Object, param2:Object, param3:int = -1) : int
      {
         return internalCompare(param1,param2,0,param3,new Dictionary(true));
      }
      
      private static function listCompare(param1:IList, param2:IList, param3:int, param4:int, param5:Dictionary) : int
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         if(param1.length != param2.length)
         {
            if(param1.length < param2.length)
            {
               _loc6_ = -1;
            }
            else
            {
               _loc6_ = 1;
            }
         }
         else
         {
            _loc7_ = 0;
            while(_loc7_ < param1.length)
            {
               if((_loc6_ = internalCompare(param1.getItemAt(_loc7_),param2.getItemAt(_loc7_),param3 + 1,param4,param5)) != 0)
               {
                  _loc7_ = param1.length;
               }
               _loc7_++;
            }
         }
         return _loc6_;
      }
      
      private static function internalCompare(param1:Object, param2:Object, param3:int, param4:int, param5:Dictionary) : int
      {
         var result:int;
         var typeOfA:String;
         var typeOfB:String;
         var newDepth:int = 0;
         var aRef:Object = null;
         var bRef:Object = null;
         var aProps:Array = null;
         var bProps:Array = null;
         var isDynamicObject:Boolean = false;
         var propName:QName = null;
         var aProp:Object = null;
         var bProp:Object = null;
         var i:int = 0;
         var a:Object = param1;
         var b:Object = param2;
         var currentDepth:int = param3;
         var desiredDepth:int = param4;
         var refs:Dictionary = param5;
         if(a == null && b == null)
         {
            return 0;
         }
         if(a == null)
         {
            return 1;
         }
         if(b == null)
         {
            return -1;
         }
         if(a is ObjectProxy)
         {
            a = ObjectProxy(a).object_proxy::object;
         }
         if(b is ObjectProxy)
         {
            b = ObjectProxy(b).object_proxy::object;
         }
         typeOfA = typeof a;
         typeOfB = typeof b;
         result = 0;
         if(typeOfA == typeOfB)
         {
            switch(typeOfA)
            {
               case "boolean":
                  result = numericCompare(Number(a),Number(b));
                  break;
               case "number":
                  result = numericCompare(a as Number,b as Number);
                  break;
               case "string":
                  result = stringCompare(a as String,b as String);
                  break;
               case "object":
                  newDepth = desiredDepth > 0 ? desiredDepth - 1 : desiredDepth;
                  aRef = getRef(a,refs);
                  bRef = getRef(b,refs);
                  if(aRef == bRef)
                  {
                     return 0;
                  }
                  refs[bRef] = aRef;
                  if(desiredDepth != -1 && currentDepth > desiredDepth)
                  {
                     result = stringCompare(a.toString(),b.toString());
                  }
                  else if(a is Array && b is Array)
                  {
                     result = arrayCompare(a as Array,b as Array,currentDepth,desiredDepth,refs);
                  }
                  else if(a is Date && b is Date)
                  {
                     result = dateCompare(a as Date,b as Date);
                  }
                  else if(a is IList && b is IList)
                  {
                     result = listCompare(a as IList,b as IList,currentDepth,desiredDepth,refs);
                  }
                  else if(a is ByteArray && b is ByteArray)
                  {
                     result = byteArrayCompare(a as ByteArray,b as ByteArray);
                  }
                  else
                  {
                     if(getQualifiedClassName(a) != getQualifiedClassName(b))
                     {
                        return 1;
                     }
                     aProps = getClassInfo(a).properties;
                     isDynamicObject = true;
                     try
                     {
                        a["wootHackwoot"];
                     }
                     catch(e:Error)
                     {
                        isDynamicObject = false;
                     }
                     if(isDynamicObject)
                     {
                        bProps = getClassInfo(b).properties;
                        result = arrayCompare(aProps,bProps,currentDepth,newDepth,refs);
                        if(result != 0)
                        {
                           return result;
                        }
                     }
                     i = 0;
                     while(i < aProps.length)
                     {
                        propName = aProps[i];
                        aProp = a[propName];
                        bProp = b[propName];
                        result = internalCompare(aProp,bProp,currentDepth + 1,newDepth,refs);
                        if(result != 0)
                        {
                           return result;
                        }
                        i++;
                     }
                  }
                  break;
            }
            return result;
         }
         return stringCompare(typeOfA,typeOfB);
      }
      
      public static function hasMetadata(param1:Object, param2:String, param3:String, param4:Array = null, param5:Object = null) : Boolean
      {
         var _loc6_:Object;
         var _loc7_:Object = (_loc6_ = getClassInfo(param1,param4,param5))["metadata"];
         return internalHasMetadata(_loc7_,param2,param3);
      }
      
      private static function internalHasMetadata(param1:Object, param2:String, param3:String) : Boolean
      {
         var _loc4_:Object = null;
         if(param1 != null)
         {
            if((_loc4_ = param1[param2]) != null)
            {
               if(_loc4_[param3] != null)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public static function toString(param1:Object, param2:Array = null, param3:Array = null) : String
      {
         if(param3 == null)
         {
            param3 = defaultToStringExcludes;
         }
         refCount = 0;
         return internalToString(param1,0,null,param2,param3);
      }
      
      private static function byteArrayCompare(param1:ByteArray, param2:ByteArray) : int
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         if(param1 == param2)
         {
            return _loc3_;
         }
         if(param1.length != param2.length)
         {
            if(param1.length < param2.length)
            {
               _loc3_ = -1;
            }
            else
            {
               _loc3_ = 1;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc3_ = numericCompare(param1[_loc4_],param2[_loc4_]);
               if(_loc3_ != 0)
               {
                  _loc4_ = int(param1.length);
               }
               _loc4_++;
            }
         }
         return _loc3_;
      }
      
      public static function copy(param1:Object) : Object
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      private static function getCacheKey(param1:Object, param2:Array = null, param3:Object = null) : String
      {
         var _loc5_:Number = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc4_:String = getQualifiedClassName(param1);
         if(param2 != null)
         {
            _loc5_ = 0;
            while(_loc5_ < param2.length)
            {
               if((_loc6_ = param2[_loc5_] as String) != null)
               {
                  _loc4_ += _loc6_;
               }
               _loc5_++;
            }
         }
         if(param3 != null)
         {
            for(_loc7_ in param3)
            {
               _loc4_ += _loc7_;
               if((_loc8_ = param3[_loc7_] as String) != null)
               {
                  _loc4_ += _loc8_;
               }
            }
         }
         return _loc4_;
      }
   }
}
