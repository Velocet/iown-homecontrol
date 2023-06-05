package nz.co.codec.flexorm.criteria
{
   import mx.utils.StringUtil;
   import nz.co.codec.flexorm.metamodel.Entity;
   
   public class Junction implements IFilter
   {
      
      public static const OR:String = " or ";
      
      public static const AND:String = " and ";
       
      
      private var _entity:Entity;
      
      private var _type:String;
      
      private var _filters:Array;
      
      public function Junction(param1:Entity, param2:String = null)
      {
         super();
         this._entity = param1;
         switch(param2)
         {
            case OR:
               this._type = OR;
               break;
            default:
               this._type = AND;
         }
         this._filters = [];
      }
      
      public static function and(param1:Entity) : Junction
      {
         return new Junction(param1,AND);
      }
      
      public static function or(param1:Entity) : Junction
      {
         return new Junction(param1,OR);
      }
      
      public function addLikeCondition(param1:String, param2:String) : Junction
      {
         var _loc3_:Object = this._entity.getColumn(param1);
         if(_loc3_)
         {
            this._filters.push(new LikeCondition(_loc3_.table,_loc3_.column,param2));
         }
         return this;
      }
      
      public function getString(param1:Function) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = "";
         var _loc3_:int = int(this._filters.length);
         if(_loc3_ > 0)
         {
            _loc2_ += "(";
            _loc4_ = _loc3_ - 1;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ += StringUtil.substitute("t{0}.{1}",param1.call(this,Condition(this._filters[_loc5_]).table),this._filters[_loc5_]);
               if(_loc5_ < _loc4_)
               {
                  _loc2_ += this._type;
               }
               _loc5_++;
            }
            _loc2_ += ")";
         }
         return _loc2_;
      }
      
      public function addNotNullCondition(param1:String) : Junction
      {
         var _loc2_:Object = this._entity.getColumn(param1);
         if(_loc2_)
         {
            this._filters.push(new NotNullCondition(_loc2_.table,_loc2_.column));
         }
         return this;
      }
      
      public function addJunction(param1:Junction) : Junction
      {
         this._filters.push(param1);
         return this;
      }
      
      public function addNullCondition(param1:String) : Junction
      {
         var _loc2_:Object = this._entity.getColumn(param1);
         if(_loc2_)
         {
            this._filters.push(new NullCondition(_loc2_.table,_loc2_.column));
         }
         return this;
      }
      
      public function get filters() : Array
      {
         return this._filters;
      }
   }
}
