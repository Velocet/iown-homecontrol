package mx.skins
{
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import mx.core.FlexShape;
   import mx.core.IFlexDisplayObject;
   import mx.core.IInvalidating;
   import mx.core.IProgrammaticSkin;
   import mx.core.UIComponentGlobals;
   import mx.core.mx_internal;
   import mx.managers.ILayoutManagerClient;
   import mx.styles.ISimpleStyleClient;
   import mx.styles.IStyleClient;
   import mx.utils.GraphicsUtil;
   
   public class ProgrammaticSkin extends FlexShape implements IFlexDisplayObject, IInvalidating, ILayoutManagerClient, ISimpleStyleClient, IProgrammaticSkin
   {
      
      mx_internal static const VERSION:String = "3.5.0.12683";
      
      private static var tempMatrix:Matrix = new Matrix();
       
      
      private var _initialized:Boolean = false;
      
      private var _height:Number;
      
      private var invalidateDisplayListFlag:Boolean = false;
      
      private var _styleName:IStyleClient;
      
      private var _nestLevel:int = 0;
      
      private var _processedDescriptors:Boolean = false;
      
      private var _updateCompletePendingFlag:Boolean = true;
      
      private var _width:Number;
      
      public function ProgrammaticSkin()
      {
         super();
         _width = measuredWidth;
         _height = measuredHeight;
      }
      
      public function getStyle(param1:String) : *
      {
         return !!_styleName ? _styleName.getStyle(param1) : null;
      }
      
      protected function updateDisplayList(param1:Number, param2:Number) : void
      {
      }
      
      public function get nestLevel() : int
      {
         return _nestLevel;
      }
      
      public function set nestLevel(param1:int) : void
      {
         _nestLevel = param1;
         invalidateDisplayList();
      }
      
      override public function get height() : Number
      {
         return _height;
      }
      
      public function get updateCompletePendingFlag() : Boolean
      {
         return _updateCompletePendingFlag;
      }
      
      protected function verticalGradientMatrix(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         return rotatedGradientMatrix(param1,param2,param3,param4,90);
      }
      
      public function validateSize(param1:Boolean = false) : void
      {
      }
      
      public function invalidateDisplayList() : void
      {
         if(!invalidateDisplayListFlag && nestLevel > 0)
         {
            invalidateDisplayListFlag = true;
            UIComponentGlobals.mx_internal::layoutManager.invalidateDisplayList(this);
         }
      }
      
      public function set updateCompletePendingFlag(param1:Boolean) : void
      {
         _updateCompletePendingFlag = param1;
      }
      
      protected function horizontalGradientMatrix(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         return rotatedGradientMatrix(param1,param2,param3,param4,0);
      }
      
      override public function set height(param1:Number) : void
      {
         _height = param1;
         invalidateDisplayList();
      }
      
      public function set processedDescriptors(param1:Boolean) : void
      {
         _processedDescriptors = param1;
      }
      
      public function validateDisplayList() : void
      {
         invalidateDisplayListFlag = false;
         updateDisplayList(width,height);
      }
      
      public function get measuredWidth() : Number
      {
         return 0;
      }
      
      override public function set width(param1:Number) : void
      {
         _width = param1;
         invalidateDisplayList();
      }
      
      public function get measuredHeight() : Number
      {
         return 0;
      }
      
      public function set initialized(param1:Boolean) : void
      {
         _initialized = param1;
      }
      
      protected function drawRoundRect(param1:Number, param2:Number, param3:Number, param4:Number, param5:Object = null, param6:Object = null, param7:Object = null, param8:Matrix = null, param9:String = "linear", param10:Array = null, param11:Object = null) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Array = null;
         var _loc15_:Object = null;
         var _loc12_:Graphics = graphics;
         if(param3 == 0 || param4 == 0)
         {
            return;
         }
         if(param6 !== null)
         {
            if(param6 is uint)
            {
               _loc12_.beginFill(uint(param6),Number(param7));
            }
            else if(param6 is Array)
            {
               _loc14_ = param7 is Array ? param7 as Array : [param7,param7];
               if(!param10)
               {
                  param10 = [0,255];
               }
               _loc12_.beginGradientFill(param9,param6 as Array,_loc14_,param10,param8);
            }
         }
         if(!param5)
         {
            _loc12_.drawRect(param1,param2,param3,param4);
         }
         else if(param5 is Number)
         {
            _loc13_ = Number(param5) * 2;
            _loc12_.drawRoundRect(param1,param2,param3,param4,_loc13_,_loc13_);
         }
         else
         {
            GraphicsUtil.drawRoundRectComplex(_loc12_,param1,param2,param3,param4,param5.tl,param5.tr,param5.bl,param5.br);
         }
         if(param11)
         {
            if((_loc15_ = param11.r) is Number)
            {
               _loc13_ = Number(_loc15_) * 2;
               _loc12_.drawRoundRect(param11.x,param11.y,param11.w,param11.h,_loc13_,_loc13_);
            }
            else
            {
               GraphicsUtil.drawRoundRectComplex(_loc12_,param11.x,param11.y,param11.w,param11.h,_loc15_.tl,_loc15_.tr,_loc15_.bl,_loc15_.br);
            }
         }
         if(param6 !== null)
         {
            _loc12_.endFill();
         }
      }
      
      public function get processedDescriptors() : Boolean
      {
         return _processedDescriptors;
      }
      
      public function set styleName(param1:Object) : void
      {
         if(_styleName != param1)
         {
            _styleName = param1 as IStyleClient;
            invalidateDisplayList();
         }
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         if(_width != param1)
         {
            _width = param1;
            _loc3_ = true;
         }
         if(_height != param2)
         {
            _height = param2;
            _loc3_ = true;
         }
         if(_loc3_)
         {
            invalidateDisplayList();
         }
      }
      
      public function styleChanged(param1:String) : void
      {
         invalidateDisplayList();
      }
      
      override public function get width() : Number
      {
         return _width;
      }
      
      public function invalidateProperties() : void
      {
      }
      
      public function get initialized() : Boolean
      {
         return _initialized;
      }
      
      protected function rotatedGradientMatrix(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Matrix
      {
         tempMatrix.createGradientBox(param3,param4,param5 * 0 / 180,param1,param2);
         return tempMatrix;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function get styleName() : Object
      {
         return _styleName;
      }
      
      public function validateNow() : void
      {
         if(invalidateDisplayListFlag)
         {
            validateDisplayList();
         }
      }
      
      public function invalidateSize() : void
      {
      }
      
      public function validateProperties() : void
      {
      }
   }
}
