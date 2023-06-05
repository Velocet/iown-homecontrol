package air.update.descriptors
{
   import flash.display.NativeWindowSystemChrome;
   import flash.geom.Point;
   
   public class ApplicationDescriptor
   {
      
      public static const ICON_IMAGES:Object = {
         "image16x16":16,
         "image32x32":32,
         "image48x48":48,
         "image128x128":128
      };
       
      
      private var m_defaultNs:Namespace;
      
      private var m_xml:XML;
      
      private var m_name:String;
      
      private var m_description:String;
      
      public function ApplicationDescriptor(param1:XML)
      {
         super();
         this.m_xml = param1;
         this.m_defaultNs = this.m_xml.namespace();
      }
      
      private static function validateDimension(param1:String) : Boolean
      {
         var result:Boolean;
         var dimensionNumber:Number = NaN;
         var dimensionString:String = param1;
         default xml namespace = result;
         result = false;
         if(dimensionString.length > 0)
         {
            try
            {
               dimensionNumber = Number(dimensionString);
               if(dimensionNumber >= 0)
               {
                  result = true;
               }
            }
            catch(theException:*)
            {
               result = false;
            }
         }
         else
         {
            result = true;
         }
         return result;
      }
      
      private static function convertDimension(param1:String) : Number
      {
         var _loc3_:* = 0;
         default xml namespace = _loc2_;
         var _loc2_:Number = -1;
         if(param1.length > 0)
         {
            _loc3_ = uint(param1);
            _loc2_ = Number(_loc3_);
         }
         return _loc2_;
      }
      
      private static function convertLocation(param1:String) : Number
      {
         var _loc3_:int = 0;
         default xml namespace = _loc2_;
         var _loc2_:Number = -1;
         if(param1.length > 0)
         {
            _loc3_ = int(param1);
            _loc2_ = Number(_loc3_);
         }
         return _loc2_;
      }
      
      private static function validateLocalizedText(param1:XMLList, param2:Namespace) : Boolean
      {
         var _loc5_:* = null;
         default xml namespace = param2;
         var _loc3_:Namespace = new Namespace("http://www.w3.org/XML/1998/namespace");
         if(param1.hasSimpleContent())
         {
            return true;
         }
         if(param1.length() > 1)
         {
            return false;
         }
         var _loc4_:XMLList = param1.*;
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.name() == null || _loc5_.name().localName != "text")
            {
               return false;
            }
            if(_loc5_._loc3_::@lang.length() == 0)
            {
               return false;
            }
            if(!_loc5_.hasSimpleContent())
            {
               return false;
            }
         }
         return true;
      }
      
      private static function validateDimensionPair(param1:String) : Boolean
      {
         var _loc3_:Point = null;
         default xml namespace = _loc2_;
         var _loc2_:Boolean = false;
         if(param1.length > 0)
         {
            _loc3_ = convertDimensionPoint(param1);
            if(_loc3_ != null && _loc3_.x != -1 && _loc3_.y != -1)
            {
               _loc2_ = true;
            }
         }
         else
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      private static function validateLocation(param1:String) : Boolean
      {
         var result:Boolean;
         var dimensionNumber:Number = NaN;
         var inputString:String = param1;
         default xml namespace = result;
         result = false;
         if(inputString.length > 0)
         {
            try
            {
               dimensionNumber = Number(inputString);
               if(!isNaN(dimensionNumber))
               {
                  result = true;
               }
            }
            catch(theException:*)
            {
               result = false;
            }
         }
         else
         {
            result = true;
         }
         return result;
      }
      
      private static function convertDimensionPoint(param1:String) : Point
      {
         var result:Point;
         var list:Array = null;
         var x:Number = NaN;
         var y:Number = NaN;
         var pt:Point = null;
         var dimensionString:String = param1;
         default xml namespace = result;
         result = null;
         if(dimensionString.length > 0)
         {
            try
            {
               list = dimensionString.split(/ +/);
               if(list.length == 2)
               {
                  x = convertDimension(String(list[0]));
                  y = convertDimension(String(list[1]));
                  pt = new Point();
                  pt.x = x;
                  pt.y = y;
                  result = pt;
               }
            }
            catch(e:Error)
            {
               result = null;
            }
         }
         return result;
      }
      
      public function get initialWindowX() : Number
      {
         default xml namespace = this.m_defaultNs;
         return convertLocation(this.m_xml.initialWindow.x.toString());
      }
      
      public function get initialWindowContent() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.initialWindow.content;
      }
      
      public function get filename() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.filename.toString();
      }
      
      public function get minimumPatchLevel() : int
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.@minimumPatchLevel;
      }
      
      public function get name() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_name == "" ? this.filename : this.m_name;
      }
      
      private function stringToBoolean_defaultTrue(param1:String) : Boolean
      {
         default xml namespace = this.m_defaultNs;
         switch(param1)
         {
            case "":
            case "true":
            case "1":
               return true;
            case "false":
            case "0":
               return false;
            default:
               return true;
         }
      }
      
      public function get initialWindowMinimizable() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultTrue(this.m_xml.initialWindow.minimizable.toString());
      }
      
      public function get copyright() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.copyright.toString();
      }
      
      public function get initialWindowMaxSize() : Point
      {
         default xml namespace = this.m_defaultNs;
         return convertDimensionPoint(this.m_xml.initialWindow.maxSize.toString());
      }
      
      public function get initialWindowWidth() : Number
      {
         default xml namespace = this.m_defaultNs;
         return convertDimension(this.m_xml.initialWindow.width.toString());
      }
      
      public function get initialWindowY() : Number
      {
         default xml namespace = this.m_defaultNs;
         return convertLocation(this.m_xml.initialWindow.y.toString());
      }
      
      public function validate() : void
      {
         default xml namespace = this.m_defaultNs;
         if(this.filename == "")
         {
            throw new Error("application filename must have a non-empty value.");
         }
         if(!/^([^\*\"\/:<>\?\\\|\. ]|[^\*\"\/:<>\?\\\| ][^\*\"\/:<>\?\\\|]*[^\*\"\/:<>\?\\\|\. ])$/.test(this.filename))
         {
            throw new Error("invalid application filename");
         }
         if(this.m_xml.initialWindow.content.toString() == "")
         {
            throw new Error("initialWindow/content must have a non-empty value.");
         }
         if(this.installFolder != "" && !/^([^\*\"\/:<>\?\\\|\. ]|[^\*\"\/:<>\?\\\| ][^\*\":<>\?\\\|]*[^\*\":<>\?\\\|\. ])$/.test(this.installFolder))
         {
            throw new Error("invalid install folder");
         }
         if(this.programMenuFolder != "" && !/^([^\*\"\/:<>\?\\\|\. ]|[^\*\"\/:<>\?\\\| ][^\*\":<>\?\\\|]*[^\*\":<>\?\\\|\. ])$/.test(this.programMenuFolder))
         {
            throw new Error("invalid program menu folder");
         }
         if(["",NativeWindowSystemChrome.NONE,NativeWindowSystemChrome.STANDARD].indexOf(this.m_xml.initialWindow.systemChrome.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.systemChrome.toString() + "\" for application/initialWindow/systemChrome.");
         }
         if(["","true","false","1","0"].indexOf(this.m_xml.initialWindow.transparent.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.transparent.toString() + "\" for application/initialWindow/transparent.");
         }
         if(["","true","false","1","0"].indexOf(this.m_xml.initialWindow.visible.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.visible.toString() + "\" for application/initialWindow/visible.");
         }
         if(["","true","false","1","0"].indexOf(this.m_xml.initialWindow.minimizable.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.minimizable.toString() + "\" for application/initialWindow/minimizable.");
         }
         if(["","true","false","1","0"].indexOf(this.m_xml.initialWindow.maximizable.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.maximizable.toString() + "\" for application/initialWindow/maximizable.");
         }
         if(["","true","false","1","0"].indexOf(this.m_xml.initialWindow.resizable.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.resizable.toString() + "\" for application/initialWindow/resizeable.");
         }
         if(["","true","false","1","0"].indexOf(this.m_xml.initialWindow.closeable.toString()) == -1)
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.closeable.toString() + "\" for application/initialWindow/closeable.");
         }
         if(this.initialWindowTransparent && this.initialWindowSystemChrome != NativeWindowSystemChrome.NONE)
         {
            throw new Error("Illegal window settings.  Transparent windows are only supported when systemChrome is set to \"none\".");
         }
         if(!validateDimension(this.m_xml.initialWindow.width.toString()))
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.width.toString() + "\" for application/initialWindow/width.");
         }
         if(!validateDimension(this.m_xml.initialWindow.height.toString()))
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.height.toString() + "\" for application/initialWindow/height.");
         }
         if(!validateLocation(this.m_xml.initialWindow.x.toString()))
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.x.toString() + "\" for application/initialWindow/x.");
         }
         if(!validateLocation(this.m_xml.initialWindow.y.toString()))
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.y.toString() + "\" for application/initialWindow/y.");
         }
         if(!validateDimensionPair(this.m_xml.initialWindow.minSize.toString()))
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.minSize.toString() + "\" for application/initialWindow/minSize.");
         }
         if(!validateDimensionPair(this.m_xml.initialWindow.maxSize.toString()))
         {
            throw new Error("Illegal value \"" + this.m_xml.initialWindow.maxSize.toString() + "\" for application/initialWindow/maxSize.");
         }
         if(!validateLocalizedText(this.m_xml.name,this.m_defaultNs))
         {
            throw new Error("Illegal values for application/name.");
         }
         if(!validateLocalizedText(this.m_xml.description,this.m_defaultNs))
         {
            throw new Error("Illegal values for application/description.");
         }
         if(!/^[A-Za-z0-9\-\.]{1,212}$/.test(this.id))
         {
            throw new Error("invalid application identifier");
         }
      }
      
      public function get version() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.version.toString();
      }
      
      public function get namespace() : Namespace
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.namespace();
      }
      
      public function get fileTypes() : XMLList
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.fileTypes.elements();
      }
      
      public function get initialWindowCloseable() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultTrue(this.m_xml.initialWindow.closeable.toString());
      }
      
      public function get initialWindowMaximizable() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultTrue(this.m_xml.initialWindow.maximizable.toString());
      }
      
      public function get programMenuFolder() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.programMenuFolder.toString();
      }
      
      public function get initialWindowHeight() : Number
      {
         default xml namespace = this.m_defaultNs;
         return convertDimension(this.m_xml.initialWindow.height.toString());
      }
      
      public function get initialWindowTitle() : String
      {
         default xml namespace = this.m_defaultNs;
         var _loc1_:String = String(this.m_xml.initialWindow.title.toString());
         if(_loc1_ == "")
         {
            _loc1_ = this.name;
         }
         return _loc1_;
      }
      
      private function stringToBoolean_defaultFalse(param1:String) : Boolean
      {
         default xml namespace = this.m_defaultNs;
         switch(param1)
         {
            case "true":
            case "1":
               return true;
            case "":
            case "false":
            case "0":
               return false;
            default:
               return false;
         }
      }
      
      public function hasCustomUpdateUI() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultFalse(this.m_xml.customUpdateUI.toString());
      }
      
      public function get installFolder() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.installFolder.toString();
      }
      
      public function get id() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.id.toString();
      }
      
      public function get initialWindowTransparent() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultFalse(this.m_xml.initialWindow.transparent.toString());
      }
      
      public function getIcon(param1:String) : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_xml.icon.elements(new QName(this.m_defaultNs,param1)).toString();
      }
      
      public function get initialWindowResizable() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultTrue(this.m_xml.initialWindow.resizable.toString());
      }
      
      public function get description() : String
      {
         default xml namespace = this.m_defaultNs;
         return this.m_description;
      }
      
      public function get initialWindowSystemChrome() : String
      {
         default xml namespace = this.m_defaultNs;
         var _loc1_:String = String(this.m_xml.initialWindow.systemChrome.toString());
         var _loc2_:String = "null";
         switch(_loc1_)
         {
            case NativeWindowSystemChrome.STANDARD:
            case NativeWindowSystemChrome.NONE:
               _loc2_ = _loc1_;
         }
         return _loc2_;
      }
      
      public function get initialWindowVisible() : Boolean
      {
         default xml namespace = this.m_defaultNs;
         return this.stringToBoolean_defaultFalse(this.m_xml.initialWindow.visible.toString());
      }
      
      public function get initialWindowMinSize() : Point
      {
         default xml namespace = this.m_defaultNs;
         return convertDimensionPoint(this.m_xml.initialWindow.minSize.toString());
      }
   }
}
