package mx.utils
{
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import flash.xml.XMLNode;
   import mx.core.mx_internal;
   
   public class RPCObjectUtil
   {
      
      private static var defaultToStringExcludes:Array = ["password","credentials"];
      
      private static var CLASS_INFO_CACHE:Object = {};
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var refCount:int = 0;
       
      
      public function RPCObjectUtil()
      {
         super();
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
                           existingArray = [];
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
      
      public static function toString(param1:Object, param2:Array = null, param3:Array = null) : String
      {
         if(param3 == null)
         {
            param3 = defaultToStringExcludes;
         }
         refCount = 0;
         return internalToString(param1,0,null,param2,param3);
      }
      
      private static function internalToString(param1:Object, param2:int = 0, param3:Dictionary = null, param4:Array = null, param5:Array = null) : String
      {
         var str:String = null;
         var classInfo:Object = null;
         var properties:Array = null;
         var id:Object = null;
         var isArray:Boolean = false;
         var prop:* = undefined;
         var j:int = 0;
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
               id = refs[value];
               if(id != null)
               {
                  str += "#" + int(id);
                  return str;
               }
               if(value != null)
               {
                  str += "#" + refCount.toString();
                  refs[value] = refCount;
                  ++refCount;
               }
               isArray = value is Array;
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
                  str += prop.toString();
                  if(isArray)
                  {
                     str += "] ";
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
               return value.toString();
            default:
               return "(" + type + ")";
         }
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
      
      public static function getClassInfo(param1:Object, param2:Array = null, param3:Object = null) : Object
      {
         var propertyNames:Array;
         var isArray:Boolean;
         var excludeObject:Object;
         var dynamic:Boolean;
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
         var p:String = null;
         var pi:Number = NaN;
         var uris:Array = null;
         var uri:String = null;
         var qName:QName = null;
         var j:int = 0;
         var obj:Object = param1;
         var excludes:Array = param2;
         var options:Object = param3;
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
            classInfo = describeType(obj);
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
         if(dynamic)
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
         if(!(className == "Object" || isArray))
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
         if(!dynamic)
         {
            cacheKey = getCacheKey(obj,excludes,options);
            CLASS_INFO_CACHE[cacheKey] = result;
         }
         return result;
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
   }
}
